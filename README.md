# RPI_CM4_Nanosecond_NTP_PTP
Nano second accurate NTP Server with PTP master support running on a RPI CM4

## Intro
I created this repository to document the steps that I had to take to get my highly accurate NTP server up and running.


## Results
Lets see how it behaves:
```
pi@NTP-SRV-1:/etc $ chronyc sources
MS Name/IP address         Stratum Poll Reach LastRx Last sample
===============================================================================
#* PHC0                          0   3   377     9     +1ns[   +2ns] +/-   55ns
#- GPS                           0   3   377     9    -15us[  -15us] +/-  289ns
^- ptbtime1.ptb.de               1  10   377   180   +236us[ +236us] +/-   11ms
^- ptbtime2.ptb.de               1  10   377   228  -3299us[-3299us] +/-   13ms
^- ptbtime3.ptb.de               1   9   377   317  -3323us[-3323us] +/-   14ms
^- ptbtime4.PTB.DE               1  10   377   112  +1108us[+1108us] +/-   14ms
```
As you can see the PHC signal is pretty darn stable with low jitter and deviation


Lets see how chrony is rating the sources:
```
pi@NTP-SRV-1:/etc $ chronyc sourcestats
Name/IP Address            NP  NR  Span  Frequency  Freq Skew  Offset  Std Dev
==============================================================================
PHC0                        9   7    67     -0.000      0.002     -0ns    24ns
GPS                        15   8   114     -0.020      0.011    -17us   373ns
ptbtime1.ptb.de            31  12   70m     +0.045      0.145   +737us   238us
ptbtime2.ptb.de            30  20   69m     +0.021      0.199   +412us   281us
ptbtime3.ptb.de            30  16   67m     +0.014      0.080  -3143us   117us
ptbtime4.PTB.DE            31  15   71m     -0.038      0.562   -274us   916us
```
Neat, right?


Now for the end lets see how accurate chrony is tracking the sources:
```
pi@NTP-SRV-1:/etc $ chronyc tracking
Reference ID    : 50484330 (PHC0)
Stratum         : 1
Ref time (UTC)  : Mon Oct 21 11:34:38 2024
System time     : 0.000000003 seconds slow of NTP time
Last offset     : -0.000000003 seconds
RMS offset      : 0.000000012 seconds
Frequency       : 14.845 ppm fast
Residual freq   : -0.000 ppm
Skew            : 0.000 ppm
Root delay      : 0.000000001 seconds
Root dispersion : 0.000011345 seconds
Update interval : 8.3 seconds
Leap status     : Normal
```
Not bad. This is something we can work with.
