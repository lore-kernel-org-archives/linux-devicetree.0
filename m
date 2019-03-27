From: <yongqiang.niu@mediatek.com>
Subject: [PATCH v2 25/25] drm/mediatek: enable allow_fb_modifiers for mediatek drm
Date: Wed, 27 Mar 2019 14:19:21 +0800
Message-ID: <1553667561-25447-26-git-send-email-yongqiang.niu@mediatek.com>
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

enable allow_fb_modifiers for mediatek drm

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c   |  2 ++
 drivers/gpu/drm/mediatek/mtk_drm_plane.c | 15 ++++++++++++++-
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 942789d..a45c7b4 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -277,6 +277,8 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 	drm->mode_config.max_height = 4096;
 	drm->mode_config.funcs = &mtk_drm_mode_config_funcs;
 
+	drm->mode_config.allow_fb_modifiers = true;
+
 	ret = component_bind_all(drm->dev, drm);
 	if (ret)
 		goto err_config_cleanup;
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
index f7e6aa1..106939b 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
@@ -77,6 +77,13 @@ static void mtk_drm_plane_destroy_state(struct drm_plane *plane,
 	kfree(to_mtk_plane_state(state));
 }
 
+static bool mtk_plane_format_mod_supported(struct drm_plane *plane,
+				     uint32_t format,
+				     uint64_t modifier)
+{
+	return (modifier == DRM_FORMAT_MOD_LINEAR);
+}
+
 static const struct drm_plane_funcs mtk_plane_funcs = {
 	.update_plane = drm_atomic_helper_update_plane,
 	.disable_plane = drm_atomic_helper_disable_plane,
@@ -84,6 +91,7 @@ static void mtk_drm_plane_destroy_state(struct drm_plane *plane,
 	.reset = mtk_plane_reset,
 	.atomic_duplicate_state = mtk_plane_duplicate_state,
 	.atomic_destroy_state = mtk_drm_plane_destroy_state,
+	.format_mod_supported = mtk_plane_format_mod_supported,
 };
 
 static int mtk_plane_atomic_check(struct drm_plane *plane,
@@ -163,10 +171,15 @@ int mtk_plane_init(struct drm_device *dev, struct drm_plane *plane,
 		   unsigned long possible_crtcs, enum drm_plane_type type)
 {
 	int err;
+	static const uint64_t modifiers[] = {
+		DRM_FORMAT_MOD_LINEAR,
+		DRM_FORMAT_MOD_INVALID
+	};
 
 	err = drm_universal_plane_init(dev, plane, possible_crtcs,
 				       &mtk_plane_funcs, formats,
-				       ARRAY_SIZE(formats), NULL, type, NULL);
+				       ARRAY_SIZE(formats), modifiers,
+				       type, NULL);
 	if (err) {
 		DRM_ERROR("failed to initialize plane\n");
 		return err;
-- 
1.8.1.1.dirty
