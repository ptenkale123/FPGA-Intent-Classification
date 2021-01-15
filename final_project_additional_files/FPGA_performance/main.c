#include <stdlib.h>
#include <stdio.h>
#include "cEmbeddingDict.h"
#include "test_samples.h"

volatile float * NN_PTR = (float *) 0x00000080;

char output_message[2][100] = {
    "To find a transit route to your destination:\nhttps://maps.google.com/landing/transit/index.html", // FindConnection
    "To get departure times:\nhttps://support.google.com/maps/answer/6142130?hl=en" // DepartureTime
};

char output_intents[2][20] = {
    "FindConnection",
    "DepartureTime"
};

int user_input_mode = 0; // change to 1 if you want to take in user input, any other number for file read

int get_label_from_input(unsigned char* input_) {
    int i;
    /* fill in input layer in hardware with corresponding embedding dictionary values */
    int idx = 0;
    while (input_[idx] != '\0' && idx < 16) {
    	if (input_[idx] < 128) {
    		NN_PTR[idx] = embedding_dict[input_[idx]];
    	}
        idx++;
    }
    while (idx < 16) {
        NN_PTR[idx] = embedding_dict[0];
        idx++;
    }
    for (i = 0; i < 10000; i++);

    /* get the class */
    int maxIdx = 0;
    if (NN_PTR[17] > NN_PTR[16])
        maxIdx = 1;
    
    return maxIdx;
}

int main()
{
    unsigned char input_message[500];

    if (user_input_mode == 1) {
        // default code to take user input
        while (1) {
            printf("\nHello! How can I help you today?\n");

            // get input message
            scanf(" %[^\n]", input_message);
            printf("\n");

            // get label
            int label = get_label_from_input(input_message);

            // print message corresponding to label 
            printf("%s\n", output_message[label]);

        }
    } else {
    	int i;
    	printf("\nHello! How can I help you today?\n");

    	for (i = 0; i < TEST_SAMPLES_SIZE; i++) {
            // get label
            int label = get_label_from_input(test_samples_text[i]);
            printf("%s\n", output_intents[label]);
    	}
    }
    printf("End Program!\n");

    return 1;
}
