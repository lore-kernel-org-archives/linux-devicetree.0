From: <yongqiang.niu@mediatek.com>
Subject: [PATCH v2 06/25] drm/mediatek: redefine mtk_ddp_sout_sel
Date: Wed, 27 Mar 2019 14:19:02 +0800
Message-ID: <1553667561-25447-7-git-send-email-yongqiang.niu@mediatek.com>
References: <1553667561-25447-1-git-send-email-yongqiang.niu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1553667561-25447-1-git-send-email-yongqiang.niu@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: ck.hu@mediatek.com, p.zabel@pengutronix.de, robh+dt@kernel.org, matthias.bgg@gmail.com
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Yongqiang Niu <yongqiang.niu@mediatek.com>, airlied@linux.ie, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, Bibby.Hsieh@mediatek.com, yt.shen@mediatek.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Yongqiang Niu <yongqiang.niu@mediatek.com>

the format of "mtk_ddp_sout_sel"was not flexible, after we add more
mediatek SOC support, that will be redundant

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp.c | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
index 80dc91f..e4dafe0 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
@@ -391,20 +391,26 @@ static unsigned int mtk_ddp_sel_in(enum mtk_ddp_comp_id cur,
 	return value;
 }
 
-static void mtk_ddp_sout_sel(void __iomem *config_regs,
-			     enum mtk_ddp_comp_id cur,
-			     enum mtk_ddp_comp_id next)
+static unsigned int mtk_ddp_sout_sel(enum mtk_ddp_comp_id cur,
+				     enum mtk_ddp_comp_id next,
+				     unsigned int *addr)
 {
+        unsigned int value;
+
 	if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DSI0) {
-		writel_relaxed(BLS_TO_DSI_RDMA1_TO_DPI1,
-			       config_regs + DISP_REG_CONFIG_OUT_SEL);
+		*addr = DISP_REG_CONFIG_OUT_SEL;
+                value = BLS_TO_DSI_RDMA1_TO_DPI1;
 	} else if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DPI0) {
-		writel_relaxed(BLS_TO_DPI_RDMA1_TO_DSI,
-			       config_regs + DISP_REG_CONFIG_OUT_SEL);
+		*addr = DISP_REG_CONFIG_OUT_SEL;
+                value = BLS_TO_DPI_RDMA1_TO_DSI;
 	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI0) {
-		writel_relaxed(DSI_SEL_IN_RDMA,
-			       config_regs + DISP_REG_CONFIG_DSI_SEL);
+		*addr = DISP_REG_CONFIG_DSI_SEL;
+		value = DSI_SEL_IN_RDMA;
+	} else {
+		value = 0;
 	}
+
+        return value;
 }
 
 void mtk_ddp_add_comp_to_path(void __iomem *config_regs,
@@ -419,7 +425,9 @@ void mtk_ddp_add_comp_to_path(void __iomem *config_regs,
 		writel_relaxed(reg, config_regs + addr);
 	}
 
-	mtk_ddp_sout_sel(config_regs, cur, next);
+	value = mtk_ddp_sout_sel(cur, next, &addr);
+	if (value)
+                writel_relaxed(value, config_regs + addr);
 
 	value = mtk_ddp_sel_in(cur, next, &addr);
 	if (value) {
-- 
1.8.1.1.dirty
