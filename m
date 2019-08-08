From: Alexandru Ardelean <alexandru.ardelean@analog.com>
Subject: [PATCH v2 09/15] net: phy: adin: add support MDI/MDIX/Auto-MDI selection
Date: Thu, 8 Aug 2019 15:30:20 +0300
Message-ID: <20190808123026.17382-10-alexandru.ardelean@analog.com>
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

The ADIN PHYs support automatic MDI/MDIX negotiation. By default this is
disabled, so this is enabled at `config_init`.

This is controlled via the PHY Control 1 register.
The supported modes are:
  1. Manual MDI
  2. Manual MDIX
  3. Auto MDIX - prefer MDIX
  4. Auto MDIX - prefer MDI

The phydev mdix & mdix_ctrl fields include modes 3 & 4 into a single
auto-mode. So, the default mode this driver enables is 4 when Auto-MDI mode
is used.

When detecting MDI/MDIX mode, a combination of the PHY Control 1 register
and PHY Status 1 register is used to determine the correct MDI/MDIX mode.

If Auto-MDI mode is not set, then the manual MDI/MDIX mode is returned.
If Auto-MDI mode is set, then MDIX mode is returned differs from the
preferred MDI/MDIX mode.
This covers all cases where:
  1. MDI preferred  & Pair01Swapped   == MDIX
  2. MDIX preferred & Pair01Swapped   == MDI
  3. MDI preferred  & ! Pair01Swapped == MDIX
  4. MDIX preferred & ! Pair01Swapped == MDI

The preferred MDI/MDIX mode is not configured via SW, but can be configured
via HW pins. Note that the `Pair01Swapped` is the Green-Yellow physical
pairs.

Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
---
 drivers/net/phy/adin.c | 117 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 113 insertions(+), 4 deletions(-)

diff --git a/drivers/net/phy/adin.c b/drivers/net/phy/adin.c
index 26b2f2b21596..69ef53bbecc3 100644
--- a/drivers/net/phy/adin.c
+++ b/drivers/net/phy/adin.c
@@ -19,6 +19,10 @@
 #define ADIN1300_MII_EXT_REG_PTR		0x0010
 #define ADIN1300_MII_EXT_REG_DATA		0x0011
 
+#define ADIN1300_PHY_CTRL1			0x0012
+#define   ADIN1300_AUTO_MDI_EN			BIT(10)
+#define   ADIN1300_MAN_MDIX_EN			BIT(9)
+
 #define ADIN1300_INT_MASK_REG			0x0018
 #define   ADIN1300_INT_MDIO_SYNC_EN		BIT(9)
 #define   ADIN1300_INT_ANEG_STAT_CHNG_EN	BIT(8)
@@ -35,6 +39,9 @@
 	 ADIN1300_INT_HW_IRQ_EN)
 #define ADIN1300_INT_STATUS_REG			0x0019
 
+#define ADIN1300_PHY_STATUS1			0x001a
+#define   ADIN1300_PAIR_01_SWAP			BIT(11)
+
 #define ADIN1300_GE_RGMII_CFG_REG		0xff23
 #define   ADIN1300_GE_RGMII_RX_MSK		GENMASK(8, 6)
 #define   ADIN1300_GE_RGMII_RX_SEL(x)		\
@@ -208,6 +215,8 @@ static int adin_config_init(struct phy_device *phydev)
 {
 	int rc;
 
+	phydev->mdix_ctrl = ETH_TP_MDI_AUTO;
+
 	rc = genphy_config_init(phydev);
 	if (rc < 0)
 		return rc;
@@ -283,13 +292,113 @@ static int adin_write_mmd(struct phy_device *phydev, int devad, u16 regnum,
 	return __mdiobus_write(bus, phy_addr, ADIN1300_MII_EXT_REG_DATA, val);
 }
 
+static int adin_config_mdix(struct phy_device *phydev)
+{
+	bool auto_en, mdix_en;
+	int reg;
+
+	mdix_en = false;
+	auto_en = false;
+	switch (phydev->mdix_ctrl) {
+	case ETH_TP_MDI:
+		break;
+	case ETH_TP_MDI_X:
+		mdix_en = true;
+		break;
+	case ETH_TP_MDI_AUTO:
+		auto_en = true;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	reg = phy_read(phydev, ADIN1300_PHY_CTRL1);
+	if (reg < 0)
+		return reg;
+
+	if (mdix_en)
+		reg |= ADIN1300_MAN_MDIX_EN;
+	else
+		reg &= ~ADIN1300_MAN_MDIX_EN;
+
+	if (auto_en)
+		reg |= ADIN1300_AUTO_MDI_EN;
+	else
+		reg &= ~ADIN1300_AUTO_MDI_EN;
+
+	return phy_write(phydev, ADIN1300_PHY_CTRL1, reg);
+}
+
+static int adin_config_aneg(struct phy_device *phydev)
+{
+	int ret;
+
+	ret = adin_config_mdix(phydev);
+	if (ret)
+		return ret;
+
+	return genphy_config_aneg(phydev);
+}
+
+static int adin_mdix_update(struct phy_device *phydev)
+{
+	bool auto_en, mdix_en;
+	bool swapped;
+	int reg;
+
+	reg = phy_read(phydev, ADIN1300_PHY_CTRL1);
+	if (reg < 0)
+		return reg;
+
+	auto_en = !!(reg & ADIN1300_AUTO_MDI_EN);
+	mdix_en = !!(reg & ADIN1300_MAN_MDIX_EN);
+
+	/* If MDI/MDIX is forced, just read it from the control reg */
+	if (!auto_en) {
+		if (mdix_en)
+			phydev->mdix = ETH_TP_MDI_X;
+		else
+			phydev->mdix = ETH_TP_MDI;
+		return 0;
+	}
+
+	/**
+	 * Otherwise, we need to deduce it from the PHY status2 reg.
+	 * When Auto-MDI is enabled, the ADIN1300_MAN_MDIX_EN bit implies
+	 * a preference for MDIX when it is set.
+	 */
+	reg = phy_read(phydev, ADIN1300_PHY_STATUS1);
+	if (reg < 0)
+		return reg;
+
+	swapped = !!(reg & ADIN1300_PAIR_01_SWAP);
+
+	if (mdix_en != swapped)
+		phydev->mdix = ETH_TP_MDI_X;
+	else
+		phydev->mdix = ETH_TP_MDI;
+
+	return 0;
+}
+
+static int adin_read_status(struct phy_device *phydev)
+{
+	int ret;
+
+	ret = adin_mdix_update(phydev);
+	if (ret < 0)
+		return ret;
+
+	return genphy_read_status(phydev);
+}
+
 static struct phy_driver adin_driver[] = {
 	{
 		PHY_ID_MATCH_MODEL(PHY_ID_ADIN1200),
 		.name		= "ADIN1200",
 		.config_init	= adin_config_init,
-		.config_aneg	= genphy_config_aneg,
-		.read_status	= genphy_read_status,
+		.config_aneg	= adin_config_aneg,
+		.read_status	= adin_read_status,
 		.get_features	= genphy_read_abilities,
 		.ack_interrupt	= adin_phy_ack_intr,
 		.config_intr	= adin_phy_config_intr,
@@ -302,8 +411,8 @@ static struct phy_driver adin_driver[] = {
 		PHY_ID_MATCH_MODEL(PHY_ID_ADIN1300),
 		.name		= "ADIN1300",
 		.config_init	= adin_config_init,
-		.config_aneg	= genphy_config_aneg,
-		.read_status	= genphy_read_status,
+		.config_aneg	= adin_config_aneg,
+		.read_status	= adin_read_status,
 		.get_features	= genphy_read_abilities,
 		.ack_interrupt	= adin_phy_ack_intr,
 		.config_intr	= adin_phy_config_intr,
-- 
2.20.1
