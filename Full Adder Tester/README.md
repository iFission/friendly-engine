PIN assignment:  
51: output a  
41: outpub b  
35: output cin

33: input s  
30: input carry

INPUTS:  
dip switch 16 controls mode: AUTO, MANUAL testing  
dip switch 17 controls test: CIRCUIT, DIP

LED 15-8 indicates which test is being run:  
15: test 1  
14: test 2

LED 7-0 indicates which tests have been run successfully:  
7: test 1  
8: test 2

LED 23-19 indicates the input (a, b, cin) and expected output (s, carry)

AUTO: automatically cycles through 8 test cases  
MANUAL: use LEFT/RIGHT button to cycle through 8 test cases

CIRCUIT: s and carry values are taken from PIN 33, 30  
DIP: s and carry values are taken from dip switch 20, 19

truth table:  
test 1: 0 0 0 | 0 0  
test 2: 0 0 1 | 1 0  
test 3: 0 1 0 | 1 0  
test 4: 0 1 1 | 0 1  
test 5: 1 0 0 | 1 0  
test 6: 1 0 1 | 0 1  
test 7: 1 1 0 | 0 1  
test 8: 1 1 1 | 1 1

AUTO, CIRCUIT test  
connect PIN 51, 41, 35, 33, 30 accordingly  
dip switch 16 = 0  
dip switch 17 = 0  
upon power on, auto cycles through 8 test cases  
if all test cases pass, all LEDs light up.

AUTO, DIP test  
dip switch 16 = 0  
dip switch 17 = 1  
upon power on, auto cycles through 8 test cases  
control dip switch 20, 19 to simulate the input from s and carry
if all test cases pass, all LEDs light up.

MANUAL, CIRCUIT test  
connect PIN 51, 41, 35, 33, 30 accordingly  
dip switch 16 = 0  
dip switch 17 = 0  
upon power on, tests test 1
use LEFT/RIGHT button to cycle through 8 test cases

AUTO, DIP test  
dip switch 16 = 0  
dip switch 17 = 1  
upon power on, auto cycles through 8 test cases  
control dip switch 20, 19 to simulate the input from s and carry
use LEFT/RIGHT button to cycle through 8 test cases
