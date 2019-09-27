From: Benoit Parrot <bparrot@ti.com>
Subject: [Patch 15/16] media: ti-vpe: vpe: fix v4l2_compliance issue related to xfer_func
Date: Fri, 27 Sep 2019 13:36:49 -0500
Message-ID: <20190927183650.31345-16-bparrot@ti.com>
References: <20190927183650.31345-1-bparrot@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190927183650.31345-1-bparrot@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Benoit Parrot <bparrot@ti.com>
List-Id: devicetree@vger.kernel.org

All 4 of the "colorspace" components were not originally handled.
Causing issue related to xfer_func not being initialized properly.

This was found with v4l2-compliance test.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/vpe.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/media/platform/ti-vpe/vpe.c b/drivers/media/platform/ti-vpe/vpe.c
index d7f8eb901475..e30981cd3e8f 100644
--- a/drivers/media/platform/ti-vpe/vpe.c
+++ b/drivers/media/platform/ti-vpe/vpe.c
@@ -324,6 +324,9 @@ struct vpe_q_data {
 	unsigned int		nplanes;			/* Current number of planes */
 	unsigned int		bytesperline[VPE_MAX_PLANES];	/* bytes per line in memory */
 	enum v4l2_colorspace	colorspace;
+	enum v4l2_ycbcr_encoding ycbcr_enc;
+	enum v4l2_xfer_func	xfer_func;
+	enum v4l2_quantization	quant;
 	enum v4l2_field		field;				/* supported field value */
 	unsigned int		flags;
 	unsigned int		sizeimage[VPE_MAX_PLANES];	/* image size in memory */
@@ -1576,6 +1579,9 @@ static int vpe_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
 
 	if (V4L2_TYPE_IS_OUTPUT(f->type)) {
 		pix->colorspace = q_data->colorspace;
+		pix->xfer_func = q_data->xfer_func;
+		pix->ycbcr_enc = q_data->ycbcr_enc;
+		pix->quantization = q_data->quant;
 	} else {
 		struct vpe_q_data *s_q_data;
 
@@ -1583,6 +1589,9 @@ static int vpe_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
 		s_q_data = get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
 
 		pix->colorspace = s_q_data->colorspace;
+		pix->xfer_func = s_q_data->xfer_func;
+		pix->ycbcr_enc = s_q_data->ycbcr_enc;
+		pix->quantization = s_q_data->quant;
 	}
 
 	pix->num_planes = q_data->nplanes;
@@ -1758,6 +1767,9 @@ static int __vpe_s_fmt(struct vpe_ctx *ctx, struct v4l2_format *f)
 	q_data->width		= pix->width;
 	q_data->height		= pix->height;
 	q_data->colorspace	= pix->colorspace;
+	q_data->xfer_func	= pix->xfer_func;
+	q_data->ycbcr_enc	= pix->ycbcr_enc;
+	q_data->quant		= pix->quantization;
 	q_data->field		= pix->field;
 	q_data->nplanes		= pix->num_planes;
 
-- 
2.17.1
