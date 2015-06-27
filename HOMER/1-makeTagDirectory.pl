#!/usr/bin/env perl
use strict;
use warnings;




my $inputDir  = "5-otherFormats";  
my $Homer = "14-Homer";
if (!(-e $Homer))   {mkdir $Homer    or  die; } 
 
my $Homer1 = "$Homer/1-TagDirectory";
if (!(-e $Homer1))   {mkdir $Homer1    or  die; } 




{##
    
my $outputDir1 = "$Homer1/run1";
if (!(-e $outputDir1))   {mkdir $outputDir1    or  die; } 

my $outputDir2 = "$Homer1/run2";
if (!(-e $outputDir2))   {mkdir $outputDir2    or  die; } 

my $outputDir3 = "$Homer1/run3";
if (!(-e $outputDir3))   {mkdir $outputDir3    or  die; } 

my $outputDir4 = "$Homer1/run4";
if (!(-e $outputDir4))   {mkdir $outputDir4    or  die; } 

my $outputDir5 = "$Homer1/run5";
if (!(-e $outputDir5))   {mkdir $outputDir5    or  die; } 


opendir(my $dir_handle, $inputDir) or die;  #打开目录句柄。
my @file_names = readdir($dir_handle);      #读取目录里的文件名。读取的仅仅是文件名称，不含路径。


for(my $i=0; $i<=$#file_names; $i++) {
    if($file_names[$i] =~ m/\.bed$/) {
        my $temp = $file_names[$i];
        $temp =~ s/\.bed$//  or  die;
        system(`makeTagDirectory   $outputDir1/$temp/      $inputDir/$file_names[$i]                        -format bed           >>$outputDir1/$temp.log.txt 2>&1`);  
        system(`makeTagDirectory   $outputDir2/$temp/      $inputDir/$file_names[$i]                        -format bed  -tbp 1   >>$outputDir2/$temp.log.txt 2>&1`);  
        system(`makeTagDirectory   $outputDir3/$temp/      $inputDir/$file_names[$i]     -fragLength 200    -format bed           >>$outputDir3/$temp.log.txt 2>&1`);  
        system(`makeTagDirectory   $outputDir4/$temp/      $inputDir/$file_names[$i]     -fragLength 200    -format bed  -tbp 1   >>$outputDir4/$temp.log.txt 2>&1`);  
        system(`makeTagDirectory   $outputDir5/$temp/      $inputDir/$file_names[$i]  -genome mm9 -checkGC  -format bed  -tbp 1   >>$outputDir5/$temp.log.txt 2>&1`);  
    }
}
}##



















