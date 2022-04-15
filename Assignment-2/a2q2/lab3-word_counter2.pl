#!/usr/bin/perl
#use warnings;
#use strict;

sub f
{
    my ($word,$ref_fhash) = @_;
    return exists($$ref_fhash{$word}) ? $$ref_fhash{$word} : 0;
}

my %fhash=();
my $tot=0;

while (<>) {
    while (/\w+/) {
        my $l = $&;
        $_ = $';
        $fhash{lc $l} += 1;
        $tot ++;
    }
}


print &f('tom',\%fhash);
print "\n";

print &f('sawyer',\%fhash);
print "\n";

print &f('huck',\%fhash);
print "\n";