       ID DIVISION.
      * model adov1 active 
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
           DISPLAY 'DATBATCH.CBL: ADOV1 DEMO v4.'  
           DISPLAY 'DATDEPND.CPY: WS-VER    =' WS-VER. 
           DISPLAY 'DATEMBED.CPY: EMBED-VER =' EMBED-VER.

           PERFORM VARYING num1 FROM 0 BY 1 UNTIL num1 > num2
                IF num1 > 2  THEN
                    perform show_num1
                END-IF
           END-PERFORM.
           STOP RUN.
      *
       show_num1.
           display 'LOOPING: The Value of num1=' num1.
         
