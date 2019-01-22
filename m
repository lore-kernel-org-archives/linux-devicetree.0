From: Baolin Wang <baolin.wang@linaro.org>
Subject: [PATCH 2/3] dmaengine: sprd: Add new DMA engine translation function
Date: Tue, 22 Jan 2019 21:20:52 +0800
Message-ID: <529bc30b34a14bf7849fc852c7cbff34dee47aaa.1548158832.git.baolin.wang@linaro.org>
References: <a9718ae1e97a5911f47874fe23c00ef297d7fed8.1548158832.git.baolin.wang@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <a9718ae1e97a5911f47874fe23c00ef297d7fed8.1548158832.git.baolin.wang@linaro.org>
In-Reply-To: <a9718ae1e97a5911f47874fe23c00ef297d7fed8.1548158832.git.baolin.wang@linaro.org>
References: <a9718ae1e97a5911f47874fe23c00ef297d7fed8.1548158832.git.baolin.wang@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: vkoul@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: arnd@arndb.de, olof@lixom.net, orsonzhai@gmail.com, zhang.lyra@gmail.com, dan.j.williams@intel.com, devicetree@vger.kernel.org, arm@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, eric.long@unisoc.com, broonie@kernel.org, baolin.wang@linaro.org
List-Id: devicetree@vger.kernel.org

Add new DMA engine translation function to get the hardware slave id
of the corresponding DMA engine channel. Meanwhile we do not need
to set default slave id in sprd_dma_alloc_chan_resources(), remove it.

Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
---
 drivers/dma/sprd-dma.c |   49 ++++++++++++++++++++++++++++--------------------
 1 file changed, 29 insertions(+), 20 deletions(-)

diff --git a/drivers/dma/sprd-dma.c b/drivers/dma/sprd-dma.c
index e2f0167..7d180bb 100644
--- a/drivers/dma/sprd-dma.c
+++ b/drivers/dma/sprd-dma.c
@@ -204,9 +204,9 @@ struct sprd_dma_dev {
 	struct sprd_dma_chn	channels[0];
 };
 
-static bool sprd_dma_filter_fn(struct dma_chan *chan, void *param);
-static struct of_dma_filter_info sprd_dma_info = {
-	.filter_fn = sprd_dma_filter_fn,
+struct sprd_dma_filter_param {
+	u32 chn_id;
+	u32 slave_id;
 };
 
 static inline struct sprd_dma_chn *to_sprd_dma_chan(struct dma_chan *c)
@@ -580,15 +580,7 @@ static irqreturn_t dma_irq_handle(int irq, void *dev_id)
 
 static int sprd_dma_alloc_chan_resources(struct dma_chan *chan)
 {
-	struct sprd_dma_chn *schan = to_sprd_dma_chan(chan);
-	int ret;
-
-	ret = pm_runtime_get_sync(chan->device->dev);
-	if (ret < 0)
-		return ret;
-
-	schan->dev_id = SPRD_DMA_SOFTWARE_UID;
-	return 0;
+	return pm_runtime_get_sync(chan->device->dev);
 }
 
 static void sprd_dma_free_chan_resources(struct dma_chan *chan)
@@ -1022,12 +1014,31 @@ static bool sprd_dma_filter_fn(struct dma_chan *chan, void *param)
 {
 	struct sprd_dma_chn *schan = to_sprd_dma_chan(chan);
 	struct sprd_dma_dev *sdev = to_sprd_dma_dev(&schan->vc.chan);
-	u32 req = *(u32 *)param;
+	struct sprd_dma_filter_param *sparam = param;
 
-	if (req < sdev->total_chns)
-		return req == schan->chn_num + 1;
-	else
-		return false;
+	if (sparam->chn_id < sdev->total_chns &&
+	    sparam->chn_id == schan->chn_num + 1) {
+		schan->dev_id = sparam->slave_id;
+		return true;
+	}
+
+	return false;
+}
+
+static struct dma_chan *sprd_dma_xlate(struct of_phandle_args *dma_spec,
+				       struct of_dma *ofdma)
+{
+	struct sprd_dma_dev *sdev = ofdma->of_dma_data;
+	dma_cap_mask_t mask = sdev->dma_dev.cap_mask;
+	struct sprd_dma_filter_param param;
+
+	if (dma_spec->args_count != 2)
+		return NULL;
+
+	param.chn_id = dma_spec->args[0];
+	param.slave_id = dma_spec->args[1];
+
+	return dma_request_channel(mask, sprd_dma_filter_fn, &param);
 }
 
 static int sprd_dma_probe(struct platform_device *pdev)
@@ -1133,9 +1144,7 @@ static int sprd_dma_probe(struct platform_device *pdev)
 		goto err_register;
 	}
 
-	sprd_dma_info.dma_cap = sdev->dma_dev.cap_mask;
-	ret = of_dma_controller_register(np, of_dma_simple_xlate,
-					 &sprd_dma_info);
+	ret = of_dma_controller_register(np, sprd_dma_xlate, sdev);
 	if (ret)
 		goto err_of_register;
 
-- 
1.7.9.5
