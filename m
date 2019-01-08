Return-Path: <SRS0=mSv1=PQ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-pg1-f196.google.com ([209.85.215.196]:35557 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728787AbfAHOwo (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 8 Jan 2019 09:52:44 -0500
From: Akinobu Mita <akinobu.mita@gmail.com>
Subject: [PATCH v2 12/13] media: mt9m001: make VIDIOC_SUBDEV_G_FMT ioctl work with V4L2_SUBDEV_FORMAT_TRY
Date: Tue,  8 Jan 2019 23:51:49 +0900
Message-Id: <1546959110-19445-13-git-send-email-akinobu.mita@gmail.com>
In-Reply-To: <1546959110-19445-1-git-send-email-akinobu.mita@gmail.com>
References: <1546959110-19445-1-git-send-email-akinobu.mita@gmail.com>
Sender: devicetree-owner@vger.kernel.org
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc: Akinobu Mita <akinobu.mita@gmail.com>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
List-ID: <devicetree@vger.kernel.org>

The VIDIOC_SUBDEV_G_FMT ioctl for this driver doesn't recognize
V4L2_SUBDEV_FORMAT_TRY and always works as if V4L2_SUBDEV_FORMAT_ACTIVE
is specified.

Cc: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
---
* v2
- Set initial try format with default configuration instead of
  current one.

 drivers/media/i2c/mt9m001.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/media/i2c/mt9m001.c b/drivers/media/i2c/mt9m001.c
index 66a0928..f97ab48 100644
--- a/drivers/media/i2c/mt9m001.c
+++ b/drivers/media/i2c/mt9m001.c
@@ -329,6 +329,12 @@ static int mt9m001_get_fmt(struct v4l2_subdev *sd,
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
@@ -642,6 +648,26 @@ static const struct v4l2_subdev_core_ops mt9m001_subdev_core_ops = {
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
+	try_fmt->width		= MT9M001_MAX_WIDTH;
+	try_fmt->height		= MT9M001_MAX_HEIGHT;
+	try_fmt->code		= mt9m001->fmts[0].code;
+	try_fmt->colorspace	= mt9m001->fmts[0].colorspace;
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
@@ -678,6 +704,7 @@ static const struct v4l2_subdev_sensor_ops mt9m001_subdev_sensor_ops = {
 };
 
 static const struct v4l2_subdev_pad_ops mt9m001_subdev_pad_ops = {
+	.init_cfg	= mt9m001_init_cfg,
 	.enum_mbus_code = mt9m001_enum_mbus_code,
 	.get_selection	= mt9m001_get_selection,
 	.set_selection	= mt9m001_set_selection,
-- 
2.7.4
