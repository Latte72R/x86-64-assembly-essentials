-- ENUM型の定義
CREATE TYPE JudgeResult AS ENUM (
    'AC',
    'WA',
    'WC',
    'AE',
    'LE',
    'RE',
    'TLE',
    'Pending',
    'SystemError'
);

CREATE TYPE Arch AS ENUM (
    'x8664',
    'ricsv'
);

CREATE TYPE TestTarget AS ENUM (
    'ExitCode',
    'StdOut',
    'NoTestCase'
);

-- ユーザ情報テーブル
CREATE TABLE accounts (
    id serial primary key,
    name text unique not null,
    password text not null
);

-- セッションテーブル
CREATE TABLE sessions (
    session_key text primary key,
    user_id integer REFERENCES accounts(id) ON UPDATE NO ACTION ON DELETE CASCADE,
    created_at timestamptz not null
);

-- 問題テーブル（システムで参照するための列も含む）
CREATE TABLE problems (
    id serial primary key,
    title text not null,
    statement text not null,
    code text not null,
    input_desc text,
    output_desc text,
    arch Arch,
    test_target TestTarget,
    is_wrong_code boolean,
    error_line_number integer,
    score integer not null
);

-- テストケーステーブル
CREATE TABLE testcases (
    id serial primary key,
    problem_id integer REFERENCES problems(id) ON UPDATE NO ACTION ON DELETE CASCADE,
    input text,
    expect text
);

-- 提出情報テーブル
CREATE TABLE submits (
    id serial primary key,
    user_id integer REFERENCES accounts(id) ON UPDATE NO ACTION ON DELETE CASCADE,
    problem_id integer REFERENCES problems(id) ON UPDATE NO ACTION ON DELETE CASCADE,
    time timestamptz not null,
    asm text not null,
    error_message text not null,
    is_ce boolean not null,
    error_line_number integer,
    result JudgeResult not null
);

-- 各問題のINSERT文

-- 問題0: Return 42
INSERT INTO problems (id, title, statement, code, input_desc, output_desc, arch, test_target, is_wrong_code, error_line_number, score)
VALUES (
    0,
    'Return 72',
    'exitcodeで72を返すプログラムをコードの通りにコンパイルしてください．チュートリアルを読めばできるはず．',
    'int main() {
    return 72;
}',
    '無し',
    'exitcodeで出力',
    'x8664',
    'ExitCode',
    false,
    null,
    100
);

-- 問題1: Addition of constants
INSERT INTO problems (id, title, statement, code, input_desc, output_desc, arch, test_target, is_wrong_code, error_line_number, score)
VALUES (
    1,
    'Addition of constants',
    '定数の足し算をするプログラムをコードの通りにコンパイルしてください．練習も兼ねて答えを直書きしないで実際に足す命令を使いましょう．',
    'int main() {
    return 5 + 2;
}',
    '無し',
    'exitcodeで出力',
    'x8664',
    'ExitCode',
    false,
    null,
    100
);

-- 問題2: Subtraction of constants
INSERT INTO problems (id, title, statement, code, input_desc, output_desc, arch, test_target, is_wrong_code, error_line_number, score)
VALUES (
    2,
    'Subtraction of constants',
    '定数の引き算をするプログラムをコードの通りにコンパイルしてください．',
    'int main() {
    return 255 - 55;
}',
    '無し',
    'exitcodeで出力',
    'x8664',
    'ExitCode',
    false,
    null,
    100
);

-- 問題3: Four arithmetic operations
INSERT INTO problems (id, title, statement, code, input_desc, output_desc, arch, test_target, is_wrong_code, error_line_number, score)
VALUES (
    3,
    'Four arithmetic operations',
    '定数の四則演算をするプログラムをコードの通りにコンパイルしてください．掛け算や割り算はやや面倒ですが，これもいい練習です．',
    'int main() {
    return 22 * 4 - 48 / 3;
}',
    '無し',
    'exitcodeで出力',
    'x8664',
    'ExitCode',
    false,
    null,
    100
);

-- 問題4: Local variable
INSERT INTO problems (id, title, statement, code, input_desc, output_desc, arch, test_target, is_wrong_code, error_line_number, score)
VALUES (
    4,
    'Local variable',
    'ローカル変数を含むプログラムをコードの通りにコンパイルしてください．最適化しないでください．',
    'int main() {
    int a = 3;
    return a;
}',
    '無し',
    'exitcodeで出力',
    'x8664',
    'ExitCode',
    false,
    null,
    100
);

-- 問題5: 関数呼び出し
INSERT INTO problems (id, title, statement, code, input_desc, output_desc, arch, test_target, is_wrong_code, error_line_number, score)
VALUES (
    5,
    'Call function',
    '関数を含むプログラムをコードの通りにコンパイルしてください.',
    'int five() {
    return 5;
}
int main() {
    return five();
}',
    '無し',
    'exitcodeで出力',
    'x8664',
    'ExitCode',
    false,
    null,
    100
);

-- 問題6: Global variable
INSERT INTO problems (id, title, statement, code, input_desc, output_desc, arch, test_target, is_wrong_code, error_line_number, score)
VALUES (
    6,
    'Global variable',
    'グローバル変数を含むプログラムをコードの通りにコンパイルしてください',
    'int a = 9;
void add_two() {
    a += 2;
}

int main() {
    add_two();
    return a;
}',
    '無し',
    'exitcodeで出力',
    'x8664',
    'ExitCode',
    false,
    null,
    100
);

-- 問題7: Call function with args
INSERT INTO problems (id, title, statement, code, input_desc, output_desc, arch, test_target, is_wrong_code, error_line_number, score)
VALUES (
    7,
    'Call function with args',
    '引数ありの関数呼び出しを含むプログラムをコードの通りにをコンパイルしてください.',
    'int add(int x, int y){
    return x + y;
}

int main() {
    return add(5, 4);
}',
    '無し',
    'exitcodeで出力',
    'x8664',
    'ExitCode',
    false,
    null,
    100
);

-- 問題8: String
INSERT INTO problems (id, title, statement, code, input_desc, output_desc, arch, test_target, is_wrong_code, error_line_number, score)
VALUES (
    8,
    'String',
    '文字列を含むプログラムをコードの通りにコンパイルしてください。',
    'int main() {
    char array[6] = "Hello";
    return array[2];
}',
    '無し',
    'exitcodeで出力',
    'x8664',
    'ExitCode',
    false,
    null,
    100
);

-- 問題9: Hello world
INSERT INTO problems (id, title, statement, code, input_desc, output_desc, arch, test_target, is_wrong_code, error_line_number, score)
VALUES (
    9,
    'Hello,world!',
    'ここまで長い道のりでしたね．ようやくHelloWorldです．標準出力に出力するコードをコンパイルしてください．標準出力に出す問題ではexit codeに0を返すのをお忘れなく．',
    '#include <stdio.h>

int main() {
    printf("Hello, KCS1959!\n");
    return 0;
}',
    '無し',
    '標準出力',
    'x8664',
    'StdOut',
    false,
    null,
    100
);


-- 問題10: Sum
INSERT INTO problems (id, title, statement, code, input_desc, output_desc, arch, test_target, is_wrong_code, error_line_number, score)
VALUES (
    10,
    'Sum',
    '1~nの合計を計算するプログラムをコードの通りにコンパイルしてください．',
    'int main() {
    int n = 10, sum = 0;
    for (int i=1; i<=n; i++) {
        sum += i;
    }
    return sum;
}',
    '無し',
    'exitcodeで出力',
    'x8664',
    'ExitCode',
    false,
    null,
    200
);

-- 問題11: Hello,world!
INSERT INTO problems (id, title, statement, code, input_desc, output_desc, arch, test_target, is_wrong_code, error_line_number, score)
VALUES (
    11,
    'Hello,world!',
    'ここまで長い道のりでしたね．ようやくHelloWorldです．標準出力に出力するコードをコンパイルしてください．標準出力に出す問題ではexit codeに0を返すのをお忘れなく．',
    '#include <stdio.h>

int main() {
    printf("Hello, KCS1959!\n");
    return 0;
}',
    '無し',
    '標準出力',
    'x8664',
    'StdOut',
    false,
    null,
    200
);

-- 問題12: Echo
INSERT INTO problems (id, title, statement, code, input_desc, output_desc, arch, test_target, is_wrong_code, error_line_number, score)
VALUES (
    12,
    'Echo',
    '入力された文字をおうむ返しするコードをコンパイルしてください.',
    '#include <stdio.h>

int main() {
    char str[30];
    scanf("%s", str);
    printf("%s", str);
    return 0;
}',
    '1 <= len(s) <= 29',
    '標準出力、入力文字列と同じ',
    'x8664',
    'NoTestCase',
    true,
    5,
    200
);

-- 問題13: Length of string
INSERT INTO problems (id, title, statement, code, input_desc, output_desc, arch, test_target, is_wrong_code, error_line_number, score)
VALUES (
    13,
    'Length of string',
    '出力した文字数を数えるプログラムをコンパイルしてください．',
    '#include <stdio.h>

int main() {
    int count;
    printf("Hello, world!%n\n", &count);
    printf("The number of characters is %d.\n", count);
    return 0;
}',
    'なし',
    '標準出力',
    'x8664',
    'StdOut',
    false,
    null,
    200
);

-- 問題14: FizzBuzz
INSERT INTO problems (id, title, statement, code, input_desc, output_desc, arch, test_target, is_wrong_code, error_line_number, score)
VALUES (
    14,
    'FizzBuzz',
    '入門にぴったりなFizzBuzzですが，アセンブリで書くのはやや大変．',
    '#include <stdio.h>

int main() {
    int d;
    scanf("%d", &d);
    for (int i=1;i<=d;i++) {
        if (i%15 == 0) {
            printf("FizzBuzz");
        } else if (i%3==0) {
            printf("Fizz");
        } else if (i%5 == 0) {
            printf("Buzz");
        } else {
            printf("%d", i);
        }
    }
    return 0;
}',
    '1 <= d <= 20',
    '標準出力',
    'x8664',
    'StdOut',
    false,
    null,
    300
);

-- 問題15: Multiplication
INSERT INTO problems (id, title, statement, code, input_desc, output_desc, arch, test_target, is_wrong_code, error_line_number, score)
VALUES (
    15,
    'Multiplication',
    '配列の要素を全て掛け合わせた結果を17で割った余りを出力するプログラムをコンパイルしてください．',
    'int main() {
  int arr[5] = {5, 2, 4, 3, 7};
  int multi = 1;
  int i;
  for (i = 0; i < 5; i++) {
    multi *= arr[i];
  }
  return multi % 17;
}',
    '1 <= b <= 100',
    '標準出力',
    'x8664',
    'StdOut',
    false,
    null,
    300
);

-- 問題16: Increment, Decrement
INSERT INTO problems (id, title, statement, code, input_desc, output_desc, arch, test_target, is_wrong_code, error_line_number, score)
VALUES (
    16,
    'Increment, Decrement',
    '最適化で全部消したりしないでね！',
    'int main(void) {
  int a = 3, b = 5, c = 7;
  int *ptr = &b;
  int result = a++ + *ptr * (--c) + ++a;
  return result;
}',
    '無し',
    'exitcodeで出力',
    'x8664',
    'ExitCode',
    false,
    null,
    300
);

-- 問題17: fibonacci
INSERT INTO problems (id, title, statement, code, input_desc, output_desc, arch, test_target, is_wrong_code, error_line_number, score)
VALUES (
    17,
    'fibonacci',
    'フィボナッチ数列を計算するプログラムをコンパイルしてください。',
    '#include <stdio.h>

int fib(int n) {
    if (n == 0 || n == 1) return 1;
    return fib(n-1) + fib(n-2);
}

int main() {
    int d;
    scanf("%d", &d);
    printf("%d", fib(d));
    return 0;
}',
    '1 <= d <= 20',
    '標準出力',
    'x8664',
    'StdOut',
    false,
    null,
    300
);

-- 問題18: Dereference
INSERT INTO problems (id, title, statement, code, input_desc, output_desc, arch, test_target, is_wrong_code, error_line_number, score)
VALUES (
    18,
    'Dereference',
    '3つの変数を使ったプログラムをコンパイルしてみよう！',
    '#include <stdio.h>

int main() {
    int *d, e, **f;
    e = 10;
    d = &e;
    f = &d;
    printf("%d", e**d***f);
    return 0;
}',
    '無し',
    '標準出力',
    'x8664',
    'StdOut',
    false,
    null,
    300
);

-- 問題19: Switch
INSERT INTO problems (id, title, statement, code, input_desc, output_desc, arch, test_target, is_wrong_code, error_line_number, score)
VALUES (
    19,
    'Switch',
    'switch文をコンパイルしてみよう!',
    '#include <stdio.h>

int main() {
  int num = 2;
  switch (num) {
  case 1:
    int value = 10;
    printf("Case 1: %d\n", value);
    break;
  case 2:
    int value = 20;
    printf("Case 2: %d\n", value);
    break;
  default:
    break;
  }
  return 0;
}',
    '無し',
    '標準出力',
    'x8664',
    'NoTestCase',
    true,
    11,
    300
);

-- 問題20: Ternary operator
INSERT INTO problems (id, title, statement, code, input_desc, output_desc, arch, test_target, is_wrong_code, error_line_number, score)
VALUES (
    20,
    'Ternary operator',
    '3項演算子を含むコードをコンパイルしてみましょう．',
    '#include <stdio.h>

struct S {
  int m;
  int n;
};

int main(void) {
  struct S s = {5, 3};
  int d;
  scanf("%d", &d);
  int result = d == 1 ? (s.m * 6) : d == 2 ? (s.n * 2) : (s.m + s.n);
  printf("%d\n", result);
  return 0;
}',
    '1 <= d <= 5',
    '標準出力',
    'x8664',
    'StdOut',
    false,
    null,
    400
);
