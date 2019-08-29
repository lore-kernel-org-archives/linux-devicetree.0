From: <yongqiang.niu@mediatek.com>
Subject: [PATCH v5, 29/32] drm/mediatek: add connection from OVL_2L1 to RDMA1
Date: Thu, 29 Aug 2019 22:50:51 +0800
Message-ID: <1567090254-15566-30-git-send-email-yongqiang.niu@mediatek.com>
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

This patch add connection from OVL_2L1 to RDMA1

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
index 943e114..237824f 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
@@ -34,9 +34,11 @@
 #define DISP_REG_CONFIG_DPI_SEL			0x064
 
 #define MT8183_DISP_OVL0_2L_MOUT_EN		0xf04
+#define MT8183_DISP_OVL1_2L_MOUT_EN		0xf08
 #define MT8183_DISP_PATH0_SEL_IN		0xf24
 
 #define OVL0_2L_MOUT_EN_DISP_PATH0			BIT(0)
+#define OVL1_2L_MOUT_EN_RDMA1				BIT(4)
 #define DISP_PATH0_SEL_IN_OVL0_2L			0x1
 
 #define MT2701_DISP_MUTEX0_MOD0			0x2c
@@ -317,6 +319,10 @@ static unsigned int mtk_ddp_mout_en(const struct mtk_mmsys_reg_data *data,
 		   next == DDP_COMPONENT_RDMA0) {
 		*addr = MT8183_DISP_OVL0_2L_MOUT_EN;
 		value = OVL0_2L_MOUT_EN_DISP_PATH0;
+	} else if (cur == DDP_COMPONENT_OVL_2L1 &&
+		   next == DDP_COMPONENT_RDMA1) {
+		*addr = MT8183_DISP_OVL1_2L_MOUT_EN;
+		value = OVL1_2L_MOUT_EN_RDMA1;
 	} else {
 		value = 0;
 	}
-- 
1.8.1.1.dirty
