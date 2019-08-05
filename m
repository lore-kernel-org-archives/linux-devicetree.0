From: Alexandru Ardelean <alexandru.ardelean@analog.com>
Subject: [PATCH 13/16] net: phy: adin: implement Energy Detect Powerdown mode
Date: Mon, 5 Aug 2019 19:54:50 +0300
Message-ID: <20190805165453.3989-14-alexandru.ardelean@analog.com>
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

The ADIN PHYs support Energy Detect Powerdown mode, which puts the PHY into
a low power mode when there is no signal on the wire (typically cable
unplugged).
This behavior is enabled by default, but can be disabled via device
property.

Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
---
 drivers/net/phy/adin.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/net/phy/adin.c b/drivers/net/phy/adin.c
index cf99ccacfeeb..86848444bd98 100644
--- a/drivers/net/phy/adin.c
+++ b/drivers/net/phy/adin.c
@@ -27,6 +27,11 @@
 #define   ADIN1300_AUTO_MDI_EN			BIT(10)
 #define   ADIN1300_MAN_MDIX_EN			BIT(9)
 
+#define ADIN1300_PHY_CTRL_STATUS2		0x0015
+#define   ADIN1300_NRG_PD_EN			BIT(3)
+#define   ADIN1300_NRG_PD_TX_EN			BIT(2)
+#define   ADIN1300_NRG_PD_STATUS		BIT(1)
+
 #define ADIN1300_INT_MASK_REG			0x0018
 #define   ADIN1300_INT_MDIO_SYNC_EN		BIT(9)
 #define   ADIN1300_INT_ANEG_STAT_CHNG_EN	BIT(8)
@@ -95,10 +100,12 @@ static struct clause22_mmd_map clause22_mmd_map[] = {
  * struct adin_priv - ADIN PHY driver private data
  * gpiod_reset		optional reset GPIO, to be used in soft_reset() cb
  * eee_modes		EEE modes to advertise after reset
+ * edpd_enabled		true if Energy Detect Powerdown mode is enabled
  */
 struct adin_priv {
 	struct gpio_desc	*gpiod_reset;
 	u8			eee_modes;
+	bool			edpd_enabled;
 };
 
 static int adin_get_phy_internal_mode(struct phy_device *phydev)
@@ -235,6 +242,18 @@ static int adin_config_init_eee(struct phy_device *phydev)
 	return phy_write_mmd(phydev, MDIO_MMD_VEND1, ADIN1300_EEE_ADV_REG, reg);
 }
 
+static int adin_config_init_edpd(struct phy_device *phydev)
+{
+	struct adin_priv *priv = phydev->priv;
+
+	if (priv->edpd_enabled)
+		return phy_set_bits(phydev, ADIN1300_PHY_CTRL_STATUS2,
+				(ADIN1300_NRG_PD_EN | ADIN1300_NRG_PD_TX_EN));
+
+	return phy_clear_bits(phydev, ADIN1300_PHY_CTRL_STATUS2,
+			(ADIN1300_NRG_PD_EN | ADIN1300_NRG_PD_TX_EN));
+}
+
 static int adin_config_init(struct phy_device *phydev)
 {
 	phy_interface_t interface, rc;
@@ -261,6 +280,10 @@ static int adin_config_init(struct phy_device *phydev)
 	if (rc < 0)
 		return rc;
 
+	rc = adin_config_init_edpd(phydev);
+	if (rc < 0)
+		return rc;
+
 	if (phydev->interface == interface)
 		dev_info(&phydev->mdio.dev, "PHY is using mode '%s'\n",
 			 phy_modes(phydev->interface));
@@ -535,6 +558,10 @@ static int adin_probe(struct phy_device *phydev)
 	priv->gpiod_reset = gpiod_reset;
 	if (device_property_read_bool(dev, "adi,eee-enabled"))
 		priv->eee_modes = (MDIO_EEE_100TX | MDIO_EEE_1000T);
+	if (device_property_read_bool(dev, "adi,disable-energy-detect"))
+		priv->edpd_enabled = false;
+	else
+		priv->edpd_enabled = true;
 	phydev->priv = priv;
 
 	return adin_reset(phydev);
-- 
2.20.1
