import struct


def IEEE754(float_input):
    backward_hex = struct.pack('f', float_input).hex()
    return "".join(reversed([backward_hex[i:i+2] for i in range(0, len(backward_hex), 2)]))

# Driver Code 
if __name__ == "__main__" :

    
    sv_file = open('sentiment_nn_code.sv', 'w')

    # biases = [0.8358, -0.5326,  0.0751, -0.6437, -0.7375, -0.1737, -0.7315, -0.7818]
    biases = [-0.1999, -0.6060,  0.4805]

    with open('sentiment_weights.txt', 'r') as f:
        
        for i in range(3):
            weights = ''
            for j in range(13):
                temp = f.readline()
                temp = temp.replace(' ', '').replace('[', '').replace(']', '').replace('\r', '').replace('\n', '')
                weights += temp
            
            weights = weights[:-1]
            weights = weights.split(',')

            weights = ["32'h" + str(IEEE754(float(w))) for w in weights]

            # nn_partition p_N (.*, .W_1() ... .W_64(), .bias(), .out(O_N)) N = 1 ... 8

            nn_partition = 'nn_partition p_' + str(i+1) + ' (.*,\n'
            
            for j in range(len(weights)):
                nn_partition += '.W_' + str(j+1) + '('  + weights[j] + '), '
                if j != 0 and (j+1) % 4 == 0:
                    nn_partition += '\n'

            nn_partition += '.bias(' + "32'h" + str(IEEE754(biases[i])) + '), .out(O_' + str(i+1) + '));\n\n'
            
            sv_file.write(nn_partition)

    sv_file.close()
