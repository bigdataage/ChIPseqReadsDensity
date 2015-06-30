#!/usr/bin/env perl
use strict;
use warnings;




my $inputDir  = "1-HomerFormat";  
my $outDir = "2-Merge";
if (!(-e $outDir))   {mkdir $outDir    or  die; } 
 


my $outDir1 = "$outDir/100bp";
my $outDir2 = "$outDir/200bp";
my $outDir3 = "$outDir/300bp";
my $outDir4 = "$outDir/400bp";
my $outDir5 = "$outDir/500bp";
my $outDir6 = "$outDir/600bp";
my $outDir7 = "$outDir/700bp";
my $outDir8 = "$outDir/800bp";
my $outDir9 = "$outDir/900bp";
my $outDir10= "$outDir/1000bp";
my $outDir11= "$outDir/given";


if (!(-e $outDir1))    {mkdir $outDir1     or  die; } 
if (!(-e $outDir2))    {mkdir $outDir2     or  die; } 
if (!(-e $outDir3))    {mkdir $outDir3     or  die; } 
if (!(-e $outDir4))    {mkdir $outDir4     or  die; } 
if (!(-e $outDir5))    {mkdir $outDir5     or  die; } 
if (!(-e $outDir6))    {mkdir $outDir6     or  die; } 
if (!(-e $outDir7))    {mkdir $outDir7     or  die; } 
if (!(-e $outDir8))    {mkdir $outDir8     or  die; } 
if (!(-e $outDir9))    {mkdir $outDir9     or  die; } 
if (!(-e $outDir10))   {mkdir $outDir10    or  die; } 
if (!(-e $outDir11))   {mkdir $outDir11    or  die; } 






my $distance1 = 100; 
if ( !(-e  "$outDir1/H3K27ac_AAVEED")  )   {mkdir  "$outDir1/H3K27ac_AAVEED"   or  die;  } 
if ( !(-e  "$outDir1/H3K27ac_AAVGFP")  )   {mkdir  "$outDir1/H3K27ac_AAVGFP"   or  die;  } 
if ( !(-e  "$outDir1/H3K27ac_ctrl")    )   {mkdir  "$outDir1/H3K27ac_ctrl"   or  die;  } 
if ( !(-e  "$outDir1/H3K27ac_KO")      )   {mkdir  "$outDir1/H3K27ac_KO"   or  die;  } 
if ( !(-e  "$outDir1/H3K27me3_AAVEED") )   {mkdir  "$outDir1/H3K27me3_AAVEED"   or  die;  } 
if ( !(-e  "$outDir1/H3K27me3_AAVGFP") )   {mkdir  "$outDir1/H3K27me3_AAVGFP"   or  die;  } 
if ( !(-e  "$outDir1/H3K27me3_ctrl")   )   {mkdir  "$outDir1/H3K27me3_ctrl"     or  die;  } 
if ( !(-e  "$outDir1/H3K27me3_KO")     )   {mkdir  "$outDir1/H3K27me3_KO"       or  die;  } 

system("mergePeaks    -d $distance1    $inputDir/H3K27ac_AAVEED1     $inputDir/H3K27ac_AAVEED2     -prefix $outDir1/H3K27ac_AAVEED/AAVEED       -venn  $outDir1/H3K27ac_AAVEED/1-overlap.txt     -matrix  $outDir1/H3K27ac_AAVEED/2-matrix     >>$outDir1/H3K27ac_AAVEED/H3K27ac.runLog.txt  2>&1");                             
system("mergePeaks    -d $distance1    $inputDir/H3K27ac_AAVGFP1     $inputDir/H3K27ac_AAVGFP2     -prefix $outDir1/H3K27ac_AAVGFP/AAVGFP       -venn  $outDir1/H3K27ac_AAVGFP/1-overlap.txt     -matrix  $outDir1/H3K27ac_AAVGFP/2-matrix     >>$outDir1/H3K27ac_AAVGFP/H3K27ac.runLog.txt  2>&1");                             
system("mergePeaks    -d $distance1    $inputDir/H3K27ac_ctrl1       $inputDir/H3K27ac_ctrl2       -prefix $outDir1/H3K27ac_ctrl/ctrl           -venn  $outDir1/H3K27ac_ctrl/1-overlap.txt       -matrix  $outDir1/H3K27ac_ctrl/2-matrix       >>$outDir1/H3K27ac_ctrl/H3K27ac.runLog.txt  2>&1");                             
system("mergePeaks    -d $distance1    $inputDir/H3K27ac_KO2         $inputDir/H3K27ac_KO2         -prefix $outDir1/H3K27ac_KO/KO               -venn  $outDir1/H3K27ac_KO/1-overlap.txt         -matrix  $outDir1/H3K27ac_KO/2-matrix         >>$outDir1/H3K27ac_KO/H3K27ac.runLog.txt  2>&1");                             
system("mergePeaks    -d $distance1    $inputDir/H3K27me3_AAVEED1    $inputDir/H3K27me3_AAVEED1    -prefix $outDir1/H3K27me3_AAVEED/AAVEED      -venn  $outDir1/H3K27me3_AAVEED/1-overlap.txt    -matrix  $outDir1/H3K27me3_AAVEED/2-matrix    >>$outDir1/H3K27me3_AAVEED/H3K27me3.runLog.txt  2>&1");                             
system("mergePeaks    -d $distance1    $inputDir/H3K27me3_AAVGFP1    $inputDir/H3K27me3_AAVGFP2    -prefix $outDir1/H3K27me3_AAVGFP/AAVGFP      -venn  $outDir1/H3K27me3_AAVGFP/1-overlap.txt    -matrix  $outDir1/H3K27me3_AAVGFP/2-matrix    >>$outDir1/H3K27me3_AAVGFP/H3K27me3.runLog.txt  2>&1");                             
system("mergePeaks    -d $distance1    $inputDir/H3K27me3_KO2        $inputDir/H3K27me3_KO2        -prefix $outDir1/H3K27me3_KO/KO              -venn  $outDir1/H3K27me3_KO/1-overlap.txt        -matrix  $outDir1/H3K27me3_KO/2-matrix        >>$outDir1/H3K27me3_KO/H3K27me3.runLog.txt  2>&1");                             
system("mergePeaks    -d $distance1    $inputDir/H3K27me3_ctrl1      $inputDir/H3K27me3_ctrl2      $inputDir/H3K27me3_ctrl3    -prefix $outDir1/H3K27me3_ctrl/ctrl          -venn  $outDir1/H3K27me3_ctrl/1-overlap.txt      -matrix  $outDir1/H3K27me3_ctrl/2-matrix      >>$outDir1/H3K27me3_ctrl/H3K27me3.runLog.txt  2>&1");                             












my $distance2 = 200; 
if ( !(-e  "$outDir2/H3K27ac_AAVEED")  )   {mkdir  "$outDir2/H3K27ac_AAVEED"   or  die;  } 
if ( !(-e  "$outDir2/H3K27ac_AAVGFP")  )   {mkdir  "$outDir2/H3K27ac_AAVGFP"   or  die;  } 
if ( !(-e  "$outDir2/H3K27ac_ctrl")    )   {mkdir  "$outDir2/H3K27ac_ctrl"   or  die;  } 
if ( !(-e  "$outDir2/H3K27ac_KO")      )   {mkdir  "$outDir2/H3K27ac_KO"   or  die;  } 
if ( !(-e  "$outDir2/H3K27me3_AAVEED") )   {mkdir  "$outDir2/H3K27me3_AAVEED"   or  die;  } 
if ( !(-e  "$outDir2/H3K27me3_AAVGFP") )   {mkdir  "$outDir2/H3K27me3_AAVGFP"   or  die;  } 
if ( !(-e  "$outDir2/H3K27me3_ctrl")   )   {mkdir  "$outDir2/H3K27me3_ctrl"     or  die;  } 
if ( !(-e  "$outDir2/H3K27me3_KO")     )   {mkdir  "$outDir2/H3K27me3_KO"       or  die;  } 

system("mergePeaks    -d $distance2    $inputDir/H3K27ac_AAVEED1     $inputDir/H3K27ac_AAVEED2     -prefix $outDir2/H3K27ac_AAVEED/AAVEED       -venn  $outDir2/H3K27ac_AAVEED/1-overlap.txt     -matrix  $outDir2/H3K27ac_AAVEED/2-matrix     >>$outDir2/H3K27ac_AAVEED/H3K27ac.runLog.txt  2>&1");                             
system("mergePeaks    -d $distance2    $inputDir/H3K27ac_AAVGFP1     $inputDir/H3K27ac_AAVGFP2     -prefix $outDir2/H3K27ac_AAVGFP/AAVGFP       -venn  $outDir2/H3K27ac_AAVGFP/1-overlap.txt     -matrix  $outDir2/H3K27ac_AAVGFP/2-matrix     >>$outDir2/H3K27ac_AAVGFP/H3K27ac.runLog.txt  2>&1");                             
system("mergePeaks    -d $distance2    $inputDir/H3K27ac_ctrl1       $inputDir/H3K27ac_ctrl2       -prefix $outDir2/H3K27ac_ctrl/ctrl           -venn  $outDir2/H3K27ac_ctrl/1-overlap.txt       -matrix  $outDir2/H3K27ac_ctrl/2-matrix       >>$outDir2/H3K27ac_ctrl/H3K27ac.runLog.txt  2>&1");                             
system("mergePeaks    -d $distance2    $inputDir/H3K27ac_KO2         $inputDir/H3K27ac_KO2         -prefix $outDir2/H3K27ac_KO/KO               -venn  $outDir2/H3K27ac_KO/1-overlap.txt         -matrix  $outDir2/H3K27ac_KO/2-matrix         >>$outDir2/H3K27ac_KO/H3K27ac.runLog.txt  2>&1");                             
system("mergePeaks    -d $distance2    $inputDir/H3K27me3_AAVEED1    $inputDir/H3K27me3_AAVEED1    -prefix $outDir2/H3K27me3_AAVEED/AAVEED      -venn  $outDir2/H3K27me3_AAVEED/1-overlap.txt    -matrix  $outDir2/H3K27me3_AAVEED/2-matrix    >>$outDir2/H3K27me3_AAVEED/H3K27me3.runLog.txt  2>&1");                             
system("mergePeaks    -d $distance2    $inputDir/H3K27me3_AAVGFP1    $inputDir/H3K27me3_AAVGFP2    -prefix $outDir2/H3K27me3_AAVGFP/AAVGFP      -venn  $outDir2/H3K27me3_AAVGFP/1-overlap.txt    -matrix  $outDir2/H3K27me3_AAVGFP/2-matrix    >>$outDir2/H3K27me3_AAVGFP/H3K27me3.runLog.txt  2>&1");                             
system("mergePeaks    -d $distance2    $inputDir/H3K27me3_KO2        $inputDir/H3K27me3_KO2        -prefix $outDir2/H3K27me3_KO/KO              -venn  $outDir2/H3K27me3_KO/1-overlap.txt        -matrix  $outDir2/H3K27me3_KO/2-matrix        >>$outDir2/H3K27me3_KO/H3K27me3.runLog.txt  2>&1");                             
system("mergePeaks    -d $distance2    $inputDir/H3K27me3_ctrl1      $inputDir/H3K27me3_ctrl2      $inputDir/H3K27me3_ctrl3    -prefix $outDir2/H3K27me3_ctrl/ctrl          -venn  $outDir2/H3K27me3_ctrl/1-overlap.txt      -matrix  $outDir2/H3K27me3_ctrl/2-matrix      >>$outDir2/H3K27me3_ctrl/H3K27me3.runLog.txt  2>&1");                             


    













my $distance3 = 300; 
if ( !(-e  "$outDir3/H3K27ac_AAVEED")  )   {mkdir  "$outDir3/H3K27ac_AAVEED"   or  die;  } 
if ( !(-e  "$outDir3/H3K27ac_AAVGFP")  )   {mkdir  "$outDir3/H3K27ac_AAVGFP"   or  die;  } 
if ( !(-e  "$outDir3/H3K27ac_ctrl")    )   {mkdir  "$outDir3/H3K27ac_ctrl"   or  die;  } 
if ( !(-e  "$outDir3/H3K27ac_KO")      )   {mkdir  "$outDir3/H3K27ac_KO"   or  die;  } 
if ( !(-e  "$outDir3/H3K27me3_AAVEED") )   {mkdir  "$outDir3/H3K27me3_AAVEED"   or  die;  } 
if ( !(-e  "$outDir3/H3K27me3_AAVGFP") )   {mkdir  "$outDir3/H3K27me3_AAVGFP"   or  die;  } 
if ( !(-e  "$outDir3/H3K27me3_ctrl")   )   {mkdir  "$outDir3/H3K27me3_ctrl"     or  die;  } 
if ( !(-e  "$outDir3/H3K27me3_KO")     )   {mkdir  "$outDir3/H3K27me3_KO"       or  die;  } 

system("mergePeaks    -d $distance3    $inputDir/H3K27ac_AAVEED1     $inputDir/H3K27ac_AAVEED2     -prefix $outDir3/H3K27ac_AAVEED/AAVEED       -venn  $outDir3/H3K27ac_AAVEED/1-overlap.txt     -matrix  $outDir3/H3K27ac_AAVEED/2-matrix     >>$outDir3/H3K27ac_AAVEED/H3K27ac.runLog.txt  2>&1");                             
system("mergePeaks    -d $distance3    $inputDir/H3K27ac_AAVGFP1     $inputDir/H3K27ac_AAVGFP2     -prefix $outDir3/H3K27ac_AAVGFP/AAVGFP       -venn  $outDir3/H3K27ac_AAVGFP/1-overlap.txt     -matrix  $outDir3/H3K27ac_AAVGFP/2-matrix     >>$outDir3/H3K27ac_AAVGFP/H3K27ac.runLog.txt  2>&1");                             
system("mergePeaks    -d $distance3    $inputDir/H3K27ac_ctrl1       $inputDir/H3K27ac_ctrl2       -prefix $outDir3/H3K27ac_ctrl/ctrl           -venn  $outDir3/H3K27ac_ctrl/1-overlap.txt       -matrix  $outDir3/H3K27ac_ctrl/2-matrix       >>$outDir3/H3K27ac_ctrl/H3K27ac.runLog.txt  2>&1");                             
system("mergePeaks    -d $distance3    $inputDir/H3K27ac_KO2         $inputDir/H3K27ac_KO2         -prefix $outDir3/H3K27ac_KO/KO               -venn  $outDir3/H3K27ac_KO/1-overlap.txt         -matrix  $outDir3/H3K27ac_KO/2-matrix         >>$outDir3/H3K27ac_KO/H3K27ac.runLog.txt  2>&1");                             
system("mergePeaks    -d $distance3    $inputDir/H3K27me3_AAVEED1    $inputDir/H3K27me3_AAVEED1    -prefix $outDir3/H3K27me3_AAVEED/AAVEED      -venn  $outDir3/H3K27me3_AAVEED/1-overlap.txt    -matrix  $outDir3/H3K27me3_AAVEED/2-matrix    >>$outDir3/H3K27me3_AAVEED/H3K27me3.runLog.txt  2>&1");                             
system("mergePeaks    -d $distance3    $inputDir/H3K27me3_AAVGFP1    $inputDir/H3K27me3_AAVGFP2    -prefix $outDir3/H3K27me3_AAVGFP/AAVGFP      -venn  $outDir3/H3K27me3_AAVGFP/1-overlap.txt    -matrix  $outDir3/H3K27me3_AAVGFP/2-matrix    >>$outDir3/H3K27me3_AAVGFP/H3K27me3.runLog.txt  2>&1");                             
system("mergePeaks    -d $distance3    $inputDir/H3K27me3_KO2        $inputDir/H3K27me3_KO2        -prefix $outDir3/H3K27me3_KO/KO              -venn  $outDir3/H3K27me3_KO/1-overlap.txt        -matrix  $outDir3/H3K27me3_KO/2-matrix        >>$outDir3/H3K27me3_KO/H3K27me3.runLog.txt  2>&1");                             
system("mergePeaks    -d $distance3    $inputDir/H3K27me3_ctrl1      $inputDir/H3K27me3_ctrl2      $inputDir/H3K27me3_ctrl3    -prefix $outDir3/H3K27me3_ctrl/ctrl          -venn  $outDir3/H3K27me3_ctrl/1-overlap.txt      -matrix  $outDir3/H3K27me3_ctrl/2-matrix      >>$outDir3/H3K27me3_ctrl/H3K27me3.runLog.txt  2>&1");                             










my $distance4 = 400; 
if ( !(-e  "$outDir4/H3K27ac_AAVEED")  )   {mkdir  "$outDir4/H3K27ac_AAVEED"   or  die;  } 
if ( !(-e  "$outDir4/H3K27ac_AAVGFP")  )   {mkdir  "$outDir4/H3K27ac_AAVGFP"   or  die;  } 
if ( !(-e  "$outDir4/H3K27ac_ctrl")    )   {mkdir  "$outDir4/H3K27ac_ctrl"   or  die;  } 
if ( !(-e  "$outDir4/H3K27ac_KO")      )   {mkdir  "$outDir4/H3K27ac_KO"   or  die;  } 
if ( !(-e  "$outDir4/H3K27me3_AAVEED") )   {mkdir  "$outDir4/H3K27me3_AAVEED"   or  die;  } 
if ( !(-e  "$outDir4/H3K27me3_AAVGFP") )   {mkdir  "$outDir4/H3K27me3_AAVGFP"   or  die;  } 
if ( !(-e  "$outDir4/H3K27me3_ctrl")   )   {mkdir  "$outDir4/H3K27me3_ctrl"     or  die;  } 
if ( !(-e  "$outDir4/H3K27me3_KO")     )   {mkdir  "$outDir4/H3K27me3_KO"       or  die;  } 

system("mergePeaks    -d $distance4    $inputDir/H3K27ac_AAVEED1     $inputDir/H3K27ac_AAVEED2     -prefix $outDir4/H3K27ac_AAVEED/AAVEED       -venn  $outDir4/H3K27ac_AAVEED/1-overlap.txt     -matrix  $outDir4/H3K27ac_AAVEED/2-matrix     >>$outDir4/H3K27ac_AAVEED/H3K27ac.runLog.txt  2>&1");                             
system("mergePeaks    -d $distance4    $inputDir/H3K27ac_AAVGFP1     $inputDir/H3K27ac_AAVGFP2     -prefix $outDir4/H3K27ac_AAVGFP/AAVGFP       -venn  $outDir4/H3K27ac_AAVGFP/1-overlap.txt     -matrix  $outDir4/H3K27ac_AAVGFP/2-matrix     >>$outDir4/H3K27ac_AAVGFP/H3K27ac.runLog.txt  2>&1");                             
system("mergePeaks    -d $distance4    $inputDir/H3K27ac_ctrl1       $inputDir/H3K27ac_ctrl2       -prefix $outDir4/H3K27ac_ctrl/ctrl           -venn  $outDir4/H3K27ac_ctrl/1-overlap.txt       -matrix  $outDir4/H3K27ac_ctrl/2-matrix       >>$outDir4/H3K27ac_ctrl/H3K27ac.runLog.txt  2>&1");                             
system("mergePeaks    -d $distance4    $inputDir/H3K27ac_KO2         $inputDir/H3K27ac_KO2         -prefix $outDir4/H3K27ac_KO/KO               -venn  $outDir4/H3K27ac_KO/1-overlap.txt         -matrix  $outDir4/H3K27ac_KO/2-matrix         >>$outDir4/H3K27ac_KO/H3K27ac.runLog.txt  2>&1");                             
system("mergePeaks    -d $distance4    $inputDir/H3K27me3_AAVEED1    $inputDir/H3K27me3_AAVEED1    -prefix $outDir4/H3K27me3_AAVEED/AAVEED      -venn  $outDir4/H3K27me3_AAVEED/1-overlap.txt    -matrix  $outDir4/H3K27me3_AAVEED/2-matrix    >>$outDir4/H3K27me3_AAVEED/H3K27me3.runLog.txt  2>&1");                             
system("mergePeaks    -d $distance4    $inputDir/H3K27me3_AAVGFP1    $inputDir/H3K27me3_AAVGFP2    -prefix $outDir4/H3K27me3_AAVGFP/AAVGFP      -venn  $outDir4/H3K27me3_AAVGFP/1-overlap.txt    -matrix  $outDir4/H3K27me3_AAVGFP/2-matrix    >>$outDir4/H3K27me3_AAVGFP/H3K27me3.runLog.txt  2>&1");                             
system("mergePeaks    -d $distance4    $inputDir/H3K27me3_KO2        $inputDir/H3K27me3_KO2        -prefix $outDir4/H3K27me3_KO/KO              -venn  $outDir4/H3K27me3_KO/1-overlap.txt        -matrix  $outDir4/H3K27me3_KO/2-matrix        >>$outDir4/H3K27me3_KO/H3K27me3.runLog.txt  2>&1");                             
system("mergePeaks    -d $distance4    $inputDir/H3K27me3_ctrl1      $inputDir/H3K27me3_ctrl2      $inputDir/H3K27me3_ctrl3    -prefix $outDir4/H3K27me3_ctrl/ctrl          -venn  $outDir4/H3K27me3_ctrl/1-overlap.txt      -matrix  $outDir4/H3K27me3_ctrl/2-matrix      >>$outDir4/H3K27me3_ctrl/H3K27me3.runLog.txt  2>&1");                             












my $distance5 = 500; 
if ( !(-e  "$outDir5/H3K27ac_AAVEED")  )   {mkdir  "$outDir5/H3K27ac_AAVEED"   or  die;  } 
if ( !(-e  "$outDir5/H3K27ac_AAVGFP")  )   {mkdir  "$outDir5/H3K27ac_AAVGFP"   or  die;  } 
if ( !(-e  "$outDir5/H3K27ac_ctrl")    )   {mkdir  "$outDir5/H3K27ac_ctrl"   or  die;  } 
if ( !(-e  "$outDir5/H3K27ac_KO")      )   {mkdir  "$outDir5/H3K27ac_KO"   or  die;  } 
if ( !(-e  "$outDir5/H3K27me3_AAVEED") )   {mkdir  "$outDir5/H3K27me3_AAVEED"   or  die;  } 
if ( !(-e  "$outDir5/H3K27me3_AAVGFP") )   {mkdir  "$outDir5/H3K27me3_AAVGFP"   or  die;  } 
if ( !(-e  "$outDir5/H3K27me3_ctrl")   )   {mkdir  "$outDir5/H3K27me3_ctrl"     or  die;  } 
if ( !(-e  "$outDir5/H3K27me3_KO")     )   {mkdir  "$outDir5/H3K27me3_KO"       or  die;  } 

system("mergePeaks    -d $distance5    $inputDir/H3K27ac_AAVEED1     $inputDir/H3K27ac_AAVEED2     -prefix $outDir5/H3K27ac_AAVEED/AAVEED       -venn  $outDir5/H3K27ac_AAVEED/1-overlap.txt     -matrix  $outDir5/H3K27ac_AAVEED/2-matrix     >>$outDir5/H3K27ac_AAVEED/H3K27ac.runLog.txt  2>&1");                             
system("mergePeaks    -d $distance5    $inputDir/H3K27ac_AAVGFP1     $inputDir/H3K27ac_AAVGFP2     -prefix $outDir5/H3K27ac_AAVGFP/AAVGFP       -venn  $outDir5/H3K27ac_AAVGFP/1-overlap.txt     -matrix  $outDir5/H3K27ac_AAVGFP/2-matrix     >>$outDir5/H3K27ac_AAVGFP/H3K27ac.runLog.txt  2>&1");                             
system("mergePeaks    -d $distance5    $inputDir/H3K27ac_ctrl1       $inputDir/H3K27ac_ctrl2       -prefix $outDir5/H3K27ac_ctrl/ctrl           -venn  $outDir5/H3K27ac_ctrl/1-overlap.txt       -matrix  $outDir5/H3K27ac_ctrl/2-matrix       >>$outDir5/H3K27ac_ctrl/H3K27ac.runLog.txt  2>&1");                             
system("mergePeaks    -d $distance5    $inputDir/H3K27ac_KO2         $inputDir/H3K27ac_KO2         -prefix $outDir5/H3K27ac_KO/KO               -venn  $outDir5/H3K27ac_KO/1-overlap.txt         -matrix  $outDir5/H3K27ac_KO/2-matrix         >>$outDir5/H3K27ac_KO/H3K27ac.runLog.txt  2>&1");                             
system("mergePeaks    -d $distance5    $inputDir/H3K27me3_AAVEED1    $inputDir/H3K27me3_AAVEED1    -prefix $outDir5/H3K27me3_AAVEED/AAVEED      -venn  $outDir5/H3K27me3_AAVEED/1-overlap.txt    -matrix  $outDir5/H3K27me3_AAVEED/2-matrix    >>$outDir5/H3K27me3_AAVEED/H3K27me3.runLog.txt  2>&1");                             
system("mergePeaks    -d $distance5    $inputDir/H3K27me3_AAVGFP1    $inputDir/H3K27me3_AAVGFP2    -prefix $outDir5/H3K27me3_AAVGFP/AAVGFP      -venn  $outDir5/H3K27me3_AAVGFP/1-overlap.txt    -matrix  $outDir5/H3K27me3_AAVGFP/2-matrix    >>$outDir5/H3K27me3_AAVGFP/H3K27me3.runLog.txt  2>&1");                             
system("mergePeaks    -d $distance5    $inputDir/H3K27me3_KO2        $inputDir/H3K27me3_KO2        -prefix $outDir5/H3K27me3_KO/KO              -venn  $outDir5/H3K27me3_KO/1-overlap.txt        -matrix  $outDir5/H3K27me3_KO/2-matrix        >>$outDir5/H3K27me3_KO/H3K27me3.runLog.txt  2>&1");                             
system("mergePeaks    -d $distance5    $inputDir/H3K27me3_ctrl1      $inputDir/H3K27me3_ctrl2      $inputDir/H3K27me3_ctrl3    -prefix $outDir5/H3K27me3_ctrl/ctrl          -venn  $outDir5/H3K27me3_ctrl/1-overlap.txt      -matrix  $outDir5/H3K27me3_ctrl/2-matrix      >>$outDir5/H3K27me3_ctrl/H3K27me3.runLog.txt  2>&1");                             























my $distance6 = 600; 
if ( !(-e  "$outDir6/H3K27ac_AAVEED")  )   {mkdir  "$outDir6/H3K27ac_AAVEED"   or  die;  } 
if ( !(-e  "$outDir6/H3K27ac_AAVGFP")  )   {mkdir  "$outDir6/H3K27ac_AAVGFP"   or  die;  } 
if ( !(-e  "$outDir6/H3K27ac_ctrl")    )   {mkdir  "$outDir6/H3K27ac_ctrl"   or  die;  } 
if ( !(-e  "$outDir6/H3K27ac_KO")      )   {mkdir  "$outDir6/H3K27ac_KO"   or  die;  } 
if ( !(-e  "$outDir6/H3K27me3_AAVEED") )   {mkdir  "$outDir6/H3K27me3_AAVEED"   or  die;  } 
if ( !(-e  "$outDir6/H3K27me3_AAVGFP") )   {mkdir  "$outDir6/H3K27me3_AAVGFP"   or  die;  } 
if ( !(-e  "$outDir6/H3K27me3_ctrl")   )   {mkdir  "$outDir6/H3K27me3_ctrl"     or  die;  } 
if ( !(-e  "$outDir6/H3K27me3_KO")     )   {mkdir  "$outDir6/H3K27me3_KO"       or  die;  } 

system("mergePeaks    -d $distance6    $inputDir/H3K27ac_AAVEED1     $inputDir/H3K27ac_AAVEED2     -prefix $outDir6/H3K27ac_AAVEED/AAVEED       -venn  $outDir6/H3K27ac_AAVEED/1-overlap.txt     -matrix  $outDir6/H3K27ac_AAVEED/2-matrix     >>$outDir6/H3K27ac_AAVEED/H3K27ac.runLog.txt  2>&1");                             
system("mergePeaks    -d $distance6    $inputDir/H3K27ac_AAVGFP1     $inputDir/H3K27ac_AAVGFP2     -prefix $outDir6/H3K27ac_AAVGFP/AAVGFP       -venn  $outDir6/H3K27ac_AAVGFP/1-overlap.txt     -matrix  $outDir6/H3K27ac_AAVGFP/2-matrix     >>$outDir6/H3K27ac_AAVGFP/H3K27ac.runLog.txt  2>&1");                             
system("mergePeaks    -d $distance6    $inputDir/H3K27ac_ctrl1       $inputDir/H3K27ac_ctrl2       -prefix $outDir6/H3K27ac_ctrl/ctrl           -venn  $outDir6/H3K27ac_ctrl/1-overlap.txt       -matrix  $outDir6/H3K27ac_ctrl/2-matrix       >>$outDir6/H3K27ac_ctrl/H3K27ac.runLog.txt  2>&1");                             
system("mergePeaks    -d $distance6    $inputDir/H3K27ac_KO2         $inputDir/H3K27ac_KO2         -prefix $outDir6/H3K27ac_KO/KO               -venn  $outDir6/H3K27ac_KO/1-overlap.txt         -matrix  $outDir6/H3K27ac_KO/2-matrix         >>$outDir6/H3K27ac_KO/H3K27ac.runLog.txt  2>&1");                             
system("mergePeaks    -d $distance6    $inputDir/H3K27me3_AAVEED1    $inputDir/H3K27me3_AAVEED1    -prefix $outDir6/H3K27me3_AAVEED/AAVEED      -venn  $outDir6/H3K27me3_AAVEED/1-overlap.txt    -matrix  $outDir6/H3K27me3_AAVEED/2-matrix    >>$outDir6/H3K27me3_AAVEED/H3K27me3.runLog.txt  2>&1");                             
system("mergePeaks    -d $distance6    $inputDir/H3K27me3_AAVGFP1    $inputDir/H3K27me3_AAVGFP2    -prefix $outDir6/H3K27me3_AAVGFP/AAVGFP      -venn  $outDir6/H3K27me3_AAVGFP/1-overlap.txt    -matrix  $outDir6/H3K27me3_AAVGFP/2-matrix    >>$outDir6/H3K27me3_AAVGFP/H3K27me3.runLog.txt  2>&1");                             
system("mergePeaks    -d $distance6    $inputDir/H3K27me3_KO2        $inputDir/H3K27me3_KO2        -prefix $outDir6/H3K27me3_KO/KO              -venn  $outDir6/H3K27me3_KO/1-overlap.txt        -matrix  $outDir6/H3K27me3_KO/2-matrix        >>$outDir6/H3K27me3_KO/H3K27me3.runLog.txt  2>&1");                             
system("mergePeaks    -d $distance6    $inputDir/H3K27me3_ctrl1      $inputDir/H3K27me3_ctrl2      $inputDir/H3K27me3_ctrl3    -prefix $outDir6/H3K27me3_ctrl/ctrl          -venn  $outDir6/H3K27me3_ctrl/1-overlap.txt      -matrix  $outDir6/H3K27me3_ctrl/2-matrix      >>$outDir6/H3K27me3_ctrl/H3K27me3.runLog.txt  2>&1");                             















my $distance7 = 700; 
if ( !(-e  "$outDir7/H3K27ac_AAVEED")  )   {mkdir  "$outDir7/H3K27ac_AAVEED"   or  die;  } 
if ( !(-e  "$outDir7/H3K27ac_AAVGFP")  )   {mkdir  "$outDir7/H3K27ac_AAVGFP"   or  die;  } 
if ( !(-e  "$outDir7/H3K27ac_ctrl")    )   {mkdir  "$outDir7/H3K27ac_ctrl"   or  die;  } 
if ( !(-e  "$outDir7/H3K27ac_KO")      )   {mkdir  "$outDir7/H3K27ac_KO"   or  die;  } 
if ( !(-e  "$outDir7/H3K27me3_AAVEED") )   {mkdir  "$outDir7/H3K27me3_AAVEED"   or  die;  } 
if ( !(-e  "$outDir7/H3K27me3_AAVGFP") )   {mkdir  "$outDir7/H3K27me3_AAVGFP"   or  die;  } 
if ( !(-e  "$outDir7/H3K27me3_ctrl")   )   {mkdir  "$outDir7/H3K27me3_ctrl"     or  die;  } 
if ( !(-e  "$outDir7/H3K27me3_KO")     )   {mkdir  "$outDir7/H3K27me3_KO"       or  die;  } 

system("mergePeaks    -d $distance7    $inputDir/H3K27ac_AAVEED1     $inputDir/H3K27ac_AAVEED2     -prefix $outDir7/H3K27ac_AAVEED/AAVEED       -venn  $outDir7/H3K27ac_AAVEED/1-overlap.txt     -matrix  $outDir7/H3K27ac_AAVEED/2-matrix     >>$outDir7/H3K27ac_AAVEED/H3K27ac.runLog.txt  2>&1");                             
system("mergePeaks    -d $distance7    $inputDir/H3K27ac_AAVGFP1     $inputDir/H3K27ac_AAVGFP2     -prefix $outDir7/H3K27ac_AAVGFP/AAVGFP       -venn  $outDir7/H3K27ac_AAVGFP/1-overlap.txt     -matrix  $outDir7/H3K27ac_AAVGFP/2-matrix     >>$outDir7/H3K27ac_AAVGFP/H3K27ac.runLog.txt  2>&1");                             
system("mergePeaks    -d $distance7    $inputDir/H3K27ac_ctrl1       $inputDir/H3K27ac_ctrl2       -prefix $outDir7/H3K27ac_ctrl/ctrl           -venn  $outDir7/H3K27ac_ctrl/1-overlap.txt       -matrix  $outDir7/H3K27ac_ctrl/2-matrix       >>$outDir7/H3K27ac_ctrl/H3K27ac.runLog.txt  2>&1");                             
system("mergePeaks    -d $distance7    $inputDir/H3K27ac_KO2         $inputDir/H3K27ac_KO2         -prefix $outDir7/H3K27ac_KO/KO               -venn  $outDir7/H3K27ac_KO/1-overlap.txt         -matrix  $outDir7/H3K27ac_KO/2-matrix         >>$outDir7/H3K27ac_KO/H3K27ac.runLog.txt  2>&1");                             
system("mergePeaks    -d $distance7    $inputDir/H3K27me3_AAVEED1    $inputDir/H3K27me3_AAVEED1    -prefix $outDir7/H3K27me3_AAVEED/AAVEED      -venn  $outDir7/H3K27me3_AAVEED/1-overlap.txt    -matrix  $outDir7/H3K27me3_AAVEED/2-matrix    >>$outDir7/H3K27me3_AAVEED/H3K27me3.runLog.txt  2>&1");                             
system("mergePeaks    -d $distance7    $inputDir/H3K27me3_AAVGFP1    $inputDir/H3K27me3_AAVGFP2    -prefix $outDir7/H3K27me3_AAVGFP/AAVGFP      -venn  $outDir7/H3K27me3_AAVGFP/1-overlap.txt    -matrix  $outDir7/H3K27me3_AAVGFP/2-matrix    >>$outDir7/H3K27me3_AAVGFP/H3K27me3.runLog.txt  2>&1");                             
system("mergePeaks    -d $distance7    $inputDir/H3K27me3_KO2        $inputDir/H3K27me3_KO2        -prefix $outDir7/H3K27me3_KO/KO              -venn  $outDir7/H3K27me3_KO/1-overlap.txt        -matrix  $outDir7/H3K27me3_KO/2-matrix        >>$outDir7/H3K27me3_KO/H3K27me3.runLog.txt  2>&1");                             
system("mergePeaks    -d $distance7    $inputDir/H3K27me3_ctrl1      $inputDir/H3K27me3_ctrl2      $inputDir/H3K27me3_ctrl3    -prefix $outDir7/H3K27me3_ctrl/ctrl          -venn  $outDir7/H3K27me3_ctrl/1-overlap.txt      -matrix  $outDir7/H3K27me3_ctrl/2-matrix      >>$outDir7/H3K27me3_ctrl/H3K27me3.runLog.txt  2>&1");                             











my $distance8 = 800; 
if ( !(-e  "$outDir8/H3K27ac_AAVEED")  )   {mkdir  "$outDir8/H3K27ac_AAVEED"   or  die;  } 
if ( !(-e  "$outDir8/H3K27ac_AAVGFP")  )   {mkdir  "$outDir8/H3K27ac_AAVGFP"   or  die;  } 
if ( !(-e  "$outDir8/H3K27ac_ctrl")    )   {mkdir  "$outDir8/H3K27ac_ctrl"   or  die;  } 
if ( !(-e  "$outDir8/H3K27ac_KO")      )   {mkdir  "$outDir8/H3K27ac_KO"   or  die;  } 
if ( !(-e  "$outDir8/H3K27me3_AAVEED") )   {mkdir  "$outDir8/H3K27me3_AAVEED"   or  die;  } 
if ( !(-e  "$outDir8/H3K27me3_AAVGFP") )   {mkdir  "$outDir8/H3K27me3_AAVGFP"   or  die;  } 
if ( !(-e  "$outDir8/H3K27me3_ctrl")   )   {mkdir  "$outDir8/H3K27me3_ctrl"     or  die;  } 
if ( !(-e  "$outDir8/H3K27me3_KO")     )   {mkdir  "$outDir8/H3K27me3_KO"       or  die;  } 

system("mergePeaks    -d $distance8    $inputDir/H3K27ac_AAVEED1     $inputDir/H3K27ac_AAVEED2     -prefix $outDir8/H3K27ac_AAVEED/AAVEED       -venn  $outDir8/H3K27ac_AAVEED/1-overlap.txt     -matrix  $outDir8/H3K27ac_AAVEED/2-matrix     >>$outDir8/H3K27ac_AAVEED/H3K27ac.runLog.txt  2>&1");                             
system("mergePeaks    -d $distance8    $inputDir/H3K27ac_AAVGFP1     $inputDir/H3K27ac_AAVGFP2     -prefix $outDir8/H3K27ac_AAVGFP/AAVGFP       -venn  $outDir8/H3K27ac_AAVGFP/1-overlap.txt     -matrix  $outDir8/H3K27ac_AAVGFP/2-matrix     >>$outDir8/H3K27ac_AAVGFP/H3K27ac.runLog.txt  2>&1");                             
system("mergePeaks    -d $distance8    $inputDir/H3K27ac_ctrl1       $inputDir/H3K27ac_ctrl2       -prefix $outDir8/H3K27ac_ctrl/ctrl           -venn  $outDir8/H3K27ac_ctrl/1-overlap.txt       -matrix  $outDir8/H3K27ac_ctrl/2-matrix       >>$outDir8/H3K27ac_ctrl/H3K27ac.runLog.txt  2>&1");                             
system("mergePeaks    -d $distance8    $inputDir/H3K27ac_KO2         $inputDir/H3K27ac_KO2         -prefix $outDir8/H3K27ac_KO/KO               -venn  $outDir8/H3K27ac_KO/1-overlap.txt         -matrix  $outDir8/H3K27ac_KO/2-matrix         >>$outDir8/H3K27ac_KO/H3K27ac.runLog.txt  2>&1");                             
system("mergePeaks    -d $distance8    $inputDir/H3K27me3_AAVEED1    $inputDir/H3K27me3_AAVEED1    -prefix $outDir8/H3K27me3_AAVEED/AAVEED      -venn  $outDir8/H3K27me3_AAVEED/1-overlap.txt    -matrix  $outDir8/H3K27me3_AAVEED/2-matrix    >>$outDir8/H3K27me3_AAVEED/H3K27me3.runLog.txt  2>&1");                             
system("mergePeaks    -d $distance8    $inputDir/H3K27me3_AAVGFP1    $inputDir/H3K27me3_AAVGFP2    -prefix $outDir8/H3K27me3_AAVGFP/AAVGFP      -venn  $outDir8/H3K27me3_AAVGFP/1-overlap.txt    -matrix  $outDir8/H3K27me3_AAVGFP/2-matrix    >>$outDir8/H3K27me3_AAVGFP/H3K27me3.runLog.txt  2>&1");                             
system("mergePeaks    -d $distance8    $inputDir/H3K27me3_KO2        $inputDir/H3K27me3_KO2        -prefix $outDir8/H3K27me3_KO/KO              -venn  $outDir8/H3K27me3_KO/1-overlap.txt        -matrix  $outDir8/H3K27me3_KO/2-matrix        >>$outDir8/H3K27me3_KO/H3K27me3.runLog.txt  2>&1");                             
system("mergePeaks    -d $distance8    $inputDir/H3K27me3_ctrl1      $inputDir/H3K27me3_ctrl2      $inputDir/H3K27me3_ctrl3    -prefix $outDir8/H3K27me3_ctrl/ctrl          -venn  $outDir8/H3K27me3_ctrl/1-overlap.txt      -matrix  $outDir8/H3K27me3_ctrl/2-matrix      >>$outDir8/H3K27me3_ctrl/H3K27me3.runLog.txt  2>&1");                             








my $distance9 = 900; 
if ( !(-e  "$outDir9/H3K27ac_AAVEED")  )   {mkdir  "$outDir9/H3K27ac_AAVEED"   or  die;  } 
if ( !(-e  "$outDir9/H3K27ac_AAVGFP")  )   {mkdir  "$outDir9/H3K27ac_AAVGFP"   or  die;  } 
if ( !(-e  "$outDir9/H3K27ac_ctrl")    )   {mkdir  "$outDir9/H3K27ac_ctrl"   or  die;  } 
if ( !(-e  "$outDir9/H3K27ac_KO")      )   {mkdir  "$outDir9/H3K27ac_KO"   or  die;  } 
if ( !(-e  "$outDir9/H3K27me3_AAVEED") )   {mkdir  "$outDir9/H3K27me3_AAVEED"   or  die;  } 
if ( !(-e  "$outDir9/H3K27me3_AAVGFP") )   {mkdir  "$outDir9/H3K27me3_AAVGFP"   or  die;  } 
if ( !(-e  "$outDir9/H3K27me3_ctrl")   )   {mkdir  "$outDir9/H3K27me3_ctrl"     or  die;  } 
if ( !(-e  "$outDir9/H3K27me3_KO")     )   {mkdir  "$outDir9/H3K27me3_KO"       or  die;  } 

system("mergePeaks    -d $distance9    $inputDir/H3K27ac_AAVEED1     $inputDir/H3K27ac_AAVEED2     -prefix $outDir9/H3K27ac_AAVEED/AAVEED       -venn  $outDir9/H3K27ac_AAVEED/1-overlap.txt     -matrix  $outDir9/H3K27ac_AAVEED/2-matrix     >>$outDir9/H3K27ac_AAVEED/H3K27ac.runLog.txt  2>&1");                             
system("mergePeaks    -d $distance9    $inputDir/H3K27ac_AAVGFP1     $inputDir/H3K27ac_AAVGFP2     -prefix $outDir9/H3K27ac_AAVGFP/AAVGFP       -venn  $outDir9/H3K27ac_AAVGFP/1-overlap.txt     -matrix  $outDir9/H3K27ac_AAVGFP/2-matrix     >>$outDir9/H3K27ac_AAVGFP/H3K27ac.runLog.txt  2>&1");                             
system("mergePeaks    -d $distance9    $inputDir/H3K27ac_ctrl1       $inputDir/H3K27ac_ctrl2       -prefix $outDir9/H3K27ac_ctrl/ctrl           -venn  $outDir9/H3K27ac_ctrl/1-overlap.txt       -matrix  $outDir9/H3K27ac_ctrl/2-matrix       >>$outDir9/H3K27ac_ctrl/H3K27ac.runLog.txt  2>&1");                             
system("mergePeaks    -d $distance9    $inputDir/H3K27ac_KO2         $inputDir/H3K27ac_KO2         -prefix $outDir9/H3K27ac_KO/KO               -venn  $outDir9/H3K27ac_KO/1-overlap.txt         -matrix  $outDir9/H3K27ac_KO/2-matrix         >>$outDir9/H3K27ac_KO/H3K27ac.runLog.txt  2>&1");                             
system("mergePeaks    -d $distance9    $inputDir/H3K27me3_AAVEED1    $inputDir/H3K27me3_AAVEED1    -prefix $outDir9/H3K27me3_AAVEED/AAVEED      -venn  $outDir9/H3K27me3_AAVEED/1-overlap.txt    -matrix  $outDir9/H3K27me3_AAVEED/2-matrix    >>$outDir9/H3K27me3_AAVEED/H3K27me3.runLog.txt  2>&1");                             
system("mergePeaks    -d $distance9    $inputDir/H3K27me3_AAVGFP1    $inputDir/H3K27me3_AAVGFP2    -prefix $outDir9/H3K27me3_AAVGFP/AAVGFP      -venn  $outDir9/H3K27me3_AAVGFP/1-overlap.txt    -matrix  $outDir9/H3K27me3_AAVGFP/2-matrix    >>$outDir9/H3K27me3_AAVGFP/H3K27me3.runLog.txt  2>&1");                             
system("mergePeaks    -d $distance9    $inputDir/H3K27me3_KO2        $inputDir/H3K27me3_KO2        -prefix $outDir9/H3K27me3_KO/KO              -venn  $outDir9/H3K27me3_KO/1-overlap.txt        -matrix  $outDir9/H3K27me3_KO/2-matrix        >>$outDir9/H3K27me3_KO/H3K27me3.runLog.txt  2>&1");                             
system("mergePeaks    -d $distance9    $inputDir/H3K27me3_ctrl1      $inputDir/H3K27me3_ctrl2      $inputDir/H3K27me3_ctrl3    -prefix $outDir9/H3K27me3_ctrl/ctrl          -venn  $outDir9/H3K27me3_ctrl/1-overlap.txt      -matrix  $outDir9/H3K27me3_ctrl/2-matrix      >>$outDir9/H3K27me3_ctrl/H3K27me3.runLog.txt  2>&1");                             









my $distance10 = 1000; 
if ( !(-e  "$outDir10/H3K27ac_AAVEED")  )   {mkdir  "$outDir10/H3K27ac_AAVEED"   or  die;  } 
if ( !(-e  "$outDir10/H3K27ac_AAVGFP")  )   {mkdir  "$outDir10/H3K27ac_AAVGFP"   or  die;  } 
if ( !(-e  "$outDir10/H3K27ac_ctrl")    )   {mkdir  "$outDir10/H3K27ac_ctrl"   or  die;  } 
if ( !(-e  "$outDir10/H3K27ac_KO")      )   {mkdir  "$outDir10/H3K27ac_KO"   or  die;  } 
if ( !(-e  "$outDir10/H3K27me3_AAVEED") )   {mkdir  "$outDir10/H3K27me3_AAVEED"   or  die;  } 
if ( !(-e  "$outDir10/H3K27me3_AAVGFP") )   {mkdir  "$outDir10/H3K27me3_AAVGFP"   or  die;  } 
if ( !(-e  "$outDir10/H3K27me3_ctrl")   )   {mkdir  "$outDir10/H3K27me3_ctrl"     or  die;  } 
if ( !(-e  "$outDir10/H3K27me3_KO")     )   {mkdir  "$outDir10/H3K27me3_KO"       or  die;  } 

system("mergePeaks    -d $distance10    $inputDir/H3K27ac_AAVEED1     $inputDir/H3K27ac_AAVEED2     -prefix $outDir10/H3K27ac_AAVEED/AAVEED       -venn  $outDir10/H3K27ac_AAVEED/1-overlap.txt     -matrix  $outDir10/H3K27ac_AAVEED/2-matrix     >>$outDir10/H3K27ac_AAVEED/H3K27ac.runLog.txt  2>&1");                             
system("mergePeaks    -d $distance10    $inputDir/H3K27ac_AAVGFP1     $inputDir/H3K27ac_AAVGFP2     -prefix $outDir10/H3K27ac_AAVGFP/AAVGFP       -venn  $outDir10/H3K27ac_AAVGFP/1-overlap.txt     -matrix  $outDir10/H3K27ac_AAVGFP/2-matrix     >>$outDir10/H3K27ac_AAVGFP/H3K27ac.runLog.txt  2>&1");                             
system("mergePeaks    -d $distance10    $inputDir/H3K27ac_ctrl1       $inputDir/H3K27ac_ctrl2       -prefix $outDir10/H3K27ac_ctrl/ctrl           -venn  $outDir10/H3K27ac_ctrl/1-overlap.txt       -matrix  $outDir10/H3K27ac_ctrl/2-matrix       >>$outDir10/H3K27ac_ctrl/H3K27ac.runLog.txt  2>&1");                             
system("mergePeaks    -d $distance10    $inputDir/H3K27ac_KO2         $inputDir/H3K27ac_KO2         -prefix $outDir10/H3K27ac_KO/KO               -venn  $outDir10/H3K27ac_KO/1-overlap.txt         -matrix  $outDir10/H3K27ac_KO/2-matrix         >>$outDir10/H3K27ac_KO/H3K27ac.runLog.txt  2>&1");                             
system("mergePeaks    -d $distance10    $inputDir/H3K27me3_AAVEED1    $inputDir/H3K27me3_AAVEED1    -prefix $outDir10/H3K27me3_AAVEED/AAVEED      -venn  $outDir10/H3K27me3_AAVEED/1-overlap.txt    -matrix  $outDir10/H3K27me3_AAVEED/2-matrix    >>$outDir10/H3K27me3_AAVEED/H3K27me3.runLog.txt  2>&1");                             
system("mergePeaks    -d $distance10    $inputDir/H3K27me3_AAVGFP1    $inputDir/H3K27me3_AAVGFP2    -prefix $outDir10/H3K27me3_AAVGFP/AAVGFP      -venn  $outDir10/H3K27me3_AAVGFP/1-overlap.txt    -matrix  $outDir10/H3K27me3_AAVGFP/2-matrix    >>$outDir10/H3K27me3_AAVGFP/H3K27me3.runLog.txt  2>&1");                             
system("mergePeaks    -d $distance10    $inputDir/H3K27me3_KO2        $inputDir/H3K27me3_KO2        -prefix $outDir10/H3K27me3_KO/KO              -venn  $outDir10/H3K27me3_KO/1-overlap.txt        -matrix  $outDir10/H3K27me3_KO/2-matrix        >>$outDir10/H3K27me3_KO/H3K27me3.runLog.txt  2>&1");                             
system("mergePeaks    -d $distance10    $inputDir/H3K27me3_ctrl1      $inputDir/H3K27me3_ctrl2      $inputDir/H3K27me3_ctrl3    -prefix $outDir10/H3K27me3_ctrl/ctrl          -venn  $outDir10/H3K27me3_ctrl/1-overlap.txt      -matrix  $outDir10/H3K27me3_ctrl/2-matrix      >>$outDir10/H3K27me3_ctrl/H3K27me3.runLog.txt  2>&1");                             















my $distance11 = "given"; 
if ( !(-e  "$outDir11/H3K27ac_AAVEED")  )   {mkdir  "$outDir11/H3K27ac_AAVEED"   or  die;  } 
if ( !(-e  "$outDir11/H3K27ac_AAVGFP")  )   {mkdir  "$outDir11/H3K27ac_AAVGFP"   or  die;  } 
if ( !(-e  "$outDir11/H3K27ac_ctrl")    )   {mkdir  "$outDir11/H3K27ac_ctrl"   or  die;  } 
if ( !(-e  "$outDir11/H3K27ac_KO")      )   {mkdir  "$outDir11/H3K27ac_KO"   or  die;  } 
if ( !(-e  "$outDir11/H3K27me3_AAVEED") )   {mkdir  "$outDir11/H3K27me3_AAVEED"   or  die;  } 
if ( !(-e  "$outDir11/H3K27me3_AAVGFP") )   {mkdir  "$outDir11/H3K27me3_AAVGFP"   or  die;  } 
if ( !(-e  "$outDir11/H3K27me3_ctrl")   )   {mkdir  "$outDir11/H3K27me3_ctrl"     or  die;  } 
if ( !(-e  "$outDir11/H3K27me3_KO")     )   {mkdir  "$outDir11/H3K27me3_KO"       or  die;  } 

system("mergePeaks    -d $distance11    $inputDir/H3K27ac_AAVEED1     $inputDir/H3K27ac_AAVEED2     -prefix $outDir11/H3K27ac_AAVEED/AAVEED       -venn  $outDir11/H3K27ac_AAVEED/1-overlap.txt     -matrix  $outDir11/H3K27ac_AAVEED/2-matrix     >>$outDir11/H3K27ac_AAVEED/H3K27ac.runLog.txt  2>&1");                             
system("mergePeaks    -d $distance11    $inputDir/H3K27ac_AAVGFP1     $inputDir/H3K27ac_AAVGFP2     -prefix $outDir11/H3K27ac_AAVGFP/AAVGFP       -venn  $outDir11/H3K27ac_AAVGFP/1-overlap.txt     -matrix  $outDir11/H3K27ac_AAVGFP/2-matrix     >>$outDir11/H3K27ac_AAVGFP/H3K27ac.runLog.txt  2>&1");                             
system("mergePeaks    -d $distance11    $inputDir/H3K27ac_ctrl1       $inputDir/H3K27ac_ctrl2       -prefix $outDir11/H3K27ac_ctrl/ctrl           -venn  $outDir11/H3K27ac_ctrl/1-overlap.txt       -matrix  $outDir11/H3K27ac_ctrl/2-matrix       >>$outDir11/H3K27ac_ctrl/H3K27ac.runLog.txt  2>&1");                             
system("mergePeaks    -d $distance11    $inputDir/H3K27ac_KO2         $inputDir/H3K27ac_KO2         -prefix $outDir11/H3K27ac_KO/KO               -venn  $outDir11/H3K27ac_KO/1-overlap.txt         -matrix  $outDir11/H3K27ac_KO/2-matrix         >>$outDir11/H3K27ac_KO/H3K27ac.runLog.txt  2>&1");                             
system("mergePeaks    -d $distance11    $inputDir/H3K27me3_AAVEED1    $inputDir/H3K27me3_AAVEED1    -prefix $outDir11/H3K27me3_AAVEED/AAVEED      -venn  $outDir11/H3K27me3_AAVEED/1-overlap.txt    -matrix  $outDir11/H3K27me3_AAVEED/2-matrix    >>$outDir11/H3K27me3_AAVEED/H3K27me3.runLog.txt  2>&1");                             
system("mergePeaks    -d $distance11    $inputDir/H3K27me3_AAVGFP1    $inputDir/H3K27me3_AAVGFP2    -prefix $outDir11/H3K27me3_AAVGFP/AAVGFP      -venn  $outDir11/H3K27me3_AAVGFP/1-overlap.txt    -matrix  $outDir11/H3K27me3_AAVGFP/2-matrix    >>$outDir11/H3K27me3_AAVGFP/H3K27me3.runLog.txt  2>&1");                             
system("mergePeaks    -d $distance11    $inputDir/H3K27me3_KO2        $inputDir/H3K27me3_KO2        -prefix $outDir11/H3K27me3_KO/KO              -venn  $outDir11/H3K27me3_KO/1-overlap.txt        -matrix  $outDir11/H3K27me3_KO/2-matrix        >>$outDir11/H3K27me3_KO/H3K27me3.runLog.txt  2>&1");                             
system("mergePeaks    -d $distance11    $inputDir/H3K27me3_ctrl1      $inputDir/H3K27me3_ctrl2      $inputDir/H3K27me3_ctrl3    -prefix $outDir11/H3K27me3_ctrl/ctrl          -venn  $outDir11/H3K27me3_ctrl/1-overlap.txt      -matrix  $outDir11/H3K27me3_ctrl/2-matrix      >>$outDir11/H3K27me3_ctrl/H3K27me3.runLog.txt  2>&1");                             
























