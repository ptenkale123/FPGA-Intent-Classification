#include <stdlib.h>
#include <stdio.h>
#include "cEmbeddingDict.h"


volatile float * NN_PTR = (float *) 0x00000080;

// replace with output messages
char output_message[2][100] = {
    "To find a transit route to your destination:\nhttps://maps.google.com/landing/transit/index.html", // FindConnection
    "To get departure times:\nhttps://support.google.com/maps/answer/6142130?hl=en" // DepartureTime
};

int main()
{
    int i;
    unsigned char input_message[500];
    while (1) {

        printf("\nHello! How can I help you today?\n");
        
        /* get input message */
        scanf(" %[^\n]", input_message);
        printf("\n");

        /* fill in input layer in hardware with corresponding embedding dictionary values */
        int idx = 0;
        while (input_message[idx] != '\0' && idx < 16) {
            NN_PTR[idx] = embedding_dict[input_message[idx]];
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

        /* print class */
        printf("%s", output_message[maxIdx]);
        printf("\n");
    }

    return 1;
}