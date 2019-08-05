From: Alexandru Ardelean <alexandru.ardelean@analog.com>
Subject: [PATCH 08/16] net: phy: adin: make RMII fifo depth configurable
Date: Mon, 5 Aug 2019 19:54:45 +0300
Message-ID: <20190805165453.3989-9-alexandru.ardelean@analog.com>
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

The FIFO depth can be configured for the RMII mode. This change adds
support for doing this via device-tree (or ACPI).

Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
---
 drivers/net/phy/adin.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/net/phy/adin.c b/drivers/net/phy/adin.c
index cb96d47d457e..2e27ffd403b4 100644
--- a/drivers/net/phy/adin.c
+++ b/drivers/net/phy/adin.c
@@ -49,6 +49,9 @@
 #define   ADIN1300_GE_RGMII_EN			BIT(0)
 
 #define ADIN1300_GE_RMII_CFG_REG		0xff24
+#define   ADIN1300_GE_RMII_FIFO_DEPTH_MSK	GENMASK(6, 4)
+#define   ADIN1300_GE_RMII_FIFO_DEPTH_SEL(x)	\
+		FIELD_PREP(ADIN1300_GE_RMII_FIFO_DEPTH_MSK, x)
 #define   ADIN1300_GE_RMII_EN			BIT(0)
 
 static int adin_get_phy_internal_mode(struct phy_device *phydev)
@@ -142,6 +145,8 @@ static int adin_config_rgmii_mode(struct phy_device *phydev,
 static int adin_config_rmii_mode(struct phy_device *phydev,
 				 phy_interface_t intf)
 {
+	struct device *dev = &phydev->mdio.dev;
+	u32 val;
 	int reg;
 
 	reg = phy_read_mmd(phydev, MDIO_MMD_VEND1, ADIN1300_GE_RMII_CFG_REG);
@@ -155,6 +160,12 @@ static int adin_config_rmii_mode(struct phy_device *phydev,
 
 	reg |= ADIN1300_GE_RMII_EN;
 
+	if (device_property_read_u32(dev, "adi,fifo-depth", &val))
+		val = ADIN1300_RMII_8_BITS;
+
+	reg &= ~ADIN1300_GE_RMII_FIFO_DEPTH_MSK;
+	reg |= ADIN1300_GE_RMII_FIFO_DEPTH_SEL(val);
+
 write:
 	return phy_write_mmd(phydev, MDIO_MMD_VEND1,
 			     ADIN1300_GE_RMII_CFG_REG, reg);
-- 
2.20.1
