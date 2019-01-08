Return-Path: <SRS0=mSv1=PQ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-pf1-f196.google.com ([209.85.210.196]:37037 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727656AbfAHOwh (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 8 Jan 2019 09:52:37 -0500
From: Akinobu Mita <akinobu.mita@gmail.com>
Subject: [PATCH v2 09/13] media: mt9m001: add media controller support
Date: Tue,  8 Jan 2019 23:51:46 +0900
Message-Id: <1546959110-19445-10-git-send-email-akinobu.mita@gmail.com>
In-Reply-To: <1546959110-19445-1-git-send-email-akinobu.mita@gmail.com>
References: <1546959110-19445-1-git-send-email-akinobu.mita@gmail.com>
Sender: devicetree-owner@vger.kernel.org
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc: Akinobu Mita <akinobu.mita@gmail.com>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
List-ID: <devicetree@vger.kernel.org>

Create a source pad and set the media controller type to the sensor.

Cc: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
---
* No changes from v1

 drivers/media/i2c/Kconfig   | 2 ++
 drivers/media/i2c/mt9m001.c | 9 +++++++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index bc248d9..2d13898 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -860,6 +860,8 @@ config VIDEO_VS6624
 config VIDEO_MT9M001
 	tristate "mt9m001 support"
 	depends on I2C && VIDEO_V4L2
+	depends on MEDIA_CAMERA_SUPPORT
+	depends on MEDIA_CONTROLLER
 	help
 	  This driver supports MT9M001 cameras from Micron, monochrome
 	  and colour models.
diff --git a/drivers/media/i2c/mt9m001.c b/drivers/media/i2c/mt9m001.c
index 0f5e3f9..3b55aa85 100644
--- a/drivers/media/i2c/mt9m001.c
+++ b/drivers/media/i2c/mt9m001.c
@@ -103,6 +103,7 @@ struct mt9m001 {
 	int num_fmts;
 	unsigned int total_h;
 	unsigned short y_skip_top;	/* Lines to skip at the top */
+	struct media_pad pad;
 };
 
 static struct mt9m001 *to_mt9m001(const struct i2c_client *client)
@@ -761,6 +762,12 @@ static int mt9m001_probe(struct i2c_client *client,
 	if (ret)
 		goto error_power_off;
 
+	mt9m001->pad.flags = MEDIA_PAD_FL_SOURCE;
+	mt9m001->subdev.entity.function = MEDIA_ENT_F_CAM_SENSOR;
+	ret = media_entity_pads_init(&mt9m001->subdev.entity, 1, &mt9m001->pad);
+	if (ret)
+		goto error_power_off;
+
 	pm_runtime_idle(&client->dev);
 
 	return 0;
@@ -784,6 +791,8 @@ static int mt9m001_remove(struct i2c_client *client)
 	v4l2_device_unregister_subdev(&mt9m001->subdev);
 	pm_runtime_get_sync(&client->dev);
 
+	media_entity_cleanup(&mt9m001->subdev.entity);
+
 	pm_runtime_disable(&client->dev);
 	pm_runtime_set_suspended(&client->dev);
 	pm_runtime_put_noidle(&client->dev);
-- 
2.7.4
