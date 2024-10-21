## Create the systemd services that are needed

```
sudo systemctl enable phc2sys@eth0.service
sudo systemctl enable ptp4l@eth0.service
sudo systemctl enable sync-phc.service
sudo systemctl enable configure-eth0-timestamping.service
```
