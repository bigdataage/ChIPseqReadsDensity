
AllResults_g <- "AllResults_H3K27me3"
system( paste("mkdir ",  AllResults_g) )


#################################################################### Start ##########################################################################################################################################
#################################################################### Start ##########################################################################################################################################
#################################################################### Start ##########################################################################################################################################
#################################################################### Start ##########################################################################################################################################
#################################################################### Start ##########################################################################################################################################
library("reshape2")
library("ggplot2") 
library("grid")
library("Cairo")
library("RColorBrewer")
library("gplots")  
library("stats")
library("KernSmooth")
library("psych")
library("minerva")




pTheme_1 <- function( textSize=12 ) {  
    theme(  
        line  = element_line(colour="black", size=1.0,   linetype=1,      lineend=NULL),                                                          ## all line elements.  局部优先总体,下面3个也是,只对非局部设置有效.   所有线属性.
        rect  = element_rect(colour="black", size=1.0,   linetype=1,      fill="transparent" ),                                                   ## all rectangluar elements.    hjust=1: 靠右对齐.   所有矩形区域属性.
        text  = element_text(family="sans",  face=NULL,  colour="black",  size=textSize, hjust=NULL, vjust=NULL, angle=NULL, lineheight=NULL),    ## all text elements.  "sans" for a sans-sans font. 所有文本相关属性.
        title = element_text(family="sans",  face=NULL,  colour="black",  size=textSize, hjust=NULL, vjust=15,   angle=NULL, lineheight=NULL),    ## all title elements: plot, axes, legends. hjust:水平对齐的方向.  所有标题属性.

        axis.title        = element_text(family="sans", face=NULL, colour="black", size=textSize,    hjust=NULL, vjust=NULL, angle=NULL, lineheight=NULL),      ## label of axes (element_text; inherits from text).  horizontal: 水平的, 水平线 
        axis.title.x      = element_text(family="sans", face=NULL, colour="black", size=textSize,    hjust=NULL, vjust=-15,  angle=NULL, lineheight=NULL),      ## x axis label (element_text; inherits from axis.title)
        axis.title.y      = element_text(family="sans", face=NULL, colour="black", size=textSize,    hjust=NULL, vjust=15,   angle=NULL, lineheight=NULL),      ## y axis label (element_text; inherits from axis.title)
        axis.text         = element_text(family="sans", face=NULL, colour="black", size=textSize-2,  hjust=NULL, vjust=NULL, angle=NULL, lineheight=NULL),      ## tick labels along axes (element_text; inherits from text). 坐标轴刻度的标签的属性.                                                         
        axis.text.x       = element_text(family="sans", face=NULL, colour="black", size=textSize-2,  hjust=NULL, vjust=NULL, angle=NULL, lineheight=NULL),      ## x axis tick labels (element_text; inherits from axis.text)
        axis.text.y       = element_text(family="sans", face=NULL, colour="black", size=textSize-2,  hjust=NULL, vjust=NULL, angle=NULL, lineheight=NULL),      ## y axis tick labels (element_text; inherits from axis.text)
        axis.ticks        = element_line(colour="black", size=0.3, linetype=1, lineend=NULL),                                                                   ## tick marks along axes (element_line; inherits from line). 坐标轴刻度线.
        axis.ticks.x      = element_line(colour="black", size=0.3, linetype=1, lineend=NULL),                                                                   ## x axis tick marks (element_line; inherits from axis.ticks)
        axis.ticks.y      = element_line(colour="black", size=0.3, linetype=1, lineend=NULL),                                                                   ## y axis tick marks (element_line; inherits from axis.ticks)
        axis.ticks.length = grid::unit(1.5, "mm", data=NULL),                                                                                                   ## length of tick marks (unit), ‘"mm"’ Millimetres.  10 mm = 1 cm.  刻度线长度
        axis.ticks.margin = grid::unit(1.0, "mm", data=NULL),  	                                                                                                ## space between tick mark and tick label (unit),  ‘"mm"’ Millimetres.  10 mm = 1 cm. 刻度线和刻度标签之间的间距.                                                                           
        axis.line         = element_line(colour="transparent", size=0.3, linetype=1, lineend=NULL), 	                                                        ## lines along axes (element_line; inherits from line). 坐标轴线
        axis.line.x       = element_line(colour="transparent", size=0.3, linetype=1, lineend=NULL), 	                                                        ## line along x axis (element_line; inherits from axis.line)
        axis.line.y       = element_line(colour="transparent", size=0.3, linetype=1, lineend=NULL),	                                                        ## line along y axis (element_line; inherits from axis.line)
  
        legend.background    = element_rect(colour="transparent", size=1, linetype=1, fill="transparent" ), 	      ## background of legend (element_rect; inherits from rect)
        legend.margin        = grid::unit(0.5, "mm", data=NULL), 	                                              ## extra space added around legend (unit). linetype=1指的是矩形边框的类型.
        legend.key           = element_rect(colour="transparent", size=2, linetype=1, fill="transparent" ), 	      ## background underneath legend keys. 图例符号. size=1指的是矩形边框的大小.
        legend.key.size      = grid::unit(5, "mm", data=NULL) , 	                                              ## size of legend keys (unit; inherits from legend.key.size)
        legend.key.height    = grid::unit(7, "mm", data=NULL) , 	                                              ## key background height (unit; inherits from legend.key.size)
        legend.key.width     = grid::unit(5, "mm", data=NULL) ,                                                       ## key background width (unit; inherits from legend.key.size)
        legend.text          = element_text(family="sans", face=NULL, colour="black", size=textSize, hjust=NULL, vjust=NULL, angle=NULL, lineheight=NULL), 	##legend item labels. 图例文字标签.
        legend.text.align    = 0, 	                ## alignment of legend labels (number from 0 (left) to 1 (right))
        legend.title         = element_blank(),   	## title of legend (element_text; inherits from title)
        legend.title.align   = 0, 	                ## alignment of legend title (number from 0 (left) to 1 (right))
        legend.position      = "right", 	        ## the position of legends. ("left", "right", "bottom", "top", or two-element numeric vector)
        legend.direction     = "vertical",        	## layout of items in legends  ("horizontal" or "vertical")   图例排列方向
        legend.justification = "center",      	        ## anchor point for positioning legend inside plot ("center" or two-element numeric vector)  图例居中方式
        legend.box           = NULL, 	                ## arrangement of multiple legends ("horizontal" or "vertical")  多图例的排列方式
        legend.box.just      = NULL, 	                ## justification of each legend within the overall bounding box, when there are multiple legends ("top", "bottom", "left", or "right")  多图例的居中方式
  
        panel.background   = element_rect(colour="transparent", size=0.0, linetype=1, fill="transparent" ),   	## background of plotting area, drawn underneath plot (element_rect; inherits from rect)
        panel.border       = element_rect(colour="black", size=0.3, linetype=1, fill=NA ), 	                ## border around plotting area, drawn on top of plot so that it covers tick marks and grid lines. This should be used with fill=NA (element_rect; inherits from rect)
        panel.margin       = grid::unit(2, "mm", data=NULL) , 	                                                ## margin around facet panels (unit)  分面绘图区之间的边距
        panel.grid         = element_blank(), 	                                                                ## grid lines (element_line; inherits from line)  绘图区网格线
        panel.grid.major   = element_line(colour="transparent", size=NULL, linetype=NULL, lineend=NULL) , 	## major grid lines (element_line; inherits from panel.grid)  主网格线
        panel.grid.minor   = element_line(colour="transparent", size=NULL, linetype=NULL, lineend=NULL) ,     	## minor grid lines (element_line; inherits from panel.grid)  次网格线
        panel.grid.major.x = element_line(colour="transparent", size=NULL, linetype=NULL, lineend=NULL) , 	## vertical major grid lines (element_line; inherits from panel.grid.major)
        panel.grid.major.y = element_line(colour="transparent", size=NULL, linetype=NULL, lineend=NULL) ,     	## horizontal major grid lines (element_line; inherits from panel.grid.major)
        panel.grid.minor.x = element_line(colour="transparent", size=NULL, linetype=NULL, lineend=NULL) ,     	## vertical minor grid lines (element_line; inherits from panel.grid.minor)
        panel.grid.minor.y = element_line(colour="transparent", size=NULL, linetype=NULL, lineend=NULL) ,     	## horizontal minor grid lines (element_line; inherits from panel.grid.minor)
  
        plot.background	= element_rect(colour="transparent", size=NULL, linetype=NULL, fill="transparent" ),                                              ## background of the entire plot (element_rect; inherits from rect)  整个图形的背景
        plot.title      = element_text(family="sans", face=NULL, colour="black", size=textSize, hjust=NULL, vjust=NULL, angle=NULL, lineheight=NULL), 	  ## plot title (text appearance) (element_text; inherits from title)  图形标题
        plot.margin     = grid::unit(c(8, 8, 8, 8), "mm", data=NULL), 	                                                                                  ## margin around entire plot (unit with the sizes of the top, right, bottom, and left margins)
  
        strip.background = element_rect(colour=NULL, size=NULL, linetype=NULL, fill=NULL ), 	                                                        ## background of facet labels (element_rect; inherits from rect)  分面标签背景
        strip.text       = element_text(family="sans", face=NULL, colour=NULL, size=NULL, hjust=NULL, vjust=NULL, angle=NULL, lineheight=NULL), 	## facet labels (element_text; inherits from text)
        strip.text.x     = element_text(family="sans", face=NULL, colour=NULL, size=NULL, hjust=NULL, vjust=NULL, angle=NULL, lineheight=NULL), 	## facet labels along horizontal direction (element_text; inherits from strip.text)
        strip.text.y     = element_text(family="sans", face=NULL, colour=NULL, size=NULL, hjust=NULL, vjust=NULL, angle=NULL, lineheight=NULL)   	## facet labels along vertical direction (element_text; inherits from strip.text) 
    ) 
} 






## matrix as input:






Four_NOL <- function(AAVEED,   AAVGFP,    ctrl,    KO,   File_Local, Title_Local, Ymin_Local=0, Ymax_Local=12) {  
  BinNum_Local = 500
  Position_Local      <-  seq(from = -5,  by=0.02,  length.out=BinNum_Local)

  AAVEED_2_Frame <-  ksmooth(x=Position_Local,   y=colMeans(AAVEED),     kernel = "normal",   bandwidth = 0.5)
  AAVGFP_1_Frame <-  ksmooth(x=Position_Local,   y=colMeans(AAVGFP),     kernel = "normal",   bandwidth = 0.5)
  ctrl_1_Frame   <-  ksmooth(x=Position_Local,   y=colMeans(ctrl),       kernel = "normal",   bandwidth = 0.5)
  KO_1_Frame     <-  ksmooth(x=Position_Local,   y=colMeans(KO),         kernel = "normal",   bandwidth = 0.5)
  
  AAVEED_2_Y <- AAVEED_2_Frame$y
  AAVGFP_1_Y <- AAVGFP_1_Frame$y
  ctrl_1_Y   <- ctrl_1_Frame$y
  KO_1_Y     <- KO_1_Frame$y
  
  x_Axis_Local     <- c( Position_Local,  Position_Local,     Position_Local,     Position_Local)                       
  y_Axis_Local     <- c( AAVEED_2_Y,   AAVGFP_1_Y,     ctrl_1_Y,    KO_1_Y )
  SampleType_Local <- c(  rep("AAV_EED", BinNum_Local), rep("AAV_GFP", BinNum_Local),   rep("EED_Ctrl", BinNum_Local),   rep("EED_KO", BinNum_Local) )  
  DataFrame_Local  <- data.frame(xAxis = x_Axis_Local,  yAxis = y_Axis_Local,  SampleType = SampleType_Local) 
  
  CairoSVG(file = File_Local,   width = 6,  height = 4, onefile = TRUE,  bg = "white",  pointsize = 1 )
  FigureTemp <- ggplot(DataFrame_Local, aes(x=xAxis, y=yAxis,  color=SampleType) )  +   
    xlab("Relative Distance (kb)") +  ylab("H3K27me3 Signal") +  ggtitle(Title_Local) + 
    scale_colour_manual( values=c("red",  "red4",    "green",   "green4")  ) +    
    geom_line(size=0.5) + 
    geom_vline(xintercept=0, lty=2, col="gray", size=0.5) +   
    scale_x_continuous( breaks=c(-5,  -2.5,  0,  2.5,   5  ), labels=c("-5",  "-2.5",  "TSS",  "2.5",  "5") ) +  
    pTheme_1(textSize=12) +  guides( colour = guide_legend(override.aes = list(size=3)) )  
  print( FigureTemp ) 
  dev.off() 
  
  File2_Local = paste(File_Local, ".scaled.svg", seq="")
  CairoSVG(file = File2_Local,   width = 6,  height = 4, onefile = TRUE,  bg = "white",  pointsize = 1 )
  FigureTemp <- ggplot(DataFrame_Local, aes(x=xAxis, y=yAxis,  color=SampleType) )  +   
    xlab("Relative Distance (kb)") +  ylab("H3K27me3 Signal") +  ggtitle(Title_Local) + 
    scale_colour_manual( values=c("red",  "red4",    "green",   "green4")  ) +    
    geom_line(size=0.5) + ylim(Ymin_Local, Ymax_Local) +
    geom_vline(xintercept=0, lty=2, col="gray", size=0.5) +  
    scale_x_continuous( breaks=c(-5,  -2.5,  0,  2.5,   5  ), labels=c("-5",  "-2.5",  "TSS",  "2.5",  "5") ) +  
    pTheme_1(textSize=12) +  guides( colour = guide_legend(override.aes = list(size=3)) )  
  print( FigureTemp ) 
  dev.off() 
}  



#################################################################### End ##########################################################################################################################################
#################################################################### End ##########################################################################################################################################
#################################################################### End ##########################################################################################################################################
#################################################################### End ##########################################################################################################################################
#################################################################### End ##########################################################################################################################################











#################################################################### Start ##########################################################################################################################################
#################################################################### Start ##########################################################################################################################################
AAVEED_Down    <- read.table("H3K27me3/Down/H3K27me3_AAVEED_center_heatmap/a.xls",    header=TRUE,   sep="",   quote = "",   comment.char = "")  
AAVGFP_Down    <- read.table("H3K27me3/Down/H3K27me3_AAVGFP_center_heatmap/a.xls",    header=TRUE,   sep="",   quote = "",   comment.char = "")
ctrl_Down      <- read.table("H3K27me3/Down/H3K27me3_ctrl_center_heatmap/a.xls",      header=TRUE,   sep="",   quote = "",   comment.char = "")
KO_Down        <- read.table("H3K27me3/Down/H3K27me3_KO_center_heatmap/a.xls",        header=TRUE,   sep="",   quote = "",   comment.char = "")


dim(AAVEED_Down)
dim(AAVGFP_Down) 
dim(ctrl_Down)   
dim(KO_Down)    
  
AAVEED_Down <- as.matrix(AAVEED_Down[,-(1:4)])
AAVGFP_Down <- as.matrix(AAVGFP_Down[,-(1:4)])
ctrl_Down   <- as.matrix(ctrl_Down[,-(1:4)])
KO_Down     <- as.matrix(KO_Down[,-(1:4)])

dim(AAVEED_Down)
dim(AAVGFP_Down) 
dim(ctrl_Down)   
dim(KO_Down)    

numOfColumns <- ncol(KO_Down)
numOfRows    <- nrow(KO_Down)  
numOfColumns
numOfRows



Four_NOL( AAVEED_Down,   AAVGFP_Down,   ctrl_Down,    KO_Down,   paste(AllResults_g, "/11-A-H3K27me3-Down-Average.svg", sep=""),  "KO Down (95 Genes)",   Ymin_Local=0,  Ymax_Local=7)                     


####################################################################  End    ##########################################################################################################################################
####################################################################  End    ##########################################################################################################################################
####################################################################  End    ##########################################################################################################################################
####################################################################  End    ##########################################################################################################################################
####################################################################  End    ##########################################################################################################################################


















#################################################################### Start ##########################################################################################################################################
#################################################################### Start ##########################################################################################################################################
AAVEED_Retain    <- read.table("H3K27me3/Nochange/H3K27me3_AAVEED_center_heatmap/a.xls",    header=TRUE,   sep="",   quote = "",   comment.char = "")  
AAVGFP_Retain    <- read.table("H3K27me3/Nochange/H3K27me3_AAVGFP_center_heatmap/a.xls",    header=TRUE,   sep="",   quote = "",   comment.char = "")
ctrl_Retain      <- read.table("H3K27me3/Nochange/H3K27me3_ctrl_center_heatmap/a.xls",      header=TRUE,   sep="",   quote = "",   comment.char = "")
KO_Retain        <- read.table("H3K27me3/Nochange/H3K27me3_KO_center_heatmap/a.xls",        header=TRUE,   sep="",   quote = "",   comment.char = "")


dim(AAVEED_Retain)
dim(AAVGFP_Retain) 
dim(ctrl_Retain)   
dim(KO_Retain)    

AAVEED_Retain <- as.matrix(AAVEED_Retain[,-(1:4)])
AAVGFP_Retain <- as.matrix(AAVGFP_Retain[,-(1:4)])
ctrl_Retain   <- as.matrix(ctrl_Retain[,-(1:4)])
KO_Retain     <- as.matrix(KO_Retain[,-(1:4)])

dim(AAVEED_Retain)
dim(AAVGFP_Retain) 
dim(ctrl_Retain)   
dim(KO_Retain)    

numOfColumns <- ncol(KO_Retain)
numOfRows    <- nrow(KO_Retain)  
numOfColumns
numOfRows



Four_NOL( AAVEED_Retain,   AAVGFP_Retain,   ctrl_Retain,    KO_Retain,   paste(AllResults_g, "/11-B-H3K27me3-Retain-Average.svg", sep=""),  "KO Retain (5681 Genes)",   Ymin_Local=0,  Ymax_Local=7)                     


####################################################################  End    ##########################################################################################################################################
####################################################################  End    ##########################################################################################################################################
####################################################################  End    ##########################################################################################################################################
####################################################################  End    ##########################################################################################################################################
####################################################################  End    ##########################################################################################################################################






















#################################################################### Start ##########################################################################################################################################
#################################################################### Start ##########################################################################################################################################
AAVEED_Up    <- read.table("H3K27me3/Up/H3K27me3_AAVEED_center_heatmap/a.xls",    header=TRUE,   sep="",   quote = "",   comment.char = "")  
AAVGFP_Up    <- read.table("H3K27me3/Up/H3K27me3_AAVGFP_center_heatmap/a.xls",    header=TRUE,   sep="",   quote = "",   comment.char = "")
ctrl_Up      <- read.table("H3K27me3/Up/H3K27me3_ctrl_center_heatmap/a.xls",      header=TRUE,   sep="",   quote = "",   comment.char = "")
KO_Up        <- read.table("H3K27me3/Up/H3K27me3_KO_center_heatmap/a.xls",        header=TRUE,   sep="",   quote = "",   comment.char = "")


dim(AAVEED_Up)
dim(AAVGFP_Up) 
dim(ctrl_Up)   
dim(KO_Up)    

AAVEED_Up <- as.matrix(AAVEED_Up[,-(1:4)])
AAVGFP_Up <- as.matrix(AAVGFP_Up[,-(1:4)])
ctrl_Up   <- as.matrix(ctrl_Up[,-(1:4)])
KO_Up     <- as.matrix(KO_Up[,-(1:4)])

dim(AAVEED_Up)
dim(AAVGFP_Up) 
dim(ctrl_Up)   
dim(KO_Up)    

numOfColumns <- ncol(KO_Up)
numOfRows    <- nrow(KO_Up)  
numOfColumns
numOfRows



Four_NOL( AAVEED_Up,   AAVGFP_Up,   ctrl_Up,    KO_Up,   paste(AllResults_g, "/11-C-H3K27me3-Up-Average.svg", sep=""),  "KO Up (283 Genes)",   Ymin_Local=0,  Ymax_Local=7)                     


####################################################################  End    ##########################################################################################################################################
####################################################################  End    ##########################################################################################################################################
####################################################################  End    ##########################################################################################################################################
####################################################################  End    ##########################################################################################################################################
####################################################################  End    ##########################################################################################################################################

































