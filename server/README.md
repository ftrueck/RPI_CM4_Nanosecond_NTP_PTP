# Raspberry PI CM4 NTP server with nanosecond precission
## Requirements
- Raspberry PI CM4 module ideally with EMMC memory. RAM is not very important so even the 1GB variant should work fine
- Waveshare Raspberry Pi Compute Module 4 IO Board with PoE Feature (Type B) or any other board exposing the SYNC_IN pin of the RPI CM4
- Noctua NF-A4x10 PWM Fan
- WitMotion WTGPS-300P Submeter GPS-Module with PPS output pin
- Active GPS antenna with 2-3m long SMA connector cable
- IPEX -> SMA adapter cable
- Jumper wires

## Preparation
You need to solder some jumper wires to the GPS module for connecting it to the waveshare base board.
Wiring is pretty straight forward:

```
GPS MODULE  <--->  Waveshare board
======================================
VCC         <--->  VCC (5V)
GND         <--->  GND
RX          <--->  TX
TX          <--->  RX
PPS         <--->  GPIO18  +  SYNC_IN
```

The only tricky part is the PPS connection. You need to connect it to both PINs on the base board. I created a Y-Splitter cable for that reason. Be sure the cables are the same length when possible to avoid differences in signal runtime.
