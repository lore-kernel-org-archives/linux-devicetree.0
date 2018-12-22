Return-Path: <SRS0=BUHn=O7=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-pf1-f196.google.com ([209.85.210.196]:37616 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725846AbeLVRNa (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 22 Dec 2018 12:13:30 -0500
From: Akinobu Mita <akinobu.mita@gmail.com>
Subject: [PATCH 11/12] media: mt9m001: make VIDIOC_SUBDEV_G_FMT ioctl work with V4L2_SUBDEV_FORMAT_TRY
Date: Sun, 23 Dec 2018 02:12:53 +0900
Message-Id: <1545498774-11754-12-git-send-email-akinobu.mita@gmail.com>
In-Reply-To: <1545498774-11754-1-git-send-email-akinobu.mita@gmail.com>
References: <1545498774-11754-1-git-send-email-akinobu.mita@gmail.com>
Sender: devicetree-owner@vger.kernel.org
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc: Akinobu Mita <akinobu.mita@gmail.com>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@s-opensource.com>
List-ID: <devicetree@vger.kernel.org>

The VIDIOC_SUBDEV_G_FMT ioctl for this driver doesn't recognize
V4L2_SUBDEV_FORMAT_TRY and always works as if V4L2_SUBDEV_FORMAT_ACTIVE
is specified.

Cc: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>
Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
---
 drivers/media/i2c/mt9m001.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/media/i2c/mt9m001.c b/drivers/media/i2c/mt9m001.c
index a5b94d7..f4afbc9 100644
--- a/drivers/media/i2c/mt9m001.c
+++ b/drivers/media/i2c/mt9m001.c
@@ -331,6 +331,12 @@ static int mt9m001_get_fmt(struct v4l2_subdev *sd,
 	if (format->pad)
 		return -EINVAL;
 
+	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
+		mf = v4l2_subdev_get_try_format(sd, cfg, 0);
+		format->format = *mf;
+		return 0;
+	}
+
 	mf->width	= mt9m001->rect.width;
 	mf->height	= mt9m001->rect.height;
 	mf->code	= mt9m001->fmt->code;
@@ -638,6 +644,26 @@ static const struct v4l2_subdev_core_ops mt9m001_subdev_core_ops = {
 #endif
 };
 
+static int mt9m001_init_cfg(struct v4l2_subdev *sd,
+			    struct v4l2_subdev_pad_config *cfg)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	struct mt9m001 *mt9m001 = to_mt9m001(client);
+	struct v4l2_mbus_framefmt *try_fmt =
+		v4l2_subdev_get_try_format(sd, cfg, 0);
+
+	try_fmt->width		= mt9m001->rect.width;
+	try_fmt->height		= mt9m001->rect.height;
+	try_fmt->code		= mt9m001->fmt->code;
+	try_fmt->colorspace	= mt9m001->fmt->colorspace;
+	try_fmt->field		= V4L2_FIELD_NONE;
+	try_fmt->ycbcr_enc	= V4L2_YCBCR_ENC_DEFAULT;
+	try_fmt->quantization	= V4L2_QUANTIZATION_DEFAULT;
+	try_fmt->xfer_func	= V4L2_XFER_FUNC_DEFAULT;
+
+	return 0;
+}
+
 static int mt9m001_enum_mbus_code(struct v4l2_subdev *sd,
 		struct v4l2_subdev_pad_config *cfg,
 		struct v4l2_subdev_mbus_code_enum *code)
@@ -674,6 +700,7 @@ static const struct v4l2_subdev_sensor_ops mt9m001_subdev_sensor_ops = {
 };
 
 static const struct v4l2_subdev_pad_ops mt9m001_subdev_pad_ops = {
+	.init_cfg	= mt9m001_init_cfg,
 	.enum_mbus_code = mt9m001_enum_mbus_code,
 	.get_selection	= mt9m001_get_selection,
 	.set_selection	= mt9m001_set_selection,
-- 
2.7.4
