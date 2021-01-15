#include <stdlib.h>
#include <stdio.h>
#include "cEmbeddingNN.h"
#include "cEmbeddingSentiment.h"

#define INPUT_ADDR 0x00

// volatile float* input_layer =  INPUT_ADDR;

// replace with output messages
char output_message[8][150] = {
    "To get available flgights: https://google.com/flights",
    "To get flight times: https://google.com/flights",
    "To get flight fares: https://google.com/flights",
    "To get aircraft of particular flight: https://flightaware.com",
    "To get ground service details: https://www.supershuttle.com",
    "To get airline service data from flights: https://www.kayak.com/flights",
    "Here are all airfare codes: https://your.yale.edu/work-yale/campus-services/travel/air-travel/airfare-codes",
    "atis_quantity"
};

int main()
{
    int i;
    printf("Hello! How can I help you today?\n");
    unsigned char input_message[500];
    float input_layer[64];
    unsigned int output_layer[8];
    // while (1) {
        
        /* get input message */
        scanf("%[^\n]", input_message);

        // printf("%c", input_message[0]);

        /* fill in input layer with corresponding embedding dictionary values */
        int idx = 0;
        while (input_message[idx] != '\0' && idx < 64) {
            input_layer[idx] = embedding_nn[input_message[idx]];
            idx++;
        }
        while (idx < 64) {
            input_layer[idx] = embedding_nn[0];
            idx++;
        }

        for (i = 0; i < 64; i++) {
            printf("%lf ", input_layer[i]);
        }


        /* don't know how the pointers interface with hardware, not sure what to put here */

        // /* get the class */
        // int maxIdx = 0;
        // for (i = 1; i < 8; i++) {
        //     if (output_layer[i] > output_layer[maxIdx]) {
        //         maxIdx = i;
        //     }
        // }

        // /* print class */
        // printf("Detected Class: %s", output_message[maxIdx]);
    // }

    return 1;
}