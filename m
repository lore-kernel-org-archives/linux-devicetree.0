Return-Path: <SRS0=BUHn=O7=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-pf1-f196.google.com ([209.85.210.196]:42168 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725846AbeLVRNd (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 22 Dec 2018 12:13:33 -0500
From: Akinobu Mita <akinobu.mita@gmail.com>
Subject: [PATCH 12/12] media: mt9m001: set all mbus format field when G_FMT and S_FMT ioctls
Date: Sun, 23 Dec 2018 02:12:54 +0900
Message-Id: <1545498774-11754-13-git-send-email-akinobu.mita@gmail.com>
In-Reply-To: <1545498774-11754-1-git-send-email-akinobu.mita@gmail.com>
References: <1545498774-11754-1-git-send-email-akinobu.mita@gmail.com>
Sender: devicetree-owner@vger.kernel.org
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc: Akinobu Mita <akinobu.mita@gmail.com>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@s-opensource.com>
List-ID: <devicetree@vger.kernel.org>

This driver doesn't set all members of mbus format field when the
VIDIOC_SUBDEV_{S,G}_FMT ioctls are called.

This is detected by v4l2-compliance.

Cc: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>
Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
---
 drivers/media/i2c/mt9m001.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/i2c/mt9m001.c b/drivers/media/i2c/mt9m001.c
index f4afbc9..82b89d5 100644
--- a/drivers/media/i2c/mt9m001.c
+++ b/drivers/media/i2c/mt9m001.c
@@ -342,6 +342,9 @@ static int mt9m001_get_fmt(struct v4l2_subdev *sd,
 	mf->code	= mt9m001->fmt->code;
 	mf->colorspace	= mt9m001->fmt->colorspace;
 	mf->field	= V4L2_FIELD_NONE;
+	mf->ycbcr_enc	= V4L2_YCBCR_ENC_DEFAULT;
+	mf->quantization = V4L2_QUANTIZATION_DEFAULT;
+	mf->xfer_func	= V4L2_XFER_FUNC_DEFAULT;
 
 	return 0;
 }
@@ -402,6 +405,10 @@ static int mt9m001_set_fmt(struct v4l2_subdev *sd,
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
