Return-Path: <SRS0=TUFM=PR=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-pg1-f193.google.com ([209.85.215.193]:46380 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731794AbfAIPIM (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 9 Jan 2019 10:08:12 -0500
From: Akinobu Mita <akinobu.mita@gmail.com>
Subject: [PATCH v2.1 08/13] media: mt9m001: remove remaining soc_camera specific code
Date: Thu, 10 Jan 2019 00:07:46 +0900
Message-Id: <1547046466-12765-1-git-send-email-akinobu.mita@gmail.com>
In-Reply-To: <20190109140024.jnubog5m2ekquaqo@paasikivi.fi.intel.com>
References: <20190109140024.jnubog5m2ekquaqo@paasikivi.fi.intel.com>
Sender: devicetree-owner@vger.kernel.org
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc: Akinobu Mita <akinobu.mita@gmail.com>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
List-ID: <devicetree@vger.kernel.org>

Remove remaining soc_camera specific code and drop soc_camera dependency
from this driver.

Cc: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
---
* v2.1
- Fix misconversion while opencoding soc_camera_limit_side().

 drivers/media/i2c/Kconfig   |  2 +-
 drivers/media/i2c/mt9m001.c | 84 ++++++++-------------------------------------
 2 files changed, 15 insertions(+), 71 deletions(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index ee3ef1b..bc248d9 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -859,7 +859,7 @@ config VIDEO_VS6624
 
 config VIDEO_MT9M001
 	tristate "mt9m001 support"
-	depends on SOC_CAMERA && I2C
+	depends on I2C && VIDEO_V4L2
 	help
 	  This driver supports MT9M001 cameras from Micron, monochrome
 	  and colour models.
diff --git a/drivers/media/i2c/mt9m001.c b/drivers/media/i2c/mt9m001.c
index 1619c8c..5a3b612 100644
--- a/drivers/media/i2c/mt9m001.c
+++ b/drivers/media/i2c/mt9m001.c
@@ -15,15 +15,12 @@
 #include <linux/slab.h>
 #include <linux/videodev2.h>
 
-#include <media/drv-intf/soc_mediabus.h>
-#include <media/soc_camera.h>
 #include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
 #include <media/v4l2-subdev.h>
 
 /*
  * mt9m001 i2c address 0x5d
- * The platform has to define struct i2c_board_info objects and link to them
- * from struct soc_camera_host_desc
  */
 
 /* mt9m001 selected register addresses */
@@ -276,11 +273,15 @@ static int mt9m001_set_selection(struct v4l2_subdev *sd,
 	rect.width = ALIGN(rect.width, 2);
 	rect.left = ALIGN(rect.left, 2);
 
-	soc_camera_limit_side(&rect.left, &rect.width,
-		     MT9M001_COLUMN_SKIP, MT9M001_MIN_WIDTH, MT9M001_MAX_WIDTH);
+	rect.width = clamp_t(u32, rect.width, MT9M001_MIN_WIDTH,
+			MT9M001_MAX_WIDTH);
+	rect.left = clamp_t(u32, rect.left, MT9M001_COLUMN_SKIP,
+			MT9M001_COLUMN_SKIP + MT9M001_MAX_WIDTH - rect.width);
 
-	soc_camera_limit_side(&rect.top, &rect.height,
-		     MT9M001_ROW_SKIP, MT9M001_MIN_HEIGHT, MT9M001_MAX_HEIGHT);
+	rect.height = clamp_t(u32, rect.height, MT9M001_MIN_HEIGHT,
+			MT9M001_MAX_HEIGHT);
+	rect.top = clamp_t(u32, rect.top, MT9M001_ROW_SKIP,
+			MT9M001_ROW_SKIP + MT9M001_MAX_HEIGHT - rect.height);
 
 	mt9m001->total_h = rect.height + mt9m001->y_skip_top +
 			   MT9M001_DEFAULT_VBLANK;
@@ -565,12 +566,10 @@ static int mt9m001_s_ctrl(struct v4l2_ctrl *ctrl)
  * Interface active, can use i2c. If it fails, it can indeed mean, that
  * this wasn't our capture interface, so, we wait for the right one
  */
-static int mt9m001_video_probe(struct soc_camera_subdev_desc *ssdd,
-			       struct i2c_client *client)
+static int mt9m001_video_probe(struct i2c_client *client)
 {
 	struct mt9m001 *mt9m001 = to_mt9m001(client);
 	s32 data;
-	unsigned long flags;
 	int ret;
 
 	/* Enable the chip */
@@ -585,9 +584,11 @@ static int mt9m001_video_probe(struct soc_camera_subdev_desc *ssdd,
 	case 0x8411:
 	case 0x8421:
 		mt9m001->fmts = mt9m001_colour_fmts;
+		mt9m001->num_fmts = ARRAY_SIZE(mt9m001_colour_fmts);
 		break;
 	case 0x8431:
 		mt9m001->fmts = mt9m001_monochrome_fmts;
+		mt9m001->num_fmts = ARRAY_SIZE(mt9m001_monochrome_fmts);
 		break;
 	default:
 		dev_err(&client->dev,
@@ -596,26 +597,6 @@ static int mt9m001_video_probe(struct soc_camera_subdev_desc *ssdd,
 		goto done;
 	}
 
-	mt9m001->num_fmts = 0;
-
-	/*
-	 * This is a 10bit sensor, so by default we only allow 10bit.
-	 * The platform may support different bus widths due to
-	 * different routing of the data lines.
-	 */
-	if (ssdd->query_bus_param)
-		flags = ssdd->query_bus_param(ssdd);
-	else
-		flags = SOCAM_DATAWIDTH_10;
-
-	if (flags & SOCAM_DATAWIDTH_10)
-		mt9m001->num_fmts++;
-	else
-		mt9m001->fmts++;
-
-	if (flags & SOCAM_DATAWIDTH_8)
-		mt9m001->num_fmts++;
-
 	mt9m001->fmt = &mt9m001->fmts[0];
 
 	dev_info(&client->dev, "Detected a MT9M001 chip ID %x (%s)\n", data,
@@ -634,12 +615,6 @@ static int mt9m001_video_probe(struct soc_camera_subdev_desc *ssdd,
 	return ret;
 }
 
-static void mt9m001_video_remove(struct soc_camera_subdev_desc *ssdd)
-{
-	if (ssdd->free_bus)
-		ssdd->free_bus(ssdd);
-}
-
 static int mt9m001_g_skip_top_lines(struct v4l2_subdev *sd, u32 *lines)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
@@ -679,41 +654,18 @@ static int mt9m001_enum_mbus_code(struct v4l2_subdev *sd,
 static int mt9m001_g_mbus_config(struct v4l2_subdev *sd,
 				struct v4l2_mbus_config *cfg)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	struct soc_camera_subdev_desc *ssdd = soc_camera_i2c_to_desc(client);
-
 	/* MT9M001 has all capture_format parameters fixed */
 	cfg->flags = V4L2_MBUS_PCLK_SAMPLE_FALLING |
 		V4L2_MBUS_HSYNC_ACTIVE_HIGH | V4L2_MBUS_VSYNC_ACTIVE_HIGH |
 		V4L2_MBUS_DATA_ACTIVE_HIGH | V4L2_MBUS_MASTER;
 	cfg->type = V4L2_MBUS_PARALLEL;
-	cfg->flags = soc_camera_apply_board_flags(ssdd, cfg);
 
 	return 0;
 }
 
-static int mt9m001_s_mbus_config(struct v4l2_subdev *sd,
-				const struct v4l2_mbus_config *cfg)
-{
-	const struct i2c_client *client = v4l2_get_subdevdata(sd);
-	struct soc_camera_subdev_desc *ssdd = soc_camera_i2c_to_desc(client);
-	struct mt9m001 *mt9m001 = to_mt9m001(client);
-	unsigned int bps = soc_mbus_get_fmtdesc(mt9m001->fmt->code)->bits_per_sample;
-
-	if (ssdd->set_bus_param)
-		return ssdd->set_bus_param(ssdd, 1 << (bps - 1));
-
-	/*
-	 * Without board specific bus width settings we only support the
-	 * sensors native bus width
-	 */
-	return bps == 10 ? 0 : -EINVAL;
-}
-
 static const struct v4l2_subdev_video_ops mt9m001_subdev_video_ops = {
 	.s_stream	= mt9m001_s_stream,
 	.g_mbus_config	= mt9m001_g_mbus_config,
-	.s_mbus_config	= mt9m001_s_mbus_config,
 };
 
 static const struct v4l2_subdev_sensor_ops mt9m001_subdev_sensor_ops = {
@@ -740,21 +692,15 @@ static int mt9m001_probe(struct i2c_client *client,
 {
 	struct mt9m001 *mt9m001;
 	struct i2c_adapter *adapter = to_i2c_adapter(client->dev.parent);
-	struct soc_camera_subdev_desc *ssdd = soc_camera_i2c_to_desc(client);
 	int ret;
 
-	if (!ssdd) {
-		dev_err(&client->dev, "MT9M001 driver needs platform data\n");
-		return -EINVAL;
-	}
-
 	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_WORD_DATA)) {
 		dev_warn(&adapter->dev,
 			 "I2C-Adapter doesn't support I2C_FUNC_SMBUS_WORD\n");
 		return -EIO;
 	}
 
-	mt9m001 = devm_kzalloc(&client->dev, sizeof(struct mt9m001), GFP_KERNEL);
+	mt9m001 = devm_kzalloc(&client->dev, sizeof(*mt9m001), GFP_KERNEL);
 	if (!mt9m001)
 		return -ENOMEM;
 
@@ -811,7 +757,7 @@ static int mt9m001_probe(struct i2c_client *client,
 	pm_runtime_set_active(&client->dev);
 	pm_runtime_enable(&client->dev);
 
-	ret = mt9m001_video_probe(ssdd, client);
+	ret = mt9m001_video_probe(client);
 	if (ret)
 		goto error_power_off;
 
@@ -834,7 +780,6 @@ static int mt9m001_probe(struct i2c_client *client,
 static int mt9m001_remove(struct i2c_client *client)
 {
 	struct mt9m001 *mt9m001 = to_mt9m001(client);
-	struct soc_camera_subdev_desc *ssdd = soc_camera_i2c_to_desc(client);
 
 	v4l2_device_unregister_subdev(&mt9m001->subdev);
 	pm_runtime_get_sync(&client->dev);
@@ -845,7 +790,6 @@ static int mt9m001_remove(struct i2c_client *client)
 	mt9m001_power_off(&client->dev);
 
 	v4l2_ctrl_handler_free(&mt9m001->hdl);
-	mt9m001_video_remove(ssdd);
 	mutex_destroy(&mt9m001->mutex);
 
 	return 0;
-- 
2.7.4
