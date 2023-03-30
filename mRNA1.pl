#!/usr/bin/env perl

use strict;
use warnings;

print "DNA->RNA\n";
#my $dna = 'TACCATGTTTCCAGG';
my $dna = 'TACCATGTTTCCAGGATCCGCGCTTAGCTGTACAAGGATGTGACACCCAAACCGT';

my $nA = $dna =~ tr/A//;
my $nC = $dna =~ tr/C//;
my $nG = $dna =~ tr/G//;
my $nT = $dna =~ tr/T//;
print "A($nA) C($nC) G($nG) T($nT)\n";

my @dna = split '', $dna;
(my $rna = $dna) =~ tr|ATGC|UACG|;
my @rna = split '', $rna;

print map {"$dna[$_]  ->  $rna[$_]\n" } 0..$#dna;

#my %codon =<<'CODON' =~ /^([AUGC]{3})\s(\w+)/mg;
my %codon = qw(
UUU phenylalanine 
UUC phenylalanine 
UUA leucine 
UUG leucine
CUU leucine 
CUC leucine 
CUA leucine 
CUG leucine
AUU isoleucine 
AUC isoleucine 
AUA isoleucine 
AUG methionine
GUU valine
GUC valine
GUA valine 
GUG valine
UCU serine
UAU tyrosine
UGU cysteine
UCC serine
UAC tyrosine
UGC cysteine
UCA serine
UAA stop
UGA stop
UCG serine
UAG stop
UGG tryptophan
CCU proline
CAU histidine
CGU arginine
CCC proline
CAC histidine
CGC arginine
CCA proline
CAA glutamine
CGA arginine
CCG proline
CAG glutamine
CGG arginine
ACU threonine
AAU asparagine
AGU serine
ACC threonine
AAC asparagine
AGC serine
ACA threonine
AAA lysine
AGA arginine
ACG threonine
AAG lysine
AGG arginine
GCU alanine
GAU aspartic_acid
GGU glycine
GCC alanine
GAC aspartic_acid
GGC glycine
GCA alanine
GAA glutamic_acid
GGA glycine
GCG alanine
GAG glutamic_acid
GGG glycine);
#CODON

print "Amino Acids:\n";
while ($rna =~ /(...)/g) {
	print "$1 -> " . $codon{$1} ."\n";
}

