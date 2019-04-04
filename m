From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 2/3] mtd: rawnand: sunxi: Add DMA support for sun8i
Date: Thu,  4 Apr 2019 18:21:10 +0200
Message-ID: <20190404162111.22618-3-miquel.raynal@bootlin.com>
References: <20190404162111.22618-1-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190404162111.22618-1-miquel.raynal@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Vignesh Raghavendra <vigneshr@ti.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Allwinner NAND controllers can make use of DMA to enhance the I/O
throughput thanks to ECC pipelining. DMA handling with sun8i NAND IP
is a bit different than with the older SoCs, hence the introduction of
a new compatible to handle:
* the differences between register offsets,
* the burst length change from 4 to minimum 8,
* drive SRAM accesses through the AHB bus instead of the MBUS.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 75 ++++++++++++++++++++++++++++---
 1 file changed, 68 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 4282bc477761..49cd5067adaa 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -42,7 +42,8 @@
 #define NFC_REG_CMD		0x0024
 #define NFC_REG_RCMD_SET	0x0028
 #define NFC_REG_WCMD_SET	0x002C
-#define NFC_REG_IO_DATA		0x0030
+#define NFC_REG_A10_IO_DATA	0x0030
+#define NFC_REG_A33_IO_DATA	0x0300
 #define NFC_REG_ECC_CTL		0x0034
 #define NFC_REG_ECC_ST		0x0038
 #define NFC_REG_DEBUG		0x003C
@@ -200,6 +201,22 @@ static inline struct sunxi_nand_chip *to_sunxi_nand(struct nand_chip *nand)
 	return container_of(nand, struct sunxi_nand_chip, nand);
 }
 
+/*
+ * NAND Controller capabilities structure: stores NAND controller capabilities
+ * for distinction between compatible strings.
+ *
+ * @sram_through_ahb:	On A33, we choose to access the internal RAM through AHB
+ *                      instead of MBUS (less configuration). A10+ use the MBUS
+ *                      but no extra configuration is needed.
+ * @reg_io_data:	I/O data register
+ * @dma_maxburst:	DMA maxburst
+ */
+struct sunxi_nfc_caps {
+	bool sram_through_ahb;
+	unsigned int reg_io_data;
+	unsigned int dma_maxburst;
+};
+
 /**
  * struct sunxi_nfc - stores sunxi NAND controller information
  *
@@ -228,6 +245,7 @@ struct sunxi_nfc {
 	struct list_head chips;
 	struct completion complete;
 	struct dma_chan *dmac;
+	const struct sunxi_nfc_caps *caps;
 };
 
 static inline struct sunxi_nfc *to_sunxi_nfc(struct nand_controller *ctrl)
@@ -350,10 +368,29 @@ static int sunxi_nfc_dma_op_prepare(struct sunxi_nfc *nfc, const void *buf,
 		goto err_unmap_buf;
 	}
 
-	writel(readl(nfc->regs + NFC_REG_CTL) | NFC_RAM_METHOD,
-	       nfc->regs + NFC_REG_CTL);
+	/*
+	 * On A33, we suppose the "internal RAM" (p.12 of the user manual)
+	 * refers to the NAND controller's internal SRAM. This memory is mapped
+	 * and so is accessible from the AHB. It seems that it can also be
+	 * accessed by the MBUS. MBUS accesses are mandatory when using the
+	 * internal DMA instead of the external DMA engine.
+	 *
+	 * During DMA I/O operation, either we access this memory from the AHB
+	 * by clearing the NFC_RAM_METHOD bit, or we set the bit and use the
+	 * MBUS. In this case, we should also configure the MBUS DMA length
+	 * NFC_REG_MDMA_CNT(0xC4) to be chunksize * nchunks. NAND I/O over MBUS
+	 * are also limited to 32kiB pages.
+	 */
+	if (nfc->caps->sram_through_ahb)
+		writel(readl(nfc->regs + NFC_REG_CTL) & ~NFC_RAM_METHOD,
+		       nfc->regs + NFC_REG_CTL);
+	else
+		writel(readl(nfc->regs + NFC_REG_CTL) | NFC_RAM_METHOD,
+		       nfc->regs + NFC_REG_CTL);
+
 	writel(nchunks, nfc->regs + NFC_REG_SECTOR_NUM);
 	writel(chunksize, nfc->regs + NFC_REG_CNT);
+
 	dmat = dmaengine_submit(dmad);
 
 	ret = dma_submit_error(dmat);
@@ -2088,6 +2125,12 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
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
@@ -2102,12 +2145,12 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
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
@@ -2152,8 +2195,26 @@ static int sunxi_nfc_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct sunxi_nfc_caps sunxi_nfc_a10_caps = {
+	.reg_io_data = NFC_REG_A10_IO_DATA,
+	.dma_maxburst = 4,
+};
+
+static const struct sunxi_nfc_caps sunxi_nfc_a33_caps = {
+	.sram_through_ahb = true,
+	.reg_io_data = NFC_REG_A33_IO_DATA,
+	.dma_maxburst = 8,
+};
+
 static const struct of_device_id sunxi_nfc_ids[] = {
-	{ .compatible = "allwinner,sun4i-a10-nand" },
+	{
+		.compatible = "allwinner,sun4i-a10-nand",
+		.data = &sunxi_nfc_a10_caps,
+	},
+	{
+		.compatible = "allwinner,sun8i-a33-nand-controller",
+		.data = &sunxi_nfc_a33_caps,
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, sunxi_nfc_ids);
-- 
2.19.1
