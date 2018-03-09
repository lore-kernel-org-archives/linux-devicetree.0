Return-Path: <SRS0=Pv+M=F7=ni.com=prvs=26060a5556=brad.mouring@kernel.org>
From: Brad Mouring <brad.mouring@ni.com>
Subject: [PATCH v2 net-next 1/3] net: macb: Reorganize macb_mii bringup
Date: Fri, 9 Mar 2018 16:12:31 -0600
Message-ID: <20180309221233.71202-1-brad.mouring@ni.com>
In-Reply-To: <20180308173247.GA22340@lunn.ch>
References: <20180308173247.GA22340@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain
To: Nicolas Ferre <nicolas.ferre@microchip.com>, Rob Herring <robh+dt@kernel.org>, "David S . Miller" <davem@davemloft.net>, "Michael Grzeschik  <m.grzeschik@pengutronix.de>, Andrew Lunn" <andrew@lunn.ch>
Cc: Mark Rutland <mark.rutland@arm.com>, netdev@vger.kernel.org, "Julia Cartwright  <julia@ni.com>, <devicetree@vger.kernel.org>, Brad Mouring" <brad.mouring@ni.com>
List-ID: <devicetree@vger.kernel.org>

The macb mii setup (mii_probe() and mii_init()) previously was
somewhat interspersed, likely a result of organic growth and hacking.

This change moves mii bus registration into mii_init and probing the
bus for devices into mii_probe.

Signed-off-by: Brad Mouring <brad.mouring@ni.com>
Suggested-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/ethernet/cadence/macb_main.c | 89 ++++++++++++++++----------------
 1 file changed, 45 insertions(+), 44 deletions(-)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index e84afcf1ecb5..7b69a291ab7a 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -470,10 +470,48 @@ static void macb_handle_link_change(struct net_device *dev)
 static int macb_mii_probe(struct net_device *dev)
 {
 	struct macb *bp = netdev_priv(dev);
-	struct macb_platform_data *pdata;
+	struct macb_platform_data *pdata = dev_get_platdata(&bp->pdev->dev);
 	struct phy_device *phydev;
+	struct device_node *np = bp->pdev->dev.of_node;
 	int phy_irq;
-	int ret;
+	int ret, i;
+
+	if (np) {
+		if (of_phy_is_fixed_link(np)) {
+			if (of_phy_register_fixed_link(np) < 0) {
+				dev_err(&bp->pdev->dev,
+					"broken fixed-link specification\n");
+				return -ENODEV;
+			}
+			bp->phy_node = of_node_get(np);
+		} else {
+			/* fallback to standard phy registration if no phy were
+			 * found during dt phy registration
+			 */
+			if (!phy_find_first(bp->mii_bus)) {
+				for (i = 0; i < PHY_MAX_ADDR; i++) {
+					struct phy_device *phydev;
+
+					phydev = mdiobus_scan(bp->mii_bus, i);
+					if (IS_ERR(phydev) &&
+					    PTR_ERR(phydev) != -ENODEV) {
+						ret = PTR_ERR(phydev);
+						break;
+					}
+				}
+
+				if (ret)
+					return -ENODEV;
+			}
+		}
+	} else {
+		for (i = 0; i < PHY_MAX_ADDR; i++)
+			bp->mii_bus->irq[i] = PHY_POLL;
+
+		if (pdata)
+			bp->mii_bus->phy_mask = pdata->phy_mask;
+
+	}
 
 	if (bp->phy_node) {
 		phydev = of_phy_connect(dev, bp->phy_node,
@@ -488,7 +526,6 @@ static int macb_mii_probe(struct net_device *dev)
 			return -ENXIO;
 		}
 
-		pdata = dev_get_platdata(&bp->pdev->dev);
 		if (pdata) {
 			if (gpio_is_valid(pdata->phy_irq_pin)) {
 				ret = devm_gpio_request(&bp->pdev->dev,
@@ -533,7 +570,7 @@ static int macb_mii_init(struct macb *bp)
 {
 	struct macb_platform_data *pdata;
 	struct device_node *np;
-	int err = -ENXIO, i;
+	int err;
 
 	/* Enable management port */
 	macb_writel(bp, NCR, MACB_BIT(MPE));
@@ -556,46 +593,10 @@ static int macb_mii_init(struct macb *bp)
 	dev_set_drvdata(&bp->dev->dev, bp->mii_bus);
 
 	np = bp->pdev->dev.of_node;
-	if (np) {
-		if (of_phy_is_fixed_link(np)) {
-			if (of_phy_register_fixed_link(np) < 0) {
-				dev_err(&bp->pdev->dev,
-					"broken fixed-link specification\n");
-				goto err_out_unregister_bus;
-			}
-			bp->phy_node = of_node_get(np);
-
-			err = mdiobus_register(bp->mii_bus);
-		} else {
-			/* try dt phy registration */
-			err = of_mdiobus_register(bp->mii_bus, np);
 
-			/* fallback to standard phy registration if no phy were
-			 * found during dt phy registration
-			 */
-			if (!err && !phy_find_first(bp->mii_bus)) {
-				for (i = 0; i < PHY_MAX_ADDR; i++) {
-					struct phy_device *phydev;
-
-					phydev = mdiobus_scan(bp->mii_bus, i);
-					if (IS_ERR(phydev) &&
-					    PTR_ERR(phydev) != -ENODEV) {
-						err = PTR_ERR(phydev);
-						break;
-					}
-				}
-
-				if (err)
-					goto err_out_unregister_bus;
-			}
-		}
+	if (np) {
+		err = of_mdiobus_register(bp->mii_bus, np);
 	} else {
-		for (i = 0; i < PHY_MAX_ADDR; i++)
-			bp->mii_bus->irq[i] = PHY_POLL;
-
-		if (pdata)
-			bp->mii_bus->phy_mask = pdata->phy_mask;
-
 		err = mdiobus_register(bp->mii_bus);
 	}
 
@@ -610,10 +611,10 @@ static int macb_mii_init(struct macb *bp)
 
 err_out_unregister_bus:
 	mdiobus_unregister(bp->mii_bus);
-err_out_free_mdiobus:
-	of_node_put(bp->phy_node);
 	if (np && of_phy_is_fixed_link(np))
 		of_phy_deregister_fixed_link(np);
+err_out_free_mdiobus:
+	of_node_put(bp->phy_node);
 	mdiobus_free(bp->mii_bus);
 err_out:
 	return err;
-- 
2.16.2
