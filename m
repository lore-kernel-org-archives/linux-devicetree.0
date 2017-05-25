From: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v7 32/34] media: imx: capture: add frame sizes/interval enumeration
Date: Wed, 24 May 2017 17:29:47 -0700
Message-ID: <1495672189-29164-33-git-send-email-steve_longerbeam@mentor.com>
References: <1495672189-29164-1-git-send-email-steve_longerbeam@mentor.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1495672189-29164-1-git-send-email-steve_longerbeam-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org, markus.heiser-O6JHGLzbNUwb1SvskN2V4Q@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jean-christophe.trotin-qxv4g6HH51o@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Steve Longerbeam <steve_longerbeam-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>

Add support for enumerating frame sizes and frame intervals from the
first subdev via the V4L2 interfaces.

Signed-off-by: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Signed-off-by: Steve Longerbeam <steve_longerbeam-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
---
 drivers/staging/media/imx/imx-media-capture.c | 73 +++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
index 76c17d9..8b28dbc 100644
--- a/drivers/staging/media/imx/imx-media-capture.c
+++ b/drivers/staging/media/imx/imx-media-capture.c
@@ -81,6 +81,76 @@ static int vidioc_querycap(struct file *file, void *fh,
 	return 0;
 }
 
+static int capture_enum_framesizes(struct file *file, void *fh,
+				   struct v4l2_frmsizeenum *fsize)
+{
+	struct capture_priv *priv = video_drvdata(file);
+	const struct imx_media_pixfmt *cc;
+	struct v4l2_subdev_frame_size_enum fse = {
+		.index = fsize->index,
+		.pad = priv->src_sd_pad,
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+	};
+	int ret;
+
+	cc = imx_media_find_format(fsize->pixel_format, CS_SEL_ANY, true);
+	if (!cc)
+		return -EINVAL;
+
+	fse.code = cc->codes[0];
+
+	ret = v4l2_subdev_call(priv->src_sd, pad, enum_frame_size, NULL, &fse);
+	if (ret)
+		return ret;
+
+	if (fse.min_width == fse.max_width &&
+	    fse.min_height == fse.max_height) {
+		fsize->type = V4L2_FRMSIZE_TYPE_DISCRETE;
+		fsize->discrete.width = fse.min_width;
+		fsize->discrete.height = fse.min_height;
+	} else {
+		fsize->type = V4L2_FRMSIZE_TYPE_CONTINUOUS;
+		fsize->stepwise.min_width = fse.min_width;
+		fsize->stepwise.max_width = fse.max_width;
+		fsize->stepwise.min_height = fse.min_height;
+		fsize->stepwise.max_height = fse.max_height;
+		fsize->stepwise.step_width = 1;
+		fsize->stepwise.step_height = 1;
+	}
+
+	return 0;
+}
+
+static int capture_enum_frameintervals(struct file *file, void *fh,
+				       struct v4l2_frmivalenum *fival)
+{
+	struct capture_priv *priv = video_drvdata(file);
+	const struct imx_media_pixfmt *cc;
+	struct v4l2_subdev_frame_interval_enum fie = {
+		.index = fival->index,
+		.pad = priv->src_sd_pad,
+		.width = fival->width,
+		.height = fival->height,
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+	};
+	int ret;
+
+	cc = imx_media_find_format(fival->pixel_format, CS_SEL_ANY, true);
+	if (!cc)
+		return -EINVAL;
+
+	fie.code = cc->codes[0];
+
+	ret = v4l2_subdev_call(priv->src_sd, pad, enum_frame_interval, NULL, &fie);
+	if (ret)
+		return ret;
+
+	fival->type = V4L2_FRMIVAL_TYPE_DISCRETE;
+	fival->discrete = fie.interval;
+
+	return 0;
+}
+
 static int capture_enum_fmt_vid_cap(struct file *file, void *fh,
 				    struct v4l2_fmtdesc *f)
 {
@@ -269,6 +339,9 @@ static int capture_s_parm(struct file *file, void *fh,
 static const struct v4l2_ioctl_ops capture_ioctl_ops = {
 	.vidioc_querycap	= vidioc_querycap,
 
+	.vidioc_enum_framesizes = capture_enum_framesizes,
+	.vidioc_enum_frameintervals = capture_enum_frameintervals,
+
 	.vidioc_enum_fmt_vid_cap        = capture_enum_fmt_vid_cap,
 	.vidioc_g_fmt_vid_cap           = capture_g_fmt_vid_cap,
 	.vidioc_try_fmt_vid_cap         = capture_try_fmt_vid_cap,
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
