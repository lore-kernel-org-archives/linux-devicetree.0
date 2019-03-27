From: <yongqiang.niu@mediatek.com>
Subject: [PATCH v2 17/25] drm/mediatek: add background color input select function for ovl/ovl_2l
Date: Wed, 27 Mar 2019 14:19:13 +0800
Message-ID: <1553667561-25447-18-git-send-email-yongqiang.niu@mediatek.com>
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

This patch add background color input select function for ovl/ovl_2l

ovl include 4 DRAM layer and 1 background color layer
ovl_2l include 4 DRAM layer and 1 background color layer
DRAM layer frame buffer data from render hardware, GPU for example.
backgournd color layer is embed in ovl/ovl_2l, we can only set
it color, but not support DRAM frame buffer.

for ovl0->ovl0_2l direct link usecase,
we need set ovl0_2l background color intput select from ovl0
if render send DRAM buffer layer number <=4, all these layer read
by ovl.
layer0 is at the bottom of all layers.
layer3 is at the top of all layers.
if render send DRAM buffer layer numbfer >=4 && <=6
ovl0 read layer0~3
ovl0_2l read layer4~5
layer5 is at the top ot all these layers.

the decision of how to setting ovl0/ovl0_2l read these layer data
is controlled in mtk crtc, which will be another patch

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index a0ab760..c226284 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -27,6 +27,8 @@
 #define DISP_REG_OVL_EN				0x000c
 #define DISP_REG_OVL_RST			0x0014
 #define DISP_REG_OVL_ROI_SIZE			0x0020
+#define DISP_REG_OVL_DATAPATH_CON		0x0024
+#define OVL_BGCLR_SEL_IN                        BIT(2)
 #define DISP_REG_OVL_ROI_BGCLR			0x0028
 #define DISP_REG_OVL_SRC_CON			0x002c
 #define DISP_REG_OVL_CON(n)			(0x0030 + 0x20 * (n))
@@ -245,6 +247,26 @@ static void mtk_ovl_layer_config(struct mtk_ddp_comp *comp, unsigned int idx,
 		mtk_ovl_layer_on(comp, idx);
 }
 
+static void mtk_ovl_bgclr_in_on(struct mtk_ddp_comp *comp,
+				enum mtk_ddp_comp_id prev)
+{
+	int is_ovl = 0;
+
+        if (prev == DDP_COMPONENT_OVL0 ||
+            prev == DDP_COMPONENT_OVL0_2L ||
+            prev == DDP_COMPONENT_OVL1_2L)
+		is_ovl = 1;
+
+	mtk_ddp_write_mask((is_ovl << 2), comp,
+			   DISP_REG_OVL_DATAPATH_CON, OVL_BGCLR_SEL_IN);
+}
+
+static void mtk_ovl_bgclr_in_off(struct mtk_ddp_comp *comp)
+{
+        mtk_ddp_write_mask(0, comp,
+                           DISP_REG_OVL_DATAPATH_CON, OVL_BGCLR_SEL_IN);
+}
+
 static const struct mtk_ddp_comp_funcs mtk_disp_ovl_funcs = {
 	.config = mtk_ovl_config,
 	.start = mtk_ovl_start,
@@ -255,6 +277,8 @@ static void mtk_ovl_layer_config(struct mtk_ddp_comp *comp, unsigned int idx,
 	.layer_on = mtk_ovl_layer_on,
 	.layer_off = mtk_ovl_layer_off,
 	.layer_config = mtk_ovl_layer_config,
+	.bgclr_in_on = mtk_ovl_bgclr_in_on,
+	.bgclr_in_off = mtk_ovl_bgclr_in_off,
 };
 
 static int mtk_disp_ovl_bind(struct device *dev, struct device *master,
-- 
1.8.1.1.dirty
