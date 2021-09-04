# sim-modem-configuration

created from https://www.thinkpenguin.com/gnu-linux/using-your-4g-lte-modem-terminal

You will have to configure your APN settings before running.
(must be sudo)

apt-get update

apt-get install libmbim-utils



touch /etc/mbim-network.conf

echo APN=(your provider's APN here) > /etc/mbim-network.conf





echo PROXY=yes >> /etc/mbim-network.conf

then run the script. You may need to change wwan0 and wdm0 to your specific device and interface name if it is different.
