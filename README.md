# Extended-precision-in-Delphi
Modifying files in Delphi library to compile with Extended Precision
In my previous repository I made a calculator to convert floating point values in ten bytes FPU format, into the real number the represent and vice versa.
To do this, I made a FPU asm code to replace the code after compiling the calculator Delphi program, because Windows programs work inside with extended precision (80 bits), but only present data in doubled precision (64 bits). Extended precision woks with data until 18 decimal digits, and I have gotten even one more 19!
In this repository a have modified the files Delphi uses to compile the function FloatToStr (convert a floating valaue in a string) to get the maximum possible precision.
In my old delphi from 2006 ( Version 10.0.2558.35231 ) the file is: "C:\Program Files (x86)\Delphi 10\lib\SysUtils.dcu"
In my new versión (Delphi 10.4 Version 27.0.40680.4203 ) the file is located in: "C:\Program Files (x86)\Embarcadero\Studio\21.0\lib\win32\release\System.SysUtils.dcu"
in both files the bytes we have to change are the same. you can find them in the file: BytestToModify.txt
The offset may vary in other versions, and the files my have other (similar) name ann have a different path, but the procedure is the same: find the bytes and repace them with the new ones.
There is another txt file comenting the FPU code: FPUcodeToGetExtendedPrecision.txt
And other one comparing the tow codes, the original and the new one : CodeComparation.pdf
The files in the Repository (SysUtils.dcu and System.SysUtils.dcu), are already changed to the new version to compile programs showing data in up to 19 decimal digits.
