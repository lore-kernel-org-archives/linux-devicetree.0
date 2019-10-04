From: Benoit Parrot <bparrot@ti.com>
Subject: [Patch v2 17/21] media: ti-vpe: vpe: fix v4l2_compliance issue related to xfer_func
Date: Fri, 4 Oct 2019 11:29:48 -0500
Message-ID: <20191004162952.4963-18-bparrot@ti.com>
References: <20191004162952.4963-1-bparrot@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191004162952.4963-1-bparrot@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Benoit Parrot <bparrot@ti.com>
List-Id: devicetree@vger.kernel.org

All 4 of the "colorspace" components were not originally handled.
Causing issue related to xfer_func not being initialized properly.

This was found with v4l2-compliance test.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/vpe.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti-vpe/vpe.c b/drivers/media/platform/ti-vpe/vpe.c
index 5b1e9908fff2..19b027c5478a 100644
--- a/drivers/media/platform/ti-vpe/vpe.c
+++ b/drivers/media/platform/ti-vpe/vpe.c
@@ -1578,10 +1578,13 @@ static int vpe_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
 	if (!V4L2_TYPE_IS_OUTPUT(f->type)) {
 		struct vpe_q_data *s_q_data;
 
-		/* get colorspace from the source queue */
+		/* get colorimetry from the source queue */
 		s_q_data = get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
 
 		pix->colorspace = s_q_data->format.fmt.pix_mp.colorspace;
+		pix->xfer_func = s_q_data->format.fmt.pix_mp.xfer_func;
+		pix->ycbcr_enc = s_q_data->format.fmt.pix_mp.ycbcr_enc;
+		pix->quantization = s_q_data->format.fmt.pix_mp.quantization;
 	}
 
 	return 0;
-- 
2.17.1
