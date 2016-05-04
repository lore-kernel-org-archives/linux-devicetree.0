From: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [PATCH v2 1/2] mtd: nand: omap2: Support parsing dma channel information from DT
Date: Wed,  4 May 2016 13:34:43 -0500
Message-ID: <1462386884-16380-2-git-send-email-fcooper@ti.com>
References: <1462386884-16380-1-git-send-email-fcooper@ti.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1462386884-16380-1-git-send-email-fcooper@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, boris.brezillon@free-electrons.com, richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com, rogerq@ti.com, tony@atomide.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, vigneshr@ti.com, nsekhar@ti.com
Cc: Franklin S Cooper Jr <fcooper@ti.com>
List-Id: devicetree@vger.kernel.org

Switch from dma_request_channel to allow passing dma channel
information from DT rather than hardcoding a value.

Also provide a handle to the GPMC's dev so it can be used to parse the DMA
channel information within the GPMC's DT node.

Performance Numbers via mtd_speedtest now that EDMA based prefetch works:

AM335x Performance numbers:
DMA
  CPULOAD Write: 54%  Read: 35%
  page write speed	-23% (vs non dma)
  page read speed	-35% (vs non dma)

NO DMA (prefetch-polled)
  CPULOAD Write: 98%  Read: 98%

AM437x Performance numbers:
DMA
  CPU LOAD Write: 56% Read: 36%
  page write speed	-16% (vs non dma)
  page read speed	-22% (vs non dma)

NO DMA (prefetch-polled)
  CPULOAD Write: 93%  Read: 93%

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
 drivers/mtd/nand/omap2.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index 08e1588..83b9091 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -118,8 +118,6 @@
 #define	PREFETCH_STATUS_FIFO_CNT(val)	((val >> 24) & 0x7F)
 #define	STATUS_BUFF_EMPTY		0x00000001
 
-#define OMAP24XX_DMA_GPMC		4
-
 #define SECTOR_BYTES		512
 /* 4 bit padding to make byte aligned, 56 = 52 + 4 */
 #define BCH4_BIT_PAD		4
@@ -1808,7 +1806,6 @@ static int omap_nand_probe(struct platform_device *pdev)
 	struct nand_chip		*nand_chip;
 	int				err;
 	dma_cap_mask_t			mask;
-	unsigned			sig;
 	struct resource			*res;
 	struct device			*dev = &pdev->dev;
 	int				min_oobbytes = BADBLOCK_MARKER_LENGTH;
@@ -1921,8 +1918,8 @@ static int omap_nand_probe(struct platform_device *pdev)
 	case NAND_OMAP_PREFETCH_DMA:
 		dma_cap_zero(mask);
 		dma_cap_set(DMA_SLAVE, mask);
-		sig = OMAP24XX_DMA_GPMC;
-		info->dma = dma_request_channel(mask, omap_dma_filter_fn, &sig);
+		info->dma = dma_request_chan(pdev->dev.parent, "rxtx");
+
 		if (!info->dma) {
 			dev_err(&pdev->dev, "DMA engine request failed\n");
 			err = -ENXIO;
-- 
2.7.0
