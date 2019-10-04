From: Benoit Parrot <bparrot@ti.com>
Subject: [Patch v2 05/21] media: ti-vpe: Add support for SEQ_BT
Date: Fri, 4 Oct 2019 11:29:36 -0500
Message-ID: <20191004162952.4963-6-bparrot@ti.com>
References: <20191004162952.4963-1-bparrot@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191004162952.4963-1-bparrot@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Nikhil Devshatwar <nikhil.nd@ti.com>, Benoit Parrot <bparrot@ti.com>
List-Id: devicetree@vger.kernel.org

From: Nikhil Devshatwar <nikhil.nd@ti.com>

SEQ_BT indicates the buffer for bottom field needs to be processed
before the top field.

Simplify the field selection logic to support SEQ_BT as well.

Modify the interlace flags to include any of alternate, SEQ_TB, SEQ_BT.
Update other format error checking to consider SEQ_BT.
Replace SEQ_TB with SEQ_XX wherever applicable.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/vpe.c | 73 ++++++++++++++++++-----------
 1 file changed, 46 insertions(+), 27 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/vpe.c b/drivers/media/platform/ti-vpe/vpe.c
index 0e9cb0319a92..5d0ec5f7ca25 100644
--- a/drivers/media/platform/ti-vpe/vpe.c
+++ b/drivers/media/platform/ti-vpe/vpe.c
@@ -328,9 +328,14 @@ struct vpe_q_data {
 #define	Q_DATA_MODE_TILED		BIT(1)
 #define	Q_DATA_INTERLACED_ALTERNATE	BIT(2)
 #define	Q_DATA_INTERLACED_SEQ_TB	BIT(3)
+#define	Q_DATA_INTERLACED_SEQ_BT	BIT(4)
+
+#define Q_IS_SEQ_XX		(Q_DATA_INTERLACED_SEQ_TB | \
+				Q_DATA_INTERLACED_SEQ_BT)
 
 #define Q_IS_INTERLACED		(Q_DATA_INTERLACED_ALTERNATE | \
-				Q_DATA_INTERLACED_SEQ_TB)
+				Q_DATA_INTERLACED_SEQ_TB | \
+				Q_DATA_INTERLACED_SEQ_BT)
 
 enum {
 	Q_DATA_SRC = 0,
@@ -1105,24 +1110,31 @@ static void add_in_dtd(struct vpe_ctx *ctx, int port)
 		dma_addr += offset;
 		stride = q_data->bytesperline[VPE_LUMA];
 
-		if (q_data->flags & Q_DATA_INTERLACED_SEQ_TB) {
-			/*
-			 * Use top or bottom field from same vb alternately
-			 * f,f-1,f-2 = TBT when seq is even
-			 * f,f-1,f-2 = BTB when seq is odd
-			 */
-			field = (p_data->vb_index + (ctx->sequence % 2)) % 2;
+		/*
+		 * field used in VPDMA desc  = 0 (top) / 1 (bottom)
+		 * Use top or bottom field from same vb alternately
+		 * For each de-interlacing operation, f,f-1,f-2 should be one
+		 * of TBT or BTB
+		 */
+		if (q_data->flags & Q_DATA_INTERLACED_SEQ_TB ||
+		    q_data->flags & Q_DATA_INTERLACED_SEQ_BT) {
+			/* Select initial value based on format */
+			if (q_data->flags & Q_DATA_INTERLACED_SEQ_BT)
+				field = 1;
+			else
+				field = 0;
+
+			/* Toggle for each vb_index and each operation */
+			field = (field + p_data->vb_index + ctx->sequence) % 2;
 
 			if (field) {
-				/*
-				 * bottom field of a SEQ_TB buffer
-				 * Skip the top field data by
-				 */
 				int height = q_data->height / 2;
 				int bpp = fmt->fourcc == V4L2_PIX_FMT_NV12 ?
 						1 : (vpdma_fmt->depth >> 3);
+
 				if (plane)
 					height /= 2;
+
 				dma_addr += q_data->width * height * bpp;
 			}
 		}
@@ -1177,12 +1189,14 @@ static void device_run(void *priv)
 	struct vpe_q_data *d_q_data = &ctx->q_data[Q_DATA_DST];
 	struct vpe_q_data *s_q_data = &ctx->q_data[Q_DATA_SRC];
 
-	if (ctx->deinterlacing && s_q_data->flags & Q_DATA_INTERLACED_SEQ_TB &&
-		ctx->sequence % 2 == 0) {
-		/* When using SEQ_TB buffers, When using it first time,
-		 * No need to remove the buffer as the next field is present
-		 * in the same buffer. (so that job_ready won't fail)
-		 * It will be removed when using bottom field
+	if (ctx->deinterlacing && s_q_data->flags & Q_IS_SEQ_XX &&
+	    ctx->sequence % 2 == 0) {
+		/* When using SEQ_XX type buffers, each buffer has two fields
+		 * each buffer has two fields (top & bottom)
+		 * Removing one buffer is actually getting two fields
+		 * Alternate between two operations:-
+		 * Even : consume one field but DO NOT REMOVE from queue
+		 * Odd : consume other field and REMOVE from queue
 		 */
 		ctx->src_vbs[0] = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
 		WARN_ON(ctx->src_vbs[0] == NULL);
@@ -1573,8 +1587,10 @@ static int __vpe_try_fmt(struct vpe_ctx *ctx, struct v4l2_format *f,
 		return -EINVAL;
 	}
 
-	if (pix->field != V4L2_FIELD_NONE && pix->field != V4L2_FIELD_ALTERNATE
-			&& pix->field != V4L2_FIELD_SEQ_TB)
+	if (pix->field != V4L2_FIELD_NONE &&
+	    pix->field != V4L2_FIELD_ALTERNATE &&
+	    pix->field != V4L2_FIELD_SEQ_TB &&
+	    pix->field != V4L2_FIELD_SEQ_BT)
 		pix->field = V4L2_FIELD_NONE;
 
 	depth = fmt->vpdma_fmt[VPE_LUMA]->depth;
@@ -1626,9 +1642,9 @@ static int __vpe_try_fmt(struct vpe_ctx *ctx, struct v4l2_format *f,
 
 	/*
 	 * For the actual image parameters, we need to consider the field
-	 * height of the image for SEQ_TB buffers.
+	 * height of the image for SEQ_XX buffers.
 	 */
-	if (pix->field == V4L2_FIELD_SEQ_TB)
+	if (pix->field == V4L2_FIELD_SEQ_TB || pix->field == V4L2_FIELD_SEQ_BT)
 		height = pix->height / 2;
 	else
 		height = pix->height;
@@ -1734,11 +1750,13 @@ static int __vpe_s_fmt(struct vpe_ctx *ctx, struct v4l2_format *f)
 		q_data->flags |= Q_DATA_INTERLACED_ALTERNATE;
 	else if (q_data->field == V4L2_FIELD_SEQ_TB)
 		q_data->flags |= Q_DATA_INTERLACED_SEQ_TB;
+	else if (q_data->field == V4L2_FIELD_SEQ_BT)
+		q_data->flags |= Q_DATA_INTERLACED_SEQ_BT;
 	else
 		q_data->flags &= ~Q_IS_INTERLACED;
 
-	/* the crop height is halved for the case of SEQ_TB buffers */
-	if (q_data->flags & Q_DATA_INTERLACED_SEQ_TB)
+	/* the crop height is halved for the case of SEQ_XX buffers */
+	if (q_data->flags & Q_IS_SEQ_XX)
 		q_data->c_rect.height /= 2;
 
 	vpe_dbg(ctx->dev, "Setting format for type %d, wxh: %dx%d, fmt: %d bpl_y %d",
@@ -1811,10 +1829,10 @@ static int __vpe_try_selection(struct vpe_ctx *ctx, struct v4l2_selection *s)
 	}
 
 	/*
-	 * For SEQ_TB buffers, crop height should be less than the height of
+	 * For SEQ_XX buffers, crop height should be less than the height of
 	 * the field height, not the buffer height
 	 */
-	if (q_data->flags & Q_DATA_INTERLACED_SEQ_TB)
+	if (q_data->flags & Q_IS_SEQ_XX)
 		height = q_data->height / 2;
 	else
 		height = q_data->height;
@@ -2031,7 +2049,8 @@ static int vpe_buf_prepare(struct vb2_buffer *vb)
 		} else {
 			if (vbuf->field != V4L2_FIELD_TOP &&
 			    vbuf->field != V4L2_FIELD_BOTTOM &&
-			    vbuf->field != V4L2_FIELD_SEQ_TB)
+			    vbuf->field != V4L2_FIELD_SEQ_TB &&
+			    vbuf->field != V4L2_FIELD_SEQ_BT)
 				return -EINVAL;
 		}
 	}
-- 
2.17.1
