; Listing generated by Microsoft (R) Optimizing Compiler Version 19.00.23026.0 

include listing.inc

INCLUDELIB LIBCMT
INCLUDELIB OLDNAMES

_DATA	SEGMENT
COMM	decoflags:BYTE
COMM	broadflags:BYTE
COMM	evex:BYTE
_DATA	ENDS
PUBLIC	MemInit
PUBLIC	MemFini
PUBLIC	MemAlloc
PUBLIC	MemFree
PUBLIC	LclAlloc
EXTRN	free:PROC
EXTRN	malloc:PROC
EXTRN	Fatal:PROC
EXTRN	__imp_VirtualAlloc:PROC
EXTRN	__imp_VirtualFree:PROC
_BSS	SEGMENT
pBase	DQ	01H DUP (?)
pCurr	DQ	01H DUP (?)
currfree DD	01H DUP (?)
_BSS	ENDS
pdata	SEGMENT
$pdata$MemFini DD imagerel $LN10
	DD	imagerel $LN10+16
	DD	imagerel $unwind$MemFini
$pdata$0$MemFini DD imagerel $LN10+16
	DD	imagerel $LN10+72
	DD	imagerel $chain$0$MemFini
$pdata$1$MemFini DD imagerel $LN10+72
	DD	imagerel $LN10+77
	DD	imagerel $chain$1$MemFini
$pdata$MemAlloc DD imagerel $LN6
	DD	imagerel $LN6+36
	DD	imagerel $unwind$MemAlloc
$pdata$LclAlloc DD imagerel $LN7
	DD	imagerel $LN7+167
	DD	imagerel $unwind$LclAlloc
pdata	ENDS
xdata	SEGMENT
$unwind$MemFini DD 010401H
	DD	04204H
$chain$0$MemFini DD 020521H
	DD	043405H
	DD	imagerel $LN10
	DD	imagerel $LN10+16
	DD	imagerel $unwind$MemFini
$chain$1$MemFini DD 021H
	DD	imagerel $LN10
	DD	imagerel $LN10+16
	DD	imagerel $unwind$MemFini
$unwind$MemAlloc DD 020601H
	DD	030023206H
$unwind$LclAlloc DD 020601H
	DD	030023206H
xdata	ENDS
; Function compile flags: /Ogtpy
; File d:\hjwasm\hjwasm2.13.1s\hjwasm2.13.1s\memalloc.c
_TEXT	SEGMENT
size$ = 48
LclAlloc PROC

; 183  : {

$LN7:
	push	rbx
	sub	rsp, 32					; 00000020H

; 184  :     void        *ptr;
; 185  : 
; 186  : #if FASTMEM
; 187  :     size = (size + sizeof(void *)-1) & ~(sizeof(void *)-1);
; 188  :     if ( currfree < size ) {

	mov	edx, DWORD PTR currfree
	lea	rbx, QWORD PTR [rcx+7]
	and	rbx, -8
	cmp	rdx, rbx
	jae	SHORT $LN5@LclAlloc

; 189  :         DebugMsg(("LclAlloc: new block needed, req. size=%Xh > currfree=%Xh\n", size, currfree ));
; 190  :         currfree = ( size <= ( BLKSIZE - sizeof( struct linked_list ) ) ? BLKSIZE - sizeof( struct linked_list ) : size );

	mov	ecx, 524280				; 0007fff8H
	mov	eax, ebx
	cmp	rbx, rcx

; 191  :         BLKALLOC( pCurr, currfree + sizeof( struct linked_list ) );

	mov	r8d, 4096				; 00001000H
	cmovbe	eax, ecx
	xor	ecx, ecx
	mov	edx, eax
	add	rdx, 8
	mov	DWORD PTR currfree, eax
	lea	r9d, QWORD PTR [rcx+4]
	call	QWORD PTR __imp_VirtualAlloc
	mov	QWORD PTR pCurr, rax
	mov	rcx, rax

; 192  :         if ( !pCurr ) {

	test	rax, rax
	jne	SHORT $LN3@LclAlloc

; 193  :             currfree = 0;
; 194  :             Fatal( OUT_OF_MEMORY );

	lea	ecx, QWORD PTR [rax+106]
	mov	DWORD PTR currfree, eax
	call	Fatal
	mov	rcx, QWORD PTR pCurr
$LN3@LclAlloc:

; 195  :         }
; 196  :         ((struct linked_list *)pCurr)->next = pBase;

	mov	rax, QWORD PTR pBase

; 197  :         pBase = (struct linked_list *)pCurr;
; 198  :         pCurr += sizeof( struct linked_list );

	mov	edx, DWORD PTR currfree
	mov	QWORD PTR [rcx], rax
	mov	QWORD PTR pBase, rcx
	add	rcx, 8
	jmp	SHORT $LN2@LclAlloc
$LN5@LclAlloc:
	mov	rcx, QWORD PTR pCurr
$LN2@LclAlloc:

; 199  :         DebugCmd( blocks++ );
; 200  :     }
; 201  :     ptr = pCurr;

	mov	rax, rcx

; 202  :     pCurr += size;

	add	rcx, rbx

; 203  :     currfree -= size;

	sub	edx, ebx
	mov	QWORD PTR pCurr, rcx
	mov	DWORD PTR currfree, edx

; 204  : 
; 205  : #else /* ! FASTMEM */
; 206  : 
; 207  :     ptr = malloc( size );
; 208  : #ifdef TRMEM
; 209  :     DebugMsg1(("LclAlloc(0x%X)=%p cnt=%" I32_SPEC "u\n", size, ptr, ++memcalls ));
; 210  : #endif
; 211  :     if( ptr == NULL ) {
; 212  :         Fatal( OUT_OF_MEMORY );
; 213  :     }
; 214  : #endif
; 215  :     return( ptr );
; 216  : }

	add	rsp, 32					; 00000020H
	pop	rbx
	ret	0
LclAlloc ENDP
_TEXT	ENDS
; Function compile flags: /Ogtpy
; File d:\hjwasm\hjwasm2.13.1s\hjwasm2.13.1s\memalloc.c
_TEXT	SEGMENT
ptr$ = 8
MemFree	PROC

; 247  :     DebugMsg1(("MemFree(0x%p) cnt=%" I32_SPEC "u\n", ptr, --memcalls ));
; 248  :     free( ptr );

	jmp	free
MemFree	ENDP
_TEXT	ENDS
; Function compile flags: /Ogtpy
; File d:\hjwasm\hjwasm2.13.1s\hjwasm2.13.1s\memalloc.c
_TEXT	SEGMENT
size$ = 48
MemAlloc PROC

; 233  : {

$LN6:
	push	rbx
	sub	rsp, 32					; 00000020H

; 234  :     void        *ptr;
; 235  :     ptr = malloc( size );

	call	malloc
	mov	rbx, rax

; 236  :     DebugMsg1(("MemAlloc(0x%X)=%p cnt=%" I32_SPEC "u\n", size, ptr, ++memcalls ));
; 237  :     if( ptr == NULL ) {

	test	rax, rax
	jne	SHORT $LN2@MemAlloc

; 238  :         Fatal( OUT_OF_MEMORY );

	lea	ecx, QWORD PTR [rax+106]
	call	Fatal

; 239  :     }
; 240  :     //memset( ptr, 0xff, size );
; 241  :     return( ptr );

	mov	rax, rbx
$LN2@MemAlloc:

; 242  : }

	add	rsp, 32					; 00000020H
	pop	rbx
	ret	0
MemAlloc ENDP
_TEXT	ENDS
; Function compile flags: /Ogtpy
; File d:\hjwasm\hjwasm2.13.1s\hjwasm2.13.1s\memalloc.c
_TEXT	SEGMENT
MemFini	PROC

; 162  : {

$LN10:
	sub	rsp, 40					; 00000028H

; 163  : 
; 164  : #if FASTMEM
; 165  : #ifdef DEBUG_OUT
; 166  :     if ( Options.quiet == FALSE )
; 167  :         printf( "memory used: %u kB\n", (blocks * BLKSIZE - currfree) / 1024 );
; 168  : #endif
; 169  :     while ( pBase ) {

	mov	rax, QWORD PTR pBase
	test	rax, rax
	je	SHORT $LN3@MemFini
	mov	QWORD PTR [rsp+32], rbx
	npad	11
$LL2@MemFini:

; 170  :         struct linked_list *pNext = pBase->next;

	mov	rbx, QWORD PTR [rax]

; 171  :         BLKFREE( pBase );

	xor	edx, edx
	mov	r8d, 32768				; 00008000H
	mov	rcx, rax
	call	QWORD PTR __imp_VirtualFree

; 172  :         pBase = pNext;

	mov	QWORD PTR pBase, rbx
	mov	rax, rbx
	test	rbx, rbx
	jne	SHORT $LL2@MemFini
	mov	rbx, QWORD PTR [rsp+32]
$LN3@MemFini:

; 173  :     }
; 174  : #endif
; 175  : #ifdef DEBUG_OUT
; 176  :     if ( memcalls != memstart )
; 177  :         printf("still allocated memory blocks : %u\n", memcalls - memstart );
; 178  : #endif
; 179  : }

	add	rsp, 40					; 00000028H
	ret	0
MemFini	ENDP
_TEXT	ENDS
; Function compile flags: /Ogtpy
; File d:\hjwasm\hjwasm2.13.1s\hjwasm2.13.1s\memalloc.c
_TEXT	SEGMENT
MemInit	PROC

; 152  : #if FASTMEM
; 153  :     pBase = NULL;

	xor	eax, eax
	mov	QWORD PTR pBase, rax

; 154  :     currfree = 0;

	mov	DWORD PTR currfree, eax

; 155  :     DebugCmd( blocks = 0 );
; 156  : #endif
; 157  :     DebugCmd( memstart = memcalls );
; 158  : }

	ret	0
MemInit	ENDP
_TEXT	ENDS
END
