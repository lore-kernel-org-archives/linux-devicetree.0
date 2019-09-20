From: Benoit Parrot <bparrot@ti.com>
Subject: [Patch v3 06/13] media: am437x-vpfe: Streamlined vb2 buffer cleanup
Date: Fri, 20 Sep 2019 12:05:47 -0500
Message-ID: <20190920170554.29666-7-bparrot@ti.com>
References: <20190920170554.29666-1-bparrot@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190920170554.29666-1-bparrot@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Prabhakar Lad <prabhakar.csengg@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Benoit Parrot <bparrot@ti.com>
List-Id: devicetree@vger.kernel.org

Returning queued vb2 buffers back to user space is a common
task best handled by a helper function.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/am437x/am437x-vpfe.c | 53 ++++++++++-----------
 1 file changed, 25 insertions(+), 28 deletions(-)

diff --git a/drivers/media/platform/am437x/am437x-vpfe.c b/drivers/media/platform/am437x/am437x-vpfe.c
index e0a4c8920df8..03415c179c85 100644
--- a/drivers/media/platform/am437x/am437x-vpfe.c
+++ b/drivers/media/platform/am437x/am437x-vpfe.c
@@ -1949,6 +1949,29 @@ static void vpfe_buffer_queue(struct vb2_buffer *vb)
 	spin_unlock_irqrestore(&vpfe->dma_queue_lock, flags);
 }
 
+static void vpfe_return_all_buffers(struct vpfe_device *vpfe,
+				    enum vb2_buffer_state state)
+{
+	struct vpfe_cap_buffer *buf, *node;
+	unsigned long flags;
+
+	spin_lock_irqsave(&vpfe->dma_queue_lock, flags);
+	list_for_each_entry_safe(buf, node, &vpfe->dma_queue, list) {
+		vb2_buffer_done(&buf->vb.vb2_buf, state);
+		list_del(&buf->list);
+	}
+
+	if (vpfe->cur_frm)
+		vb2_buffer_done(&vpfe->cur_frm->vb.vb2_buf, state);
+
+	if (vpfe->next_frm && vpfe->next_frm != vpfe->cur_frm)
+		vb2_buffer_done(&vpfe->next_frm->vb.vb2_buf, state);
+
+	vpfe->cur_frm = NULL;
+	vpfe->next_frm = NULL;
+	spin_unlock_irqrestore(&vpfe->dma_queue_lock, flags);
+}
+
 /*
  * vpfe_start_streaming : Starts the DMA engine for streaming
  * @vb: ptr to vb2_buffer
@@ -1957,7 +1980,6 @@ static void vpfe_buffer_queue(struct vb2_buffer *vb)
 static int vpfe_start_streaming(struct vb2_queue *vq, unsigned int count)
 {
 	struct vpfe_device *vpfe = vb2_get_drv_priv(vq);
-	struct vpfe_cap_buffer *buf, *tmp;
 	struct vpfe_subdev_info *sdinfo;
 	unsigned long flags;
 	unsigned long addr;
@@ -2003,11 +2025,7 @@ static int vpfe_start_streaming(struct vb2_queue *vq, unsigned int count)
 	return 0;
 
 err:
-	list_for_each_entry_safe(buf, tmp, &vpfe->dma_queue, list) {
-		list_del(&buf->list);
-		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_QUEUED);
-	}
-
+	vpfe_return_all_buffers(vpfe, VB2_BUF_STATE_QUEUED);
 	vpfe_pcr_enable(&vpfe->ccdc, 0);
 	return ret;
 }
@@ -2023,7 +2041,6 @@ static void vpfe_stop_streaming(struct vb2_queue *vq)
 {
 	struct vpfe_device *vpfe = vb2_get_drv_priv(vq);
 	struct vpfe_subdev_info *sdinfo;
-	unsigned long flags;
 	int ret;
 
 	vpfe_pcr_enable(&vpfe->ccdc, 0);
@@ -2041,27 +2058,7 @@ static void vpfe_stop_streaming(struct vb2_queue *vq)
 		vpfe_dbg(1, vpfe, "stream off failed in subdev\n");
 
 	/* release all active buffers */
-	spin_lock_irqsave(&vpfe->dma_queue_lock, flags);
-	if (vpfe->cur_frm == vpfe->next_frm) {
-		vb2_buffer_done(&vpfe->cur_frm->vb.vb2_buf,
-				VB2_BUF_STATE_ERROR);
-	} else {
-		if (vpfe->cur_frm != NULL)
-			vb2_buffer_done(&vpfe->cur_frm->vb.vb2_buf,
-					VB2_BUF_STATE_ERROR);
-		if (vpfe->next_frm != NULL)
-			vb2_buffer_done(&vpfe->next_frm->vb.vb2_buf,
-					VB2_BUF_STATE_ERROR);
-	}
-
-	while (!list_empty(&vpfe->dma_queue)) {
-		vpfe->next_frm = list_entry(vpfe->dma_queue.next,
-						struct vpfe_cap_buffer, list);
-		list_del(&vpfe->next_frm->list);
-		vb2_buffer_done(&vpfe->next_frm->vb.vb2_buf,
-				VB2_BUF_STATE_ERROR);
-	}
-	spin_unlock_irqrestore(&vpfe->dma_queue_lock, flags);
+	vpfe_return_all_buffers(vpfe, VB2_BUF_STATE_ERROR);
 }
 
 static int vpfe_g_pixelaspect(struct file *file, void *priv,
-- 
2.17.1
