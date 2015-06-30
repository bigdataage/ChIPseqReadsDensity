############### compute peak length distribution

H3K27ac_AAVEED1   <-  read.table("H3K27ac_AAVEED",       header=FALSE,    sep="")
H3K27ac_AAVGFP1   <-  read.table("H3K27ac_AAVGFP",       header=FALSE,    sep="")
H3K27ac_ctrl1     <-  read.table("H3K27ac_ctrl",         header=FALSE,    sep="")
H3K27ac_KO1       <-  read.table("H3K27ac_KO",           header=FALSE,    sep="")
H3K27me3_AAVEED1  <-  read.table("H3K27me3_AAVEED",      header=FALSE,    sep="")
H3K27me3_AAVGFP1  <-  read.table("H3K27me3_AAVGFP",      header=FALSE,    sep="")
H3K27me3_ctrl1    <-  read.table("H3K27me3_ctrl",        header=FALSE,    sep="")
H3K27me3_KO1      <-  read.table("H3K27me3_KO",          header=FALSE,    sep="")


H3K27ac_AAVEED1  
H3K27ac_AAVGFP1   
H3K27ac_ctrl1     
H3K27ac_KO1      
H3K27me3_AAVEED1  
H3K27me3_AAVGFP1  
H3K27me3_ctrl1   
H3K27me3_KO1     


dim(H3K27ac_AAVEED1)  
dim(H3K27ac_AAVGFP1)    
dim(H3K27ac_ctrl1)      
dim(H3K27ac_KO1)       
dim(H3K27me3_AAVEED1)   
dim(H3K27me3_AAVGFP1)   
dim(H3K27me3_ctrl1)    
dim(H3K27me3_KO1)      


H3K27ac_AAVEED2     <- H3K27ac_AAVEED1[ ,4] - H3K27ac_AAVEED1[ ,3] + 1
H3K27ac_AAVGFP2     <- H3K27ac_AAVGFP1[ ,4] - H3K27ac_AAVGFP1[ ,3] + 1   
H3K27ac_ctrl2       <- H3K27ac_ctrl1[ ,4] - H3K27ac_ctrl1[ ,3] + 1    
H3K27ac_KO2         <- H3K27ac_KO1[ ,4] - H3K27ac_KO1[ ,3] + 1    
H3K27me3_AAVEED2    <- H3K27me3_AAVEED1[ ,4] - H3K27me3_AAVEED1[ ,3] + 1
H3K27me3_AAVGFP2    <- H3K27me3_AAVGFP1[ ,4] - H3K27me3_AAVGFP1[ ,3] + 1   
H3K27me3_ctrl2      <- H3K27me3_ctrl1[ ,4] - H3K27me3_ctrl1[ ,3] + 1    
H3K27me3_KO2        <- H3K27me3_KO1[ ,4] - H3K27me3_KO1[ ,3] + 1    

length(H3K27ac_AAVEED2)  
length(H3K27ac_AAVGFP2)   
length(H3K27ac_ctrl2)     
length(H3K27ac_KO2)      
length(H3K27me3_AAVEED2)  
length(H3K27me3_AAVGFP2)  
length(H3K27me3_ctrl2)   
length(H3K27me3_KO2)     



AllResults_g <- "H3K27_Peak_Length"
system( paste("mkdir ",  AllResults_g) )   

sink(paste(AllResults_g,  "/1-peaks-length-summary.txt",     sep = ""))
print( "H3K27ac_AAVEED:" )
print(summary(H3K27ac_AAVEED2))
print("################################################################")
print( "H3K27ac_AAVGFP:" )
print(summary(H3K27ac_AAVGFP2))
print("################################################################")
print( "H3K27ac_ctrl:" )
print(summary(H3K27ac_ctrl2))
print("################################################################")
print( "H3K27ac_KO:" )
print(summary(H3K27ac_KO2))
print("################################################################")
print( "H3K27me3_AAVEED:" )
print(summary(H3K27me3_AAVEED2))
print("################################################################")
print( "H3K27me3_AAVGFP:" )
print(summary(H3K27me3_AAVGFP2))
print("################################################################")
print( "H3K27me3_ctrl:" )
print(summary(H3K27me3_ctrl2))
print("################################################################")
print( "H3K27me3_KO:" )
print(summary(H3K27me3_KO2))
print("################################################################")
sink()



maxLen <- 20000
minLen <- 200

sink(paste(AllResults_g,  "/2-peaks-length-MaxMin.txt",     sep = ""))
print("################################################################################################################################")
print( paste("H3K27ac_AAVEED Greater than ",    maxLen, ":  ",  length(H3K27ac_AAVEED2[H3K27ac_AAVEED2>maxLen]),  sep = "") )
print( paste("H3K27ac_AAVGFP Greater than ",    maxLen, ":  ",  length(H3K27ac_AAVGFP2[H3K27ac_AAVGFP2>maxLen]),  sep = "") )
print( paste("H3K27ac_ctrl Greater than ",      maxLen, ":  ",  length(H3K27ac_ctrl2[H3K27ac_ctrl2>maxLen]),      sep = "") )
print( paste("H3K27ac_KO Greater than ",        maxLen, ":  ",  length(H3K27ac_KO2[H3K27ac_KO2>maxLen]),          sep = "") )
print( paste("H3K27me3_AAVEED Greater than ",    maxLen, ":  ",  length(H3K27me3_AAVEED2[H3K27me3_AAVEED2>maxLen]),  sep = "") )
print( paste("H3K27me3_AAVGFP Greater than ",    maxLen, ":  ",  length(H3K27me3_AAVGFP2[H3K27me3_AAVGFP2>maxLen]),  sep = "") )
print( paste("H3K27me3_ctrl Greater than ",      maxLen, ":  ",  length(H3K27me3_ctrl2[H3K27me3_ctrl2>maxLen]),      sep = "") )
print( paste("H3K27me3_KO Greater than ",        maxLen, ":  ",  length(H3K27me3_KO2[H3K27me3_KO2>maxLen]),          sep = "") )
print("################################################################################################################################")
print( paste("H3K27ac_AAVEED Less than ",    minLen, ":  ",  length(H3K27ac_AAVEED2[H3K27ac_AAVEED2<minLen]),  sep = "") )
print( paste("H3K27ac_AAVGFP Less than ",    minLen, ":  ",  length(H3K27ac_AAVGFP2[H3K27ac_AAVGFP2<minLen]),  sep = "") )
print( paste("H3K27ac_ctrl Less than ",      minLen, ":  ",  length(H3K27ac_ctrl2[H3K27ac_ctrl2<minLen]),      sep = "") )
print( paste("H3K27ac_KO Less than ",        minLen, ":  ",  length(H3K27ac_KO2[H3K27ac_KO2<minLen]),          sep = "") )
print( paste("H3K27me3_AAVEED Less than ",    minLen, ":  ",  length(H3K27me3_AAVEED2[H3K27me3_AAVEED2<minLen]),  sep = "") )
print( paste("H3K27me3_AAVGFP Less than ",    minLen, ":  ",  length(H3K27me3_AAVGFP2[H3K27me3_AAVGFP2<minLen]),  sep = "") )
print( paste("H3K27me3_ctrl Less than ",      minLen, ":  ",  length(H3K27me3_ctrl2[H3K27me3_ctrl2<minLen]),      sep = "") )
print( paste("H3K27me3_KO Less than ",        minLen, ":  ",  length(H3K27me3_KO2[H3K27me3_KO2<minLen]),          sep = "") )
print("################################################################################################################################")
print("################################################################################################################################")
print( paste("H3K27ac_AAVEED Greater than ",    maxLen, ":  ",  length(H3K27ac_AAVEED2[H3K27ac_AAVEED2>maxLen])/length(H3K27ac_AAVEED2),  sep = "") )
print( paste("H3K27ac_AAVGFP Greater than ",    maxLen, ":  ",  length(H3K27ac_AAVGFP2[H3K27ac_AAVGFP2>maxLen])/length(H3K27ac_AAVGFP2),  sep = "") )
print( paste("H3K27ac_ctrl Greater than ",      maxLen, ":  ",  length(H3K27ac_ctrl2[H3K27ac_ctrl2>maxLen])/length(H3K27ac_ctrl2),      sep = "") )
print( paste("H3K27ac_KO Greater than ",        maxLen, ":  ",  length(H3K27ac_KO2[H3K27ac_KO2>maxLen])/length(H3K27ac_KO2),          sep = "") )
print( paste("H3K27me3_AAVEED Greater than ",    maxLen, ":  ",  length(H3K27me3_AAVEED2[H3K27me3_AAVEED2>maxLen])/length(H3K27me3_AAVEED2),  sep = "") )
print( paste("H3K27me3_AAVGFP Greater than ",    maxLen, ":  ",  length(H3K27me3_AAVGFP2[H3K27me3_AAVGFP2>maxLen])/length(H3K27me3_AAVGFP2),  sep = "") )
print( paste("H3K27me3_ctrl Greater than ",      maxLen, ":  ",  length(H3K27me3_ctrl2[H3K27me3_ctrl2>maxLen])/length(H3K27me3_ctrl2),      sep = "") )
print( paste("H3K27me3_KO Greater than ",        maxLen, ":  ",  length(H3K27me3_KO2[H3K27me3_KO2>maxLen])/length(H3K27me3_KO2),          sep = "") )
print("################################################################################################################################")
print( paste("H3K27ac_AAVEED Less than ",    minLen, ":  ",  length(H3K27ac_AAVEED2[H3K27ac_AAVEED2<minLen])/length(H3K27ac_AAVEED2),  sep = "") )
print( paste("H3K27ac_AAVGFP Less than ",    minLen, ":  ",  length(H3K27ac_AAVGFP2[H3K27ac_AAVGFP2<minLen])/length(H3K27ac_AAVGFP2),  sep = "") )
print( paste("H3K27ac_ctrl Less than ",      minLen, ":  ",  length(H3K27ac_ctrl2[H3K27ac_ctrl2<minLen])/length(H3K27ac_ctrl2),      sep = "") )
print( paste("H3K27ac_KO Less than ",        minLen, ":  ",  length(H3K27ac_KO2[H3K27ac_KO2<minLen])/length(H3K27ac_KO2),          sep = "") )
print( paste("H3K27me3_AAVEED Less than ",    minLen, ":  ",  length(H3K27me3_AAVEED2[H3K27me3_AAVEED2<minLen])/length(H3K27me3_AAVEED2),  sep = "") )
print( paste("H3K27me3_AAVGFP Less than ",    minLen, ":  ",  length(H3K27me3_AAVGFP2[H3K27me3_AAVGFP2<minLen])/length(H3K27me3_AAVGFP2),  sep = "") )
print( paste("H3K27me3_ctrl Less than ",      minLen, ":  ",  length(H3K27me3_ctrl2[H3K27me3_ctrl2<minLen])/length(H3K27me3_ctrl2),      sep = "") )
print( paste("H3K27me3_KO Less than ",        minLen, ":  ",  length(H3K27me3_KO2[H3K27me3_KO2<minLen])/length(H3K27me3_KO2),          sep = "") )
print("################################################################################################################################")
sink()



H3K27ac_AAVEED2[H3K27ac_AAVEED2>maxLen] <- maxLen
H3K27ac_AAVGFP2[H3K27ac_AAVGFP2>maxLen] <- maxLen
H3K27ac_ctrl2[H3K27ac_ctrl2>maxLen] <- maxLen
H3K27ac_KO2[H3K27ac_KO2>maxLen] <- maxLen
H3K27me3_AAVEED2[H3K27me3_AAVEED2>maxLen] <- maxLen
H3K27me3_AAVGFP2[H3K27me3_AAVGFP2>maxLen] <- maxLen
H3K27me3_ctrl2[H3K27me3_ctrl2>maxLen] <- maxLen
H3K27me3_KO2[H3K27me3_KO2>maxLen] <- maxLen

H3K27ac_AAVEED2[H3K27ac_AAVEED2<minLen] <- minLen
H3K27ac_AAVGFP2[H3K27ac_AAVGFP2<minLen] <- minLen
H3K27ac_ctrl2[H3K27ac_ctrl2<minLen] <- minLen
H3K27ac_KO2[H3K27ac_KO2<minLen] <- minLen
H3K27me3_AAVEED2[H3K27me3_AAVEED2<minLen] <- minLen
H3K27me3_AAVGFP2[H3K27me3_AAVGFP2<minLen] <- minLen
H3K27me3_ctrl2[H3K27me3_ctrl2<minLen] <- minLen
H3K27me3_KO2[H3K27me3_KO2<minLen] <- minLen


peakLen  <- c(H3K27ac_AAVEED2, H3K27ac_AAVGFP2, H3K27ac_ctrl2, H3K27ac_KO2, H3K27me3_AAVEED2, H3K27me3_AAVGFP2, H3K27me3_ctrl2,  H3K27me3_KO2 )
peakType <- c( rep("H3K27ac_AAVEED", length(H3K27ac_AAVEED2)), rep("H3K27ac_AAVGFP", length(H3K27ac_AAVGFP2)),   rep("H3K27ac_ctrl", length(H3K27ac_ctrl2)),  rep("H3K27ac_KO", length(H3K27ac_KO2)),  rep("H3K27me3_AAVEED", length(H3K27me3_AAVEED2)), rep("H3K27me3_AAVGFP", length(H3K27me3_AAVGFP2)),   rep("H3K27me3_ctrl", length(H3K27me3_ctrl2)),  rep("H3K27me3_KO", length(H3K27me3_KO2)) )                                                 
All_Frame <- data.frame(peaksLength=peakLen, peaksType=peakType) 




library(ggplot2)
library(Cairo)



## scatter Diagram
scatterDiagram_1 <- function(vector1, file1,  title1) {
  dataframeA     <- data.frame( xAxis = c(1:length(vector1)),  yAxis = vector1 ) 
  CairoSVG( file = file1,   width = 7 ,   height = 5,  onefile = TRUE,   bg = "white",   pointsize = 1 )
  FigureTemp <- ggplot( data = dataframeA, aes(x = xAxis, y = yAxis) ) + geom_point(size=0.9, shape=1) +  #ylim(0, 2) +
                xlab("Peaks") +   ylab("Peak Length") +   ggtitle(title1) + pTheme_1(textSize=10) 
  print(FigureTemp)
  dev.off() 
}

scatterDiagram_1( H3K27ac_AAVEED2 ,   paste(  AllResults_g, "/3-H3K27ac_AAVEED-peaks-length.svg",  sep = ""),     "H3K27ac_AAVEED peaks length distribution") 
scatterDiagram_1( H3K27ac_AAVGFP2 ,   paste(  AllResults_g, "/3-H3K27ac_AAVGFP-peaks-length.svg",  sep = ""),     "H3K27ac_AAVGFP peaks length distribution") 
scatterDiagram_1( H3K27ac_ctrl2 ,     paste(  AllResults_g, "/3-H3K27ac_ctrl-peaks-length.svg",  sep = ""),       "H3K27ac_ctrl peaks length distribution") 
scatterDiagram_1( H3K27ac_KO2 ,       paste(  AllResults_g, "/3-H3K27ac_KO-peaks-length.svg",  sep = ""),         "H3K27ac_KO peaks length distribution") 
scatterDiagram_1( H3K27me3_AAVEED2 ,  paste(  AllResults_g, "/3-H3K27me3_AAVEED-peaks-length.svg",  sep = ""),    "H3K27me3_AAVEED peaks length distribution") 
scatterDiagram_1( H3K27me3_AAVGFP2 ,  paste(  AllResults_g, "/3-H3K27me3_AAVGFP-peaks-length.svg",  sep = ""),    "H3K27me3_AAVGFP peaks length distribution") 
scatterDiagram_1( H3K27me3_ctrl2 ,    paste(  AllResults_g, "/3-H3K27me3_ctrl-peaks-length.svg",  sep = ""),      "H3K27me3_ctrl peaks length distribution") 
scatterDiagram_1( H3K27me3_KO2 ,      paste(  AllResults_g, "/3-H3K27me3_KO-peaks-length.svg",  sep = ""),        "H3K27me3_KO peaks length distribution") 



H3K27ac_AAVEED3  <- sample(H3K27ac_AAVEED2, length(H3K27ac_AAVEED2), replace = FALSE, prob = NULL)
H3K27ac_AAVGFP3  <- sample(H3K27ac_AAVGFP2, length(H3K27ac_AAVGFP2), replace = FALSE, prob = NULL)
H3K27ac_ctrl3    <- sample(H3K27ac_ctrl2,   length(H3K27ac_ctrl2),   replace = FALSE, prob = NULL)
H3K27ac_KO3      <- sample(H3K27ac_KO2,     length(H3K27ac_KO2),     replace = FALSE, prob = NULL)
H3K27me3_AAVEED3  <- sample(H3K27me3_AAVEED2, length(H3K27me3_AAVEED2), replace = FALSE, prob = NULL)
H3K27me3_AAVGFP3  <- sample(H3K27me3_AAVGFP2, length(H3K27me3_AAVGFP2), replace = FALSE, prob = NULL)
H3K27me3_ctrl3    <- sample(H3K27me3_ctrl2,   length(H3K27me3_ctrl2),   replace = FALSE, prob = NULL)
H3K27me3_KO3      <- sample(H3K27me3_KO2,     length(H3K27me3_KO2),     replace = FALSE, prob = NULL)
scatterDiagram_1( H3K27ac_AAVEED3,   paste(  AllResults_g, "/4-randomSelect-H3K27ac_AAVEED-peaks-length.svg",  sep = ""),     "H3K27ac_AAVEED peaks length distribution") 
scatterDiagram_1( H3K27ac_AAVGFP3,   paste(  AllResults_g, "/4-randomSelect-H3K27ac_AAVGFP-peaks-length.svg",  sep = ""),     "H3K27ac_AAVGFP peaks length distribution") 
scatterDiagram_1( H3K27ac_ctrl3,     paste(  AllResults_g, "/4-randomSelect-H3K27ac_ctrl-peaks-length.svg",  sep = ""),       "H3K27ac_ctrl peaks length distribution") 
scatterDiagram_1( H3K27ac_KO3,       paste(  AllResults_g, "/4-randomSelect-H3K27ac_KO-peaks-length.svg",  sep = ""),         "H3K27ac_KO peaks length distribution") 
scatterDiagram_1( H3K27me3_AAVEED3,  paste(  AllResults_g, "/4-randomSelect-H3K27me3_AAVEED-peaks-length.svg",  sep = ""),    "H3K27me3_AAVEED peaks length distribution") 
scatterDiagram_1( H3K27me3_AAVGFP3,  paste(  AllResults_g, "/4-randomSelect-H3K27me3_AAVGFP-peaks-length.svg",  sep = ""),    "H3K27me3_AAVGFP peaks length distribution") 
scatterDiagram_1( H3K27me3_ctrl3,    paste(  AllResults_g, "/4-randomSelect-H3K27me3_ctrl-peaks-length.svg",  sep = ""),      "H3K27me3_ctrl peaks length distribution") 
scatterDiagram_1( H3K27me3_KO3,      paste(  AllResults_g, "/4-randomSelect-H3K27me3_KO-peaks-length.svg",  sep = ""),        "H3K27me3_KO peaks length distribution") 

   




## relative frequency histogram
histogram_1 <- function(vector1, file1,  title1, ymax1=0.1) {
  dataframeB  <- data.frame( xAxis = vector1 ) 
  #dataframeB$xAxis[1] <- 2.0
  
  CairoSVG( file = file1,   width = 5, height = 5, onefile = TRUE, bg = "white",  pointsize = 1 )
  FigureTemp <- ggplot(data=dataframeB, aes(x=xAxis) )  +  xlab("Peak Length") + ylab("Relative Frequency") +  ggtitle(title1)  +  
    ylim(0, ymax1) +  geom_histogram(binwidth = 100, aes( y = (..count..)/sum(..count..))  )  + 
     pTheme_1(textSize=10)   ## scale_x_continuous( breaks=c(0, 0.5, 1, 1.5, 2.0), labels=c("0", "0.5", "1", "1.5", "2.0+") ) 
  print(FigureTemp)
  dev.off() 
  
  file2 = paste( file1, ".noscale.svg",   sep = "")
  CairoSVG( file = file2,   width = 5, height = 5, onefile = TRUE, bg = "white",  pointsize = 1 )
  FigureTemp <- ggplot(data=dataframeB, aes(x=xAxis) )  +  xlab("Peak Length") + ylab("Relative Frequency") +  ggtitle(title1)  +  
    geom_histogram(binwidth = 100, aes( y = (..count..)/sum(..count..))  )  + 
    pTheme_1(textSize=10)    ## scale_x_continuous( breaks=c(0, 0.5, 1, 1.5, 2.0), labels=c("0", "0.5", "1", "1.5", "2.0+") ) 
  print(FigureTemp)
  dev.off() 
  
  file3 = paste( file1, ".scale=1.svg",   sep = "")
  CairoSVG( file = file3,   width = 5, height = 5, onefile = TRUE, bg = "white",  pointsize = 1 )
  FigureTemp <- ggplot(data=dataframeB, aes(x=xAxis) )  +  xlab("Peak Length") + ylab("Relative Frequency") +  ggtitle(title1)  +  
    ylim(0, 1) + geom_histogram(binwidth = 100, aes( y = (..count..)/sum(..count..))  )  + 
    pTheme_1(textSize=10)   ## scale_x_continuous( breaks=c(0, 0.5, 1, 1.5, 2.0), labels=c("0", "0.5", "1", "1.5", "2.0+") ) +
  print(FigureTemp)
  dev.off() 
}

histogram_1( H3K27ac_AAVEED3,   paste(  AllResults_g, "/5--H3K27ac_AAVEED-peaks-length.svg",  sep = ""),     "H3K27ac_AAVEED peaks length distribution") 
histogram_1( H3K27ac_AAVGFP3,   paste(  AllResults_g, "/5--H3K27ac_AAVGFP-peaks-length.svg",  sep = ""),     "H3K27ac_AAVGFP peaks length distribution") 
histogram_1( H3K27ac_ctrl3,     paste(  AllResults_g, "/5--H3K27ac_ctrl-peaks-length.svg",  sep = ""),       "H3K27ac_ctrl peaks length distribution") 
histogram_1( H3K27ac_KO3,       paste(  AllResults_g, "/5--H3K27ac_KO-peaks-length.svg",  sep = ""),         "H3K27ac_KO peaks length distribution") 
histogram_1( H3K27me3_AAVEED3,  paste(  AllResults_g, "/5--H3K27me3_AAVEED-peaks-length.svg",  sep = ""),    "H3K27me3_AAVEED peaks length distribution") 
histogram_1( H3K27me3_AAVGFP3,  paste(  AllResults_g, "/5--H3K27me3_AAVGFP-peaks-length.svg",  sep = ""),    "H3K27me3_AAVGFP peaks length distribution") 
histogram_1( H3K27me3_ctrl3,    paste(  AllResults_g, "/5--H3K27me3_ctrl-peaks-length.svg",  sep = ""),      "H3K27me3_ctrl peaks length distribution") 
histogram_1( H3K27me3_KO3,      paste(  AllResults_g, "/5--H3K27me3_KO-peaks-length.svg",  sep = ""),        "H3K27me3_KO peaks length distribution") 






Five_Density <- function(vector1, vector2,  vector3,  vector4, vector5, vector6, vector7, vector8, File_Local, Title_Local,   Xmax_Local=10000) {  
  x_Axis_1   <- c( vector1, vector2,  vector3,  vector4, vector5, vector6, vector7, vector8 )  
  x_Axis_1[x_Axis_1>Xmax_Local] = Xmax_Local
  sampleType_1 <- c( rep("H3K27ac_AAVEED", length(H3K27ac_AAVEED2)), rep("H3K27ac_AAVGFP", length(H3K27ac_AAVGFP2)),   rep("H3K27ac_ctrl", length(H3K27ac_ctrl2)),  rep("H3K27ac_KO", length(H3K27ac_KO2)),  rep("H3K27me3_AAVEED", length(H3K27me3_AAVEED2)), rep("H3K27me3_AAVGFP", length(H3K27me3_AAVGFP2)),   rep("H3K27me3_ctrl", length(H3K27me3_ctrl2)),  rep("H3K27me3_KO", length(H3K27me3_KO2)) )                                                 
  dataframeB  <- data.frame(xAxis = x_Axis_1,   sampleType = sampleType_1) 
  
  CairoSVG( file = File_Local,   width = 7, height = 5, onefile = TRUE, bg = "white",  pointsize = 1 )
  FigureTemp <- ggplot(data=dataframeB, aes( x=xAxis, color=sampleType, fill=sampleType ) )  +  
    xlab("peak length") + ylab("Density") +  ggtitle(Title_Local)  +  
    scale_colour_manual( values=c( "red", "red4", "yellow",   "yellow4",  "green", "green4",  "blue" ,  "blue4") ) + 
    #scale_x_continuous( breaks=c(0, 0.5, 1, 1.5, 2.0), labels=c("0", "0.5", "1", "1.5", "2.0+") ) +
    geom_line(stat="density", alpha=1   ) + scale_fill_manual( values = c( "red", "red4", "yellow",   "yellow4",  "green", "green4",  "blue" ,  "blue4")) +  
    pTheme_1(textSize=12) +  guides( colour = guide_legend(override.aes = list(size=3, shape=1)) ) 
  print( FigureTemp )
  dev.off()  
  
  File2_Local = paste(File_Local, ".fill.svg", sep="")
  CairoSVG( file = File2_Local,   width = 7, height = 5, onefile = TRUE, bg = "white",  pointsize = 1 )
  FigureTemp2 <- ggplot(data=dataframeB, aes( x=xAxis, color=sampleType, fill=sampleType ) )  +  
    xlab("peak length") + ylab("Density") +  ggtitle(Title_Local)  +  
    #geom_histogram( binwidth = 0.1, aes( y = (..count..)/sum(..count..) ) )  + 
    scale_colour_manual( values=c( "red", "red4", "yellow",   "yellow4",  "green", "green4",  "blue" ,  "blue4" ) ) + 
    #scale_x_continuous( breaks=c(0, 0.5, 1, 1.5, 2.0), labels=c("0", "0.5", "1", "1.5", "2.0+") ) +
    geom_density( alpha=0.3 ) +  scale_fill_manual( values = c( "red", "red4", "yellow",   "yellow4",  "green", "green4",  "blue" ,  "blue4" )) + 
    #geom_hline(yintercept=-0.01, lty=1, col="white", size=0.6) +
    pTheme_1(textSize=12) +  guides( colour = guide_legend(override.aes = list(size=0, shape=1)) )
  print( FigureTemp2 )  
  dev.off()  
}


Five_Density( H3K27ac_AAVEED2, H3K27ac_AAVGFP2, H3K27ac_ctrl2, H3K27ac_KO2, H3K27me3_AAVEED2, H3K27me3_AAVGFP2, H3K27me3_ctrl2,  H3K27me3_KO2,  paste(  AllResults_g, "/6-peaks-length-distribution.svg",   sep = "" ),  "peak length distribution" ) 









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




## df contains two columns, the first column (cond_col=1) is sample type, the second column (val_col=2) is value. (must be).
whisk_1 <- function(df, cond_col=1, val_col=2) {  
  require(reshape2)
  condname <- names(df)[cond_col]  ## save the name of the first column.
  names(df)[cond_col] <- "cond" 
  names(df)[val_col]  <- "value"
  b   <- boxplot(value~cond, data=df, plot=FALSE)   
  df2 <- cbind(as.data.frame(b$stats), c("min","lq","m","uq","max"))
  names(df2) <- c(levels(df$cond), "pos")
  df2 <- melt(df2, id="pos", variable.name="cond")
  df2 <- dcast(df2,cond~pos)   
  names(df2)[1] <- condname 
  print(df2)
  df2
}



















EightColours <- c( "red", "red4", "yellow",   "yellow4",  "green", "green4",  "blue" ,  "blue4" )  




BoxPlot_ViolinPlot_1 <- function(week1_Local, week2_Local, week3_Local, week4_Local,  week5_Local, week6_Local,  week7_Local,  week8_Local,   File_Local, Title_Local )  {
  y_Axis_local_AllC  <- c(week1_Local, week2_Local, week3_Local, week4_Local,  week5_Local, week6_Local,  week7_Local,  week8_Local) 
  y_Axis_local_AllC[y_Axis_local_AllC>8000] <- 8000
  sampleType_local_AllC <- c( rep("H3K27ac_AAVEED", length(H3K27ac_AAVEED2)), rep("H3K27ac_AAVGFP", length(H3K27ac_AAVGFP2)),   rep("H3K27ac_ctrl", length(H3K27ac_ctrl2)),  rep("H3K27ac_KO", length(H3K27ac_KO2)),  rep("H3K27me3_AAVEED", length(H3K27me3_AAVEED2)), rep("H3K27me3_AAVGFP", length(H3K27me3_AAVGFP2)),   rep("H3K27me3_ctrl", length(H3K27me3_ctrl2)),  rep("H3K27me3_KO", length(H3K27me3_KO2)) )                                                 
  dataframe_local_AllC <- data.frame(sampleType = sampleType_local_AllC, yAxis = y_Axis_local_AllC  )  ## the order is very important.
  
  CairoSVG( file = paste(File_Local, "-D-boxplot.svg", sep=""),   width = 6, height =7, onefile = TRUE, bg = "white",  pointsize = 1 )
  FigureTemp <- ggplot( dataframe_local_AllC, aes(x=sampleType ) ) + geom_errorbar( aes(ymin=min, ymax=max),  data=whisk_1(dataframe_local_AllC),   width = 0.3, size=0.2 ) +
    geom_boxplot( width=0.7,   aes(y=yAxis), outlier.colour="gray",  outlier.shape=1, outlier.size=0.001, size=0.2, fill="gray" ) +  
    xlab( "Samples" ) + ylab( "Peak length (bp)" ) + ggtitle(Title_Local )  + pTheme_2(textSize=12) 
  print(FigureTemp) 
  dev.off() 
  
  CairoSVG(file = paste(File_Local, "-D-violinPlot.svg", sep=""),  width =6, height =7, onefile = TRUE, bg = "white",  pointsize = 1 )
  FigureTemp <- ggplot(dataframe_local_AllC, aes(x=sampleType ) ) + geom_violin(aes(y=yAxis), fill = "gray", colour = "gray", adjust = 5) +  
    geom_errorbar(aes(ymin=min,ymax=max),  data=whisk_1(dataframe_local_AllC),   width = 0.1, size=0.1, colour = "black") +
    geom_boxplot( aes(y=yAxis),  width=0.25, size=0.15, fill="gray", outlier.size=0,  colour = "black", notch=FALSE,  notchwidth = 0.1) + 
    scale_fill_manual( values = EightColours) + 
    stat_summary( aes(y=yAxis),   fun.y=mean, colour="white", geom="point", shape=19, size=0.0, show_guide = FALSE) + 
    xlab("Samples") + ylab("Peak length (bp)") + ggtitle(Title_Local)  + pTheme_2(textSize=12)  
  print(FigureTemp) 
  dev.off() 
  
  CairoSVG(file = paste(File_Local, "-D-violinPlot-noAdjust.svg", sep=""), width = 6, height =7, onefile = TRUE, bg = "white",  pointsize = 1 )
  FigureTemp <- ggplot(dataframe_local_AllC, aes(x=sampleType ) ) + geom_violin(aes(y=yAxis), fill = "gray", colour = "gray") +  
    geom_errorbar(aes(ymin=min,ymax=max),  data=whisk_1(dataframe_local_AllC),    width = 0.1, size=0.1, colour = "black") +
    geom_boxplot( aes(y=yAxis),   width=0.25, size=0.15, fill="gray", outlier.size=0,  colour = "black", notch=FALSE,  notchwidth = 0.1) + 
    scale_fill_manual( values = EightColours) + 
    stat_summary( aes(y=yAxis),   fun.y=mean, colour="white", geom="point", shape=19, size=0.0, show_guide = FALSE) + 
    xlab("Samples") + ylab("Peak length (bp)") + ggtitle(Title_Local)  + pTheme_2(textSize=12)  
  print(FigureTemp) 
  dev.off()   
}


BoxPlot_ViolinPlot_1( H3K27ac_AAVEED2, H3K27ac_AAVGFP2, H3K27ac_ctrl2, H3K27ac_KO2, H3K27me3_AAVEED2, H3K27me3_AAVGFP2, H3K27me3_ctrl2,  H3K27me3_KO2,  paste(  AllResults_g, "/7-peaks-length-distribution.svg",   sep = "" ),  "peak length distribution" ) 


pTheme_2 <- function( textSize=12 ) {  
  theme(  
    line  = element_line(colour="black", size=1.0,   linetype=1,      lineend=NULL),                                                          ## all line elements.  局部优先总体,下面3个也是,只对非局部设置有效.   所有线属性.
    rect  = element_rect(colour="black", size=1.0,   linetype=1,      fill="transparent" ),                                                   ## all rectangluar elements.    hjust=1: 靠右对齐.   所有矩形区域属性.
    text  = element_text(family="sans",  face=NULL,  colour="black",  size=textSize, hjust=NULL, vjust=NULL, angle=NULL, lineheight=NULL),    ## all text elements.  "sans" for a sans-sans font. 所有文本相关属性.
    title = element_text(family="sans",  face=NULL,  colour="black",  size=textSize, hjust=NULL, vjust=15,   angle=NULL, lineheight=NULL),    ## all title elements: plot, axes, legends. hjust:水平对齐的方向.  所有标题属性.
    
    axis.title        = element_text(family="sans", face=NULL, colour="black", size=textSize,    hjust=NULL, vjust=NULL, angle=NULL, lineheight=NULL),      ## label of axes (element_text; inherits from text).  horizontal: 水平的, 水平线 
    axis.title.x      = element_text(family="sans", face=NULL, colour="black", size=textSize,    hjust=NULL, vjust=-15,  angle=NULL, lineheight=NULL),      ## x axis label (element_text; inherits from axis.title)
    axis.title.y      = element_text(family="sans", face=NULL, colour="black", size=textSize,    hjust=NULL, vjust=15,   angle=NULL, lineheight=NULL),      ## y axis label (element_text; inherits from axis.title)
    axis.text         = element_text(family="sans", face=NULL, colour="black", size=textSize-2,  hjust=NULL, vjust=NULL, angle=NULL, lineheight=NULL),      ## tick labels along axes (element_text; inherits from text). 坐标轴刻度的标签的属性.                                                         
    axis.text.x       = element_text(family="sans", face=NULL, colour="black", size=textSize-2,  hjust=1, vjust=1, angle=45, lineheight=NULL),      ## x axis tick labels (element_text; inherits from axis.text)
    axis.text.y       = element_text(family="sans", face=NULL, colour="black", size=textSize-2,  hjust=NULL, vjust=NULL, angle=NULL, lineheight=NULL),      ## y axis tick labels (element_text; inherits from axis.text)
    axis.ticks        = element_line(colour="black", size=0.3, linetype=1, lineend=NULL),                                                                   ## tick marks along axes (element_line; inherits from line). 坐标轴刻度线.
    axis.ticks.x      = element_line(colour="black", size=0.3, linetype=1, lineend=NULL),                                                                   ## x axis tick marks (element_line; inherits from axis.ticks)
    axis.ticks.y      = element_line(colour="black", size=0.3, linetype=1, lineend=NULL),                                                                   ## y axis tick marks (element_line; inherits from axis.ticks)
    axis.ticks.length = grid::unit(1.5, "mm", data=NULL),                                                                                                   ## length of tick marks (unit), ‘"mm"’ Millimetres.  10 mm = 1 cm.  刻度线长度
    axis.ticks.margin = grid::unit(1.0, "mm", data=NULL),                                                                                                    ## space between tick mark and tick label (unit),  ‘"mm"’ Millimetres.  10 mm = 1 cm. 刻度线和刻度标签之间的间距.                                                                           
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


