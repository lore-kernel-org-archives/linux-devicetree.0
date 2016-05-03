From: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [PATCH 1/2] mtd: nand: omap2: Support parsing dma channel information from DT
Date: Tue,  3 May 2016 12:50:05 -0500
Message-ID: <1462297806-11555-2-git-send-email-fcooper@ti.com>
References: <1462297806-11555-1-git-send-email-fcooper@ti.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1462297806-11555-1-git-send-email-fcooper@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, boris.brezillon@free-electrons.com, richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com, tony@atomide.com, rogerq@ti.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Cc: "Cooper Jr., Franklin" <fcooper@ti.com>
List-Id: devicetree@vger.kernel.org

From: "Cooper Jr., Franklin" <fcooper@ti.com>

Switch from dma_request_channel to allow passing dma channel
information from DT rather than hardcoding a value.

Also provide a handle to the GPMC's dev so it can be used to parse the DMA
channel information within the GPMC's DT node.

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
 drivers/mtd/nand/omap2.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index 08e1588..f864369 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -1922,7 +1922,9 @@ static int omap_nand_probe(struct platform_device *pdev)
 		dma_cap_zero(mask);
 		dma_cap_set(DMA_SLAVE, mask);
 		sig = OMAP24XX_DMA_GPMC;
-		info->dma = dma_request_channel(mask, omap_dma_filter_fn, &sig);
+		info->dma = dma_request_slave_channel_compat(mask,
+			omap_dma_filter_fn, &sig, pdev->dev.parent, "rxtx");
+
 		if (!info->dma) {
 			dev_err(&pdev->dev, "DMA engine request failed\n");
 			err = -ENXIO;
-- 
2.7.0
