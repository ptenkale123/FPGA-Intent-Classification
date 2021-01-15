import json

if __name__ == "__main__":

    maxSentenceLen = -1
    dataSetLen = 0

    with open('atis.json', 'r', encoding='utf-8') as f:
        data = json.load(f)
        for sentence in data['sentences']:
            if (not sentence['training']):
                dataSetLen += 1
                if (maxSentenceLen < len(sentence['text'])):
                    maxSentenceLen = len(sentence['text'])

    testSamplesH = open('test_samples.h', 'w')
    testSampleResult = open('test_samples_actual.txt', 'w')

    testSamplesH.write('unsigned char test_samples_text['+str(dataSetLen)+']['+str(maxSentenceLen+10)+'] = {\n')

    with open('atis.json', 'r', encoding='utf-8') as f:
        data = json.load(f)
        for sentence in data['sentences']:
            if (not sentence['training']):
                testSamplesH.write('\t"'+str(sentence['text'])+'",\n')
                testSampleResult.write(sentence['intent']+'\n')

    testSamplesH.write('};')
    testSamplesH.close()
    testSampleResult.close()
