       ID DIVISION.
       PROGRAM-ID. DATDEMO.
      *********************************************************
      * Notes: This is an example using lnk cards
      * This main pgms calls 2 subs. DEMOSUB and STATIC1
      * DEMOSUB in turn also calls STATIC1 to test impact and lnk
      * of a complex link process.
      * Setup requires linkEdit=false for ??? main and subs ???
      * Lnk card for main with one include of main is needed.
      * zgit
      *********************************************************
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 TEST-DATA            PIC x(80) VALUE LOW-VALUE.


       PROCEDURE DIVISION.
           DISPLAY 'datdemo here v2 mainmo'.
      *     CALL 'STATIC1'.
      *     CALL 'DEMOSUB'.
           STOP RUN.
      *
      * Test Note:
      * Reset and rescanAll to init meta via ADO.
      * Review teh json rpt to verify expected results
      * - ouptut coll has 3 items for lfile
