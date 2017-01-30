From: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Subject: [PATCHv2 04/16] ov7670: add devicetree support
Date: Mon, 30 Jan 2017 15:06:16 +0100
Message-ID: <20170130140628.18088-5-hverkuil@xs4all.nl>
References: <20170130140628.18088-1-hverkuil@xs4all.nl>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170130140628.18088-1-hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Guennadi Liakhovetski <guennadi.liakhovetski-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Songjun Wu <songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>

Add DT support. Use it to get the reset and pwdn pins (if there are any).
Tested with one sensor requiring reset/pwdn and one sensor that doesn't
have reset/pwdn pins.

Signed-off-by: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
---
 drivers/media/i2c/ov7670.c | 42 ++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 40 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov7670.c b/drivers/media/i2c/ov7670.c
index da08436..24f388e 100644
--- a/drivers/media/i2c/ov7670.c
+++ b/drivers/media/i2c/ov7670.c
@@ -17,6 +17,8 @@
 #include <linux/i2c.h>
 #include <linux/delay.h>
 #include <linux/videodev2.h>
+#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-mediabus.h>
@@ -229,6 +231,8 @@ struct ov7670_info {
 	};
 	struct ov7670_format_struct *fmt;  /* Current format */
 	struct clk *clk;
+	struct gpio_desc *resetb_gpio;
+	struct gpio_desc *pwdn_gpio;
 	int min_width;			/* Filter out smaller sizes */
 	int min_height;			/* Filter out smaller sizes */
 	int clock_speed;		/* External clock speed (MHz) */
@@ -591,8 +595,6 @@ static int ov7670_init(struct v4l2_subdev *sd, u32 val)
 	return ov7670_write_array(sd, ov7670_default_regs);
 }
 
-
-
 static int ov7670_detect(struct v4l2_subdev *sd)
 {
 	unsigned char v;
@@ -1549,6 +1551,29 @@ static const struct ov7670_devtype ov7670_devdata[] = {
 	},
 };
 
+static int ov7670_init_gpio(struct i2c_client *client, struct ov7670_info *info)
+{
+	/* Request the power down GPIO asserted */
+	info->pwdn_gpio = devm_gpiod_get_optional(&client->dev, "pwdn",
+			GPIOD_OUT_LOW);
+	if (IS_ERR(info->pwdn_gpio)) {
+		dev_info(&client->dev, "can't get %s GPIO\n", "pwdn");
+		return PTR_ERR(info->pwdn_gpio);
+	}
+
+	/* Request the reset GPIO deasserted */
+	info->resetb_gpio = devm_gpiod_get_optional(&client->dev, "resetb",
+			GPIOD_OUT_LOW);
+	if (IS_ERR(info->resetb_gpio)) {
+		dev_info(&client->dev, "can't get %s GPIO\n", "resetb");
+		return PTR_ERR(info->resetb_gpio);
+	}
+
+	usleep_range(3000, 5000);
+
+	return 0;
+}
+
 static int ov7670_probe(struct i2c_client *client,
 			const struct i2c_device_id *id)
 {
@@ -1594,6 +1619,10 @@ static int ov7670_probe(struct i2c_client *client,
 		return -EPROBE_DEFER;
 	clk_prepare_enable(info->clk);
 
+	ret = ov7670_init_gpio(client, info);
+	if (ret)
+		return ret;
+
 	info->clock_speed = clk_get_rate(info->clk) / 1000000;
 	if (info->clock_speed < 10 || info->clock_speed > 48)
 		return -EINVAL;
@@ -1689,9 +1718,18 @@ static const struct i2c_device_id ov7670_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, ov7670_id);
 
+#if IS_ENABLED(CONFIG_OF)
+static const struct of_device_id ov7670_of_match[] = {
+	{ .compatible = "ovti,ov7670", },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, ov7670_of_match);
+#endif
+
 static struct i2c_driver ov7670_driver = {
 	.driver = {
 		.name	= "ov7670",
+		.of_match_table = of_match_ptr(ov7670_of_match),
 	},
 	.probe		= ov7670_probe,
 	.remove		= ov7670_remove,
-- 
2.10.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
