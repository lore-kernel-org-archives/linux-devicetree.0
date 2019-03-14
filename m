From: <yongqiang.niu@mediatek.com>
Subject: [RESEND PATCH v1 17/18] drm/mediatek: add ovl0/ovl0_2l usecase
Date: Thu, 14 Mar 2019 20:05:19 +0800
Message-ID: <1552565120-24329-18-git-send-email-yongqiang.niu@mediatek.com>
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

This patch add ovl0/ovl0_2l usecase

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 38 ++++++++++++++++++++++++++++++---
 1 file changed, 35 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index a5af4be..25cf063 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -283,6 +283,15 @@ static int mtk_crtc_ddp_hw_init(struct mtk_drm_crtc *mtk_crtc)
 
 	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
 		struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[i];
+		enum mtk_ddp_comp_id prev = DDP_COMPONENT_ID_MAX;
+
+		if (i > 0) {
+			struct mtk_ddp_comp *comp_prev;
+
+			comp_prev = mtk_crtc->ddp_comp[i - 1];
+			prev = comp_prev->id;
+		}
+		mtk_ddp_comp_connect(comp, prev);
 
 		mtk_ddp_comp_config(comp, width, height, vrefresh, bpc);
 		mtk_ddp_comp_start(comp);
@@ -292,10 +301,19 @@ static int mtk_crtc_ddp_hw_init(struct mtk_drm_crtc *mtk_crtc)
 	for (i = 0; i < mtk_crtc->layer_nr; i++) {
 		struct drm_plane *plane = &mtk_crtc->planes[i];
 		struct mtk_plane_state *plane_state;
+		struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[0];
+		unsigned int comp_layer_nr = mtk_ddp_comp_layer_nr(comp);
+		unsigned int local_layer = 0;
 
 		plane_state = to_mtk_plane_state(plane->state);
-		mtk_ddp_comp_layer_config(mtk_crtc->ddp_comp[0], i,
-					  plane_state);
+
+		if (i >= comp_layer_nr) {
+			comp = mtk_crtc->ddp_comp[1];
+			local_layer = i - comp_layer_nr;
+		} else {
+			local_layer = i;
+		}
+		mtk_ddp_comp_layer_config(comp, local_layer, plane_state);
 	}
 
 	return 0;
@@ -340,6 +358,8 @@ static void mtk_crtc_ddp_config(struct drm_crtc *crtc)
 	struct mtk_crtc_state *state = to_mtk_crtc_state(mtk_crtc->base.state);
 	struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[0];
 	unsigned int i;
+	unsigned int comp_layer_nr = mtk_ddp_comp_layer_nr(comp);
+	unsigned int local_layer = 0;
 
 	/*
 	 * TODO: instead of updating the registers here, we should prepare
@@ -362,7 +382,15 @@ static void mtk_crtc_ddp_config(struct drm_crtc *crtc)
 			plane_state = to_mtk_plane_state(plane->state);
 
 			if (plane_state->pending.config) {
-				mtk_ddp_comp_layer_config(comp, i, plane_state);
+				if (i >= comp_layer_nr) {
+					comp = mtk_crtc->ddp_comp[1];
+					local_layer = i - comp_layer_nr;
+				} else {
+					local_layer = i;
+				}
+
+				mtk_ddp_comp_layer_config(comp, local_layer,
+							  plane_state);
 				plane_state->pending.config = false;
 			}
 		}
@@ -604,6 +632,10 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 	}
 
 	mtk_crtc->layer_nr = mtk_ddp_comp_layer_nr(mtk_crtc->ddp_comp[0]);
+	if (mtk_crtc->ddp_comp_nr > 1 &&
+	    mtk_ddp_comp_get_type(mtk_crtc->ddp_comp[1]->id) == MTK_DISP_OVL)
+		mtk_crtc->layer_nr +=
+		mtk_ddp_comp_layer_nr(mtk_crtc->ddp_comp[1]);
 	mtk_crtc->planes = devm_kcalloc(dev, mtk_crtc->layer_nr,
 					sizeof(struct drm_plane),
 					GFP_KERNEL);
-- 
1.8.1.1.dirty
