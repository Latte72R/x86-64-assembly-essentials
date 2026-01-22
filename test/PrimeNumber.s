.intel_syntax noprefix
.globl main
main:
  push rbp
  mov rbp, rsp
  sub rsp, 32
  mov dword ptr [rbp - 4], 0
  mov rax, qword ptr [rip + .L__const.main.s]
  mov qword ptr [rbp - 12], rax
  lea rdi, [rip + .L.str]
  lea rsi, [rbp - 16]
  mov al, 0
  call __isoc99_scanf@PLT
  cmp dword ptr [rbp - 16], 1
  jne .LBB0_2
  imul eax, dword ptr [rbp - 12], 6
  mov dword ptr [rbp - 24], eax
  jmp .LBB0_6
.LBB0_2:
  cmp dword ptr [rbp - 16], 2
  jne .LBB0_4
  mov eax, dword ptr [rbp - 8]
  shl eax
  mov dword ptr [rbp - 28], eax
  jmp .LBB0_5
.LBB0_4:
  mov eax, dword ptr [rbp - 12]
  add eax, dword ptr [rbp - 8]
  mov dword ptr [rbp - 28], eax
.LBB0_5:
  mov eax, dword ptr [rbp - 28]
  mov dword ptr [rbp - 24], eax
.LBB0_6:
  mov eax, dword ptr [rbp - 24]
  mov dword ptr [rbp - 20], eax
  mov esi, dword ptr [rbp - 20]
  lea rdi, [rip + .L.str.1]
  mov al, 0
  call printf@PLT
  xor eax, eax
  add rsp, 32
  pop rbp
  ret

.L__const.main.s:
  .long 5
  .long 3

.L.str:
  .asciz "%d"

.L.str.1:
  .asciz "%d"
