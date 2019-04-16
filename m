From: Stu Hsieh <stu.hsieh@mediatek.com>
Subject: [PATCH v2 09/15] [media] mtk-mipicsi: enable/disable cmos for mt2712
Date: Tue, 16 Apr 2019 17:30:09 +0800
Message-ID: <1555407015-18130-10-git-send-email-stu.hsieh@mediatek.com>
References: <1555407015-18130-1-git-send-email-stu.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1555407015-18130-1-git-send-email-stu.hsieh@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, CK Hu <ck.hu@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Stu Hsieh <stu.hsieh@mediatek.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com
List-Id: devicetree@vger.kernel.org

This patch enable/disable cmos setting for mt2712 when
vb2 start/stop streaming.

Signed-off-by: Stu Hsieh <stu.hsieh@mediatek.com>
---
 .../media/platform/mtk-mipicsi/mtk_mipicsi.c  | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c b/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
index 8a4079f0ed9b..7331543d400a 100644
--- a/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
+++ b/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
@@ -97,9 +97,11 @@
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
@@ -531,9 +533,25 @@ static int mtk_mipicsi_vb2_start_streaming(struct vb2_queue *vq,
 	struct soc_camera_device *icd = soc_camera_from_vb2q(vq);
 	struct soc_camera_host *ici = to_soc_camera_host(icd->parent);
 	struct mtk_mipicsi_dev *mipicsi = ici->priv;
+	unsigned int index = 0;
+	void __iomem *base = NULL;
 
 	icd->vdev->queue = vq;
 
+	for (index = 0U; index < MTK_CAMDMA_MAX_NUM; ++index)
+		if (((mipicsi->link_reg_val >> index) & 0x01U) == 0x01U &&
+			!mipicsi->is_enable_irq[index]) {
+			enable_irq(mipicsi->irq[index]);
+			mipicsi->is_enable_irq[index] = true;
+
+			/*enable cmos_en and vf_en*/
+			base = mipicsi->camsv[index];
+			writel(0x00000001U | readl(base + CAMSV_TG_SEN_MODE),
+				base + CAMSV_TG_SEN_MODE);
+			writel(0x00000001U | readl(base + CAMSV_TG_VF_CON),
+				base + CAMSV_TG_VF_CON);
+		}
+
 	mipicsi->streamon = true;
 	return 0;
 }
@@ -543,7 +561,29 @@ static void mtk_mipicsi_vb2_stop_streaming(struct vb2_queue *vq)
 	struct mtk_mipicsi_dev *mipicsi = vb2_get_drv_priv(vq);
 	struct mtk_mipicsi_buf *buf = NULL;
 	struct mtk_mipicsi_buf *tmp = NULL;
+	unsigned int i = 0U;
 	unsigned int index = 0;
+	void __iomem *base = NULL;
+
+	for (i = 0U; i < MTK_CAMDMA_MAX_NUM; ++i)
+		if (((mipicsi->link_reg_val >> i) & 0x01U) == 0x01U) {
+			/*disable cmos_en and vf_en*/
+			base = mipicsi->camsv[i];
+			writel(readl(base + CAMSV_TG_SEN_MODE) & 0xFFFFFFFEU,
+				base + CAMSV_TG_SEN_MODE);
+			writel(readl(base + CAMSV_TG_VF_CON) & 0xFFFFFFFEU,
+				base + CAMSV_TG_VF_CON);
+			/*camsv reset*/
+			base = mipicsi->camsv[i];
+			writel(0x00000004U | readl(base + CAMSV_SW_CTL),
+				base + CAMSV_SW_CTL);
+			writel(readl(base + CAMSV_SW_CTL) & 0xFFFFFFFBU,
+				base + CAMSV_SW_CTL);
+			disable_irq(mipicsi->irq[i]);
+			mipicsi->is_enable_irq[i] = false;
+			mipicsi->frame_cnt[i] = 0UL;
+			mipicsi->irq_status[i] = false;
+		}
 
 	spin_lock(&mipicsi->queue_lock);
 	while (list_empty(&(mipicsi->fb_list)) == 0) {
-- 
2.18.0
