#!/usr/bin/perl
#use warnings
#use strict

my @matrix;
my @actual;
my @pred;
my @twodarray = ();
my $totalPrecision = 0;
my $totalRecall = 0;

sub uniq {
    my %seen;
    grep !$seen{$_}++, @_;
}


while(<>)
{
    if($_ =~ /(.*)(label:)(.)(.*)/)
    {
	push(@actual,$3);
    }
    if($_ =~ /(.*)(result:)(.*)/)
    {
	push(@pred,$3);
    }
    if($_ =~ /end/)
    {
	last;
    }
}


my @filtered = uniq(@actual);


for(my $i; $i<=$#actual;$i++)
{
    push(@twodarray,[$actual[$i],$pred[$i]]);
}


for (my $i=0; $i<=$#filtered; $i++)
{
    for(my $j; $j<=$#twodarray; $j++)
    {
	if($filtered[$i] eq $twodarray[$j][0])
	{
	    for ($m=0; $m<=$#filtered; $m++)
	    {
		if($twodarray[$j][1] eq $filtered[$m])
		{
		    $matrix[$i][$m] += 1;
		}
	    }
	}
    }
}

for (my $x=0;$x<=$#matrix;$x++)
{
    for (my $y=0;$y<=$#filtered;$y++)
    {

	if($matrix[$x][$y] > 0)
	{
	}
	else
	{
	    $matrix[$x][$y] = 0;
	}
    }
}


for(my $i=0; $i<=$#filtered; $i++)
{

    my $TPFP=0;
    my $TPFN=0;
    my $P,$R,$F=0;

   for($j=0;$j<=$#filtered;$j++)
    {

	$TPFP += $matrix[$j][$i];
	$TPFN += $matrix[$i][$j];
    }

    if($TPFP != 0)
   {
       $P = $matrix[$i][$i]/$TPFP;
   }
    if($TPFN !=0)
   {
    $R = $matrix[$i][$i]/$TPFN;
   }
    if($P !=0  && $R != 0)
   {
    $F = (2*$P*$R)/($P+$R);
   }
    $totalPrecision += $P;
    $totalRecall += $R;

    printf("P($filtered[$i])=%.5f R($filtered[$i])=%.5f F1($filtered[$i])=%.5f\n",$P,$R,$F);
}

my $avgPrecision = $totalPrecision/scalar(@filtered);
my $avgRecall = $totalRecall/scalar(@filtered);
my $avgFmeasure = (2*$avgPrecision*$avgRecall)/($avgPrecision+$avgRecall);

printf("P=%.5f R=%.5f F1=%.5f\n",$avgPrecision,$avgRecall,$avgFmeasure);