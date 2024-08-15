def SamplePopulation(inF, inF2, ouF):
    ouFile = open(ouF, 'w')
    ouFile2 = open(ouF.split('.txt')[0] + '_fam.txt', 'w')
    D = {}
    inFile = open(inF2)
    for line in inFile:
        line = line.strip()
        if line[0] != '#':
            fields = line.split('\t')
            D[fields[9].strip()] = True
    inFile.close()

    print(len(D))
    inFile = open(inF)
    head = inFile.readline().strip()
    ouFile.write(head + '\n')
    for line in inFile:
        line = line.strip()
        fields = line.split()
        if fields[1] in D:
            ouFile.write(line + '\n')
            ouFile2.write('0 ' + fields[1] + '\n')
    inFile.close()
    ouFile.close()
    ouFile2.close()


SamplePopulation('20130606_g1k_3202_samples_ped_population.txt', '1000G_2504_high_coverage.sequence.index', '1000G_UnrelatedSamples_2504S.txt')
SamplePopulation('20130606_g1k_3202_samples_ped_population.txt', '1000G_698_related_high_coverage.sequence.index', '1000G_RelatedSamples_698S.txt')
