From: Eddie James <eajames@linux.ibm.com>
Subject: [PATCH 2/5] media: platform: Aspeed: Make reserved memory optional
Date: Tue,  2 Apr 2019 18:25:01 +0000
Message-ID: <1554229504-5661-3-git-send-email-eajames@linux.ibm.com>
References: <1554229504-5661-1-git-send-email-eajames@linux.ibm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1554229504-5661-1-git-send-email-eajames@linux.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org, joel@jms.id.au, andrew@aj.id.au, mchehab@kernel.org, linux-clk@vger.kernel.org, sboyd@kernel.org, mturquette@baylibre.com, devicetree@vger.kernel.org, mark.rutland@arm.com, robh+dt@kernel.org
List-Id: devicetree@vger.kernel.org

Reserved memory doesn't need to be required; system memory would work
fine.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/media/platform/aspeed-video.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index 55c55a6..8144fe3 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -1608,11 +1608,7 @@ static int aspeed_video_init(struct aspeed_video *video)
 		return PTR_ERR(video->vclk);
 	}
 
-	rc = of_reserved_mem_device_init(dev);
-	if (rc) {
-		dev_err(dev, "Unable to reserve memory\n");
-		return rc;
-	}
+	of_reserved_mem_device_init(dev);
 
 	rc = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
 	if (rc) {
-- 
1.8.3.1
