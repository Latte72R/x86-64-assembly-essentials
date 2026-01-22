.intel_syntax noprefix
.globl main
.data
.text
gcd:
  push rbp
  mov rbp, rsp
  sub rsp, 8
  mov rax, rbp
  sub rax, 4
  push rax
  pop rax
  mov DWORD PTR [rax], edi
  mov rax, rbp
  sub rax, 8
  push rax
  pop rax
  mov DWORD PTR [rax], esi
  mov rax, rbp
  sub rax, 8
  push rax
  pop rax
  mov eax, DWORD PTR [rax]
  push rax
  push 0
  pop rdi
  pop rax
  cmp rax, rdi
  sete al
  movzx rax, al
  push rax
  pop rax
  cmp rax, 0
  je .Lelse1
  mov rax, rbp
  sub rax, 4
  push rax
  pop rax
  mov eax, DWORD PTR [rax]
  push rax
  pop rax
  mov rsp, rbp
  pop rbp
  ret
  jmp .Lend1
.Lelse1:
  mov rax, rbp
  sub rax, 8
  push rax
  pop rax
  mov eax, DWORD PTR [rax]
  push rax
  mov rax, rbp
  sub rax, 4
  push rax
  pop rax
  mov eax, DWORD PTR [rax]
  push rax
  mov rax, rbp
  sub rax, 8
  push rax
  pop rax
  mov eax, DWORD PTR [rax]
  push rax
  pop rdi
  pop rax
  cqo
  idiv rdi
  mov rax, rdx
  push rax
  pop rax
  mov esi, eax
  pop rax
  mov edi, eax
  mov rax, rsp
  and rax, 0xF
  cmp rax, 0
  je .Laligned2
  sub rsp, 8
  jmp .Lfixup2
.Laligned2:
  mov rax, 0
  call gcd
  jmp .Lend2
.Lfixup2:
  call gcd
  add rsp, 8
.Lend2:
  push rax
  pop rax
  mov rsp, rbp
  pop rbp
  ret
.Lend1:
main:
  push rbp
  mov rbp, rsp
  sub rsp, 8
  mov rax, rbp
  sub rax, 4
  push rax
  push 48
  pop rdi
  pop rax
  mov DWORD PTR [rax], edi
  mov rax, rbp
  sub rax, 8
  push rax
  push 18
  pop rdi
  pop rax
  mov DWORD PTR [rax], edi
  mov rax, rbp
  sub rax, 4
  push rax
  pop rax
  mov eax, DWORD PTR [rax]
  push rax
  mov rax, rbp
  sub rax, 8
  push rax
  pop rax
  mov eax, DWORD PTR [rax]
  push rax
  pop rax
  mov esi, eax
  pop rax
  mov edi, eax
  mov rax, rsp
  and rax, 0xF
  cmp rax, 0
  je .Laligned3
  sub rsp, 8
  jmp .Lfixup3
.Laligned3:
  mov rax, 0
  call gcd
  jmp .Lend3
.Lfixup3:
  call gcd
  add rsp, 8
.Lend3:
  push rax
  pop rax
  mov rsp, rbp
  pop rbp
  ret
