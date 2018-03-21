Return-Path: <SRS0=W1u3=GL=gmail.com=richardcochran@kernel.org>
From: Richard Cochran <richardcochran@gmail.com>
Subject: [PATCH net-next RFC V1 0/5] Peer to Peer One-Step time stamping
Date: Wed, 21 Mar 2018 11:58:13 -0700
Message-Id: <cover.1521656774.git.richardcochran@gmail.com>
To: netdev@vger.kernel.org
Cc: devicetree@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, David Miller <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Miroslav Lichvar <mlichvar@redhat.com>, Rob Herring <robh+dt@kernel.org>, Willem de Bruijn <willemb@google.com>
List-ID: <devicetree@vger.kernel.org>

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

Earlier today I posted user space support as an RFC on the
linuxptp-devel list.  Comments and review are most welcome.

Thanks,
Richard

Richard Cochran (5):
  net: Introduce peer to peer one step PTP time stamping.
  net: phy: Move time stamping interface into the generic mdio layer.
  net: Introduce field for the MII time stamper.
  net: Use the generic MII time stamper when available.
  net: mdio: Add a driver for InES time stamping IP core.

 Documentation/devicetree/bindings/net/ines-ptp.txt |  42 +
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c   |   1 +
 drivers/net/phy/Makefile                           |   1 +
 drivers/net/phy/dp83640.c                          |  29 +-
 drivers/net/phy/ines_ptp.c                         | 857 +++++++++++++++++++++
 drivers/net/phy/mdio_bus.c                         |  51 +-
 drivers/net/phy/phy.c                              |   6 +-
 drivers/ptp/Kconfig                                |  10 +
 include/linux/mdio.h                               |  23 +
 include/linux/netdevice.h                          |   1 +
 include/linux/phy.h                                |  23 -
 include/uapi/linux/net_tstamp.h                    |   8 +
 net/Kconfig                                        |   8 +-
 net/core/dev_ioctl.c                               |   1 +
 net/core/ethtool.c                                 |   5 +-
 net/core/timestamping.c                            |  36 +-
 16 files changed, 1034 insertions(+), 68 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/ines-ptp.txt
 create mode 100644 drivers/net/phy/ines_ptp.c

-- 
2.11.0
