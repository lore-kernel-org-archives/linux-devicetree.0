From: Alexandru Ardelean <alexandru.ardelean@analog.com>
Subject: [PATCH 07/16] net: phy: adin: make RGMII internal delays configurable
Date: Mon, 5 Aug 2019 19:54:44 +0300
Message-ID: <20190805165453.3989-8-alexandru.ardelean@analog.com>
References: <20190805165453.3989-1-alexandru.ardelean@analog.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190805165453.3989-1-alexandru.ardelean@analog.com>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, f.fainelli@gmail.com, hkallweit1@gmail.com, andrew@lunn.ch, Alexandru Ardelean <alexandru.ardelean@analog.com>
List-Id: devicetree@vger.kernel.org

The internal delays for the RGMII are configurable for both RX & TX. This
change adds support for configuring them via device-tree (or ACPI).

Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
---
 drivers/net/phy/adin.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/net/phy/adin.c b/drivers/net/phy/adin.c
index e3d2ff8cc09c..cb96d47d457e 100644
--- a/drivers/net/phy/adin.c
+++ b/drivers/net/phy/adin.c
@@ -5,6 +5,7 @@
  * Copyright 2019 Analog Devices Inc.
  */
 #include <linux/kernel.h>
+#include <linux/bitfield.h>
 #include <linux/errno.h>
 #include <linux/init.h>
 #include <linux/module.h>
@@ -12,6 +13,8 @@
 #include <linux/phy.h>
 #include <linux/property.h>
 
+#include <dt-bindings/net/adin.h>
+
 #define PHY_ID_ADIN1200				0x0283bc20
 #define PHY_ID_ADIN1300				0x0283bc30
 
@@ -35,6 +38,12 @@
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
@@ -67,6 +76,32 @@ static int adin_get_phy_internal_mode(struct phy_device *phydev)
 	return -EINVAL;
 }
 
+static void adin_config_rgmii_rx_internal_delay(struct phy_device *phydev,
+						int *reg)
+{
+	struct device *dev = &phydev->mdio.dev;
+	u32 val;
+
+	if (device_property_read_u32(dev, "adi,rx-internal-delay", &val))
+		val = ADIN1300_RGMII_2_00_NS;
+
+	*reg &= ADIN1300_GE_RGMII_RX_MSK;
+	*reg |= ADIN1300_GE_RGMII_RX_SEL(val);
+}
+
+static void adin_config_rgmii_tx_internal_delay(struct phy_device *phydev,
+						int *reg)
+{
+	struct device *dev = &phydev->mdio.dev;
+	u32 val;
+
+	if (device_property_read_u32(dev, "adi,tx-internal-delay", &val))
+		val = ADIN1300_RGMII_2_00_NS;
+
+	*reg &= ADIN1300_GE_RGMII_GTX_MSK;
+	*reg |= ADIN1300_GE_RGMII_GTX_SEL(val);
+}
+
 static int adin_config_rgmii_mode(struct phy_device *phydev,
 				  phy_interface_t intf)
 {
@@ -86,6 +121,7 @@ static int adin_config_rgmii_mode(struct phy_device *phydev,
 	if (intf == PHY_INTERFACE_MODE_RGMII_ID ||
 	    intf == PHY_INTERFACE_MODE_RGMII_RXID) {
 		reg |= ADIN1300_GE_RGMII_RXID_EN;
+		adin_config_rgmii_rx_internal_delay(phydev, &reg);
 	} else {
 		reg &= ~ADIN1300_GE_RGMII_RXID_EN;
 	}
@@ -93,6 +129,7 @@ static int adin_config_rgmii_mode(struct phy_device *phydev,
 	if (intf == PHY_INTERFACE_MODE_RGMII_ID ||
 	    intf == PHY_INTERFACE_MODE_RGMII_TXID) {
 		reg |= ADIN1300_GE_RGMII_TXID_EN;
+		adin_config_rgmii_tx_internal_delay(phydev, &reg);
 	} else {
 		reg &= ~ADIN1300_GE_RGMII_TXID_EN;
 	}
-- 
2.20.1
