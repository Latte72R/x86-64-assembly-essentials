.intel_syntax noprefix
.globl main
.data
.text
main:
  push rbp
  mov rbp, rsp
  sub rsp, 8
  mov rax, rbp
  sub rax, 4
  push rax
  push 1
  pop rdi
  pop rax
  mov DWORD PTR [rax], edi
  mov rax, rbp
  sub rax, 8
  push rax
  push 0
  pop rdi
  pop rax
  mov DWORD PTR [rax], edi
  push rdi
  pop rax
.Lbegin1:
  mov rax, rbp
  sub rax, 8
  push rax
  pop rax
  mov eax, DWORD PTR [rax]
  push rax
  push 5
  pop rdi
  pop rax
  cmp rax, rdi
  setl al
  movzx rax, al
  push rax
  pop rax
  cmp rax, 0
  je .Lend1
  mov rax, rbp
  sub rax, 4
  push rax
  mov rax, rbp
  sub rax, 4
  push rax
  pop rax
  mov eax, DWORD PTR [rax]
  push rax
  lea rax, [rip + .L_arr]
  push rax
  mov rax, rbp
  sub rax, 8
  push rax
  pop rax
  mov eax, DWORD PTR [rax]
  push rax
  push 4
  pop rdi
  pop rax
  imul rax, rdi
  push rax
  pop rdi
  pop rax
  add rax, rdi
  push rax
  pop rax
  mov eax, DWORD PTR [rax]
  push rax
  pop rdi
  pop rax
  imul rax, rdi
  push rax
  pop rdi
  pop rax
  mov DWORD PTR [rax], edi
.Lstep1:
  mov rax, rbp
  sub rax, 8
  push rax
  mov rax, rbp
  sub rax, 8
  push rax
  pop rax
  mov eax, DWORD PTR [rax]
  push rax
  push 1
  pop rdi
  pop rax
  add rax, rdi
  push rax
  pop rdi
  pop rax
  mov DWORD PTR [rax], edi
  push rdi
  pop rax
  jmp .Lbegin1
.Lend1:
  mov rax, rbp
  sub rax, 4
  push rax
  pop rax
  mov eax, DWORD PTR [rax]
  push rax
  push 17
  pop rdi
  pop rax
  cqo
  idiv rdi
  mov rax, rdx
  push rax
  pop rax
  mov rsp, rbp
  pop rbp
  ret

.L_arr:
  .long 5
  .long 2
  .long 4
  .long 3
  .long 7
