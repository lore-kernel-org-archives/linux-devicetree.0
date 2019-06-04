From: Stu Hsieh <stu.hsieh@mediatek.com>
Subject: [PATCH v4 08/14] [media] mtk-mipicsi: enable/disable cmos for mt2712
Date: Tue, 4 Jun 2019 18:11:49 +0800
Message-ID: <1559643115-15124-9-git-send-email-stu.hsieh@mediatek.com>
References: <1559643115-15124-1-git-send-email-stu.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1559643115-15124-1-git-send-email-stu.hsieh@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, CK Hu <ck.hu@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Stu Hsieh <stu.hsieh@mediatek.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com
List-Id: devicetree@vger.kernel.org

This patch enable/disable cmos setting for mt2712 when
streaming start/stop streaming.

Signed-off-by: Stu Hsieh <stu.hsieh@mediatek.com>
---
 .../media/platform/mtk-mipicsi/mtk_mipicsi.c  | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c b/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
index ea1edbc6401b..8bb40656bcb1 100644
--- a/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
+++ b/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
@@ -88,9 +88,11 @@
 #define CAMSV_MODULE_EN					0x10
 #define CAMSV_FMT_SEL					0x14
 #define CAMSV_INT_EN					0x18
+#define CAMSV_SW_CTL					0x20
 #define CAMSV_CLK_EN					0x30
 
 #define CAMSV_TG_SEN_MODE				0x500
+#define CAMSV_TG_VF_CON					0x504
 #define CAMSV_TG_SEN_GRAB_PXL				0x508
 #define CAMSV_TG_SEN_GRAB_LIN				0x50C
 #define CAMSV_TG_PATH_CFG				0x510
@@ -541,11 +543,41 @@ static void mtk_mipicsi_vb2_queue(struct vb2_buffer *vb)
 	spin_unlock(&mipicsi->queue_lock);
 }
 
+static void mtk_mipicsi_cmos_vf_enable(struct mtk_mipicsi_dev *mipicsi,
+				       unsigned int max_camsv_num,
+				       bool enable)
+{
+	void __iomem *base = NULL;
+	u32 mask = enable ? (u32)1 : ~(u32)1;
+	int i;
+
+	for (i = 0; i < max_camsv_num; i++)
+		if (((mipicsi->link_reg_val >> i) & 0x01U) == 0x01U) {
+			if (enable) {
+				/*enable cmos_en and vf_en*/
+				base = mipicsi->camsv[i];
+				writel(readl(base + CAMSV_TG_SEN_MODE) | mask,
+				       base + CAMSV_TG_SEN_MODE);
+				writel(readl(base + CAMSV_TG_VF_CON) | mask,
+				       base + CAMSV_TG_VF_CON);
+			} else {
+				/*disable cmos_en and vf_en*/
+				base = mipicsi->camsv[i];
+				writel(readl(base + CAMSV_TG_SEN_MODE) & mask,
+					base + CAMSV_TG_SEN_MODE);
+				writel(readl(base + CAMSV_TG_VF_CON) & mask,
+					base + CAMSV_TG_VF_CON);
+			}
+		}
+}
+
 static int mtk_mipicsi_vb2_start_streaming(struct vb2_queue *vq,
 		unsigned int count)
 {
 	struct mtk_mipicsi_dev *mipicsi = vb2_get_drv_priv(vq);
 
+	mtk_mipicsi_cmos_vf_enable(mipicsi, mipicsi->camsv_num, true);
+
 	mipicsi->streamon = true;
 
 	return 0;
@@ -558,6 +590,8 @@ static void mtk_mipicsi_vb2_stop_streaming(struct vb2_queue *vq)
 	struct mtk_mipicsi_buf *tmp = NULL;
 	unsigned int index = 0;
 
+	mtk_mipicsi_cmos_vf_enable(mipicsi, mipicsi->camsv_num, false);
+
 	spin_lock(&mipicsi->queue_lock);
 	while (list_empty(&(mipicsi->fb_list)) == 0) {
 		list_for_each_entry_safe(buf, tmp, &(mipicsi->fb_list), queue) {
-- 
2.18.0
