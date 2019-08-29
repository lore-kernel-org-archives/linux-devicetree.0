From: <yongqiang.niu@mediatek.com>
Subject: [PATCH v5, 09/32] drm/mediatek: add mutex sof into ddp private data
Date: Thu, 29 Aug 2019 22:50:31 +0800
Message-ID: <1567090254-15566-10-git-send-email-yongqiang.niu@mediatek.com>
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

mutex sof will be ddp private data

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp.c | 43 +++++++++++++++++++++++++++-------
 1 file changed, 35 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
index ae22e21..9bdbd8d 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
@@ -141,8 +141,19 @@ struct mtk_disp_mutex {
 	bool claimed;
 };
 
+enum mtk_ddp_mutex_sof_id {
+	DDP_MUTEX_SOF_SINGLE_MODE,
+	DDP_MUTEX_SOF_DSI0,
+	DDP_MUTEX_SOF_DSI1,
+	DDP_MUTEX_SOF_DPI0,
+	DDP_MUTEX_SOF_DPI1,
+	DDP_MUTEX_SOF_DSI2,
+	DDP_MUTEX_SOF_DSI3,
+};
+
 struct mtk_ddp_data {
 	const unsigned int *mutex_mod;
+	const unsigned int *mutex_sof;
 	const unsigned int mutex_mod_reg;
 };
 
@@ -201,18 +212,31 @@ struct mtk_ddp {
 	[DDP_COMPONENT_WDMA1] = MT8173_MUTEX_MOD_DISP_WDMA1,
 };
 
+static const unsigned int mt2712_mutex_sof[DDP_MUTEX_SOF_DSI3 + 1] = {
+	[DDP_MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
+	[DDP_MUTEX_SOF_DSI0] = MUTEX_SOF_DSI0,
+	[DDP_MUTEX_SOF_DSI1] = MUTEX_SOF_DSI1,
+	[DDP_MUTEX_SOF_DPI0] = MUTEX_SOF_DPI0,
+	[DDP_MUTEX_SOF_DPI1] = MUTEX_SOF_DPI1,
+	[DDP_MUTEX_SOF_DSI2] = MUTEX_SOF_DSI2,
+	[DDP_MUTEX_SOF_DSI3] = MUTEX_SOF_DSI3,
+};
+
 static const struct mtk_ddp_data mt2701_ddp_driver_data = {
 	.mutex_mod = mt2701_mutex_mod,
+	.mutex_sof = mt2712_mutex_sof,
 	.mutex_mod_reg = MT2701_DISP_MUTEX0_MOD0,
 };
 
 static const struct mtk_ddp_data mt2712_ddp_driver_data = {
 	.mutex_mod = mt2712_mutex_mod,
+	.mutex_sof = mt2712_mutex_sof,
 	.mutex_mod_reg = MT2701_DISP_MUTEX0_MOD0,
 };
 
 static const struct mtk_ddp_data mt8173_ddp_driver_data = {
 	.mutex_mod = mt8173_mutex_mod,
+	.mutex_sof = mt2712_mutex_sof,
 	.mutex_mod_reg = MT2701_DISP_MUTEX0_MOD0,
 };
 
@@ -454,28 +478,29 @@ void mtk_disp_mutex_add_comp(struct mtk_disp_mutex *mutex,
 	struct mtk_ddp *ddp = container_of(mutex, struct mtk_ddp,
 					   mutex[mutex->id]);
 	unsigned int reg;
+	unsigned int sof_id;
 	unsigned int offset;
 
 	WARN_ON(&ddp->mutex[mutex->id] != mutex);
 
 	switch (id) {
 	case DDP_COMPONENT_DSI0:
-		reg = MUTEX_SOF_DSI0;
+		sof_id = DDP_MUTEX_SOF_DSI0;
 		break;
 	case DDP_COMPONENT_DSI1:
-		reg = MUTEX_SOF_DSI0;
+		sof_id = DDP_MUTEX_SOF_DSI0;
 		break;
 	case DDP_COMPONENT_DSI2:
-		reg = MUTEX_SOF_DSI2;
+		sof_id = DDP_MUTEX_SOF_DSI2;
 		break;
 	case DDP_COMPONENT_DSI3:
-		reg = MUTEX_SOF_DSI3;
+		sof_id = DDP_MUTEX_SOF_DSI3;
 		break;
 	case DDP_COMPONENT_DPI0:
-		reg = MUTEX_SOF_DPI0;
+		sof_id = DDP_MUTEX_SOF_DPI0;
 		break;
 	case DDP_COMPONENT_DPI1:
-		reg = MUTEX_SOF_DPI1;
+		sof_id = DDP_MUTEX_SOF_DPI1;
 		break;
 	default:
 		if (ddp->data->mutex_mod[id] < 32) {
@@ -493,7 +518,8 @@ void mtk_disp_mutex_add_comp(struct mtk_disp_mutex *mutex,
 		return;
 	}
 
-	writel_relaxed(reg, ddp->regs + DISP_REG_MUTEX_SOF(mutex->id));
+	writel_relaxed(ddp->data->mutex_sof[sof_id],
+		       ddp->regs + DISP_REG_MUTEX_SOF(mutex->id));
 }
 
 void mtk_disp_mutex_remove_comp(struct mtk_disp_mutex *mutex,
@@ -514,7 +540,8 @@ void mtk_disp_mutex_remove_comp(struct mtk_disp_mutex *mutex,
 	case DDP_COMPONENT_DPI0:
 	case DDP_COMPONENT_DPI1:
 		writel_relaxed(MUTEX_SOF_SINGLE_MODE,
-			       ddp->regs + DISP_REG_MUTEX_SOF(mutex->id));
+			       ddp->regs +
+			       DISP_REG_MUTEX_SOF(mutex->id));
 		break;
 	default:
 		if (ddp->data->mutex_mod[id] < 32) {
-- 
1.8.1.1.dirty
