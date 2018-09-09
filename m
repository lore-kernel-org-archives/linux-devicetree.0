From: Hauke Mehrtens <hauke@hauke-m.de>
Subject: [PATCH v3 net-next 0/6] Add support for Lantiq / Intel vrx200 network
Date: Sun,  9 Sep 2018 22:16:41 +0200
Message-ID: <20180909201647.32727-1-hauke@hauke-m.de>
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: davem@davemloft.net
Cc: netdev@vger.kernel.org, andrew@lunn.ch, vivien.didelot@savoirfairelinux.com, f.fainelli@gmail.com, john@phrozen.org, linux-mips@linux-mips.org, dev@kresin.me, hauke.mehrtens@intel.com, devicetree@vger.kernel.org, Hauke Mehrtens <hauke@hauke-m.de>
List-Id: devicetree@vger.kernel.org

This adds basic support for the GSWIP (Gigabit Switch) found in the
VRX200 SoC.
There are different versions of this IP core used in different SoCs, but
this driver was currently only tested on the VRX200 SoC line, for other
SoCs this driver probably need some adoptions to work.

I also plan to add Layer 2 offloading to the DSA driver and later also
layer 3 offloading which is supported by the PPE HW block.

All these patches should go through the net-next tree.

This depends on the patch "MIPS: lantiq: dma: add dev pointer" which 
should go into 4.19.

Changes since:
v2:
 * Send patch "MIPS: lantiq: dma: add dev pointer" separately
 * all: removed return in register write functions
 * switch: uses phylink
 * switch: uses hardware MDIO auto polling
 * switch: use usleep_range() in MDIO busy check
 * switch: configure MDIO bus to 2.5 MHz
 * switch: disable xMII link when it is not used
 * Ethernet: use NAPI for TX cleanups
 * Ethernet: enable clock in open callback
 * Ethernet: improve skb allocation
 * Ethernet: use net_dev->stats

v1:
 * Add "MIPS: lantiq: dma: add dev pointer"
 * checkpatch fixes a all patches
 * Added binding documentation
 * use readx_poll_timeout function and ETIMEOUT error code
 * integrate GPHY firmware loading into DSA driver
 * renamed to NET_DSA_LANTIQ_GSWIP
 * removed some needed casts
 * added of_device_id.data information about the detected switch
 * fixed John's email address

Hauke Mehrtens (6):
  MIPS: lantiq: Do not enable IRQs in dma open
  net: dsa: Add Lantiq / Intel GSWIP tag support
  dt-bindings: net: Add lantiq,xrx200-net DT bindings
  net: lantiq: Add Lantiq / Intel VRX200 Ethernet driver
  dt-bindings: net: dsa: Add lantiq,xrx200-gswip DT bindings
  net: dsa: Add Lantiq / Intel DSA driver for vrx200

 .../devicetree/bindings/net/dsa/lantiq-gswip.txt   |  141 +++
 .../devicetree/bindings/net/lantiq,xrx200-net.txt  |   21 +
 MAINTAINERS                                        |    9 +
 arch/mips/lantiq/xway/dma.c                        |    1 -
 arch/mips/lantiq/xway/sysctrl.c                    |   14 +-
 drivers/net/dsa/Kconfig                            |    8 +
 drivers/net/dsa/Makefile                           |    1 +
 drivers/net/dsa/lantiq_gswip.c                     | 1169 ++++++++++++++++++++
 drivers/net/dsa/lantiq_pce.h                       |  153 +++
 drivers/net/ethernet/Kconfig                       |    7 +
 drivers/net/ethernet/Makefile                      |    1 +
 drivers/net/ethernet/lantiq_etop.c                 |    1 +
 drivers/net/ethernet/lantiq_xrx200.c               |  564 ++++++++++
 include/net/dsa.h                                  |    1 +
 net/dsa/Kconfig                                    |    3 +
 net/dsa/Makefile                                   |    1 +
 net/dsa/dsa.c                                      |    3 +
 net/dsa/dsa_priv.h                                 |    3 +
 net/dsa/tag_gswip.c                                |  109 ++
 19 files changed, 2202 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/dsa/lantiq-gswip.txt
 create mode 100644 Documentation/devicetree/bindings/net/lantiq,xrx200-net.txt
 create mode 100644 drivers/net/dsa/lantiq_gswip.c
 create mode 100644 drivers/net/dsa/lantiq_pce.h
 create mode 100644 drivers/net/ethernet/lantiq_xrx200.c
 create mode 100644 net/dsa/tag_gswip.c

-- 
2.11.0
