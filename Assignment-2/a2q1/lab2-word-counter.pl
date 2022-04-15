#!/usr/bin/perl
#use warnings;
#use string;

my $total = 0;
while(<>)
{
    while(/[a-zA-Z]+/g)
    {
	$total++;
    }
}

print "\nTotal number of words: $total\n";