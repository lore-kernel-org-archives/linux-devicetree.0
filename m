From: <yongqiang.niu@mediatek.com>
Subject: [PATCH v2 05/25] drm/mediatek: split DISP_REG_CONFIG_DSI_SEL setting into another use case
Date: Wed, 27 Mar 2019 14:19:01 +0800
Message-ID: <1553667561-25447-6-git-send-email-yongqiang.niu@mediatek.com>
References: <1553667561-25447-1-git-send-email-yongqiang.niu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1553667561-25447-1-git-send-email-yongqiang.niu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: ck.hu@mediatek.com, p.zabel@pengutronix.de, robh+dt@kernel.org, matthias.bgg@gmail.com
Cc: airlied@linux.ie, mark.rutland@arm.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Bibby.Hsieh@mediatek.com, yt.shen@mediatek.com, Yongqiang Niu <yongqiang.niu@mediatek.com>
List-Id: devicetree@vger.kernel.org

From: Yongqiang Niu <yongqiang.niu@mediatek.com>

Here is two modifition in this patch:
1.bls->dpi0 and rdma1->dsi are differen usecase,
Split DISP_REG_CONFIG_DSI_SEL setting into anther usecase
2.remove DISP_REG_CONFIG_DPI_SEL setting, DPI_SEL_IN_BLS is 0 and
this is same with hardware defautl setting,

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
index 495ebc5..80dc91f 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
@@ -401,10 +401,9 @@ static void mtk_ddp_sout_sel(void __iomem *config_regs,
 	} else if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DPI0) {
 		writel_relaxed(BLS_TO_DPI_RDMA1_TO_DSI,
 			       config_regs + DISP_REG_CONFIG_OUT_SEL);
+	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI0) {
 		writel_relaxed(DSI_SEL_IN_RDMA,
 			       config_regs + DISP_REG_CONFIG_DSI_SEL);
-		writel_relaxed(DPI_SEL_IN_BLS,
-			       config_regs + DISP_REG_CONFIG_DPI_SEL);
 	}
 }
 
-- 
1.8.1.1.dirty
