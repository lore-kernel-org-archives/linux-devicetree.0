From: YT Shen <yt.shen@mediatek.com>
Subject: [PATCH v5 01/10] drm/mediatek: rename macros, add chip prefix
Date: Thu, 28 Jul 2016 17:27:55 +0800
Message-ID: <1469698084-20185-2-git-send-email-yt.shen@mediatek.com>
References: <1469698084-20185-1-git-send-email-yt.shen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1469698084-20185-1-git-send-email-yt.shen@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, David Airlie <airlied@linux.ie>, Matthias Brugger <matthias.bgg@gmail.com>, YT Shen <yt.shen@mediatek.com>, CK Hu <ck.hu@mediatek.com>, Mao Huang <littlecvr@chromium.org>, Bibby Hsieh <bibby.hsieh@mediatek.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, yingjoe.chen@mediatek.com, emil.l.velikov@gmail.com, thierry.reding@gmail.com
List-Id: devicetree@vger.kernel.org

Add MT8173 prefix for hardware related macros.

Signed-off-by: YT Shen <yt.shen@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp.c |   60 ++++++++++++++++----------------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
index 17ba935..2fc4321 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
@@ -36,21 +36,21 @@
 #define DISP_REG_MUTEX_MOD(n)	(0x2c + 0x20 * (n))
 #define DISP_REG_MUTEX_SOF(n)	(0x30 + 0x20 * (n))
 
-#define MUTEX_MOD_DISP_OVL0		BIT(11)
-#define MUTEX_MOD_DISP_OVL1		BIT(12)
-#define MUTEX_MOD_DISP_RDMA0		BIT(13)
-#define MUTEX_MOD_DISP_RDMA1		BIT(14)
-#define MUTEX_MOD_DISP_RDMA2		BIT(15)
-#define MUTEX_MOD_DISP_WDMA0		BIT(16)
-#define MUTEX_MOD_DISP_WDMA1		BIT(17)
-#define MUTEX_MOD_DISP_COLOR0		BIT(18)
-#define MUTEX_MOD_DISP_COLOR1		BIT(19)
-#define MUTEX_MOD_DISP_AAL		BIT(20)
-#define MUTEX_MOD_DISP_GAMMA		BIT(21)
-#define MUTEX_MOD_DISP_UFOE		BIT(22)
-#define MUTEX_MOD_DISP_PWM0		BIT(23)
-#define MUTEX_MOD_DISP_PWM1		BIT(24)
-#define MUTEX_MOD_DISP_OD		BIT(25)
+#define MT8173_MUTEX_MOD_DISP_OVL0		BIT(11)
+#define MT8173_MUTEX_MOD_DISP_OVL1		BIT(12)
+#define MT8173_MUTEX_MOD_DISP_RDMA0		BIT(13)
+#define MT8173_MUTEX_MOD_DISP_RDMA1		BIT(14)
+#define MT8173_MUTEX_MOD_DISP_RDMA2		BIT(15)
+#define MT8173_MUTEX_MOD_DISP_WDMA0		BIT(16)
+#define MT8173_MUTEX_MOD_DISP_WDMA1		BIT(17)
+#define MT8173_MUTEX_MOD_DISP_COLOR0		BIT(18)
+#define MT8173_MUTEX_MOD_DISP_COLOR1		BIT(19)
+#define MT8173_MUTEX_MOD_DISP_AAL		BIT(20)
+#define MT8173_MUTEX_MOD_DISP_GAMMA		BIT(21)
+#define MT8173_MUTEX_MOD_DISP_UFOE		BIT(22)
+#define MT8173_MUTEX_MOD_DISP_PWM0		BIT(23)
+#define MT8173_MUTEX_MOD_DISP_PWM1		BIT(24)
+#define MT8173_MUTEX_MOD_DISP_OD		BIT(25)
 
 #define MUTEX_SOF_SINGLE_MODE		0
 #define MUTEX_SOF_DSI0			1
@@ -80,21 +80,21 @@ struct mtk_ddp {
 };
 
 static const unsigned int mutex_mod[DDP_COMPONENT_ID_MAX] = {
-	[DDP_COMPONENT_AAL] = MUTEX_MOD_DISP_AAL,
-	[DDP_COMPONENT_COLOR0] = MUTEX_MOD_DISP_COLOR0,
-	[DDP_COMPONENT_COLOR1] = MUTEX_MOD_DISP_COLOR1,
-	[DDP_COMPONENT_GAMMA] = MUTEX_MOD_DISP_GAMMA,
-	[DDP_COMPONENT_OD] = MUTEX_MOD_DISP_OD,
-	[DDP_COMPONENT_OVL0] = MUTEX_MOD_DISP_OVL0,
-	[DDP_COMPONENT_OVL1] = MUTEX_MOD_DISP_OVL1,
-	[DDP_COMPONENT_PWM0] = MUTEX_MOD_DISP_PWM0,
-	[DDP_COMPONENT_PWM1] = MUTEX_MOD_DISP_PWM1,
-	[DDP_COMPONENT_RDMA0] = MUTEX_MOD_DISP_RDMA0,
-	[DDP_COMPONENT_RDMA1] = MUTEX_MOD_DISP_RDMA1,
-	[DDP_COMPONENT_RDMA2] = MUTEX_MOD_DISP_RDMA2,
-	[DDP_COMPONENT_UFOE] = MUTEX_MOD_DISP_UFOE,
-	[DDP_COMPONENT_WDMA0] = MUTEX_MOD_DISP_WDMA0,
-	[DDP_COMPONENT_WDMA1] = MUTEX_MOD_DISP_WDMA1,
+	[DDP_COMPONENT_AAL] = MT8173_MUTEX_MOD_DISP_AAL,
+	[DDP_COMPONENT_COLOR0] = MT8173_MUTEX_MOD_DISP_COLOR0,
+	[DDP_COMPONENT_COLOR1] = MT8173_MUTEX_MOD_DISP_COLOR1,
+	[DDP_COMPONENT_GAMMA] = MT8173_MUTEX_MOD_DISP_GAMMA,
+	[DDP_COMPONENT_OD] = MT8173_MUTEX_MOD_DISP_OD,
+	[DDP_COMPONENT_OVL0] = MT8173_MUTEX_MOD_DISP_OVL0,
+	[DDP_COMPONENT_OVL1] = MT8173_MUTEX_MOD_DISP_OVL1,
+	[DDP_COMPONENT_PWM0] = MT8173_MUTEX_MOD_DISP_PWM0,
+	[DDP_COMPONENT_PWM1] = MT8173_MUTEX_MOD_DISP_PWM1,
+	[DDP_COMPONENT_RDMA0] = MT8173_MUTEX_MOD_DISP_RDMA0,
+	[DDP_COMPONENT_RDMA1] = MT8173_MUTEX_MOD_DISP_RDMA1,
+	[DDP_COMPONENT_RDMA2] = MT8173_MUTEX_MOD_DISP_RDMA2,
+	[DDP_COMPONENT_UFOE] = MT8173_MUTEX_MOD_DISP_UFOE,
+	[DDP_COMPONENT_WDMA0] = MT8173_MUTEX_MOD_DISP_WDMA0,
+	[DDP_COMPONENT_WDMA1] = MT8173_MUTEX_MOD_DISP_WDMA1,
 };
 
 static unsigned int mtk_ddp_mout_en(enum mtk_ddp_comp_id cur,
-- 
1.7.9.5
