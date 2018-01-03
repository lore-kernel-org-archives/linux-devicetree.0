From: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Subject: [PATCHv1 0/6] GEHC Bx50 Switch Support
Date: Wed,  3 Jan 2018 13:26:03 +0100
Message-ID: <20180103122609.5482-1-sebastian.reichel@collabora.co.uk>
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

The patch series is based on v4.15-rc6.

-- Sebastian

Sebastian Reichel (6):
  net: dsa: Support internal phy on 'cpu' port
  net: dsa: mv88e6xxx: add 88E6240 DT compatible
  ARM: dts: imx6q-bx50v3: Add internal switch
  ARM: dts: imx6q-b850v3: Add switch port configuration
  ARM: dts: imx6q-b650v3: Add switch port configuration
  ARM: dts: imx6q-b450v3: Add switch port configuration

 .../devicetree/bindings/net/dsa/marvell.txt        |  6 +-
 arch/arm/boot/dts/imx6q-b450v3.dts                 | 47 +++++++++++++++
 arch/arm/boot/dts/imx6q-b650v3.dts                 | 47 +++++++++++++++
 arch/arm/boot/dts/imx6q-b850v3.dts                 | 70 ++++++++++++++++++++++
 arch/arm/boot/dts/imx6q-bx50v3.dtsi                | 37 ++++++++++++
 drivers/net/dsa/mv88e6xxx/chip.c                   |  4 ++
 net/dsa/port.c                                     | 26 ++++++--
 7 files changed, 231 insertions(+), 6 deletions(-)

-- 
2.15.1
