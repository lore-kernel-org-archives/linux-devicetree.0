From: Guodong Xu <guodong.xu@linaro.org>
Subject: [PATCH 2/3] k3dma: add support to reserved minimum channels
Date: Fri, 22 Jun 2018 11:24:15 +0800
Message-ID: <20180622032416.20133-3-guodong.xu@linaro.org>
References: <20180622032416.20133-1-guodong.xu@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180622032416.20133-1-guodong.xu@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: vkoul@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, dan.j.williams@intel.com
Cc: liyu65@hisilicon.com, suzhuangluan@hisilicon.com, xuhongtao8@hisilicon.com, zhongkaihua@huawei.com, xuezhiliang@hisilicon.com, xupeng7@huawei.com, sunliang10@huawei.com, fengbaopeng@hisilicon.com, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Guodong Xu <guodong.xu@linaro.org>
List-Id: devicetree@vger.kernel.org

From: Li Yu <liyu65@hisilicon.com>

On k3 series of SoC, DMA controller reserves some channels for
other on-chip coprocessors. By adding support to dma_min_chan, kernel
will not be able to use these reserved channels.

One example is on Hi3660 platform, channel 0 is reserved to lpm3.

Please also refer to Documentation/devicetree/bindings/dma/k3dma.txt

Signed-off-by: Li Yu <liyu65@hisilicon.com>
Signed-off-by: Guodong Xu <guodong.xu@linaro.org>
---
 drivers/dma/k3dma.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/k3dma.c b/drivers/dma/k3dma.c
index fa31cccbe04f..13cec12742e3 100644
--- a/drivers/dma/k3dma.c
+++ b/drivers/dma/k3dma.c
@@ -113,6 +113,7 @@ struct k3_dma_dev {
 	struct dma_pool		*pool;
 	u32			dma_channels;
 	u32			dma_requests;
+	u32			dma_min_chan;
 	unsigned int		irq;
 };
 
@@ -309,7 +310,7 @@ static void k3_dma_tasklet(unsigned long arg)
 
 	/* check new channel request in d->chan_pending */
 	spin_lock_irq(&d->lock);
-	for (pch = 0; pch < d->dma_channels; pch++) {
+	for (pch = d->dma_min_chan; pch < d->dma_channels; pch++) {
 		p = &d->phy[pch];
 
 		if (p->vchan == NULL && !list_empty(&d->chan_pending)) {
@@ -326,7 +327,7 @@ static void k3_dma_tasklet(unsigned long arg)
 	}
 	spin_unlock_irq(&d->lock);
 
-	for (pch = 0; pch < d->dma_channels; pch++) {
+	for (pch = d->dma_min_chan; pch < d->dma_channels; pch++) {
 		if (pch_alloc & (1 << pch)) {
 			p = &d->phy[pch];
 			c = p->vchan;
@@ -825,6 +826,8 @@ static int k3_dma_probe(struct platform_device *op)
 				"dma-channels", &d->dma_channels);
 		of_property_read_u32((&op->dev)->of_node,
 				"dma-requests", &d->dma_requests);
+		of_property_read_u32((&op->dev)->of_node,
+				"dma-min-chan", &d->dma_min_chan);
 	}
 
 	d->clk = devm_clk_get(&op->dev, NULL);
@@ -848,12 +851,12 @@ static int k3_dma_probe(struct platform_device *op)
 		return -ENOMEM;
 
 	/* init phy channel */
-	d->phy = devm_kcalloc(&op->dev,
-		d->dma_channels, sizeof(struct k3_dma_phy), GFP_KERNEL);
+	d->phy = devm_kcalloc(&op->dev, (d->dma_channels - d->dma_min_chan),
+			sizeof(struct k3_dma_phy), GFP_KERNEL);
 	if (d->phy == NULL)
 		return -ENOMEM;
 
-	for (i = 0; i < d->dma_channels; i++) {
+	for (i = d->dma_min_chan; i < d->dma_channels; i++) {
 		struct k3_dma_phy *p = &d->phy[i];
 
 		p->idx = i;
-- 
2.17.1
