Return-Path: <SRS0=BtsV=GC=ni.com=prvs=260901fb48=brad.mouring@kernel.org>
From: Brad Mouring <brad.mouring@ni.com>
Subject: [PATCH v3 net-next 3/4] net: macb: Add phy-handle DT support
Date: Mon, 12 Mar 2018 12:10:00 -0500
Message-ID: <20180312171001.129209-4-brad.mouring@ni.com>
In-Reply-To: <20180312171001.129209-1-brad.mouring@ni.com>
References: <20180310161718.GC29174@lunn.ch>
 <20180312171001.129209-1-brad.mouring@ni.com>
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
 drivers/net/ethernet/cadence/macb_main.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index db1dc301bed3..b0700a531f3e 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -488,6 +488,9 @@ static int macb_mii_probe(struct net_device *dev)
 			}
 			bp->phy_node = of_node_get(np);
 		} else {
+			/* attempt to find a phy-handle */
+			bp->phy_node = of_parse_phandle(np, "phy-handle", 0);
+
 			/* fallback to standard phy registration if no phy were
 			 * found during dt phy registration
 			 */
-- 
2.16.2
