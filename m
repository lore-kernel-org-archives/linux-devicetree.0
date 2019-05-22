From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH net-next 2/2] net: phy: aquantia: add USXGMII support
Date: Wed, 22 May 2019 21:58:32 +0200
Message-ID: <2c68bdb1-9b53-ce0b-74d3-c7ea2d9e7ac0@gmail.com>
References: <110a1e45-56a7-a646-7b63-f39fe3083c28@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <110a1e45-56a7-a646-7b63-f39fe3083c28@gmail.com>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Madalin-cristian Bucur <madalin.bucur@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, David Miller <davem@davemloft.net>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

So far we didn't support mode USXGMII, and in order to not break the
two Freescale boards mode XGMII was accepted for the AQR107 family
even though it doesn't support XGMII. Add USXGMII support to the
Aquantia PHY driver and change the phy connection type for the two
boards.

As an additional note: Even though the handle is named aqr106
there seem to be LS1046A boards with an AQR107.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts | 2 +-
 arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts | 2 +-
 drivers/net/phy/aquantia_main.c                   | 6 +++++-
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts
index 4223a2352..c2ce1a611 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts
@@ -139,7 +139,7 @@
 
 	ethernet@f0000 { /* 10GEC1 */
 		phy-handle = <&aqr105_phy>;
-		phy-connection-type = "xgmii";
+		phy-connection-type = "usxgmii";
 	};
 
 	mdio@fc000 {
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts
index 6a6514d0e..f927a8a25 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts
@@ -147,7 +147,7 @@
 
 	ethernet@f0000 { /* 10GEC1 */
 		phy-handle = <&aqr106_phy>;
-		phy-connection-type = "xgmii";
+		phy-connection-type = "usxgmii";
 	};
 
 	ethernet@f2000 { /* 10GEC2 */
diff --git a/drivers/net/phy/aquantia_main.c b/drivers/net/phy/aquantia_main.c
index 0fedd28fd..3f24c42a8 100644
--- a/drivers/net/phy/aquantia_main.c
+++ b/drivers/net/phy/aquantia_main.c
@@ -27,6 +27,7 @@
 #define MDIO_PHYXS_VEND_IF_STATUS_TYPE_MASK	GENMASK(7, 3)
 #define MDIO_PHYXS_VEND_IF_STATUS_TYPE_KR	0
 #define MDIO_PHYXS_VEND_IF_STATUS_TYPE_XFI	2
+#define MDIO_PHYXS_VEND_IF_STATUS_TYPE_USXGMII	3
 #define MDIO_PHYXS_VEND_IF_STATUS_TYPE_SGMII	6
 #define MDIO_PHYXS_VEND_IF_STATUS_TYPE_OCSGMII	10
 
@@ -360,6 +361,9 @@ static int aqr107_read_status(struct phy_device *phydev)
 	case MDIO_PHYXS_VEND_IF_STATUS_TYPE_XFI:
 		phydev->interface = PHY_INTERFACE_MODE_10GKR;
 		break;
+	case MDIO_PHYXS_VEND_IF_STATUS_TYPE_USXGMII:
+		phydev->interface = PHY_INTERFACE_MODE_USXGMII;
+		break;
 	case MDIO_PHYXS_VEND_IF_STATUS_TYPE_SGMII:
 		phydev->interface = PHY_INTERFACE_MODE_SGMII;
 		break;
@@ -487,7 +491,7 @@ static int aqr107_config_init(struct phy_device *phydev)
 	/* Check that the PHY interface type is compatible */
 	if (phydev->interface != PHY_INTERFACE_MODE_SGMII &&
 	    phydev->interface != PHY_INTERFACE_MODE_2500BASEX &&
-	    phydev->interface != PHY_INTERFACE_MODE_XGMII &&
+	    phydev->interface != PHY_INTERFACE_MODE_USXGMII &&
 	    phydev->interface != PHY_INTERFACE_MODE_10GKR)
 		return -ENODEV;
 
-- 
2.21.0
