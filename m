From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v3 08/19] phy: mvebu-cp110-comphy: Add USB3 host/device support
Date: Wed, 31 Jul 2019 14:21:15 +0200
Message-ID: <20190731122126.3049-9-miquel.raynal@bootlin.com>
References: <20190731122126.3049-1-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190731122126.3049-1-miquel.raynal@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Gregory Clement <gregory.clement@bootlin.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: devicetree@vger.kernel.org, Antoine Tenart <antoine.tenart@bootlin.com>, Grzegorz Jaszczyk <jaz@semihalf.com>, Russell King <linux@armlinux.org.uk>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Rob Herring <robh+dt@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Grzegorz Jaszczyk <jaz@semihalf.com>

Add USB3 host/device support by adding the right entries in the COMPHY
modes table. A new macro is created to instantiate a "generic" mode
ie. not an Ethernet one. This macro will be re-used when adding SATA
support.

Signed-off-by: Grzegorz Jaszczyk <jaz@semihalf.com>
[miquel.raynal@bootlin.com: adapt the content to the mainline driver]
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/phy/marvell/phy-mvebu-cp110-comphy.c | 23 ++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/phy/marvell/phy-mvebu-cp110-comphy.c b/drivers/phy/marvell/phy-mvebu-cp110-comphy.c
index fb14406fc406..1420a8e6d856 100644
--- a/drivers/phy/marvell/phy-mvebu-cp110-comphy.c
+++ b/drivers/phy/marvell/phy-mvebu-cp110-comphy.c
@@ -157,6 +157,8 @@
 
 #define COMPHY_FW_MODE_SGMII		0x2 /* SGMII 1G */
 #define COMPHY_FW_MODE_HS_SGMII		0x3 /* SGMII 2.5G */
+#define COMPHY_FW_MODE_USB3H		0x4
+#define COMPHY_FW_MODE_USB3D		0x5
 #define COMPHY_FW_MODE_RXAUI		0x7
 #define COMPHY_FW_MODE_XFI		0x8 /* SFI: 0x9 (is treated like XFI) */
 
@@ -179,11 +181,23 @@ struct mvebu_comphy_conf {
 		.fw_mode = _fw,				\
 	}
 
+#define GEN_CONF(_lane, _port, _mode, _fw)		\
+	{						\
+		.lane = _lane,				\
+		.port = _port,				\
+		.mode = _mode,				\
+		.submode = PHY_INTERFACE_MODE_NA,	\
+		.mux = -1,				\
+		.fw_mode = _fw,				\
+	}
+
 static const struct mvebu_comphy_conf mvebu_comphy_cp110_modes[] = {
 	/* lane 0 */
 	ETH_CONF(0, 1, PHY_INTERFACE_MODE_SGMII, 0x1, COMPHY_FW_MODE_SGMII),
 	ETH_CONF(0, 1, PHY_INTERFACE_MODE_2500BASEX, 0x1, COMPHY_FW_MODE_HS_SGMII),
 	/* lane 1 */
+	GEN_CONF(1, 0, PHY_MODE_USB_HOST_SS, COMPHY_FW_MODE_USB3H),
+	GEN_CONF(1, 0, PHY_MODE_USB_DEVICE_SS, COMPHY_FW_MODE_USB3D),
 	ETH_CONF(1, 2, PHY_INTERFACE_MODE_SGMII, 0x1, COMPHY_FW_MODE_SGMII),
 	ETH_CONF(1, 2, PHY_INTERFACE_MODE_2500BASEX, 0x1, COMPHY_FW_MODE_HS_SGMII),
 	/* lane 2 */
@@ -191,15 +205,19 @@ static const struct mvebu_comphy_conf mvebu_comphy_cp110_modes[] = {
 	ETH_CONF(2, 0, PHY_INTERFACE_MODE_2500BASEX, 0x1, COMPHY_FW_MODE_HS_SGMII),
 	ETH_CONF(2, 0, PHY_INTERFACE_MODE_RXAUI, -1, COMPHY_FW_MODE_RXAUI),
 	ETH_CONF(2, 0, PHY_INTERFACE_MODE_10GKR, 0x1, COMPHY_FW_MODE_XFI),
+	GEN_CONF(2, 0, PHY_MODE_USB_HOST_SS, COMPHY_FW_MODE_USB3H),
 	/* lane 3 */
 	ETH_CONF(3, 1, PHY_INTERFACE_MODE_SGMII, 0x2, COMPHY_FW_MODE_SGMII),
 	ETH_CONF(3, 1, PHY_INTERFACE_MODE_2500BASEX, 0x2, COMPHY_FW_MODE_HS_SGMII),
 	ETH_CONF(3, 1, PHY_INTERFACE_MODE_RXAUI, -1, COMPHY_FW_MODE_RXAUI),
+	GEN_CONF(3, 1, PHY_MODE_USB_HOST_SS, COMPHY_FW_MODE_USB3H),
 	/* lane 4 */
 	ETH_CONF(4, 0, PHY_INTERFACE_MODE_SGMII, 0x2, COMPHY_FW_MODE_SGMII),
 	ETH_CONF(4, 0, PHY_INTERFACE_MODE_2500BASEX, 0x2, COMPHY_FW_MODE_HS_SGMII),
 	ETH_CONF(4, 0, PHY_INTERFACE_MODE_10GKR, 0x2, COMPHY_FW_MODE_XFI),
 	ETH_CONF(4, 0, PHY_INTERFACE_MODE_RXAUI, -1, COMPHY_FW_MODE_RXAUI),
+	GEN_CONF(4, 0, PHY_MODE_USB_DEVICE_SS, COMPHY_FW_MODE_USB3D),
+	GEN_CONF(4, 1, PHY_MODE_USB_HOST_SS, COMPHY_FW_MODE_USB3H),
 	ETH_CONF(4, 1, PHY_INTERFACE_MODE_SGMII, 0x1, COMPHY_FW_MODE_SGMII),
 	ETH_CONF(4, 1, PHY_INTERFACE_MODE_2500BASEX, -1, COMPHY_FW_MODE_HS_SGMII),
 	ETH_CONF(4, 1, PHY_INTERFACE_MODE_10GKR, -1, COMPHY_FW_MODE_XFI),
@@ -643,6 +661,11 @@ static int mvebu_comphy_power_on(struct phy *phy)
 		}
 		fw_param = COMPHY_FW_PARAM_ETH(fw_mode, lane->port, fw_speed);
 		break;
+	case PHY_MODE_USB_HOST_SS:
+	case PHY_MODE_USB_DEVICE_SS:
+		dev_dbg(priv->dev, "set lane %d to USB3 mode\n", lane->id);
+		fw_param = COMPHY_FW_PARAM(fw_mode, lane->port);
+		break;
 	default:
 		dev_err(priv->dev, "unsupported PHY mode (%d)\n", lane->mode);
 		return -ENOTSUPP;
-- 
2.20.1
