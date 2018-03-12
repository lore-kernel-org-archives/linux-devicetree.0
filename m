Return-Path: <SRS0=BtsV=GC=ni.com=prvs=260901fb48=brad.mouring@kernel.org>
From: Brad Mouring <brad.mouring@ni.com>
Subject: [PATCH v4 net-next 3/4] net: macb: Add phy-handle DT support
Date: Mon, 12 Mar 2018 16:34:34 -0500
Message-ID: <20180312213435.115174-4-brad.mouring@ni.com>
In-Reply-To: <20180312213435.115174-1-brad.mouring@ni.com>
References: <20180312175956.GS27783@lunn.ch>
 <20180312213435.115174-1-brad.mouring@ni.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Nicolas Ferre <nicolas.ferre@microchip.com>, Rob Herring <robh+dt@kernel.org>, "David S . Miller" <davem@davemloft.net>, Michael Grzeschik <m.grzeschik@pengutronix.de>, Andrew Lunn <andrew@lunn.ch>
Cc: Mark Rutland <mark.rutland@arm.com>, netdev@vger.kernel.org, Julia Cartwright <julia@ni.com>, devicetree@vger.kernel.org, Brad Mouring <brad.mouring@ni.com>
List-ID: <devicetree@vger.kernel.org>

This optional binding (as described in the ethernet DT bindings doc)
directs the netdev to the phydev to use. This is useful for a phy
chip that has >1 phy in it, and two netdevs are using the same phy
chip (i.e. the second mac's phy lives on the first mac's MDIO bus)

The devicetree snippet would look something like this:

ethernet@feedf00d {
	...
	phy-handle = <&phy0> // the first netdev is physically wired to phy0
	...
	phy0: phy@0 {
		...
		reg = <0x0> // MDIO address 0
		...
	}
	phy1: phy@1 {
		...
		reg = <0x1> // MDIO address 1
		...
	}
...
}

ethernet@deadbeef {
	...
	phy-handle = <&phy1> // tells the driver to use phy1 on the
						 // first mac's mdio bus (it's wired thusly)
	...
}

The work done to add the phy_node in the first place (dacdbb4dfc1a1:
"net: macb: add fixed-link node support") will consume the
device_node (if found).

Signed-off-by: Brad Mouring <brad.mouring@ni.com>
---
 drivers/net/ethernet/cadence/macb_main.c | 34 ++++++++++++++++++--------------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index db1dc301bed3..4a2ad35d41aa 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -488,23 +488,27 @@ static int macb_mii_probe(struct net_device *dev)
 			}
 			bp->phy_node = of_node_get(np);
 		} else {
-			/* fallback to standard phy registration if no phy were
-			 * found during dt phy registration
-			 */
-			if (!phy_find_first(bp->mii_bus)) {
-				for (i = 0; i < PHY_MAX_ADDR; i++) {
-					struct phy_device *phydev;
-
-					phydev = mdiobus_scan(bp->mii_bus, i);
-					if (IS_ERR(phydev) &&
-					    PTR_ERR(phydev) != -ENODEV) {
-						ret = PTR_ERR(phydev);
-						break;
+			/* attempt to find a phy-handle */
+			if (!(bp->phy_node = of_parse_phandle(np, "phy-handle", 0))) {
+
+				/* fallback to standard phy registration if no phy were
+				 * found during dt phy registration
+				 */
+				if (!phy_find_first(bp->mii_bus)) {
+					for (i = 0; i < PHY_MAX_ADDR; i++) {
+						struct phy_device *phydev;
+	
+						phydev = mdiobus_scan(bp->mii_bus, i);
+						if (IS_ERR(phydev) &&
+						    PTR_ERR(phydev) != -ENODEV) {
+							ret = PTR_ERR(phydev);
+							break;
+						}
 					}
+	
+					if (ret)
+						return -ENODEV;
 				}
-
-				if (ret)
-					return -ENODEV;
 			}
 		}
 	}
-- 
2.16.2
