#!/usr/bin/perl

use utf8;
use strict;
use warnings;
use diagnostics;

print "Hello world.\n";

#if (defined($test_undef))
#{
#    print "true\n";
#} else {
#    print "false\n";
#}

my $t = 2 x 3;
print $t, "\n";

#chomp(my @lines = <STDIN>);
#print @lines, "\n";

#while (<STDIN>) {
#    print "I saw $_";
#}

# 测试命令行参数.
print @ARGV, "\n";
print "@ARGV\n";
print $ARGV[0], "\n";
