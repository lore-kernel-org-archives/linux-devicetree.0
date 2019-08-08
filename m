From: Alexandru Ardelean <alexandru.ardelean@analog.com>
Subject: [PATCH v2 12/15] net: phy: adin: implement Energy Detect Powerdown mode
Date: Thu, 8 Aug 2019 15:30:23 +0300
Message-ID: <20190808123026.17382-13-alexandru.ardelean@analog.com>
References: <20190808123026.17382-1-alexandru.ardelean@analog.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190808123026.17382-1-alexandru.ardelean@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
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
 drivers/net/phy/adin.c | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/net/phy/adin.c b/drivers/net/phy/adin.c
index f276d692bdee..bc4393195de7 100644
--- a/drivers/net/phy/adin.c
+++ b/drivers/net/phy/adin.c
@@ -24,6 +24,11 @@
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
@@ -138,6 +143,14 @@ static struct adin_clause45_mmd_map adin_clause45_mmd_map[] = {
 	{ MDIO_MMD_PCS, MDIO_PCS_EEE_WK_ERR,	ADIN1300_LPI_WAKE_ERR_CNT_REG },
 };
 
+/**
+ * struct adin_priv - ADIN PHY driver private data
+ * edpd_enabled		true if Energy Detect Powerdown mode is enabled
+ */
+struct adin_priv {
+	bool			edpd_enabled;
+};
+
 static int adin_lookup_reg_value(const struct adin_cfg_reg_map *tbl, int cfg)
 {
 	size_t i;
@@ -246,6 +259,18 @@ static int adin_config_rmii_mode(struct phy_device *phydev)
 			     ADIN1300_GE_RMII_CFG_REG, reg);
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
 	int rc;
@@ -264,6 +289,10 @@ static int adin_config_init(struct phy_device *phydev)
 	if (rc < 0)
 		return rc;
 
+	rc = adin_config_init_edpd(phydev);
+	if (rc < 0)
+		return rc;
+
 	phydev_dbg(phydev, "PHY is using mode '%s'\n",
 		   phy_modes(phydev->interface));
 
@@ -495,6 +524,17 @@ static int adin_reset(struct phy_device *phydev)
 
 static int adin_probe(struct phy_device *phydev)
 {
+	struct device *dev = &phydev->mdio.dev;
+	struct adin_priv *priv;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->edpd_enabled =
+		device_property_read_bool(dev, "adi,disable-energy-detect");
+	phydev->priv = priv;
+
 	return adin_reset(phydev);
 }
 
-- 
2.20.1
