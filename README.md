# P4 Wire Example Application #

The P4 Wire application is a basic example application that forwards all traffic from port 0 on the SmartNIC to to Virtual Function Port 0.

# Installing and Testing P4 Wire with ICONICS:

1.  Follow instructions on http://iconicsp4.cloudapp.net/ to install the NFP SDK RTE, setup access to the ICONICS repository and identifying your SmartNIC

    To install package:
      yum install nfp-sdk6-p4-config-<smartnic>-p4wire-<version>.noarch
	  
	List all the available packages in the repo:
	  repoquery -qa --repoid=iconics

2.  The test script will be installed to:
      /opt/nfp_pif/etc/smartnic-configs/<smartnic>-p4wire/

3.  Wait for firmware to load onto the SmartNIC:
      Use ifconfig to see when VFs have loaded before trying to run tests.

4.  Run the test script on the host where your SmartNIC is installed:
      ./p4wire-test.sh <port>
      ./p4wire-test.sh p2p1

      Make sure you have downloaded the .pcap files provided in this repo
      Make sure you have tcpreplay installed on your host:
        yum install tcpreplay
      The .pcap files must be in the same directory as the test script.

5.  Setup:
                      Host
_______________________________________________________
        vf0
   ______|_______           ______________
  |   SmartNIC   |         |   DumbNIC    |
  |            p0|---------|p2p1<port>    |
  |   Firewall   |         |              |
  |              |         |              |
  |______________|         |______________|

_______________________________________________________

  The test script will do the following:
    - Send a packet from <port> to p0: Forward to vf0_0
    - Send a packet to vf0_0: Forward to p0
