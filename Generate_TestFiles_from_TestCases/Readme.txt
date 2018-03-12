The run.bat script is for testers to generate .txt and .xlsx test files from input file test.txt containing a batch of designed test cases.

The sample format of the input test case:
-----------------------------------------------
@Test-Case-1
#Col1:A;Col2:B
Test-CMD -Par1 * -Par2 $True
-----------------------------------------------

The sample output:
- A Test-Case-1.txt file containg the test scripts
- A Test-Case-1.xlsx file to be filled with the expected results