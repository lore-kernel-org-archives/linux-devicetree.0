From: Alexandru Ardelean <alexandru.ardelean@analog.com>
Subject: [PATCH 06/16] net: phy: adin: support PHY mode converters
Date: Mon, 5 Aug 2019 19:54:43 +0300
Message-ID: <20190805165453.3989-7-alexandru.ardelean@analog.com>
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

Sometimes, the connection between a MAC and PHY is done via a
mode/interface converter. An example is a GMII-to-RGMII converter, which
would mean that the MAC operates in GMII mode while the PHY operates in
RGMII. In this case there is a discrepancy between what the MAC expects &
what the PHY expects and both need to be configured in their respective
modes.

Sometimes, this converter is specified via a board/system configuration (in
the device-tree for example). But, other times it can be left unspecified.
The use of these converters is common in boards that have FPGA on them.

This patch also adds support for a `adi,phy-mode-internal` property that
can be used in these (implicit convert) cases. The internal PHY mode will
be used to specify the correct register settings for the PHY.

`fwnode_handle` is used, since this property may be specified via ACPI as
well in other setups, but testing has been done in DT context.

Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
---
 drivers/net/phy/adin.c | 39 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 36 insertions(+), 3 deletions(-)

diff --git a/drivers/net/phy/adin.c b/drivers/net/phy/adin.c
index dbdb8f60741c..e3d2ff8cc09c 100644
--- a/drivers/net/phy/adin.c
+++ b/drivers/net/phy/adin.c
@@ -10,6 +10,7 @@
 #include <linux/module.h>
 #include <linux/mii.h>
 #include <linux/phy.h>
+#include <linux/property.h>
 
 #define PHY_ID_ADIN1200				0x0283bc20
 #define PHY_ID_ADIN1300				0x0283bc30
@@ -41,6 +42,31 @@
 #define ADIN1300_GE_RMII_CFG_REG		0xff24
 #define   ADIN1300_GE_RMII_EN			BIT(0)
 
+static int adin_get_phy_internal_mode(struct phy_device *phydev)
+{
+	struct device *dev = &phydev->mdio.dev;
+	const char *pm;
+	int i;
+
+	if (device_property_read_string(dev, "adi,phy-mode-internal", &pm))
+		return phydev->interface;
+
+	/**
+	 * Getting here assumes that there is converter in-between the actual
+	 * PHY, for example a GMII-to-RGMII converter. In this case the MAC
+	 * talks GMII and PHY talks RGMII, so the PHY needs to be set in RGMII
+	 * while the MAC can work in GMII mode.
+	 */
+
+	for (i = 0; i < PHY_INTERFACE_MODE_MAX; i++)
+		if (!strcasecmp(pm, phy_modes(i)))
+			return i;
+
+	dev_err(dev, "Invalid value for 'phy-mode-internal': '%s'\n", pm);
+
+	return -EINVAL;
+}
+
 static int adin_config_rgmii_mode(struct phy_device *phydev,
 				  phy_interface_t intf)
 {
@@ -105,7 +131,9 @@ static int adin_config_init(struct phy_device *phydev)
 	if (rc < 0)
 		return rc;
 
-	interface = phydev->interface;
+	interface = adin_get_phy_internal_mode(phydev);
+	if (interface < 0)
+		return interface;
 
 	rc = adin_config_rgmii_mode(phydev, interface);
 	if (rc < 0)
@@ -115,8 +143,13 @@ static int adin_config_init(struct phy_device *phydev)
 	if (rc < 0)
 		return rc;
 
-	dev_info(&phydev->mdio.dev, "PHY is using mode '%s'\n",
-		 phy_modes(phydev->interface));
+	if (phydev->interface == interface)
+		dev_info(&phydev->mdio.dev, "PHY is using mode '%s'\n",
+			 phy_modes(phydev->interface));
+	else
+		dev_info(&phydev->mdio.dev,
+			 "PHY is using mode '%s', MAC is using mode '%s'\n",
+			 phy_modes(interface), phy_modes(phydev->interface));
 
 	return 0;
 }
-- 
2.20.1
