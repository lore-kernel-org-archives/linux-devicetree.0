From: <shun-chih.yu@mediatek.com>
Subject: [PATCH 1/1] dmaengine: mediatek-cqdma: fix wrong register usage in mtk_cqdma_start
Date: Thu, 25 Apr 2019 11:53:50 +0800
Message-ID: <1556164430-30724-1-git-send-email-shun-chih.yu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Dan Williams <dan.j.williams@intel.com>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, srv_wsdupstream@mediatek.com, Shun-Chih Yu <shun-chih.yu@mediatek.com>
List-Id: devicetree@vger.kernel.org

From: Shun-Chih Yu <shun-chih.yu@mediatek.com>

This patch fixes wrong register usage in the mtk_cqdma_start. The
destination register should be MTK_CQDMA_DST2 instead.

Fixes: b1f01e48df5a ("dmaengine: mediatek: Add MediaTek Command-Queue DMA controller for MT6765 SoC")
Signed-off-by: Shun-Chih Yu <shun-chih.yu@mediatek.com>
---
 drivers/dma/mediatek/mtk-cqdma.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/mediatek/mtk-cqdma.c b/drivers/dma/mediatek/mtk-cqdma.c
index 131f397..8148538 100644
--- a/drivers/dma/mediatek/mtk-cqdma.c
+++ b/drivers/dma/mediatek/mtk-cqdma.c
@@ -253,7 +253,7 @@ static void mtk_cqdma_start(struct mtk_cqdma_pchan *pc,
 #ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
 	mtk_dma_set(pc, MTK_CQDMA_DST2, cvd->dest >> MTK_CQDMA_ADDR2_SHFIT);
 #else
-	mtk_dma_set(pc, MTK_CQDMA_SRC2, 0);
+	mtk_dma_set(pc, MTK_CQDMA_DST2, 0);
 #endif
 
 	/* setup the length */
-- 
1.7.9.5
