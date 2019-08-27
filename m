From: Yash Shah <yash.shah@sifive.com>
Subject: [PATCH v2 2/2] macb: Update compatibility string for SiFive FU540-C000
Date: Tue, 27 Aug 2019 10:36:04 +0530
Message-ID: <1566882364-23891-3-git-send-email-yash.shah@sifive.com>
References: <1566882364-23891-1-git-send-email-yash.shah@sifive.com>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1566882364-23891-1-git-send-email-yash.shah@sifive.com>
Sender: netdev-owner@vger.kernel.org
To: davem@davemloft.net, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, nicolas.ferre@microchip.com, palmer@sifive.com, paul.walmsley@sifive.com, ynezz@true.cz, sachin.ghadi@sifive.com, Yash Shah <yash.shah@sifive.com>
List-Id: devicetree@vger.kernel.org

Update the compatibility string for SiFive FU540-C000 as per the new
string updated in the binding doc.
Reference:
https://lore.kernel.org/netdev/CAJ2_jOFEVZQat0Yprg4hem4jRrqkB72FKSeQj4p8P5KA-+rgww@mail.gmail.com/

Signed-off-by: Yash Shah <yash.shah@sifive.com>
Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
Reviewed-by: Paul Walmsley <paul.walmsley@sifive.com>
Tested-by: Paul Walmsley <paul.walmsley@sifive.com>
---
 drivers/net/ethernet/cadence/macb_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index 5ca17e6..35b59b5 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -4154,7 +4154,7 @@ static int fu540_c000_init(struct platform_device *pdev)
 	{ .compatible = "cdns,emac", .data = &emac_config },
 	{ .compatible = "cdns,zynqmp-gem", .data = &zynqmp_config},
 	{ .compatible = "cdns,zynq-gem", .data = &zynq_config },
-	{ .compatible = "sifive,fu540-macb", .data = &fu540_c000_config },
+	{ .compatible = "sifive,fu540-c000-gem", .data = &fu540_c000_config },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, macb_dt_ids);
-- 
1.9.1
