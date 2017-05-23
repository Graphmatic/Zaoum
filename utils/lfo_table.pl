#!/usr/bin/perl

$tick_rate = 1E-3;

printf "const unsigned int lfo_add_table[256] = {\r\n";

for($x=0; $x<256; ++$x)
{
  # FRQ = 1 / ((65536 / ADD) * TICK_RATE)
  # -> FRQ = ADD / (65536 * TICK_RATE)
  # -> ADD = FRQ * 65536 * TICK_RATE

  my $frq = exp(0.018*$x)-1;
  my $add = int($frq * 65536 * $tick_rate);
  my $effective_frq = $add / (65536 * $tick_rate);
  printf "  %5d, // %3d: %6.3f Hz\r\n", $add, $x, $effective_frq;
}

printf "};\r\n";



# $tick_rate = 1E-3; 

#printf "const unsigned int lfo_add_table_bpm_8[256] = {\r\n";

#for($x=48; $x<256; ++$x)
#{
  # FRQ = 1 / ((65536 / ADD) * TICK_RATE)
  # -> FRQ = ADD / (65536 * TICK_RATE)
  # -> ADD = FRQ * 65536 * TICK_RATE

#  my $bpm = $x;
#  my $add = int(((65536 * ($bpm/60))/ 1000)*4);
#  my $effective_frq = $bpm /60;
#  printf "  %5d, // %3d: %6.3f Hz\r\n", $add, $x, $effective_frq;
#}

# printf "};\r\n";

$tick_rate = 1E-3; 
$clock_par_ms = 10000;
printf "const unsigned int lfo_add_table_bpm_ms[256] = {\r\n";

for($x=48; $x<256; ++$x)
{
  # cycles_par_sec = 60/bpm
  # cycles_par_sec/1000 = cycles_par_ms
  # 65536/cycles_par_ms = add_par_ms
  # cycles_par_f8 * 24 = cycles_par_beat
  # cycles_par_beat/ = 10000/ 
#  my $f8_par_ms =  $beat_par_ms / 24;
  # 

  my $bpm = $x;
  my $beat_par_sec = $bpm / 60;
  my $beat_par_ms = $beat_par_sec / 1000;
  my $add_ms = int(65536 * $beat_par_ms);
  my $clock_par_beat = $clock_par_ms / $beat_par_ms; 
  my $clock_par_f8 = $clock_par_beat / 24;
  my $ms_beat = 1 / $beat_par_ms;
  my $ms_f8 = $ms_beat / 24;
  printf "  %5d, // %3d: %f ms_f8 %f ms_beat\r\n", $add_ms, $x, $ms_f8, $ms_beat;
}


printf "};\r\n";
