# perl 学习手记

# 第二章

## 双引号内字符串的反斜线转义

大体与 php 一致,以下有区别

组合 | 意义
---- | ---
\l | 将下字线转为小写
\L | 将它后面的所有字母转为小写,直到 \E 为止
\u | 将下个字母转为大写
\U | 将它后面的甩有字母转为大写,直到 \E 为止
\Q | 相当于把它到 \E 之间的非单词(no word)字符加上反斜线转义
\E | 结束 \L,\U和\Q开始的作用范围

## 标题变量

- 标题变量的名称以美元符号开头,此符号与称为魔符(sigil),然后是变量的 perl 标识符
- perl 不限于使用 ASCII 字符作为变量名.如果启用了 utf8 编译指令,那么可用于表示字母或数字的字符会多许多,拿它们作为变量名也是可以的.

## 字符串中的标题变量内插(variable interpolation)

## 操作符的优先级与结合性(从高到低排序)

`注: per 和 C 里面出现的操作符,优先级和结合性是相同的`

结合性 | 操作符
------ | -----
左 | 括号;给定参数的列表操作符
左 | ->
   | ++(自增) --(自减)
右 | **
右 | \ ! ! + -(单目操作符)
左 | =~ !~
左 | * / % x
左 | + - .(双目操作符)
左 | << >>
   | 具名的单目操作符(-X 文件测试; rand)
   | < <= > >= lt le gt ge("不相等"操作符)
   | == != <=> eq ne cmp("相等"操作符)
左 | &
左 | \| ^
左 | &&
左 | \|\|
   | .. ...
右 | ?:(三目操作符)
右 | = += -= .=(以及类似的赋值操作符)
左 | , =>
   | 列表操作符(向右结合)
右 | not
左 | and
左 | or xor

## 数值与字符串的比较操作符

比较 | 数字 | 字符串
---- | ---- | -----
相等 | == | eq
不等 | != | ne
小于 | <  | lt
大于 | >  | gt
小于或等于 | <= | le
大于或等于 | >= | ge

## 布尔值

- 如果数字,0为假;所有其他数字都为真.
- 如果是字符串,空字符串(''), '0' 为假;所有其他字符串都为真.
- 如果既不是数字也不是字符串,那就先转换成数字或字符串再行判断.

## 获取用户输入

```
使用"行输入"操作符 <STDIN>
```

### chomp 操作符,去掉字符串末尾的换行符

## undef 值

在首次赋值前,变量的初始值是特殊的 undef(末定义)值.当数字使用,它会表现得像零;如果当成字符串使用,它就会表现得像空字符串.

undef 既不是数字也不是字符串,它完全是另一种类型的标题值.

## defined函数

要判断某个字符串是 undef 而不是空字符串,可以使用 defined 函数.如果是 undef,该函数返回假,否则返回真.

# 第三章 列表与数组

- 列表(list)指的是标量的有序集合
- 数组(array)是存储列表的变量
- 访问数组中的元素,使用下标数字(subscript)来引用.
- 对索引值超过数组尾端的元素进行赋值,数组将会根据需要自动扩大.如果在扩展过程中需要创建增补元素,它们的默认取值为 undef.
- 最后一个元素的索引值, $#array_name.
- 列表直接量(list literal,在程序代码中表示一列数据的写法),可以由圆括号内用逗号隔开的一串数据表示,这些数据就称为列表元素.
- .. 范围操作符,只能向上计数
- qw 简写  
  qw 表示"quoted word(加上引号的单词)"或"quoted by whitespace(用空白圈引)"
- 列表赋值  
  ($fred, $barney) = ($barney, $fred)   # 交换两个变量的值
- 希望引用整个数组时, perl 提供了一个比较简单的记法.在数组名之前加上@(at)字符(后面没有检索用的方括号).将它读作"all of the(全部的,所有的)"
- pop 和 push 操作符
- shift 和 unshift 操作符
- splice 操作符  
  最多可接受4个参数,最后两个参数可选.第一个参数是要操作的目标数组;第二个参数是要操作的一组元素的开始位置;第三个参数指定要操作的元素长度;第四个参数是要替换的列表.
- perl 默认变量: $_
- reverse 操作符  
  读取列表的值(也可能来自数组),并按相反的次序返回该列表.
- sort 操作符
- each 操作符

## 标量的上下文与列表的上下文

同一个表达式出现在不同的地方有不同的意义.

上下文感知(context sensitivity)

### 标量上下文中使用产生列表的表达式

### 在列表上下文中使用产生标量的表达式

### 强制指定标量上下文

### 列表上下文中的 \<STDIN\>

# 子程序

## 定义子程序

```
sub func_name {
    # 子程序实现体
}
```

- 子程序可以被定义在程序中的任意位置
- 子程序的定义是全局的
- 同名子程序后面的会覆盖掉前面;如果启用了警告信息,会提示子程序被重复定义
- 子程序中可以使用任何全局变量

## 调用子程序

```
&func_name();
```

## 返回值

- 所有的子程序都有一个返回值.子程序没有"有返回值"或"没有返回值"之分.
- 在子程序的执行过程中,最后一次运算的结果(不管是什么)都会被自动当成子程序的返回值.

## 参数

- 要传递参数列表到子程序里,只要在子程序调用的后面加上括号圈引的列表表达式就可能了,参数列表将会被传入子程序,让子程序随意使用.
- per 会自动将参数列表化名为特殊的数组变量 @_,该变量在子程序执行期间有效.
- @_ 变量是子程序的私有变量.

## 子程序中的私用变量

- 借助 my 操作符来创建私有变量,称之为词法变量(lexical variable)

## 变长参数列表

```perl
sub max {
    my($max_so_far) = shift @_; # 数组中的第一值,暂时把它当成最大值
    foreach (@_) {              # 遍历数组
        if ($_ > $max_so_far) {
            $max_so_far = $_;
        }
    }

    $max_so_far;
}
```

## 关于词法(my)变量

- 可以使用在任何语句块内,包括但不仅限于子程序语句块, if, while, foreach 语句块.
- 词法变量的作用域(scope)受限于定义它的最内层语句块(或文件).
- my 操作符不会更改变量赋值时的上下文.

## use strict 编译指令

## return 操作符

## 省略与号

- 如果编译器在调用子程序前看到过子程序的定义,或者 perl 通过词法规则判断它只能是个子程序调用,那么对待子程序可以像内置函数那样,在调用时省略与号.
- 只要将参数列表放进括号里,它就一定是函数调用.

## 非标量返回值

## 持久性私有变量

- 使用 state 操作符来声明的变量,可以在子程序的多次调用期间保留变量之前的值,并将变量的作用域局限于子程序内部.
- 在使用数组和哈希类型的 state 变量时,有一些轻微限制.  
  perl5.10 中不能在列表上下文初始化数组和哈希类型的 state 变量:  
  state @array = qw(a b c); # 错误!

# 第五章 输入与输出

## 读取标准输入

```
<STDIN>

chomp($line = <STDIN>);

while (defined($line = <STDIN>)) {
    print "I saw $line";
}

while (<STDIN>) {
    print "I saw $_";
}
```

## 来自钻石操作符的输入

```
while (<>) {
    chomp;
    print "It was $_ that I saw!\n";
}
```

## 调用参数

- @ARGV 数组是由 perl 解释器事先建立的特殊数组,其内容是由命令行参数组成的列表.

## 输出到标准输出

- print 后面的括号可有可无.

```
print <>;       # 相当于 unix 下的 cat 命令
print sort <>;  # 相当于 unix 下的 sort 命令
```

## 用 printf 格式化输出

## 数组和 printf

```
printf "The items are:\n" . ("%10s\n" x @items), @items;
```

## 文件句柄(filehandle)

- 6个特殊的文件句柄是 perl 保留的,分别是: STDIN, STDOUT, STDERR, DATA, ARGV以及 ARGVOUT.

## 打开文件句柄

```
open R_FP, '<', $file_name;
open W_FP, '>', $file_name;
open LOG, '>>:encoding(UTF-8)', &logfiel_name();
```

## 以二进制方式读写文件句柄

## 有问题的文件句柄.

## 关闭文件句柄

```
close LOG;
```

## 用 die 处理致命的错误

```
if (! open LOG, '>>', 'logfile') {
    die "Can't create logfile: $!";
}
```

## 用 warn 送出警告信息

## 自动检测致命错误

```
use autodie;
```

## 使用文件句柄

```
if (! open PASSWD, "/etc/passwd") {
    die "How did you get logged in? ($!)";
}

while (<PASSWD>) {
    chomp;
    # ...
}
```

## 改变默认的文件输出句柄

```
select LOG_FILE
```

```
select LOG;
$| = 1; # 不要将 LOG 的内容保留在缓冲区
select STDOUT;
# ...
print LOG "This gets written to the LOG at once!\n";
```

## 重新打开标准文件句柄

```
# 将错误信息写到错误日志中
if (! open STDERR, '>>', '/home/work/error.log') {
    die "Can't open error log for append: $!";
}
```

在重新打三个系统文件句柄STDIN, STDOUT, STDERR 失败时, perl 会找回原先的文件句柄.

## 用 say 来输出(自动加换行)

## 标量变量中的文件句柄

# 第六章 哈希

## 访问哈希元素

```
$hash{$some_key};
```

## 访问整个哈希

```
%some_hash = ('foo', 35, 'bar', 12.4, 2.5, 'hello',
    'wilam', 1.72e30, 'betty', "bye\n");
```

## 胖箭头

```
my %last_name = (
    'fred' => 'flintstone',
    'dino' => undef,
    'betty'=> 'rubble',
);
```

## 哈希函数

### keys 和 values 函数

```
my %hash = ('a' => 1, 'b' => 2, 'c' => 3,);
my @k = keys %hash;
my @v = values %hash;
```

- 只要在取得键与值这两个动作之间不修改哈希,顺序是一致.
- 在标量上下文中,这两个函数返回哈希元素(键-值对)的个数.

```
my $count = keys %hash;
```

### each 函数

```
while (($key, $value) = echo %hash) {
    print "$key => $value\n";
}
```

- each 返回的键一值对与 keys和values 函数返回的顺序一致

```
foreach $key (sort keys %hash) {
    $value = $hash{$key};
    # ...
}
```

### exists 函数

### delete 函数

### %ENV 哈希

# 第七章 漫游正则表达式王国

- 元字符点号(.)能匹配任意一个字符,换行符("\n")除外.
- 简单的量词,星号(*)来匹配前面的条目零次或多次.
- 常戏称 .* 为"捡破烂(any old junk)"模式,因为它能匹配字符串中的随便什么东西.
- 加号(+)匹配前一个条目一次以上.
- 问号(?)表示前一个条目可有可无.

## 模式分组

正则表达式中,圆括号((),或称小括号)的作用是对字符串分组.

## 择一匹配

竖线(|)通常可以读成"或",意思是要么匹配左边内容,要么匹配右边的内容.

## 字符集

```
字符集(character classs),指的是一组可能出现的字符,通过写在方括号([])内表示.它只匹配单个字符,但可以是字符集列出的任何一个.

可以在字符集开头的地方加上脱字符(caret,^)来表示这些字符除外.
```

### 字符集的简写

```
\d 表示任意一个数字的字符集
\s 匹配任意空白符,效果大抵等同于 Unicode属性\p{Space}
\R perl5.10中引入,匹配任意一种断行符
\w 一直被称作"单词(word)"字符,但它匹配的字符并不是严格意义上的单词字符
```

### 反义简写

大写版本表示否定意义.


# 第8章 用正则表达式进行匹配

## 用 m// 进行匹配

应该明智地选择模式中不会出现的字符作为定界符,提高代码可读性,降低维护成本.

## 模式匹配修饰符

- 用 /i 进行大小写无关的匹配
- 用 /s 匹配任意字符
- 用 /x 加入空白符

## 组合选项修饰符

## 锚位

```
\A 锚位匹配字符串的绝对开头.如果开头位置上不匹配,是不会顺移到下一个位置继续尝试.
m{\Ahttps?://}i

\z 要切尔西字符串的绝对末尾.
m{\.png\z}i

匹配一个空行
/\A\s*\Z/

单词锚位
\b 是单词边界锚位
```

## 绑定操作符 =~

## 捕获变量

### 捕获变量的存续期

捕获变量通常能存活到下次成功匹配为止.失败的匹配不会改动上次成功匹配时捕获的内容,而成功的匹配会将它们的值重置.

### 不捕获模式

在左括号后面加问号和冒号(?:),告诉 perl 这对不括号完全是为了分组而存在.

### 命名捕获

(?<LABEEL>PATTERN) 提取捕获内容时需要访问的变量变成了 $+{LABEEL};

### 自动捕获变量

```
$& 保存了整个的匹配区段
匹配区段之前的内容存到 $` 里
匹配区段之后的内容刚存到 $' 里

perl5.10 或以上的版本,修饰符 /p 只会针对特定的正则表达式开启类似自动捕获变量,但它的名字不再是 $`, $&和$',而是用 ${^PREMATCH}, ${^MATCH}和${^POSTMATCH}.
```

## 能用量词

模式中的量词(quantifier)代表前面条目的重复次数.花括号({})的形式指定具体的重复次数范围.

## 优先级

正则表达式特性 | 示例
-------------- | ---
圆括号(分组或捕获) | (...), (?:...), (?<LABEEL>...)
量词 | a*, a+, a?, a{n,m},
锚位和序列 | abc, ^, $, \A, \b, \z, \Z
择一竖线 | a\|b\|c
原子 | a, [abc], \d, \1, \g{2}

# 第九章 用正则表达式处理文本

## 用 s/// 进行替换

## 用 /g 进行全局替换

- 如果匹配失败,则什么事都不会发生,变量也不受影响.
- s/// 返回的是布尔值,替换成功时为真,否则为假.

```
s/^\s+//;   # 将开头的空白替换成空字符串
s/\s+$//;   # 将结尾的空白替换成空字符串
s^s+|\s+$///g;  # 去除开头和结尾的空白字符串
s/\s+/ /g;  # 将任何连续的空白转换成单一空格
```

## 不同的定界符

## 可用替换修饰符

/g, /i, /x, /s 联合使用的时候无需关心前后顺序

## 绑定操作符

## 无损替换

```
1. 传统作法
my $original = 'Fred ate 1 rid';
my $copy     = $original;
$copy =~ s/\d+ribs?/10 ribs/;

也可以将后两步合并
(my $copy = $original) =~ s/\d+ ribs?/10 ribs/;
```

`perl5.14 增加一个 /r 修饰符.原先 s/// 操作完成后返回的是成功替换的次数,加上 /r 之后,会保留原来的字符串变量中的值不变,把替换结果作为替换操作的返回值返回.`

## 大小写转换

```
$_ = "I saw Barney with Fred.";
s/(fred|barney)/\U$1/gi;    # $_ 现在成了 "I saw FARNEY with FRED."

s/(fred|barney)/\L$1/gi;    # $_ 现在成了 "I saw farney with fred."

默认情况下,会影响之后全部的(替换)字符串.可以用 \E 关闭大小写转换在功能:
s/(\w+) with (\w+)/\U$2\E with $1/i;    # $_ 替换为 "I saw FRED with barney."

使用小写形式(\l与\u)时,它们只会影响紧跟其后的第一个字符:
s/(fred|barney)/\u$1/gi;    # $_ 替换后为 "I saw FRED with Barney."

同时使用\u与\L来表示"后续字符全部转为小写的,但首字母大写":
s/(fred|barney)/\u\L$1/gi;  # $_ 现在成了 "I saw Fred with Barney."

替换的大小写转换同样适用于任何双引号的字符串中:
print "Hello, \L\u$name\E, would you like to play a game?\n";
```

## split 操作符

```
my @fields = split /separator/, $string;
```

# join 函数

```
my $result = join $glue, @pieces;

join 的第一个参数是字符串,而不是模式.
```

## 非贪婪量词

`.+?` 它会匹配一个以上的字符,但越短越了.

```
加号的非贪婪版本是 +?
星号的非贪婪版本是 *?
花括号的非贪婪版本是 {n,m}?
问号的非贪婪版本是 ??
```

## 跨行的模式匹配

模式加上 /m 修饰符之后,可以用它们匹配字符串内的每一行(把 m 看作多行(multipl lines)).

## 一次更新多个文件

```perl
#!/usr/bin/perl -w

use strict;

chomp(my $date = `date`);
$^I = '.bak';

while (<>) {
    s/^Author:.*/Author: Jerry Yang/;
    s/^Phone:.*\n//;
    s/^Date:.*/Date: $date/;

    print;
}
```

`$^I 变量默认值是 undef,不会对程序造成任何影响;如果其值是个字符串,它将会变成备份文件的扩展名.

## 从命令行直接编辑

```
$ perl -p -i.bak -w -e 's/Randall/Randal/g' fred*.dat
```

# 第十章 其他控制结构

## unless 控制结构

如果想让代码块在条件为假时才执行,把 if 改成 unless

## until 控制结构

循环一直执行,直到条件为真.

## 表达式修饰符

不建议,影响代码可读性.

## 裸块控制结构

```
{
    code;
}
```

## elsif 子句

## 自增与自减

## 自增的值

把 ++ 操作符写在变量之前就能增加变量的值,然后获取新值,称为前置自增(preincrement).  
把 -- 操作符写在变量之前,先自减,再取新值,称为前置自减(predecrement).

## for 控制结构

```
for (初始化; 测试; 递增/递减) {
    程序逻辑部分;
}
```

## 循环控制操作符

### last 操作符

last 操作符能立即中止循环的执行,就像C语言中的"break"操作符一样.它是循环的"紧急出口".

在 perl中有5种循环块,它们是 for, foreach, while, until 以入裸块.

last 操作符只会对当前运行中的最内层的循环发挥作用.

### next 操作符

类似于C语言的"continue"

### redo 操作符

将控制返回到当前循环块的顶端,而不经过任何条件测试,也不会进入下一次循环迭代.

### 带标签的块

需要从内层对外层的循环进行控制时,使用标签(label).

## 条件操作符 ?:

## 逻辑操作符

## 短路操作符的值

和C语言不同的地方在于, perl 的短路操作符求得的值不只是简单的布尔值,而是最后运算的那部分表达式的值.

# 第十一章 perl 模块

```
$ perldoc CGI

$ cpan -a
可以创建 autobundle 文件,会列出所有已经安装了的模块,包括版本号.
```

## 安装模块

```
$ perl Makefile.PL
$ make install
```

如果提示权限不足,尝试参数:

```
$ perl Makefile.PL INATALL_BASE=/Users/work/local/lib
```

辅助模块安装流程

```
$ per Build.PL
$ ./Build install
$ perl Build.PL --install_base=/Users/work/local/lib
```

自带的安装方式

```
$ perl -MCPAN -e shell
```

## File::Basename 模块

```
use File::Basename;
```

## 仅选用模块中的部分函数

```
use File::Basename qw/ basename /;

# 不要引入任何新函数
use File::Basename qw/ /;
use File::Basename ();
```

## File::Spec 模块(file specfication)

## Path::Class 模块

## CGI.pm 模块

## 数据库和 DBI(Database Interface)模块

DBD(Database Driver, 数据库驱动程序)

## 处理日期和时间的模块 DateTime

# 第十二章 文件测试

## 文件测试操作符

文件测试操作符 | 意义
-------------- | ---
-r | 文件或目录,对目前(有效的)用户或组来说是可读的
-w | 文件或目录,对目前(有效的)用户或组来说是可写的
-x | 文件或目录,对目前(有效的)用户或组来说是可执行的
-o | 文件或目录,对目前(有效的)用户拥有
-R | 文件或目录,对实际的用户或组来说是可读的
-W | 文件或目录,对实际的用户或组来说是可写的
-X | 文件或目录,对实际的用户或组来说是可执行的
-O | 文件或目录,由实际的用户拥有
-e | 文件或目录,是存在的
-z | 文件存在而且没有内容(对目录来说永远为假)
-s | 文件或目录存在而且有内容(返回值是以字节为单位的文件大小)
-f | 是普通文件
-d | 是目录
-l | 是符号链接
-S | 是 socket 类型的文件
-P | 是命名管道,也就是先入先出(fifo)队列
-b | 是块设备文件(比如某个可挂载的磁盘)
-c | 是字符设备文件(比如某个 I/O 设备)
-u | 文件或目录设置了 setuid 位
-g | 文件或目录设置了 setgit 位
-k | 文件或目录设置了 sticky 位
-t | 文件句柄是 TTY 设备(类似系统函数 isatty() 的测试,不能对文件名进行此测试)
-T | 看起来像文本文件
-B | 看起来像二进制文件
-M | 最后一次被修改后至今的天数
-A | 最后一次被访问后至今的天数
-C | 最后一次文件节点编号(inode)被变更至今的天数

## 测试同一个文件的多项属性

```
if (-r $file and -w $file) {
    # code
}

# 虚拟文件句柄提高效率
if (-r $file and -w _) {
    # code
}
```

## 栈式文件测试操作

## stat 和 lstat 函数

```
my($dev, $ino, $mode, $nlink, $uid, $gid, $rdev,
    $size, $atime, $mtime, $ctime, $blksize, $blocks)
        = stat($filename);
```

## localtime 函数

```
my($sec, $min, $hour, $day, $mon, $year, $wday, $yday, $isdst)
    = localtime $timestamp;
```

## 按位运算(bitwise operator)操作符

`& | ^  >> << ~`

# 第十三章 目录操作

## 在目录树中移动

`chdir '/etc' or die "Can't chdir to /etc: $!"`

## 文件名通配

`my @all_files_including_dot = glob '.* *'`

## 文件名通配的另一种语法

`my @all_files = <*> # 效果和这样的写法完全一致: my @all_files = glob "*"`

## 目录句柄(directory handle)

```
my $dir_to_process = '/etc';
opendir my $dh, $dir_to_process or die "Can't open $dir_to_process: $!";
foreach $file (readdir $dh) {
    print "one file in $dir_to_process is $file\n";
}
closedir $dh;
```

```
opendir my $somedir, $dirname or die "Can't open $dirname: $!";
while (my $name = readdir $somedir) {
    next if $name =~ /^\./;             # 跳过名称以点号开头的文件
    $name = "$dirname/$name";           # 拼合为完整的路径
    next unless -f $name and -r $name   # 只需要可读的文件
    # some logic
}
```

可移植的

```
use File::Spec::Functions;

opendir my $somedir, $dirname or die "Can't open $dirname: $!";
while (my $name = readdir $somedir) {
    next if $name =~ /^\./;             # 跳过名称以点号开头的文件
    $name = catfile($dirname, $name);   # 拼合为完整的路径
    next unless -f $name and -r $name   # 只需要可读的文件
    # some logic
}
```

## 递归访问目录

`File::Find`

## 文件或目录的操作

### 删除文件

```
unlink 'slate', 'bedrock', 'lava';
unlink qw(slate, bedrock, lava);

unlink glob '*.o';
```

unlink 的返回值代表成功删除的文件数目.

### 重命名文件

`rename 'old', 'new';`

### 链接与文件

```
link 'chicken', 'egg'
    or warn "Can't link chicken to egg: $!";

symlink 'dodgson', 'carroll'
    or warn "Can't symlink dodgson to carroll: $!";
```

### 创建和删除目录

```
mkdir 'fred', 0755 or warn "Can't make fred directory: $!";

rmdir $dir or warn "Can't rmdir $dir: $!";
```

### 修改权限

```
chmod 0755, 'fred', 'barney';
```

### 修改隶属关系

```
my $user  = 1004;
my $group = 100;
chown $usr, $group, glob '*.o';

defined(my $user  = getpwnam 'merlyn') or die 'bad user';
defined(my $group = getgrnam 'users') or die 'bad group';
chown $user, $group, glob '/home/merlyn';
```

### 修改时间戳

```
my $now = time;
my $ago = $now - 24 * 3600; # 一天的秒数
utime $new, $ago, glob '*'; # 将最后访问时间改为当前时间,最后修改时间改为一天前
```

# 第十四章 字符串与排序

## 用 index 查找子字符串

`$where = index($big, $small);`

在 $big 字符串中寻找 $small 字符串前次出现的地方,并返回一个整数表示第一个字符的匹配位置,返回的字符位置是从零算起.如果无法找到子串,返回 -1.可选的第三个参数来指定开始搜索的地方.

搜索字符串最后出现的位置:
`my $last_slash = rindex('/etc/password', '/'); # 值为4`

rindex 函数也有可选的第三个参数,但是用来限定返回值的上限.

## 用 substr 操作子字符串

`my $part = substr($string, $initial_postion, $lenght);`

三个参数:一个原始字符串,一个从零起算的超始位置,以及子字符串的长度.返回找到的子字符串.第三个参数可选

## 用 sprintf 格式化字符串

## 用 sprintf 格式化金额数字

## 非十进制数字字符串的转换

```
hex($str);
oct($str);
```

## 高级排序

```
sub any_sort_sub {      # 实际上这么写不能正确工作,这里只是为了方便说明问题
    my($a, $b) = @_;    # 声明两个变量并给它们赋值
    # 在这里开始比较 $a 和 $b
    ...
}
```

## 按哈希值排序

## 按多个键排序

# 第十五章 智能匹配与 given-when 结构

## 智能匹配操作符

`use 5.010001 # 至少是 5.10.1 版`

智能匹配操作符 ~~ 会根据两边的操作数的数据类型自动判断该用何种方式进行比较或匹配.

## 智能匹配操作的优先级

范例 | 匹配类型
---- | -------
%a ~~ %b | 哈希的键是否一致
%a ~~ @b 或 @a ~~ %b | %a 中的至少一个键在列表 @b 中
%a ~~ /Fred/ 或 /Fred/ ~~ %b | 至少有一个键匹配给定的模式
'Fred' ~~ %a | 是否存在 $a{Fred}
@a ~~ @b | 数组是否相同
@a ~~ /Fred/ | @a 中至少有一个元素匹配模式
$name ~~ undef $name | $name 没有定义
$name ~~ /Fred/ | 模式匹配
123 ~~ '123.0' | 数值和 "numish" 类型的字符串是否相等
'Fred' ~~ 'Fred' | 字符串是否相同
123 ~~ 456 | 数值是否相等

## given 语句

given-when 控制结构能够根据 given 后面的参数执行某个条件对应的语句块.

```
use 5.010001;

given ($ARGV[0]) {
    when ('Fred')   {say 'Name is Fred.'}
    when (/fred/i)  {say 'Name has fred in it.'}
    when (/\AFred/) {say 'Name starts with Fred.'}
    default         {say 'I do NOT see a Fred.'}
}
```

支持 continue, break.

# 第十六章 进程管理

## system 函数

```
system 'date';
system 'ls -l $HOME';
```

## 避免使用 shell

## 环境变量

## exec 函数

system 函数会创建子进程,子进程会在 perl 睡眠期间执行任务.而 exec 函数却导致 perl 进程自己去执行任务.

## 用反引号捕获输出结果

还可以使用更为一般化的引起操作 qx().

## 在列表上下文中使用反引号

## 用 IPC::System::Simple 执行外部进程

## 通过文件句柄执行外部进程

```
open DATE, 'date |' or die "Can't pipe from date: $!";
open MAIL, '| mail merlyn' or die "Can't pipe to mail: $!";
```

如果需要读取用的文件句柄,就用 - |,如果需要写入用的文件句柄,就用 | -, - 的位置就好比是要执行的命令管道传递中的位置.

## 用 fork 进行深入和复杂的工作

## 发送及接收信号

# 第十七章 高级 perl 技巧

## 切片

## 数组切片

## 哈希切片

## 捕获错误

## 用 eval

## 更为高级的错误处理

## 用 grep 筛选列表

## 用 map 把列表元素变形

