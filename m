From: Alexandru Ardelean <alexandru.ardelean@analog.com>
Subject: [PATCH 12/16] net: phy: adin: read EEE setting from device-tree
Date: Mon, 5 Aug 2019 19:54:49 +0300
Message-ID: <20190805165453.3989-13-alexandru.ardelean@analog.com>
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

By default, EEE is not advertised on system init. This change allows the
user to specify a device property to enable EEE advertisements when the PHY
initializes.

Also, before resetting the PHY, the EEE settings are read, so that after
the reset is complete, they are written back into the EEE advertisement
register.

Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
---
 drivers/net/phy/adin.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/net/phy/adin.c b/drivers/net/phy/adin.c
index 476a81ce9341..cf99ccacfeeb 100644
--- a/drivers/net/phy/adin.c
+++ b/drivers/net/phy/adin.c
@@ -94,9 +94,11 @@ static struct clause22_mmd_map clause22_mmd_map[] = {
 /**
  * struct adin_priv - ADIN PHY driver private data
  * gpiod_reset		optional reset GPIO, to be used in soft_reset() cb
+ * eee_modes		EEE modes to advertise after reset
  */
 struct adin_priv {
 	struct gpio_desc	*gpiod_reset;
+	u8			eee_modes;
 };
 
 static int adin_get_phy_internal_mode(struct phy_device *phydev)
@@ -216,6 +218,23 @@ static int adin_config_rmii_mode(struct phy_device *phydev,
 			     ADIN1300_GE_RMII_CFG_REG, reg);
 }
 
+static int adin_config_init_eee(struct phy_device *phydev)
+{
+	struct adin_priv *priv = phydev->priv;
+	int reg;
+
+	reg = phy_read_mmd(phydev, MDIO_MMD_VEND1, ADIN1300_EEE_ADV_REG);
+	if (reg < 0)
+		return reg;
+
+	if (priv->eee_modes)
+		reg |= priv->eee_modes;
+	else
+		reg &= ~(MDIO_EEE_100TX | MDIO_EEE_1000T);
+
+	return phy_write_mmd(phydev, MDIO_MMD_VEND1, ADIN1300_EEE_ADV_REG, reg);
+}
+
 static int adin_config_init(struct phy_device *phydev)
 {
 	phy_interface_t interface, rc;
@@ -238,6 +257,10 @@ static int adin_config_init(struct phy_device *phydev)
 	if (rc < 0)
 		return rc;
 
+	rc = adin_config_init_eee(phydev);
+	if (rc < 0)
+		return rc;
+
 	if (phydev->interface == interface)
 		dev_info(&phydev->mdio.dev, "PHY is using mode '%s'\n",
 			 phy_modes(phydev->interface));
@@ -473,6 +496,12 @@ static int adin_reset(struct phy_device *phydev)
 	struct adin_priv *priv = phydev->priv;
 	int ret;
 
+	/* Update EEE settings before resetting, in case ethtool changed them */
+	ret = phy_read_mmd(phydev, MDIO_MMD_VEND1, ADIN1300_EEE_ADV_REG);
+	if (ret < 0)
+		return ret;
+	priv->eee_modes = (ret & (MDIO_EEE_100TX | MDIO_EEE_1000T));
+
 	if (priv->gpiod_reset) {
 		/* GPIO reset requires min 10 uS low,
 		 * 5 msecs max before we know that the interface is up again
@@ -504,6 +533,8 @@ static int adin_probe(struct phy_device *phydev)
 		gpiod_reset = NULL;
 
 	priv->gpiod_reset = gpiod_reset;
+	if (device_property_read_bool(dev, "adi,eee-enabled"))
+		priv->eee_modes = (MDIO_EEE_100TX | MDIO_EEE_1000T);
 	phydev->priv = priv;
 
 	return adin_reset(phydev);
-- 
2.20.1
