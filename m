From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: [PATCH 4/5] ata: arasan: remove the need for platform_data
Date: Mon, 28 Jan 2013 17:57:36 +0000
Message-ID: <1359395857-1235-5-git-send-email-arnd@arndb.de>
References: <1359395857-1235-1-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1359395857-1235-1-git-send-email-arnd-r2nGTMty4D4@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: linux-arm-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Vinod Koul <vinod.koul-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Viresh Kumar <viresh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Jeff Garzik <jgarzik-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This adds a complete DT binding for the arasan device driver. There is
currently only one user, which is the spear13xx platform, so we don't
actually have to parse all the properties until another user comes in,
but this does use the generic DMA binding to find the DMA channel.

The patch is untested so far and is part of a series to convert
the spear platform over to use the generic DMA binding, so it
should stay with the rest of the series.

Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Viresh Kumar <viresh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Jeff Garzik <jgarzik-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
---
 .../devicetree/bindings/ata/pata-arasan.txt        | 22 +++++++++++++++
 drivers/ata/pata_arasan_cf.c                       | 31 +++++++++++++---------
 include/linux/pata_arasan_cf_data.h                |  2 --
 3 files changed, 41 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/ata/pata-arasan.txt b/Documentation/devicetree/bindings/ata/pata-arasan.txt
index 95ec7f8..2aff154 100644
--- a/Documentation/devicetree/bindings/ata/pata-arasan.txt
+++ b/Documentation/devicetree/bindings/ata/pata-arasan.txt
@@ -6,6 +6,26 @@ Required properties:
 - interrupt-parent: Should be the phandle for the interrupt controller
   that services interrupts for this device
 - interrupt: Should contain the CF interrupt number
+- clock-frequency: Interface clock rate, in Hz, one of
+       25000000
+       33000000
+       40000000
+       50000000
+       66000000
+       75000000
+      100000000
+      125000000
+      150000000
+      166000000
+      200000000
+
+Optional properties:
+- arasan,broken-udma: if present, UDMA mode is unusable
+- arasan,broken-mwdma: if present, MWDMA mode is unusable
+- arasan,broken-pio: if present, PIO mode is unusable
+- dmas: one DMA channel, as described in bindings/dma/dma.txt
+  required unless both UDMA and MWDMA mode are broken
+- dma-names: the corresponding channel name, must be "data"
 
 Example:
 
@@ -14,4 +34,6 @@ Example:
 		reg = <0xfc000000 0x1000>;
 		interrupt-parent = <&vic1>;
 		interrupts = <12>;
+		dmas = <&dma-controller 23>;
+		dma-names = "data";
 	};
diff --git a/drivers/ata/pata_arasan_cf.c b/drivers/ata/pata_arasan_cf.c
index 405022d..42d3195 100644
--- a/drivers/ata/pata_arasan_cf.c
+++ b/drivers/ata/pata_arasan_cf.c
@@ -209,8 +209,6 @@ struct arasan_cf_dev {
 	struct dma_chan *dma_chan;
 	/* Mask for DMA transfers */
 	dma_cap_mask_t mask;
-	/* dma channel private data */
-	void *dma_priv;
 	/* DMA transfer work */
 	struct work_struct work;
 	/* DMA delayed finish work */
@@ -308,6 +306,7 @@ static void cf_card_detect(struct arasan_cf_dev *acdev, bool hotplugged)
 static int cf_init(struct arasan_cf_dev *acdev)
 {
 	struct arasan_cf_pdata *pdata = dev_get_platdata(acdev->host->dev);
+	unsigned int if_clk;
 	unsigned long flags;
 	int ret = 0;
 
@@ -325,8 +324,12 @@ static int cf_init(struct arasan_cf_dev *acdev)
 
 	spin_lock_irqsave(&acdev->host->lock, flags);
 	/* configure CF interface clock */
-	writel((pdata->cf_if_clk <= CF_IF_CLK_200M) ? pdata->cf_if_clk :
-			CF_IF_CLK_166M, acdev->vbase + CLK_CFG);
+	/* TODO: read from device tree */
+	if_clk = CF_IF_CLK_166M;
+	if (pdata && pdata->cf_if_clk <= CF_IF_CLK_200M)
+		if_clk = pdata->cf_if_clk;
+
+	writel(if_clk, acdev->vbase + CLK_CFG);
 
 	writel(TRUE_IDE_MODE | CFHOST_ENB, acdev->vbase + OP_MODE);
 	cf_interrupt_enable(acdev, CARD_DETECT_IRQ, 1);
@@ -530,8 +533,7 @@ static void data_xfer(struct work_struct *work)
 
 	/* request dma channels */
 	/* dma_request_channel may sleep, so calling from process context */
-	acdev->dma_chan = dma_request_channel(acdev->mask, filter,
-			acdev->dma_priv);
+	acdev->dma_chan = dma_request_slave_channel(acdev->dev, "data");
 	if (!acdev->dma_chan) {
 		dev_err(acdev->host->dev, "Unable to get dma_chan\n");
 		goto chan_request_fail;
@@ -798,6 +800,7 @@ static int arasan_cf_probe(struct platform_device *pdev)
 	struct ata_host *host;
 	struct ata_port *ap;
 	struct resource *res;
+	u32 quirk;
 	irq_handler_t irq_handler = NULL;
 	int ret = 0;
 
@@ -817,12 +820,17 @@ static int arasan_cf_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	}
 
+	if (pdata)
+		quirk = pdata->quirk;
+	else
+		quirk = CF_BROKEN_UDMA; /* as it is on spear1340 */
+
 	/* if irq is 0, support only PIO */
 	acdev->irq = platform_get_irq(pdev, 0);
 	if (acdev->irq)
 		irq_handler = arasan_cf_interrupt;
 	else
-		pdata->quirk |= CF_BROKEN_MWDMA | CF_BROKEN_UDMA;
+		quirk |= CF_BROKEN_MWDMA | CF_BROKEN_UDMA;
 
 	acdev->pbase = res->start;
 	acdev->vbase = devm_ioremap_nocache(&pdev->dev, res->start,
@@ -859,17 +867,16 @@ static int arasan_cf_probe(struct platform_device *pdev)
 	INIT_WORK(&acdev->work, data_xfer);
 	INIT_DELAYED_WORK(&acdev->dwork, delayed_finish);
 	dma_cap_set(DMA_MEMCPY, acdev->mask);
-	acdev->dma_priv = pdata->dma_priv;
 
 	/* Handle platform specific quirks */
-	if (pdata->quirk) {
-		if (pdata->quirk & CF_BROKEN_PIO) {
+	if (quirk) {
+		if (quirk & CF_BROKEN_PIO) {
 			ap->ops->set_piomode = NULL;
 			ap->pio_mask = 0;
 		}
-		if (pdata->quirk & CF_BROKEN_MWDMA)
+		if (quirk & CF_BROKEN_MWDMA)
 			ap->mwdma_mask = 0;
-		if (pdata->quirk & CF_BROKEN_UDMA)
+		if (quirk & CF_BROKEN_UDMA)
 			ap->udma_mask = 0;
 	}
 	ap->flags |= ATA_FLAG_PIO_POLLING | ATA_FLAG_NO_ATAPI;
diff --git a/include/linux/pata_arasan_cf_data.h b/include/linux/pata_arasan_cf_data.h
index a7b4fc3..3cc21c9 100644
--- a/include/linux/pata_arasan_cf_data.h
+++ b/include/linux/pata_arasan_cf_data.h
@@ -37,8 +37,6 @@ struct arasan_cf_pdata {
 	#define CF_BROKEN_PIO			(1)
 	#define CF_BROKEN_MWDMA			(1 << 1)
 	#define CF_BROKEN_UDMA			(1 << 2)
-	/* This is platform specific data for the DMA controller */
-	void *dma_priv;
 };
 
 static inline void
-- 
1.8.0
