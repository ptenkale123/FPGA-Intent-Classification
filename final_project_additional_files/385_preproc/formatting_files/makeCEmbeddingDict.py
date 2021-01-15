
# global constants to define name
nameOfCFileWrite = '../cEmbeddingNN.h'
nameOfEmbeddingFileRead = 'embeddingNN.txt'

nameOfEmbeddingDict = 'embedding_nn'
embeddingDictLen = 128

if __name__ == "__main__":
    cFile = open(nameOfCFileWrite, 'w')
    # write 'float embedding_dict_name[embeddingDictLen] = {'
    cFile.write('float ' + nameOfEmbeddingDict + '['+str(embeddingDictLen)+'] = {\n')
    with open(nameOfEmbeddingFileRead, 'r') as f:
        # write to file
        for line in f:
            # get substring between '[' and ']'
            firstBracketIdx = 0
            for c in line:
                if (c == '['):
                    break
                firstBracketIdx += 1
            secondBracketIdx = firstBracketIdx+1
            for i in range(secondBracketIdx, len(line)):
                if (line[i] == ']'):
                    secondBracketIdx = i
                    break
            numSubStr = line[(firstBracketIdx+1):secondBracketIdx]
            if (numSubStr == ''):
                continue
            # write '    embeddingValue,\n'
            cFile.write('\t'+str(float(numSubStr))+',\n')

    cFile.write('};') 

    cFile.close()
