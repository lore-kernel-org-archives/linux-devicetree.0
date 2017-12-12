From: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Subject: [PATCH] of_mdio / mdiobus: ensure mdio devices have fwnode correctly
 populated
Date: Tue, 12 Dec 2017 10:49:15 +0000
Message-ID: <E1eOi7f-0002Rs-K7@rmk-PC.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Ensure that all mdio devices populate the struct device fwnode pointer
as well as the of_node pointer to allow drivers that wish to use
fwnode APIs to work.

Signed-off-by: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
---
 drivers/net/phy/mdio_bus.c | 1 +
 drivers/of/of_mdio.c       | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/net/phy/mdio_bus.c b/drivers/net/phy/mdio_bus.c
index d9a185ed0286..c3458b6de7ca 100644
--- a/drivers/net/phy/mdio_bus.c
+++ b/drivers/net/phy/mdio_bus.c
@@ -270,6 +270,7 @@ static void of_mdiobus_link_mdiodev(struct mii_bus *bus,
 
 		if (addr == mdiodev->addr) {
 			dev->of_node = child;
+			dev->fwnode = of_fwnode_handle(child);
 			return;
 		}
 	}
diff --git a/drivers/of/of_mdio.c b/drivers/of/of_mdio.c
index 98258583abb0..3481e69738b5 100644
--- a/drivers/of/of_mdio.c
+++ b/drivers/of/of_mdio.c
@@ -81,6 +81,7 @@ static int of_mdiobus_register_phy(struct mii_bus *mdio,
 	 * can be looked up later */
 	of_node_get(child);
 	phy->mdio.dev.of_node = child;
+	phy->mdio.dev.fwnode = of_fwnode_handle(child);
 
 	/* All data is now stored in the phy struct;
 	 * register it */
@@ -111,6 +112,7 @@ static int of_mdiobus_register_device(struct mii_bus *mdio,
 	 */
 	of_node_get(child);
 	mdiodev->dev.of_node = child;
+	mdiodev->dev.fwnode = of_fwnode_handle(child);
 
 	/* All data is now stored in the mdiodev struct; register it. */
 	rc = mdio_device_register(mdiodev);
@@ -206,6 +208,7 @@ int of_mdiobus_register(struct mii_bus *mdio, struct device_node *np)
 	mdio->phy_mask = ~0;
 
 	mdio->dev.of_node = np;
+	mdio->dev.fwnode = of_fwnode_handle(np);
 
 	/* Get bus level PHY reset GPIO details */
 	mdio->reset_delay_us = DEFAULT_GPIO_RESET_DELAY;
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
