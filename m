From: <yongqiang.niu@mediatek.com>
Subject: [RESEND PATCH v1 10/18] drm/mediatek: add gmc_bits for ovl private data
Date: Thu, 14 Mar 2019 20:05:12 +0800
Message-ID: <1552565120-24329-11-git-send-email-yongqiang.niu@mediatek.com>
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

This patch add gmc_bits for ovl private data

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 28d1911..afb313c 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -39,7 +39,9 @@
 #define DISP_REG_OVL_ADDR_MT8173		0x0f40
 #define DISP_REG_OVL_ADDR(ovl, n)		((ovl)->data->addr + 0x20 * (n))
 
-#define	OVL_RDMA_MEM_GMC	0x40402020
+#define GMC_THRESHOLD_BITS	16
+#define GMC_THRESHOLD_HIGH	((1 << GMC_THRESHOLD_BITS) / 4)
+#define GMC_THRESHOLD_LOW	((1 << GMC_THRESHOLD_BITS) / 8)
 
 #define OVL_CON_BYTE_SWAP	BIT(24)
 #define OVL_CON_MTX_YUV_TO_RGB	(6 << 16)
@@ -57,6 +59,7 @@
 
 struct mtk_disp_ovl_data {
 	unsigned int addr;
+	unsigned int gmc_bits;
 	bool fmt_rgb565_is_0;
 };
 
@@ -140,9 +143,23 @@ static unsigned int mtk_ovl_layer_nr(struct mtk_ddp_comp *comp)
 static void mtk_ovl_layer_on(struct mtk_ddp_comp *comp, unsigned int idx)
 {
 	unsigned int reg;
+	unsigned int gmc_thrshd_l;
+	unsigned int gmc_thrshd_h;
+	unsigned int gmc_value;
+	struct mtk_disp_ovl *ovl = comp_to_ovl(comp);
 
 	writel(0x1, comp->regs + DISP_REG_OVL_RDMA_CTRL(idx));
-	writel(OVL_RDMA_MEM_GMC, comp->regs + DISP_REG_OVL_RDMA_GMC(idx));
+
+	gmc_thrshd_l = GMC_THRESHOLD_LOW >>
+		      (GMC_THRESHOLD_BITS - ovl->data->gmc_bits);
+	gmc_thrshd_h = GMC_THRESHOLD_HIGH >>
+		      (GMC_THRESHOLD_BITS - ovl->data->gmc_bits);
+	if (ovl->data->gmc_bits == 10)
+		gmc_value = gmc_thrshd_h | gmc_thrshd_h << 16;
+	else
+		gmc_value = gmc_thrshd_l | gmc_thrshd_l << 8 |
+			    gmc_thrshd_h << 16 | gmc_thrshd_h << 24;
+	writel(gmc_value, comp->regs + DISP_REG_OVL_RDMA_GMC(idx));
 
 	reg = readl(comp->regs + DISP_REG_OVL_SRC_CON);
 	reg = reg | BIT(idx);
@@ -324,11 +341,13 @@ static int mtk_disp_ovl_remove(struct platform_device *pdev)
 
 static const struct mtk_disp_ovl_data mt2701_ovl_driver_data = {
 	.addr = DISP_REG_OVL_ADDR_MT2701,
+	.gmc_bits = 8,
 	.fmt_rgb565_is_0 = false,
 };
 
 static const struct mtk_disp_ovl_data mt8173_ovl_driver_data = {
 	.addr = DISP_REG_OVL_ADDR_MT8173,
+	.gmc_bits = 8,
 	.fmt_rgb565_is_0 = true,
 };
 
-- 
1.8.1.1.dirty
