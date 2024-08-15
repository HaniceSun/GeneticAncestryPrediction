#!/usr/bin/bash

VCFs="CCDG_14151_B01_GRM_WGS_2020-08-05_chr1.filtered.shapeit2-duohmm-phased.vcf.gz CCDG_14151_B01_GRM_WGS_2020-08-05_chr2.filtered.shapeit2-duohmm-phased.vcf.gz CCDG_14151_B01_GRM_WGS_2020-08-05_chr3.filtered.shapeit2-duohmm-phased.vcf.gz CCDG_14151_B01_GRM_WGS_2020-08-05_chr4.filtered.shapeit2-duohmm-phased.vcf.gz CCDG_14151_B01_GRM_WGS_2020-08-05_chr5.filtered.shapeit2-duohmm-phased.vcf.gz CCDG_14151_B01_GRM_WGS_2020-08-05_chr6.filtered.shapeit2-duohmm-phased.vcf.gz CCDG_14151_B01_GRM_WGS_2020-08-05_chr7.filtered.shapeit2-duohmm-phased.vcf.gz CCDG_14151_B01_GRM_WGS_2020-08-05_chr8.filtered.shapeit2-duohmm-phased.vcf.gz CCDG_14151_B01_GRM_WGS_2020-08-05_chr9.filtered.shapeit2-duohmm-phased.vcf.gz CCDG_14151_B01_GRM_WGS_2020-08-05_chr10.filtered.shapeit2-duohmm-phased.vcf.gz CCDG_14151_B01_GRM_WGS_2020-08-05_chr11.filtered.shapeit2-duohmm-phased.vcf.gz CCDG_14151_B01_GRM_WGS_2020-08-05_chr12.filtered.shapeit2-duohmm-phased.vcf.gz CCDG_14151_B01_GRM_WGS_2020-08-05_chr13.filtered.shapeit2-duohmm-phased.vcf.gz CCDG_14151_B01_GRM_WGS_2020-08-05_chr14.filtered.shapeit2-duohmm-phased.vcf.gz CCDG_14151_B01_GRM_WGS_2020-08-05_chr15.filtered.shapeit2-duohmm-phased.vcf.gz CCDG_14151_B01_GRM_WGS_2020-08-05_chr16.filtered.shapeit2-duohmm-phased.vcf.gz CCDG_14151_B01_GRM_WGS_2020-08-05_chr17.filtered.shapeit2-duohmm-phased.vcf.gz CCDG_14151_B01_GRM_WGS_2020-08-05_chr18.filtered.shapeit2-duohmm-phased.vcf.gz CCDG_14151_B01_GRM_WGS_2020-08-05_chr19.filtered.shapeit2-duohmm-phased.vcf.gz CCDG_14151_B01_GRM_WGS_2020-08-05_chr20.filtered.shapeit2-duohmm-phased.vcf.gz CCDG_14151_B01_GRM_WGS_2020-08-05_chr21.filtered.shapeit2-duohmm-phased.vcf.gz CCDG_14151_B01_GRM_WGS_2020-08-05_chr22.filtered.shapeit2-duohmm-phased.vcf.gz"


ouF=1000G_WGS30X_3202S

ouF2=1000G_WGS30X_Unrelated_2504S

bcftools concat $VCFs --threads 4 -O z -o ${ouF}.vcf.gz

plink2 --vcf ${ouF}.vcf.gz --make-bed --out $ouF

plink --bfile $ouF --make-bed --keep-allele-order --keep 1000G_UnrelatedSamples_2504S_fam.txt --out $ouF2

tabix -p vcf ${ouF}.vcf.gz
