From: Milo Kim <milo.kim@ti.com>
Subject: [RFC 2/4] input: touchscree: mms114: use of_dev_get_platdata()
Date: Fri, 28 Aug 2015 18:12:06 +0900
Message-ID: <1440753128-3288-3-git-send-email-milo.kim@ti.com>
References: <1440753128-3288-1-git-send-email-milo.kim@ti.com>
 <1440753128-3288-2-git-send-email-milo.kim@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1440753128-3288-2-git-send-email-milo.kim@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: grant.likely@linaro.org, devicetree@vger.kernel.org
Cc: Milo Kim <milo.kim@ti.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Felipe Balbi <balbi@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Samuel Ortiz <sameo@linux.intel.com>, Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Driver calls of_dev_get_platdata(). Error handler is added - IS_ERR() and
PTR_ERR() if an error is found.
Return type of mms114_parse_dt() is changed to integer. So return values
are modified.

Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Felipe Balbi <balbi@ti.com>
Cc: Grant Likely <grant.likely@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Samuel Ortiz <sameo@linux.intel.com>
Cc: Tony Lindgren <tony@atomide.com>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Milo Kim <milo.kim@ti.com>
---
 drivers/input/touchscreen/mms114.c | 34 ++++++++++------------------------
 1 file changed, 10 insertions(+), 24 deletions(-)

diff --git a/drivers/input/touchscreen/mms114.c b/drivers/input/touchscreen/mms114.c
index 67c0d31..555e326 100644
--- a/drivers/input/touchscreen/mms114.c
+++ b/drivers/input/touchscreen/mms114.c
@@ -10,6 +10,7 @@
 #include <linux/module.h>
 #include <linux/delay.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/i2c.h>
 #include <linux/i2c/mms114.h>
 #include <linux/input/mt.h>
@@ -376,29 +377,19 @@ static void mms114_input_close(struct input_dev *dev)
 	mms114_stop(data);
 }
 
-#ifdef CONFIG_OF
-static struct mms114_platform_data *mms114_parse_dt(struct device *dev)
+static int mms114_parse_dt(struct device *dev, void *data, void *priv)
 {
-	struct mms114_platform_data *pdata;
+	struct mms114_platform_data *pdata = data;
 	struct device_node *np = dev->of_node;
 
-	if (!np)
-		return NULL;
-
-	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
-	if (!pdata) {
-		dev_err(dev, "failed to allocate platform data\n");
-		return NULL;
-	}
-
 	if (of_property_read_u32(np, "x-size", &pdata->x_size)) {
 		dev_err(dev, "failed to get x-size property\n");
-		return NULL;
+		return -EINVAL;
 	};
 
 	if (of_property_read_u32(np, "y-size", &pdata->y_size)) {
 		dev_err(dev, "failed to get y-size property\n");
-		return NULL;
+		return -EINVAL;
 	};
 
 	of_property_read_u32(np, "contact-threshold",
@@ -411,14 +402,8 @@ static struct mms114_platform_data *mms114_parse_dt(struct device *dev)
 	if (of_find_property(np, "y-invert", NULL))
 		pdata->y_invert = true;
 
-	return pdata;
-}
-#else
-static inline struct mms114_platform_data *mms114_parse_dt(struct device *dev)
-{
-	return NULL;
+	return 0;
 }
-#endif
 
 static int mms114_probe(struct i2c_client *client,
 				  const struct i2c_device_id *id)
@@ -428,9 +413,10 @@ static int mms114_probe(struct i2c_client *client,
 	struct input_dev *input_dev;
 	int error;
 
-	pdata = dev_get_platdata(&client->dev);
-	if (!pdata)
-		pdata = mms114_parse_dt(&client->dev);
+	pdata = of_dev_get_platdata(&client->dev, sizeof(*pdata),
+				    mms114_parse_dt, NULL);
+	if (IS_ERR(pdata))
+		return PTR_ERR(pdata);
 
 	if (!pdata) {
 		dev_err(&client->dev, "Need platform data\n");
-- 
1.9.1
