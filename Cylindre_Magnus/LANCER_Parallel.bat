@echo off

"C:\Program Files\Microsoft MPI\Bin\mpiexec.exe"  -n 4 cimlib_CFD_driver.exe  Principale.mtc 


:: ne ferme pas la fenetre
pause

