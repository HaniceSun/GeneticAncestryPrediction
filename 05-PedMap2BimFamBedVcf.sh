#!/usr/bin/bash
plink --merge-list ToBeMergedFileList.txt --make-bed --out GenotypingStanford896Stmp
bash GenotypingArray/update_build.sh GenotypingStanford896Stmp GenotypingArray/InfiniumOmni2-5Exome-8v1-5_A1-b37.strand GenotypingStanford896S
plink2 --bfile GenotypingStanford896S --export vcf --out GenotypingStanford896S --snps-only just-acgt
bgzip GenotypingStanford896S.vcf
tabix -p vcf GenotypingStanford896S.vcf.gz
python 06-SplitChrBgzip.py GenotypingStanford896S.vcf.gz
