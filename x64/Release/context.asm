; Listing generated by Microsoft (R) Optimizing Compiler Version 19.00.23026.0 

include listing.inc

INCLUDELIB LIBCMT
INCLUDELIB OLDNAMES

_DATA	SEGMENT
COMM	decoflags:BYTE
COMM	broadflags:BYTE
COMM	evex:BYTE
_DATA	ENDS
_DATA	SEGMENT
$SG10829 DB	'ASSUMES', 00H
$SG10830 DB	'RADIX', 00H
	ORG $+2
$SG10831 DB	'LISTING', 00H
$SG10832 DB	'CPU', 00H
$SG10834 DB	'ALL', 00H
$SG10833 DB	'ALIGNMENT', 00H
_DATA	ENDS
PUBLIC	ContextSaveState
PUBLIC	ContextDirective
PUBLIC	ContextInit
EXTRN	_stricmp:PROC
EXTRN	EmitErr:PROC
EXTRN	LclAlloc:PROC
EXTRN	SetSegAssumeTable:PROC
EXTRN	GetSegAssumeTable:PROC
EXTRN	SetStdAssumeTable:PROC
EXTRN	GetStdAssumeTable:PROC
EXTRN	Options:BYTE
EXTRN	ModuleInfo:BYTE
EXTRN	sym_Cpu:QWORD
pdata	SEGMENT
$pdata$ContextSaveState DD imagerel $LN20
	DD	imagerel $LN20+273
	DD	imagerel $unwind$ContextSaveState
$pdata$ContextDirective DD imagerel $LN75
	DD	imagerel $LN75+1073
	DD	imagerel $unwind$ContextDirective
pdata	ENDS
;	COMDAT pdata
pdata	SEGMENT
$pdata$ContextRestoreState DD imagerel ContextRestoreState
	DD	imagerel ContextRestoreState+22
	DD	imagerel $unwind$ContextRestoreState
pdata	ENDS
;	COMDAT pdata
pdata	SEGMENT
$pdata$0$ContextRestoreState DD imagerel ContextRestoreState+22
	DD	imagerel ContextRestoreState+288
	DD	imagerel $chain$0$ContextRestoreState
pdata	ENDS
;	COMDAT pdata
pdata	SEGMENT
$pdata$1$ContextRestoreState DD imagerel ContextRestoreState+288
	DD	imagerel ContextRestoreState+294
	DD	imagerel $chain$1$ContextRestoreState
pdata	ENDS
CONST	SEGMENT
typetab	DD	01H
	DD	02H
	DD	04H
	DD	08H
	DD	010H
	DD	0fH
contextnames DQ	FLAT:$SG10829
	DQ	FLAT:$SG10830
	DQ	FLAT:$SG10831
	DQ	FLAT:$SG10832
	DQ	FLAT:$SG10833
	DQ	FLAT:$SG10834
CONST	ENDS
;	COMDAT xdata
xdata	SEGMENT
$chain$1$ContextRestoreState DD 021H
	DD	imagerel ContextRestoreState
	DD	imagerel ContextRestoreState+22
	DD	imagerel $unwind$ContextRestoreState
xdata	ENDS
;	COMDAT xdata
xdata	SEGMENT
$chain$0$ContextRestoreState DD 020521H
	DD	063405H
	DD	imagerel ContextRestoreState
	DD	imagerel ContextRestoreState+22
	DD	imagerel $unwind$ContextRestoreState
xdata	ENDS
;	COMDAT xdata
xdata	SEGMENT
$unwind$ContextRestoreState DD 020601H
	DD	070023206H
xdata	ENDS
xdata	SEGMENT
$unwind$ContextSaveState DD 010401H
	DD	04204H
$unwind$ContextDirective DD 091501H
	DD	0f0116215H
	DD	0d00de00fH
	DD	07009c00bH
	DD	050076008H
	DD	03006H
xdata	ENDS
; Function compile flags: /Ogtpy
; File d:\hjwasm\hjwasm2.13.1s\hjwasm2.13.1s\context.c
_TEXT	SEGMENT
pass$ = 8
ContextInit PROC

; 299  :     /* if ContextStack isn't NULL, then at least one PUSHCONTEXT
; 300  :      * didn't have a matching POPCONTEXT. No need to reset it to NULL -
; 301  :      * but might be ok to move the items to the ContextFree heap.
; 302  :      */
; 303  :     //ContextStack = NULL;
; 304  : #if FASTPASS
; 305  :     if ( pass > PASS_1 ) {

	test	ecx, ecx
	jg	ContextRestoreState
$LN2@ContextIni:

; 306  :         ContextRestoreState();
; 307  :     }
; 308  : #endif
; 309  : }

	ret	0
ContextInit ENDP
_TEXT	ENDS
; Function compile flags: /Ogtpy
; File d:\hjwasm\hjwasm2.13.1s\hjwasm2.13.1s\context.c
;	COMDAT ContextRestoreState
_TEXT	SEGMENT
ContextRestoreState PROC				; COMDAT

; 276  : {

	push	rdi
	sub	rsp, 32					; 00000020H

; 277  :     int i;
; 278  :     struct context *dst;
; 279  : 
; 280  :     for ( i = cntSavedContexts ; i ; i-- ) {

	movsxd	rdi, DWORD PTR ModuleInfo+264
	test	rdi, rdi
	je	$LN3@ContextRes
	mov	QWORD PTR [rsp+48], rbx
	imul	rbx, rdi, 752				; 000002f0H
	sub	rbx, 752				; 000002f0H
	npad	7
$LL4@ContextRes:

; 281  :         if ( ContextFree ) {

	mov	r8, QWORD PTR ModuleInfo+248
	test	r8, r8
	je	SHORT $LN5@ContextRes

; 282  :             dst = ContextFree;
; 283  :             ContextFree = dst->next;

	mov	rax, QWORD PTR [r8]
	mov	QWORD PTR ModuleInfo+248, rax

; 284  :         } else

	jmp	SHORT $LN6@ContextRes
$LN5@ContextRes:

; 285  :             dst = LclAlloc( sizeof( struct context ) );

	mov	ecx, 752				; 000002f0H
	call	LclAlloc
	mov	r8, rax
$LN6@ContextRes:

; 286  :         memcpy( dst, &SavedContexts[i-1], sizeof( struct context ) );

	mov	rcx, QWORD PTR ModuleInfo+256
	mov	rdx, r8
	add	rcx, rbx
	mov	eax, 5
	npad	9
$LL12@ContextRes:
	lea	rdx, QWORD PTR [rdx+128]
	movups	xmm0, XMMWORD PTR [rcx]
	lea	rcx, QWORD PTR [rcx+128]
	movups	XMMWORD PTR [rdx-128], xmm0
	movups	xmm1, XMMWORD PTR [rcx-112]
	movups	XMMWORD PTR [rdx-112], xmm1
	movups	xmm0, XMMWORD PTR [rcx-96]
	movups	XMMWORD PTR [rdx-96], xmm0
	movups	xmm1, XMMWORD PTR [rcx-80]
	movups	XMMWORD PTR [rdx-80], xmm1
	movups	xmm0, XMMWORD PTR [rcx-64]
	movups	XMMWORD PTR [rdx-64], xmm0
	movups	xmm1, XMMWORD PTR [rcx-48]
	movups	XMMWORD PTR [rdx-48], xmm1
	movups	xmm0, XMMWORD PTR [rcx-32]
	movups	XMMWORD PTR [rdx-32], xmm0
	movups	xmm1, XMMWORD PTR [rcx-16]
	movups	XMMWORD PTR [rdx-16], xmm1
	sub	rax, 1
	jne	SHORT $LL12@ContextRes
	movups	xmm0, XMMWORD PTR [rcx]
	sub	rbx, 752				; 000002f0H
	movups	XMMWORD PTR [rdx], xmm0
	movups	xmm1, XMMWORD PTR [rcx+16]
	movups	XMMWORD PTR [rdx+16], xmm1
	movups	xmm0, XMMWORD PTR [rcx+32]
	movups	XMMWORD PTR [rdx+32], xmm0
	movups	xmm1, XMMWORD PTR [rcx+48]
	movups	XMMWORD PTR [rdx+48], xmm1
	movups	xmm0, XMMWORD PTR [rcx+64]
	movups	XMMWORD PTR [rdx+64], xmm0
	movups	xmm1, XMMWORD PTR [rcx+80]
	movups	XMMWORD PTR [rdx+80], xmm1
	movups	xmm0, XMMWORD PTR [rcx+96]
	movups	XMMWORD PTR [rdx+96], xmm0

; 287  :         dst->next = ContextStack;

	mov	rax, QWORD PTR ModuleInfo+240
	mov	QWORD PTR [r8], rax

; 288  :         ContextStack = dst;

	mov	QWORD PTR ModuleInfo+240, r8
	sub	rdi, 1
	jne	$LL4@ContextRes
	mov	rbx, QWORD PTR [rsp+48]
$LN3@ContextRes:

; 289  :     }
; 290  : }

	add	rsp, 32					; 00000020H
	pop	rdi
	ret	0
ContextRestoreState ENDP
_TEXT	ENDS
; Function compile flags: /Ogtpy
; File d:\hjwasm\hjwasm2.13.1s\hjwasm2.13.1s\context.c
_TEXT	SEGMENT
tv730 = 32
type$ = 128
i$ = 128
tokenarray$ = 136
tv676 = 144
tv690 = 152
ContextDirective PROC

; 107  : {

$LN75:
	mov	QWORD PTR [rsp+16], rdx
	push	rbx
	push	rbp
	push	rsi
	push	rdi
	push	r12
	push	r13
	push	r14
	push	r15
	sub	rsp, 56					; 00000038H
	movsxd	r12, ecx

; 108  :     int start = i;
; 109  :     int directive = tokenarray[i].tokval;

	mov	rax, r12

; 110  :     enum context_type type;
; 111  :     int j;
; 112  :     struct context *curr;
; 113  : 
; 114  :     DebugMsg(( "%s directive enter\n", tokenarray[i].string_ptr ));
; 115  : 
; 116  :     i++; /* skip CONTEXT keyword */

	inc	r12d

; 117  : 
; 118  :     while ( tokenarray[i].token == T_ID ) {

	movsxd	r13, r12d
	shl	r13, 5
	add	r13, rdx
	mov	QWORD PTR tv730[rsp], rax
	shl	rax, 5
	cmp	BYTE PTR [r13], 8
	movsxd	r8, DWORD PTR [rax+rdx+16]
	jne	$LN68@ContextDir

; 135  :         }
; 136  : 
; 137  :         if ( directive == T_POPCONTEXT ) {

	lea	rax, QWORD PTR [r13+32]
	mov	QWORD PTR tv690[rsp], r8
	mov	QWORD PTR tv676[rsp], rax
	lea	r15, QWORD PTR [r13+8]
	mov	rbp, r8
	lea	r14, OFFSET FLAT:typetab
$LN71@ContextDir:

; 119  :         for ( j = 0, type = -1; j < ( sizeof(typetab) / sizeof(typetab[0]) ); j++ ) {

	xor	esi, esi
	xor	ebx, ebx
	or	edi, -1
$LN73@ContextDir:

; 120  :             if ( _stricmp( contextnames[j], tokenarray[i].string_ptr ) == 0 ) {

	mov	rdx, QWORD PTR [r15]
	lea	rax, OFFSET FLAT:contextnames
	mov	rcx, QWORD PTR [rax+rbx*8]
	call	_stricmp
	test	eax, eax
	je	SHORT $LN50@ContextDir

; 119  :         for ( j = 0, type = -1; j < ( sizeof(typetab) / sizeof(typetab[0]) ); j++ ) {

	inc	esi
	inc	rbx
	movsxd	rax, esi
	cmp	rax, 6
	jae	$LN3@ContextDir
	jmp	SHORT $LN73@ContextDir
$LN50@ContextDir:

; 121  :                 type = typetab[j];

	mov	edi, DWORD PTR [r14+rbx*4]

; 122  :                 break;
; 123  :             }
; 124  :         }
; 125  : 
; 126  :         if ( type == -1 )

	cmp	edi, -1
	je	$LN3@ContextDir

; 127  :             break;
; 128  : 
; 129  :         /* reject ALIGNMENT if strict masm compat is on */
; 130  :         if ( Options.strict_masm_compat ) {

	cmp	BYTE PTR Options+127, 0
	je	SHORT $LN21@ContextDir

; 131  :             if ( type == CONT_ALIGNMENT )

	cmp	edi, 16
	je	$LN3@ContextDir

; 132  :                 break;
; 133  :             else
; 134  :                 type &= ~CONT_ALIGNMENT; /* in case ALIGNMENT is again included in ALL */

	and	edi, -17
$LN21@ContextDir:

; 135  :         }
; 136  : 
; 137  :         if ( directive == T_POPCONTEXT ) {

	cmp	rbp, 448				; 000001c0H
	jne	$LN22@ContextDir

; 138  :             struct context *prev;
; 139  :             struct context *next;
; 140  :             DebugMsg(( "POPCONTEXT type=%X\n", type ));
; 141  :             /* for POPCONTEXT, check if appropriate items are on the stack */
; 142  :             for ( prev = NULL, curr = ContextStack; curr && type; curr = next ) {

	mov	rbx, QWORD PTR ModuleInfo+240
	xor	r14d, r14d
	test	rbx, rbx
	je	$LN8@ContextDir
$LL9@ContextDir:
	test	edi, edi
	je	$LN70@ContextDir

; 143  : 
; 144  :                 DebugMsg(( "POPCONTEXT: found item with type=%X\n", curr->type ));
; 145  :                 next = curr->next;
; 146  :                 /* matching item on the stack? */
; 147  :                 if ( !( curr->type & type ) ) {

	mov	eax, DWORD PTR [rbx+8]
	mov	rsi, QWORD PTR [rbx]
	test	eax, edi
	jne	SHORT $LN24@ContextDir

; 148  :                     prev = curr;

	mov	r14, rbx

; 149  :                     continue;

	jmp	$LN7@ContextDir
$LN24@ContextDir:

; 150  :                 }
; 151  : 
; 152  :                 type &= ~curr->type;

	not	eax
	and	edi, eax

; 153  :                 if ( prev )

	test	r14, r14
	je	SHORT $LN25@ContextDir

; 154  :                     prev->next = next;

	mov	QWORD PTR [r14], rsi
	jmp	SHORT $LN26@ContextDir
$LN25@ContextDir:

; 155  :                 else
; 156  :                     ContextStack = next;

	mov	QWORD PTR ModuleInfo+240, rsi
$LN26@ContextDir:

; 157  : 
; 158  :                 curr->next = ContextFree;

	mov	rax, QWORD PTR ModuleInfo+248
	mov	QWORD PTR [rbx], rax

; 159  :                 ContextFree = curr;

	mov	QWORD PTR ModuleInfo+248, rbx

; 160  : 
; 161  :                 /* restore the values */
; 162  :                 switch ( curr->type ) {

	mov	ecx, DWORD PTR [rbx+8]
	sub	ecx, 1
	je	$LN27@ContextDir
	sub	ecx, 1
	je	$LN28@ContextDir
	sub	ecx, 2
	je	SHORT $LN30@ContextDir
	sub	ecx, 4
	je	SHORT $LN31@ContextDir
	cmp	ecx, 8
	jne	$LN7@ContextDir

; 170  :                 case CONT_ALIGNMENT:
; 171  :                     ModuleInfo.fieldalign = curr->alc.fieldalign;

	movzx	eax, BYTE PTR [rbx+16]
	mov	BYTE PTR ModuleInfo+397, al

; 172  :                     ModuleInfo.procalign  = curr->alc.procalign;

	movzx	eax, BYTE PTR [rbx+17]
	mov	BYTE PTR ModuleInfo+399, al

; 173  :                     break;

	jmp	$LN7@ContextDir
$LN31@ContextDir:

; 181  :                 case CONT_CPU:
; 182  :                     ModuleInfo.cpu      = curr->cc.cpu;
; 183  :                     if ( sym_Cpu )

	mov	rcx, QWORD PTR sym_Cpu
	movzx	eax, WORD PTR [rbx+16]
	mov	WORD PTR ModuleInfo+388, ax
	test	rcx, rcx
	je	SHORT $LN32@ContextDir

; 184  :                         sym_Cpu->value  = curr->cc.cpu;

	movsx	eax, WORD PTR [rbx+16]
	mov	DWORD PTR [rcx+16], eax
$LN32@ContextDir:

; 185  :                     ModuleInfo.curr_cpu = curr->cc.curr_cpu;

	mov	eax, DWORD PTR [rbx+20]
	mov	DWORD PTR ModuleInfo+392, eax
	jmp	$LN7@ContextDir
$LN30@ContextDir:

; 174  :                 case CONT_LISTING:
; 175  :                     ModuleInfo.list_macro = curr->lc.list_macro;

	mov	eax, DWORD PTR [rbx+16]

; 176  :                     ModuleInfo.list       = curr->lc.list;

	mov	ecx, DWORD PTR ModuleInfo+408
	mov	DWORD PTR ModuleInfo+400, eax
	movzx	eax, BYTE PTR [rbx+20]
	shl	eax, 11
	xor	eax, ecx
	and	eax, 2048				; 00000800H
	xor	ecx, eax
	mov	DWORD PTR ModuleInfo+408, ecx

; 177  :                     ModuleInfo.cref       = curr->lc.cref;

	movzx	eax, BYTE PTR [rbx+20]
	shl	eax, 11
	xor	eax, ecx
	and	eax, 4096				; 00001000H
	xor	ecx, eax
	mov	DWORD PTR ModuleInfo+408, ecx

; 178  :                     ModuleInfo.listif     = curr->lc.listif;

	movzx	eax, BYTE PTR [rbx+20]
	shl	eax, 11
	xor	eax, ecx
	and	eax, 8192				; 00002000H
	xor	ecx, eax
	mov	DWORD PTR ModuleInfo+408, ecx

; 179  :                     ModuleInfo.list_generated_code = curr->lc.list_generated_code;

	movzx	eax, BYTE PTR [rbx+20]
	shl	eax, 11
	xor	eax, ecx
	and	eax, 16384				; 00004000H
	xor	ecx, eax
	mov	DWORD PTR ModuleInfo+408, ecx

; 180  :                     break;

	jmp	SHORT $LN7@ContextDir
$LN28@ContextDir:

; 166  :                     break;
; 167  :                 case CONT_RADIX:
; 168  :                     ModuleInfo.radix = curr->rc.radix;

	movzx	eax, BYTE PTR [rbx+16]
	mov	BYTE PTR ModuleInfo+396, al

; 169  :                     break;

	jmp	SHORT $LN7@ContextDir
$LN27@ContextDir:

; 163  :                 case CONT_ASSUMES:
; 164  :                     SetSegAssumeTable( curr->ac.SegAssumeTable );

	lea	rcx, QWORD PTR [rbx+16]
	call	SetSegAssumeTable

; 165  :                     SetStdAssumeTable( curr->ac.StdAssumeTable, curr->ac.type_content );

	lea	rdx, QWORD PTR [rbx+368]
	lea	rcx, QWORD PTR [rbx+112]
	call	SetStdAssumeTable
$LN7@ContextDir:

; 138  :             struct context *prev;
; 139  :             struct context *next;
; 140  :             DebugMsg(( "POPCONTEXT type=%X\n", type ));
; 141  :             /* for POPCONTEXT, check if appropriate items are on the stack */
; 142  :             for ( prev = NULL, curr = ContextStack; curr && type; curr = next ) {

	mov	rbx, rsi
	test	rsi, rsi
	jne	$LL9@ContextDir
$LN8@ContextDir:

; 186  :                 }
; 187  :             }
; 188  :             if ( type ) {

	test	edi, edi
	jne	$LN53@ContextDir
$LN70@ContextDir:
	lea	r14, OFFSET FLAT:typetab
$LN13@ContextDir:

; 231  :                         break;
; 232  :                     }
; 233  :                 }
; 234  :             }
; 235  :         }
; 236  : 
; 237  :         i++;

	mov	rax, QWORD PTR tv676[rsp]
	add	r13, 32					; 00000020H
	add	rax, 32					; 00000020H
	inc	r12d
	add	r15, 32					; 00000020H
	mov	QWORD PTR tv676[rsp], rax

; 238  :         if ( tokenarray[i].token == T_COMMA && tokenarray[i+1].token != T_FINAL )

	cmp	BYTE PTR [r13], 44			; 0000002cH
	jne	SHORT $LN42@ContextDir
	cmp	BYTE PTR [rax], 0
	je	SHORT $LN42@ContextDir

; 239  :             i++;

	add	rax, 32					; 00000020H
	inc	r12d
	add	r13, 32					; 00000020H
	mov	QWORD PTR tv676[rsp], rax
	add	r15, 32					; 00000020H
$LN42@ContextDir:

; 117  : 
; 118  :     while ( tokenarray[i].token == T_ID ) {

	cmp	BYTE PTR [r13], 8
	jne	$LN3@ContextDir
	jmp	$LN71@ContextDir
$LN22@ContextDir:

; 191  :             }
; 192  :         } else {
; 193  :             DebugMsg(( "PUSHCONTEXT type=%X\n", type ));
; 194  :             for ( j = 0; j < ( sizeof(typetab) / sizeof(typetab[0] ) ) && type; j++ ) {

	xor	ebp, ebp
	mov	rsi, r14
$LL14@ContextDir:
	test	edi, edi
	je	$LN69@ContextDir

; 195  :                 if ( type & typetab[j] ) {

	mov	eax, DWORD PTR [rsi]
	test	eax, edi
	je	$LN12@ContextDir

; 196  : 
; 197  :                     type &= ~typetab[j];
; 198  : 
; 199  :                     if ( ContextFree ) {

	mov	rbx, QWORD PTR ModuleInfo+248
	not	eax
	and	edi, eax
	test	rbx, rbx
	je	SHORT $LN35@ContextDir

; 200  :                         curr = ContextFree;
; 201  :                         ContextFree = curr->next;

	mov	rax, QWORD PTR [rbx]
	mov	QWORD PTR ModuleInfo+248, rax

; 202  :                     } else

	jmp	SHORT $LN36@ContextDir
$LN35@ContextDir:

; 203  :                         curr = LclAlloc( sizeof( struct context ) );

	mov	ecx, 752				; 000002f0H
	call	LclAlloc
	mov	rbx, rax
$LN36@ContextDir:

; 204  : 
; 205  :                     curr->type = typetab[j];

	mov	eax, DWORD PTR [rsi]
	mov	DWORD PTR [rbx+8], eax

; 206  :                     curr->next = ContextStack;

	mov	rcx, QWORD PTR ModuleInfo+240
	mov	QWORD PTR [rbx], rcx

; 207  :                     ContextStack = curr;

	mov	QWORD PTR ModuleInfo+240, rbx

; 208  : 
; 209  :                     switch ( typetab[j] ) {

	sub	eax, 1
	je	$LN37@ContextDir
	sub	eax, 1
	je	$LN38@ContextDir
	sub	eax, 2
	je	SHORT $LN40@ContextDir
	sub	eax, 4
	je	SHORT $LN41@ContextDir
	cmp	eax, 8
	jne	$LN12@ContextDir

; 217  :                     case CONT_ALIGNMENT:
; 218  :                         curr->alc.fieldalign = ModuleInfo.fieldalign;

	movzx	eax, BYTE PTR ModuleInfo+397
	mov	BYTE PTR [rbx+16], al

; 219  :                         curr->alc.procalign  = ModuleInfo.procalign;

	movzx	eax, BYTE PTR ModuleInfo+399
	mov	BYTE PTR [rbx+17], al

; 220  :                         break;

	jmp	$LN12@ContextDir
$LN41@ContextDir:

; 228  :                     case CONT_CPU:
; 229  :                         curr->cc.cpu      = ModuleInfo.cpu;

	movzx	eax, WORD PTR ModuleInfo+388
	mov	WORD PTR [rbx+16], ax

; 230  :                         curr->cc.curr_cpu = ModuleInfo.curr_cpu;

	mov	eax, DWORD PTR ModuleInfo+392
	mov	DWORD PTR [rbx+20], eax
	jmp	$LN12@ContextDir
$LN40@ContextDir:

; 221  :                     case CONT_LISTING:
; 222  :                         curr->lc.list_macro = ModuleInfo.list_macro;

	mov	eax, DWORD PTR ModuleInfo+400
	mov	DWORD PTR [rbx+16], eax

; 223  :                         curr->lc.list       = ModuleInfo.list;

	mov	eax, DWORD PTR ModuleInfo+408
	shr	eax, 11
	xor	al, BYTE PTR [rbx+20]
	and	al, 1
	xor	BYTE PTR [rbx+20], al

; 224  :                         curr->lc.cref       = ModuleInfo.cref;

	mov	ecx, DWORD PTR ModuleInfo+408
	shr	ecx, 12
	add	cl, cl
	xor	cl, BYTE PTR [rbx+20]
	and	cl, 2
	xor	cl, BYTE PTR [rbx+20]
	mov	BYTE PTR [rbx+20], cl

; 225  :                         curr->lc.listif     = ModuleInfo.listif;

	mov	edx, DWORD PTR ModuleInfo+408
	shr	edx, 13
	shl	dl, 2
	xor	dl, cl
	and	dl, 4
	xor	dl, cl
	mov	BYTE PTR [rbx+20], dl

; 226  :                         curr->lc.list_generated_code = ModuleInfo.list_generated_code;

	mov	eax, DWORD PTR ModuleInfo+408
	shr	eax, 14
	shl	al, 3
	xor	al, dl
	and	al, 8
	xor	al, dl
	mov	BYTE PTR [rbx+20], al

; 227  :                         break;

	jmp	SHORT $LN12@ContextDir
$LN38@ContextDir:

; 213  :                         break;
; 214  :                     case CONT_RADIX:
; 215  :                         curr->rc.radix = ModuleInfo.radix;

	movzx	eax, BYTE PTR ModuleInfo+396
	mov	BYTE PTR [rbx+16], al

; 216  :                         break;

	jmp	SHORT $LN12@ContextDir
$LN37@ContextDir:

; 210  :                     case CONT_ASSUMES:
; 211  :                         GetSegAssumeTable( curr->ac.SegAssumeTable );

	lea	rcx, QWORD PTR [rbx+16]
	call	GetSegAssumeTable

; 212  :                         GetStdAssumeTable( curr->ac.StdAssumeTable, curr->ac.type_content );

	lea	rdx, QWORD PTR [rbx+368]
	lea	rcx, QWORD PTR [rbx+112]
	call	GetStdAssumeTable
$LN12@ContextDir:

; 191  :             }
; 192  :         } else {
; 193  :             DebugMsg(( "PUSHCONTEXT type=%X\n", type ));
; 194  :             for ( j = 0; j < ( sizeof(typetab) / sizeof(typetab[0] ) ) && type; j++ ) {

	inc	ebp
	add	rsi, 4
	movsxd	rax, ebp
	cmp	rax, 6
	jb	$LL14@ContextDir
$LN69@ContextDir:
	mov	rbp, QWORD PTR tv690[rsp]
	jmp	$LN13@ContextDir
$LN53@ContextDir:

; 189  :                 DebugMsg(( "POPCONTEXT error, remaining type flags=%X\n", type ));
; 190  :                 return( EmitErr( UNMATCHED_BLOCK_NESTING, tokenarray[start].tokpos ) );

	mov	rcx, QWORD PTR tokenarray$[rsp]
	mov	rbp, QWORD PTR tv730[rsp]
	shl	rbp, 5
	mov	rdx, QWORD PTR [rcx+rbp+24]
	mov	ecx, 143				; 0000008fH
	jmp	SHORT $LN72@ContextDir
$LN68@ContextDir:
	mov	edi, DWORD PTR type$[rsp]
$LN3@ContextDir:

; 240  :     }
; 241  : 
; 242  :     if ( tokenarray[i].token != T_FINAL || type == -1 ) {

	mov	rcx, QWORD PTR tokenarray$[rsp]
	movsxd	rdx, r12d
	shl	rdx, 5
	cmp	BYTE PTR [rdx+rcx], 0
	jne	SHORT $LN44@ContextDir
	cmp	edi, -1
	je	SHORT $LN44@ContextDir

; 244  :     }
; 245  : 
; 246  :     return( NOT_ERROR );

	xor	eax, eax
	jmp	SHORT $LN1@ContextDir
$LN44@ContextDir:

; 243  :         return( EmitErr( SYNTAX_ERROR_EX, tokenarray[i].tokpos ) );

	mov	rdx, QWORD PTR [rdx+rcx+24]
	mov	ecx, 210				; 000000d2H
$LN72@ContextDir:
	call	EmitErr
$LN1@ContextDir:

; 247  : }

	add	rsp, 56					; 00000038H
	pop	r15
	pop	r14
	pop	r13
	pop	r12
	pop	rdi
	pop	rsi
	pop	rbp
	pop	rbx
	ret	0
ContextDirective ENDP
_TEXT	ENDS
; Function compile flags: /Ogtpy
; File d:\hjwasm\hjwasm2.13.1s\hjwasm2.13.1s\context.c
_TEXT	SEGMENT
ContextSaveState PROC

; 255  : {

$LN20:
	sub	rsp, 40					; 00000028H

; 256  :     int i;
; 257  :     struct context *src;
; 258  :     struct context *dst;
; 259  : 
; 260  :     for ( i = 0, src = ContextStack ; src ; i++, src = src->next );

	mov	rax, QWORD PTR ModuleInfo+240
	xor	ecx, ecx
	test	rax, rax
	je	$LN6@ContextSav
$LL4@ContextSav:
	mov	rax, QWORD PTR [rax]
	inc	ecx
	test	rax, rax
	jne	SHORT $LL4@ContextSav

; 261  : 
; 262  :     if ( i ) {

	test	ecx, ecx
	je	$LN6@ContextSav

; 263  :         cntSavedContexts = i;
; 264  :         SavedContexts = LclAlloc( i * sizeof( struct context ) );

	movsxd	rax, ecx
	mov	DWORD PTR ModuleInfo+264, ecx
	imul	rcx, rax, 752				; 000002f0H
	call	LclAlloc

; 265  :         DebugMsg(( "ContextSaveState: SavedContexts=%X\n", SavedContexts ));
; 266  :         for ( src = ContextStack, dst = SavedContexts ; src ; src = src->next, dst++ ) {

	mov	r8, QWORD PTR ModuleInfo+240
	mov	r9, rax
	mov	QWORD PTR ModuleInfo+256, rax
	test	r8, r8
	je	$LN6@ContextSav
	npad	9
$LL7@ContextSav:

; 267  :             memcpy( dst, src, sizeof( struct context ) );

	mov	rdx, r9
	mov	rcx, r8
	mov	eax, 5
	npad	5
$LL18@ContextSav:
	lea	rdx, QWORD PTR [rdx+128]
	movups	xmm0, XMMWORD PTR [rcx]
	lea	rcx, QWORD PTR [rcx+128]
	movups	XMMWORD PTR [rdx-128], xmm0
	movups	xmm1, XMMWORD PTR [rcx-112]
	movups	XMMWORD PTR [rdx-112], xmm1
	movups	xmm0, XMMWORD PTR [rcx-96]
	movups	XMMWORD PTR [rdx-96], xmm0
	movups	xmm1, XMMWORD PTR [rcx-80]
	movups	XMMWORD PTR [rdx-80], xmm1
	movups	xmm0, XMMWORD PTR [rcx-64]
	movups	XMMWORD PTR [rdx-64], xmm0
	movups	xmm1, XMMWORD PTR [rcx-48]
	movups	XMMWORD PTR [rdx-48], xmm1
	movups	xmm0, XMMWORD PTR [rcx-32]
	movups	XMMWORD PTR [rdx-32], xmm0
	movups	xmm1, XMMWORD PTR [rcx-16]
	movups	XMMWORD PTR [rdx-16], xmm1
	sub	rax, 1
	jne	SHORT $LL18@ContextSav
	movups	xmm0, XMMWORD PTR [rcx]
	add	r9, 752					; 000002f0H
	movups	XMMWORD PTR [rdx], xmm0
	movups	xmm1, XMMWORD PTR [rcx+16]
	movups	XMMWORD PTR [rdx+16], xmm1
	movups	xmm0, XMMWORD PTR [rcx+32]
	movups	XMMWORD PTR [rdx+32], xmm0
	movups	xmm1, XMMWORD PTR [rcx+48]
	movups	XMMWORD PTR [rdx+48], xmm1
	movups	xmm0, XMMWORD PTR [rcx+64]
	movups	XMMWORD PTR [rdx+64], xmm0
	movups	xmm1, XMMWORD PTR [rcx+80]
	movups	XMMWORD PTR [rdx+80], xmm1
	movups	xmm0, XMMWORD PTR [rcx+96]
	movups	XMMWORD PTR [rdx+96], xmm0
	mov	r8, QWORD PTR [r8]
	test	r8, r8
	jne	$LL7@ContextSav
$LN6@ContextSav:

; 268  :         }
; 269  :     }
; 270  : }

	add	rsp, 40					; 00000028H
	ret	0
ContextSaveState ENDP
_TEXT	ENDS
END
