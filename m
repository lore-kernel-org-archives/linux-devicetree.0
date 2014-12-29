From: Nicholas Mc Guire <der.herr@hofr.at>
Subject: [PATCH] mtd: fsmc_nand: fix handling of wait_for_completion_timeout result
Date: Mon, 29 Dec 2014 06:30:51 -0500
Message-ID: <1419852651-4706-1-git-send-email-der.herr@hofr.at>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Nicholas Mc Guire <der.herr@hofr.at>
List-Id: devicetree@vger.kernel.org

wait_for_completion_timeout does not return negative values so
"result" handling here should be simplified to cover the actually
possible cases only.

patch was only compile tested for nhk8815_defconfig

patch is against linux-next 3.19.0-rc1 -next-20141226

Signed-off-by: Nicholas Mc Guire <der.herr@hofr.at>
---
 drivers/mtd/nand/fsmc_nand.c |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index edfaa21..7c0508f 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -604,11 +604,10 @@ static int dma_xfer(struct fsmc_nand_data *host, void *buffer, int len,
 	ret =
 	wait_for_completion_timeout(&host->dma_access_complete,
 				msecs_to_jiffies(3000));
-	if (ret <= 0) {
+	if (ret == 0) {
 		dmaengine_terminate_all(chan);
 		dev_err(host->dev, "wait_for_completion_timeout\n");
-		if (!ret)
-			ret = -ETIMEDOUT;
+		ret = -ETIMEDOUT;
 		goto unmap_dma;
 	}
 
-- 
1.7.10.4
