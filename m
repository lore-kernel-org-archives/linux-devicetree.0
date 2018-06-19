From: Stu Hsieh <stu.hsieh@mediatek.com>
Subject: [PATCH v6 25/29] drm/mediatek: add DPI1 support for mutex
Date: Tue, 19 Jun 2018 15:34:26 +0800
Message-ID: <1529393670-26862-26-git-send-email-stu.hsieh@mediatek.com>
References: <1529393670-26862-1-git-send-email-stu.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1529393670-26862-1-git-send-email-stu.hsieh@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, Stu Hsieh <stu.hsieh@mediatek.com>
List-Id: devicetree@vger.kernel.org

This patch add the DPI1 support for mutex

Signed-off-by: Stu Hsieh <stu.hsieh@mediatek.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
index 0a1b967cab1b..4c203d013d7c 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
@@ -76,6 +76,7 @@
 #define MUTEX_SOF_DSI0			1
 #define MUTEX_SOF_DSI1			2
 #define MUTEX_SOF_DPI0			3
+#define MUTEX_SOF_DPI1			4
 
 #define OVL0_MOUT_EN_COLOR0		0x1
 #define OD_MOUT_EN_RDMA0		0x1
@@ -385,6 +386,9 @@ void mtk_disp_mutex_add_comp(struct mtk_disp_mutex *mutex,
 	case DDP_COMPONENT_DPI0:
 		reg = MUTEX_SOF_DPI0;
 		break;
+	case DDP_COMPONENT_DPI1:
+		reg = MUTEX_SOF_DPI1;
+		break;
 	default:
 		if (ddp->mutex_mod[id] < 32) {
 			offset = DISP_REG_MUTEX_MOD(mutex->id);
@@ -417,6 +421,7 @@ void mtk_disp_mutex_remove_comp(struct mtk_disp_mutex *mutex,
 	case DDP_COMPONENT_DSI0:
 	case DDP_COMPONENT_DSI1:
 	case DDP_COMPONENT_DPI0:
+	case DDP_COMPONENT_DPI1:
 		writel_relaxed(MUTEX_SOF_SINGLE_MODE,
 			       ddp->regs + DISP_REG_MUTEX_SOF(mutex->id));
 		break;
-- 
2.12.5
