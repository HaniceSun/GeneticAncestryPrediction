import gzip
import subprocess

def UpdateBimRs(inF='1000G_WGS30X_Unrelated_2504S.bim', inF2='/oak/stanford/groups/agloyn/hansun/Data/dbSNP/dbSNP155_pos2rs_GRCh38.txt.gz'): 
    D = {}
    inFile = gzip.open(inF2)
    for line in inFile:
        line = line.strip().decode()
        fields = line.split('\t')
        k = ':'.join(fields[0:4]) 
        D[k] = fields[4]
    inFile.close()

    inFile = open(inF)
    ouFile = open(inF.split('.bim')[0] + '_rs.bim', 'w')
    for line in inFile:
        line = line.strip()
        fields = line.split('\t')
        k = fields[1]
        if k.find('chr') == -1:
            k = 'chr' + k
        if k in D:
            k = D[k]
        ouFile.write('\t'.join(fields[0:1] + [k] + fields[2:]) + '\n')
    inFile.close()
    ouFile.close()

    inF3 = inF.split('.bim')[0]
    subprocess.call('ln -s %s.bed %s_rs.bed'%(inF3, inF3), shell=True)
    subprocess.call('ln -s %s.fam %s_rs.fam'%(inF3, inF3), shell=True)


UpdateBimRs()
