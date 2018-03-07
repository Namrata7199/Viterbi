# Error detection and correction using Viterbi decoding and path-metric

Task undertaken as this project is to write a MATLAB convolution (2, 1, 9) decoding with g1 = 110111 and g2 = 111011 and perform analysis of percentage error detection and correction using Viterbi Algorithm and path-metric. [Q. B-48]

## Input:

* A 4-bit dataword (1 1 0 1) is chosen as an input to the Convolutional Encoder and corresponding codeword is obtained. The length of the codeword obtained is 8.

## Algorithm:

* All the possible 1-bit errors (8 possibilities), 2-bit errors (28 possibilities) and 3-bit errors (56 possibilities) are introduced.
* Each resulting codeword is then decoded using the Viterbi Algorithm (dataword with minimum path-metric is chosen).
* The output dataword is then compared to the correct dataword.
  - If (`path-metric` != 0 and `obtained dataword` == `correct dataword`), error is detected and corrected.
  - If (`path-metric` != 0 and `obtained dataword` != `correct dataword`), error is detected but not corrected.
  - If (`path-metric` == 0 and `obtained dataword` == `correct dataword`), no error occurred.
  
## Output:

* The program calculates the Percentage Error Correction and Detection for all possible 1, 2 and 3-bit errors.
* A graph is plotted to analyse the Percentage Error Correction and Detection visually.

## How to run the program?

* The project contains two files:
  - `main.m`
  - `decoding.m` (A function called for decoding the codeword)
* While the `decoding.m` is open, run `main.m` file on MATLAB to obtain the results.

### Contributors:
__________________
* #### Namrata Ladda            (16CO121)
* #### Aditi Gupta              (16CO202)
