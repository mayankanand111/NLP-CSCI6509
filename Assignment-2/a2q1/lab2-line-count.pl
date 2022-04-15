#!/usr/bin/perl
#use warnings
#use strict

my $fname = shift;
my $cnt = 0;
open(my $fh,'<', $fname)
    or "Cannot open file $fname: $!";

while(my $line = <$fh>)
{
    $cnt = $.;
}

print "$fname has $cnt lines\n";