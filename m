From: Benoit Parrot <bparrot@ti.com>
Subject: [Patch 4/6] media: i2c: ov2659: Add optional powerdown gpio handling
Date: Thu, 12 Sep 2019 08:00:05 -0500
Message-ID: <20190912130007.4469-5-bparrot@ti.com>
References: <20190912130007.4469-1-bparrot@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190912130007.4469-1-bparrot@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans Verkuil <hverkuil@xs4all.nl>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Prabhakar Lad <prabhakar.csengg@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Benoit Parrot <bparrot@ti.com>
List-Id: devicetree@vger.kernel.org

On some board it is possible that the sensor 'powerdown'
pin might be controlled with a gpio instead of being
tied to always powered.

This patch add support to specify an optional gpio
which will be set at probe time and remained on.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/i2c/Kconfig  |  2 +-
 drivers/media/i2c/ov2659.c | 13 +++++++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 7eee1812bba3..315c1d8bdb7b 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -634,7 +634,7 @@ config VIDEO_OV2640
 config VIDEO_OV2659
 	tristate "OmniVision OV2659 sensor support"
 	depends on VIDEO_V4L2 && I2C
-	depends on MEDIA_CAMERA_SUPPORT
+	depends on MEDIA_CAMERA_SUPPORT && GPIOLIB
 	select V4L2_FWNODE
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
diff --git a/drivers/media/i2c/ov2659.c b/drivers/media/i2c/ov2659.c
index efbe6dc720e2..c64f73bef336 100644
--- a/drivers/media/i2c/ov2659.c
+++ b/drivers/media/i2c/ov2659.c
@@ -32,6 +32,8 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_graph.h>
+#include <linux/of_gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/slab.h>
 #include <linux/uaccess.h>
 #include <linux/videodev2.h>
@@ -232,6 +234,8 @@ struct ov2659 {
 	struct sensor_register *format_ctrl_regs;
 	struct ov2659_pll_ctrl pll;
 	int streaming;
+	/* used to control the sensor powerdownN pin */
+	struct gpio_desc *pwrdn_gpio;
 };
 
 static const struct sensor_register ov2659_init_regs[] = {
@@ -1391,6 +1395,7 @@ static int ov2659_probe(struct i2c_client *client)
 	struct v4l2_subdev *sd;
 	struct ov2659 *ov2659;
 	struct clk *clk;
+	struct gpio_desc *gpio;
 	int ret;
 
 	if (!pdata) {
@@ -1414,6 +1419,14 @@ static int ov2659_probe(struct i2c_client *client)
 	    ov2659->xvclk_frequency > 27000000)
 		return -EINVAL;
 
+	/* Optional gpio don't fail if not present */
+	gpio = devm_gpiod_get_optional(&client->dev, "powerdown",
+				       GPIOD_OUT_HIGH);
+	if (IS_ERR(gpio))
+		return PTR_ERR(gpio);
+
+	ov2659->pwrdn_gpio = gpio;
+
 	v4l2_ctrl_handler_init(&ov2659->ctrls, 2);
 	ov2659->link_frequency =
 			v4l2_ctrl_new_std(&ov2659->ctrls, &ov2659_ctrl_ops,
-- 
2.17.1
