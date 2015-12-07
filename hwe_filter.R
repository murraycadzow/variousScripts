# A script to perform multiple testing correction on .hwe file created from using the --hardy option in plink
# Reads in hwe file, performs correction and writes out a list of SNPs that are adjusted_p < 0.05
#
#
# Murray Cadzow
# University of Otago
# Dec 2015
#
args<-commandArgs(TRUE)
# args[1] = input file
# args[2] = output directory or output file prefix
# args[3] = correction method
p = read.table(args[1], header=TRUE, stringsAsFactors = F)
p$P_adjust = p.adjust(p$P, method = args[3])
p <- na.omit(p)
write.table(file=paste0(args[2],'hardy_exclude.txt'), x = p[p$P_adjust < 0.05, 2], quote=FALSE, sep="\t", col.names=FALSE, row.names=FALSE)
