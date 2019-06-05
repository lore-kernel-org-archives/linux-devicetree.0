From: <yongqiang.niu@mediatek.com>
Subject: [PATCH v3, 09/27] drm/mediatek: add mutex sof register offset into ddp private data
Date: Wed, 5 Jun 2019 19:42:48 +0800
Message-ID: <1559734986-7379-10-git-send-email-yongqiang.niu@mediatek.com>
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

mutex sof register offset will be private data of ddp

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
index e1a510f..717609d 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
@@ -42,12 +42,13 @@
 #define DISP_REG_CONFIG_DPI_SEL			0x064
 
 #define MT2701_DISP_MUTEX0_MOD0			0x2c
+#define MT2701_DISP_MUTEX0_SOF0			0x2c
 
 #define DISP_REG_MUTEX_EN(n)			(0x20 + 0x20 * (n))
 #define DISP_REG_MUTEX(n)			(0x24 + 0x20 * (n))
 #define DISP_REG_MUTEX_RST(n)			(0x28 + 0x20 * (n))
 #define DISP_REG_MUTEX_MOD(mutex_mod_reg, n)	(mutex_mod_reg + 0x20 * (n))
-#define DISP_REG_MUTEX_SOF(n)			(0x30 + 0x20 * (n))
+#define DISP_REG_MUTEX_SOF(mutex_sof_reg, n)	(mutex_sof_reg + 0x20 * (n))
 #define DISP_REG_MUTEX_MOD2(n)			(0x34 + 0x20 * (n))
 
 #define INT_MUTEX				BIT(1)
@@ -164,6 +165,7 @@ struct mtk_ddp_data {
 	const unsigned int *mutex_mod;
 	const unsigned int *mutex_sof;
 	const unsigned int mutex_mod_reg;
+	const unsigned int mutex_sof_reg;
 };
 
 struct mtk_ddp {
@@ -235,18 +237,21 @@ struct mtk_ddp {
 	.mutex_mod = mt2701_mutex_mod,
 	.mutex_sof = mt2712_mutex_sof,
 	.mutex_mod_reg = MT2701_DISP_MUTEX0_MOD0,
+	.mutex_sof_reg = MT2701_DISP_MUTEX0_SOF0,
 };
 
 static const struct mtk_ddp_data mt2712_ddp_driver_data = {
 	.mutex_mod = mt2712_mutex_mod,
 	.mutex_sof = mt2712_mutex_sof,
 	.mutex_mod_reg = MT2701_DISP_MUTEX0_MOD0,
+	.mutex_sof_reg = MT2701_DISP_MUTEX0_SOF0,
 };
 
 static const struct mtk_ddp_data mt8173_ddp_driver_data = {
 	.mutex_mod = mt8173_mutex_mod,
 	.mutex_sof = mt2712_mutex_sof,
 	.mutex_mod_reg = MT2701_DISP_MUTEX0_MOD0,
+	.mutex_sof_reg = MT2701_DISP_MUTEX0_SOF0,
 };
 
 static unsigned int mtk_ddp_mout_en(enum mtk_ddp_comp_id cur,
@@ -528,7 +533,8 @@ void mtk_disp_mutex_add_comp(struct mtk_disp_mutex *mutex,
 	}
 
 	writel_relaxed(ddp->data->mutex_sof[sof_id],
-		       ddp->regs + DISP_REG_MUTEX_SOF(mutex->id));
+		       ddp->regs +
+		       DISP_REG_MUTEX_SOF(ddp->data->mutex_sof_reg, mutex->id));
 }
 
 void mtk_disp_mutex_remove_comp(struct mtk_disp_mutex *mutex,
@@ -550,7 +556,8 @@ void mtk_disp_mutex_remove_comp(struct mtk_disp_mutex *mutex,
 	case DDP_COMPONENT_DPI1:
 		writel_relaxed(MUTEX_SOF_SINGLE_MODE,
 			       ddp->regs +
-			       DISP_REG_MUTEX_SOF(mutex->id));
+			       DISP_REG_MUTEX_SOF(ddp->data->mutex_sof_reg,
+						  mutex->id));
 		break;
 	default:
 		if (ddp->data->mutex_mod[id] < 32) {
-- 
1.8.1.1.dirty
