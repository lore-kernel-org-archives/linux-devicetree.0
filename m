From: <yongqiang.niu@mediatek.com>
Subject: [RESEND PATCH v1 11/18] drm/medaitek: add layer_nr for ovl private data
Date: Thu, 14 Mar 2019 20:05:13 +0800
Message-ID: <1552565120-24329-12-git-send-email-yongqiang.niu@mediatek.com>
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

This patch add layer_nr for ovl private data

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index afb313c..a0ab760 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -60,6 +60,7 @@
 struct mtk_disp_ovl_data {
 	unsigned int addr;
 	unsigned int gmc_bits;
+	unsigned int layer_nr;
 	bool fmt_rgb565_is_0;
 };
 
@@ -137,7 +138,9 @@ static void mtk_ovl_config(struct mtk_ddp_comp *comp, unsigned int w,
 
 static unsigned int mtk_ovl_layer_nr(struct mtk_ddp_comp *comp)
 {
-	return 4;
+	struct mtk_disp_ovl *ovl = comp_to_ovl(comp);
+
+	return ovl->data->layer_nr;
 }
 
 static void mtk_ovl_layer_on(struct mtk_ddp_comp *comp, unsigned int idx)
@@ -342,12 +345,14 @@ static int mtk_disp_ovl_remove(struct platform_device *pdev)
 static const struct mtk_disp_ovl_data mt2701_ovl_driver_data = {
 	.addr = DISP_REG_OVL_ADDR_MT2701,
 	.gmc_bits = 8,
+	.layer_nr = 4,
 	.fmt_rgb565_is_0 = false,
 };
 
 static const struct mtk_disp_ovl_data mt8173_ovl_driver_data = {
 	.addr = DISP_REG_OVL_ADDR_MT8173,
 	.gmc_bits = 8,
+	.layer_nr = 4,
 	.fmt_rgb565_is_0 = true,
 };
 
-- 
1.8.1.1.dirty
