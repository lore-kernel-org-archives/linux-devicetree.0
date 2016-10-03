From: Mike Looijmans <mike.looijmans@topic.nl>
Subject: [PATCH] phy: micrel.c: Support ksz9031 energy-detect power-down mode
Date: Mon,  3 Oct 2016 15:04:30 +0200
Message-ID: <1475499870-11465-1-git-send-email-mike.looijmans@topic.nl>
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, f.fainelli@gmail.com, Mike Looijmans <mike.looijmans@topic.nl>
List-Id: devicetree@vger.kernel.org

Set bit 0 in register 1C.23 to enable the EDPD feature of the
KSZ9031 PHY. This reduces power consumption when the link is
down. To use this, set "enable-edpd" in the devicetree.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
 .../devicetree/bindings/net/micrel-ksz90x1.txt        |  6 ++++++
 drivers/net/phy/micrel.c                              | 19 +++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/micrel-ksz90x1.txt b/Documentation/devicetree/bindings/net/micrel-ksz90x1.txt
index f9c32ad..fbec6f8 100644
--- a/Documentation/devicetree/bindings/net/micrel-ksz90x1.txt
+++ b/Documentation/devicetree/bindings/net/micrel-ksz90x1.txt
@@ -56,6 +56,11 @@ KSZ9031:
       - txd2-skew-ps : Skew control of TX data 2 pad
       - txd3-skew-ps : Skew control of TX data 3 pad
 
+    Boolean:
+
+      - enable-edpd : Not related to timing. Specify this property to enable
+                      energy-detect power-down mode in the PHY.
+
 Examples:
 
 	mdio {
@@ -64,6 +69,7 @@ Examples:
 			rxdv-skew-ps = <0>;
 			txc-skew-ps = <3000>;
 			txen-skew-ps = <0>;
+			enable-edpd;
 			reg = <0>;
 		};
 	};
diff --git a/drivers/net/phy/micrel.c b/drivers/net/phy/micrel.c
index 4516c8a..0a365b4 100644
--- a/drivers/net/phy/micrel.c
+++ b/drivers/net/phy/micrel.c
@@ -409,6 +409,10 @@ static int ksz9021_config_init(struct phy_device *phydev)
 #define MII_KSZ9031RN_TX_DATA_PAD_SKEW	6
 #define MII_KSZ9031RN_CLK_PAD_SKEW	8
 
+/* MMD Address 0x1C */
+#define MII_KSZ9031RN_EDPD		0x23
+#define MII_KSZ9031RN_EDPD_ENABLE	BIT(0)
+
 static int ksz9031_extended_write(struct phy_device *phydev,
 				  u8 mode, u32 dev_addr, u32 regnum, u16 val)
 {
@@ -480,6 +484,18 @@ static int ksz9031_center_flp_timing(struct phy_device *phydev)
 	return genphy_restart_aneg(phydev);
 }
 
+/* Enable energy-detect power-down mode */
+static int ksz9031_enable_edpd(struct phy_device *phydev)
+{
+	int reg;
+
+	reg = ksz9031_extended_read(phydev, OP_DATA, 0x1C, MII_KSZ9031RN_EDPD);
+	if (reg < 0)
+		return reg;
+	return ksz9031_extended_write(phydev, OP_DATA, 0x1C, MII_KSZ9031RN_EDPD,
+				      reg | MII_KSZ9031RN_EDPD_ENABLE);
+}
+
 static int ksz9031_config_init(struct phy_device *phydev)
 {
 	const struct device *dev = &phydev->mdio.dev;
@@ -522,6 +538,9 @@ static int ksz9031_config_init(struct phy_device *phydev)
 		ksz9031_of_load_skew_values(phydev, of_node,
 				MII_KSZ9031RN_TX_DATA_PAD_SKEW, 4,
 				tx_data_skews, 4);
+
+		if (of_property_read_bool(of_node, "enable-edpd"))
+			ksz9031_enable_edpd(phydev);
 	}
 
 	return ksz9031_center_flp_timing(phydev);
-- 
1.9.1
