From: Alexandru Ardelean <alexandru.ardelean@analog.com>
Subject: [PATCH 1/2] net: stmmac: implement support for passive mode converters via dt
Date: Fri, 6 Sep 2019 16:02:55 +0300
Message-ID: <20190906130256.10321-1-alexandru.ardelean@analog.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: davem@davemloft.net, robh+dt@kernel.org, peppe.cavallaro@st.com, alexandre.torgue@st.com, --cc=andrew@lunn.ch, Alexandru Ardelean <alexandru.ardelean@analog.com>
List-Id: devicetree@vger.kernel.org

In-between the MAC & PHY there can be a mode converter, which converts one
mode to another (e.g. GMII-to-RGMII).

The converter, can be passive (i.e. no driver or OS/SW information
required), so the MAC & PHY need to be configured differently.

For the `stmmac` driver, this is implemented via a `mac-mode` property in
the device-tree, which configures the MAC into a certain mode, and for the
PHY a `phy_interface` field will hold the mode of the PHY. The mode of the
PHY will be passed to the PHY and from there-on it work in a different
mode. If unspecified, the default `phy-mode` will be used for both.

Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  2 +-
 .../ethernet/stmicro/stmmac/stmmac_platform.c | 34 ++++++++++++++++++-
 include/linux/stmmac.h                        |  1 +
 3 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index c3baca9f587b..ec7aa42128a5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1029,7 +1029,7 @@ static int stmmac_init_phy(struct net_device *dev)
 static int stmmac_phy_setup(struct stmmac_priv *priv)
 {
 	struct fwnode_handle *fwnode = of_fwnode_handle(priv->plat->phylink_node);
-	int mode = priv->plat->interface;
+	int mode = priv->plat->phy_interface;
 	struct phylink *phylink;
 
 	priv->phylink_config.dev = &priv->dev->dev;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index eaf8f08f2e91..401cbbfc06f0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -355,6 +355,32 @@ static int stmmac_dt_phy(struct plat_stmmacenet_data *plat,
 	return 0;
 }
 
+/**
+ * stmmac_of_get_mac_mode - retrieves the interface of the MAC
+ * @np - device-tree node
+ * Description:
+ * Similar to `of_get_phy_mode()`, this function will retrieve (from
+ * the device-tree) the interface mode on the MAC side. This assumes
+ * that there is mode converter in-between the MAC & PHY
+ * (e.g. GMII-to-RGMII).
+ */
+static int stmmac_of_get_mac_mode(struct device_node *np)
+{
+	const char *pm;
+	int err, i;
+
+	err = of_property_read_string(np, "mac-mode", &pm);
+	if (err < 0)
+		return err;
+
+	for (i = 0; i < PHY_INTERFACE_MODE_MAX; i++) {
+		if (!strcasecmp(pm, phy_modes(i)))
+			return i;
+	}
+
+	return -ENODEV;
+}
+
 /**
  * stmmac_probe_config_dt - parse device-tree driver parameters
  * @pdev: platform_device structure
@@ -383,7 +409,13 @@ stmmac_probe_config_dt(struct platform_device *pdev, const char **mac)
 		*mac = NULL;
 	}
 
-	plat->interface = of_get_phy_mode(np);
+	plat->phy_interface = of_get_phy_mode(np);
+	if (plat->phy_interface < 0)
+		return ERR_PTR(plat->phy_interface);
+
+	plat->interface = stmmac_of_get_mac_mode(np);
+	if (plat->interface < 0)
+		plat->interface = plat->phy_interface;
 
 	/* Some wrapper drivers still rely on phy_node. Let's save it while
 	 * they are not converted to phylink. */
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 7ad7ae35cf88..dc60d03c4b60 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -131,6 +131,7 @@ struct plat_stmmacenet_data {
 	int bus_id;
 	int phy_addr;
 	int interface;
+	int phy_interface;
 	struct stmmac_mdio_bus_data *mdio_bus_data;
 	struct device_node *phy_node;
 	struct device_node *phylink_node;
-- 
2.20.1
