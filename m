From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH net-next 1/8] net: phy: Add initial support for Microsemi Ocelot internal PHYs.
Date: Fri, 23 Mar 2018 21:11:10 +0100
Message-ID: <20180323201117.8416-2-alexandre.belloni@bootlin.com>
References: <20180323201117.8416-1-alexandre.belloni@bootlin.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180323201117.8416-1-alexandre.belloni@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "David S . Miller" <davem@davemloft.net>
Cc: Allan Nielsen <Allan.Nielsen@microsemi.com>, razvan.stefanescu@nxp.com, po.liu@nxp.com, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Raju Lakkaraju <Raju.Lakkaraju@microsemi.com>
List-Id: devicetree@vger.kernel.org

Add Microsemi Ocelot internal PHY ids. For now, simply use the genphy
functions but more features are available.

Cc: Raju Lakkaraju <Raju.Lakkaraju@microsemi.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/net/phy/mscc.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/net/phy/mscc.c b/drivers/net/phy/mscc.c
index 650c2667d523..e1ab3acd1cdb 100644
--- a/drivers/net/phy/mscc.c
+++ b/drivers/net/phy/mscc.c
@@ -91,6 +91,7 @@ enum rgmii_rx_clock_delay {
 #define SECURE_ON_PASSWD_LEN_4		  0x4000
 
 /* Microsemi PHY ID's */
+#define PHY_ID_OCELOT			  0x00070540
 #define PHY_ID_VSC8530			  0x00070560
 #define PHY_ID_VSC8531			  0x00070570
 #define PHY_ID_VSC8540			  0x00070760
@@ -658,6 +659,19 @@ static int vsc85xx_probe(struct phy_device *phydev)
 
 /* Microsemi VSC85xx PHYs */
 static struct phy_driver vsc85xx_driver[] = {
+{
+	.phy_id		= PHY_ID_OCELOT,
+	.name		= "Microsemi OCELOT",
+	.phy_id_mask    = 0xfffffff0,
+	.features	= PHY_GBIT_FEATURES,
+	.soft_reset	= &genphy_soft_reset,
+	.config_init	= &genphy_config_init,
+	.config_aneg	= &genphy_config_aneg,
+	.aneg_done	= &genphy_aneg_done,
+	.read_status	= &genphy_read_status,
+	.suspend	= &genphy_suspend,
+	.resume		= &genphy_resume,
+},
 {
 	.phy_id		= PHY_ID_VSC8530,
 	.name		= "Microsemi FE VSC8530",
@@ -748,6 +762,7 @@ static struct phy_driver vsc85xx_driver[] = {
 module_phy_driver(vsc85xx_driver);
 
 static struct mdio_device_id __maybe_unused vsc85xx_tbl[] = {
+	{ PHY_ID_OCELOT, 0xfffffff0, },
 	{ PHY_ID_VSC8530, 0xfffffff0, },
 	{ PHY_ID_VSC8531, 0xfffffff0, },
 	{ PHY_ID_VSC8540, 0xfffffff0, },
-- 
2.16.2
