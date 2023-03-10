        ??  ??                  ?  (   A Y U D A   ??d     0 
        {\rtf1\ansi\ansicpg1252\deff0\nouicompat\deftab709{\fonttbl{\f0\froman\fprq2\fcharset0 Liberation Serif;}{\f1\froman\fprq2\fcharset0 Segoe UI;}{\f2\fnil\fcharset0 arial;}{\f3\froman\fprq2\fcharset0 arial;}{\f4\froman\fprq2\fcharset0 Arial;}{\f5\fnil\fcharset0 Arial;}}
{\colortbl ;\red255\green255\blue255;\red0\green77\blue187;\red0\green0\blue0;\red255\green0\blue0;\red0\green176\blue80;\red0\green0\blue255;}
{\*\generator Riched20 10.0.22621}\viewkind4\uc1 
\pard\nowidctlpar\hyphpar0\widctlpar\li568\ri1266\sl276\slmult1\tx8236\cf1\f0\fs24\lang10    \~\cf2\kerning1\b\f1\fs32\lang3082 Introduction\cf1\kerning0\b0\f2\fs52\lang10 Ayuda del \kerning1\f3\lang3082\par

\pard\nowidctlpar\hyphpar0\widctlpar\li568\ri1266\sl276\slmult1\qj\tx8236\cf3\f4\fs20\par

\pard\hyphpar0\widctlpar\fi-568\li568\fs22\tab In floating-point format, the floor of the formula \b d = log(2^b) \b0 represents the precision, where \b d\b0  is the number of digits of precision, \b log\b0  is the logarithm in base \b 10\b0 , and \b b\b0  is the number of bits used to obtain the decimal part of the mantissa (also called significand). Therefore, \cf4 double precision \cf3 (\b 52\b0  bits used to obtain significand) gives approximately \b 15\b0  significant digits of precision, and \cf4 extended\cf3  (\b 63\b0  bits used to obtain significand) gives around 18.\fs20\tab\par
\par
\tab\cf0\f5\fs22\lang1033 Today's PCs work in \cf4 extended precision \cf0 for calculations but only present data in \cf4 double precision.\par
\cf0\par
\tab In Delphi, the function "\cf4 FloatToStr\cf0 " is used to transform a real number into a string for display and is limited \cf4 to double precision \cf0 by software.\par
\par

\pard\hyphpar0\widctlpar\li568 The code to compile the \cf4 FloatToStr \cf0 function is in the file "\cf4 SysUtils.dcu\cf0 " (or a similar file, depending on the Delphi version). If the program calls this function, you must include the library in the "\cf4 Uses\cf0 " section. After compilation, the code of the function will be included in the executable file.\par
\par

\pard\hyphpar0\widctlpar\fi-568\li568\tab The purpose of this utility patch is to search for the code used in the \cf4 FloatToStr \cf0 function and, if found, replace it with a new code in three different blocks, allowing the data to be displayed in even more than \cf4 extended precision\cf0 , with up to \b 20 \b0 digits.\par
\par

\pard\hyphpar0\widctlpar\fi-710\li710\ri272           You can use the patch to change an executable Delphi file (exe) to display data in \par
\tab\cf4 extended precision\cf0 , or you can force Delphi to compile with this advantage if you patch the "\cf4 SysUtils.dcu\cf0 " file, the choice is yours!\par
\par
\par
\tab   \cf2\b\f1\fs32\lang3082 How to use it\par
\par
       \cf0\b0\f5\fs22 With the "\b Open File\b0 " button, you must locate the file whose code you want to change. If the chosen file contains the bytes for the \cf4 FloatToStr \cf0 function (because it was compiled with the \cf4 SysUtils \cf0 library in the "\cf4 Uses\cf0 " section) or if it is the original \cf4 SysUtils.dcu \cf0 library, you will see the message "\cf5\b BYTES FOUND\cf0 !!". \b0  . The "\b Save\b0 " buttons will then become active,along with the offsets for the bytes that need to be changed when passing the mouse over the buttons.You can choose between save the new code to obtain the maximun amount of significant digits or a slightly lower (2 less), but rounded. When you click on it, you can choose a name and location for the new file. \par
\par
\tab If the bytes are not found, the message "\cf4\b BYTES NOT FOUND\cf0\b0 !" will be displayed. it can be for one of these reaons:\par
\par
\tab -The file is not a compliled Delphi file\par
\tab - The file is a compiled Delphi file, but it was compiled without the \cf4 SysUtil \cf0 library\par
\tab - Teh file is already patched\par
\par
\tab\par
\lang1033\par
\par

\pard\hyphpar0\widctlpar\fi-568\li568\tab  The Delphi project code, and extensive explanation can be found at:\par

\pard\hyphpar0\widctlpar\par

\pard\hyphpar0\widctlpar\fi-568\li568\b\f0\fs24\tab   {{\field{\*\fldinst{HYPERLINK https://github.com/GutiSoftware/Extended-precision-in-Delphi }}{\fldrslt{https://github.com/GutiSoftware/Extended-precision-in-Delphi\ul0\cf0}}}}\f0\fs24\par

\pard\hyphpar0\widctlpar\b0\par

\pard\hyphpar0\widctlpar\fi-568\li568            You can mail me for any doubt in: \b GutiSoft@proton.me\b0\par

\pard\nowidctlpar\hyphpar0\widctlpar\li568\ri1266\sa140\sl276\slmult1\qj\tx8236\f4\fs20\lang3082  \par
\cf3\fs24         \fs28 GutiSoft\line       \fs22 January 2023\cf0\fs24\par

\pard\ri1266\sa140\sl276\slmult1\tx8236\line\kerning0\f0\lang10\par
}
  