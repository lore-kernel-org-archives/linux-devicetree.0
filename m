From: Benoit Parrot <bparrot@ti.com>
Subject: [Patch v2 02/21] media: ti-vpe: vpe: Fix Motion Vector vpdma stride
Date: Fri, 4 Oct 2019 11:29:33 -0500
Message-ID: <20191004162952.4963-3-bparrot@ti.com>
References: <20191004162952.4963-1-bparrot@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191004162952.4963-1-bparrot@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Benoit Parrot <bparrot@ti.com>
List-Id: devicetree@vger.kernel.org

commit 52831a418fa6 ("[media] media: ti-vpe: vpe: allow use of user
specified stride") and commit 8c1e4fa17e92 ("[media] media: ti-vpe: vpdma:
add support for user specified stride") resulted in the Motion Vector
stride to be the same as the image stride.

This caused memory corruption in the output image as mentionned in
commit 44f98adf71a8 ("[media] media: ti-vpe: vpe: Fix line stride
for output motion vector").

Fixes: 52831a418fa6 ("[media] media: ti-vpe: vpe: allow use of user specified stride")
Fixes: 8c1e4fa17e92 ("[media] media: ti-vpe: vpdma: add support for user specified stride")
Signed-off-by: Benoit Parrot <bparrot@ti.com>
Acked-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 drivers/media/platform/ti-vpe/vpe.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/vpe.c b/drivers/media/platform/ti-vpe/vpe.c
index 60b575bb44c4..5ba72445584d 100644
--- a/drivers/media/platform/ti-vpe/vpe.c
+++ b/drivers/media/platform/ti-vpe/vpe.c
@@ -1013,11 +1013,14 @@ static void add_out_dtd(struct vpe_ctx *ctx, int port)
 	dma_addr_t dma_addr;
 	u32 flags = 0;
 	u32 offset = 0;
+	u32 stride;
 
 	if (port == VPE_PORT_MV_OUT) {
 		vpdma_fmt = &vpdma_misc_fmts[VPDMA_DATA_FMT_MV];
 		dma_addr = ctx->mv_buf_dma[mv_buf_selector];
 		q_data = &ctx->q_data[Q_DATA_SRC];
+		stride = ALIGN((q_data->width * vpdma_fmt->depth) >> 3,
+			       VPDMA_STRIDE_ALIGN);
 	} else {
 		/* to incorporate interleaved formats */
 		int plane = fmt->coplanar ? p_data->vb_part : 0;
@@ -1044,6 +1047,7 @@ static void add_out_dtd(struct vpe_ctx *ctx, int port)
 		}
 		/* Apply the offset */
 		dma_addr += offset;
+		stride = q_data->bytesperline[VPE_LUMA];
 	}
 
 	if (q_data->flags & Q_DATA_FRAME_1D)
@@ -1055,7 +1059,7 @@ static void add_out_dtd(struct vpe_ctx *ctx, int port)
 			   MAX_W, MAX_H);
 
 	vpdma_add_out_dtd(&ctx->desc_list, q_data->width,
-			  q_data->bytesperline[VPE_LUMA], &q_data->c_rect,
+			  stride, &q_data->c_rect,
 			  vpdma_fmt, dma_addr, MAX_OUT_WIDTH_REG1,
 			  MAX_OUT_HEIGHT_REG1, p_data->channel, flags);
 }
@@ -1074,10 +1078,13 @@ static void add_in_dtd(struct vpe_ctx *ctx, int port)
 	dma_addr_t dma_addr;
 	u32 flags = 0;
 	u32 offset = 0;
+	u32 stride;
 
 	if (port == VPE_PORT_MV_IN) {
 		vpdma_fmt = &vpdma_misc_fmts[VPDMA_DATA_FMT_MV];
 		dma_addr = ctx->mv_buf_dma[mv_buf_selector];
+		stride = ALIGN((q_data->width * vpdma_fmt->depth) >> 3,
+			       VPDMA_STRIDE_ALIGN);
 	} else {
 		/* to incorporate interleaved formats */
 		int plane = fmt->coplanar ? p_data->vb_part : 0;
@@ -1104,6 +1111,7 @@ static void add_in_dtd(struct vpe_ctx *ctx, int port)
 		}
 		/* Apply the offset */
 		dma_addr += offset;
+		stride = q_data->bytesperline[VPE_LUMA];
 
 		if (q_data->flags & Q_DATA_INTERLACED_SEQ_TB) {
 			/*
@@ -1139,10 +1147,10 @@ static void add_in_dtd(struct vpe_ctx *ctx, int port)
 	if (p_data->vb_part && fmt->fourcc == V4L2_PIX_FMT_NV12)
 		frame_height /= 2;
 
-	vpdma_add_in_dtd(&ctx->desc_list, q_data->width,
-			 q_data->bytesperline[VPE_LUMA], &q_data->c_rect,
-		vpdma_fmt, dma_addr, p_data->channel, field, flags, frame_width,
-		frame_height, 0, 0);
+	vpdma_add_in_dtd(&ctx->desc_list, q_data->width, stride,
+			 &q_data->c_rect, vpdma_fmt, dma_addr,
+			 p_data->channel, field, flags, frame_width,
+			 frame_height, 0, 0);
 }
 
 /*
-- 
2.17.1
