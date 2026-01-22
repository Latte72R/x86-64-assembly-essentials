.intel_syntax noprefix
.globl main
.data
.L.str14:
  .string "%d"
.L.str12:
  .string "Buzz"
.L.str9:
  .string "Fizz"
.L.str6:
  .string "FizzBuzz"
.L.str2:
  .string "%d"
.text
main:
  push rbp
  mov rbp, rsp
  sub rsp, 8
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
  sub rax, 8
  push rax
  push 1
  pop rdi
  pop rax
  mov DWORD PTR [rax], edi
  push rdi
  pop rax
.Lbegin3:
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
  pop rdi
  pop rax
  cmp rax, rdi
  setle al
  movzx rax, al
  push rax
  pop rax
  cmp rax, 0
  je .Lend3
  mov rax, rbp
  sub rax, 8
  push rax
  pop rax
  mov eax, DWORD PTR [rax]
  push rax
  push 15
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
  je .Lelse4
  lea rax, [rip + .L.str6]
  push rax
  pop rax
  mov rdi, rax
  mov rax, rsp
  and rax, 0xF
  cmp rax, 0
  je .Laligned5
  sub rsp, 8
  jmp .Lfixup5
.Laligned5:
  mov rax, 0
  call printf
  jmp .Lend5
.Lfixup5:
  call printf
  add rsp, 8
.Lend5:
  jmp .Lend4
.Lelse4:
  mov rax, rbp
  sub rax, 8
  push rax
  pop rax
  mov eax, DWORD PTR [rax]
  push rax
  push 3
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
  je .Lelse7
  lea rax, [rip + .L.str9]
  push rax
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
  jmp .Lend7
.Lelse7:
  mov rax, rbp
  sub rax, 8
  push rax
  pop rax
  mov eax, DWORD PTR [rax]
  push rax
  push 5
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
  je .Lelse10
  lea rax, [rip + .L.str12]
  push rax
  pop rax
  mov rdi, rax
  mov rax, rsp
  and rax, 0xF
  cmp rax, 0
  je .Laligned11
  sub rsp, 8
  jmp .Lfixup11
.Laligned11:
  mov rax, 0
  call printf
  jmp .Lend11
.Lfixup11:
  call printf
  add rsp, 8
.Lend11:
  jmp .Lend10
.Lelse10:
  lea rax, [rip + .L.str14]
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
  mov rdi, rax
  mov rax, rsp
  and rax, 0xF
  cmp rax, 0
  je .Laligned13
  sub rsp, 8
  jmp .Lfixup13
.Laligned13:
  mov rax, 0
  call printf
  jmp .Lend13
.Lfixup13:
  call printf
  add rsp, 8
.Lend13:
.Lend10:
.Lend7:
.Lend4:
.Lstep3:
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
  jmp .Lbegin3
.Lend3:
  push 0
  pop rax
  mov rsp, rbp
  pop rbp
  ret
