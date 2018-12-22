Return-Path: <SRS0=BUHn=O7=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-pf1-f194.google.com ([209.85.210.194]:37613 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725846AbeLVRN3 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 22 Dec 2018 12:13:29 -0500
From: Akinobu Mita <akinobu.mita@gmail.com>
Subject: [PATCH 10/12] media: mt9m001: support log_status ioctl and event interface
Date: Sun, 23 Dec 2018 02:12:52 +0900
Message-Id: <1545498774-11754-11-git-send-email-akinobu.mita@gmail.com>
In-Reply-To: <1545498774-11754-1-git-send-email-akinobu.mita@gmail.com>
References: <1545498774-11754-1-git-send-email-akinobu.mita@gmail.com>
Sender: devicetree-owner@vger.kernel.org
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc: Akinobu Mita <akinobu.mita@gmail.com>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@s-opensource.com>
List-ID: <devicetree@vger.kernel.org>

This adds log_status ioctl and event interface for mt9m001's v4l2 controls.

Cc: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>
Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
---
 drivers/media/i2c/mt9m001.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/mt9m001.c b/drivers/media/i2c/mt9m001.c
index b4deec3..a5b94d7 100644
--- a/drivers/media/i2c/mt9m001.c
+++ b/drivers/media/i2c/mt9m001.c
@@ -18,6 +18,7 @@
 #include <media/v4l2-subdev.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
+#include <media/v4l2-event.h>
 
 /*
  * mt9m001 i2c address 0x5d
@@ -628,6 +629,9 @@ static const struct v4l2_ctrl_ops mt9m001_ctrl_ops = {
 };
 
 static const struct v4l2_subdev_core_ops mt9m001_subdev_core_ops = {
+	.log_status = v4l2_ctrl_subdev_log_status,
+	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
+	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
 #ifdef CONFIG_VIDEO_ADV_DEBUG
 	.g_register	= mt9m001_g_register,
 	.s_register	= mt9m001_s_register,
@@ -716,7 +720,8 @@ static int mt9m001_probe(struct i2c_client *client,
 		return PTR_ERR(mt9m001->reset_gpio);
 
 	v4l2_i2c_subdev_init(&mt9m001->subdev, client, &mt9m001_subdev_ops);
-	mt9m001->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
+	mt9m001->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE |
+				V4L2_SUBDEV_FL_HAS_EVENTS;
 	v4l2_ctrl_handler_init(&mt9m001->hdl, 4);
 	v4l2_ctrl_new_std(&mt9m001->hdl, &mt9m001_ctrl_ops,
 			V4L2_CID_VFLIP, 0, 1, 1, 0);
-- 
2.7.4
