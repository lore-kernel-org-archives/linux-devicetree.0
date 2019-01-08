Return-Path: <SRS0=mSv1=PQ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-pf1-f195.google.com ([209.85.210.195]:43430 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728453AbfAHOwr (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 8 Jan 2019 09:52:47 -0500
From: Akinobu Mita <akinobu.mita@gmail.com>
Subject: [PATCH v2 13/13] media: mt9m001: set all mbus format field when G_FMT and S_FMT ioctls
Date: Tue,  8 Jan 2019 23:51:50 +0900
Message-Id: <1546959110-19445-14-git-send-email-akinobu.mita@gmail.com>
In-Reply-To: <1546959110-19445-1-git-send-email-akinobu.mita@gmail.com>
References: <1546959110-19445-1-git-send-email-akinobu.mita@gmail.com>
Sender: devicetree-owner@vger.kernel.org
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc: Akinobu Mita <akinobu.mita@gmail.com>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
List-ID: <devicetree@vger.kernel.org>

This driver doesn't set all members of mbus format field when the
VIDIOC_SUBDEV_{S,G}_FMT ioctls are called.

This is detected by v4l2-compliance.

Cc: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
---
* No changes from v1

 drivers/media/i2c/mt9m001.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/i2c/mt9m001.c b/drivers/media/i2c/mt9m001.c
index f97ab48..61e5e6f 100644
--- a/drivers/media/i2c/mt9m001.c
+++ b/drivers/media/i2c/mt9m001.c
@@ -340,6 +340,9 @@ static int mt9m001_get_fmt(struct v4l2_subdev *sd,
 	mf->code	= mt9m001->fmt->code;
 	mf->colorspace	= mt9m001->fmt->colorspace;
 	mf->field	= V4L2_FIELD_NONE;
+	mf->ycbcr_enc	= V4L2_YCBCR_ENC_DEFAULT;
+	mf->quantization = V4L2_QUANTIZATION_DEFAULT;
+	mf->xfer_func	= V4L2_XFER_FUNC_DEFAULT;
 
 	return 0;
 }
@@ -400,6 +403,10 @@ static int mt9m001_set_fmt(struct v4l2_subdev *sd,
 	}
 
 	mf->colorspace	= fmt->colorspace;
+	mf->field	= V4L2_FIELD_NONE;
+	mf->ycbcr_enc	= V4L2_YCBCR_ENC_DEFAULT;
+	mf->quantization = V4L2_QUANTIZATION_DEFAULT;
+	mf->xfer_func	= V4L2_XFER_FUNC_DEFAULT;
 
 	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE)
 		return mt9m001_s_fmt(sd, fmt, mf);
-- 
2.7.4
