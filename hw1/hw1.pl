#!/usr/bin/perl

foreach my $a(@ARGV) {
	open(my $fh, '<:encoding(UTF-8)', $a)
 		or die "Could not open file '$a' $!";
 
	while (my $row = <$fh>) {
  		chomp $row;
  		print "$row\n";
	}
}