From: =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Subject: [PATCH 1/5] mtd: onenand/samsung: Unify resource order for controller variants
Date: Fri, 26 Apr 2019 18:42:20 +0200
Message-ID: <20190426164224.11327-2-pawel.mikolaj.chmiel@gmail.com>
References: <20190426164224.11327-1-pawel.mikolaj.chmiel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190426164224.11327-1-pawel.mikolaj.chmiel@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: kyungmin.park@samsung.com
Cc: bbrezillon@kernel.org, miquel.raynal@bootlin.com, richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>, =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
List-Id: devicetree@vger.kernel.org

From: Tomasz Figa <tomasz.figa@gmail.com>

Before this patch, the order of memory resources requested by the driver
was controller base as first and OneNAND chip base as second for
S3C64xx/S5PC100 variant and the opposite for S5PC110/S5PV210 variant.

To make this more consistent, this patch swaps the order of resources
for the latter and updates platform code accordingly. As a nice side
effect there is a slight reduction in line count of probe function.

Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
Signed-off-by: Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com>
---
 drivers/mtd/nand/onenand/samsung.c | 48 ++++++++++++++----------------
 1 file changed, 22 insertions(+), 26 deletions(-)

diff --git a/drivers/mtd/nand/onenand/samsung.c b/drivers/mtd/nand/onenand/samsung.c
index e64d0fdf7eb5..a425f19a3876 100644
--- a/drivers/mtd/nand/onenand/samsung.c
+++ b/drivers/mtd/nand/onenand/samsung.c
@@ -126,14 +126,13 @@ struct s3c_onenand {
 	struct mtd_info	*mtd;
 	struct platform_device	*pdev;
 	enum soc_type	type;
-	void __iomem	*base;
-	void __iomem	*ahb_addr;
+	void __iomem	*ctrl_base;
+	void __iomem	*chip_base;
 	int		bootram_command;
 	void		*page_buf;
 	void		*oob_buf;
 	unsigned int	(*mem_addr)(int fba, int fpa, int fsa);
 	unsigned int	(*cmd_map)(unsigned int type, unsigned int val);
-	void __iomem	*dma_addr;
 	unsigned long	phys_base;
 	struct completion	complete;
 };
@@ -147,22 +146,22 @@ static struct s3c_onenand *onenand;
 
 static inline int s3c_read_reg(int offset)
 {
-	return readl(onenand->base + offset);
+	return readl(onenand->ctrl_base + offset);
 }
 
 static inline void s3c_write_reg(int value, int offset)
 {
-	writel(value, onenand->base + offset);
+	writel(value, onenand->ctrl_base + offset);
 }
 
 static inline int s3c_read_cmd(unsigned int cmd)
 {
-	return readl(onenand->ahb_addr + cmd);
+	return readl(onenand->chip_base + cmd);
 }
 
 static inline void s3c_write_cmd(int value, unsigned int cmd)
 {
-	writel(value, onenand->ahb_addr + cmd);
+	writel(value, onenand->chip_base + cmd);
 }
 
 #ifdef SAMSUNG_DEBUG
@@ -519,7 +518,7 @@ static int (*s5pc110_dma_ops)(dma_addr_t dst, dma_addr_t src, size_t count, int
 
 static int s5pc110_dma_poll(dma_addr_t dst, dma_addr_t src, size_t count, int direction)
 {
-	void __iomem *base = onenand->dma_addr;
+	void __iomem *base = onenand->ctrl_base;
 	int status;
 	unsigned long timeout;
 
@@ -563,7 +562,7 @@ static int s5pc110_dma_poll(dma_addr_t dst, dma_addr_t src, size_t count, int di
 
 static irqreturn_t s5pc110_onenand_irq(int irq, void *data)
 {
-	void __iomem *base = onenand->dma_addr;
+	void __iomem *base = onenand->ctrl_base;
 	int status, cmd = 0;
 
 	status = readl(base + S5PC110_INTC_DMA_STATUS);
@@ -585,7 +584,7 @@ static irqreturn_t s5pc110_onenand_irq(int irq, void *data)
 
 static int s5pc110_dma_irq(dma_addr_t dst, dma_addr_t src, size_t count, int direction)
 {
-	void __iomem *base = onenand->dma_addr;
+	void __iomem *base = onenand->ctrl_base;
 	int status;
 
 	status = readl(base + S5PC110_INTC_DMA_MASK);
@@ -634,7 +633,7 @@ static int s5pc110_read_bufferram(struct mtd_info *mtd, int area,
 	}
 
 	if (offset & 3 || (size_t) buf & 3 ||
-		!onenand->dma_addr || count != mtd->writesize)
+		!onenand->ctrl_base || count != mtd->writesize)
 		goto normal;
 
 	/* Handle vmalloc address */
@@ -864,23 +863,22 @@ static int s3c_onenand_probe(struct platform_device *pdev)
 	s3c_onenand_setup(mtd);
 
 	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	onenand->base = devm_ioremap_resource(&pdev->dev, r);
-	if (IS_ERR(onenand->base))
-		return PTR_ERR(onenand->base);
-
+	onenand->ctrl_base = devm_ioremap_resource(&pdev->dev, r);
+	if (IS_ERR(onenand->ctrl_base))
+		return PTR_ERR(onenand->ctrl_base);
+
+	r = platform_get_resource(pdev, IORESOURCE_MEM, 1);
+	onenand->chip_base = devm_ioremap_resource(&pdev->dev, r);
+	if (IS_ERR(onenand->chip_base))
+		return PTR_ERR(onenand->chip_base);
 	onenand->phys_base = r->start;
 
-	/* Set onenand_chip also */
-	this->base = onenand->base;
-
 	/* Use runtime badblock check */
 	this->options |= ONENAND_SKIP_UNLOCK_CHECK;
 
 	if (onenand->type != TYPE_S5PC110) {
-		r = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-		onenand->ahb_addr = devm_ioremap_resource(&pdev->dev, r);
-		if (IS_ERR(onenand->ahb_addr))
-			return PTR_ERR(onenand->ahb_addr);
+		/* Set onenand_chip also */
+		this->base = onenand->ctrl_base;
 
 		/* Allocate 4KiB BufferRAM */
 		onenand->page_buf = devm_kzalloc(&pdev->dev, SZ_4K,
@@ -898,10 +896,8 @@ static int s3c_onenand_probe(struct platform_device *pdev)
 		this->subpagesize = mtd->writesize;
 
 	} else { /* S5PC110 */
-		r = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-		onenand->dma_addr = devm_ioremap_resource(&pdev->dev, r);
-		if (IS_ERR(onenand->dma_addr))
-			return PTR_ERR(onenand->dma_addr);
+		/* Set onenand_chip also */
+		this->base = onenand->chip_base;
 
 		s5pc110_dma_ops = s5pc110_dma_poll;
 		/* Interrupt support */
-- 
2.20.1
