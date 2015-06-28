#!/usr/bin/env perl
use strict;
use warnings;



my $inputDir  = "14-Homer/1-TagDirectory/run2";  
 
  
my $outputDir = $inputDir;
$outputDir =~ s/1-TagDirectory/3-findPeaks/  or  die;
system("mkdir -p  $outputDir");






system("findPeaks  $inputDir/H3K27ac_AAVEED1    -i  $inputDir/H3K27input_AAV    -o $outputDir/H3K27ac_AAVEED1-peaks.txt   -style histone      -size auto   -gsize 2e9    -fragLength auto   -inputFragLength  auto   -tbp auto   -inputtbp auto   -L 4.0   -LP 0.0001    -C 2.0    -fdr 0.001   -tagThreshold 25   >>$outputDir/H3K27ac_AAVEED1-peaks.runLog.txt  2>&1");   ## -i input    -F 4.0    -P 0.0001                                  
system("findPeaks  $inputDir/H3K27ac_AAVEED2    -i  $inputDir/H3K27input_AAV    -o $outputDir/H3K27ac_AAVEED2-peaks.txt   -style histone      -size auto   -gsize 2e9    -fragLength auto   -inputFragLength  auto   -tbp auto   -inputtbp auto   -L 4.0   -LP 0.0001    -C 2.0    -fdr 0.001   -tagThreshold 25   >>$outputDir/H3K27ac_AAVEED2-peaks.runLog.txt  2>&1");   ## -i input    -F 4.0    -P 0.0001                                  
system("findPeaks  $inputDir/H3K27ac_AAVGFP1    -i  $inputDir/H3K27input_AAV    -o $outputDir/H3K27ac_AAVGFP1-peaks.txt   -style histone      -size auto   -gsize 2e9    -fragLength auto   -inputFragLength  auto   -tbp auto   -inputtbp auto   -L 4.0   -LP 0.0001    -C 2.0    -fdr 0.001   -tagThreshold 25   >>$outputDir/H3K27ac_AAVGFP1-peaks.runLog.txt  2>&1");   ## -i input    -F 4.0    -P 0.0001                                  
system("findPeaks  $inputDir/H3K27ac_AAVGFP2    -i  $inputDir/H3K27input_AAV    -o $outputDir/H3K27ac_AAVGFP2-peaks.txt   -style histone      -size auto   -gsize 2e9    -fragLength auto   -inputFragLength  auto   -tbp auto   -inputtbp auto   -L 4.0   -LP 0.0001    -C 2.0    -fdr 0.001   -tagThreshold 25   >>$outputDir/H3K27ac_AAVGFP2-peaks.runLog.txt  2>&1");   ## -i input    -F 4.0    -P 0.0001                                  

system("findPeaks  $inputDir/H3K27me3_AAVEED1    -i  $inputDir/H3K27input_AAV    -o $outputDir/H3K27me3_AAVEED1-peaks.txt   -style histone      -size auto   -gsize 2e9    -fragLength auto   -inputFragLength  auto   -tbp auto   -inputtbp auto   -L 4.0   -LP 0.0001    -C 2.0    -fdr 0.001   -tagThreshold 25   >>$outputDir/H3K27me3_AAVEED1-peaks.runLog.txt  2>&1");   ## -i input    -F 4.0    -P 0.0001                                  
system("findPeaks  $inputDir/H3K27me3_AAVEED2    -i  $inputDir/H3K27input_AAV    -o $outputDir/H3K27me3_AAVEED2-peaks.txt   -style histone      -size auto   -gsize 2e9    -fragLength auto   -inputFragLength  auto   -tbp auto   -inputtbp auto   -L 4.0   -LP 0.0001    -C 2.0    -fdr 0.001   -tagThreshold 25   >>$outputDir/H3K27me3_AAVEED2-peaks.runLog.txt  2>&1");   ## -i input    -F 4.0    -P 0.0001    
system("findPeaks  $inputDir/H3K27me3_AAVGFP1    -i  $inputDir/H3K27input_AAV    -o $outputDir/H3K27me3_AAVGFP1-peaks.txt   -style histone      -size auto   -gsize 2e9    -fragLength auto   -inputFragLength  auto   -tbp auto   -inputtbp auto   -L 4.0   -LP 0.0001    -C 2.0    -fdr 0.001   -tagThreshold 25   >>$outputDir/H3K27me3_AAVGFP1-peaks.runLog.txt  2>&1");   ## -i input    -F 4.0    -P 0.0001                                  
system("findPeaks  $inputDir/H3K27me3_AAVGFP2    -i  $inputDir/H3K27input_AAV    -o $outputDir/H3K27me3_AAVGFP2-peaks.txt   -style histone      -size auto   -gsize 2e9    -fragLength auto   -inputFragLength  auto   -tbp auto   -inputtbp auto   -L 4.0   -LP 0.0001    -C 2.0    -fdr 0.001   -tagThreshold 25   >>$outputDir/H3K27me3_AAVGFP2-peaks.runLog.txt  2>&1");   ## -i input    -F 4.0    -P 0.0001                                  

system("findPeaks  $inputDir/H3K27ac_ctrl1    -i  $inputDir/H3K27ac_input    -o $outputDir/H3K27ac_ctrl1-peaks.txt   -style histone      -size auto   -gsize 2e9    -fragLength auto   -inputFragLength  auto   -tbp auto   -inputtbp auto   -L 4.0   -LP 0.0001    -C 2.0    -fdr 0.001   -tagThreshold 25   >>$outputDir/H3K27ac_ctrl1-peaks.runLog.txt  2>&1");   ## -i input    -F 4.0    -P 0.0001                                  
system("findPeaks  $inputDir/H3K27ac_ctrl2    -i  $inputDir/H3K27ac_input    -o $outputDir/H3K27ac_ctrl2-peaks.txt   -style histone      -size auto   -gsize 2e9    -fragLength auto   -inputFragLength  auto   -tbp auto   -inputtbp auto   -L 4.0   -LP 0.0001    -C 2.0    -fdr 0.001   -tagThreshold 25   >>$outputDir/H3K27ac_ctrl2-peaks.runLog.txt  2>&1");   ## -i input    -F 4.0    -P 0.0001                                  
system("findPeaks  $inputDir/H3K27ac_KO1      -i  $inputDir/H3K27ac_input    -o $outputDir/H3K27ac_KO1-peaks.txt     -style histone      -size auto   -gsize 2e9    -fragLength auto   -inputFragLength  auto   -tbp auto   -inputtbp auto   -L 4.0   -LP 0.0001    -C 2.0    -fdr 0.001   -tagThreshold 25   >>$outputDir/H3K27ac_KO1-peaks.runLog.txt  2>&1");   ## -i input    -F 4.0    -P 0.0001                                  
system("findPeaks  $inputDir/H3K27ac_KO2      -i  $inputDir/H3K27ac_input    -o $outputDir/H3K27ac_KO2-peaks.txt     -style histone      -size auto   -gsize 2e9    -fragLength auto   -inputFragLength  auto   -tbp auto   -inputtbp auto   -L 4.0   -LP 0.0001    -C 2.0    -fdr 0.001   -tagThreshold 25   >>$outputDir/H3K27ac_KO2-peaks.runLog.txt  2>&1");   ## -i input    -F 4.0    -P 0.0001                                  

system("findPeaks  $inputDir/H3K27me3_ctrl1    -i  $inputDir/H3K27me3_input    -o $outputDir/H3K27me3_ctrl1-peaks.txt   -style histone      -size auto   -gsize 2e9    -fragLength auto   -inputFragLength  auto   -tbp auto   -inputtbp auto   -L 4.0   -LP 0.0001    -C 2.0    -fdr 0.001   -tagThreshold 25   >>$outputDir/H3K27me3_ctrl1-peaks.runLog.txt  2>&1");   ## -i input    -F 4.0    -P 0.0001                                  
system("findPeaks  $inputDir/H3K27me3_ctrl2    -i  $inputDir/H3K27me3_input    -o $outputDir/H3K27me3_ctrl2-peaks.txt   -style histone      -size auto   -gsize 2e9    -fragLength auto   -inputFragLength  auto   -tbp auto   -inputtbp auto   -L 4.0   -LP 0.0001    -C 2.0    -fdr 0.001   -tagThreshold 25   >>$outputDir/H3K27me3_ctrl2-peaks.runLog.txt  2>&1");   ## -i input    -F 4.0    -P 0.0001                                  
system("findPeaks  $inputDir/H3K27me3_ctrl3    -i  $inputDir/H3K27me3_input    -o $outputDir/H3K27me3_ctrl3-peaks.txt   -style histone      -size auto   -gsize 2e9    -fragLength auto   -inputFragLength  auto   -tbp auto   -inputtbp auto   -L 4.0   -LP 0.0001    -C 2.0    -fdr 0.001   -tagThreshold 25   >>$outputDir/H3K27me3_ctrl3-peaks.runLog.txt  2>&1");   ## -i input    -F 4.0    -P 0.0001                                  
system("findPeaks  $inputDir/H3K27me3_KO1      -i  $inputDir/H3K27me3_input    -o $outputDir/H3K27me3_KO1-peaks.txt     -style histone      -size auto   -gsize 2e9    -fragLength auto   -inputFragLength  auto   -tbp auto   -inputtbp auto   -L 4.0   -LP 0.0001    -C 2.0    -fdr 0.001   -tagThreshold 25   >>$outputDir/H3K27me3_KO1-peaks.runLog.txt  2>&1");   ## -i input    -F 4.0    -P 0.0001                                  
system("findPeaks  $inputDir/H3K27me3_KO2      -i  $inputDir/H3K27me3_input    -o $outputDir/H3K27me3_KO2-peaks.txt     -style histone      -size auto   -gsize 2e9    -fragLength auto   -inputFragLength  auto   -tbp auto   -inputtbp auto   -L 4.0   -LP 0.0001    -C 2.0    -fdr 0.001   -tagThreshold 25   >>$outputDir/H3K27me3_KO2-peaks.runLog.txt  2>&1");   ## -i input    -F 4.0    -P 0.0001                                  







                              
