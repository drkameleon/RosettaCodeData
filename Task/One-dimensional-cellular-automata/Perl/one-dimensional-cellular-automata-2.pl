$_="_###_##_#_#_#_#__#__\n";
%h=qw(# _ _ #);
do {
  print;
  s/(?<=(.))(.)(?=(.))/$1 eq $3 ? $1 eq "_" ? "_" : $h{$2} : $2/eg;
} while ($x ne $_ and $x=$_);