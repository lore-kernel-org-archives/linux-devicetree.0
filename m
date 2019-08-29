From: <yongqiang.niu@mediatek.com>
Subject: [PATCH v5, 15/32] drm/mediatek: add commponent OVL_2L0
Date: Thu, 29 Aug 2019 22:50:37 +0800
Message-ID: <1567090254-15566-16-git-send-email-yongqiang.niu@mediatek.com>
References: <1567090254-15566-1-git-send-email-yongqiang.niu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1567090254-15566-1-git-send-email-yongqiang.niu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Yongqiang Niu <yongqiang.niu@mediatek.com>
List-Id: devicetree@vger.kernel.org

From: Yongqiang Niu <yongqiang.niu@mediatek.com>

This patch add commponent OVL_2L0

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 2 ++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index b18bd66..4200f89 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -219,6 +219,7 @@ static void mtk_gamma_set(struct mtk_ddp_comp *comp,
 
 static const char * const mtk_ddp_comp_stem[MTK_DDP_COMP_TYPE_MAX] = {
 	[MTK_DISP_OVL] = "ovl",
+	[MTK_DISP_OVL_2L] = "ovl_2l",
 	[MTK_DISP_RDMA] = "rdma",
 	[MTK_DISP_WDMA] = "wdma",
 	[MTK_DISP_COLOR] = "color",
@@ -258,6 +259,7 @@ struct mtk_ddp_comp_match {
 	[DDP_COMPONENT_OD1]	= { MTK_DISP_OD,	1, &ddp_od },
 	[DDP_COMPONENT_OVL0]	= { MTK_DISP_OVL,	0, NULL },
 	[DDP_COMPONENT_OVL1]	= { MTK_DISP_OVL,	1, NULL },
+	[DDP_COMPONENT_OVL_2L0]	= { MTK_DISP_OVL_2L,	0, NULL },
 	[DDP_COMPONENT_PWM0]	= { MTK_DISP_PWM,	0, NULL },
 	[DDP_COMPONENT_PWM1]	= { MTK_DISP_PWM,	1, NULL },
 	[DDP_COMPONENT_PWM2]	= { MTK_DISP_PWM,	2, NULL },
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
index 8d220224..9caec2d 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
@@ -17,6 +17,7 @@
 
 enum mtk_ddp_comp_type {
 	MTK_DISP_OVL,
+	MTK_DISP_OVL_2L,
 	MTK_DISP_RDMA,
 	MTK_DISP_WDMA,
 	MTK_DISP_COLOR,
@@ -50,6 +51,7 @@ enum mtk_ddp_comp_id {
 	DDP_COMPONENT_OD0,
 	DDP_COMPONENT_OD1,
 	DDP_COMPONENT_OVL0,
+	DDP_COMPONENT_OVL_2L0,
 	DDP_COMPONENT_OVL1,
 	DDP_COMPONENT_PWM0,
 	DDP_COMPONENT_PWM1,
-- 
1.8.1.1.dirty
