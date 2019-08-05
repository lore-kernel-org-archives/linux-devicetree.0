From: Alexandru Ardelean <alexandru.ardelean@analog.com>
Subject: [PATCH 11/16] net: phy: adin: PHY reset mechanisms
Date: Mon, 5 Aug 2019 19:54:48 +0300
Message-ID: <20190805165453.3989-12-alexandru.ardelean@analog.com>
References: <20190805165453.3989-1-alexandru.ardelean@analog.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190805165453.3989-1-alexandru.ardelean@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
To: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, f.fainelli@gmail.com, hkallweit1@gmail.com, andrew@lunn.ch, Alexandru Ardelean <alexandru.ardelean@analog.com>
List-Id: devicetree@vger.kernel.org

The ADIN PHYs supports 4 types of reset:
1. The standard PHY reset via BMCR_RESET bit in MII_BMCR reg
2. Reset via GPIO
3. Reset via reg GeSftRst (0xff0c) & reload previous pin configs
4. Reset via reg GeSftRst (0xff0c) & request new pin configs

Resets 2 & 4 are almost identical, with the exception that the crystal
oscillator is available during reset for 2.

Resetting via GeSftRst or via GPIO is useful when doing a warm reboot. If
doing various settings via phytool or ethtool, the sub-system registers
don't reset just via BMCR_RESET.

This change implements resetting the entire PHY subsystem during probe.
During PHY HW init (phy_hw_init() logic) the PHY core regs will be reset
again via BMCR_RESET. This will also need to happen during a PM resume.

Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
---
 drivers/net/phy/adin.c | 82 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/drivers/net/phy/adin.c b/drivers/net/phy/adin.c
index 3c559a3ba487..476a81ce9341 100644
--- a/drivers/net/phy/adin.c
+++ b/drivers/net/phy/adin.c
@@ -6,12 +6,14 @@
  */
 #include <linux/kernel.h>
 #include <linux/bitfield.h>
+#include <linux/delay.h>
 #include <linux/errno.h>
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/mii.h>
 #include <linux/phy.h>
 #include <linux/property.h>
+#include <linux/gpio/consumer.h>
 
 #include <dt-bindings/net/adin.h>
 
@@ -55,6 +57,9 @@
 #define ADIN1300_CLOCK_STOP_REG			0x9400
 #define ADIN1300_LPI_WAKE_ERR_CNT_REG		0xa000
 
+#define ADIN1300_GE_SOFT_RESET_REG		0xff0c
+#define   ADIN1300_GE_SOFT_RESET		BIT(0)
+
 #define ADIN1300_GE_RGMII_CFG_REG		0xff23
 #define   ADIN1300_GE_RGMII_RX_MSK		GENMASK(8, 6)
 #define   ADIN1300_GE_RGMII_RX_SEL(x)		\
@@ -86,6 +91,14 @@ static struct clause22_mmd_map clause22_mmd_map[] = {
 	{ MDIO_MMD_PCS, MDIO_PCS_EEE_WK_ERR,	ADIN1300_LPI_WAKE_ERR_CNT_REG },
 };
 
+/**
+ * struct adin_priv - ADIN PHY driver private data
+ * gpiod_reset		optional reset GPIO, to be used in soft_reset() cb
+ */
+struct adin_priv {
+	struct gpio_desc	*gpiod_reset;
+};
+
 static int adin_get_phy_internal_mode(struct phy_device *phydev)
 {
 	struct device *dev = &phydev->mdio.dev;
@@ -429,6 +442,73 @@ static int adin_read_status(struct phy_device *phydev)
 	return genphy_read_status(phydev);
 }
 
+static int adin_subsytem_soft_reset(struct phy_device *phydev)
+{
+	int reg, rc, i;
+
+	reg = phy_read_mmd(phydev, MDIO_MMD_VEND1, ADIN1300_GE_SOFT_RESET_REG);
+	if (reg < 0)
+		return reg;
+
+	reg |= ADIN1300_GE_SOFT_RESET;
+	rc = phy_write_mmd(phydev, MDIO_MMD_VEND1, ADIN1300_GE_SOFT_RESET_REG,
+			   reg);
+	if (rc < 0)
+		return rc;
+
+	for (i = 0; i < 20; i++) {
+		usleep_range(500, 1000);
+		reg = phy_read_mmd(phydev, MDIO_MMD_VEND1,
+				   ADIN1300_GE_SOFT_RESET_REG);
+		if (reg < 0 || (reg & ADIN1300_GE_SOFT_RESET))
+			continue;
+		return 0;
+	}
+
+	return -ETIMEDOUT;
+}
+
+static int adin_reset(struct phy_device *phydev)
+{
+	struct adin_priv *priv = phydev->priv;
+	int ret;
+
+	if (priv->gpiod_reset) {
+		/* GPIO reset requires min 10 uS low,
+		 * 5 msecs max before we know that the interface is up again
+		 */
+		gpiod_set_value(priv->gpiod_reset, 0);
+		usleep_range(10, 15);
+		gpiod_set_value(priv->gpiod_reset, 1);
+		mdelay(5);
+
+		return 0;
+	}
+
+	/* Reset PHY core regs & subsystem regs */
+	return adin_subsytem_soft_reset(phydev);
+}
+
+static int adin_probe(struct phy_device *phydev)
+{
+	struct device *dev = &phydev->mdio.dev;
+	struct gpio_desc *gpiod_reset;
+	struct adin_priv *priv;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	gpiod_reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(gpiod_reset))
+		gpiod_reset = NULL;
+
+	priv->gpiod_reset = gpiod_reset;
+	phydev->priv = priv;
+
+	return adin_reset(phydev);
+}
+
 static struct phy_driver adin_driver[] = {
 	{
 		.phy_id		= PHY_ID_ADIN1200,
@@ -437,6 +517,7 @@ static struct phy_driver adin_driver[] = {
 		.features	= PHY_BASIC_FEATURES,
 		.flags		= PHY_HAS_INTERRUPT,
 		.config_init	= adin_config_init,
+		.probe		= adin_probe,
 		.config_aneg	= adin_config_aneg,
 		.read_status	= adin_read_status,
 		.ack_interrupt	= adin_phy_ack_intr,
@@ -453,6 +534,7 @@ static struct phy_driver adin_driver[] = {
 		.features	= PHY_GBIT_FEATURES,
 		.flags		= PHY_HAS_INTERRUPT,
 		.config_init	= adin_config_init,
+		.probe		= adin_probe,
 		.config_aneg	= adin_config_aneg,
 		.read_status	= adin_read_status,
 		.ack_interrupt	= adin_phy_ack_intr,
-- 
2.20.1
