//IBMUSERA JOB CLASS=A,MSGCLASS=H //*
//* Sample jcl to run batch DATDEMO  //*
//DBB     EXEC PGM=DATDEMO
//*STEPLIB  DD  DISP=SHR,DSN=DAT.DEV.LOAD     pipline Loadlib
//*STEPLIB  DD  DISP=SHR,DSN=NLOPEZ.IDZ.LOAD   IDz Loadlib
//STEPLIB  DD  DISP=SHR,DSN=IBMUSER.PIPELINE.LOAD  
//*         DD DSN=EQAE20.SEQAMOD,DISP=SHR     dbug lib
//*         DD DSN=FELE20.SFEKAUTH,DISP=SHR    dbug lib
//SYSPRINT DD SYSOUT=*
//SYSOUT   DD SYSOUT=*
//**********************************************************
//*
//*
//*
//* Debug sample jcl
//*NOTE on local zDT box start the debuger STC /s DBGMGR
//* zapp needs alloc the same file during the compile
//* dd below is needed with cob4 debug demo using TEST(SOURECE,SEP)
//**EQADEBUG DD DSN=NLOPEZ.IDZ.DEBUG(DATADEMO),DISP=SHR
//*CEEOPTS  DD *
//*  TEST(,,,TCPIP&192.168.88.113:*)
//*
//*
//* Use TEST to start the IDz debbugger Prespective
//* TEST(,,,DBMDT%NLOPEZ:)
//*
//* Or run this to generate the code coverage rpt
//*ENVAR("EQA_STARTUP_KEY=CC")
/*
//CEEDUMP  DD SYSOUT=*
//**