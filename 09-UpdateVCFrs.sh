#!/usr/bin/bash

dbSNP=/oak/stanford/groups/agloyn/hansun/Data/dbSNP/dbSNP155_GRCh38_GCF_000001405.39.vcf.bgz
bcftools annotate --threads 4 -a $dbSNP -c ID -O z GenotypingStanford896S.vcf.gz -o GenotypingStanford896S_rs.vcf.gz 
tabix -p vcf GenotypingStanford896S_rs.vcf.gz
