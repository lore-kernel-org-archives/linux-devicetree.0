From: <yongqiang.niu@mediatek.com>
Subject: [PATCH v3, 19/27] drm/mediatek: add function to background color input select for ovl/ovl_2l direct link
Date: Wed, 5 Jun 2019 19:42:58 +0800
Message-ID: <1559734986-7379-20-git-send-email-yongqiang.niu@mediatek.com>
References: <1559734986-7379-1-git-send-email-yongqiang.niu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1559734986-7379-1-git-send-email-yongqiang.niu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Yongqiang Niu <yongqiang.niu@mediatek.com>
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
index 158c1e5..aa1e183 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
@@ -92,6 +92,9 @@ struct mtk_ddp_comp_funcs {
 			     struct mtk_plane_state *state);
 	void (*gamma_set)(struct mtk_ddp_comp *comp,
 			  struct drm_crtc_state *state);
+	void (*bgclr_in_on)(struct mtk_ddp_comp *comp,
+			    enum mtk_ddp_comp_id prev);
+	void (*bgclr_in_off)(struct mtk_ddp_comp *comp);
 };
 
 struct mtk_ddp_comp {
@@ -173,6 +176,19 @@ static inline void mtk_ddp_gamma_set(struct mtk_ddp_comp *comp,
 		comp->funcs->gamma_set(comp, state);
 }
 
+static inline void mtk_ddp_comp_bgclr_in_on(struct mtk_ddp_comp *comp,
+					    enum mtk_ddp_comp_id prev)
+{
+	if (comp->funcs && comp->funcs->bgclr_in_on)
+		comp->funcs->bgclr_in_on(comp, prev);
+}
+
+static inline void mtk_ddp_comp_bgclr_in_off(struct mtk_ddp_comp *comp)
+{
+	if (comp->funcs && comp->funcs->bgclr_in_off)
+		comp->funcs->bgclr_in_off(comp);
+}
+
 int mtk_ddp_comp_get_id(struct device_node *node,
 			enum mtk_ddp_comp_type comp_type);
 int mtk_ddp_comp_init(struct device *dev, struct device_node *comp_node,
-- 
1.8.1.1.dirty
