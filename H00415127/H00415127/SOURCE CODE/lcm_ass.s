section .text
global findLCM

findLCM:
        push    rbp ; This instruction stores the address of the current top of the stack in the register rbp.
        mov     rbp, rsp ; This instruction moves the value in the register rsp into the register rbp
        mov     DWORD [rbp-4], edi ; This instruction stores the value in edi into the memory location at rbp-4.
        mov     DWORD [rbp-8], esi ; This stores the value in esi into the memory location that is 8 bytes below the location stored in rbp.
        mov     DWORD [rbp-12], edx ; This instruction moves the value in the temporary data storage i.e; EDX register  into the size of the memory location i;e DWORD at the address stored in RBP-12.
.lcm_operation:
        mov     eax, DWORD [rbp-12] ; It moves the value at memory location of base stack i.e; rbp-12 into the eax register.
        cdq ; 
        idiv    DWORD [rbp-4] ; This instruction divides the value in the size of the memory location i.e; DWORD at memory location rbp-4 by the value in the eax register, and stores the result in the eax register.
        mov     eax, edx ; This moves the value in the edx register into the eax register.
        test    eax, eax ; The instruction tests the value in the EAX register against itself and sets the zero flag and sign flags accordingly.
        jne     .add ; This instruction compares the two values and if they are not equal, it will jump to .add
        mov     eax, DWORD [rbp-12] ; It moves the value in memory at address rbp-12 into the eax register.
        cdq
        idiv    DWORD [rbp-8] ; This instruction divides the value in the size of the memory location i.e; DWORD at memory location rbp-8 by the value in the eax register, and stores the result in the eax register.
        mov     eax, edx ; This again will move the value in the edx register into the eax register.
        test    eax, eax ; The instruction tests the value in the EAX register against itself and sets the zero flag and sign flags accordingly.
        jne     .add ; This instruction compares the two values and if they are not equal, it will jump to .add
        mov     eax, DWORD [rbp-12] ; It moves the value in memory at address rbp-12 into the eax register.
       	jmp     .print_result ; This code jumps to the .print_result 
.add:
        add     DWORD [rbp-12], 1 ; It adds 1 to the DWORD at memory address rbp-12.
        call     .lcm_operation ; This calls the lcm_operation 
.print_result:
        pop     rbp ; This instruction removes the top most entry from the stack and stores it in the register rbp.
        ret ; Terminates the execution of the program and transfers it in the calling function 
