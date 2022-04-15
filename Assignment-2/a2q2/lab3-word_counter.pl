#!/usr/bin/perl
#use warnings;
#use strict;

my %f=();
my $tot=0;
my $lcount = 0;

while (<>) {
    while (/\w+/) {
        my $l = $&;
        $_ = $';
        $f{lc $l} += 1;
        $tot ++;
    }
}

print("10 most common words are:\n");

for my $i((sort { $f{$b} <=> $f{$a} } keys %f)[0..9]) {
        print sprintf("%s ",$i);
}

foreach( keys %f)
{
    if($f{$_} eq '1')
    {
    $lcount++;
    }
}

print("\nThe number of hapax legomena is $lcount \n");