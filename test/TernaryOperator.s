.intel_syntax noprefix
.globl main
.data
.L.str9:
  .string "%d"
.L.str2:
  .string "%d"
.text
main:
  push rbp
  mov rbp, rsp
  sub rsp, 136
  lea rax, [rip + .L.str2]
  push rax
  mov rax, rbp
  sub rax, 4
  push rax
  pop rax
  mov rsi, rax
  pop rax
  mov rdi, rax
  mov rax, rsp
  and rax, 0xF
  cmp rax, 0
  je .Laligned1
  sub rsp, 8
  jmp .Lfixup1
.Laligned1:
  mov rax, 0
  call scanf
  jmp .Lend1
.Lfixup1:
  call scanf
  add rsp, 8
.Lend1:
  mov rax, rbp
  sub rax, 124
  push rax
  pop rax
  push rax
  push 0
  push 4
  pop rdi
  pop rax
  imul rax, rdi
  push rax
  pop rdi
  pop rax
  add rax, rdi
  push rax
  push 2
  pop rdi
  pop rax
  mov DWORD PTR [rax], edi
  mov rax, rbp
  sub rax, 128
  push rax
  push 3
  pop rdi
  pop rax
  mov DWORD PTR [rax], edi
  mov rax, rbp
  sub rax, 132
  push rax
  push 1
  pop rdi
  pop rax
  mov DWORD PTR [rax], edi
.Lbegin3:
  push 1
  pop rax
  cmp rax, 0
  je .Lend3
  mov rax, rbp
  sub rax, 136
  push rax
  push 0
  pop rdi
  pop rax
  mov DWORD PTR [rax], edi
  push rdi
  pop rax
.Lbegin4:
  mov rax, rbp
  sub rax, 136
  push rax
  pop rax
  mov eax, DWORD PTR [rax]
  push rax
  mov rax, rbp
  sub rax, 132
  push rax
  pop rax
  mov eax, DWORD PTR [rax]
  push rax
  pop rdi
  pop rax
  cmp rax, rdi
  setl al
  movzx rax, al
  push rax
  pop rax
  cmp rax, 0
  je .Lend4
  mov rax, rbp
  sub rax, 128
  push rax
  pop rax
  mov eax, DWORD PTR [rax]
  push rax
  mov rax, rbp
  sub rax, 124
  push rax
  pop rax
  push rax
  mov rax, rbp
  sub rax, 136
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
  cqo
  idiv rdi
  mov rax, rdx
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
  je .Lend5
  jmp .Lend4
.Lend5:
  mov rax, rbp
  sub rax, 136
  push rax
  pop rax
  mov eax, DWORD PTR [rax]
  push rax
  mov rax, rbp
  sub rax, 132
  push rax
  pop rax
  mov eax, DWORD PTR [rax]
  push rax
  push 1
  pop rdi
  pop rax
  sub rax, rdi
  push rax
  pop rdi
  pop rax
  cmp rax, rdi
  sete al
  movzx rax, al
  push rax
  pop rax
  cmp rax, 0
  je .Lend6
  mov rax, rbp
  sub rax, 124
  push rax
  pop rax
  push rax
  mov rax, rbp
  sub rax, 132
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
  mov rax, rbp
  sub rax, 128
  push rax
  pop rax
  mov eax, DWORD PTR [rax]
  push rax
  pop rdi
  pop rax
  mov DWORD PTR [rax], edi
  mov rax, rbp
  sub rax, 132
  push rax
  mov rax, rbp
  sub rax, 132
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
  jmp .Lend4
.Lend6:
.Lstep4:
  mov rax, rbp
  sub rax, 136
  push rax
  mov rax, rbp
  sub rax, 136
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
  jmp .Lbegin4
.Lend4:
  mov rax, rbp
  sub rax, 132
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
  pop rdi
  pop rax
  cmp rax, rdi
  sete al
  movzx rax, al
  push rax
  pop rax
  cmp rax, 0
  je .Lend7
  jmp .Lend3
.Lend7:
  mov rax, rbp
  sub rax, 128
  push rax
  mov rax, rbp
  sub rax, 128
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
  jmp .Lbegin3
.Lstep3:
.Lend3:
  lea rax, [rip + .L.str9]
  push rax
  mov rax, rbp
  sub rax, 124
  push rax
  pop rax
  push rax
  mov rax, rbp
  sub rax, 4
  push rax
  pop rax
  mov eax, DWORD PTR [rax]
  push rax
  push 1
  pop rdi
  pop rax
  sub rax, rdi
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
  pop rax
  mov esi, eax
  pop rax
  mov rdi, rax
  mov rax, rsp
  and rax, 0xF
  cmp rax, 0
  je .Laligned8
  sub rsp, 8
  jmp .Lfixup8
.Laligned8:
  mov rax, 0
  call printf
  jmp .Lend8
.Lfixup8:
  call printf
  add rsp, 8
.Lend8:
  push 0
  pop rax
  mov rsp, rbp
  pop rbp
  ret
