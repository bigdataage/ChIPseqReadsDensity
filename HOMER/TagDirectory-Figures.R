
AllResults_g <- "TagDirectory-Figures"
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







#################################################################### End ##########################################################################################################################################
#################################################################### End ##########################################################################################################################################
#################################################################### End ##########################################################################################################################################
#################################################################### End ##########################################################################################################################################
#################################################################### End ##########################################################################################################################################




tagCountDistribution <- read.table("tagCountDistribution-2.txt",    header=FALSE,   sep="",   quote = "",   comment.char = "")  #tagCountDistribution-2.txt: remove first line of tagCountDistribution.txt.
dataframe_1  <- data.frame( xAxis = tagCountDistribution[1:11,1],   yAxis = tagCountDistribution[1:11,2]) 

CairoSVG( file = paste(AllResults_g, "/tagCountDistribution-scatterPlot.svg", sep=""),   width = 4, height = 4, onefile = TRUE, bg = "white",  pointsize = 1 )
ggplot(data=dataframe_1, aes(x=xAxis, y=yAxis) )  +  xlab("Reads per position") + ylab("Fraction of total Reads") +  ggtitle("Tag Count Distribution")  +  
      geom_line(size=0.5) +  #geom_histogram( )  + 
      geom_point(colour="red") +
      scale_x_continuous( breaks=c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10), labels=c("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10") ) +
      scale_y_continuous( breaks=c(0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1) ) +
      pTheme_1( textSize=12 ) 
dev.off() 



CairoSVG( file = paste(AllResults_g, "/tagCountDistribution-histogram.svg", sep=""),   width = 4, height = 4, onefile = TRUE, bg = "white",  pointsize = 1 )
ggplot(data=dataframe_1, aes(x=xAxis) )  +  xlab("Reads per position") + ylab("Fraction of total Reads") +  ggtitle("Tag Count Distribution")  +  
  geom_histogram( aes(y=yAxis), stat="identity",  fill = "skyblue" )  + 
  scale_x_continuous( breaks=c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10), labels=c("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10") ) +
  scale_y_continuous( breaks=c(0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1) ) +
  pTheme_1( textSize=12 ) 
dev.off() 

###############################################################################################################################################################








tagAutocorrelation <- read.table("tagAutocorrelation-2.txt",    header=FALSE,   sep="",   quote = "",   comment.char = "")  #tagAutocorrelation-2.txt: remove first line of tagAutocorrelation.txt.
dim(tagAutocorrelation)  
Position_Local <- tagAutocorrelation[,1]
BinNum_Local <- nrow(tagAutocorrelation)   
x_Axis_Local     <- c( Position_Local,    Position_Local)                       
y_Axis_Local     <- c( tagAutocorrelation[,2],   tagAutocorrelation[,3] )
SampleType_Local <- c(  rep("Same Strand", BinNum_Local),   rep("Opposite Strand", BinNum_Local) )  
DataFrame_Local  <- data.frame(xAxis = x_Axis_Local,  yAxis = y_Axis_Local,  SampleType = SampleType_Local) 

CairoSVG(file = paste(AllResults_g, "/tagAutocorrelation.svg", sep=""),   width = 8,  height = 4, onefile = TRUE,  bg = "white",  pointsize = 1 )
ggplot(DataFrame_Local, aes(x=xAxis, y=yAxis,  color=SampleType) )  +   
  xlab("Relative Distance between Reads (bp)") +  ylab("Total Read Pairs") +  ggtitle("Tag Autocorrelation") + 
  scale_colour_manual( values=c("red",   "green")  ) +    
  geom_line(size=0.5) + 
  #geom_vline(xintercept=0, lty=2, col="gray", size=0.5) +   
  pTheme_1(textSize=12) +  guides( colour = guide_legend(override.aes = list(size=3)) )  
dev.off() 







DataFrame_Local2  <- data.frame(xAxis = x_Axis_Local,  yAxis = y_Axis_Local,  SampleType = SampleType_Local) 
DataFrame_Local2$yAxis[2001]  <- NA
CairoSVG(file = paste(AllResults_g, "/tagAutocorrelation-2.svg", sep=""),   width = 8,  height = 4, onefile = TRUE,  bg = "white",  pointsize = 1 )
ggplot(DataFrame_Local2, aes(x=xAxis, y=yAxis,  color=SampleType) )  +   
  xlab("Relative Distance between Reads (bp)") +  ylab("Total Read Pairs") +  ggtitle("Tag Autocorrelation") + 
  scale_colour_manual( values=c("red",   "green")  ) +    
  geom_line(size=0.5) + 
  geom_vline(xintercept=0, lty=2, col="gray", size=0.5) +   
  pTheme_1(textSize=12) +  guides( colour = guide_legend(override.aes = list(size=3)) )  
dev.off() 










