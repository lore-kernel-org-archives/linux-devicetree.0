From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 01/14] dmaengine: dma-jz4780: Avoid hardcoding number of channels
Date: Tue,  3 Jul 2018 14:32:01 +0200
Message-ID: <20180703123214.23090-2-paul@crapouillou.net>
References: <20180703123214.23090-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180703123214.23090-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Cc: Mathieu Malaterre <malat@debian.org>, Daniel Silsby <dansilsby@gmail.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

As part of the work to support various other Ingenic JZ47xx SoC versions,
which don't feature the same number of DMA channels per core, we now
deduce the number of DMA channels available from the devicetree
compatible string.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/dma/dma-jz4780.c | 53 +++++++++++++++++++++++++++++-----------
 1 file changed, 39 insertions(+), 14 deletions(-)

diff --git a/drivers/dma/dma-jz4780.c b/drivers/dma/dma-jz4780.c
index 85820a2d69d4..b40f491f0367 100644
--- a/drivers/dma/dma-jz4780.c
+++ b/drivers/dma/dma-jz4780.c
@@ -16,6 +16,7 @@
 #include <linux/interrupt.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/of_dma.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
@@ -23,8 +24,6 @@
 #include "dmaengine.h"
 #include "virt-dma.h"
 
-#define JZ_DMA_NR_CHANNELS	32
-
 /* Global registers. */
 #define JZ_DMA_REG_DMAC		0x1000
 #define JZ_DMA_REG_DIRQP	0x1004
@@ -135,14 +134,20 @@ struct jz4780_dma_chan {
 	unsigned int curr_hwdesc;
 };
 
+enum jz_version {
+	ID_JZ4780,
+};
+
 struct jz4780_dma_dev {
 	struct dma_device dma_device;
 	void __iomem *base;
 	struct clk *clk;
 	unsigned int irq;
+	unsigned int nb_channels;
+	enum jz_version version;
 
 	uint32_t chan_reserved;
-	struct jz4780_dma_chan chan[JZ_DMA_NR_CHANNELS];
+	struct jz4780_dma_chan chan[];
 };
 
 struct jz4780_dma_filter_data {
@@ -648,7 +653,7 @@ static irqreturn_t jz4780_dma_irq_handler(int irq, void *data)
 
 	pending = jz4780_dma_readl(jzdma, JZ_DMA_REG_DIRQP);
 
-	for (i = 0; i < JZ_DMA_NR_CHANNELS; i++) {
+	for (i = 0; i < jzdma->nb_channels; i++) {
 		if (!(pending & (1<<i)))
 			continue;
 
@@ -728,7 +733,7 @@ static struct dma_chan *jz4780_of_dma_xlate(struct of_phandle_args *dma_spec,
 	data.channel = dma_spec->args[1];
 
 	if (data.channel > -1) {
-		if (data.channel >= JZ_DMA_NR_CHANNELS) {
+		if (data.channel >= jzdma->nb_channels) {
 			dev_err(jzdma->dma_device.dev,
 				"device requested non-existent channel %u\n",
 				data.channel);
@@ -752,19 +757,45 @@ static struct dma_chan *jz4780_of_dma_xlate(struct of_phandle_args *dma_spec,
 	}
 }
 
+static const unsigned int jz4780_dma_nb_channels[] = {
+	[ID_JZ4780] = 32,
+};
+
+static const struct of_device_id jz4780_dma_dt_match[] = {
+	{ .compatible = "ingenic,jz4780-dma", .data = (void *)ID_JZ4780 },
+	{},
+};
+MODULE_DEVICE_TABLE(of, jz4780_dma_dt_match);
+
 static int jz4780_dma_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	const struct of_device_id *of_id = of_match_device(
+			jz4780_dma_dt_match, dev);
 	struct jz4780_dma_dev *jzdma;
 	struct jz4780_dma_chan *jzchan;
 	struct dma_device *dd;
 	struct resource *res;
+	enum jz_version version;
+	unsigned int nb_channels;
 	int i, ret;
 
-	jzdma = devm_kzalloc(dev, sizeof(*jzdma), GFP_KERNEL);
+	if (of_id)
+		version = (enum jz_version)of_id->data;
+	else
+		version = ID_JZ4780; /* Default when not probed from DT */
+
+	nb_channels = jz4780_dma_nb_channels[version];
+
+	jzdma = devm_kzalloc(dev, sizeof(*jzdma)
+				+ sizeof(*jzdma->chan) * nb_channels,
+				GFP_KERNEL);
 	if (!jzdma)
 		return -ENOMEM;
 
+	jzdma->nb_channels = nb_channels;
+	jzdma->version = version;
+
 	platform_set_drvdata(pdev, jzdma);
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
@@ -839,7 +870,7 @@ static int jz4780_dma_probe(struct platform_device *pdev)
 
 	INIT_LIST_HEAD(&dd->channels);
 
-	for (i = 0; i < JZ_DMA_NR_CHANNELS; i++) {
+	for (i = 0; i < jzdma->nb_channels; i++) {
 		jzchan = &jzdma->chan[i];
 		jzchan->id = i;
 
@@ -884,19 +915,13 @@ static int jz4780_dma_remove(struct platform_device *pdev)
 
 	free_irq(jzdma->irq, jzdma);
 
-	for (i = 0; i < JZ_DMA_NR_CHANNELS; i++)
+	for (i = 0; i < jzdma->nb_channels; i++)
 		tasklet_kill(&jzdma->chan[i].vchan.task);
 
 	dma_async_device_unregister(&jzdma->dma_device);
 	return 0;
 }
 
-static const struct of_device_id jz4780_dma_dt_match[] = {
-	{ .compatible = "ingenic,jz4780-dma", .data = NULL },
-	{},
-};
-MODULE_DEVICE_TABLE(of, jz4780_dma_dt_match);
-
 static struct platform_driver jz4780_dma_driver = {
 	.probe		= jz4780_dma_probe,
 	.remove		= jz4780_dma_remove,
-- 
2.18.0
