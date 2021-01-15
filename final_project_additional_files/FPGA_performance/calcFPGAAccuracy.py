
if __name__ == "__main__":

    testSamplesPred = open('test_samples_prediction.txt', 'r')
    testSamplesActual = open('test_samples_actual.txt', 'r')

    numCorrect = 0
    numTotal = 0

    while True:
        pred = testSamplesPred.readline()
        actual = testSamplesActual.readline()
        if (not pred) or pred =='': # eof reached
            break
        
        if (pred == actual):
            numCorrect += 1
        numTotal += 1

    print("Num Correct: " + str(numCorrect))
    print("Num Incorrect: " + str(numTotal-numCorrect))
    print("Total: " + str(numTotal))
    print("Acc: " + str(numCorrect / numTotal))

    testSamplesPred.close()
    testSamplesActual.close()