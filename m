From: <yongqiang.niu@mediatek.com>
Subject: [PATCH v2 15/25] drm/mediatek: add function to background color input select for ovl/ovl_2l direct link
Date: Wed, 27 Mar 2019 14:19:11 +0800
Message-ID: <1553667561-25447-16-git-send-email-yongqiang.niu@mediatek.com>
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

This patch add function to background color input select for ovl/ovl_2l direct link
for ovl/ovl_2l direct link usecase, we need set background color
input select for these hardware.
this is preparation patch for ovl/ovl_2l usecase

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
index b76b663..20e8061 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
@@ -92,6 +92,9 @@ struct mtk_ddp_comp_funcs {
 			     struct mtk_plane_state *state);
 	void (*gamma_set)(struct mtk_ddp_comp *comp,
 			  struct drm_crtc_state *state);
+        void (*bgclr_in_on)(struct mtk_ddp_comp *comp,
+			    enum mtk_ddp_comp_id prev);
+        void (*bgclr_in_off)(struct mtk_ddp_comp *comp);
 };
 
 struct mtk_ddp_comp {
@@ -173,6 +176,19 @@ static inline void mtk_ddp_gamma_set(struct mtk_ddp_comp *comp,
 		comp->funcs->gamma_set(comp, state);
 }
 
+static inline void mtk_ddp_comp_bgclr_in_on(struct mtk_ddp_comp *comp,
+					    enum mtk_ddp_comp_id prev)
+{
+        if (comp->funcs && comp->funcs->bgclr_in_on)
+                comp->funcs->bgclr_in_on(comp, prev);
+}
+
+static inline void mtk_ddp_comp_bgclr_in_off(struct mtk_ddp_comp *comp)
+{
+        if (comp->funcs && comp->funcs->bgclr_in_off)
+                comp->funcs->bgclr_in_off(comp);
+}
+
 int mtk_ddp_comp_get_id(struct device_node *node,
 			enum mtk_ddp_comp_type comp_type);
 int mtk_ddp_comp_init(struct device *dev, struct device_node *comp_node,
-- 
1.8.1.1.dirty
