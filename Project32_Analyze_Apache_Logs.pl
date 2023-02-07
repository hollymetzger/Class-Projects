#! usr/bin/perl
# Mini-Project 32: Perl: Analyze Apache Log File
# Written 02/07/2023 by Holly Metzger

use warnings;
use IO::File;

#open file
my $inputFileName = "apache_access.log";
my $log = IO::File->new("< $inputFileName") or die "Cannot open file: $!";

#initialize variables
my $sameCounter = 0;
my $otherCounter = 0;
my $searchTerm = '127.0.0.1 ';

#count lines containing and not containing search term
while (my $line = <$log>) {
	if ( $line =~ /$searchTerm/ ) {
		$sameCounter++;
	}
	else {
		$otherCounter++;
	}
}

print ("There are $sameCounter requests coming from the same machine, and $otherCounter requests coming from other machines.");

$log close();