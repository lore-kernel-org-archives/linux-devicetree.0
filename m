From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH net-next v2 3/3] net: phy: aquantia: add USXGMII support and
 warn if XGMII mode is set
Date: Thu, 23 May 2019 20:09:08 +0200
Message-ID: <96437cfa-b1f9-eeae-f9ca-c658c81f61c0@gmail.com>
References: <9d284f4d-93ee-fb27-e386-80825f92adc8@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <9d284f4d-93ee-fb27-e386-80825f92adc8@gmail.com>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Madalin-cristian Bucur <madalin.bucur@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, David Miller <davem@davemloft.net>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

So far we didn't support mode USXGMII, and in order to not break few
boards mode XGMII was accepted for the AQR107 family even though it
doesn't support XGMII. Add USXGMII support to the Aquantia PHY driver
and warn if XGMII mode is set.

v2:
- add warning if XGMII mode is set

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/net/phy/aquantia_main.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/phy/aquantia_main.c b/drivers/net/phy/aquantia_main.c
index 0fedd28fd..3b29d3811 100644
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
@@ -488,9 +492,13 @@ static int aqr107_config_init(struct phy_device *phydev)
 	if (phydev->interface != PHY_INTERFACE_MODE_SGMII &&
 	    phydev->interface != PHY_INTERFACE_MODE_2500BASEX &&
 	    phydev->interface != PHY_INTERFACE_MODE_XGMII &&
+	    phydev->interface != PHY_INTERFACE_MODE_USXGMII &&
 	    phydev->interface != PHY_INTERFACE_MODE_10GKR)
 		return -ENODEV;
 
+	WARN(phydev->interface == PHY_INTERFACE_MODE_XGMII,
+	     "Your devicetree is out of date, please update it. The AQR107 family doesn't support XGMII, maybe you mean USXGMII.\n");
+
 	ret = aqr107_wait_reset_complete(phydev);
 	if (!ret)
 		aqr107_chip_info(phydev);
-- 
2.21.0
