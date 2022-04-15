#!/usr/bin/perl
#use warnings
#use strict

# File: a1q4.pl Author: Mayank Anand
# Solution to question 4 of assignment 1, CSCI4152/6509 Fall 2021

my $r;
while ($r = <>) {
while ($r =~ /([\^a-zA-Z])([\w.=+-]*)(\@)([a-zA-Z0-9][\w.=+-]*)(\.)([\w.=+-]*[a-zA-Z\$])/gc) {
    print "$&: $r";
    last;
}
}