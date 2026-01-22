.intel_syntax noprefix
.globl main
.extern scanf
.extern printf
main:
  push rbp
  mov rbp, rsp
  sub rsp, 32
  lea rsi, [rbp - 30]
  lea rdi, [rip + .L0]
  mov rax, 0
  call scanf
  lea rsi, [rbp - 30]
  lea rdi, [rip + .L0]
  mov rax, 0
  call printf
  mov rax, 0
  ret

.data
.L0:
  .string "%s"
