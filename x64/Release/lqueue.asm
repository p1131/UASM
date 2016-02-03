; Listing generated by Microsoft (R) Optimizing Compiler Version 19.00.23026.0 

include listing.inc

INCLUDELIB LIBCMT
INCLUDELIB OLDNAMES

_DATA	SEGMENT
COMM	decoflags:BYTE
COMM	broadflags:BYTE
COMM	evex:BYTE
_DATA	ENDS
PUBLIC	DeleteLineQueue
PUBLIC	AddLineQueue
PUBLIC	AddLineQueueX
PUBLIC	RunLineQueue
EXTRN	myltoa:PROC
EXTRN	MemAlloc:PROC
EXTRN	MemFree:PROC
EXTRN	GetResWName:PROC
EXTRN	PushInputStatus:PROC
EXTRN	PopInputStatus:PROC
EXTRN	ParseLine:PROC
EXTRN	PreprocessLine:PROC
EXTRN	memcpy:PROC
EXTRN	ModuleInfo:BYTE
EXTRN	ResWordTable:BYTE
pdata	SEGMENT
$pdata$DeleteLineQueue DD imagerel $LN12
	DD	imagerel $LN12+16
	DD	imagerel $unwind$DeleteLineQueue
$pdata$0$DeleteLineQueue DD imagerel $LN12+16
	DD	imagerel $LN12+42
	DD	imagerel $chain$0$DeleteLineQueue
$pdata$1$DeleteLineQueue DD imagerel $LN12+42
	DD	imagerel $LN12+58
	DD	imagerel $chain$1$DeleteLineQueue
$pdata$AddLineQueue DD imagerel $LN8
	DD	imagerel $LN8+120
	DD	imagerel $unwind$AddLineQueue
$pdata$AddLineQueueX DD imagerel $LN32
	DD	imagerel $LN32+27
	DD	imagerel $unwind$AddLineQueueX
$pdata$0$AddLineQueueX DD imagerel $LN32+27
	DD	imagerel $LN32+36
	DD	imagerel $chain$0$AddLineQueueX
$pdata$2$AddLineQueueX DD imagerel $LN32+36
	DD	imagerel $LN32+64
	DD	imagerel $chain$2$AddLineQueueX
$pdata$4$AddLineQueueX DD imagerel $LN32+64
	DD	imagerel $LN32+349
	DD	imagerel $chain$4$AddLineQueueX
$pdata$5$AddLineQueueX DD imagerel $LN32+349
	DD	imagerel $LN32+373
	DD	imagerel $chain$5$AddLineQueueX
$pdata$6$AddLineQueueX DD imagerel $LN32+373
	DD	imagerel $LN32+439
	DD	imagerel $chain$6$AddLineQueueX
$pdata$7$AddLineQueueX DD imagerel $LN32+439
	DD	imagerel $LN32+488
	DD	imagerel $chain$7$AddLineQueueX
$pdata$RunLineQueue DD imagerel $LN16
	DD	imagerel $LN16+60
	DD	imagerel $unwind$RunLineQueue
$pdata$0$RunLineQueue DD imagerel $LN16+60
	DD	imagerel $LN16+152
	DD	imagerel $chain$0$RunLineQueue
$pdata$1$RunLineQueue DD imagerel $LN16+152
	DD	imagerel $LN16+181
	DD	imagerel $chain$1$RunLineQueue
pdata	ENDS
xdata	SEGMENT
$unwind$DeleteLineQueue DD 010401H
	DD	04204H
$chain$0$DeleteLineQueue DD 020521H
	DD	043405H
	DD	imagerel $LN12
	DD	imagerel $LN12+16
	DD	imagerel $unwind$DeleteLineQueue
$chain$1$DeleteLineQueue DD 021H
	DD	imagerel $LN12
	DD	imagerel $LN12+16
	DD	imagerel $unwind$DeleteLineQueue
$unwind$AddLineQueue DD 060f01H
	DD	07640fH
	DD	06340fH
	DD	0700b320fH
$unwind$AddLineQueueX DD 031b01H
	DD	058011bH
	DD	03014H
$chain$0$AddLineQueueX DD 020421H
	DD	0575404H
	DD	imagerel $LN32
	DD	imagerel $LN32+27
	DD	imagerel $unwind$AddLineQueueX
$chain$2$AddLineQueueX DD 041221H
	DD	054e412H
	DD	0566404H
	DD	imagerel $LN32+27
	DD	imagerel $LN32+36
	DD	imagerel $chain$0$AddLineQueueX
$chain$4$AddLineQueueX DD 041321H
	DD	0557413H
	DD	053f404H
	DD	imagerel $LN32+36
	DD	imagerel $LN32+64
	DD	imagerel $chain$2$AddLineQueueX
$chain$5$AddLineQueueX DD 021H
	DD	imagerel $LN32+36
	DD	imagerel $LN32+64
	DD	imagerel $chain$2$AddLineQueueX
$chain$6$AddLineQueueX DD 021H
	DD	imagerel $LN32+27
	DD	imagerel $LN32+36
	DD	imagerel $chain$0$AddLineQueueX
$chain$7$AddLineQueueX DD 021H
	DD	imagerel $LN32
	DD	imagerel $LN32+27
	DD	imagerel $unwind$AddLineQueueX
$unwind$RunLineQueue DD 040a01H
	DD	0b340aH
	DD	06006720aH
$chain$0$RunLineQueue DD 020521H
	DD	0a7405H
	DD	imagerel $LN16
	DD	imagerel $LN16+60
	DD	imagerel $unwind$RunLineQueue
$chain$1$RunLineQueue DD 021H
	DD	imagerel $LN16
	DD	imagerel $LN16+60
	DD	imagerel $unwind$RunLineQueue
xdata	ENDS
; Function compile flags: /Ogtpy
; File d:\hjwasm\hjwasm2.13.1s\hjwasm2.13.1s\lqueue.c
_TEXT	SEGMENT
oldstat$ = 32
RunLineQueue PROC

; 168  : {

$LN16:
	mov	QWORD PTR [rsp+16], rbx
	push	rsi
	sub	rsp, 64					; 00000040H

; 169  :     struct input_status oldstat;
; 170  :     struct asm_tok *tokenarray;
; 171  :     struct lq_line *currline = line_queue.head;

	mov	rbx, QWORD PTR ModuleInfo+184

; 172  : 
; 173  :     DebugMsg1(( "RunLineQueue() enter\n" ));
; 174  : 
; 175  :     /* v2.03: ensure the current source buffer is still aligned */
; 176  :     tokenarray = PushInputStatus( &oldstat );

	lea	rcx, QWORD PTR oldstat$[rsp]
	call	PushInputStatus

; 177  :     ModuleInfo.GeneratedCode++;

	mov	ecx, DWORD PTR ModuleInfo+456
	mov	rsi, rax
	inc	ecx

; 178  : 
; 179  :     /* v2.11: line queues are no longer pushed onto the file stack.
; 180  :      * Instead, the queue is processed directly here.
; 181  :      */
; 182  :     line_queue.head = NULL;

	mov	QWORD PTR ModuleInfo+184, 0
	mov	DWORD PTR ModuleInfo+456, ecx

; 183  :     DebugCmd( lqlines_written = 0 ); /* reset counter for AddLineQueue() */
; 184  :     DebugCmd( lqlines_read = 0 ); /* reset counter for line-queue reads below */
; 185  : 
; 186  :     for ( ; currline; ) {

	test	rbx, rbx
	je	SHORT $LN3@RunLineQue
	mov	QWORD PTR [rsp+80], rdi
$LL2@RunLineQue:

; 187  :         struct lq_line *nextline = currline->next;

	mov	rdi, QWORD PTR [rbx]

; 188  :         strcpy( CurrSource, currline->line );

	lea	r8, QWORD PTR [rbx+8]
	mov	rdx, QWORD PTR ModuleInfo+464
	npad	1
$LL7@RunLineQue:
	movzx	eax, BYTE PTR [r8]
	lea	r8, QWORD PTR [r8+1]
	mov	BYTE PTR [rdx], al
	lea	rdx, QWORD PTR [rdx+1]
	test	al, al
	jne	SHORT $LL7@RunLineQue

; 189  :         DebugCmd ( lqlines_read++ );
; 190  :         MemFree( currline );

	mov	rcx, rbx
	call	MemFree

; 191  :         if ( PreprocessLine( CurrSource, tokenarray ) )

	mov	rcx, QWORD PTR ModuleInfo+464
	mov	rdx, rsi
	call	PreprocessLine
	test	eax, eax
	je	SHORT $LN5@RunLineQue

; 192  :             ParseLine( tokenarray );

	mov	rcx, rsi
	call	ParseLine
$LN5@RunLineQue:

; 193  :         currline = nextline;

	mov	rbx, rdi
	test	rdi, rdi
	jne	SHORT $LL2@RunLineQue

; 183  :     DebugCmd( lqlines_written = 0 ); /* reset counter for AddLineQueue() */
; 184  :     DebugCmd( lqlines_read = 0 ); /* reset counter for line-queue reads below */
; 185  : 
; 186  :     for ( ; currline; ) {

	mov	ecx, DWORD PTR ModuleInfo+456
	mov	rdi, QWORD PTR [rsp+80]
$LN3@RunLineQue:

; 194  :     }
; 195  : 
; 196  : #ifdef DEBUG_OUT
; 197  :     if ( ModuleInfo.EndDirFound == TRUE ) {
; 198  :         DebugMsg(("!!!!! Warning: End directive found in generated-code parser loop!\n"));
; 199  :     }
; 200  : #endif
; 201  :     ModuleInfo.GeneratedCode--;

	dec	ecx
	mov	DWORD PTR ModuleInfo+456, ecx

; 202  :     PopInputStatus( &oldstat );

	lea	rcx, QWORD PTR oldstat$[rsp]
	call	PopInputStatus

; 203  : 
; 204  :     DebugMsg1(( "RunLineQueue() exit\n" ));
; 205  :     return;
; 206  : }

	mov	rbx, QWORD PTR [rsp+88]
	add	rsp, 64					; 00000040H
	pop	rsi
	ret	0
RunLineQueue ENDP
_TEXT	ENDS
; Function compile flags: /Ogtpy
; File d:\hjwasm\hjwasm2.13.1s\hjwasm2.13.1s\lqueue.c
_TEXT	SEGMENT
buffer$ = 48
fmt$ = 720
AddLineQueueX PROC

; 98   : {

$LN32:
	mov	rax, rsp
	mov	QWORD PTR [rax+8], rcx
	mov	QWORD PTR [rax+16], rdx
	mov	QWORD PTR [rax+24], r8
	mov	QWORD PTR [rax+32], r9
	push	rbx
	sub	rsp, 704				; 000002c0H
	mov	QWORD PTR [rax-16], rbp

; 109  :     for ( s = fmt, d = buffer; *s; s++ ) {

	lea	rbx, QWORD PTR buffer$[rsp]
	mov	QWORD PTR [rax-24], rsi
	or	rbp, -1
	cmp	BYTE PTR [rcx], 0
	mov	rsi, rcx
	mov	QWORD PTR [rax-40], r14
	lea	r14, QWORD PTR [rax+16]
	je	$LN3@AddLineQue

; 99   :     va_list args;
; 100  :     char *d;
; 101  :     int i;
; 102  :     int_32 l;
; 103  :     const char *s;
; 104  :     const char *p;
; 105  :     char buffer[MAX_LINE_LEN];
; 106  : 
; 107  :     //DebugMsg(("AddlineQueueX(%s) enter\n", fmt ));
; 108  :     va_start( args, fmt );

	mov	QWORD PTR [rax-48], r15
	add	r14, -8
	lea	r15, OFFSET FLAT:ResWordTable+2
	mov	QWORD PTR [rax-32], rdi
$LL4@AddLineQue:

; 110  :         if ( *s == '%' ) {

	movzx	eax, BYTE PTR [rsi]
	cmp	al, 37					; 00000025H
	jne	$LN7@AddLineQue

; 111  :             s++;
; 112  :             switch ( *s ) {

	movsx	edx, BYTE PTR [rsi+1]
	inc	rsi
	mov	ecx, edx
	sub	ecx, 100				; 00000064H
	je	SHORT $LN11@AddLineQue
	sub	ecx, 14
	je	SHORT $LN9@AddLineQue
	sub	ecx, 1
	je	SHORT $LN10@AddLineQue
	sub	ecx, 2
	je	SHORT $LN11@AddLineQue
	cmp	ecx, 3
	je	SHORT $LN11@AddLineQue

; 144  :                 }
; 145  :                 break;
; 146  :             default:
; 147  :                 *d++ = *s;

	mov	BYTE PTR [rbx], dl
	jmp	$LN29@AddLineQue
$LN10@AddLineQue:

; 120  :             case 's':
; 121  :                 p = va_arg( args, char * );

	mov	rdx, QWORD PTR [r14+8]
	add	r14, 8

; 122  :                 i = strlen( p );

	mov	rax, rbp
$LL28@AddLineQue:
	inc	rax
	cmp	BYTE PTR [rdx+rax], 0
	jne	SHORT $LL28@AddLineQue

; 123  :                 memcpy( d, p, i );

	movsxd	rdi, eax
	mov	rcx, rbx
	mov	r8, rdi
	call	memcpy

; 124  :                 d += i;

	add	rbx, rdi

; 125  :                 *d = NULLC;

	mov	BYTE PTR [rbx], 0

; 126  :                 break;

	jmp	$LN2@AddLineQue
$LN9@AddLineQue:

; 113  :             case 'r':
; 114  :                 i = va_arg( args, int );

	movsxd	rdi, DWORD PTR [r14+8]
	add	r14, 8

; 115  :                 GetResWName( i , d );

	mov	ecx, edi
	mov	rdx, rbx
	call	GetResWName

; 116  :                 /* v2.06: the name is already copied */
; 117  :                 //memcpy( d, ResWordTable[i].name, ResWordTable[i].len );
; 118  :                 d += ResWordTable[i].len;

	mov	rax, rdi
	add	rax, rax
	movzx	eax, BYTE PTR [r15+rax*8]
	add	rbx, rax

; 119  :                 break;

	jmp	SHORT $LN2@AddLineQue
$LN11@AddLineQue:

; 127  :             case 'd':
; 128  :             case 'u':
; 129  :             case 'x':
; 130  : #ifdef __I86__ /* v2.08: use long only if size(int) is 16-bit */
; 131  :                 l = va_arg( args, long );
; 132  : #else
; 133  :                 l = va_arg( args, int );

	mov	ecx, DWORD PTR [r14+8]
	add	r14, 8

; 134  : #endif
; 135  :                 if ( *s == 'x' ) {

	cmp	dl, 120					; 00000078H

; 136  :                     myltoa( l, d, 16, FALSE, FALSE );

	mov	BYTE PTR [rsp+32], 0
	mov	rdx, rbx
	jne	SHORT $LN12@AddLineQue
	xor	r9d, r9d
	lea	r8d, QWORD PTR [r9+16]
	call	myltoa

; 137  :                     d += strlen( d );

	mov	rax, rbp
	npad	6
$LL27@AddLineQue:
	inc	rax
	cmp	BYTE PTR [rbx+rax], 0
	jne	SHORT $LL27@AddLineQue
	add	rbx, rax

; 138  :                 } else {

	jmp	SHORT $LN2@AddLineQue
$LN12@AddLineQue:

; 139  :                     myltoa( l, d, 10, l < 0, FALSE );

	test	ecx, ecx
	mov	r8d, 10
	sets	r9b
	call	myltoa

; 140  :                     d += strlen( d );

	mov	rax, rbp
$LL26@AddLineQue:
	inc	rax
	cmp	BYTE PTR [rbx+rax], 0
	jne	SHORT $LL26@AddLineQue
	add	rbx, rax

; 141  :                     /* v2.07: add a 't' suffix if radix is != 10 */
; 142  :                     if ( ModuleInfo.radix != 10 )

	cmp	BYTE PTR ModuleInfo+396, 10
	je	SHORT $LN2@AddLineQue

; 143  :                         *d++ = 't';

	mov	BYTE PTR [rbx], 116			; 00000074H

; 148  :             }
; 149  :         } else

	jmp	SHORT $LN29@AddLineQue
$LN7@AddLineQue:

; 150  :             *d++ = *s;

	mov	BYTE PTR [rbx], al
$LN29@AddLineQue:
	inc	rbx
$LN2@AddLineQue:

; 109  :     for ( s = fmt, d = buffer; *s; s++ ) {

	inc	rsi
	cmp	BYTE PTR [rsi], 0
	jne	$LL4@AddLineQue
	mov	r15, QWORD PTR [rsp+664]
	mov	rdi, QWORD PTR [rsp+680]
$LN3@AddLineQue:
	mov	r14, QWORD PTR [rsp+672]

; 151  :     }
; 152  :     *d = NULLC;
; 153  :     va_end( args );
; 154  :     //DebugMsg(("AddlineQueueX() done\n" ));
; 155  :     AddLineQueue( buffer );

	lea	rax, QWORD PTR buffer$[rsp]
	mov	rsi, QWORD PTR [rsp+688]
	mov	BYTE PTR [rbx], 0
$LL25@AddLineQue:
	inc	rbp
	cmp	BYTE PTR [rax+rbp], 0
	jne	SHORT $LL25@AddLineQue
	mov	ecx, ebp
	add	rcx, 16
	call	MemAlloc
	lea	r8d, DWORD PTR [rbp+1]
	mov	rbx, rax
	lea	rdx, QWORD PTR buffer$[rsp]
	lea	rcx, QWORD PTR [rax+8]
	mov	QWORD PTR [rax], 0
	call	memcpy
	cmp	QWORD PTR ModuleInfo+184, 0
	mov	rbp, QWORD PTR [rsp+696]
	jne	SHORT $LN18@AddLineQue
	mov	QWORD PTR ModuleInfo+184, rbx
	mov	QWORD PTR ModuleInfo+192, rbx

; 156  :     return;
; 157  : }

	add	rsp, 704				; 000002c0H
	pop	rbx
	ret	0

; 151  :     }
; 152  :     *d = NULLC;
; 153  :     va_end( args );
; 154  :     //DebugMsg(("AddlineQueueX() done\n" ));
; 155  :     AddLineQueue( buffer );

$LN18@AddLineQue:
	mov	rax, QWORD PTR ModuleInfo+192
	mov	QWORD PTR [rax], rbx
	mov	QWORD PTR ModuleInfo+192, rbx

; 156  :     return;
; 157  : }

	add	rsp, 704				; 000002c0H
	pop	rbx
	ret	0
AddLineQueueX ENDP
_TEXT	ENDS
; Function compile flags: /Ogtpy
; File d:\hjwasm\hjwasm2.13.1s\hjwasm2.13.1s\lqueue.c
_TEXT	SEGMENT
line$ = 48
AddLineQueue PROC

; 68   : {

$LN8:
	mov	QWORD PTR [rsp+8], rbx
	mov	QWORD PTR [rsp+16], rsi
	push	rdi
	sub	rsp, 32					; 00000020H
	mov	rsi, rcx

; 69   :     unsigned i = strlen( line );

	or	rbx, -1
$LL5@AddLineQue:
	inc	rbx
	cmp	BYTE PTR [rcx+rbx], 0
	jne	SHORT $LL5@AddLineQue

; 70   :     struct lq_line   *new;
; 71   : 
; 72   :     DebugMsg1(( "AddLineQueue(%p): #=%u >%s<\n", line, ++lqlines_written, line ));
; 73   : 
; 74   :     /* v2.11: line queue has become static. */
; 75   :     //if ( line_queue == NULL ) {
; 76   :     //    line_queue = MemAlloc( sizeof( struct input_queue ) );
; 77   :     //    line_queue->tail = NULL;
; 78   :     //}
; 79   :     new = MemAlloc( sizeof( struct lq_line ) + i );

	mov	ecx, ebx
	add	rcx, 16
	call	MemAlloc

; 80   :     new->next = NULL;
; 81   :     DebugCmd( new->lineno = lqlines_written );
; 82   :     memcpy( new->line, line, i + 1 );

	lea	r8d, DWORD PTR [rbx+1]
	mov	rdx, rsi
	mov	rdi, rax
	lea	rcx, QWORD PTR [rax+8]
	mov	QWORD PTR [rax], 0
	call	memcpy

; 83   : 
; 84   :     if( line_queue.head == NULL ) {

	cmp	QWORD PTR ModuleInfo+184, 0
	jne	SHORT $LN2@AddLineQue

; 85   :         line_queue.head = new;

	mov	QWORD PTR ModuleInfo+184, rdi

; 86   :     } else {

	jmp	SHORT $LN6@AddLineQue
$LN2@AddLineQue:

; 87   :         /* insert at the tail */
; 88   :         ((struct qnode *)line_queue.tail)->next = new;

	mov	rax, QWORD PTR ModuleInfo+192
	mov	QWORD PTR [rax], rdi
$LN6@AddLineQue:

; 89   :     }
; 90   :     line_queue.tail = new;
; 91   :     return;
; 92   : }

	mov	rbx, QWORD PTR [rsp+48]
	mov	rsi, QWORD PTR [rsp+56]
	mov	QWORD PTR ModuleInfo+192, rdi
	add	rsp, 32					; 00000020H
	pop	rdi
	ret	0
AddLineQueue ENDP
_TEXT	ENDS
; Function compile flags: /Ogtpy
; File d:\hjwasm\hjwasm2.13.1s\hjwasm2.13.1s\lqueue.c
_TEXT	SEGMENT
DeleteLineQueue PROC

; 45   : {

$LN12:
	sub	rsp, 40					; 00000028H

; 46   :     struct qitem *curr;
; 47   :     struct qitem *next;
; 48   :     for( curr = line_queue.head; curr; curr = next ) {

	mov	rcx, QWORD PTR ModuleInfo+184
	test	rcx, rcx
	je	SHORT $LN10@DeleteLine
	mov	QWORD PTR [rsp+32], rbx
$LL4@DeleteLine:

; 49   :         next = curr->next;

	mov	rbx, QWORD PTR [rcx]

; 50   :         MemFree( curr );

	call	MemFree
	mov	rcx, rbx
	test	rbx, rbx
	jne	SHORT $LL4@DeleteLine
	mov	rbx, QWORD PTR [rsp+32]
$LN10@DeleteLine:

; 51   :     }
; 52   :     line_queue.head = NULL;

	mov	QWORD PTR ModuleInfo+184, 0

; 53   : }

	add	rsp, 40					; 00000028H
	ret	0
DeleteLineQueue ENDP
_TEXT	ENDS
END
