.intel_syntax noprefix
.globl main
main:
  push rbp
  mov rbp, rsp
  mov dword ptr [rbp - 4], 0
  mov dword ptr [rbp - 8], 3
  mov dword ptr [rbp - 12], 5
  mov dword ptr [rbp - 16], 7
  lea rax, [rbp - 12]
  mov qword ptr [rbp - 24], rax
  mov eax, dword ptr [rbp - 8]
  mov ecx, eax
  add ecx, 1
  mov dword ptr [rbp - 8], ecx
  mov rcx, qword ptr [rbp - 24]
  mov ecx, dword ptr [rcx]
  mov edx, dword ptr [rbp - 16]
  add edx, -1
  mov dword ptr [rbp - 16], edx
  imul ecx, edx
  add eax, ecx
  mov ecx, dword ptr [rbp - 8]
  add ecx, 1
  mov dword ptr [rbp - 8], ecx
  add eax, ecx
  mov dword ptr [rbp - 28], eax
  mov eax, dword ptr [rbp - 28]
  pop rbp
  ret
