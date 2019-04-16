From: Stu Hsieh <stu.hsieh@mediatek.com>
Subject: [PATCH v2 11/15] [media] mtk-mipicsi: set the output address in HW reg
Date: Tue, 16 Apr 2019 17:27:39 +0800
Message-ID: <1555406863-18069-12-git-send-email-stu.hsieh@mediatek.com>
References: <1555406863-18069-1-git-send-email-stu.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1555406863-18069-1-git-send-email-stu.hsieh@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, CK Hu <ck.hu@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Stu Hsieh <stu.hsieh@mediatek.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com
List-Id: devicetree@vger.kernel.org

This patch set the output address in HW reg when buffer queue and ISR.

Signed-off-by: Stu Hsieh <stu.hsieh@mediatek.com>
---
 .../media/platform/mtk-mipicsi/mtk_mipicsi.c  | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c b/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
index 3624186206bd..4027ed9c94f3 100644
--- a/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
+++ b/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
@@ -109,6 +109,7 @@
 #define CAMSV_TG_SEN_GRAB_LIN				0x50C
 #define CAMSV_TG_PATH_CFG				0x510
 
+#define IMGO_BASE_ADDR					0x220
 #define IMGO_XSIZE					0x230
 #define IMGO_YSIZE					0x234
 #define IMGO_STRIDE					0x238
@@ -516,12 +517,22 @@ static int mtk_mipicsi_vb2_prepare(struct vb2_buffer *vb)
 	return 0;
 }
 
+static void mtk_mipicsi_fill_buffer(void __iomem *base, dma_addr_t dma_handle)
+{
+	writel(dma_handle, base + IMGO_BASE_ADDR);
+}
+
 static void mtk_mipicsi_vb2_queue(struct vb2_buffer *vb)
 {
 	struct soc_camera_device *icd = soc_camera_from_vb2q(vb->vb2_queue);
 	struct soc_camera_host *ici = to_soc_camera_host(icd->parent);
 	struct mtk_mipicsi_dev *mipicsi = ici->priv;
+	unsigned int i = 0;
+	u64 offset = 0;
+	u8 link_index = 0U;
 	char *va = NULL;
+	u32 bytesperline = mipicsi->bytesperline;
+	u32 height = mipicsi->height;
 
 	spin_lock(&mipicsi->queue_lock);
 	list_add_tail(&(mipicsi->cam_buf[vb->index].queue),
@@ -530,6 +541,20 @@ static void mtk_mipicsi_vb2_queue(struct vb2_buffer *vb)
 
 	va = vb2_plane_vaddr(vb, 0);
 
+	for (i = 0U; (mipicsi->enqueue_cnt == 0UL) && (i < MTK_CAMDMA_MAX_NUM);
+		++i)
+		if (((mipicsi->link_reg_val >> i) & 0x01U) == 0x01U) {
+			offset = (u64)link_index * bytesperline * height;
+
+			spin_lock(&mipicsi->lock);
+			mtk_mipicsi_fill_buffer(mipicsi->camsv[i],
+				mipicsi->cam_buf[vb->index].vb_dma_addr_phy
+					+ offset);
+			spin_unlock(&mipicsi->lock);
+
+			link_index++;
+		}
+
 	++(mipicsi->enqueue_cnt);
 }
 
@@ -961,6 +986,10 @@ static void mtk_mipicsi_irq_buf_process(struct mtk_mipicsi_dev *mipicsi)
 	struct mtk_mipicsi_buf *tmp = NULL;
 	unsigned int index = 0U;
 	unsigned int next = 0U;
+	u64 offset = 0ULL;
+	u8 link_index = 0U;
+	void __iomem *base = NULL;
+	dma_addr_t pa;
 
 	for (i = 0U; i < MTK_CAMDMA_MAX_NUM; ++i)
 		mipicsi->irq_status[i] = false;
@@ -983,6 +1012,16 @@ static void mtk_mipicsi_irq_buf_process(struct mtk_mipicsi_dev *mipicsi)
 		++i;
 	}
 
+	for (i = 0U; i < MTK_CAMDMA_MAX_NUM; ++i) {
+		if (((mipicsi->link_reg_val >> i) & 0x01U) == 0x01U) {
+			offset = (u64)link_index *
+				mipicsi->bytesperline * mipicsi->height;
+			base = mipicsi->camsv[i];
+			pa = mipicsi->cam_buf[next].vb_dma_addr_phy;
+			mtk_mipicsi_fill_buffer(base, pa + offset);
+			link_index++;
+		}
+	}
 	/*
 	 * fb_list has one more buffer. Free the first buffer to user
 	 * and fill the second buffer to HW.
-- 
2.18.0
