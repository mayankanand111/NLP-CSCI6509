#!/usr/bin/perl
#use warnings
#use strict

my $first;
my $second;
my $index = 1;
my @output;

sub calculate_editdistance()
{
    my $start = shift;
    my $end = shift;
    my @twodarray;
    my $startCount = length($start);
    my $endCount = length($end);

    for(my $i=0; $i <= $startCount; $i++)
    {
        for(my $j = 0; $j <= $endCount; $j++)
        {
            $twodarray[$i][$j] = 0;
        }
    }


    for(my $i = 1; $i <= $startCount; $i++)
    {
        $twodarray[$i][0] = $i;
    }

    for(my $j = 1; $j <= $endCount; $j++)
    {
        $twodarray[0][$j] = $j;
    }


    for(my $i = 1; $i <= $startCount; $i++)
    {
        for(my $j = 1; $j <= $endCount; $j++)
        {

            if((substr($start,$i-1,1) eq substr($end,$j-1,1)))
            {
                $twodarray[$i][$j] = $twodarray[$i-1][$j-1];
            }
            else
            {

                my $substitution = $twodarray[$i-1][$j-1] + 1;
                my $insertion = $twodarray[$i][$j-1] + 1;
                my $deletion = $twodarray[$i-1][$j] + 1;


                my @temparr;
                push @temparr, ($substitution,$insertion,$deletion);
                my $min = $temparr[0];
                foreach(@temparr)
                {
                    if($min > $_)
                    {
                        $min = $_;
                    }
                }
                $twodarray[$i][$j] = $min;
            }
        }
    }
   return $twodarray[$startCount][$endCount];
}


while(<>)
{
    chomp($_);
    if($_ eq "END" && ($index%2)!=0)
    {
        last;
    }
    elsif($index%2 != 0)
    {
        $first = $_;
     }
    elsif($index%2 == 0)
    {
        $second = $_;
        push @output,&calculate_editdistance($first,$second);
        $first = "";
        $second = "";
    }
    $index++;
}

foreach(@output)
{
    print $_; print "\n";
}