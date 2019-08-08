From: Alexandru Ardelean <alexandru.ardelean@analog.com>
Subject: [PATCH v2 08/15] net: phy: adin: make RMII fifo depth configurable
Date: Thu, 8 Aug 2019 15:30:19 +0300
Message-ID: <20190808123026.17382-9-alexandru.ardelean@analog.com>
References: <20190808123026.17382-1-alexandru.ardelean@analog.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190808123026.17382-1-alexandru.ardelean@analog.com>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, f.fainelli@gmail.com, hkallweit1@gmail.com, andrew@lunn.ch, Alexandru Ardelean <alexandru.ardelean@analog.com>
List-Id: devicetree@vger.kernel.org

The FIFO depth can be configured for the RMII mode. This change adds
support for doing this via device-tree (or ACPI).

Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
---
 drivers/net/phy/adin.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/net/phy/adin.c b/drivers/net/phy/adin.c
index 62c1268e55f7..26b2f2b21596 100644
--- a/drivers/net/phy/adin.c
+++ b/drivers/net/phy/adin.c
@@ -54,8 +54,19 @@
 #define	ADIN1300_RGMII_2_40_NS			0x0007
 
 #define ADIN1300_GE_RMII_CFG_REG		0xff24
+#define   ADIN1300_GE_RMII_FIFO_DEPTH_MSK	GENMASK(6, 4)
+#define   ADIN1300_GE_RMII_FIFO_DEPTH_SEL(x)	\
+		FIELD_PREP(ADIN1300_GE_RMII_FIFO_DEPTH_MSK, x)
 #define   ADIN1300_GE_RMII_EN			BIT(0)
 
+/* RMII fifo depth values */
+#define ADIN1300_RMII_4_BITS			0x0000
+#define ADIN1300_RMII_8_BITS			0x0001
+#define ADIN1300_RMII_12_BITS			0x0002
+#define ADIN1300_RMII_16_BITS			0x0003
+#define ADIN1300_RMII_20_BITS			0x0004
+#define ADIN1300_RMII_24_BITS			0x0005
+
 /**
  * struct adin_cfg_reg_map - map a config value to aregister value
  * @cfg		value in device configuration
@@ -75,6 +86,16 @@ static const struct adin_cfg_reg_map adin_rgmii_delays[] = {
 	{ },
 };
 
+static const struct adin_cfg_reg_map adin_rmii_fifo_depths[] = {
+	{ 4,  ADIN1300_RMII_4_BITS },
+	{ 8,  ADIN1300_RMII_8_BITS },
+	{ 12, ADIN1300_RMII_12_BITS },
+	{ 16, ADIN1300_RMII_16_BITS },
+	{ 20, ADIN1300_RMII_20_BITS },
+	{ 24, ADIN1300_RMII_24_BITS },
+	{ },
+};
+
 static int adin_lookup_reg_value(const struct adin_cfg_reg_map *tbl, int cfg)
 {
 	size_t i;
@@ -158,6 +179,7 @@ static int adin_config_rgmii_mode(struct phy_device *phydev)
 
 static int adin_config_rmii_mode(struct phy_device *phydev)
 {
+	u32 val;
 	int reg;
 
 	if (phydev->interface != PHY_INTERFACE_MODE_RMII)
@@ -171,6 +193,13 @@ static int adin_config_rmii_mode(struct phy_device *phydev)
 
 	reg |= ADIN1300_GE_RMII_EN;
 
+	val = adin_get_reg_value(phydev, "adi,fifo-depth-bits",
+				 adin_rmii_fifo_depths,
+				 ADIN1300_RMII_8_BITS);
+
+	reg &= ~ADIN1300_GE_RMII_FIFO_DEPTH_MSK;
+	reg |= ADIN1300_GE_RMII_FIFO_DEPTH_SEL(val);
+
 	return phy_write_mmd(phydev, MDIO_MMD_VEND1,
 			     ADIN1300_GE_RMII_CFG_REG, reg);
 }
-- 
2.20.1
