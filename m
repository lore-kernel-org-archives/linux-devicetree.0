From: Moritz Fischer <moritz.fischer@ettus.com>
Subject: [PATCH net-next 2/3] net: nixge: Add support for fixed-link configurations
Date: Mon,  4 Feb 2019 09:30:39 -0800
Message-ID: <20190204173040.5538-3-moritz.fischer@ettus.com>
References: <20190204173040.5538-1-moritz.fischer@ettus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190204173040.5538-1-moritz.fischer@ettus.com>
Sender: linux-kernel-owner@vger.kernel.org
To: netdev@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, alex.williams@ni.com, andrew@lunn.ch, robh+dt@kernel.org, davem@davemloft.net, moritz.fischer@ettus.com, Moritz Fischer <mdf@kernel.org>
List-Id: devicetree@vger.kernel.org

From: Moritz Fischer <mdf@kernel.org>

Add support for fixed-link configurations to nixge driver.

Signed-off-by: Moritz Fischer <mdf@kernel.org>
---
 drivers/net/ethernet/ni/nixge.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/ni/nixge.c b/drivers/net/ethernet/ni/nixge.c
index c8dd1e4c759d..96f7a9818294 100644
--- a/drivers/net/ethernet/ni/nixge.c
+++ b/drivers/net/ethernet/ni/nixge.c
@@ -1282,9 +1282,9 @@ static int nixge_of_get_resources(struct platform_device *pdev)
 
 static int nixge_probe(struct platform_device *pdev)
 {
+	struct device_node *mn, *phy_node;
 	struct nixge_priv *priv;
 	struct net_device *ndev;
-	struct device_node *mn;
 	const u8 *mac_addr;
 	int err;
 
@@ -1353,21 +1353,30 @@ static int nixge_probe(struct platform_device *pdev)
 		goto unregister_mdio;
 	}
 
-	priv->phy_node = of_parse_phandle(pdev->dev.of_node, "phy-handle", 0);
-	if (!priv->phy_node) {
-		netdev_err(ndev, "not find \"phy-handle\" property\n");
-		err = -EINVAL;
-		goto unregister_mdio;
+	phy_node = of_parse_phandle(pdev->dev.of_node, "phy-handle", 0);
+	if (!phy_node && of_phy_is_fixed_link(pdev->dev.of_node)) {
+		err = of_phy_register_fixed_link(pdev->dev.of_node);
+		if (err < 0) {
+			netdev_err(ndev, "broken fixed-link specification\n");
+			goto unregister_mdio;
+		}
+		phy_node = of_node_get(pdev->dev.of_node);
 	}
+	priv->phy_node = phy_node;
 
 	err = register_netdev(priv->ndev);
 	if (err) {
 		netdev_err(ndev, "register_netdev() error (%i)\n", err);
-		goto unregister_mdio;
+		goto free_phy;
 	}
 
 	return 0;
 
+free_phy:
+	if (of_phy_is_fixed_link(pdev->dev.of_node))
+		of_phy_deregister_fixed_link(pdev->dev.of_node);
+	of_node_put(phy_node);
+
 unregister_mdio:
 	if (priv->mii_bus)
 		mdiobus_unregister(priv->mii_bus);
@@ -1385,6 +1394,10 @@ static int nixge_remove(struct platform_device *pdev)
 
 	unregister_netdev(ndev);
 
+	if (of_phy_is_fixed_link(pdev->dev.of_node))
+		of_phy_deregister_fixed_link(pdev->dev.of_node);
+	of_node_put(priv->phy_node);
+
 	if (priv->mii_bus)
 		mdiobus_unregister(priv->mii_bus);
 
-- 
2.20.1
