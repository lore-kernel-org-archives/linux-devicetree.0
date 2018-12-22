Return-Path: <SRS0=BUHn=O7=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-pf1-f195.google.com ([209.85.210.195]:36159 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388743AbeLVRNU (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 22 Dec 2018 12:13:20 -0500
From: Akinobu Mita <akinobu.mita@gmail.com>
Subject: [PATCH 06/12] media: mt9m001: switch s_power callback to runtime PM
Date: Sun, 23 Dec 2018 02:12:48 +0900
Message-Id: <1545498774-11754-7-git-send-email-akinobu.mita@gmail.com>
In-Reply-To: <1545498774-11754-1-git-send-email-akinobu.mita@gmail.com>
References: <1545498774-11754-1-git-send-email-akinobu.mita@gmail.com>
Sender: devicetree-owner@vger.kernel.org
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc: Akinobu Mita <akinobu.mita@gmail.com>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@s-opensource.com>
List-ID: <devicetree@vger.kernel.org>

Switch s_power() callback to runtime PM framework.  This also removes
soc_camera specific power management code and introduces reset and standby
gpios instead.

Cc: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>
Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
---
 drivers/media/i2c/mt9m001.c | 242 ++++++++++++++++++++++++++++++++------------
 1 file changed, 178 insertions(+), 64 deletions(-)

diff --git a/drivers/media/i2c/mt9m001.c b/drivers/media/i2c/mt9m001.c
index c0180fdc..f20188a 100644
--- a/drivers/media/i2c/mt9m001.c
+++ b/drivers/media/i2c/mt9m001.c
@@ -5,6 +5,10 @@
  * Copyright (C) 2008, Guennadi Liakhovetski <kernel@pengutronix.de>
  */
 
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/pm_runtime.h>
 #include <linux/videodev2.h>
 #include <linux/slab.h>
 #include <linux/i2c.h>
@@ -13,7 +17,6 @@
 
 #include <media/soc_camera.h>
 #include <media/drv-intf/soc_mediabus.h>
-#include <media/v4l2-clk.h>
 #include <media/v4l2-subdev.h>
 #include <media/v4l2-ctrls.h>
 
@@ -92,8 +95,12 @@ struct mt9m001 {
 		struct v4l2_ctrl *autoexposure;
 		struct v4l2_ctrl *exposure;
 	};
+	bool streaming;
+	struct mutex mutex;
 	struct v4l2_rect rect;	/* Sensor window */
-	struct v4l2_clk *clk;
+	struct clk *clk;
+	struct gpio_desc *standby_gpio;
+	struct gpio_desc *reset_gpio;
 	const struct mt9m001_datafmt *fmt;
 	const struct mt9m001_datafmt *fmts;
 	int num_fmts;
@@ -177,8 +184,7 @@ static int mt9m001_init(struct i2c_client *client)
 	return multi_reg_write(client, init_regs, ARRAY_SIZE(init_regs));
 }
 
-static int mt9m001_apply_selection(struct v4l2_subdev *sd,
-				    struct v4l2_rect *rect)
+static int mt9m001_apply_selection(struct v4l2_subdev *sd)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	struct mt9m001 *mt9m001 = to_mt9m001(client);
@@ -190,11 +196,11 @@ static int mt9m001_apply_selection(struct v4l2_subdev *sd,
 		 * The caller provides a supported format, as verified per
 		 * call to .set_fmt(FORMAT_TRY).
 		 */
-		{ MT9M001_COLUMN_START, rect->left },
-		{ MT9M001_ROW_START, rect->top },
-		{ MT9M001_WINDOW_WIDTH, rect->width - 1 },
+		{ MT9M001_COLUMN_START, mt9m001->rect.left },
+		{ MT9M001_ROW_START, mt9m001->rect.top },
+		{ MT9M001_WINDOW_WIDTH, mt9m001->rect.width - 1 },
 		{ MT9M001_WINDOW_HEIGHT,
-			rect->height + mt9m001->y_skip_top - 1 },
+			mt9m001->rect.height + mt9m001->y_skip_top - 1 },
 	};
 
 	return multi_reg_write(client, regs, ARRAY_SIZE(regs));
@@ -203,11 +209,50 @@ static int mt9m001_apply_selection(struct v4l2_subdev *sd,
 static int mt9m001_s_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	struct mt9m001 *mt9m001 = to_mt9m001(client);
+	int ret = 0;
 
-	/* Switch to master "normal" mode or stop sensor readout */
-	if (reg_write(client, MT9M001_OUTPUT_CONTROL, enable ? 2 : 0) < 0)
-		return -EIO;
-	return 0;
+	mutex_lock(&mt9m001->mutex);
+
+	if (mt9m001->streaming == enable)
+		goto done;
+
+	if (enable) {
+		ret = pm_runtime_get_sync(&client->dev);
+		if (ret < 0) {
+			pm_runtime_put_noidle(&client->dev);
+			goto done;
+		}
+
+		ret = mt9m001_apply_selection(sd);
+		if (ret) {
+			pm_runtime_put(&client->dev);
+			goto done;
+		}
+
+		ret = __v4l2_ctrl_handler_setup(&mt9m001->hdl);
+		if (ret) {
+			pm_runtime_put(&client->dev);
+			goto done;
+		}
+
+		/* Switch to master "normal" mode */
+		ret = reg_write(client, MT9M001_OUTPUT_CONTROL, 2);
+		if (ret < 0) {
+			pm_runtime_put(&client->dev);
+			goto done;
+		}
+	} else {
+		/* Switch to master stop sensor readout */
+		reg_write(client, MT9M001_OUTPUT_CONTROL, 0);
+		pm_runtime_put(&client->dev);
+	}
+
+	mt9m001->streaming = enable;
+done:
+	mutex_unlock(&mt9m001->mutex);
+
+	return ret;
 }
 
 static int mt9m001_set_selection(struct v4l2_subdev *sd,
@@ -217,7 +262,6 @@ static int mt9m001_set_selection(struct v4l2_subdev *sd,
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	struct mt9m001 *mt9m001 = to_mt9m001(client);
 	struct v4l2_rect rect = sel->r;
-	int ret;
 
 	if (sel->which != V4L2_SUBDEV_FORMAT_ACTIVE ||
 	    sel->target != V4L2_SEL_TGT_CROP)
@@ -243,15 +287,9 @@ static int mt9m001_set_selection(struct v4l2_subdev *sd,
 	mt9m001->total_h = rect.height + mt9m001->y_skip_top +
 			   MT9M001_DEFAULT_VBLANK;
 
+	mt9m001->rect = rect;
 
-	ret = mt9m001_apply_selection(sd, &rect);
-	if (!ret && v4l2_ctrl_g_ctrl(mt9m001->autoexposure) == V4L2_EXPOSURE_AUTO)
-		ret = reg_write(client, MT9M001_SHUTTER_WIDTH, mt9m001->total_h);
-
-	if (!ret)
-		mt9m001->rect = rect;
-
-	return ret;
+	return 0;
 }
 
 static int mt9m001_get_selection(struct v4l2_subdev *sd,
@@ -395,13 +433,34 @@ static int mt9m001_s_register(struct v4l2_subdev *sd,
 }
 #endif
 
-static int mt9m001_s_power(struct v4l2_subdev *sd, int on)
+static int mt9m001_power_on(struct mt9m001 *mt9m001)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	struct soc_camera_subdev_desc *ssdd = soc_camera_i2c_to_desc(client);
-	struct mt9m001 *mt9m001 = to_mt9m001(client);
+	int ret = clk_prepare_enable(mt9m001->clk);
+
+	if (ret)
+		return ret;
+
+	if (mt9m001->standby_gpio) {
+		gpiod_set_value_cansleep(mt9m001->standby_gpio, 0);
+		usleep_range(1000, 2000);
+	}
+
+	if (mt9m001->reset_gpio) {
+		gpiod_set_value_cansleep(mt9m001->reset_gpio, 1);
+		usleep_range(1000, 2000);
+		gpiod_set_value_cansleep(mt9m001->reset_gpio, 0);
+		usleep_range(1000, 2000);
+	}
 
-	return soc_camera_set_power(&client->dev, ssdd, mt9m001->clk, on);
+	return 0;
+}
+
+static int mt9m001_power_off(struct mt9m001 *mt9m001)
+{
+	gpiod_set_value_cansleep(mt9m001->standby_gpio, 1);
+	clk_disable_unprepare(mt9m001->clk);
+
+	return 0;
 }
 
 static int mt9m001_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
@@ -429,16 +488,18 @@ static int mt9m001_s_ctrl(struct v4l2_ctrl *ctrl)
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	struct v4l2_ctrl *exp = mt9m001->exposure;
 	int data;
+	int ret;
+
+	if (!pm_runtime_get_if_in_use(&client->dev))
+		return 0;
 
 	switch (ctrl->id) {
 	case V4L2_CID_VFLIP:
 		if (ctrl->val)
-			data = reg_set(client, MT9M001_READ_OPTIONS2, 0x8000);
+			ret = reg_set(client, MT9M001_READ_OPTIONS2, 0x8000);
 		else
-			data = reg_clear(client, MT9M001_READ_OPTIONS2, 0x8000);
-		if (data < 0)
-			return -EIO;
-		return 0;
+			ret = reg_clear(client, MT9M001_READ_OPTIONS2, 0x8000);
+		break;
 
 	case V4L2_CID_GAIN:
 		/* See Datasheet Table 7, Gain settings. */
@@ -448,9 +509,7 @@ static int mt9m001_s_ctrl(struct v4l2_ctrl *ctrl)
 			data = ((ctrl->val - (s32)ctrl->minimum) * 8 + range / 2) / range;
 
 			dev_dbg(&client->dev, "Setting gain %d\n", data);
-			data = reg_write(client, MT9M001_GLOBAL_GAIN, data);
-			if (data < 0)
-				return -EIO;
+			ret = reg_write(client, MT9M001_GLOBAL_GAIN, data);
 		} else {
 			/* Pack it into 1.125..15 variable step, register values 9..67 */
 			/* We assume qctrl->maximum - qctrl->default_value - 1 > 0 */
@@ -467,11 +526,9 @@ static int mt9m001_s_ctrl(struct v4l2_ctrl *ctrl)
 
 			dev_dbg(&client->dev, "Setting gain from %d to %d\n",
 				 reg_read(client, MT9M001_GLOBAL_GAIN), data);
-			data = reg_write(client, MT9M001_GLOBAL_GAIN, data);
-			if (data < 0)
-				return -EIO;
+			ret = reg_write(client, MT9M001_GLOBAL_GAIN, data);
 		}
-		return 0;
+		break;
 
 	case V4L2_CID_EXPOSURE_AUTO:
 		if (ctrl->val == V4L2_EXPOSURE_MANUAL) {
@@ -482,19 +539,22 @@ static int mt9m001_s_ctrl(struct v4l2_ctrl *ctrl)
 			dev_dbg(&client->dev,
 				"Setting shutter width from %d to %lu\n",
 				reg_read(client, MT9M001_SHUTTER_WIDTH), shutter);
-			if (reg_write(client, MT9M001_SHUTTER_WIDTH, shutter) < 0)
-				return -EIO;
+			ret = reg_write(client, MT9M001_SHUTTER_WIDTH, shutter);
 		} else {
-			const u16 vblank = 25;
-
 			mt9m001->total_h = mt9m001->rect.height +
-				mt9m001->y_skip_top + vblank;
-			if (reg_write(client, MT9M001_SHUTTER_WIDTH, mt9m001->total_h) < 0)
-				return -EIO;
+				mt9m001->y_skip_top + MT9M001_DEFAULT_VBLANK;
+			ret = reg_write(client, MT9M001_SHUTTER_WIDTH,
+					mt9m001->total_h);
 		}
-		return 0;
+		break;
+	default:
+		ret = -EINVAL;
+		break;
 	}
-	return -EINVAL;
+
+	pm_runtime_put(&client->dev);
+
+	return ret;
 }
 
 /*
@@ -509,10 +569,6 @@ static int mt9m001_video_probe(struct soc_camera_subdev_desc *ssdd,
 	unsigned long flags;
 	int ret;
 
-	ret = mt9m001_s_power(&mt9m001->subdev, 1);
-	if (ret < 0)
-		return ret;
-
 	/* Enable the chip */
 	data = reg_write(client, MT9M001_CHIP_ENABLE, 1);
 	dev_dbg(&client->dev, "write: %d\n", data);
@@ -571,7 +627,6 @@ static int mt9m001_video_probe(struct soc_camera_subdev_desc *ssdd,
 	ret = v4l2_ctrl_handler_setup(&mt9m001->hdl);
 
 done:
-	mt9m001_s_power(&mt9m001->subdev, 0);
 	return ret;
 }
 
@@ -601,7 +656,6 @@ static const struct v4l2_subdev_core_ops mt9m001_subdev_core_ops = {
 	.g_register	= mt9m001_g_register,
 	.s_register	= mt9m001_s_register,
 #endif
-	.s_power	= mt9m001_s_power,
 };
 
 static int mt9m001_enum_mbus_code(struct v4l2_subdev *sd,
@@ -700,6 +754,20 @@ static int mt9m001_probe(struct i2c_client *client,
 	if (!mt9m001)
 		return -ENOMEM;
 
+	mt9m001->clk = devm_clk_get(&client->dev, NULL);
+	if (IS_ERR(mt9m001->clk))
+		return PTR_ERR(mt9m001->clk);
+
+	mt9m001->standby_gpio = devm_gpiod_get_optional(&client->dev, "standby",
+							GPIOD_OUT_LOW);
+	if (IS_ERR(mt9m001->standby_gpio))
+		return PTR_ERR(mt9m001->standby_gpio);
+
+	mt9m001->reset_gpio = devm_gpiod_get_optional(&client->dev, "reset",
+						      GPIOD_OUT_LOW);
+	if (IS_ERR(mt9m001->reset_gpio))
+		return PTR_ERR(mt9m001->reset_gpio);
+
 	v4l2_i2c_subdev_init(&mt9m001->subdev, client, &mt9m001_subdev_ops);
 	v4l2_ctrl_handler_init(&mt9m001->hdl, 4);
 	v4l2_ctrl_new_std(&mt9m001->hdl, &mt9m001_ctrl_ops,
@@ -722,6 +790,9 @@ static int mt9m001_probe(struct i2c_client *client,
 	v4l2_ctrl_auto_cluster(2, &mt9m001->autoexposure,
 					V4L2_EXPOSURE_MANUAL, true);
 
+	mutex_init(&mt9m001->mutex);
+	mt9m001->hdl.lock = &mt9m001->mutex;
+
 	/* Second stage probe - when a capture adapter is there */
 	mt9m001->y_skip_top	= 0;
 	mt9m001->rect.left	= MT9M001_COLUMN_SKIP;
@@ -729,18 +800,30 @@ static int mt9m001_probe(struct i2c_client *client,
 	mt9m001->rect.width	= MT9M001_MAX_WIDTH;
 	mt9m001->rect.height	= MT9M001_MAX_HEIGHT;
 
-	mt9m001->clk = v4l2_clk_get(&client->dev, "mclk");
-	if (IS_ERR(mt9m001->clk)) {
-		ret = PTR_ERR(mt9m001->clk);
-		goto eclkget;
-	}
+	ret = mt9m001_power_on(mt9m001);
+	if (ret)
+		goto error_hdl_free;
+
+	pm_runtime_get_noresume(&client->dev);
+	pm_runtime_set_active(&client->dev);
+	pm_runtime_enable(&client->dev);
 
 	ret = mt9m001_video_probe(ssdd, client);
-	if (ret) {
-		v4l2_clk_put(mt9m001->clk);
-eclkget:
-		v4l2_ctrl_handler_free(&mt9m001->hdl);
-	}
+	if (ret)
+		goto error_power_off;
+
+	pm_runtime_put_sync(&client->dev);
+
+	return 0;
+
+error_power_off:
+	pm_runtime_disable(&client->dev);
+	pm_runtime_set_suspended(&client->dev);
+	pm_runtime_put_noidle(&client->dev);
+	mt9m001_power_off(mt9m001);
+error_hdl_free:
+	v4l2_ctrl_handler_free(&mt9m001->hdl);
+	mutex_destroy(&mt9m001->mutex);
 
 	return ret;
 }
@@ -750,10 +833,17 @@ static int mt9m001_remove(struct i2c_client *client)
 	struct mt9m001 *mt9m001 = to_mt9m001(client);
 	struct soc_camera_subdev_desc *ssdd = soc_camera_i2c_to_desc(client);
 
-	v4l2_clk_put(mt9m001->clk);
 	v4l2_device_unregister_subdev(&mt9m001->subdev);
+	pm_runtime_get_sync(&client->dev);
+
+	pm_runtime_disable(&client->dev);
+	pm_runtime_set_suspended(&client->dev);
+	pm_runtime_put_noidle(&client->dev);
+	mt9m001_power_off(mt9m001);
+
 	v4l2_ctrl_handler_free(&mt9m001->hdl);
 	mt9m001_video_remove(ssdd);
+	mutex_destroy(&mt9m001->mutex);
 
 	return 0;
 }
@@ -764,6 +854,29 @@ static const struct i2c_device_id mt9m001_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, mt9m001_id);
 
+static int __maybe_unused mt9m001_runtime_resume(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct mt9m001 *mt9m001 = to_mt9m001(client);
+
+	return mt9m001_power_on(mt9m001);
+}
+
+static int __maybe_unused mt9m001_runtime_suspend(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct mt9m001 *mt9m001 = to_mt9m001(client);
+
+	mt9m001_power_off(mt9m001);
+
+	return 0;
+}
+
+static const struct dev_pm_ops mt9m001_pm_ops = {
+	SET_RUNTIME_PM_OPS(mt9m001_runtime_suspend,
+			   mt9m001_runtime_resume, NULL)
+};
+
 static const struct of_device_id mt9m001_of_match[] = {
 	{ .compatible = "onnn,mt9m001", },
 	{ /* sentinel */ },
@@ -773,6 +886,7 @@ MODULE_DEVICE_TABLE(of, mt9m001_of_match);
 static struct i2c_driver mt9m001_i2c_driver = {
 	.driver = {
 		.name = "mt9m001",
+		.pm = &mt9m001_pm_ops,
 		.of_match_table = mt9m001_of_match,
 	},
 	.probe		= mt9m001_probe,
-- 
2.7.4
