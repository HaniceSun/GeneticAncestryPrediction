#!/usr/bin/bash

TOKEN="..."

Prefix=GenotypingStanford896S

ServerVersion=2.0.0-beta2

curl https://imputation.biodatacatalyst.nhlbi.nih.gov/api/v2/jobs/submit/imputationserver@${ServerVersion} \
  -H "X-Auth-Token: $TOKEN" \
  -F "refpanel=apps@topmed-r3" \
  -F "job-name=Stanford896S" \
  -F "population=all" \
  -F "input-phasing=eagle" \
  -F "files=@1_${Prefix}.vcf.gz" \
  -F "files=@2_${Prefix}.vcf.gz" \
  -F "files=@3_${Prefix}.vcf.gz" \
  -F "files=@4_${Prefix}.vcf.gz" \
  -F "files=@5_${Prefix}.vcf.gz" \
  -F "files=@6_${Prefix}.vcf.gz" \
  -F "files=@7_${Prefix}.vcf.gz" \
  -F "files=@8_${Prefix}.vcf.gz" \
  -F "files=@9_${Prefix}.vcf.gz" \
  -F "files=@10_${Prefix}.vcf.gz" \
  -F "files=@11_${Prefix}.vcf.gz" \
  -F "files=@12_${Prefix}.vcf.gz" \
  -F "files=@13_${Prefix}.vcf.gz" \
  -F "files=@14_${Prefix}.vcf.gz" \
  -F "files=@15_${Prefix}.vcf.gz" \
  -F "files=@16_${Prefix}.vcf.gz" \
  -F "files=@17_${Prefix}.vcf.gz" \
  -F "files=@18_${Prefix}.vcf.gz" \
  -F "files=@19_${Prefix}.vcf.gz" \
  -F "files=@20_${Prefix}.vcf.gz" \
  -F "files=@21_${Prefix}.vcf.gz" \
  -F "files=@22_${Prefix}.vcf.gz" \
