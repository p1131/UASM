; Listing generated by Microsoft (R) Optimizing Compiler Version 19.00.23026.0 

include listing.inc

INCLUDELIB LIBCMT
INCLUDELIB OLDNAMES

_DATA	SEGMENT
COMM	decoflags:BYTE
COMM	broadflags:BYTE
COMM	evex:BYTE
_DATA	ENDS
_BSS	SEGMENT
$SG11104 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG11010 DB	'mov %r,DGROUP', 00H
	ORG $+2
$SG11011 DB	'mov %r,%r', 00H
	ORG $+2
$SG11018 DB	'cli', 00H
$SG11012 DB	'mov %r,%r', 00H
	ORG $+2
$SG11021 DB	'sti', 00H
$SG11013 DB	'sub %r,%r', 00H
	ORG $+2
$SG11035 DB	'push 1', 00H
	ORG $+5
$SG11014 DB	'shl %r,1', 00H
	ORG $+7
$SG11015 DB	'shl %r,1', 00H
	ORG $+7
$SG11016 DB	'shl %r,1', 00H
	ORG $+7
$SG11017 DB	'shl %r,1', 00H
	ORG $+7
$SG11019 DB	'mov %r,%r', 00H
	ORG $+6
$SG11020 DB	'add %r,%r', 00H
	ORG $+6
$SG11023 DB	'mov %r,DGROUP', 00H
	ORG $+2
$SG11024 DB	'mov %r,%r', 00H
	ORG $+6
$SG11025 DB	'mov %r,%r', 00H
	ORG $+6
$SG11026 DB	'sub %r,%r', 00H
	ORG $+6
$SG11027 DB	'shl %r,4', 00H
	ORG $+7
$SG11028 DB	'mov %r,%r', 00H
	ORG $+6
$SG11029 DB	'add %r,%r', 00H
	ORG $+6
$SG11031 DB	'mov %r,DGROUP', 00H
	ORG $+2
$SG11032 DB	'mov %r,%r', 00H
	ORG $+6
$SG11034 DB	'mov %r,0', 00H
	ORG $+7
$SG11036 DB	'push %r', 00H
$SG11037 DB	'call DOSEXIT', 00H
	ORG $+3
$SG11039 DB	'mov %r,4ch', 00H
	ORG $+5
$SG11040 DB	'int 21h', 00H
$SG11067 DB	'org 100h', 00H
	ORG $+3
$SG11068 DB	'%s::', 00H
	ORG $+7
$SG11082 DB	'mov %r,%s', 00H
	ORG $+6
$SG11086 DB	'mov %r,4C00h + %u', 00H
	ORG $+6
$SG11087 DB	'mov %r,%s', 00H
	ORG $+6
$SG11088 DB	'mov %r,4Ch', 00H
_DATA	ENDS
CONST	SEGMENT
StartupDosNear0 DQ FLAT:$SG11010
	DW	0bH
	DW	00H
	ORG $+4
	DQ	FLAT:$SG11011
	DW	01cH
	DW	0bH
	ORG $+4
	DQ	FLAT:$SG11012
	DW	0cH
	DW	01bH
	ORG $+4
	DQ	FLAT:$SG11013
	DW	0cH
	DW	0bH
	ORG $+4
	DQ	FLAT:$SG11014
	DW	0cH
	DW	00H
	ORG $+4
	DQ	FLAT:$SG11015
	DW	0cH
	DW	00H
	ORG $+4
	DQ	FLAT:$SG11016
	DW	0cH
	DW	00H
	ORG $+4
	DQ	FLAT:$SG11017
	DW	0cH
	DW	00H
	ORG $+4
	DQ	FLAT:$SG11018
	DW	00H
	DW	00H
	ORG $+4
	DQ	FLAT:$SG11019
	DW	01bH
	DW	0bH
	ORG $+4
	DQ	FLAT:$SG11020
	DW	0dH
	DW	0cH
	ORG $+4
	DQ	FLAT:$SG11021
	DW	00H
	DW	00H
	ORG $+4
StartupDosNear1 DQ FLAT:$SG11023
	DW	09H
	DW	00H
	ORG $+4
	DQ	FLAT:$SG11024
	DW	01cH
	DW	09H
	ORG $+4
	DQ	FLAT:$SG11025
	DW	0cH
	DW	01bH
	ORG $+4
	DQ	FLAT:$SG11026
	DW	0cH
	DW	09H
	ORG $+4
	DQ	FLAT:$SG11027
	DW	0cH
	DW	00H
	ORG $+4
	DQ	FLAT:$SG11028
	DW	01bH
	DW	09H
	ORG $+4
	DQ	FLAT:$SG11029
	DW	0dH
	DW	0cH
	ORG $+4
StartupDosFar DQ FLAT:$SG11031
	DW	0bH
	DW	00H
	ORG $+4
	DQ	FLAT:$SG11032
	DW	01cH
	DW	0bH
	ORG $+4
ExitOS2	DQ	FLAT:$SG11034
	DW	05H
	DW	00H
	ORG $+4
	DQ	FLAT:$SG11035
	DW	00H
	DW	00H
	ORG $+4
	DQ	FLAT:$SG11036
	DW	09H
	DW	00H
	ORG $+4
	DQ	FLAT:$SG11037
	DW	00H
	DW	00H
	ORG $+4
ExitDos	DQ	FLAT:$SG11039
	DW	05H
	DW	00H
	ORG $+4
	DQ	FLAT:$SG11040
	DW	00H
	DW	00H
	ORG $+4
szStartAddr DB	'@Startup', 00H
CONST	ENDS
PUBLIC	StartupExitDirective
PUBLIC	EndDirective
EXTRN	EmitError:PROC
EXTRN	EmitErr:PROC
EXTRN	EmitWarn:PROC
EXTRN	SegmentModuleExit:PROC
EXTRN	AddPublicData:PROC
EXTRN	AddLineQueue:PROC
EXTRN	AddLineQueueX:PROC
EXTRN	RunLineQueue:PROC
EXTRN	EvalOperand:PROC
EXTRN	LstWriteSrcLine:PROC
EXTRN	ProcCheckOpen:PROC
EXTRN	idata_fixup:PROC
EXTRN	Options:BYTE
EXTRN	ModuleInfo:BYTE
EXTRN	Parse_Pass:DWORD
EXTRN	InstrTable:BYTE
EXTRN	optable_idx:BYTE
EXTRN	CurrStruct:QWORD
pdata	SEGMENT
$pdata$StartupExitDirective DD imagerel $LN48
	DD	imagerel $LN48+716
	DD	imagerel $unwind$StartupExitDirective
$pdata$EndDirective DD imagerel $LN28
	DD	imagerel $LN28+663
	DD	imagerel $unwind$EndDirective
pdata	ENDS
xdata	SEGMENT
$unwind$StartupExitDirective DD 0a8001H
	DD	0147480H
	DD	01a5478H
	DD	0193470H
	DD	015010eH
	DD	06005e007H
$unwind$EndDirective DD 051201H
	DD	0293412H
	DD	0260112H
	DD	05006H
xdata	ENDS
; Function compile flags: /Ogtpy
; File d:\hjwasm\hjwasm2.13.1s\hjwasm2.13.1s\end.c
_TEXT	SEGMENT
opndx$ = 48
CodeInfo$1 = 160
i$ = 320
tokenarray$ = 328
EndDirective PROC

; 190  : {

$LN28:
	mov	QWORD PTR [rsp+16], rbx
	push	rbp
	lea	rbp, QWORD PTR [rsp-48]
	sub	rsp, 304				; 00000130H

; 191  :     struct expr         opndx;
; 192  : 
; 193  :     DebugMsg1(("EndDirective enter\n"));
; 194  : 
; 195  :     i++; /* skip directive */

	inc	ecx
	mov	rbx, rdx
	mov	DWORD PTR i$[rbp-256], ecx

; 196  : 
; 197  :     /* v2.08: END may generate code, so write listing first */
; 198  :     LstWriteSrcLine();

	call	LstWriteSrcLine

; 199  : 
; 200  :     /* v2.05: first parse the arguments. this allows
; 201  :      * SegmentModuleExit() later to run generated code.
; 202  :      */
; 203  :     if( ModuleInfo.StartupDirectiveFound ) {

	test	DWORD PTR ModuleInfo+408, 32768		; 00008000H
	je	$LN26@EndDirecti

; 204  :         /* start label behind END ignored if .STARTUP has been found */
; 205  :         if( i < Token_Count && Parse_Pass == PASS_1 ) {

	mov	eax, DWORD PTR ModuleInfo+496
	cmp	DWORD PTR i$[rbp-256], eax
	jge	SHORT $LN5@EndDirecti
	cmp	DWORD PTR Parse_Pass, 0
	jne	SHORT $LN5@EndDirecti

; 206  :             EmitWarn( 2, START_ADDRESS_IGNORED );

	mov	edx, 243				; 000000f3H
	mov	ecx, 2
	call	EmitWarn
	mov	eax, DWORD PTR ModuleInfo+496
$LN5@EndDirecti:

; 207  :         }
; 208  :         i = Token_Count + 1;

	inc	eax
	mov	DWORD PTR i$[rbp-256], eax

; 209  :         tokenarray[i].token = T_ID;

	movsxd	rcx, eax
	shl	rcx, 5
	mov	BYTE PTR [rcx+rbx], 8

; 210  :         tokenarray[i].string_ptr = (char *)szStartAddr;

	lea	rcx, OFFSET FLAT:szStartAddr
	movsxd	rax, DWORD PTR i$[rbp-256]
	shl	rax, 5
	mov	QWORD PTR [rax+rbx+8], rcx

; 211  :         tokenarray[i+1].token = T_FINAL;
; 212  :         tokenarray[i+1].string_ptr = "";

	lea	rcx, OFFSET FLAT:$SG11104
	movsxd	rax, DWORD PTR i$[rbp-256]
	inc	rax
	shl	rax, 5
	mov	BYTE PTR [rax+rbx], 0
	movsxd	rax, DWORD PTR i$[rbp-256]
	shl	rax, 5
	mov	QWORD PTR [rax+rbx+40], rcx

; 213  :         Token_Count = i+1;

	mov	r8d, DWORD PTR i$[rbp-256]
	inc	r8d
	mov	DWORD PTR ModuleInfo+496, r8d
	jmp	SHORT $LN4@EndDirecti
$LN26@EndDirecti:
	mov	r8d, DWORD PTR ModuleInfo+496
$LN4@EndDirecti:

; 214  :     }
; 215  :     /* v2.11: flag EXPF_NOUNDEF added - will return ERROR if start label isn't defined */
; 216  :     if( EvalOperand( &i, tokenarray, Token_Count, &opndx, EXPF_NOUNDEF ) == ERROR ) {

	lea	r9, QWORD PTR opndx$[rsp]
	mov	BYTE PTR [rsp+32], 2
	mov	rdx, rbx
	lea	rcx, QWORD PTR i$[rbp-256]
	call	EvalOperand
	cmp	eax, -1
	jne	SHORT $LN6@EndDirecti

; 217  :         return( ERROR );

	or	eax, eax

; 289  : }

	mov	rbx, QWORD PTR [rsp+328]
	add	rsp, 304				; 00000130H
	pop	rbp
	ret	0
$LN6@EndDirecti:

; 218  :     }
; 219  :     if( tokenarray[i].token != T_FINAL ) {

	movsxd	rax, DWORD PTR i$[rbp-256]
	shl	rax, 5
	cmp	BYTE PTR [rax+rbx], 0
	je	SHORT $LN7@EndDirecti

; 220  :         return( EmitErr( SYNTAX_ERROR_EX, tokenarray[i].tokpos ) );

	mov	rdx, QWORD PTR [rax+rbx+24]
	mov	ecx, 210				; 000000d2H
	call	EmitErr

; 289  : }

	mov	rbx, QWORD PTR [rsp+328]
	add	rsp, 304				; 00000130H
	pop	rbp
	ret	0
$LN7@EndDirecti:

; 221  :     }
; 222  : 
; 223  :     if ( CurrStruct ) {

	mov	rdx, QWORD PTR CurrStruct
	test	rdx, rdx
	je	SHORT $LN8@EndDirecti

; 224  :         while ( CurrStruct->next )

	cmp	QWORD PTR [rdx+104], 0
	lea	rax, QWORD PTR [rdx+104]
	je	SHORT $LN3@EndDirecti
	npad	7
$LL2@EndDirecti:

; 225  :             CurrStruct = CurrStruct->next;

	mov	rdx, QWORD PTR [rax]
	lea	rax, QWORD PTR [rdx+104]
	mov	QWORD PTR CurrStruct, rdx
	cmp	QWORD PTR [rax], 0
	jne	SHORT $LL2@EndDirecti
$LN3@EndDirecti:

; 226  :         EmitErr( UNMATCHED_BLOCK_NESTING, CurrStruct->sym.name );

	mov	rdx, QWORD PTR [rdx+8]
	mov	ecx, 143				; 0000008fH
	call	EmitErr
$LN8@EndDirecti:

; 227  :     }
; 228  :     /* v2.10: check for open PROCedures */
; 229  :     ProcCheckOpen();

	call	ProcCheckOpen

; 230  : 
; 231  :     /* check type of start label. Must be a symbolic code label, internal or external */
; 232  :     if ( opndx.kind == EXPR_ADDR && opndx.indirect == FALSE &&
; 233  :         ( opndx.mem_type == MT_NEAR || opndx.mem_type == MT_FAR || ( opndx.mem_type == MT_EMPTY && opndx.instr == T_OFFSET ) ) &&
; 234  :         opndx.sym && (  opndx.sym->state == SYM_INTERNAL || opndx.sym->state == SYM_EXTERNAL ) ) {

	mov	eax, DWORD PTR opndx$[rsp+60]
	cmp	eax, 1
	jne	$LN9@EndDirecti
	test	BYTE PTR opndx$[rsp+76], al
	jne	$LN23@EndDirecti
	mov	ecx, DWORD PTR opndx$[rsp+64]
	lea	eax, DWORD PTR [rcx-129]
	cmp	eax, 1
	jbe	SHORT $LN11@EndDirecti
	cmp	ecx, 192				; 000000c0H
	jne	$LN23@EndDirecti
	cmp	DWORD PTR opndx$[rsp+56], 241		; 000000f1H
	jne	$LN23@EndDirecti
$LN11@EndDirecti:
	mov	rcx, QWORD PTR opndx$[rbp-176]
	test	rcx, rcx
	je	$LN23@EndDirecti
	mov	edx, DWORD PTR [rcx+32]
	lea	eax, DWORD PTR [rdx-1]
	cmp	eax, 1
	ja	$LN23@EndDirecti

; 235  : 
; 236  :         DebugMsg(("EndDirective: start label=%s, add=%" I32_SPEC "Xh\n", opndx.sym->name, opndx.value ));
; 237  : 
; 238  :         if ( Options.output_format == OFORMAT_OMF ) {

	cmp	DWORD PTR Options+144, 1
	jne	$LN13@EndDirecti

; 239  :             struct code_info    CodeInfo;
; 240  :             /* fixme: no need to create the fixup here, should be done in omf_write_modend() */
; 241  :             //CodeInfo.token = T_NULL; /* v2.09: T_NULL has no entry in optable_idx[] */
; 242  :             //CodeInfo.pinstr = &InstrTable[IndexFromToken( T_NULL )];
; 243  :             CodeInfo.opnd[0].InsFixup = NULL;
; 244  :             CodeInfo.token = T_NOP;
; 245  :             CodeInfo.pinstr = &InstrTable[IndexFromToken( T_NOP )];

	movzx	eax, WORD PTR optable_idx+376

; 246  :             CodeInfo.flags = 0;
; 247  :             CodeInfo.mem_type = MT_EMPTY;
; 248  :             idata_fixup( &CodeInfo, 0, &opndx );

	lea	r8, QWORD PTR opndx$[rsp]
	imul	rcx, rax, 14
	lea	rax, OFFSET FLAT:InstrTable
	mov	QWORD PTR CodeInfo$1[rbp-208], 0
	add	rcx, rax
	mov	DWORD PTR CodeInfo$1[rbp-232], 638	; 0000027eH
	mov	QWORD PTR CodeInfo$1[rbp-240], rcx
	xor	edx, edx
	lea	rcx, QWORD PTR CodeInfo$1[rbp-256]
	mov	BYTE PTR CodeInfo$1[rbp-114], 0
	mov	DWORD PTR CodeInfo$1[rbp-228], 192	; 000000c0H
	call	idata_fixup

; 249  : #if FASTMEM==0
; 250  :             LclFree( ModuleInfo.g.start_fixup );
; 251  : #endif
; 252  :             ModuleInfo.g.start_fixup = CodeInfo.opnd[0].InsFixup;

	mov	rax, QWORD PTR CodeInfo$1[rbp-208]
	mov	QWORD PTR ModuleInfo+208, rax

; 253  :             ModuleInfo.g.start_displ = opndx.value;

	mov	eax, DWORD PTR opndx$[rsp]
	mov	DWORD PTR ModuleInfo+216, eax
$LN16@EndDirecti:

; 278  :     }
; 279  : 
; 280  :     /* close open segments */
; 281  :     SegmentModuleExit();

	call	SegmentModuleExit

; 282  : 
; 283  :     if ( ModuleInfo.g.EndDirHook )

	mov	rax, QWORD PTR ModuleInfo+296
	test	rax, rax
	je	SHORT $LN17@EndDirecti

; 284  :         ModuleInfo.g.EndDirHook( &ModuleInfo );

	lea	rcx, OFFSET FLAT:ModuleInfo
	call	rax
$LN17@EndDirecti:

; 285  : 
; 286  :     ModuleInfo.EndDirFound = TRUE;

	or	DWORD PTR ModuleInfo+408, 65536		; 00010000H

; 287  : 
; 288  :     return( NOT_ERROR );

	xor	eax, eax

; 289  : }

	mov	rbx, QWORD PTR [rsp+328]
	add	rsp, 304				; 00000130H
	pop	rbp
	ret	0
$LN13@EndDirecti:

; 254  :         } else {
; 255  :             /* Masm silently ignores start for -coff if an offset was given */
; 256  :             //if ( opndx.value )
; 257  :             //   emit a warning
; 258  : 
; 259  :             if ( opndx.sym->state != SYM_EXTERNAL && opndx.sym->ispublic == FALSE ) {

	cmp	edx, 2
	je	SHORT $LN15@EndDirecti
	movzx	eax, BYTE PTR [rcx+40]
	test	al, al
	js	SHORT $LN15@EndDirecti

; 260  :                 opndx.sym->ispublic = TRUE;

	or	al, 128					; 00000080H
	mov	BYTE PTR [rcx+40], al

; 261  :                 AddPublicData( opndx.sym );

	mov	rcx, QWORD PTR opndx$[rbp-176]
	call	AddPublicData
	mov	rcx, QWORD PTR opndx$[rbp-176]
$LN15@EndDirecti:

; 262  :             }
; 263  :             ModuleInfo.g.start_label = opndx.sym;

	mov	QWORD PTR ModuleInfo+208, rcx

; 264  :         }

	jmp	SHORT $LN16@EndDirecti
$LN9@EndDirecti:

; 265  :     } else if ( opndx.kind != EXPR_EMPTY ) {

	cmp	eax, -2
	je	SHORT $LN16@EndDirecti
$LN23@EndDirecti:

; 266  : #ifdef DEBUG_OUT
; 267  :         if ( opndx.kind != EXPR_ADDR || opndx.indirect == TRUE ) {
; 268  :             DebugMsg(("EndDirective: start address invalid, opndx.kind=%X indirect=%u\n", opndx.kind, opndx.indirect ));
; 269  :         } else if ( opndx.sym == NULL ) {
; 270  :             DebugMsg(("EndDirective: start symbol=NULL\n" ));
; 271  :         } else if ( opndx.sym->state != SYM_INTERNAL && opndx.sym->state != SYM_EXTERNAL ) {
; 272  :             DebugMsg(("EndDirective: start address invalid, sym->state=%X\n", opndx.sym->state ));
; 273  :         } else {
; 274  :             DebugMsg(("EndDirective: start address not a code label, mem_type=%Xh\n", opndx.mem_type ));
; 275  :         }
; 276  : #endif
; 277  :         return( EmitError( OPERAND_MUST_BE_RELOCATABLE ) );

	mov	ecx, 189				; 000000bdH
	call	EmitError

; 289  : }

	mov	rbx, QWORD PTR [rsp+328]
	add	rsp, 304				; 00000130H
	pop	rbp
	ret	0
EndDirective ENDP
_TEXT	ENDS
; Function compile flags: /Ogtpy
; File d:\hjwasm\hjwasm2.13.1s\hjwasm2.13.1s\end.c
_TEXT	SEGMENT
opndx$ = 48
i$ = 192
tokenarray$ = 200
StartupExitDirective PROC

; 96   : {

$LN48:
	mov	DWORD PTR [rsp+8], ecx
	push	rsi
	push	r14
	sub	rsp, 168				; 000000a8H
	mov	rsi, rdx

; 97   :     int         count;
; 98   :     ret_code    rc = NOT_ERROR;

	xor	r14d, r14d

; 99   :     int         j;
; 100  :     const struct code_line *p;
; 101  :     struct expr opndx;
; 102  : 
; 103  :     LstWriteSrcLine();

	call	LstWriteSrcLine

; 104  : 
; 105  :     if( ModuleInfo.model == MODEL_NONE ) {

	mov	r8d, DWORD PTR ModuleInfo+360
	test	r8d, r8d
	jne	SHORT $LN10@StartupExi

; 106  :         return( EmitError( MODEL_IS_NOT_DECLARED ) );

	lea	ecx, QWORD PTR [r14+97]
	call	EmitError

; 184  : }

	add	rsp, 168				; 000000a8H
	pop	r14
	pop	rsi
	ret	0
$LN10@StartupExi:

; 107  :     }
; 108  :     if ( ModuleInfo.Ofssize > USE16 ) {

	cmp	BYTE PTR ModuleInfo+404, r14b
	jbe	SHORT $LN11@StartupExi

; 109  :         return( EmitErr( DOES_NOT_WORK_WITH_32BIT_SEGMENTS, tokenarray[i].string_ptr ) );

	movsxd	rdx, DWORD PTR i$[rsp]
	mov	ecx, 222				; 000000deH
	shl	rdx, 5
	mov	rdx, QWORD PTR [rdx+rsi+8]
	call	EmitErr

; 184  : }

	add	rsp, 168				; 000000a8H
	pop	r14
	pop	rsi
	ret	0
$LN11@StartupExi:
	mov	QWORD PTR [rsp+200], rbx
	mov	QWORD PTR [rsp+208], rbp
	mov	QWORD PTR [rsp+160], rdi

; 110  :     }
; 111  : 
; 112  :     switch( tokenarray[i].tokval ) {

	movsxd	rdi, DWORD PTR i$[rsp]
	mov	rcx, rdi
	shl	rcx, 5
	mov	edx, DWORD PTR [rcx+rsi+16]
	sub	edx, 340				; 00000154H
	je	$LN21@StartupExi
	cmp	edx, 1
	jne	$LN8@StartupExi

; 113  :     case T_DOT_STARTUP:
; 114  :         count = 0;
; 115  :         /* for tiny model, set current PC to 100h. */
; 116  :         if ( ModuleInfo.model == MODEL_TINY )

	cmp	r8d, edx
	jne	SHORT $LN13@StartupExi

; 117  :             AddLineQueue( "org 100h" );

	lea	rcx, OFFSET FLAT:$SG11067
	call	AddLineQueue
$LN13@StartupExi:

; 118  :         AddLineQueueX( "%s::", szStartAddr );

	lea	rdx, OFFSET FLAT:szStartAddr
	lea	rcx, OFFSET FLAT:$SG11068
	call	AddLineQueueX

; 119  :         if( ModuleInfo.ostype == OPSYS_DOS ) {

	cmp	DWORD PTR ModuleInfo+368, r14d
	jne	SHORT $LN5@StartupExi

; 120  :             if ( ModuleInfo.model == MODEL_TINY )

	cmp	DWORD PTR ModuleInfo+360, 1
	je	SHORT $LN5@StartupExi

; 121  :                 ;
; 122  :             else {
; 123  :                 if( ModuleInfo.distance == STACK_NEAR ) {

	cmp	DWORD PTR ModuleInfo+356, r14d
	jne	SHORT $LN17@StartupExi

; 124  :                     if ( ( ModuleInfo.cpu & M_CPUMSK ) <= M_8086 ) {

	movzx	eax, BYTE PTR ModuleInfo+388
	and	al, 127					; 0000007fH
	cmp	al, 1
	jg	SHORT $LN19@StartupExi

; 125  :                         p = StartupDosNear0;

	lea	rdi, OFFSET FLAT:StartupDosNear0

; 126  :                         count = sizeof( StartupDosNear0 ) / sizeof( StartupDosNear0[0] );

	mov	ebx, 12

; 127  :                     } else {

	jmp	SHORT $LN41@StartupExi
$LN19@StartupExi:

; 128  :                         p = StartupDosNear1;

	lea	rdi, OFFSET FLAT:StartupDosNear1

; 129  :                         count = sizeof( StartupDosNear1 ) / sizeof( StartupDosNear1[0] );

	mov	ebx, 7

; 130  :                     }
; 131  :                 } else {

	jmp	SHORT $LN41@StartupExi
$LN17@StartupExi:

; 132  :                     p = StartupDosFar;

	lea	rdi, OFFSET FLAT:StartupDosFar

; 133  :                     count = sizeof( StartupDosFar ) / sizeof( StartupDosFar[0] );

	mov	ebx, 2
$LN41@StartupExi:

; 134  :                 }
; 135  :                 for ( ; count ; count--, p++ )
; 136  :                     AddLineQueueX( (char *)p->src, p->r1, p->r2 );

	add	rdi, 8
$LL40@StartupExi:
	movsx	r8d, WORD PTR [rdi+2]
	movsx	edx, WORD PTR [rdi]
	mov	rcx, QWORD PTR [rdi-8]
	call	AddLineQueueX
	lea	rdi, QWORD PTR [rdi+16]
	sub	ebx, 1
	jne	SHORT $LL40@StartupExi
$LN5@StartupExi:

; 137  :             }
; 138  :         }
; 139  :         ModuleInfo.StartupDirectiveFound = TRUE;
; 140  :         i++; /* skip directive token */

	mov	edi, DWORD PTR i$[rsp]
	or	DWORD PTR ModuleInfo+408, 32768		; 00008000H
	inc	edi
	mov	DWORD PTR i$[rsp], edi

; 141  :         break;

	jmp	$LN8@StartupExi
$LN21@StartupExi:

; 142  :     case T_DOT_EXIT:
; 143  :         if( ModuleInfo.ostype == OPSYS_DOS ) {

	mov	ecx, DWORD PTR ModuleInfo+368
	test	ecx, ecx
	jne	SHORT $LN22@StartupExi

; 144  :             p = ExitDos;

	lea	rbp, OFFSET FLAT:ExitDos

; 145  :             count = sizeof( ExitDos ) / sizeof( ExitDos[0] );

	lea	ebx, QWORD PTR [rcx+2]

; 146  :         } else {

	jmp	SHORT $LN23@StartupExi
$LN22@StartupExi:

; 147  :             p = ExitOS2;

	lea	rbp, OFFSET FLAT:ExitOS2

; 148  :             count = sizeof( ExitOS2 ) / sizeof( ExitOS2[0] );

	mov	ebx, 4
$LN23@StartupExi:

; 149  :         }
; 150  :         i++; /* skip directive token */

	inc	edi

; 151  :         if ( tokenarray[i].token != T_FINAL ) {

	movsxd	rax, edi
	shl	rax, 5
	mov	DWORD PTR i$[rsp], edi
	cmp	BYTE PTR [rax+rsi], r14b
	je	$LN24@StartupExi

; 152  :             if( ModuleInfo.ostype == OPSYS_OS2 ) {

	cmp	ecx, 1
	jne	SHORT $LN25@StartupExi

; 153  :                 AddLineQueueX( "mov %r,%s", T_AX, tokenarray[i].tokpos );

	mov	r8, QWORD PTR [rax+rsi+24]
	lea	edx, QWORD PTR [rcx+8]
	lea	rcx, OFFSET FLAT:$SG11082
	call	AddLineQueueX

; 154  :                 i = Token_Count;

	mov	edi, DWORD PTR ModuleInfo+496
	mov	DWORD PTR i$[rsp], edi

; 155  :             } else {

	jmp	$LN29@StartupExi
$LN25@StartupExi:

; 156  :                 j = i;
; 157  :                 if ( EvalOperand( &i, tokenarray, Token_Count, &opndx, 0 ) == ERROR )

	mov	r8d, DWORD PTR ModuleInfo+496
	lea	r9, QWORD PTR opndx$[rsp]
	mov	rdx, rsi
	mov	BYTE PTR [rsp+32], r14b
	lea	rcx, QWORD PTR i$[rsp]
	call	EvalOperand
	cmp	eax, -1
	jne	SHORT $LN27@StartupExi

; 158  :                     return( ERROR );

	or	eax, eax
	jmp	$LN45@StartupExi
$LN27@StartupExi:

; 159  :                 if ( opndx.kind == EXPR_CONST && opndx.value < 0x100 ) {

	cmp	DWORD PTR opndx$[rsp+60], r14d
	jne	SHORT $LN28@StartupExi
	mov	r8d, DWORD PTR opndx$[rsp]
	cmp	r8d, 256				; 00000100H
	jge	SHORT $LN28@StartupExi

; 160  :                     AddLineQueueX( "mov %r,4C00h + %u", T_AX, opndx.value );

	mov	edx, 9
	lea	rcx, OFFSET FLAT:$SG11086
	call	AddLineQueueX

; 161  :                 } else {

	jmp	SHORT $LN46@StartupExi
$LN28@StartupExi:

; 162  :                     AddLineQueueX( "mov %r,%s", T_AL, tokenarray[j].tokpos );

	movsxd	r8, edi
	lea	rcx, OFFSET FLAT:$SG11087
	shl	r8, 5
	mov	edx, 1
	mov	r8, QWORD PTR [r8+rsi+24]
	call	AddLineQueueX

; 163  :                     AddLineQueueX( "mov %r,4Ch", T_AH );

	mov	edx, 5
	lea	rcx, OFFSET FLAT:$SG11088
	call	AddLineQueueX
$LN46@StartupExi:
	mov	edi, DWORD PTR i$[rsp]
$LN29@StartupExi:

; 164  :                 }
; 165  :             }
; 166  :             p++;

	add	rbp, 16

; 167  :             count--;

	dec	ebx
$LN24@StartupExi:

; 168  :         }
; 169  : 
; 170  :         for( ; count ; count--, p++ ) {

	test	ebx, ebx
	je	SHORT $LN8@StartupExi
	lea	rdi, QWORD PTR [rbp+8]
	npad	8
$LL9@StartupExi:

; 171  :             AddLineQueueX( (char *)p->src, p->r1, p->r2 );

	movsx	r8d, WORD PTR [rdi+2]
	movsx	edx, WORD PTR [rdi]
	mov	rcx, QWORD PTR [rdi-8]
	call	AddLineQueueX
	lea	rdi, QWORD PTR [rdi+16]
	sub	ebx, 1
	jne	SHORT $LL9@StartupExi

; 168  :         }
; 169  : 
; 170  :         for( ; count ; count--, p++ ) {

	mov	edi, DWORD PTR i$[rsp]
$LN8@StartupExi:

; 172  :         }
; 173  :         break;
; 174  :     }
; 175  : 
; 176  :     if ( tokenarray[i].token != T_FINAL ) {

	movsxd	rax, edi
	shl	rax, 5
	cmp	BYTE PTR [rax+rsi], r14b
	je	SHORT $LN30@StartupExi

; 177  :         EmitErr( SYNTAX_ERROR_EX, tokenarray[i].tokpos );

	mov	rdx, QWORD PTR [rax+rsi+24]
	mov	ecx, 210				; 000000d2H
	call	EmitErr

; 178  :         rc = ERROR;

	or	r14d, -1
$LN30@StartupExi:

; 179  :     }
; 180  : 
; 181  :     RunLineQueue();

	call	RunLineQueue

; 182  : 
; 183  :     return( rc );

	mov	eax, r14d
$LN45@StartupExi:
	mov	rbp, QWORD PTR [rsp+208]
	mov	rbx, QWORD PTR [rsp+200]
	mov	rdi, QWORD PTR [rsp+160]

; 184  : }

	add	rsp, 168				; 000000a8H
	pop	r14
	pop	rsi
	ret	0
StartupExitDirective ENDP
_TEXT	ENDS
END
