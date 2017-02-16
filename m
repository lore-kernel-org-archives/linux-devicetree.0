From: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v4 28/36] media: imx: csi: fix crop rectangle changes in set_fmt
Date: Wed, 15 Feb 2017 18:19:30 -0800
Message-ID: <1487211578-11360-29-git-send-email-steve_longerbeam@mentor.com>
References: <1487211578-11360-1-git-send-email-steve_longerbeam@mentor.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1487211578-11360-1-git-send-email-steve_longerbeam-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org, markus.heiser-O6JHGLzbNUwb1SvskN2V4Q@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jean-christophe.trotin-qxv4g6HH51o@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, Steve Longerbeam <steve_longerbeam-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

The cropping rectangle was being modified by the output pad's
set_fmt, which is the wrong pad to do this. The crop rectangle
should not be modified by the output pad set_fmt. It instead
should be reset to the full input frame when the input pad format
is set.

The output pad set_fmt should set width/height to the current
crop dimensions, or 1/2 the crop width/height to enable
downscaling.

So the other part of this patch is to enable downscaling if
the output pad dimension(s) are 1/2 the crop dimension(s) at
csi_setup() time.

Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Signed-off-by: Steve Longerbeam <steve_longerbeam-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
---
 drivers/staging/media/imx/imx-media-csi.c | 35 ++++++++++++++++++++-----------
 1 file changed, 23 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index ae24b42..3cb97e2 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -531,6 +531,10 @@ static int csi_setup(struct csi_priv *priv)
 
 	ipu_csi_set_window(priv->csi, &priv->crop);
 
+	ipu_csi_set_downsize(priv->csi,
+			     priv->crop.width == 2 * outfmt->width,
+			     priv->crop.height == 2 * outfmt->height);
+
 	ipu_csi_init_interface(priv->csi, &sensor_mbus_cfg, &if_fmt);
 
 	ipu_csi_set_dest(priv->csi, priv->dest);
@@ -890,15 +894,15 @@ static int csi_set_fmt(struct v4l2_subdev *sd,
 	switch (sdformat->pad) {
 	case CSI_SRC_PAD_DIRECT:
 	case CSI_SRC_PAD_IDMAC:
-		crop.left = priv->crop.left;
-		crop.top = priv->crop.top;
-		crop.width = sdformat->format.width;
-		crop.height = sdformat->format.height;
-		ret = csi_try_crop(priv, &crop, sensor);
-		if (ret)
-			return ret;
-		sdformat->format.width = crop.width;
-		sdformat->format.height = crop.height;
+		if (sdformat->format.width < priv->crop.width * 3 / 4)
+			sdformat->format.width = priv->crop.width / 2;
+		else
+			sdformat->format.width = priv->crop.width;
+
+		if (sdformat->format.height < priv->crop.height * 3 / 4)
+			sdformat->format.height = priv->crop.height / 2;
+		else
+			sdformat->format.height = priv->crop.height;
 
 		if (sdformat->pad == CSI_SRC_PAD_IDMAC) {
 			cc = imx_media_find_format(0, sdformat->format.code,
@@ -948,6 +952,14 @@ static int csi_set_fmt(struct v4l2_subdev *sd,
 		}
 		break;
 	case CSI_SINK_PAD:
+		crop.left = 0;
+		crop.top = 0;
+		crop.width = sdformat->format.width;
+		crop.height = sdformat->format.height;
+		ret = csi_try_crop(priv, &crop, sensor);
+		if (ret)
+			return ret;
+
 		cc = imx_media_find_format(0, sdformat->format.code,
 					   true, false);
 		if (!cc) {
@@ -965,9 +977,8 @@ static int csi_set_fmt(struct v4l2_subdev *sd,
 	} else {
 		priv->format_mbus[sdformat->pad] = sdformat->format;
 		priv->cc[sdformat->pad] = cc;
-		/* Update the crop window if this is an output pad  */
-		if (sdformat->pad == CSI_SRC_PAD_DIRECT ||
-		    sdformat->pad == CSI_SRC_PAD_IDMAC)
+		/* Reset the crop window if this is the input pad */
+		if (sdformat->pad == CSI_SINK_PAD)
 			priv->crop = crop;
 	}
 
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
