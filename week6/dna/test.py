import sys
import csv

if len(sys.argv) < 3:
    print('Too few arguments')
elif len(sys.argv) > 3:
    print('Too many arguments')
else:
    arg1 = sys.argv[1]
    #csvFileSplit = arg1.split("/")
    #csvFile = csvFileSplit[1]

    arg2 = sys.argv[2]
    #sampleDNASplit = arg2.split("/")
    #sampleDNA = sampleDNASplit[1]


# TODO: Read database file into a variable

with open(arg1, mode = 'r') as file:
    csvContent = csv.reader(file)
    for lines in csvContent:
        print(lines)

dnaSequence = open(arg2, 'r')
print(dnaSequence.read())
