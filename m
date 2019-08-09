From: Alexandru Ardelean <alexandru.ardelean@analog.com>
Subject: [PATCH v3 06/14] net: phy: adin: make RGMII internal delays configurable
Date: Fri, 9 Aug 2019 16:35:44 +0300
Message-ID: <20190809133552.21597-7-alexandru.ardelean@analog.com>
References: <20190809133552.21597-1-alexandru.ardelean@analog.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190809133552.21597-1-alexandru.ardelean@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
To: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, f.fainelli@gmail.com, hkallweit1@gmail.com, andrew@lunn.ch, Alexandru Ardelean <alexandru.ardelean@analog.com>
List-Id: devicetree@vger.kernel.org

The internal delays for the RGMII are configurable for both RX & TX. This
change adds support for configuring them via device-tree (or ACPI).

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
---
 drivers/net/phy/adin.c | 82 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/drivers/net/phy/adin.c b/drivers/net/phy/adin.c
index 6ea0d7bd76c5..06d3db75c3db 100644
--- a/drivers/net/phy/adin.c
+++ b/drivers/net/phy/adin.c
@@ -5,11 +5,13 @@
  * Copyright 2019 Analog Devices Inc.
  */
 #include <linux/kernel.h>
+#include <linux/bitfield.h>
 #include <linux/errno.h>
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/mii.h>
 #include <linux/phy.h>
+#include <linux/property.h>
 
 #define PHY_ID_ADIN1200				0x0283bc20
 #define PHY_ID_ADIN1300				0x0283bc30
@@ -34,15 +36,83 @@
 #define ADIN1300_INT_STATUS_REG			0x0019
 
 #define ADIN1300_GE_RGMII_CFG_REG		0xff23
+#define   ADIN1300_GE_RGMII_RX_MSK		GENMASK(8, 6)
+#define   ADIN1300_GE_RGMII_RX_SEL(x)		\
+		FIELD_PREP(ADIN1300_GE_RGMII_RX_MSK, x)
+#define   ADIN1300_GE_RGMII_GTX_MSK		GENMASK(5, 3)
+#define   ADIN1300_GE_RGMII_GTX_SEL(x)		\
+		FIELD_PREP(ADIN1300_GE_RGMII_GTX_MSK, x)
 #define   ADIN1300_GE_RGMII_RXID_EN		BIT(2)
 #define   ADIN1300_GE_RGMII_TXID_EN		BIT(1)
 #define   ADIN1300_GE_RGMII_EN			BIT(0)
 
+/* RGMII internal delay settings for rx and tx for ADIN1300 */
+#define ADIN1300_RGMII_1_60_NS			0x0001
+#define ADIN1300_RGMII_1_80_NS			0x0002
+#define	ADIN1300_RGMII_2_00_NS			0x0000
+#define	ADIN1300_RGMII_2_20_NS			0x0006
+#define	ADIN1300_RGMII_2_40_NS			0x0007
+
 #define ADIN1300_GE_RMII_CFG_REG		0xff24
 #define   ADIN1300_GE_RMII_EN			BIT(0)
 
+/**
+ * struct adin_cfg_reg_map - map a config value to aregister value
+ * @cfg		value in device configuration
+ * @reg		value in the register
+ */
+struct adin_cfg_reg_map {
+	int cfg;
+	int reg;
+};
+
+static const struct adin_cfg_reg_map adin_rgmii_delays[] = {
+	{ 1600, ADIN1300_RGMII_1_60_NS },
+	{ 1800, ADIN1300_RGMII_1_80_NS },
+	{ 2000, ADIN1300_RGMII_2_00_NS },
+	{ 2200, ADIN1300_RGMII_2_20_NS },
+	{ 2400, ADIN1300_RGMII_2_40_NS },
+	{ },
+};
+
+static int adin_lookup_reg_value(const struct adin_cfg_reg_map *tbl, int cfg)
+{
+	size_t i;
+
+	for (i = 0; tbl[i].cfg; i++) {
+		if (tbl[i].cfg == cfg)
+			return tbl[i].reg;
+	}
+
+	return -EINVAL;
+}
+
+static u32 adin_get_reg_value(struct phy_device *phydev,
+			      const char *prop_name,
+			      const struct adin_cfg_reg_map *tbl,
+			      u32 dflt)
+{
+	struct device *dev = &phydev->mdio.dev;
+	u32 val;
+	int rc;
+
+	if (device_property_read_u32(dev, prop_name, &val))
+		return dflt;
+
+	rc = adin_lookup_reg_value(tbl, val);
+	if (rc < 0) {
+		phydev_warn(phydev,
+			    "Unsupported value %u for %s using default (%u)\n",
+			    val, prop_name, dflt);
+		return dflt;
+	}
+
+	return rc;
+}
+
 static int adin_config_rgmii_mode(struct phy_device *phydev)
 {
+	u32 val;
 	int reg;
 
 	if (!phy_interface_is_rgmii(phydev))
@@ -59,6 +129,12 @@ static int adin_config_rgmii_mode(struct phy_device *phydev)
 	if (phydev->interface == PHY_INTERFACE_MODE_RGMII_ID ||
 	    phydev->interface == PHY_INTERFACE_MODE_RGMII_RXID) {
 		reg |= ADIN1300_GE_RGMII_RXID_EN;
+
+		val = adin_get_reg_value(phydev, "adi,rx-internal-delay-ps",
+					 adin_rgmii_delays,
+					 ADIN1300_RGMII_2_00_NS);
+		reg &= ~ADIN1300_GE_RGMII_RX_MSK;
+		reg |= ADIN1300_GE_RGMII_RX_SEL(val);
 	} else {
 		reg &= ~ADIN1300_GE_RGMII_RXID_EN;
 	}
@@ -66,6 +142,12 @@ static int adin_config_rgmii_mode(struct phy_device *phydev)
 	if (phydev->interface == PHY_INTERFACE_MODE_RGMII_ID ||
 	    phydev->interface == PHY_INTERFACE_MODE_RGMII_TXID) {
 		reg |= ADIN1300_GE_RGMII_TXID_EN;
+
+		val = adin_get_reg_value(phydev, "adi,tx-internal-delay-ps",
+					 adin_rgmii_delays,
+					 ADIN1300_RGMII_2_00_NS);
+		reg &= ~ADIN1300_GE_RGMII_GTX_MSK;
+		reg |= ADIN1300_GE_RGMII_GTX_SEL(val);
 	} else {
 		reg &= ~ADIN1300_GE_RGMII_TXID_EN;
 	}
-- 
2.20.1
