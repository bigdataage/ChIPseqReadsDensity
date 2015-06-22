import sys, os, re
import numpy, math
import HTSeq




#####################################################################################################################################################################
if len(sys.argv)!= 9:
    print ("The parameter number is wrong!!! (#1)")
    raise SystemExit (1)

if ( ( re.search("^\S+\.py$",     sys.argv[0]) ) and \
     ( re.search("^-bamFile$",    sys.argv[1]) ) and \
     ( re.search("^\S+$",         sys.argv[2]) ) and \
     ( re.search("^-inputFile$",  sys.argv[3]) ) and \
     ( re.search("^\S+$",         sys.argv[4]) ) and \
     ( re.search("^-fragSize$",   sys.argv[5]) ) and \
     ( re.search("^\d+$",         sys.argv[6]) ) and \
     ( re.search("^-outputFile$", sys.argv[7]) ) and \
     ( re.search("^\S+$",         sys.argv[8]) ) ): 
    pass
else:
    print ("The parameters are wrong!!! (#2)")
    raise SystemExit(1)

bamFile    = str(sys.argv[2]);  # sequencing reads
inputFile  = str(sys.argv[4]);  # DNA regions
fragSize   = int(sys.argv[6]);  # fragment size
outputFile = str(sys.argv[8]);  # reads density

## example:       python  12_HTSeq_BED_Full.py     -bamFile 5-unique/day0_rep1.bam     -inputFile up.bed      -fragSize  200      -outputFile  7-HTSeq/day0_rep1
#####################################################################################################################################################################




###########################################
def  addBin(array1, binLen):
    binNum = math.ceil( float(len(array1)) / float(binLen) )   ## NOT math.floor
    binNum = int(binNum)
    array2 = numpy.zeros( binNum, dtype='float64' ) 
    for i in range(0, binNum):
        n1 = binLen*i
        n2 = binLen*(i+1) 
        if(n2 > len(array1)):
            n2 = len(array1)
        array2[i] = sum(array1[n1:n2]) / float(n2-n1) 
    return array2        
###########################################



readsNum = 0
bamFile  = HTSeq.BAM_Reader(bamFile )  
coverage = HTSeq.GenomicArray( "auto", stranded=False, typecode="i" )   
for oneRead in bamFile: 
    if  (oneRead.aligned) and (oneRead.iv.start > fragSize) :
        readsNum = readsNum + 1
        oneRead.iv.length = fragSize
        coverage[ oneRead.iv ] += 1
fOut0 = open(outputFile+".log.txt",  'w')
fOut0.write( inputFile + ":\t" + str(readsNum) + "\n" )
fOut0.close()

halfWidth = 5000
normalizeFactor = float(10**7)/float(readsNum)
binLength = 20

output1 = outputFile + ".readsDensity"
fOut1 = open(output1,  'w')

for line in open( inputFile ):  
    fields = line.split( "\t" )    ## chr1	14298280	14302280	+	NM_010164	Eya1	4000
    chromosome = str(fields[0])
    startSite  = int(fields[1])
    endSite    = int(fields[2])
    regisonID  = str(fields[4])
    midSite    =    ( int(fields[1]) + int(fields[2]) )/2        
    startSite2 =  midSite - halfWidth/2
    endSite2   =  midSite + halfWidth/2
    window1 = HTSeq.GenomicInterval( chromosome,  startSite2,  endSite2, "." )
    wincvg1 = numpy.fromiter( coverage[window1], dtype='float64' )
    profile1 = wincvg1 
    fOut1.write( regisonID + "\t" + chromosome  + "\t" + str(startSite2)  + "\t" + str(endSite2)   )
    profile1a = addBin(profile1, binLength) * normalizeFactor
    for i in range(0,len(profile1a)):
        fOut1.write("\t" + str(profile1a[i]))
    fOut1.write("\n")
    
fOut1.close()









