.intel_syntax noprefix
.globl main
.data
.L.str7:
  .string "%d"
.L.str5:
  .string "%d"
.text
fib:
  push rbp
  mov rbp, rsp
  sub rsp, 8
  mov rax, rbp
  sub rax, 4
  push rax
  pop rax
  mov DWORD PTR [rax], edi
  mov rax, rbp
  sub rax, 4
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
  mov rax, rbp
  sub rax, 4
  push rax
  pop rax
  mov eax, DWORD PTR [rax]
  push rax
  push 1
  pop rdi
  pop rax
  cmp rax, rdi
  sete al
  movzx rax, al
  push rax
  pop rdi
  pop rax
  test rax, rax
  setne al
  test rdi, rdi
  setne dl
  or al, dl
  push rax
  pop rax
  cmp rax, 0
  je .Lend1
  push 1
  pop rax
  mov rsp, rbp
  pop rbp
  ret
.Lend1:
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
  call fib
  jmp .Lend2
.Lfixup2:
  call fib
  add rsp, 8
.Lend2:
  push rax
  mov rax, rbp
  sub rax, 4
  push rax
  pop rax
  mov eax, DWORD PTR [rax]
  push rax
  push 2
  pop rdi
  pop rax
  sub rax, rdi
  push rax
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
  call fib
  jmp .Lend3
.Lfixup3:
  call fib
  add rsp, 8
.Lend3:
  push rax
  pop rdi
  pop rax
  add rax, rdi
  push rax
  pop rax
  mov rsp, rbp
  pop rbp
  ret
main:
  push rbp
  mov rbp, rsp
  sub rsp, 8
  lea rax, [rip + .L.str5]
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
  je .Laligned4
  sub rsp, 8
  jmp .Lfixup4
.Laligned4:
  mov rax, 0
  call scanf
  jmp .Lend4
.Lfixup4:
  call scanf
  add rsp, 8
.Lend4:
  lea rax, [rip + .L.str7]
  push rax
  mov rax, rbp
  sub rax, 4
  push rax
  pop rax
  mov eax, DWORD PTR [rax]
  push rax
  pop rax
  mov edi, eax
  mov rax, rsp
  and rax, 0xF
  cmp rax, 0
  je .Laligned8
  sub rsp, 8
  jmp .Lfixup8
.Laligned8:
  mov rax, 0
  call fib
  jmp .Lend8
.Lfixup8:
  call fib
  add rsp, 8
.Lend8:
  push rax
  pop rax
  mov esi, eax
  pop rax
  mov rdi, rax
  mov rax, rsp
  and rax, 0xF
  cmp rax, 0
  je .Laligned6
  sub rsp, 8
  jmp .Lfixup6
.Laligned6:
  mov rax, 0
  call printf
  jmp .Lend6
.Lfixup6:
  call printf
  add rsp, 8
.Lend6:
  push 0
  pop rax
  mov rsp, rbp
  pop rbp
  ret
