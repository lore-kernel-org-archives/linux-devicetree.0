From: Alexandru Ardelean <alexandru.ardelean@analog.com>
Subject: [PATCH 04/16] net: phy: adin: add {write,read}_mmd hooks
Date: Mon, 5 Aug 2019 19:54:41 +0300
Message-ID: <20190805165453.3989-5-alexandru.ardelean@analog.com>
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

Both ADIN1200 & ADIN1300 support Clause 45 access.
The Extended Management Interface (EMI) registers are accessible via both
Clause 45 (at register MDIO_MMD_VEND1) and using Clause 22.

However, the Clause 22 MMD access operations differ from the implementation
in the kernel, in the sense that it uses registers ExtRegPtr (0x10) &
ExtRegData (0x11) to access Clause 45 & EMI registers.

The indirect access is done via the following mechanism (for both R/W):
1. Write the address of the register in the ExtRegPtr
2. Read/write the value of the register (written at ExtRegPtr)

This mechanism is needed to manage configuration of chip settings and to
access EEE registers (via Clause 22).

Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
---
 drivers/net/phy/adin.c | 46 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/net/phy/adin.c b/drivers/net/phy/adin.c
index b75c723bda79..3dd9fe50f4c8 100644
--- a/drivers/net/phy/adin.c
+++ b/drivers/net/phy/adin.c
@@ -14,6 +14,9 @@
 #define PHY_ID_ADIN1200				0x0283bc20
 #define PHY_ID_ADIN1300				0x0283bc30
 
+#define ADIN1300_MII_EXT_REG_PTR		0x10
+#define ADIN1300_MII_EXT_REG_DATA		0x11
+
 #define ADIN1300_INT_MASK_REG			0x0018
 #define   ADIN1300_INT_MDIO_SYNC_EN		BIT(9)
 #define   ADIN1300_INT_ANEG_STAT_CHNG_EN	BIT(8)
@@ -63,6 +66,45 @@ static int adin_phy_config_intr(struct phy_device *phydev)
 			      ADIN1300_INT_MASK_EN);
 }
 
+static int adin_read_mmd(struct phy_device *phydev, int devad, u16 regnum)
+{
+	struct mii_bus *bus = phydev->mdio.bus;
+	int phy_addr = phydev->mdio.addr;
+	int err;
+
+	if (phydev->is_c45) {
+		u32 addr = MII_ADDR_C45 | (devad << 16) | (regnum & 0xffff);
+
+		return __mdiobus_read(bus, phy_addr, addr);
+	}
+
+	err = __mdiobus_write(bus, phy_addr, ADIN1300_MII_EXT_REG_PTR, regnum);
+	if (err)
+		return err;
+
+	return __mdiobus_read(bus, phy_addr, ADIN1300_MII_EXT_REG_DATA);
+}
+
+static int adin_write_mmd(struct phy_device *phydev, int devad, u16 regnum,
+			  u16 val)
+{
+	struct mii_bus *bus = phydev->mdio.bus;
+	int phy_addr = phydev->mdio.addr;
+	int err;
+
+	if (phydev->is_c45) {
+		u32 addr = MII_ADDR_C45 | (devad << 16) | (regnum & 0xffff);
+
+		return __mdiobus_write(bus, phy_addr, addr, val);
+	}
+
+	err = __mdiobus_write(bus, phy_addr, ADIN1300_MII_EXT_REG_PTR, regnum);
+	if (err)
+		return err;
+
+	return __mdiobus_write(bus, phy_addr, ADIN1300_MII_EXT_REG_DATA, val);
+}
+
 static struct phy_driver adin_driver[] = {
 	{
 		.phy_id		= PHY_ID_ADIN1200,
@@ -77,6 +119,8 @@ static struct phy_driver adin_driver[] = {
 		.config_intr	= adin_phy_config_intr,
 		.resume		= genphy_resume,
 		.suspend	= genphy_suspend,
+		.read_mmd	= adin_read_mmd,
+		.write_mmd	= adin_write_mmd,
 	},
 	{
 		.phy_id		= PHY_ID_ADIN1300,
@@ -91,6 +135,8 @@ static struct phy_driver adin_driver[] = {
 		.config_intr	= adin_phy_config_intr,
 		.resume		= genphy_resume,
 		.suspend	= genphy_suspend,
+		.read_mmd	= adin_read_mmd,
+		.write_mmd	= adin_write_mmd,
 	},
 };
 
-- 
2.20.1
