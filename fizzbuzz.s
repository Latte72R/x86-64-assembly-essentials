.intel_syntax noprefix

.extern scanf
.extern printf

.globl main
main:
  push rbp
  mov rbp, rsp
  sub rsp, 8
  lea rsi, [rbp - 4]
  lea rdi, [rip + .L0]
  mov rax, 0
  call scanf
  # ここに初期化処理を書く
  mov dword ptr [rbp - 8], 1
.Lbegin_for_1:
  # rax に条件の真偽を入れておく（偽ならば rax = 0 ）
  mov eax, dword ptr [rbp - 8]
  mov ebx, dword ptr [rbp - 4]
  cmp rax, rbx
  setle al
  movzx rax, al
  cmp rax, 0
  je .Lend_for_1
  # ここに条件が真だったときの実行内容を書く

  # rax に条件の真偽を入れておく（偽ならば rax = 0 ）
  mov eax, dword ptr [rbp - 8]
  cqo
  mov rbx, 15
  idiv rbx
  cmp rdx, 0
  sete al
  movzx rax, al
  cmp rax, 0
  je .Lelse_if_1
  # ここに条件が真だったときの実行内容を書く
  lea rdi, [rip + .L1]
  mov rax, 0
  call printf
  jmp .Lend_if_1
  .Lelse_if_1:
  # ここに条件が偽だったときの実行内容を書く

  # rax に条件の真偽を入れておく（偽ならば rax = 0 ）
  mov eax, dword ptr [rbp - 8]
  cqo
  mov rbx, 3
  idiv rbx
  cmp rdx, 0
  sete al
  movzx rax, al
  cmp rax, 0
  je .Lelse_if_2
  # ここに条件が真だったときの実行内容を書く
  lea rdi, [rip + .L2]
  mov rax, 0
  call printf
  jmp .Lend_if_2
  .Lelse_if_2:
  # ここに条件が偽だったときの実行内容を書く

  # rax に条件の真偽を入れておく（偽ならば rax = 0 ）
  mov eax, dword ptr [rbp - 8]
  cqo
  mov rbx, 5
  idiv rbx
  cmp rdx, 0
  sete al
  movzx rax, al
  cmp rax, 0
  je .Lelse_if_3
  # ここに条件が真だったときの実行内容を書く
  lea rdi, [rip + .L3]
  mov rax, 0
  call printf
  jmp .Lend_if_3
  .Lelse_if_3:
  # ここに条件が偽だったときの実行内容を書く

  lea rsi, [rbp - 8]
  lea rdi, [rip + .L0]
  mov rax, 0
  call printf

  .Lend_if_3:

  .Lend_if_2:

  .Lend_if_1:

  # ここに更新処理の実行内容を書く
  mov eax, dword ptr [rbp - 8]
  add eax, 1
  mov dword ptr [rbp - 8], eax
  jmp .Lbegin_for_1
.Lend_for_1:

  mov rax, 0
  ret

.data
.L0:
  .string "%s"
.L1:
  .string "FizzBuzz"
.L2:
  .string "Fizz"
.L3:
  .string "Buzz"
