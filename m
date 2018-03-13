Return-Path: <SRS0=NcRe=GD=ni.com=prvs=261051e907=brad.mouring@kernel.org>
From: Brad Mouring <brad.mouring@ni.com>
Subject: [PATCH v5 net-next 2/4] net: macb: Remove redundant poll irq assignment
Date: Tue, 13 Mar 2018 16:32:14 -0500
Message-ID: <20180313213216.109153-3-brad.mouring@ni.com>
In-Reply-To: <20180313213216.109153-1-brad.mouring@ni.com>
References: <88aa8148-bf57-86a0-8f0d-fae7191865a6@gmail.com>
 <20180313213216.109153-1-brad.mouring@ni.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Nicolas Ferre <nicolas.ferre@microchip.com>, Rob Herring <robh+dt@kernel.org>, "David S . Miller" <davem@davemloft.net>, "Michael Grzeschik  <m.grzeschik@pengutronix.de>, Andrew Lunn" <andrew@lunn.ch>
Cc: Mark Rutland <mark.rutland@arm.com>, netdev@vger.kernel.org, "Julia Cartwright  <julia@ni.com>, <devicetree@vger.kernel.org>, Brad Mouring" <brad.mouring@ni.com>
List-ID: <devicetree@vger.kernel.org>

In phy_device's general probe, this device will already be set for
phy register polling, rendering this code redundant.

Signed-off-by: Brad Mouring <brad.mouring@ni.com>
Suggested-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/net/ethernet/cadence/macb_main.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index 4b514c705e57..db1dc301bed3 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -566,7 +566,7 @@ static int macb_mii_init(struct macb *bp)
 {
 	struct macb_platform_data *pdata;
 	struct device_node *np;
-	int err, i;
+	int err;
 
 	/* Enable management port */
 	macb_writel(bp, NCR, MACB_BIT(MPE));
@@ -593,9 +593,6 @@ static int macb_mii_init(struct macb *bp)
 	if (np) {
 		err = of_mdiobus_register(bp->mii_bus, np);
 	} else {
-		for (i = 0; i < PHY_MAX_ADDR; i++)
-			bp->mii_bus->irq[i] = PHY_POLL;
-
 		if (pdata)
 			bp->mii_bus->phy_mask = pdata->phy_mask;
 
-- 
2.16.2
