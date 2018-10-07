From: Richard Cochran <richardcochran@gmail.com>
Subject: [PATCH V2 net-next 0/5] Peer to Peer One-Step time stamping
Date: Sun,  7 Oct 2018 10:38:18 -0700
Message-ID: <20181007173823.21590-1-richardcochran@gmail.com>
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org
Cc: devicetree@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, David Miller <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Jacob Keller <jacob.e.keller@intel.com>, Mark Rutland <mark.rutland@arm.com>, Miroslav Lichvar <mlichvar@redhat.com>, Rob Herring <robh+dt@kernel.org>, Willem de Bruijn <willemb@google.com>
List-Id: devicetree@vger.kernel.org

Changed in v2:
~~~~~~~~~~~~~~
- Per the v1 review, changed the modeling of MII time stamping
  devices.  They are no longer a kind of mdio device.

This series adds support for PTP (IEEE 1588) P2P one-step time
stamping along with a driver for a hardware device that supports this.

If the hardware supports p2p one-step, it subtracts the ingress time
stamp value from the Pdelay_Request correction field.  The user space
software stack then simply copies the correction field into the
Pdelay_Response, and on transmission the hardware adds the egress time
stamp into the correction field.

- Patch 1 adds the new option.
- Patches 2-4 adds support for MII time stamping in non-PHY devices.
- Patch 5 adds a driver implementing the new option.

User space support is available in the current linuxptp master branch.

Thanks,
Richard

Richard Cochran (5):
  net: Introduce peer to peer one step PTP time stamping.
  net: Introduce a new MII time stamping interface.
  net: Add a layer for non-PHY MII time stamping drivers.
  net: mdio: of: Register discovered MII time stampers.
  ptp: Add a driver for InES time stamping IP core.

 Documentation/devicetree/bindings/ptp/ptp-ines.txt |  37 +
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c   |   1 +
 drivers/net/phy/Makefile                           |   2 +
 drivers/net/phy/dp83640.c                          |  47 +-
 drivers/net/phy/mii_timestamper.c                  | 121 +++
 drivers/net/phy/phy.c                              |   4 +-
 drivers/net/phy/phy_device.c                       |   5 +
 drivers/of/of_mdio.c                               |  26 +
 drivers/ptp/Kconfig                                |  10 +
 drivers/ptp/Makefile                               |   1 +
 drivers/ptp/ptp_ines.c                             | 870 +++++++++++++++++++++
 include/linux/mii_timestamper.h                    | 115 +++
 include/linux/phy.h                                |  25 +-
 include/uapi/linux/net_tstamp.h                    |   8 +
 net/8021q/vlan_dev.c                               |   4 +-
 net/Kconfig                                        |   7 +-
 net/core/dev_ioctl.c                               |   1 +
 net/core/ethtool.c                                 |   4 +-
 net/core/timestamping.c                            |  20 +-
 19 files changed, 1251 insertions(+), 57 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/ptp/ptp-ines.txt
 create mode 100644 drivers/net/phy/mii_timestamper.c
 create mode 100644 drivers/ptp/ptp_ines.c
 create mode 100644 include/linux/mii_timestamper.h

-- 
2.11.0
