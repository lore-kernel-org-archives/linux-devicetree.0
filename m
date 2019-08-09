From: Alexandru Ardelean <alexandru.ardelean@analog.com>
Subject: [PATCH v3 12/14] net: phy: adin: implement downshift configuration via phy-tunable
Date: Fri, 9 Aug 2019 16:35:50 +0300
Message-ID: <20190809133552.21597-13-alexandru.ardelean@analog.com>
References: <20190809133552.21597-1-alexandru.ardelean@analog.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190809133552.21597-1-alexandru.ardelean@analog.com>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, f.fainelli@gmail.com, hkallweit1@gmail.com, andrew@lunn.ch, Alexandru Ardelean <alexandru.ardelean@analog.com>
List-Id: devicetree@vger.kernel.org

Down-speed auto-negotiation may not always be enabled, in which case the
PHY won't down-shift to 100 or 10 during auto-negotiation.

This change enables downshift and configures the number of retries to
default 4 (which is also in the datasheet

The downshift control mechanism can also be controlled via the phy-tunable
interface (ETHTOOL_PHY_DOWNSHIFT control).

The change has been adapted from the Aquantia PHY driver.

Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
---
 drivers/net/phy/adin.c | 86 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/drivers/net/phy/adin.c b/drivers/net/phy/adin.c
index e086e2d989e0..fb39104508ff 100644
--- a/drivers/net/phy/adin.c
+++ b/drivers/net/phy/adin.c
@@ -29,6 +29,17 @@
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
+
 #define ADIN1300_INT_MASK_REG			0x0018
 #define   ADIN1300_INT_MDIO_SYNC_EN		BIT(9)
 #define   ADIN1300_INT_ANEG_STAT_CHNG_EN	BIT(8)
@@ -259,6 +270,73 @@ static int adin_config_rmii_mode(struct phy_device *phydev)
 			     ADIN1300_GE_RMII_CFG_REG, reg);
 }
 
+static int adin_get_downshift(struct phy_device *phydev, u8 *data)
+{
+	int val, cnt, enable;
+
+	val = phy_read(phydev, ADIN1300_PHY_CTRL2);
+	if (val < 0)
+		return val;
+
+	cnt = phy_read(phydev, ADIN1300_PHY_CTRL3);
+	if (cnt < 0)
+		return cnt;
+
+	enable = FIELD_GET(ADIN1300_DOWNSPEEDS_EN, val);
+	cnt = FIELD_GET(ADIN1300_DOWNSPEED_RETRIES_MSK, cnt);
+
+	*data = enable & cnt ? cnt : DOWNSHIFT_DEV_DISABLE;
+
+	return 0;
+}
+
+static int adin_set_downshift(struct phy_device *phydev, u8 cnt)
+{
+	u16 val;
+	int rc;
+
+	if (cnt == DOWNSHIFT_DEV_DISABLE)
+		return phy_clear_bits(phydev, ADIN1300_PHY_CTRL2,
+				      ADIN1300_DOWNSPEEDS_EN);
+
+	if (cnt > 8)
+		return -E2BIG;
+
+	val = FIELD_PREP(ADIN1300_DOWNSPEED_RETRIES_MSK, cnt);
+	val |= ADIN1300_LINKING_EN;
+
+	rc = phy_modify(phydev, ADIN1300_PHY_CTRL3,
+			ADIN1300_LINKING_EN | ADIN1300_DOWNSPEED_RETRIES_MSK,
+			val);
+	if (rc < 0)
+		return rc;
+
+	return phy_set_bits(phydev, ADIN1300_PHY_CTRL2,
+			    ADIN1300_DOWNSPEEDS_EN);
+}
+
+static int adin_get_tunable(struct phy_device *phydev,
+			    struct ethtool_tunable *tuna, void *data)
+{
+	switch (tuna->id) {
+	case ETHTOOL_PHY_DOWNSHIFT:
+		return adin_get_downshift(phydev, data);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int adin_set_tunable(struct phy_device *phydev,
+			    struct ethtool_tunable *tuna, const void *data)
+{
+	switch (tuna->id) {
+	case ETHTOOL_PHY_DOWNSHIFT:
+		return adin_set_downshift(phydev, *(const u8 *)data);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
 static int adin_config_init_edpd(struct phy_device *phydev)
 {
 	struct adin_priv *priv = phydev->priv;
@@ -289,6 +367,10 @@ static int adin_config_init(struct phy_device *phydev)
 	if (rc < 0)
 		return rc;
 
+	rc = adin_set_downshift(phydev, 4);
+	if (rc < 0)
+		return rc;
+
 	rc = adin_config_init_edpd(phydev);
 	if (rc < 0)
 		return rc;
@@ -546,6 +628,8 @@ static struct phy_driver adin_driver[] = {
 		.probe		= adin_probe,
 		.config_aneg	= adin_config_aneg,
 		.read_status	= adin_read_status,
+		.get_tunable	= adin_get_tunable,
+		.set_tunable	= adin_set_tunable,
 		.ack_interrupt	= adin_phy_ack_intr,
 		.config_intr	= adin_phy_config_intr,
 		.resume		= genphy_resume,
@@ -560,6 +644,8 @@ static struct phy_driver adin_driver[] = {
 		.probe		= adin_probe,
 		.config_aneg	= adin_config_aneg,
 		.read_status	= adin_read_status,
+		.get_tunable	= adin_get_tunable,
+		.set_tunable	= adin_set_tunable,
 		.ack_interrupt	= adin_phy_ack_intr,
 		.config_intr	= adin_phy_config_intr,
 		.resume		= genphy_resume,
-- 
2.20.1
