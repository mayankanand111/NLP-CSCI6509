#!/usr/bin/env python
# coding: utf-8

# File: a1q5.pl Author: Mayank Anand
# Solution to question 5 of assignment 1, CSCI6509 Fall 2021

import re
import sys


HTMLtags = ""
readfile = open(sys.arg[1]) if len(sys.argv) > 1 else sys.stdin  #reading file from STDIN
HTMLtags = readfile.read()

def repl(m):
    return '_' * len(m.group())

SubsNewlines = re.compile(r'[\n]+') #substituting newlines
woutnewlines = SubsNewlines.sub(' ',HTMLtags)

RemoveCmt = re.compile(r'<!--[\w\s\.*?!<-]*(<!--)*(<)+.*\s*(>)+(-->)*[\w\s\.*?!<-]*?-->')  #removing only those comments which contains a valid tag in them.
withoutcmt = re.sub(RemoveCmt,repl,HTMLtags)

tags = re.findall(r'<[\w\s\.*?!<-]*>', withoutcmt)

#for a in tags:  #kept for testing
    #yprint(a)


#printing starts here

print("Tag Count: ",len(tags))
tags.sort(key = len)
print("Min Length: ", 0 if len(tags)==0 else len(tags[0]))
print("Max Length: ",0 if len(tags)==0 else len(tags[-1]))
sum = 0
for tag in tags:
    sum += len(tag)
print("Avg Length: {:.2f}".format(0 if len(tags)==0 else round(sum/len(tags),2)))