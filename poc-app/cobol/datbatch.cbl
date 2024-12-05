       ID DIVISION.
      * steplib IBMUSER.JENKINS.LOAD  for pipeline 
      * steplib IBMUSER.VSCODE.LOAD  for vsCode Build 
       PROGRAM-ID. DATBATCH.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WK-AREA1.       
          05  num1         PIC 9(3) value is 0.
          05  num2         PIC S9(3) value is -1.
       COPY DATDEPND.
      *
       PROCEDURE DIVISION.
           DISPLAY 'DATBATCH.CBL: John Demo Again'  

           STOP RUN.                                                  
                                                                      