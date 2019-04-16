From: Stu Hsieh <stu.hsieh@mediatek.com>
Subject: [PATCH v2 14/15] [media] mtk-mipicsi: add debug message for mipicsi driver
Date: Tue, 16 Apr 2019 17:27:42 +0800
Message-ID: <1555406863-18069-15-git-send-email-stu.hsieh@mediatek.com>
References: <1555406863-18069-1-git-send-email-stu.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1555406863-18069-1-git-send-email-stu.hsieh@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, CK Hu <ck.hu@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Stu Hsieh <stu.hsieh@mediatek.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com
List-Id: devicetree@vger.kernel.org

This patch add debug message for mipicsi driver.

Signed-off-by: Stu Hsieh <stu.hsieh@mediatek.com>
---
 .../media/platform/mtk-mipicsi/mtk_mipicsi.c  | 54 ++++++++++++++++++-
 1 file changed, 52 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c b/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
index 5db9c68b0da9..321bb4c88027 100644
--- a/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
+++ b/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
@@ -27,6 +27,7 @@
 #include <linux/kernel.h>
 #include <linux/mm.h>
 #include <linux/moduleparam.h>
+#include <linux/time64.h>
 #include <linux/device.h>
 #include <linux/platform_device.h>
 #include <linux/clk.h>
@@ -117,6 +118,15 @@
 
 #define SerDes_support 1
 
+static int mtk_mipicsi_dbg_level;
+#define mtk_mipicsi_dbg(level, fmt, args...)				 \
+	do {								 \
+		if (mtk_mipicsi_dbg_level >= level)			\
+			pr_info("[MTK_MIPICSI%d] L%d %s %d: " fmt "\n", \
+				mipicsi->id, level,  __func__, __LINE__, \
+				##args);	\
+	} while (0)
+
 /* buffer for one video frame */
 struct mtk_mipicsi_buf {
 	struct list_head queue;
@@ -154,6 +164,8 @@ struct mtk_mipicsi_dev {
 	unsigned long enqueue_cnt;
 	unsigned long dequeue_cnt;
 	struct v4l2_ctrl_handler ctrl_hdl;
+	struct timespec64 fps_time_cur;
+	struct timespec64 fps_time_pre;
 	char drv_name[16];
 	u32 id;
 	int clk_num;
@@ -429,6 +441,8 @@ static int mtk_mipicsi_add_device(struct soc_camera_device *icd)
 
 	mipicsi->width = width;
 	mipicsi->height = height;
+	mtk_mipicsi_dbg(1, "sub device width/height/bytesperline %d/%d/%d",
+		width, height, mipicsi->bytesperline);
 
 	/*
 	 * If power domain was closed before, it will be open.
@@ -565,6 +579,9 @@ static int mtk_mipicsi_set_fmt(struct soc_camera_device *icd,
 	if (pix->pixelformat == V4L2_PIX_FMT_YUYV)
 		pix->sizeimage = pix->width * pix->height * 2U;
 
+	mtk_mipicsi_dbg(0, "width/height/sizeimage %u/%u/%u",
+		pix->width, pix->height, pix->sizeimage);
+
 	if (mf->code != xlate->code)
 		return -EINVAL;
 
@@ -690,6 +707,9 @@ static int mtk_mipicsi_vb2_prepare(struct vb2_buffer *vb)
 			vb2_dma_contig_plane_dma_addr(vb, 0);
 #endif
 		va = vb2_plane_vaddr(vb, 0);
+		mtk_mipicsi_dbg(1, "va=%p vb_dma_addr_phy=%lx size=%d",
+			va, (unsigned long)buf->vb_dma_addr_phy,
+			vb->planes[0].bytesused);
 		buf->vb = vb;
 	}
 
@@ -735,6 +755,8 @@ static void mtk_mipicsi_vb2_queue(struct vb2_buffer *vb)
 		}
 
 	++(mipicsi->enqueue_cnt);
+	mtk_mipicsi_dbg(2, "enqueue NO.%d buffer(%p). Total %lu buffer",
+		vb->index, vb, mipicsi->enqueue_cnt);
 }
 
 static int mtk_mipicsi_vb2_start_streaming(struct vb2_queue *vq,
@@ -1119,8 +1141,10 @@ static int mtk_mipicsi_pm_resume(struct device *dev)
 
 	if (mipicsi->larb_pdev != NULL) {
 		ret = mtk_smi_larb_get(mipicsi->larb_pdev);
-		if (ret != 0)
+		if (ret != 0) {
+			mtk_mipicsi_dbg(0, "failed to get larb, err %d", ret);
 			return ret;
+		}
 	}
 
 	mtk_mipicsi_ana_clk_enable(mipicsi->ana, true);
@@ -1170,6 +1194,7 @@ static void mtk_mipicsi_irq_buf_process(struct mtk_mipicsi_dev *mipicsi)
 	unsigned int next = 0U;
 	u64 offset = 0ULL;
 	u8 link_index = 0U;
+	long time_interval;
 	void __iomem *base = NULL;
 	dma_addr_t pa;
 
@@ -1179,8 +1204,10 @@ static void mtk_mipicsi_irq_buf_process(struct mtk_mipicsi_dev *mipicsi)
 	i = 0;
 
 	/* only one buffer left */
-	if ((&(mipicsi->fb_list))->next->next == &(mipicsi->fb_list))
+	if ((&(mipicsi->fb_list))->next->next == &(mipicsi->fb_list)) {
+		mtk_mipicsi_dbg(1, "only 1 buffer left, drop frame");
 		return;
+	}
 
 	/*for each fb_lst 2 times to get the top 2 buffer.*/
 	list_for_each_entry_safe(new_cam_buf, tmp,
@@ -1213,6 +1240,27 @@ static void mtk_mipicsi_irq_buf_process(struct mtk_mipicsi_dev *mipicsi)
 	++(mipicsi->dequeue_cnt);
 
 	list_del_init(&(mipicsi->cam_buf[index].queue));
+
+	if (mtk_mipicsi_dbg_level >= 2) {
+		ktime_get_real_ts64(&(mipicsi->fps_time_cur));
+		if (mipicsi->dequeue_cnt == 1) {
+			mipicsi->fps_time_pre.tv_sec =
+				mipicsi->fps_time_cur.tv_sec;
+			mipicsi->fps_time_pre.tv_nsec =
+				mipicsi->fps_time_cur.tv_nsec;
+		} else {
+			time_interval = (mipicsi->fps_time_cur.tv_sec
+				- mipicsi->fps_time_pre.tv_sec) * 1000000000
+				+ (mipicsi->fps_time_cur.tv_nsec
+				- mipicsi->fps_time_pre.tv_nsec);
+			mtk_mipicsi_dbg(0, "time interval is %ld\n",
+				time_interval);
+			mipicsi->fps_time_pre.tv_sec =
+				mipicsi->fps_time_cur.tv_sec;
+			mipicsi->fps_time_pre.tv_nsec =
+				mipicsi->fps_time_cur.tv_nsec;
+		}
+	}
 }
 
 static irqreturn_t mtk_mipicsi_isr(int irq, void *data)
@@ -1227,6 +1275,7 @@ static irqreturn_t mtk_mipicsi_isr(int irq, void *data)
 
 	isr_ch = get_irq_channel(mipicsi);
 	if (isr_ch < 0) {
+		mtk_mipicsi_dbg(0, "no interrupt occur");
 		spin_unlock_irqrestore(&mipicsi->lock, flags);
 		return IRQ_HANDLED;
 	}
@@ -1567,5 +1616,6 @@ static struct platform_driver mtk_mipicsi_driver = {
 };
 
 module_platform_driver(mtk_mipicsi_driver);
+module_param(mtk_mipicsi_dbg_level, int, 0644);
 MODULE_DESCRIPTION("MediaTek SoC Camera Host driver");
 MODULE_LICENSE("GPL v2");
-- 
2.18.0
