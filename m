From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH] net: phy: micrel: workaround for errata #2 for KSZ9031
Date: Mon, 14 May 2018 10:22:18 +0200
Message-ID: <20180514082218.29158-1-m.felsch@pengutronix.de>
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, andrew@lunn.ch, f.fainelli@gmail.com
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, Markus Niebel <Markus.Niebel@tqs.de>
List-Id: devicetree@vger.kernel.org

From: Markus Niebel <Markus.Niebel@tqs.de>

handle errata #2 for KSZ9031: force 1000Base-T master

Attention: enabling the workaround will cause no link to
other GIGE master.

Signed-off-by: Markus Niebel <Markus.Niebel@tqs.de>
[m.felsch@pengutronix.de: move dt binding to the KSZ9031 entry]
Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 .../devicetree/bindings/net/micrel-ksz90x1.txt |  3 +++
 drivers/net/phy/micrel.c                       | 18 ++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/micrel-ksz90x1.txt b/Documentation/devicetree/bindings/net/micrel-ksz90x1.txt
index 42a248301615..e2465fbbbcef 100644
--- a/Documentation/devicetree/bindings/net/micrel-ksz90x1.txt
+++ b/Documentation/devicetree/bindings/net/micrel-ksz90x1.txt
@@ -57,6 +57,9 @@ KSZ9031:
       - txd2-skew-ps : Skew control of TX data 2 pad
       - txd3-skew-ps : Skew control of TX data 3 pad
 
+    - force-master: Boolean, force phy to master mode. This is a
+                    workaround at least for KSZ9031 errata #2.
+
 Examples:
 
 	mdio {
diff --git a/drivers/net/phy/micrel.c b/drivers/net/phy/micrel.c
index f41b224a9cdb..3e4243e4f7a7 100644
--- a/drivers/net/phy/micrel.c
+++ b/drivers/net/phy/micrel.c
@@ -528,6 +528,8 @@ static int ksz9031_enable_edpd(struct phy_device *phydev)
 
 static int ksz9031_config_init(struct phy_device *phydev)
 {
+	int rc;
+	u16 val;
 	const struct device *dev = &phydev->mdio.dev;
 	const struct device_node *of_node = dev->of_node;
 	static const char *clk_skews[2] = {"rxc-skew-ps", "txc-skew-ps"};
@@ -573,6 +575,22 @@ static int ksz9031_config_init(struct phy_device *phydev)
 		ksz9031_of_load_skew_values(phydev, of_node,
 				MII_KSZ9031RN_TX_DATA_PAD_SKEW, 4,
 				tx_data_skews, 4);
+
+		/* force master mode -> errata #2
+		 * attention: Master <-> Master will not work
+		 */
+		if (of_property_read_bool(of_node, "force-master")) {
+			rc = phy_read(phydev, MII_CTRL1000);
+			if (rc >= 0) {
+				val = (u16)rc;
+				/* enable master mode, config &
+				 * prefer master
+				 */
+				val |= (CTL1000_ENABLE_MASTER |
+					CTL1000_AS_MASTER);
+				phy_write(phydev, MII_CTRL1000, val);
+			}
+		}
 	}
 
 	return ksz9031_center_flp_timing(phydev);
-- 
2.17.0
