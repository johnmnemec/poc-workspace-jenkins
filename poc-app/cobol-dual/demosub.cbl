       ID DIVISION.
       PROGRAM-ID. DEMOSUB.
      * Test sample static call with DATBATCH
      * And lnk card 
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 MYDATA              PIC X(1).
       01 MYDATA2             PIC X(1).
       PROCEDURE DIVISION.          
           DISPLAY 'DemoSub In DUAL mode - test lnk scan test v7'.
      * Add a level 2 sub to test impact. 
      * a chg to static1 should trigger a rebuuld of datbatch.      
      *    CALL 'STATIC1'.