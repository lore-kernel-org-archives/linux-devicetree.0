From: Benoit Parrot <bparrot@ti.com>
Subject: [Patch v3 17/21] media: ti-vpe: vpe: fix v4l2_compliance issue related to xfer_func
Date: Mon, 7 Oct 2019 10:10:05 -0500
Message-ID: <20191007151009.22095-18-bparrot@ti.com>
References: <20191007151009.22095-1-bparrot@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191007151009.22095-1-bparrot@ti.com>
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
index 295cbcef3a0e..7c74b21e0164 100644
--- a/drivers/media/platform/ti-vpe/vpe.c
+++ b/drivers/media/platform/ti-vpe/vpe.c
@@ -1582,11 +1582,14 @@ static int vpe_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
 		struct vpe_q_data *s_q_data;
 		struct v4l2_pix_format_mplane *spix;
 
-		/* get colorspace from the source queue */
+		/* get colorimetry from the source queue */
 		s_q_data = get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
 		spix = &s_q_data->format.fmt.pix_mp;
 
 		pix->colorspace = spix->colorspace;
+		pix->xfer_func = spix->xfer_func;
+		pix->ycbcr_enc = spix->ycbcr_enc;
+		pix->quantization = spix->quantization;
 	}
 
 	return 0;
-- 
2.17.1
