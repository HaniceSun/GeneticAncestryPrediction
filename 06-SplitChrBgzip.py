import subprocess
import sys

def SplitChrBgzip(inF, CH=[str(x) for x in range(1, 23)] + ['X', 'Y', 'MT']):
    for ch in CH:
        ouF = ch + '_' + inF
        subprocess.call('bcftools view -r %s %s |bgzip > %s'%(ch, inF, ouF), shell=True)

SplitChrBgzip(sys.argv[1])
