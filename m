From: <yongqiang.niu@mediatek.com>
Subject: [PATCH v2 19/25] drm/mediatek: add function mtk_ddp_comp_get_type
Date: Wed, 27 Mar 2019 14:19:15 +0800
Message-ID: <1553667561-25447-20-git-send-email-yongqiang.niu@mediatek.com>
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

This patch add function mtk_ddp_comp_get_type

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 8 ++++++++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h | 1 +
 2 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 72288b4..193cdb7a 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -338,6 +338,14 @@ int mtk_ddp_comp_get_id(struct device_node *node,
 	return -EINVAL;
 }
 
+enum mtk_ddp_comp_type mtk_ddp_comp_get_type(enum mtk_ddp_comp_id comp_id)
+{
+	if (comp_id < DDP_COMPONENT_ID_MAX)
+		return mtk_ddp_matches[comp_id].type;
+
+	return MTK_DDP_COMP_TYPE_MAX;
+}
+
 int mtk_ddp_comp_init(struct device *dev, struct device_node *node,
 		      struct mtk_ddp_comp *comp, enum mtk_ddp_comp_id comp_id,
 		      const struct mtk_ddp_comp_funcs *funcs)
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
index ed715ff..6bf46d1 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
@@ -202,5 +202,6 @@ void mtk_ddp_write_mask(unsigned int value,
 			struct mtk_ddp_comp *comp,
 			unsigned int offset,
 			unsigned int mask);
+enum mtk_ddp_comp_type mtk_ddp_comp_get_type(enum mtk_ddp_comp_id comp_id);
 
 #endif /* MTK_DRM_DDP_COMP_H */
-- 
1.8.1.1.dirty
