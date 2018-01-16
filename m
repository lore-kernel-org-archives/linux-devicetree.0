From: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Subject: [PATCHv4 0/5] GEHC Bx50 Switch Support
Date: Tue, 16 Jan 2018 11:19:53 +0100
Message-ID: <20180116101958.19711-1-sebastian.reichel@collabora.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>, Florian Fainelli <f.fainelli@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>
Cc: Ian Ray <ian.ray@ge.com>, Nandor Han <nandor.han@ge.com>, Rob Herring <robh+dt@kernel.org>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Sebastian Reichel <sebastian.reichel@collabora.co.uk>
List-Id: devicetree@vger.kernel.org

Hi,

This adds support for the internal switch found in GE Healthcare
B450v3, B650v3 and B850v3. All devices use a GPIO bitbanged MDIO
bus to communicate with the switch and a PCIe based network card
for exchanging network data. The cpu network data link requires,
that the switch's internal phy interface is enabled, so support
for that is added by the first patch in this series.

The patch series is based on v4.15-rc8.

Changes since PATCHv3:
 * Enable the phy in dsa_port_setup() instead of abusing the
   fixed link setup function
Changes since PATCHv2:
 * Add phy nodes to switch in bx50.dtsi and reference them
   from switch ports
 * Enable cpu-port's phy based on 'phy-handle' instead of 'phy-mode'
Changes since PATCHv1:
 * Use 'marvell,mv88e6085' instead of introducing compatible
   string for mv88e6240.
 * Fix indention of DT nodes
 * Only enable 'cpu' phy, if explicitly set to "internal".

-- Sebastian

Sebastian Reichel (5):
  net: dsa: Support internal phy on 'cpu' port
  ARM: dts: imx6q-bx50v3: Add internal switch
  ARM: dts: imx6q-b850v3: Add switch port configuration
  ARM: dts: imx6q-b650v3: Add switch port configuration
  ARM: dts: imx6q-b450v3: Add switch port configuration

 arch/arm/boot/dts/imx6q-b450v3.dts  | 52 +++++++++++++++++++++++++
 arch/arm/boot/dts/imx6q-b650v3.dts  | 52 +++++++++++++++++++++++++
 arch/arm/boot/dts/imx6q-b850v3.dts  | 75 +++++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/imx6q-bx50v3.dtsi | 62 ++++++++++++++++++++++++++++++
 net/dsa/dsa2.c                      | 25 ++++++++++---
 net/dsa/dsa_priv.h                  |  1 +
 net/dsa/port.c                      | 49 ++++++++++++++++++++++++
 7 files changed, 310 insertions(+), 6 deletions(-)

-- 
2.15.1
