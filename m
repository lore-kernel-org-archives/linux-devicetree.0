From: <yongqiang.niu@mediatek.com>
Subject: [RESEND PATCH v1 13/18] drm/mediatek: add ddp write register common api
Date: Thu, 14 Mar 2019 20:05:15 +0800
Message-ID: <1552565120-24329-14-git-send-email-yongqiang.niu@mediatek.com>
References: <1552565120-24329-1-git-send-email-yongqiang.niu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1552565120-24329-1-git-send-email-yongqiang.niu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: ck.hu@mediatek.com, p.zabel@pengutronix.de, robh+dt@kernel.org, matthias.bgg@gmail.com
Cc: airlied@linux.ie, mark.rutland@arm.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Bibby.Hsieh@mediatek.com, yt.shen@mediatek.com, Yongqiang Niu <yongqiang.niu@mediatek.com>
List-Id: devicetree@vger.kernel.org

From: Yongqiang Niu <yongqiang.niu@mediatek.com>

This patch add ddp write register common api

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 24 ++++++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  9 +++++++++
 2 files changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index a97e27b..1c0f9cc 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -84,6 +84,30 @@
 #define DITHER_ADD_LSHIFT_G(x)			(((x) & 0x7) << 4)
 #define DITHER_ADD_RSHIFT_G(x)			(((x) & 0x7) << 0)
 
+void mtk_ddp_write(unsigned int value, struct mtk_ddp_comp *comp,
+		   unsigned int offset)
+{
+	writel(value, comp->regs + offset);
+}
+
+void mtk_ddp_write_relaxed(unsigned int value,
+			   struct mtk_ddp_comp *comp,
+			   unsigned int offset)
+{
+	writel_relaxed(value, comp->regs + offset);
+}
+
+void mtk_ddp_write_mask(unsigned int value,
+			struct mtk_ddp_comp *comp,
+			unsigned int offset,
+			unsigned int mask)
+{
+	unsigned int tmp = readl(comp->regs + offset);
+
+	tmp = (tmp & ~mask) | (value & mask);
+	writel(tmp, comp->regs + offset);
+}
+
 void mtk_dither_set(struct mtk_ddp_comp *comp, unsigned int bpc,
 		    unsigned int CFG)
 {
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
index f2ab0b3..b908172 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
@@ -189,5 +189,14 @@ int mtk_ddp_comp_init(struct device *dev, struct device_node *comp_node,
 void mtk_ddp_comp_unregister(struct drm_device *drm, struct mtk_ddp_comp *comp);
 void mtk_dither_set(struct mtk_ddp_comp *comp, unsigned int bpc,
 		    unsigned int CFG);
+void mtk_ddp_write(unsigned int value, struct mtk_ddp_comp *comp,
+		   unsigned int offset);
+void mtk_ddp_write_relaxed(unsigned int value,
+			   struct mtk_ddp_comp *comp,
+			   unsigned int offset);
+void mtk_ddp_write_mask(unsigned int value,
+			struct mtk_ddp_comp *comp,
+			unsigned int offset,
+			unsigned int mask);
 
 #endif /* MTK_DRM_DDP_COMP_H */
-- 
1.8.1.1.dirty
