Return-Path: <SRS0=BtsV=GC=ni.com=prvs=260901fb48=brad.mouring@kernel.org>
From: Brad Mouring <brad.mouring@ni.com>
Subject: [PATCH v3 net-next 2/4] net: macb: Remove redundant poll irq assignment
Date: Mon, 12 Mar 2018 12:09:59 -0500
Message-ID: <20180312171001.129209-3-brad.mouring@ni.com>
In-Reply-To: <20180312171001.129209-1-brad.mouring@ni.com>
References: <20180310161718.GC29174@lunn.ch>
 <20180312171001.129209-1-brad.mouring@ni.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Nicolas Ferre <nicolas.ferre@microchip.com>, Rob Herring <robh+dt@kernel.org>, "David S . Miller" <davem@davemloft.net>, "Michael Grzeschik  <m.grzeschik@pengutronix.de>, Andrew Lunn" <andrew@lunn.ch>
Cc: Mark Rutland <mark.rutland@arm.com>, netdev@vger.kernel.org, "Julia Cartwright  <julia@ni.com>, <devicetree@vger.kernel.org>, Brad Mouring" <brad.mouring@ni.com>
List-ID: <devicetree@vger.kernel.org>

In phy_device's general probe, this device will already be set for
phy register polling, rendering this code redundant.

Signed-off-by: Brad Mouring <brad.mouring@ni.com>
Suggested-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/ethernet/cadence/macb_main.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index 9b6195fbbf8e..db1dc301bed3 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
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
