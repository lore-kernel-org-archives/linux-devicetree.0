From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Subject: [PATCH net-next v2 0/6] Add comphy support for Armada 38x
Date: Thu, 7 Feb 2019 16:18:25 +0000
Message-ID: <20190207161825.ueinmyf6ygjiqzzy@shell.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, Jason Cooper <jason@lakedaemon.net>, Kishon Vijay Abraham I <kishon@ti.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: "David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, netdev@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

This series adds support for the comphy for Armada 38x, which allows
these SoCs to use 2500BASE-X mode with appropriate SFP modules.

Tested on SolidRun Clearfog after updating for the 5.0 merge window
changes.

 .../bindings/net/marvell-armada-370-neta.txt       |   2 +-
 .../bindings/phy/phy-armada38x-comphy.txt          |  40 ++++
 arch/arm/boot/dts/armada-388-clearfog.dtsi         |   2 +
 arch/arm/boot/dts/armada-38x.dtsi                  |  37 ++++
 drivers/net/ethernet/marvell/mvneta.c              |  45 +++-
 drivers/phy/marvell/Kconfig                        |  10 +
 drivers/phy/marvell/Makefile                       |   1 +
 drivers/phy/marvell/phy-armada38x-comphy.c         | 237 +++++++++++++++++++++
 8 files changed, 369 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/phy-armada38x-comphy.txt
 create mode 100644 drivers/phy/marvell/phy-armada38x-comphy.c

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
