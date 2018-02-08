From: <sean.wang@mediatek.com>
Subject: [PATCH v4 4/5] dmaengine: mediatek: mtk_hsdma_find_active_desc() can be static
Date: Fri, 9 Feb 2018 01:58:50 +0800
Message-ID: <d06926cb465f98c212ab3a6e14fc858ec49e48bf.1518110810.git.sean.wang@mediatek.com>
References: <cover.1518110810.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1518110810.git.sean.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: vinod.koul@intel.com, dan.j.williams@intel.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kbuild test robot <lkp@intel.com>, Fengguang Wu <fengguang.wu@intel.com>
List-Id: devicetree@vger.kernel.org

From: kbuild test robot <lkp@intel.com>

Fixes: c8e4b2e4ca21 ("dmaengine: mediatek: Add MediaTek High-Speed DMA controller for MT7622 and MT7623 SoC")
Signed-off-by: Fengguang Wu <fengguang.wu@intel.com>
Acked-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/dma/mediatek/mtk-hsdma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/mediatek/mtk-hsdma.c b/drivers/dma/mediatek/mtk-hsdma.c
index d394fc6..42b5b23 100644
--- a/drivers/dma/mediatek/mtk-hsdma.c
+++ b/drivers/dma/mediatek/mtk-hsdma.c
@@ -644,8 +644,8 @@ static irqreturn_t mtk_hsdma_irq(int irq, void *devid)
 	return IRQ_HANDLED;
 }
 
-struct virt_dma_desc *mtk_hsdma_find_active_desc(struct dma_chan *c,
-						 dma_cookie_t cookie)
+static struct virt_dma_desc *mtk_hsdma_find_active_desc(struct dma_chan *c,
+							dma_cookie_t cookie)
 {
 	struct mtk_hsdma_vchan *hvc = to_hsdma_vchan(c);
 	struct virt_dma_desc *vd;
-- 
2.7.4
