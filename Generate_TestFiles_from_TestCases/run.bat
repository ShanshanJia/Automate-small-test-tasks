@echo off & setlocal enabledelayedexpansion
for /f "tokens=*" %%i in (test.txt) do (
	set "line=%%i"
	rem Identify each test case definiation lines starting with @
	if "!line:~0,1!"=="@" (
		rem Create empty txt and excel test files titled the test case defination
		set filename=!line:~1!
		copy template.xlsx !filename!.xlsx
		type nul>!filename!.txt
	rem Write test scripts to correspongding txt test file
	) else ( 
		echo !line!>>!filename!.txt
	)
)