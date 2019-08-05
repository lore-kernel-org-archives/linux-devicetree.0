From: Alexandru Ardelean <alexandru.ardelean@analog.com>
Subject: [PATCH 05/16] net: phy: adin: configure RGMII/RMII/MII modes on config
Date: Mon, 5 Aug 2019 19:54:42 +0300
Message-ID: <20190805165453.3989-6-alexandru.ardelean@analog.com>
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

The ADIN1300 chip supports RGMII, RMII & MII modes. Default (if
unconfigured) is RGMII.
This change adds support for configuring these modes via the device
registers.

For RGMII with internal delays (modes RGMII_ID,RGMII_TXID, RGMII_RXID),
the default delay is 2 ns. This can be configurable and will be done in
a subsequent change.

Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
---
 drivers/net/phy/adin.c | 79 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 78 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/adin.c b/drivers/net/phy/adin.c
index 3dd9fe50f4c8..dbdb8f60741c 100644
--- a/drivers/net/phy/adin.c
+++ b/drivers/net/phy/adin.c
@@ -33,14 +33,91 @@
 	 ADIN1300_INT_HW_IRQ_EN)
 #define ADIN1300_INT_STATUS_REG			0x0019
 
+#define ADIN1300_GE_RGMII_CFG_REG		0xff23
+#define   ADIN1300_GE_RGMII_RXID_EN		BIT(2)
+#define   ADIN1300_GE_RGMII_TXID_EN		BIT(1)
+#define   ADIN1300_GE_RGMII_EN			BIT(0)
+
+#define ADIN1300_GE_RMII_CFG_REG		0xff24
+#define   ADIN1300_GE_RMII_EN			BIT(0)
+
+static int adin_config_rgmii_mode(struct phy_device *phydev,
+				  phy_interface_t intf)
+{
+	int reg;
+
+	reg = phy_read_mmd(phydev, MDIO_MMD_VEND1, ADIN1300_GE_RGMII_CFG_REG);
+	if (reg < 0)
+		return reg;
+
+	if (!phy_interface_mode_is_rgmii(intf)) {
+		reg &= ~ADIN1300_GE_RGMII_EN;
+		goto write;
+	}
+
+	reg |= ADIN1300_GE_RGMII_EN;
+
+	if (intf == PHY_INTERFACE_MODE_RGMII_ID ||
+	    intf == PHY_INTERFACE_MODE_RGMII_RXID) {
+		reg |= ADIN1300_GE_RGMII_RXID_EN;
+	} else {
+		reg &= ~ADIN1300_GE_RGMII_RXID_EN;
+	}
+
+	if (intf == PHY_INTERFACE_MODE_RGMII_ID ||
+	    intf == PHY_INTERFACE_MODE_RGMII_TXID) {
+		reg |= ADIN1300_GE_RGMII_TXID_EN;
+	} else {
+		reg &= ~ADIN1300_GE_RGMII_TXID_EN;
+	}
+
+write:
+	return phy_write_mmd(phydev, MDIO_MMD_VEND1,
+			     ADIN1300_GE_RGMII_CFG_REG, reg);
+}
+
+static int adin_config_rmii_mode(struct phy_device *phydev,
+				 phy_interface_t intf)
+{
+	int reg;
+
+	reg = phy_read_mmd(phydev, MDIO_MMD_VEND1, ADIN1300_GE_RMII_CFG_REG);
+	if (reg < 0)
+		return reg;
+
+	if (intf != PHY_INTERFACE_MODE_RMII) {
+		reg &= ~ADIN1300_GE_RMII_EN;
+		goto write;
+	}
+
+	reg |= ADIN1300_GE_RMII_EN;
+
+write:
+	return phy_write_mmd(phydev, MDIO_MMD_VEND1,
+			     ADIN1300_GE_RMII_CFG_REG, reg);
+}
+
 static int adin_config_init(struct phy_device *phydev)
 {
-	int rc;
+	phy_interface_t interface, rc;
 
 	rc = genphy_config_init(phydev);
 	if (rc < 0)
 		return rc;
 
+	interface = phydev->interface;
+
+	rc = adin_config_rgmii_mode(phydev, interface);
+	if (rc < 0)
+		return rc;
+
+	rc = adin_config_rmii_mode(phydev, interface);
+	if (rc < 0)
+		return rc;
+
+	dev_info(&phydev->mdio.dev, "PHY is using mode '%s'\n",
+		 phy_modes(phydev->interface));
+
 	return 0;
 }
 
-- 
2.20.1
