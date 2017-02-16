From: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v4 27/36] media: imx: csi: add support for bayer formats
Date: Wed, 15 Feb 2017 18:19:29 -0800
Message-ID: <1487211578-11360-28-git-send-email-steve_longerbeam@mentor.com>
References: <1487211578-11360-1-git-send-email-steve_longerbeam@mentor.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1487211578-11360-1-git-send-email-steve_longerbeam-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org, markus.heiser-O6JHGLzbNUwb1SvskN2V4Q@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jean-christophe.trotin-qxv4g6HH51o@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Steve Longerbeam <steve_longerbeam-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>

Bayer formats must be treated as generic data and passthrough mode must
be used.  Add the correct setup for these formats.

Signed-off-by: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>

- added check to csi_link_validate() to verify that destination is
  IDMAC output pad when passthrough conditions exist: bayer formats
  and 16-bit parallel buses.

Signed-off-by: Steve Longerbeam <steve_longerbeam-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
---
 drivers/staging/media/imx/imx-media-csi.c | 50 ++++++++++++++++++++++++++-----
 1 file changed, 42 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index 0343fc3..ae24b42 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -2,6 +2,7 @@
  * V4L2 Capture CSI Subdev for Freescale i.MX5/6 SOC
  *
  * Copyright (c) 2014-2016 Mentor Graphics Inc.
+ * Copyright (C) 2017 Pengutronix, Philipp Zabel <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
@@ -271,10 +272,11 @@ static int csi_idmac_setup_channel(struct csi_priv *priv)
 	struct imx_media_video_dev *vdev = priv->vdev;
 	struct v4l2_of_endpoint *sensor_ep;
 	struct v4l2_mbus_framefmt *infmt;
-	unsigned int burst_size;
 	struct ipu_image image;
+	u32 passthrough_bits;
 	dma_addr_t phys[2];
 	bool passthrough;
+	u32 burst_size;
 	int ret;
 
 	infmt = &priv->format_mbus[CSI_SINK_PAD];
@@ -301,15 +303,38 @@ static int csi_idmac_setup_channel(struct csi_priv *priv)
 	ipu_cpmem_set_burstsize(priv->idmac_ch, burst_size);
 
 	/*
-	 * If the sensor uses 16-bit parallel CSI bus, we must handle
-	 * the data internally in the IPU as 16-bit generic, aka
-	 * passthrough mode.
+	 * Check for conditions that require the IPU to handle the
+	 * data internally as generic data, aka passthrough mode:
+	 * - raw bayer formats
+	 * - the sensor bus is 16-bit parallel
 	 */
-	passthrough = (sensor_ep->bus_type != V4L2_MBUS_CSI2 &&
-		       sensor_ep->bus.parallel.bus_width >= 16);
+	switch (image.pix.pixelformat) {
+	case V4L2_PIX_FMT_SBGGR8:
+	case V4L2_PIX_FMT_SGBRG8:
+	case V4L2_PIX_FMT_SGRBG8:
+	case V4L2_PIX_FMT_SRGGB8:
+		burst_size = 8;
+		passthrough = true;
+		passthrough_bits = 8;
+		break;
+	case V4L2_PIX_FMT_SBGGR16:
+	case V4L2_PIX_FMT_SGBRG16:
+	case V4L2_PIX_FMT_SGRBG16:
+	case V4L2_PIX_FMT_SRGGB16:
+		burst_size = 4;
+		passthrough = true;
+		passthrough_bits = 16;
+		break;
+	default:
+		passthrough = (sensor_ep->bus_type != V4L2_MBUS_CSI2 &&
+			       sensor_ep->bus.parallel.bus_width >= 16);
+		passthrough_bits = 16;
+		break;
+	}
 
 	if (passthrough)
-		ipu_cpmem_set_format_passthrough(priv->idmac_ch, 16);
+		ipu_cpmem_set_format_passthrough(priv->idmac_ch,
+						 passthrough_bits);
 
 	/*
 	 * Set the channel for the direct CSI-->memory via SMFC
@@ -695,6 +720,7 @@ static int csi_link_validate(struct v4l2_subdev *sd,
 			     struct v4l2_subdev_format *sink_fmt)
 {
 	struct csi_priv *priv = v4l2_get_subdevdata(sd);
+	const struct imx_media_pixfmt *incc;
 	struct v4l2_of_endpoint *sensor_ep;
 	bool is_csi2;
 	int ret;
@@ -713,8 +739,16 @@ static int csi_link_validate(struct v4l2_subdev *sd,
 	}
 
 	sensor_ep = &priv->sensor->sensor_ep;
-
 	is_csi2 = (sensor_ep->bus_type == V4L2_MBUS_CSI2);
+	incc = priv->cc[CSI_SINK_PAD];
+
+	if (priv->dest != IPU_CSI_DEST_IDMAC &&
+	    (incc->bayer || (!is_csi2 &&
+			     sensor_ep->bus.parallel.bus_width >= 16))) {
+		v4l2_err(&priv->sd,
+			 "bayer/16-bit parallel buses must go to IDMAC pad\n");
+		return -EINVAL;
+	}
 
 	if (is_csi2) {
 		int vc_num = 0;
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
