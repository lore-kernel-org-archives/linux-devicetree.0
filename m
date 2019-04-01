From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 08/15] phy: mvebu-cp110-comphy: Add SATA support
Date: Mon,  1 Apr 2019 18:51:24 +0200
Message-ID: <20190401165131.23370-9-miquel.raynal@bootlin.com>
References: <20190401165131.23370-1-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190401165131.23370-1-miquel.raynal@bootlin.com>
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
Cc: devicetree@vger.kernel.org, Antoine Tenart <antoine.tenart@bootlin.com>, Russell King <linux@armlinux.org.uk>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Rob Herring <robh+dt@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add the corresponding entries in the COMPHY modes table.

SATA support does not need any additional care.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/phy/marvell/phy-mvebu-cp110-comphy.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/phy/marvell/phy-mvebu-cp110-comphy.c b/drivers/phy/marvell/phy-mvebu-cp110-comphy.c
index 3eb92a629dcc..7e25469919eb 100644
--- a/drivers/phy/marvell/phy-mvebu-cp110-comphy.c
+++ b/drivers/phy/marvell/phy-mvebu-cp110-comphy.c
@@ -146,6 +146,7 @@
 #define COMPHY_FW_PARAM(mode, port)					\
 	COMPHY_FW_PARAM_FULL(mode, port, COMPHY_FW_SPEED_MAX, 0)
 
+#define COMPHY_FW_MODE_SATA		0x1
 #define COMPHY_FW_MODE_SGMII		0x2 /* SGMII 1G */
 #define COMPHY_FW_MODE_HS_SGMII		0x3 /* SGMII 2.5G */
 #define COMPHY_FW_MODE_USB3H		0x4
@@ -186,9 +187,11 @@ static const struct mvebu_comphy_conf mvebu_comphy_cp110_modes[] = {
 	/* lane 0 */
 	ETH_CONF(0, 1, PHY_INTERFACE_MODE_SGMII, 0x1, COMPHY_FW_MODE_SGMII),
 	ETH_CONF(0, 1, PHY_INTERFACE_MODE_2500BASEX, 0x1, COMPHY_FW_MODE_HS_SGMII),
+	GEN_CONF(0, 1, PHY_MODE_SATA, COMPHY_FW_MODE_SATA),
 	/* lane 1 */
 	GEN_CONF(1, 0, PHY_MODE_USB_HOST_SS, COMPHY_FW_MODE_USB3H),
 	GEN_CONF(1, 0, PHY_MODE_USB_DEVICE_SS, COMPHY_FW_MODE_USB3D),
+	GEN_CONF(1, 0, PHY_MODE_SATA, COMPHY_FW_MODE_SATA),
 	ETH_CONF(1, 2, PHY_INTERFACE_MODE_SGMII, 0x1, COMPHY_FW_MODE_SGMII),
 	ETH_CONF(1, 2, PHY_INTERFACE_MODE_2500BASEX, 0x1, COMPHY_FW_MODE_HS_SGMII),
 	/* lane 2 */
@@ -197,11 +200,13 @@ static const struct mvebu_comphy_conf mvebu_comphy_cp110_modes[] = {
 	ETH_CONF(2, 0, PHY_INTERFACE_MODE_RXAUI, -1, COMPHY_FW_MODE_RXAUI),
 	ETH_CONF(2, 0, PHY_INTERFACE_MODE_10GKR, 0x1, COMPHY_FW_MODE_SFI),
 	GEN_CONF(2, 0, PHY_MODE_USB_HOST_SS, COMPHY_FW_MODE_USB3H),
+	GEN_CONF(2, 0, PHY_MODE_SATA, COMPHY_FW_MODE_SATA),
 	/* lane 3 */
 	ETH_CONF(3, 1, PHY_INTERFACE_MODE_SGMII, 0x2, COMPHY_FW_MODE_SGMII),
 	ETH_CONF(3, 1, PHY_INTERFACE_MODE_2500BASEX, 0x2, COMPHY_FW_MODE_HS_SGMII),
 	ETH_CONF(3, 1, PHY_INTERFACE_MODE_RXAUI, -1, COMPHY_FW_MODE_RXAUI),
 	GEN_CONF(3, 1, PHY_MODE_USB_HOST_SS, COMPHY_FW_MODE_USB3H),
+	GEN_CONF(3, 1, PHY_MODE_SATA, COMPHY_FW_MODE_SATA),
 	/* lane 4 */
 	ETH_CONF(4, 0, PHY_INTERFACE_MODE_SGMII, 0x2, COMPHY_FW_MODE_SGMII),
 	ETH_CONF(4, 0, PHY_INTERFACE_MODE_2500BASEX, 0x2, COMPHY_FW_MODE_HS_SGMII),
@@ -214,6 +219,7 @@ static const struct mvebu_comphy_conf mvebu_comphy_cp110_modes[] = {
 	ETH_CONF(4, 1, PHY_INTERFACE_MODE_10GKR, -1, COMPHY_FW_MODE_SFI),
 	/* lane 5 */
 	ETH_CONF(5, 1, PHY_INTERFACE_MODE_RXAUI, -1, COMPHY_FW_MODE_RXAUI),
+	GEN_CONF(5, 1, PHY_MODE_SATA, COMPHY_FW_MODE_SATA),
 	ETH_CONF(5, 2, PHY_INTERFACE_MODE_SGMII, 0x1, COMPHY_FW_MODE_SGMII),
 	ETH_CONF(5, 2, PHY_INTERFACE_MODE_2500BASEX, 0x1, COMPHY_FW_MODE_HS_SGMII),
 };
@@ -643,6 +649,11 @@ static int mvebu_comphy_power_on(struct phy *phy)
 		dev_dbg(priv->dev, "set lane %d to USB3 mode\n", lane->id);
 		fw_param = COMPHY_FW_PARAM(fw_mode, lane->port);
 		break;
+	case PHY_MODE_SATA:
+		hide_error = true;
+		dev_dbg(priv->dev, "set lane %d to SATA mode\n", lane->id);
+		fw_param = COMPHY_FW_PARAM(fw_mode, lane->port);
+		break;
 	default:
 		dev_err(priv->dev, "unsupported PHY mode (%d)\n", lane->mode);
 		return -ENOTSUPP;
-- 
2.19.1
