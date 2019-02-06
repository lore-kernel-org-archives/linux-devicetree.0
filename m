From: Nicolas Ferre <nicolas.ferre@microchip.com>
Subject: [PATCH v2 3/3] net: macb: add sam9x60-macb compatibility string
Date: Wed, 6 Feb 2019 18:56:10 +0100
Message-ID: <20190206175610.26773-3-nicolas.ferre@microchip.com>
References: <20190206175610.26773-1-nicolas.ferre@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190206175610.26773-1-nicolas.ferre@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Ludovic Desroches <ludovic.desroches@microchip.com>, linux-arm-kernel@lists.infradead.org, "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>
List-Id: devicetree@vger.kernel.org

Add a new compatibility string for this product. It's using
at91sam9260-macb layout but has a newer hardware revision: it's safer
to use its own string.

Signed-off-by: Nicolas Ferre <nicolas.ferre@microchip.com>
---
v2: applies on top of next-20190206

 drivers/net/ethernet/cadence/macb_main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index 2b2882615e8b..eaabe8c278ec 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -3943,6 +3943,7 @@ static const struct of_device_id macb_dt_ids[] = {
 	{ .compatible = "cdns,np4-macb", .data = &np4_config },
 	{ .compatible = "cdns,pc302-gem", .data = &pc302gem_config },
 	{ .compatible = "cdns,gem", .data = &pc302gem_config },
+	{ .compatible = "cdns,sam9x60-macb", .data = &at91sam9260_config },
 	{ .compatible = "atmel,sama5d2-gem", .data = &sama5d2_config },
 	{ .compatible = "atmel,sama5d3-gem", .data = &sama5d3_config },
 	{ .compatible = "atmel,sama5d3-macb", .data = &sama5d3macb_config },
-- 
2.17.1
