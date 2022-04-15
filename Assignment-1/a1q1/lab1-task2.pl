#!/usr/bin/perl
use warnings;
use strict;

sub conc{
    my $ret;
    my $str1 = shift;
    my $str2 = shift;

    if($str1 gt $str2)
    {
	$ret = $str2.$str1;
	return $ret;
    }
    $ret = $str1.$str2;
    return $ret;
}

print &conc('aaa','ccc');
print "\n";
print &conc('ccc','aaa');
print "\n";