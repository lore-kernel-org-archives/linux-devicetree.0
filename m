From: Alexandru Ardelean <alexandru.ardelean@analog.com>
Subject: [PATCH v4 10/14] net: phy: adin: implement PHY subsystem software reset
Date: Mon, 12 Aug 2019 14:23:46 +0300
Message-ID: <20190812112350.15242-11-alexandru.ardelean@analog.com>
References: <20190812112350.15242-1-alexandru.ardelean@analog.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190812112350.15242-1-alexandru.ardelean@analog.com>
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

As it turns out, phylib already supports GPIO reset.
In case this is configured, the PHY driver won't do anything. In case it
isn't specified the subsystem software reset will kick in.

Resetting via GeSftRst or via GPIO is useful when doing a warm reboot,
because this will reset the subsystem registers to default values.

Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
---
 drivers/net/phy/adin.c | 43 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/drivers/net/phy/adin.c b/drivers/net/phy/adin.c
index a0f8b616bcb7..ddf0512a9a4d 100644
--- a/drivers/net/phy/adin.c
+++ b/drivers/net/phy/adin.c
@@ -6,6 +6,7 @@
  */
 #include <linux/kernel.h>
 #include <linux/bitfield.h>
+#include <linux/delay.h>
 #include <linux/errno.h>
 #include <linux/init.h>
 #include <linux/module.h>
@@ -51,6 +52,9 @@
 #define ADIN1300_CLOCK_STOP_REG			0x9400
 #define ADIN1300_LPI_WAKE_ERR_CNT_REG		0xa000
 
+#define ADIN1300_GE_SOFT_RESET_REG		0xff0c
+#define   ADIN1300_GE_SOFT_RESET		BIT(0)
+
 #define ADIN1300_GE_RGMII_CFG_REG		0xff23
 #define   ADIN1300_GE_RGMII_RX_MSK		GENMASK(8, 6)
 #define   ADIN1300_GE_RGMII_RX_SEL(x)		\
@@ -443,11 +447,49 @@ static int adin_read_status(struct phy_device *phydev)
 	return genphy_read_status(phydev);
 }
 
+static int adin_subsytem_soft_reset(struct phy_device *phydev)
+{
+	int reg, rc, i;
+
+	rc = phy_set_bits_mmd(phydev, MDIO_MMD_VEND1,
+			      ADIN1300_GE_SOFT_RESET_REG,
+			      ADIN1300_GE_SOFT_RESET);
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
+	/* If there is a reset GPIO just exit */
+	if (!IS_ERR_OR_NULL(phydev->mdio.reset_gpio))
+		return 0;
+
+	/* Reset PHY core regs & subsystem regs */
+	return adin_subsytem_soft_reset(phydev);
+}
+
+static int adin_probe(struct phy_device *phydev)
+{
+	return adin_reset(phydev);
+}
+
 static struct phy_driver adin_driver[] = {
 	{
 		PHY_ID_MATCH_MODEL(PHY_ID_ADIN1200),
 		.name		= "ADIN1200",
 		.config_init	= adin_config_init,
+		.probe		= adin_probe,
 		.config_aneg	= adin_config_aneg,
 		.read_status	= adin_read_status,
 		.ack_interrupt	= adin_phy_ack_intr,
@@ -461,6 +503,7 @@ static struct phy_driver adin_driver[] = {
 		PHY_ID_MATCH_MODEL(PHY_ID_ADIN1300),
 		.name		= "ADIN1300",
 		.config_init	= adin_config_init,
+		.probe		= adin_probe,
 		.config_aneg	= adin_config_aneg,
 		.read_status	= adin_read_status,
 		.ack_interrupt	= adin_phy_ack_intr,
-- 
2.20.1
