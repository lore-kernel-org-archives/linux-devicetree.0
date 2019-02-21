From: Baolin Wang <baolin.wang@linaro.org>
Subject: [PATCH v2 2/2] dmaengine: sprd: Change channel id to slave id for DMA cell specifier
Date: Thu, 21 Feb 2019 13:34:41 +0800
Message-ID: <c37545bd4e98f2811ee3589baae9378349bdb0a6.1550719757.git.baolin.wang@linaro.org>
References: <652a8ef9554890c254823ec39858b8d7413fd561.1550719757.git.baolin.wang@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <652a8ef9554890c254823ec39858b8d7413fd561.1550719757.git.baolin.wang@linaro.org>
In-Reply-To: <652a8ef9554890c254823ec39858b8d7413fd561.1550719757.git.baolin.wang@linaro.org>
References: <652a8ef9554890c254823ec39858b8d7413fd561.1550719757.git.baolin.wang@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: vkoul@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, arnd@arndb.de
Cc: orsonzhai@gmail.com, zhang.lyra@gmail.com, dan.j.williams@intel.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, eric.long@unisoc.com, broonie@kernel.org, baolin.wang@linaro.org
List-Id: devicetree@vger.kernel.org

We will describe the slave id in DMA cell specifier instead of DMA channel
id, thus we should save the slave id from DMA engine translation function,
and remove the channel id validation.

Meanwhile we do not need set default slave id in sprd_dma_alloc_chan_resources(),
remove it.

Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
---
Changes from v1:
 - Remove channel id from DT.
---
 drivers/dma/sprd-dma.c |   19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/drivers/dma/sprd-dma.c b/drivers/dma/sprd-dma.c
index e2f0167..48431e2 100644
--- a/drivers/dma/sprd-dma.c
+++ b/drivers/dma/sprd-dma.c
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
@@ -1021,13 +1013,10 @@ static void sprd_dma_free_desc(struct virt_dma_desc *vd)
 static bool sprd_dma_filter_fn(struct dma_chan *chan, void *param)
 {
 	struct sprd_dma_chn *schan = to_sprd_dma_chan(chan);
-	struct sprd_dma_dev *sdev = to_sprd_dma_dev(&schan->vc.chan);
-	u32 req = *(u32 *)param;
+	u32 slave_id = *(u32 *)param;
 
-	if (req < sdev->total_chns)
-		return req == schan->chn_num + 1;
-	else
-		return false;
+	schan->dev_id = slave_id;
+	return true;
 }
 
 static int sprd_dma_probe(struct platform_device *pdev)
-- 
1.7.9.5
