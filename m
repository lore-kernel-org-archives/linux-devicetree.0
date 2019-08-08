From: Alexandru Ardelean <alexandru.ardelean@analog.com>
Subject: [PATCH v2 10/15] net: phy: adin: add EEE translation layer from Clause 45 to Clause 22
Date: Thu, 8 Aug 2019 15:30:21 +0300
Message-ID: <20190808123026.17382-11-alexandru.ardelean@analog.com>
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

The ADIN1200 & ADIN1300 PHYs support EEE by using standard Clause 45 access
to access MMD registers for EEE.

The EEE register addresses (when using Clause 22) are available at
different addresses (than Clause 45), and since accessing these regs (via
Clause 22) needs a special mechanism, a translation table is required to
convert these addresses.

For Clause 45, this is not needed; the addresses are available as specified
by IEEE.

Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
---
 drivers/net/phy/adin.c | 69 ++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 67 insertions(+), 2 deletions(-)

diff --git a/drivers/net/phy/adin.c b/drivers/net/phy/adin.c
index 69ef53bbecc3..c1cea1b6bd75 100644
--- a/drivers/net/phy/adin.c
+++ b/drivers/net/phy/adin.c
@@ -42,6 +42,17 @@
 #define ADIN1300_PHY_STATUS1			0x001a
 #define   ADIN1300_PAIR_01_SWAP			BIT(11)
 
+/* EEE register addresses, accessible via Clause 22 access using
+ * ADIN1300_MII_EXT_REG_PTR & ADIN1300_MII_EXT_REG_DATA.
+ * The bit-fields are the same as specified by IEEE, and can be
+ * accessed via standard Clause 45 access.
+ */
+#define ADIN1300_EEE_CAP_REG			0x8000
+#define ADIN1300_EEE_ADV_REG			0x8001
+#define ADIN1300_EEE_LPABLE_REG			0x8002
+#define ADIN1300_CLOCK_STOP_REG			0x9400
+#define ADIN1300_LPI_WAKE_ERR_CNT_REG		0xa000
+
 #define ADIN1300_GE_RGMII_CFG_REG		0xff23
 #define   ADIN1300_GE_RGMII_RX_MSK		GENMASK(8, 6)
 #define   ADIN1300_GE_RGMII_RX_SEL(x)		\
@@ -103,6 +114,26 @@ static const struct adin_cfg_reg_map adin_rmii_fifo_depths[] = {
 	{ },
 };
 
+/**
+ * struct adin_clause45_mmd_map - map to convert Clause 45 regs to Clause 22
+ * @devad		device address used in Clause 45 access
+ * @cl45_regnum		register address defined by Clause 45
+ * @adin_regnum		equivalent register address accessible via Clause 22
+ */
+struct adin_clause45_mmd_map {
+	int devad;
+	u16 cl45_regnum;
+	u16 adin_regnum;
+};
+
+static struct adin_clause45_mmd_map adin_clause45_mmd_map[] = {
+	{ MDIO_MMD_PCS,	MDIO_PCS_EEE_ABLE,	ADIN1300_EEE_CAP_REG },
+	{ MDIO_MMD_AN,	MDIO_AN_EEE_LPABLE,	ADIN1300_EEE_LPABLE_REG },
+	{ MDIO_MMD_AN,	MDIO_AN_EEE_ADV,	ADIN1300_EEE_ADV_REG },
+	{ MDIO_MMD_PCS,	MDIO_CTRL1,		ADIN1300_CLOCK_STOP_REG },
+	{ MDIO_MMD_PCS, MDIO_PCS_EEE_WK_ERR,	ADIN1300_LPI_WAKE_ERR_CNT_REG },
+};
+
 static int adin_lookup_reg_value(const struct adin_cfg_reg_map *tbl, int cfg)
 {
 	size_t i;
@@ -253,10 +284,33 @@ static int adin_phy_config_intr(struct phy_device *phydev)
 			      ADIN1300_INT_MASK_EN);
 }
 
+static int adin_cl45_to_adin_reg(struct phy_device *phydev, int devad,
+				 u16 cl45_regnum)
+{
+	struct adin_clause45_mmd_map *m;
+	int i;
+
+	if (devad == MDIO_MMD_VEND1)
+		return cl45_regnum;
+
+	for (i = 0; i < ARRAY_SIZE(adin_clause45_mmd_map); i++) {
+		m = &adin_clause45_mmd_map[i];
+		if (m->devad == devad && m->cl45_regnum == cl45_regnum)
+			return m->adin_regnum;
+	}
+
+	phydev_err(phydev,
+		   "No translation available for devad: %d reg: %04x\n",
+		   devad, cl45_regnum);
+
+	return -EINVAL;
+}
+
 static int adin_read_mmd(struct phy_device *phydev, int devad, u16 regnum)
 {
 	struct mii_bus *bus = phydev->mdio.bus;
 	int phy_addr = phydev->mdio.addr;
+	int adin_regnum;
 	int err;
 
 	if (phydev->is_c45) {
@@ -265,7 +319,12 @@ static int adin_read_mmd(struct phy_device *phydev, int devad, u16 regnum)
 		return __mdiobus_read(bus, phy_addr, addr);
 	}
 
-	err = __mdiobus_write(bus, phy_addr, ADIN1300_MII_EXT_REG_PTR, regnum);
+	adin_regnum = adin_cl45_to_adin_reg(phydev, devad, regnum);
+	if (adin_regnum < 0)
+		return adin_regnum;
+
+	err = __mdiobus_write(bus, phy_addr, ADIN1300_MII_EXT_REG_PTR,
+			      adin_regnum);
 	if (err)
 		return err;
 
@@ -277,6 +336,7 @@ static int adin_write_mmd(struct phy_device *phydev, int devad, u16 regnum,
 {
 	struct mii_bus *bus = phydev->mdio.bus;
 	int phy_addr = phydev->mdio.addr;
+	int adin_regnum;
 	int err;
 
 	if (phydev->is_c45) {
@@ -285,7 +345,12 @@ static int adin_write_mmd(struct phy_device *phydev, int devad, u16 regnum,
 		return __mdiobus_write(bus, phy_addr, addr, val);
 	}
 
-	err = __mdiobus_write(bus, phy_addr, ADIN1300_MII_EXT_REG_PTR, regnum);
+	adin_regnum = adin_cl45_to_adin_reg(phydev, devad, regnum);
+	if (adin_regnum < 0)
+		return adin_regnum;
+
+	err = __mdiobus_write(bus, phy_addr, ADIN1300_MII_EXT_REG_PTR,
+			      adin_regnum);
 	if (err)
 		return err;
 
-- 
2.20.1
