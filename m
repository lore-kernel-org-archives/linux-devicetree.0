From: h00249924 <hutenghui@huawei.com>
Subject: [PATCH 1/3] k3dma: Upgrade k3dma drever to support hisi_asp_dma hardware
Date: Fri, 28 Dec 2018 14:36:21 +0800
Message-ID: <1545978983-124360-1-git-send-email-hutenghui@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: suzhuangluan@hisilicon.com, kongfei@hisilicon.com, liyuequan@hisilicon.com, cash.qianli@hisilicon.com, huangli295@hisilicon.com, hantanglei@huawei.com, wangyoulin1@hisilicon.com, ninggaoyu@hisilicon.com, hanxiaolong3@hisilicon.com, Youlin Wang <wwx575822@notesmail.huawei.com>, Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vkoul@kernel.org>
List-Id: devicetree@vger.kernel.org

From: Youlin Wang <wwx575822@notesmail.huawei.com>

There is an new "hisi-pcm-asp-dma-1.0" device added in
"arch/arm64/boot/dts/hisilicon/hi3660.dtsi".
So we have to add a matching id in the driver file:
"{ .compatible = "hisilicon,hisi-pcm-asp-dma-1.0", }"

And also hisi-pcm-asp dma device needs no setting to the clock.
So we skip this by "if" sentence on id string matching:
"if (strcasecmp((of_id->compatible), (k3_pdma_dt_ids[0].compatible)) == 0)"

After above this driver will support both k3 and hisi_asp dma hardware.

Signed-off-by: Youlin Wang <wwx575822@notesmail.huawei.com>
Signed-off-by: Tanglei Han <hantanglei@huawei.com>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Vinod Koul <vkoul@kernel.org>
---
 drivers/dma/k3dma.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/k3dma.c b/drivers/dma/k3dma.c
index fdec2b6..10eecc2 100644
--- a/drivers/dma/k3dma.c
+++ b/drivers/dma/k3dma.c
@@ -792,6 +792,7 @@ static int k3_dma_transfer_resume(struct dma_chan *chan)
 
 static const struct of_device_id k3_pdma_dt_ids[] = {
 	{ .compatible = "hisilicon,k3-dma-1.0", },
+	{ .compatible = "hisilicon,hisi-pcm-asp-dma-1.0", },
 	{}
 };
 MODULE_DEVICE_TABLE(of, k3_pdma_dt_ids);
@@ -835,10 +836,12 @@ static int k3_dma_probe(struct platform_device *op)
 				"dma-requests", &d->dma_requests);
 	}
 
-	d->clk = devm_clk_get(&op->dev, NULL);
-	if (IS_ERR(d->clk)) {
-		dev_err(&op->dev, "no dma clk\n");
-		return PTR_ERR(d->clk);
+	if (strcasecmp((of_id->compatible), (k3_pdma_dt_ids[0].compatible)) == 0) {
+		d->clk = devm_clk_get(&op->dev, NULL);
+		if (IS_ERR(d->clk)) {
+			dev_err(&op->dev, "no dma clk\n");
+			return PTR_ERR(d->clk);
+		}
 	}
 
 	irq = platform_get_irq(op, 0);
-- 
1.9.1
