//NLOPEZ1Z JOB CLASS=A,MSGCLASS=H,NOTIFY=NLOPEZ,MSGLEVEL=(1,1)
//*   crnl zgit
//* Sample jcl to run batch datmain.pli sample
//*
//DBB     EXEC PGM=DATMAIN
//STEPLIB  DD  DISP=SHR,DSN=ZDEV.MAIN.LOAD
//*STEPLIB  DD  DISP=SHR,DSN=IBMUSER.VSCODE.LOAD
//*STEPLIB  DD  DISP=SHR,DSN=IBMUSER.PIPELINE.LOAD
//SYSPRINT DD SYSOUT=*
//SYSOUT   DD SYSOUT=*
//**********************************************************
