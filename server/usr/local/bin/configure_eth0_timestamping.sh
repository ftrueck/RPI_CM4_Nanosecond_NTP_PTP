#!/bin/bash

# Warten Sie kurz, um sicherzustellen, dass eth0 vollständig initialisiert ist
sleep 5

# Konfigurieren der Hardware-Timestamping-Einstellungen für eth0
ethtool -T eth0 tx-hw-stamping on
ethtool -T eth0 rx-hw-stamping on

# Optional: Überprüfen der Einstellungen
ethtool -T eth0
