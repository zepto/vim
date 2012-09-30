" Vim syntax file
" Language:    FreeBasic
" Maintainer:  Mark Manning <markem@sim1.us>
" Updated:     03/02/2009 by Romel Anthony S. Bismonte
"              <math_wizard44@hotmail.com>
"
" Description:
"
"	Based originally on the work done by Allan Kelly <Allan.Kelly@ed.ac.uk>
"	Updated by Mark Manning <markem@sim1.us>
"	Applied FreeBasic support to the already excellent support
"	for standard basic syntax (like QB).
"
"	First version based on Micro$soft QBASIC circa
"	1989, as documented in 'Learn BASIC Now' by
"	Halvorson&Rygmyr. Microsoft Press 1989.  This syntax file
"	not a complete implementation yet.  Send suggestions to
"	the maintainer.
"
"	Added the new keywords as of FreeBASIC 0.20 (from the wiki) --RASB
"
"	Quit when a (custom) syntax file was already loaded (Taken from c.vim)
"
if exists("b:current_syntax")
  finish
endif
"
"	Be sure to turn on the "case ignore" since current versions
"	of freebasic support both upper as well as lowercase
"	letters. - MEM 10/1/2006
"
syn case ignore
"
"	This list of keywords is taken directly from the FreeBasic
"	user's guide as presented by the FreeBasic online site.
"
syn keyword	freebasicArrays			ERASE LBOUND REDIM PRESERVE UBOUND

" syn match	freebasicAssignment		"\<(&\|+\|-\|*\|/\|\\\|\^\|)=\>"
" syn match	freebasicAssignment		"\<(AND\|EQV\|IMP\|OR\|XOR\|SHL\|SHR\)=\>"
syn keyword	freebasicAssignment		= &= += -= *= /= \= ^= MOD=
syn keyword	freebasicAssignment		AND= EQV= IMP= OR= XOR= SHL= SHR=

syn keyword	freebasicBitManipulation	BIT BITRESET BITSET HIBYTE HIWORD LOBYTE LOWORD SHL SHR

syn keyword	freebasicCompilerSwitches	DEFBYTE DEFDBL DEFINT DEFLNG DEFLONGINT DEFSHORT DEFSNG DEFSTR
syn keyword	freebasicCompilerSwitches	DEFUBYTE DEFUINT DEFULONGINT DEFUSHORT
syn match	freebasicCompilerSwitches	"\<option\s+\(BASE\|BYVAL\|DYNAMIC\|ESCAPE\|EXPLICIT\|NOKEYWORD\)\>"
syn match	freebasicCompilerSwitches	"\<option\s+\(PRIVATE\|STATIC\)\>"
syn match	freebasicCompilerSwitches	"\<option\s+\(GOSUB\|NOGOSUB\)\>"

syn region	freebasicConditional		start="\son\s+" skip=".*" end="gosub"
syn region	freebasicConditional		start="\son\s+" skip=".*" end="goto"
syn match	freebasicConditional		"\<select\s+case\>"
syn keyword	freebasicConditional		if iif then case else elseif with endif

syn match	freebasicConsole		"\<open\s+\(CONS\|ERR\|PIPE\|SCRN\)\>"
syn match	freebasicConsole		"\<print\s+using\>"
syn keyword	freebasicConsole		BEEP CLS CSRLIN LOCATE PRINT POS SPC TAB VIEW WIDTH

syn keyword	freebasicDataTypes		BYTE AS DIM CONST DOUBLE ENUM INTEGER LONG LONGINT SHARED SHORT STRING
syn keyword	freebasicDataTypes		SINGLE TYPE UBYTE UINTEGER ULONGINT UNION UNSIGNED USHORT WSTRING ZSTRING
syn keyword	freebasicDataTypesi		ULONG VAR WITH

syn keyword	freebasicDateTime		DATE DATEADD DATEDIFF DATEPART DATESERIAL DATEVALUE DAY HOUR MINUTE
syn keyword	freebasicDateTime		MONTH MONTHNAME NOW SECOND SETDATE SETTIME TIME TIMESERIAL TIMEVALUE
syn keyword	freebasicDateTime		TIMER YEAR WEEKDAY WEEKDAYNAME ISDATE

syn keyword	freebasicDebug			ASSERT ASSERTWARN STOP

syn keyword	freebasicErrorHandling		ERFN ERMN ERR ERL ERROR LOCAL RESUME
syn match	freebasicErrorHandling		"\<resume\s+next\>"
syn match	freebasicErrorHandling		"\<on\s+error\>"

syn match	freebasicFiles			"\<get\s+#\>"
syn match	freebasicFiles			"\<input\s+#\>"
syn match	freebasicFiles			"\<line\s+input\s+#\>"
syn match	freebasicFiles			"\<print\s+#\>"
syn match	freebasicFiles			"\<print\s+using\s+#\>"
syn match	freebasicFiles			"\<put\s+#\>"
syn keyword	freebasicFiles			ACCESS APPEND BINARY BLOAD BSAVE CLOSE ENCODING EOF FREEFILE INPUT LOC
syn keyword	freebasicFiles			LOCK LOF OPEN OUTPUT RANDOM READ RESET SEEK UNLOCK WRITE

syn keyword	freebasicFunctions		ALIAS ANY BYREF BYVAL CALL CDECL CONST CONSTRUCTOR DESTRUCTOR
syn keyword	freebasicFunctions		DECLARE FUNCTION LIB NAKED OPERATOR OVERLOAD PASCAL STATIC SUB STDCALL
syn keyword	freebasicFunctions		PRIVATE PUBLIC PROTECTED PROPERTY THIS VA_ARG VA_FIRST VA_NEXT ...

syn match	freebasicGraphics		"\<palette\s+get\>"
syn match	freebasicGraphics		"\<draw\s+string\>"
syn keyword	freebasicGraphics		ADD ALPHA CIRCLE CLS COLOR CUSTOM DRAW FLIP GET IMAGECONVERTROW
syn keyword	freebasicGraphics		IMAGECREATE IMAGEDESTROY IMAGEINFO LINE PAINT PALETTE PCOPY PMAP POINT
syn keyword	freebasicGraphics		PRESET PSET PUT RGB RGBA SCREEN SCREENCONTROL SCREENCOPY SCREENINFO
syn keyword	freebasicGraphics		SCREENGLPROC SCREENLIST SCREENLOCK SCREENPTR SCREENRES SCREENSET
syn keyword	freebasicGraphics		SCREENSYNC SCREENUNLOCK TRANS VIEW WINDOW

syn match	freebasicHardware		"\<open\s+com\>"
syn match	freebasicHardware		"\<open\s+lpt\>"
syn keyword	freebasicHardware		INP OUT WAIT LPT LPOS LPRINT

syn keyword	freebasicLogical		AND EQV IMP OR NOT XOR

syn keyword	freebasicMath			ABS ACOS ASIN ATAN2 ATN COS EXP FIX FRAC INT LOG MOD RANDOMIZE
syn keyword	freebasicMath			RND SGN SIN SQR TAN

syn keyword	freebasicShortCircuit		ANDALSO ORELSE

syn keyword	freebasicMemory			ALLOCATE CALLOCATE CLEAR DEALLOCATE FIELD FRE PEEK POKE REALLOCATE

syn keyword	freebasicMetacommand		$DYNAMIC $STATIC $INCLUDE $LANG

syn keyword	freebasicMisc			ASM DATA END TO READ LET RESTORE SIZEOF TYPEOF OFFSETOF SWAP OPTION REM

syn keyword	freebasicModularizing		COMMON EXPORT EXTERN DYLIBFREE DYLIBLOAD DYLIBSYMBOL IMPORT NAMESPACE

syn keyword	freebasicMultithreading		CONDBROADCAST CONDCREATE CONDDESTROY CONDSIGNAL CONDWAIT
syn keyword	freebasicMultithreading		MUTEXCREATE MUTEXDESTROY MUTEXLOCK MUTEXUNLOCK THREADCREATE THREADWAIT

syn keyword	freebasicShell			CHAIN CHDIR COMMAND CURDIR DIR EXEC EXEPATH FILEATTR FILECOPY
syn keyword	freebasicShell			FILEDATETIME FILEEXISTS FILELEN KILL MKDIR NAME RMDIR RUN

syn keyword	freebasicEnviron		ENVIRON SETENVIRON SHELL SYSTEM WINDOWTITLE

syn keyword	freebasicLoops			FOR NEXT STEP DO LOOP WHILE UNTIL WEND CONTINUE EXIT

syn match	freebasicInclude		"\<#\s*\(inclib\|include\)\>"
syn match	freebasicInclude		"\<\$\s*include\>"

syn keyword	freebasicPointer		POINTER PROCPTR PTR SADD STRPTR VARPTR

syn keyword	freebasicPredefined		__DATE__ __TIME__ __FILE__ __FUNCTION__ __LINE__ __PATH__
syn keyword	freebasicPredefined		__FILE_NQ__ __FUNCTION_NQ__
syn keyword	freebasicPredefined		__FB_ARGC__ __FB_ARGV__
syn keyword	freebasicPredefined		__FB_CYGWIN__ __FB_DARWIN__ __FB_DOS__ __FB_FREEBSD__ __FB_LINUX__
syn keyword	freebasicPredefined		__FB_NETBSD__ __FB_OPENBSD__ __FB_WIN32__ __FB_XBOX__
syn keyword	freebasicPredefined		__FB_BIGENDIAN__ __FB_LANG__
syn keyword	freebasicPredefined		__FB_BUILD_DATE__ __FB_DEBUG__ __FB_ERR__ __FB_MAIN__
syn keyword	freebasicPredefined		__FB_MIN_VERSION__ __FB_OUT_DLL__ __FB_OUT_EXE__ __FB_OUT_LIB__
syn keyword	freebasicPredefined		__FB_OUT_OBJ__ __FB_SIGNATURE__ __FB_SSE__ __FB_VERSION__
syn keyword	freebasicPredefined		__FB_VER_MAJOR__ __FB_VER_MINOR__ __FB_VER_PATCH__ __FB_MT__
syn keyword	freebasicPredefined		__FB_OPTION_BYVAL__ __FB_OPTION_DYNAMIC__ __FB_OPTION_ESCAPE__
syn keyword	freebasicPredefined		__FB_OPTION_EXPLICIT__ __FB_OPTION_GOSUB__ __FB_OPTION_PRIVATE__

syn match	freebasicPreProcessor		"\<^#\s*\(define\|undef\)\>"
syn match	freebasicPreProcessor		"\<^#\s*\(ifdef\|ifndef\|else\|elseif\|endif\|if\)\>"
syn match	freebasicPreProcessor		"\<#\s*error\>"
syn match	freebasicPreProcessor		"\<#\s*\(macro\|endmacro\)\>"
syn match	freebasicPreProcessor		"\<#\s*\(print\|dynamic\|static\)\>"
syn match	freebasicPreProcessor		"\<#\s*\(inclib\|include\|libpath\|lang\|line\|pragma\)\>"
syn keyword	freebasicPreProcessor		DEFINED ONCE

syn keyword	freebasicProgramFlow		CASE GOSUB GOTO
syn keyword	freebasicProgramFlow		IS RETURN SCOPE SLEEP

syn keyword	freebasicString			INSTR INSTRREV LCASE LEFT LEN LSET LTRIM MID RIGHT RSET RTRIM
syn keyword	freebasicString			SPACE STRING TRIM UCASE ASC BIN CHR CVD CVI CVL CVLONGINT
syn keyword	freebasicString			CVS CVSHORT FORMAT HEX MKD MKI MKL MKLONGINT MKS MKSHORT
syn keyword	freebasicString			OCT STR VAL VALLNG VALINT VALUINT VALULNG WBIN WCHR WHEX WOCT WSTR
syn keyword	freebasicString			WSPACE WSTRING

syn keyword	freebasicTypeCasting		CAST CBYTE CDBL CINT CLNG CLNGINT CPTR CSHORT CSIGN CSNG
syn keyword	freebasicTypeCasting		CUBYTE CUINT CULNG CULNGINT CUNSG CUSHORT

syn match	freebasicUserInput		"\<line\s+input\>"
syn keyword	freebasicUserInput		GETJOYSTICK GETKEY GETMOUSE INKEY INPUT MULTIKEY SETMOUSE
syn keyword	freebasicUserInput		STICK STRIG WINPUT
"
"	Do the Basic variables names first.  This is because it
"	is the most inclusive of the tests.  Later on we change
"	this so the identifiers are split up into the various
"	types of identifiers like functions, basic commands and
"	such. MEM 9/9/2006
"
syn match	freebasicIdentifier		"\<[a-zA-Z_][a-zA-Z0-9_]*\>"
syn match	freebasicGenericFunction	"\<[a-zA-Z_][a-zA-Z0-9_]*\>\s*("me=e-1,he=e-1
"
"	Function list
"
syn keyword	freebasicTodo		contained TODO
"
"	Catch errors caused by wrong parenthesis
"
syn region	freebasicParen		transparent start='(' end=')' contains=ALLBUT,@freebasicParenGroup
syn match	freebasicParenError	")"
syn match	freebasicInParen	contained "[{}]"
syn cluster	freebasicParenGroup	contains=freebasicParenError,freebasicSpecial,freebasicTodo,freebasicUserCont,freebasicUserLabel,freebasicBitField
"
"	Integer number, or floating point number without a dot and with "f".
"
syn region	freebasicHex		start="&h" end="\W"
syn region	freebasicHexError	start="&h\x*[g-zG-Z]" end="\W"
syn match	freebasicInteger	"\<\d\+\(u\=l\=\|lu\|f\)\>"
"
"	Floating point number, with dot, optional exponent
"
syn match	freebasicFloat		"\<\d\+\.\d*\(e[-+]\=\d\+\)\=[fl]\=\>"
"
"	Floating point number, starting with a dot, optional exponent
"
syn match	freebasicFloat		"\.\d\+\(e[-+]\=\d\+\)\=[fl]\=\>"
"
"	Floating point number, without dot, with exponent
"
syn match	freebasicFloat		"\<\d\+e[-+]\=\d\+[fl]\=\>"
"
"	Hex number
"
syn case match
syn match	freebasicOctal		"\<0\o*\>"
syn match	freebasicOctalError	"\<0\o*[89]"
"
"	String and Character contstants
"
syn region	freebasicString		start='"' end='"' contains=freebasicSpecial,freebasicTodo
syn region	freebasicString		start="'" end="'" contains=freebasicSpecial,freebasicTodo
"
"	Comments
"
syn match	freebasicSpecial	contained "\\."
syn region	freebasicComment	start="^rem" end="$" contains=freebasicSpecial,freebasicTodo
syn region	freebasicComment	start=":\s*rem" end="$" contains=freebasicSpecial,freebasicTodo
syn region	freebasicComment	start="\s*'" end="$" contains=freebasicSpecial,freebasicTodo
syn region	freebasicComment	start="^'" end="$" contains=freebasicSpecial,freebasicTodo
"
"	Now do the comments and labels
"
syn match	freebasicLabel		"^\d"
syn match	freebasicLabel		"\<^\w+:\>"
syn region	freebasicLineNumber	start="^\d" end="\s"
"
"	Create the clusters
"
syn cluster	freebasicNumber		contains=freebasicHex,freebasicOctal,freebasicInteger,freebasicFloat
syn cluster	freebasicError		contains=freebasicHexError,freebasicOctalError
"
"	Used with OPEN statement
"
syn match	freebasicFilenumber	"#\d\+"
syn match	freebasicMathOperator	"[\+\-\=\|\*\/\>\<\%\()[\]]" contains=freebasicParen
"
"	The default methods for highlighting.  Can be overridden later
"
hi def link freebasicArrays		StorageClass
hi def link freebasicAssignment		Operator
hi def link freebasicBitManipulation	Operator
hi def link freebasicCompilerSwitches	PreCondit
hi def link freebasicConsole		Special
hi def link freebasicDataTypes		Type
hi def link freebasicDateTime		Type
hi def link freebasicDebug		Special
hi def link freebasicErrorHandling	Special
hi def link freebasicFiles		Special
hi def link freebasicFunctions		Function
hi def link freebasicGraphics		Function
hi def link freebasicHardware		Special
hi def link freebasicLogical		Conditional
hi def link freebasicShortCircuit	Conditional
hi def link freebasicMath		Function
hi def link freebasicMemory		Function
hi def link freebasicMisc		Special
hi def link freebasicModularizing	Special
hi def link freebasicMultithreading	Special
hi def link freebasicShell		Special
hi def link freebasicEnviron		Special
hi def link freebasicPointer		Special
hi def link freebasicPredefined		PreProc
hi def link freebasicPreProcessor	PreProc
hi def link freebasicProgramFlow	Statement
hi def link freebasicString		String
hi def link freebasicTypeCasting	Type
hi def link freebasicUserInput		Statement
hi def link freebasicComment		Comment
hi def link freebasicConditional	Conditional
hi def link freebasicError		Error
hi def link freebasicIdentifier		Identifier
hi def link freebasicInclude		Include
hi def link freebasicGenericFunction	Function
hi def link freebasicLabel		Label
hi def link freebasicLineNumber		Label
hi def link freebasicMathOperator	Operator
hi def link freebasicNumber		Number
hi def link freebasicSpecial		Special
hi def link freebasicTodo		Todo

let b:current_syntax = "freebasic"

" vim: ts=8
