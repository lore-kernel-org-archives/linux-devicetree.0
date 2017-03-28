From: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v6 38/39] media: imx-ic-prpencvf: add frame size enumeration
Date: Mon, 27 Mar 2017 17:40:55 -0700
Message-ID: <1490661656-10318-39-git-send-email-steve_longerbeam@mentor.com>
References: <1490661656-10318-1-git-send-email-steve_longerbeam@mentor.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1490661656-10318-1-git-send-email-steve_longerbeam-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org, markus.heiser-O6JHGLzbNUwb1SvskN2V4Q@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jean-christophe.trotin-qxv4g6HH51o@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, Steve Longerbeam <steve_longerbeam-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add frame size enumeration operation. The PRP ENC/VF subdevices
are scalers, so they can output a continuous range of widths/
heights on their source pads.

Signed-off-by: Steve Longerbeam <steve_longerbeam-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
---
 drivers/staging/media/imx/imx-ic-prpencvf.c | 40 +++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/staging/media/imx/imx-ic-prpencvf.c b/drivers/staging/media/imx/imx-ic-prpencvf.c
index 4123b03..860b406 100644
--- a/drivers/staging/media/imx/imx-ic-prpencvf.c
+++ b/drivers/staging/media/imx/imx-ic-prpencvf.c
@@ -875,6 +875,45 @@ static int prp_set_fmt(struct v4l2_subdev *sd,
 	return ret;
 }
 
+static int prp_enum_frame_size(struct v4l2_subdev *sd,
+			       struct v4l2_subdev_pad_config *cfg,
+			       struct v4l2_subdev_frame_size_enum *fse)
+{
+	struct prp_priv *priv = sd_to_priv(sd);
+	struct v4l2_subdev_format format = {0};
+	const struct imx_media_pixfmt *cc;
+	int ret = 0;
+
+	if (fse->pad >= PRPENCVF_NUM_PADS || fse->index != 0)
+		return -EINVAL;
+
+	mutex_lock(&priv->lock);
+
+	format.pad = fse->pad;
+	format.which = fse->which;
+	format.format.code = fse->code;
+	format.format.width = 1;
+	format.format.height = 1;
+	prp_try_fmt(priv, cfg, &format, &cc);
+	fse->min_width = format.format.width;
+	fse->min_height = format.format.height;
+
+	if (format.format.code != fse->code) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	format.format.code = fse->code;
+	format.format.width = -1;
+	format.format.height = -1;
+	prp_try_fmt(priv, cfg, &format, &cc);
+	fse->max_width = format.format.width;
+	fse->max_height = format.format.height;
+out:
+	mutex_unlock(&priv->lock);
+	return ret;
+}
+
 static int prp_link_setup(struct media_entity *entity,
 			  const struct media_pad *local,
 			  const struct media_pad *remote, u32 flags)
@@ -1125,6 +1164,7 @@ static void prp_unregistered(struct v4l2_subdev *sd)
 
 static struct v4l2_subdev_pad_ops prp_pad_ops = {
 	.enum_mbus_code = prp_enum_mbus_code,
+	.enum_frame_size = prp_enum_frame_size,
 	.get_fmt = prp_get_fmt,
 	.set_fmt = prp_set_fmt,
 	.link_validate = prp_link_validate,
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
