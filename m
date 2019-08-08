From: Alexandru Ardelean <alexandru.ardelean@analog.com>
Subject: [PATCH v2 13/15] net: phy: adin: configure downshift on config_init
Date: Thu, 8 Aug 2019 15:30:24 +0300
Message-ID: <20190808123026.17382-14-alexandru.ardelean@analog.com>
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

Down-speed auto-negotiation may not always be enabled, in which case the
PHY won't down-shift to 100 or 10 during auto-negotiation.

This change enables downshift and configures the number of retries to
default 8 (maximum supported value).

The change has been adapted from the Marvell PHY driver.

Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
---
 drivers/net/phy/adin.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/net/phy/adin.c b/drivers/net/phy/adin.c
index bc4393195de7..d6d1f5037eb7 100644
--- a/drivers/net/phy/adin.c
+++ b/drivers/net/phy/adin.c
@@ -29,6 +29,18 @@
 #define   ADIN1300_NRG_PD_TX_EN			BIT(2)
 #define   ADIN1300_NRG_PD_STATUS		BIT(1)
 
+#define ADIN1300_PHY_CTRL2			0x0016
+#define   ADIN1300_DOWNSPEED_AN_100_EN		BIT(11)
+#define   ADIN1300_DOWNSPEED_AN_10_EN		BIT(10)
+#define   ADIN1300_GROUP_MDIO_EN		BIT(6)
+#define   ADIN1300_DOWNSPEEDS_EN	\
+	(ADIN1300_DOWNSPEED_AN_100_EN | ADIN1300_DOWNSPEED_AN_10_EN)
+
+#define ADIN1300_PHY_CTRL3			0x0017
+#define   ADIN1300_LINKING_EN			BIT(13)
+#define   ADIN1300_DOWNSPEED_RETRIES_MSK	GENMASK(12, 10)
+#define   ADIN1300_DOWNSPEED_RETRIES_OFF	10
+
 #define ADIN1300_INT_MASK_REG			0x0018
 #define   ADIN1300_INT_MDIO_SYNC_EN		BIT(9)
 #define   ADIN1300_INT_ANEG_STAT_CHNG_EN	BIT(8)
@@ -259,6 +271,29 @@ static int adin_config_rmii_mode(struct phy_device *phydev)
 			     ADIN1300_GE_RMII_CFG_REG, reg);
 }
 
+static int adin_config_down_shift(struct phy_device *phydev, bool enable,
+				  u8 retries)
+{
+	u16 mask, set;
+	int rc;
+
+	if (!enable)
+		return phy_clear_bits(phydev, ADIN1300_PHY_CTRL2,
+				      ADIN1300_DOWNSPEEDS_EN);
+
+	mask = ADIN1300_LINKING_EN | ADIN1300_DOWNSPEED_RETRIES_MSK;
+	set = (retries << ADIN1300_DOWNSPEED_RETRIES_OFF);
+	set &= ADIN1300_DOWNSPEED_RETRIES_MSK;
+	set |= ADIN1300_LINKING_EN;
+
+	rc = phy_modify_changed(phydev, ADIN1300_PHY_CTRL3, mask, set);
+	if (rc < 0)
+		return rc;
+
+	return phy_set_bits(phydev, ADIN1300_PHY_CTRL2,
+			    ADIN1300_DOWNSPEEDS_EN);
+}
+
 static int adin_config_init_edpd(struct phy_device *phydev)
 {
 	struct adin_priv *priv = phydev->priv;
@@ -289,6 +324,10 @@ static int adin_config_init(struct phy_device *phydev)
 	if (rc < 0)
 		return rc;
 
+	rc = adin_config_down_shift(phydev, true, 8);
+	if (rc < 0)
+		return rc;
+
 	rc = adin_config_init_edpd(phydev);
 	if (rc < 0)
 		return rc;
-- 
2.20.1
