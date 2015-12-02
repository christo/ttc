#!/usr/bin/perl -w

use strict;

open(my $fh, "<", "Tao Te Ching.html")
                   or die "cannot open file: $!";

while(<$fh>) {
    s/(.*)<BR>/$1/;
    s/<HR>//;
    s/<H2><B>(\d+)<\/B><\/H2>/$1\n/; #chapter
    s/<A NAME="\d+"><\/A>//;
    s/<A HREF = "#\d+"> \d+<\/A>,?//;
    s/<\/?(HTML|HEAD|ADDRESS|BODY|style)[^>]*>//;
    print $_;
}
