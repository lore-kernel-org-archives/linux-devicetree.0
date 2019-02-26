From: Claudiu Manoil <claudiu.manoil@nxp.com>
Subject: [PATCH net-next v4 0/4] enetc: Add mdio support and device tree nodes
Date: Tue, 26 Feb 2019 15:42:19 +0200
Message-ID: <1551188543-28867-1-git-send-email-claudiu.manoil@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, "David S . Miller" <davem@davemloft.net>
Cc: alexandru.marginean@nxp.com, Andrew Lunn <andrew@lunn.ch>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This is the missing part to enable PCI probing of the ENETC ethernet
ports on the LS1028A SoC and external traffic on the LS1028A RDB board.
It's one of the first items on the TODO list for the recently merged
ENETC ethernet driver.

v3: Add DT bindings doc for ENETC connections
v4: none

Claudiu Manoil (4):
  arm64: dts: fsl: ls1028a: Add PCI IERC node and ENETC endpoints
  arm64: dts: fsl: ls1028a-rdb: Add ENETC external eth ports for the
    LS1028A RDB board
  enetc: Add ENETC PF level external MDIO support
  dt-bindings: net: freescale: enetc: Add connection bindings for ENETC
    ethernet nodes

 .../devicetree/bindings/net/fsl-enetc.txt          |  69 +++++++
 arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts  |  17 ++
 arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi     |  35 ++++
 drivers/net/ethernet/freescale/enetc/Makefile      |   3 +-
 drivers/net/ethernet/freescale/enetc/enetc_mdio.c  | 199 +++++++++++++++++++++
 drivers/net/ethernet/freescale/enetc/enetc_pf.c    |  12 ++
 drivers/net/ethernet/freescale/enetc/enetc_pf.h    |   6 +
 7 files changed, 340 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/net/fsl-enetc.txt
 create mode 100644 drivers/net/ethernet/freescale/enetc/enetc_mdio.c

-- 
2.7.4
