Return-Path: <SRS0=mSv1=PQ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-pg1-f195.google.com ([209.85.215.195]:36435 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727656AbfAHOwm (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 8 Jan 2019 09:52:42 -0500
From: Akinobu Mita <akinobu.mita@gmail.com>
Subject: [PATCH v2 11/13] media: mt9m001: support log_status ioctl and event interface
Date: Tue,  8 Jan 2019 23:51:48 +0900
Message-Id: <1546959110-19445-12-git-send-email-akinobu.mita@gmail.com>
In-Reply-To: <1546959110-19445-1-git-send-email-akinobu.mita@gmail.com>
References: <1546959110-19445-1-git-send-email-akinobu.mita@gmail.com>
Sender: devicetree-owner@vger.kernel.org
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc: Akinobu Mita <akinobu.mita@gmail.com>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
List-ID: <devicetree@vger.kernel.org>

This adds log_status ioctl and event interface for mt9m001's v4l2 controls.

Cc: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
---
* No changes from v1

 drivers/media/i2c/mt9m001.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/mt9m001.c b/drivers/media/i2c/mt9m001.c
index 5e93c7d..66a0928 100644
--- a/drivers/media/i2c/mt9m001.c
+++ b/drivers/media/i2c/mt9m001.c
@@ -17,6 +17,7 @@
 
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
+#include <media/v4l2-event.h>
 #include <media/v4l2-subdev.h>
 
 /*
@@ -632,6 +633,9 @@ static const struct v4l2_ctrl_ops mt9m001_ctrl_ops = {
 };
 
 static const struct v4l2_subdev_core_ops mt9m001_subdev_core_ops = {
+	.log_status = v4l2_ctrl_subdev_log_status,
+	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
+	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
 #ifdef CONFIG_VIDEO_ADV_DEBUG
 	.g_register	= mt9m001_g_register,
 	.s_register	= mt9m001_s_register,
@@ -720,7 +724,8 @@ static int mt9m001_probe(struct i2c_client *client,
 		return PTR_ERR(mt9m001->reset_gpio);
 
 	v4l2_i2c_subdev_init(&mt9m001->subdev, client, &mt9m001_subdev_ops);
-	mt9m001->subdev.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	mt9m001->subdev.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
+				 V4L2_SUBDEV_FL_HAS_EVENTS;
 	v4l2_ctrl_handler_init(&mt9m001->hdl, 4);
 	v4l2_ctrl_new_std(&mt9m001->hdl, &mt9m001_ctrl_ops,
 			V4L2_CID_VFLIP, 0, 1, 1, 0);
-- 
2.7.4
