#!/usr/bin/env perl
use strict;
use warnings;




my $inputDir  = "14-Homer/1-TagDirectory";  
my $Homer = "14-Homer";
if (!(-e $Homer))   {mkdir $Homer    or  die; } 
 
my $Homer1 = "$Homer/2-bedgraph";
if (!(-e $Homer1))   {mkdir $Homer1    or  die; } 





    
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


opendir(my $dir_handle, "$inputDir/run1") or die;  
my @file_names = readdir($dir_handle);      
for(my $i=0; $i<=$#file_names; $i++) {
    next unless $file_names[$i] !~ m/^[.]/;
    next unless $file_names[$i] !~ m/[~]$/;
    if( -d   "$inputDir/run1/$file_names[$i]" ) {
        my $temp = $file_names[$i];
        system(`makeUCSCfile   $inputDir/run1/$temp   -tbp 1    -norm 1e7      -style chipseq     -o  $outputDir1/$temp.bedgraph       >>$outputDir1/$temp.log.txt 2>&1`);  
        system(`makeUCSCfile   $inputDir/run2/$temp   -tbp 1    -norm 1e7      -style chipseq     -o  $outputDir2/$temp.bedgraph       >>$outputDir2/$temp.log.txt 2>&1`);  
        system(`makeUCSCfile   $inputDir/run3/$temp   -tbp 1    -norm 1e7      -style chipseq     -o  $outputDir3/$temp.bedgraph       >>$outputDir3/$temp.log.txt 2>&1`);  
        system(`makeUCSCfile   $inputDir/run4/$temp   -tbp 1    -norm 1e7      -style chipseq     -o  $outputDir4/$temp.bedgraph       >>$outputDir4/$temp.log.txt 2>&1`);  
        system(`makeUCSCfile   $inputDir/run5/$temp   -tbp 1    -norm 1e7      -style chipseq     -o  $outputDir5/$temp.bedgraph       >>$outputDir5/$temp.log.txt 2>&1`);  
    }
}







#$filename = '/path/to/your/file.doc';
# $directoryname = '/path/to/your/directory';
# if (-f $filename) {
# print "This is a file.";
# }
# if (-d $directoryname) {
# print "This is a directory.";
# } 












