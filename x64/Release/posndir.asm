; Listing generated by Microsoft (R) Optimizing Compiler Version 19.00.23026.0 

include listing.inc

INCLUDELIB LIBCMT
INCLUDELIB OLDNAMES

_DATA	SEGMENT
COMM	decoflags:BYTE
COMM	broadflags:BYTE
COMM	evex:BYTE
_DATA	ENDS
CONST	SEGMENT
NopList16 DB	03H
	DB	02eH
	DB	08bH
	DB	0c0H
	DB	08bH
	DB	0c0H
	DB	090H
	ORG $+1
NopList32 DB	07H
	DB	08dH
	DB	0a4H
	DB	024H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	08dH
	DB	080H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	02eH
	DB	08dH
	DB	044H
	DB	020H
	DB	00H
	DB	08dH
	DB	044H
	DB	020H
	DB	00H
	DB	08dH
	DB	040H
	DB	00H
	DB	08bH
	DB	0ffH
	DB	090H
	ORG $+3
NopList64 DB	07H
	DB	0fH
	DB	01fH
	DB	080H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	066H
	DB	0fH
	DB	01fH
	DB	044H
	DB	00H
	DB	00H
	DB	0fH
	DB	01fH
	DB	044H
	DB	00H
	DB	00H
	DB	0fH
	DB	01fH
	DB	040H
	DB	00H
	DB	0fH
	DB	01fH
	DB	00H
	DB	066H
	DB	090H
	DB	090H
CONST	ENDS
PUBLIC	AlignCurrOffset
PUBLIC	OrgDirective
PUBLIC	AlignDirective
EXTRN	EmitError:PROC
EXTRN	EmitErr:PROC
EXTRN	EmitWarn:PROC
EXTRN	OutputByte:PROC
EXTRN	FillDataBytes:PROC
EXTRN	myltoa:PROC
EXTRN	GetCurrOffset:PROC
EXTRN	SetCurrOffset:PROC
EXTRN	GetCurrSegAlign:PROC
EXTRN	EvalOperand:PROC
EXTRN	SetStructCurrentOffset:PROC
EXTRN	AlignInStruct:PROC
EXTRN	LstWrite:PROC
EXTRN	StoreLine:PROC
EXTRN	Options:BYTE
EXTRN	ModuleInfo:BYTE
EXTRN	Parse_Pass:DWORD
EXTRN	CurrStruct:QWORD
EXTRN	StoreState:BYTE
pdata	SEGMENT
$pdata$AlignCurrOffset DD imagerel $LN5
	DD	imagerel $LN5+46
	DD	imagerel $unwind$AlignCurrOffset
$pdata$OrgDirective DD imagerel $LN18
	DD	imagerel $LN18+363
	DD	imagerel $unwind$OrgDirective
pdata	ENDS
;	COMDAT pdata
pdata	SEGMENT
$pdata$fill_in_objfile_space DD imagerel fill_in_objfile_space
	DD	imagerel fill_in_objfile_space+333
	DD	imagerel $unwind$fill_in_objfile_space
pdata	ENDS
pdata	SEGMENT
$pdata$AlignDirective DD imagerel $LN39
	DD	imagerel $LN39+560
	DD	imagerel $unwind$AlignDirective
pdata	ENDS
CONST	SEGMENT
	ORG $+3
NopLists DQ	FLAT:NopList16
	DQ	FLAT:NopList32
	DQ	FLAT:NopList64
CONST	ENDS
;	COMDAT xdata
xdata	SEGMENT
$unwind$fill_in_objfile_space DD 0a6001H
	DD	09e460H
	DD	08745bH
	DD	075451H
	DD	06344cH
	DD	060023206H
xdata	ENDS
xdata	SEGMENT
$unwind$AlignCurrOffset DD 020601H
	DD	030023206H
$unwind$OrgDirective DD 030b01H
	DD	014010bH
	DD	03004H
$unwind$AlignDirective DD 030c01H
	DD	018010cH
	DD	03005H
xdata	ENDS
; Function compile flags: /Ogtpy
; File d:\hjwasm\hjwasm2.13.1s\hjwasm2.13.1s\posndir.c
_TEXT	SEGMENT
opndx$ = 48
buffer$ = 160
i$ = 208
tokenarray$ = 216
AlignDirective PROC

; 194  : {

$LN39:
	mov	DWORD PTR [rsp+8], ecx
	push	rbx
	sub	rsp, 192				; 000000c0H
	movsxd	r9, ecx
	mov	rbx, rdx

; 195  :     int seg_align;
; 196  :     struct expr opndx;
; 197  :     uint_32 CurrAddr;
; 198  :     char buffer[32];
; 199  : 
; 200  :     DebugMsg1(("AlignDirective enter\n"));
; 201  : 
; 202  :     switch( tokenarray[i].tokval ) {

	mov	r8, r9
	shl	r8, 5
	mov	ecx, DWORD PTR [r8+rdx+16]
	sub	ecx, 434				; 000001b2H
	je	SHORT $LN7@AlignDirec
	cmp	ecx, 1
	jne	SHORT $LN35@AlignDirec

; 222  :         }
; 223  :         break;
; 224  :     case T_EVEN:
; 225  :         align_value = 2;

	mov	ecx, 2

; 226  :         i++;

	inc	r9d
	mov	DWORD PTR opndx$[rsp], ecx
	mov	DWORD PTR i$[rsp], r9d
	jmp	$LN15@AlignDirec
$LN35@AlignDirec:

; 218  :             else
; 219  :                 align_value = GetCurrSegAlign();

	mov	ecx, DWORD PTR opndx$[rsp]
	jmp	$LN15@AlignDirec
$LN7@AlignDirec:

; 203  :     case T_ALIGN:
; 204  :         i++;
; 205  :         if ( EvalOperand( &i, tokenarray, Token_Count, &opndx, EXPF_NOUNDEF ) == ERROR )

	mov	r8d, DWORD PTR ModuleInfo+496
	lea	rcx, QWORD PTR i$[rsp]
	inc	r9d
	mov	BYTE PTR [rsp+32], 2
	mov	DWORD PTR i$[rsp], r9d
	lea	r9, QWORD PTR opndx$[rsp]
	call	EvalOperand
	cmp	eax, -1
	jne	SHORT $LN8@AlignDirec

; 206  :             return( ERROR );

	or	eax, eax

; 266  : }

	add	rsp, 192				; 000000c0H
	pop	rbx
	ret	0
$LN8@AlignDirec:

; 207  :         if ( opndx.kind == EXPR_CONST ) {

	mov	eax, DWORD PTR opndx$[rsp+60]
	test	eax, eax
	jne	SHORT $LN9@AlignDirec

; 208  :             int_32 power;
; 209  :             /* check that the parm is a power of 2 */
; 210  :             for( power = 1; power < align_value; power <<= 1 );

	mov	ecx, DWORD PTR opndx$[rsp]
	mov	eax, 1
	cmp	eax, ecx
	jge	SHORT $LN36@AlignDirec
	npad	5
$LL6@AlignDirec:
	add	eax, eax
	cmp	eax, ecx
	jl	SHORT $LL6@AlignDirec
$LN36@AlignDirec:

; 211  :             if( power != align_value ) {

	je	SHORT $LN34@AlignDirec

; 212  :                 return( EmitErr( POWER_OF_2, align_value ) );

	mov	edx, ecx
	mov	ecx, 130				; 00000082H
	call	EmitErr

; 266  : }

	add	rsp, 192				; 000000c0H
	pop	rbx
	ret	0
$LN9@AlignDirec:

; 213  :             }
; 214  :         } else if ( opndx.kind == EXPR_EMPTY ) { /* ALIGN without argument? */

	cmp	eax, -2
	jne	$LN12@AlignDirec

; 215  :             /* v2.03: special STRUCT handling was missing */
; 216  :             if ( CurrStruct )

	mov	rax, QWORD PTR CurrStruct
	test	rax, rax
	je	SHORT $LN14@AlignDirec

; 217  :                 align_value = CurrStruct->e.structinfo->alignment;

	mov	rax, QWORD PTR [rax+96]
	movzx	ecx, BYTE PTR [rax+16]
	mov	DWORD PTR opndx$[rsp], ecx
	jmp	SHORT $LN34@AlignDirec
$LN14@AlignDirec:

; 218  :             else
; 219  :                 align_value = GetCurrSegAlign();

	call	GetCurrSegAlign
	mov	ecx, eax
	mov	DWORD PTR opndx$[rsp], eax
$LN34@AlignDirec:
	mov	r9d, DWORD PTR i$[rsp]
$LN15@AlignDirec:

; 227  :         break;
; 228  :     }
; 229  :     if ( tokenarray[i].token != T_FINAL ) {

	movsxd	rax, r9d
	shl	rax, 5
	cmp	BYTE PTR [rax+rbx], 0
	je	SHORT $LN17@AlignDirec

; 230  :         return( EmitErr( SYNTAX_ERROR_EX, tokenarray[i].string_ptr ) );

	mov	rdx, QWORD PTR [rax+rbx+8]
	mov	ecx, 210				; 000000d2H
	call	EmitErr

; 266  : }

	add	rsp, 192				; 000000c0H
	pop	rbx
	ret	0
$LN17@AlignDirec:

; 231  :     }
; 232  : 
; 233  :     /* ALIGN/EVEN inside a STRUCT definition? */
; 234  :     if ( CurrStruct )

	cmp	QWORD PTR CurrStruct, 0
	je	SHORT $LN18@AlignDirec

; 235  :         return( AlignInStruct( align_value ));

	call	AlignInStruct

; 266  : }

	add	rsp, 192				; 000000c0H
	pop	rbx
	ret	0
$LN18@AlignDirec:

; 236  : 
; 237  : #if FASTPASS
; 238  :     if ( StoreState == FALSE ) FStoreLine(0);

	cmp	BYTE PTR StoreState, 0
	jne	SHORT $LN20@AlignDirec
	cmp	DWORD PTR Parse_Pass, 0
	jne	SHORT $LN20@AlignDirec
	mov	rcx, QWORD PTR ModuleInfo+464
	xor	r8d, r8d
	xor	edx, edx
	call	StoreLine
$LN20@AlignDirec:

; 239  : #endif
; 240  :     seg_align = GetCurrSegAlign(); /* # of bytes */

	call	GetCurrSegAlign

; 241  :     if( seg_align <= 0 ) {

	test	eax, eax
	jg	SHORT $LN22@AlignDirec

; 242  :         return( EmitError( MUST_BE_IN_SEGMENT_BLOCK ) );

	mov	ecx, 83					; 00000053H

; 220  :         } else {
; 221  :             return( EmitError( CONSTANT_EXPECTED ) );

	call	EmitError

; 266  : }

	add	rsp, 192				; 000000c0H
	pop	rbx
	ret	0
$LN22@AlignDirec:

; 243  :     }
; 244  :     if( align_value > seg_align ) {

	mov	ecx, DWORD PTR opndx$[rsp]
	cmp	ecx, eax
	jle	SHORT $LN24@AlignDirec

; 245  :         if (( Parse_Pass == PASS_1 )&&                   //We need 32 0r 64 bit for VEX and EVEX

	cmp	DWORD PTR Parse_Pass, 0
	jne	SHORT $LN25@AlignDirec
	mov	rax, QWORD PTR ModuleInfo+440
	test	BYTE PTR [rax+40], 2
	jne	SHORT $LN33@AlignDirec

; 246  :           (ModuleInfo.flat_grp->sym.isdefined == FALSE)) //No warning if "FLAT"
; 247  :             EmitWarn( 1, ALIGN_TOO_HIGH, myltoa( align_value, buffer, 10, FALSE, FALSE ) );

	xor	r9d, r9d
	mov	BYTE PTR [rsp+32], 0
	lea	rdx, QWORD PTR buffer$[rsp]
	lea	r8d, QWORD PTR [r9+10]
	call	myltoa
	mov	r8, rax
	mov	edx, 131				; 00000083H
	mov	ecx, 1
	call	EmitWarn
$LN24@AlignDirec:

; 248  :         //return( ERROR ); /* v2.0: don't exit */
; 249  :     }
; 250  :     /* v2.04: added, Skip backpatching after ALIGN occured */
; 251  :     if ( Parse_Pass == PASS_1 && CurrSeg && CurrSeg->e.seginfo->FixupList.head )

	cmp	DWORD PTR Parse_Pass, 0
	jne	SHORT $LN25@AlignDirec
$LN33@AlignDirec:
	mov	rax, QWORD PTR ModuleInfo+432
	test	rax, rax
	je	SHORT $LN25@AlignDirec
	mov	rax, QWORD PTR [rax+96]
	mov	rcx, QWORD PTR [rax+40]
	test	rcx, rcx
	je	SHORT $LN25@AlignDirec

; 252  :         CurrSeg->e.seginfo->FixupList.head->orgoccured = TRUE;

	or	BYTE PTR [rcx+33], 2
$LN25@AlignDirec:

; 253  :     /* find out how many bytes past alignment we are & add the remainder */
; 254  :     /* store temp. value */
; 255  :     CurrAddr = GetCurrOffset();

	call	GetCurrOffset

; 256  :     seg_align = CurrAddr % align_value;

	mov	ecx, DWORD PTR opndx$[rsp]
	xor	edx, edx
	mov	ebx, eax
	div	ecx

; 257  :     if( seg_align ) {

	test	edx, edx
	je	SHORT $LN26@AlignDirec

; 258  :         align_value -= seg_align;

	sub	ecx, edx
	mov	DWORD PTR opndx$[rsp], ecx

; 259  :         fill_in_objfile_space( align_value );

	call	fill_in_objfile_space
$LN26@AlignDirec:

; 260  :     }
; 261  :     if ( CurrFile[LST] ) {

	cmp	QWORD PTR ModuleInfo+112, 0
	je	SHORT $LN27@AlignDirec

; 262  :         LstWrite( LSTTYPE_DATA, CurrAddr, NULL );

	xor	r8d, r8d
	mov	edx, ebx
	xor	ecx, ecx
	call	LstWrite
$LN27@AlignDirec:

; 263  :     }
; 264  :     DebugMsg1(("AlignDirective exit\n"));
; 265  :     return( NOT_ERROR );

	xor	eax, eax

; 266  : }

	add	rsp, 192				; 000000c0H
	pop	rbx
	ret	0
$LN12@AlignDirec:

; 220  :         } else {
; 221  :             return( EmitError( CONSTANT_EXPECTED ) );

	mov	ecx, 66					; 00000042H
	call	EmitError

; 266  : }

	add	rsp, 192				; 000000c0H
	pop	rbx
	ret	0
AlignDirective ENDP
_TEXT	ENDS
; Function compile flags: /Ogtpy
; File d:\hjwasm\hjwasm2.13.1s\hjwasm2.13.1s\posndir.c
;	COMDAT fill_in_objfile_space
_TEXT	SEGMENT
size$ = 48
fill_in_objfile_space PROC				; COMDAT

; 132  : {

	push	rsi
	sub	rsp, 32					; 00000020H
	mov	esi, ecx

; 133  :     int i;
; 134  :     int nop_type;
; 135  : 
; 136  :     /* emit
; 137  :      - nothing ... for BSS
; 138  :      - x'00'   ... for DATA
; 139  :      - nops    ... for CODE
; 140  :      */
; 141  : 
; 142  :     /* v2.04: no output if nothing has been written yet */
; 143  :     if( CurrSeg->e.seginfo->written == FALSE ) {

	mov	rcx, QWORD PTR ModuleInfo+432
	mov	rax, QWORD PTR [rcx+96]
	test	BYTE PTR [rax+107], 32			; 00000020H
	jne	SHORT $LN13@fill_in_ob

; 144  : 
; 145  :         SetCurrOffset( CurrSeg, size, TRUE, TRUE );

	mov	r9b, 1
	mov	edx, esi
	movzx	r8d, r9b

; 169  :         }
; 170  :     }
; 171  : }

	add	rsp, 32					; 00000020H
	pop	rsi

; 144  : 
; 145  :         SetCurrOffset( CurrSeg, size, TRUE, TRUE );

	jmp	SetCurrOffset
$LN13@fill_in_ob:

; 146  : 
; 147  :     } else if( CurrSeg->e.seginfo->segtype != SEGTYPE_CODE ) {

	cmp	DWORD PTR [rax+72], 1
	je	SHORT $LN19@fill_in_ob

; 148  : 
; 149  :         FillDataBytes( 0x00, size ); /* just output nulls */

	mov	edx, esi
	xor	ecx, ecx

; 169  :         }
; 170  :     }
; 171  : }

	add	rsp, 32					; 00000020H
	pop	rsi

; 148  : 
; 149  :         FillDataBytes( 0x00, size ); /* just output nulls */

	jmp	FillDataBytes
$LN19@fill_in_ob:

; 150  : 
; 151  :     } else {
; 152  :         /* output appropriate NOP type instructions to fill in the gap */
; 153  : 
; 154  :         while( size > NopLists[ ModuleInfo.Ofssize ][0] ) {

	movzx	edx, BYTE PTR ModuleInfo+404
	mov	QWORD PTR [rsp+48], rbx
	mov	QWORD PTR [rsp+56], rbp
	mov	ebp, 1
	mov	QWORD PTR [rsp+64], rdi
	mov	QWORD PTR [rsp+72], r14
	lea	r14, OFFSET FLAT:NopLists
	mov	rcx, QWORD PTR [r14+rdx*8]
	movzx	eax, BYTE PTR [rcx]
	cmp	esi, eax
	jbe	SHORT $LN3@fill_in_ob
$LL2@fill_in_ob:

; 155  :             for( i = 1; i <= NopLists[ ModuleInfo.Ofssize ][0]; i++ ) {

	mov	ebx, ebp
	mov	rdi, rbp
	cmp	eax, ebx
	jl	SHORT $LN5@fill_in_ob
	npad	5
$LL6@fill_in_ob:

; 156  :                 OutputByte( NopLists[ ModuleInfo.Ofssize ][i] );

	movzx	ecx, BYTE PTR [rcx+rdi]
	call	OutputByte
	movzx	edx, BYTE PTR ModuleInfo+404
	lea	rdi, QWORD PTR [rdi+1]
	inc	ebx
	mov	rcx, QWORD PTR [r14+rdx*8]
	movzx	eax, BYTE PTR [rcx]
	cmp	ebx, eax
	jle	SHORT $LL6@fill_in_ob
$LN5@fill_in_ob:

; 157  :             }
; 158  :             size -= NopLists[ ModuleInfo.Ofssize ][0];

	movzx	eax, dl
	mov	rcx, QWORD PTR [r14+rax*8]
	movzx	eax, BYTE PTR [rcx]
	sub	esi, eax
	cmp	esi, eax
	ja	SHORT $LL2@fill_in_ob
$LN3@fill_in_ob:

; 159  :         }
; 160  :         if( size == 0 ) return;

	test	esi, esi
	je	SHORT $LN46@fill_in_ob

; 165  :         }
; 166  :         /* i now is the index of the 1st part of the NOP that we want */
; 167  :         for( ; nop_type > 0; nop_type--,i++ ) {

	xor	ecx, ecx
	movzx	eax, dl
	mov	r8d, ecx
	mov	rax, QWORD PTR [r14+rax*8]
	movzx	ebx, BYTE PTR [rax]
	cmp	ebx, esi
	jbe	SHORT $LN31@fill_in_ob
	mov	eax, ebx
	sub	eax, esi
	cmp	eax, 2
	jb	SHORT $LC32@fill_in_ob
	lea	eax, DWORD PTR [rsi+1]
	npad	12

; 161  : 
; 162  :         i=1; /* here i is the index into the NOP table */
; 163  :         for( nop_type = NopLists[ ModuleInfo.Ofssize ][0]; nop_type > size ; nop_type-- ) {

$LL34@fill_in_ob:

; 164  :             i+=nop_type;

	dec	r8d
	add	ecx, ebx
	add	r8d, ebx
	sub	ebx, 2

; 165  :         }
; 166  :         /* i now is the index of the 1st part of the NOP that we want */
; 167  :         for( ; nop_type > 0; nop_type--,i++ ) {

	cmp	ebx, eax
	ja	SHORT $LL34@fill_in_ob
$LC32@fill_in_ob:

; 161  : 
; 162  :         i=1; /* here i is the index into the NOP table */
; 163  :         for( nop_type = NopLists[ ModuleInfo.Ofssize ][0]; nop_type > size ; nop_type-- ) {

	cmp	ebx, esi
	jbe	SHORT $LN33@fill_in_ob

; 164  :             i+=nop_type;

	lea	ebp, DWORD PTR [rbx+1]

; 165  :         }
; 166  :         /* i now is the index of the 1st part of the NOP that we want */
; 167  :         for( ; nop_type > 0; nop_type--,i++ ) {

	dec	ebx
$LN33@fill_in_ob:
	lea	eax, DWORD PTR [r8+rcx]
	add	ebp, eax
$LN31@fill_in_ob:
	test	ebx, ebx
	jle	SHORT $LN46@fill_in_ob
	movsxd	rdi, ebp
	npad	11
$LL12@fill_in_ob:

; 168  :             OutputByte( NopLists[ ModuleInfo.Ofssize ][i] );

	movzx	eax, dl
	mov	rax, QWORD PTR [r14+rax*8]
	movzx	ecx, BYTE PTR [rax+rdi]
	call	OutputByte
	dec	ebx
	lea	rdi, QWORD PTR [rdi+1]
	test	ebx, ebx
	jle	SHORT $LN46@fill_in_ob

; 165  :         }
; 166  :         /* i now is the index of the 1st part of the NOP that we want */
; 167  :         for( ; nop_type > 0; nop_type--,i++ ) {

	movzx	edx, BYTE PTR ModuleInfo+404
	jmp	SHORT $LL12@fill_in_ob
$LN46@fill_in_ob:
	mov	rdi, QWORD PTR [rsp+64]
	mov	rbp, QWORD PTR [rsp+56]
	mov	rbx, QWORD PTR [rsp+48]
	mov	r14, QWORD PTR [rsp+72]

; 169  :         }
; 170  :     }
; 171  : }

	add	rsp, 32					; 00000020H
	pop	rsi
	ret	0
fill_in_objfile_space ENDP
_TEXT	ENDS
; Function compile flags: /Ogtpy
; File d:\hjwasm\hjwasm2.13.1s\hjwasm2.13.1s\posndir.c
_TEXT	SEGMENT
opndx$ = 48
i$ = 176
tokenarray$ = 184
OrgDirective PROC

; 94   : {

$LN18:
	mov	r11, rsp
	push	rbx
	sub	rsp, 160				; 000000a0H

; 95   :     //struct asym  *sym;
; 96   :     //int_32       value = 0;
; 97   :     struct expr opndx;
; 98   : 
; 99   :     DebugMsg1(("OrgDirective(%u) enter\n", i));
; 100  :     i++;
; 101  :     /* v2.09: if -Zne is set, don't allow forward reference in ORG argument */
; 102  :     //if ( ( ERROR == EvalOperand( &i, tokenarray, Token_Count, &opndx, 0 ) ) )
; 103  :     if ( ( ERROR == EvalOperand( &i, tokenarray, Token_Count, &opndx, Options.strict_masm_compat ? EXPF_NOUNDEF : 0 ) ) )

	movzx	eax, BYTE PTR Options+127
	lea	r9, QWORD PTR [r11-120]
	mov	r8d, DWORD PTR ModuleInfo+496
	inc	ecx
	mov	DWORD PTR [r11+8], ecx
	neg	al
	mov	rbx, rdx
	sbb	cl, cl
	and	cl, 2
	mov	BYTE PTR [rsp+32], cl
	lea	rcx, QWORD PTR [r11+8]
	call	EvalOperand
	cmp	eax, -1
	jne	SHORT $LN2@OrgDirecti

; 104  :         return( ERROR );

	or	eax, eax

; 128  : }

	add	rsp, 160				; 000000a0H
	pop	rbx
	ret	0
$LN2@OrgDirecti:

; 105  :     if ( tokenarray[i].token != T_FINAL ) {

	movsxd	rax, DWORD PTR i$[rsp]
	shl	rax, 5
	cmp	BYTE PTR [rax+rbx], 0
	je	SHORT $LN3@OrgDirecti

; 106  :         return( EmitErr( SYNTAX_ERROR_EX, tokenarray[i].string_ptr ) );

	mov	rdx, QWORD PTR [rax+rbx+8]
	mov	ecx, 210				; 000000d2H
	call	EmitErr

; 128  : }

	add	rsp, 160				; 000000a0H
	pop	rbx
	ret	0
$LN3@OrgDirecti:

; 107  :     }
; 108  :     if ( CurrStruct ) {

	cmp	QWORD PTR CurrStruct, 0
	je	SHORT $LN4@OrgDirecti

; 109  :         if ( opndx.kind == EXPR_CONST )

	cmp	DWORD PTR opndx$[rsp+60], 0
	jne	$LN14@OrgDirecti

; 110  :             return( SetStructCurrentOffset( opndx.value ) );

	mov	ecx, DWORD PTR opndx$[rsp]
	call	SetStructCurrentOffset

; 128  : }

	add	rsp, 160				; 000000a0H
	pop	rbx
	ret	0
$LN4@OrgDirecti:

; 111  :     } else {
; 112  :         if( CurrSeg == NULL ) {

	mov	r10, QWORD PTR ModuleInfo+432
	test	r10, r10
	jne	SHORT $LN7@OrgDirecti

; 113  :             return( EmitError( MUST_BE_IN_SEGMENT_BLOCK ) );

	lea	ecx, QWORD PTR [r10+83]

; 126  :     }
; 127  :     return( EmitError( ORG_NEEDS_A_CONSTANT_OR_LOCAL_OFFSET ) );

	call	EmitError

; 128  : }

	add	rsp, 160				; 000000a0H
	pop	rbx
	ret	0
$LN7@OrgDirecti:

; 114  :         }
; 115  : #if FASTPASS
; 116  :         if ( StoreState == FALSE ) FStoreLine(0);

	cmp	BYTE PTR StoreState, 0
	jne	SHORT $LN9@OrgDirecti
	cmp	DWORD PTR Parse_Pass, 0
	jne	SHORT $LN11@OrgDirecti
	mov	rcx, QWORD PTR ModuleInfo+464
	xor	r8d, r8d
	xor	edx, edx
	call	StoreLine
	mov	r10, QWORD PTR ModuleInfo+432
$LN9@OrgDirecti:

; 117  : #endif
; 118  :         /* v2.04: added */
; 119  :         if ( Parse_Pass == PASS_1 && CurrSeg->e.seginfo->FixupList.head )

	cmp	DWORD PTR Parse_Pass, 0
	jne	SHORT $LN11@OrgDirecti
	mov	rax, QWORD PTR [r10+96]
	mov	rcx, QWORD PTR [rax+40]
	test	rcx, rcx
	je	SHORT $LN11@OrgDirecti

; 120  :             CurrSeg->e.seginfo->FixupList.head->orgoccured = TRUE;

	or	BYTE PTR [rcx+33], 2
	mov	r10, QWORD PTR ModuleInfo+432
$LN11@OrgDirecti:

; 121  : 
; 122  :         if ( opndx.kind == EXPR_CONST )

	mov	eax, DWORD PTR opndx$[rsp+60]
	test	eax, eax
	jne	SHORT $LN12@OrgDirecti

; 123  :             return( SetCurrOffset( CurrSeg, opndx.value, FALSE, FALSE ) );

	mov	edx, DWORD PTR opndx$[rsp]
	xor	r9d, r9d
	xor	r8d, r8d
	mov	rcx, r10
	call	SetCurrOffset

; 128  : }

	add	rsp, 160				; 000000a0H
	pop	rbx
	ret	0
$LN12@OrgDirecti:

; 124  :         else if ( opndx.kind == EXPR_ADDR && opndx.indirect == FALSE )

	cmp	eax, 1
	jne	SHORT $LN14@OrgDirecti
	test	BYTE PTR opndx$[rsp+76], al
	jne	SHORT $LN14@OrgDirecti

; 125  :             return( SetCurrOffset( CurrSeg, opndx.sym->offset + opndx.value, FALSE, FALSE ) );

	mov	rax, QWORD PTR opndx$[rsp+80]
	xor	r9d, r9d
	mov	edx, DWORD PTR opndx$[rsp]
	xor	r8d, r8d
	mov	rcx, r10
	add	edx, DWORD PTR [rax+16]
	call	SetCurrOffset

; 128  : }

	add	rsp, 160				; 000000a0H
	pop	rbx
	ret	0
$LN14@OrgDirecti:

; 126  :     }
; 127  :     return( EmitError( ORG_NEEDS_A_CONSTANT_OR_LOCAL_OFFSET ) );

	mov	ecx, 41					; 00000029H
	call	EmitError

; 128  : }

	add	rsp, 160				; 000000a0H
	pop	rbx
	ret	0
OrgDirective ENDP
_TEXT	ENDS
; Function compile flags: /Ogtpy
; File d:\hjwasm\hjwasm2.13.1s\hjwasm2.13.1s\posndir.c
_TEXT	SEGMENT
value$ = 48
AlignCurrOffset PROC

; 177  : {

$LN5:
	push	rbx
	sub	rsp, 32					; 00000020H

; 178  :     int seg_align;
; 179  :     int alignment = (1 << value);

	mov	ebx, 1
	shl	ebx, cl

; 180  :     unsigned int CurrAddr;
; 181  : 
; 182  :     CurrAddr = GetCurrOffset();

	call	GetCurrOffset

; 183  :     seg_align = CurrAddr % alignment;

	xor	edx, edx
	div	ebx

; 184  :     if( seg_align ) {

	test	edx, edx
	je	SHORT $LN2@AlignCurrO

; 185  :         alignment -= seg_align;

	sub	ebx, edx

; 186  :         fill_in_objfile_space( alignment );

	mov	ecx, ebx

; 187  :     }
; 188  : }

	add	rsp, 32					; 00000020H
	pop	rbx

; 186  :         fill_in_objfile_space( alignment );

	jmp	fill_in_objfile_space
$LN2@AlignCurrO:

; 187  :     }
; 188  : }

	add	rsp, 32					; 00000020H
	pop	rbx
	ret	0
AlignCurrOffset ENDP
_TEXT	ENDS
END
