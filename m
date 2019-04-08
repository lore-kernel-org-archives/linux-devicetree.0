From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 2/4] mtd: rawnand: sunxi: Add a platform data structure
Date: Mon,  8 Apr 2019 09:41:45 +0200
Message-ID: <20190408074147.26797-2-miquel.raynal@bootlin.com>
References: <20190408074147.26797-1-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190408074147.26797-1-miquel.raynal@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
List-Id: devicetree@vger.kernel.org

Before the introduction of A33 NAND DMA support, let's use a platform
data structure for parameters that will differ. Right now, there is
only one compatible with one data structure.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---

Changes in v2:
* New patch: splitting the introduction of the A33 NAND DMA support:
  first let's introduce the platform data ("capabilities")
  structure. Then, in a second time, A33 NAND DMA support will be
  introduced.

 drivers/mtd/nand/raw/sunxi_nand.c | 37 ++++++++++++++++++++++++++-----
 1 file changed, 32 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 4282bc477761..7b824c245083 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -42,7 +42,7 @@
 #define NFC_REG_CMD		0x0024
 #define NFC_REG_RCMD_SET	0x0028
 #define NFC_REG_WCMD_SET	0x002C
-#define NFC_REG_IO_DATA		0x0030
+#define NFC_REG_A10_IO_DATA	0x0030
 #define NFC_REG_ECC_CTL		0x0034
 #define NFC_REG_ECC_ST		0x0038
 #define NFC_REG_DEBUG		0x003C
@@ -200,6 +200,18 @@ static inline struct sunxi_nand_chip *to_sunxi_nand(struct nand_chip *nand)
 	return container_of(nand, struct sunxi_nand_chip, nand);
 }
 
+/*
+ * NAND Controller capabilities structure: stores NAND controller capabilities
+ * for distinction between compatible strings.
+ *
+ * @reg_io_data:	I/O data register
+ * @dma_maxburst:	DMA maxburst
+ */
+struct sunxi_nfc_caps {
+	unsigned int reg_io_data;
+	unsigned int dma_maxburst;
+};
+
 /**
  * struct sunxi_nfc - stores sunxi NAND controller information
  *
@@ -228,6 +240,7 @@ struct sunxi_nfc {
 	struct list_head chips;
 	struct completion complete;
 	struct dma_chan *dmac;
+	const struct sunxi_nfc_caps *caps;
 };
 
 static inline struct sunxi_nfc *to_sunxi_nfc(struct nand_controller *ctrl)
@@ -2088,6 +2101,12 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
 		goto out_mod_clk_unprepare;
 	}
 
+	nfc->caps = of_device_get_match_data(&pdev->dev);
+	if (!nfc->caps) {
+		ret = -EINVAL;
+		goto out_ahb_reset_reassert;
+	}
+
 	ret = sunxi_nfc_rst(nfc);
 	if (ret)
 		goto out_ahb_reset_reassert;
@@ -2102,12 +2121,12 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
 	if (nfc->dmac) {
 		struct dma_slave_config dmac_cfg = { };
 
-		dmac_cfg.src_addr = r->start + NFC_REG_IO_DATA;
+		dmac_cfg.src_addr = r->start + nfc->caps->reg_io_data;
 		dmac_cfg.dst_addr = dmac_cfg.src_addr;
 		dmac_cfg.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
 		dmac_cfg.dst_addr_width = dmac_cfg.src_addr_width;
-		dmac_cfg.src_maxburst = 4;
-		dmac_cfg.dst_maxburst = 4;
+		dmac_cfg.src_maxburst = nfc->caps->dma_maxburst;
+		dmac_cfg.dst_maxburst = nfc->caps->dma_maxburst;
 		dmaengine_slave_config(nfc->dmac, &dmac_cfg);
 	} else {
 		dev_warn(dev, "failed to request rxtx DMA channel\n");
@@ -2152,8 +2171,16 @@ static int sunxi_nfc_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct sunxi_nfc_caps sunxi_nfc_a10_caps = {
+	.reg_io_data = NFC_REG_A10_IO_DATA,
+	.dma_maxburst = 4,
+};
+
 static const struct of_device_id sunxi_nfc_ids[] = {
-	{ .compatible = "allwinner,sun4i-a10-nand" },
+	{
+		.compatible = "allwinner,sun4i-a10-nand",
+		.data = &sunxi_nfc_a10_caps,
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, sunxi_nfc_ids);
-- 
2.19.1
