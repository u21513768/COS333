#!/usr/bin/perl

use strict;
use warnings;

# Check if correct number of command line arguments are provided
if (@ARGV != 2) {
    print "Usage: perl script.pl <input_file> <word_to_search>\n";
    exit(1);
}

# Read command line arguments
my $inputFile = $ARGV[0];
my $searchWord = $ARGV[1];

# Read contents of input file
open(my $fh, '<', $inputFile) or die "Error opening input file: $!";
my $fileContents = do { local $/; <$fh> };
close($fh);

# Convert to lowercase and remove non-alphabetic characters
my $cleanedString = lc($fileContents);
$cleanedString =~ s/[^a-z]//g;

# Count occurrences of the word in reverse order
my $matches = () = reverse($cleanedString) =~ /\Q$searchWord/g;

# Output the result
print "Matches: $matches\n";
