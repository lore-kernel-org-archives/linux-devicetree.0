From: Tomas Novotny <tomas-P46umIhNmdHrBKCeMvbIDA@public.gmane.org>
Subject: [PATCH 3/3] iio: dac: mcp4725: add devicetree support
Date: Fri, 30 Sep 2016 15:19:48 +0200
Message-ID: <1475241588-18429-4-git-send-email-tomas@novotny.cz>
References: <1475241588-18429-1-git-send-email-tomas@novotny.cz>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1475241588-18429-1-git-send-email-tomas-P46umIhNmdHrBKCeMvbIDA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Akinobu Mita <akinobu.mita-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Yong Li <sdliyong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Tomas Novotny <tomas-P46umIhNmdHrBKCeMvbIDA@public.gmane.org>
---
 drivers/iio/dac/mcp4725.c | 71 +++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 60 insertions(+), 11 deletions(-)

diff --git a/drivers/iio/dac/mcp4725.c b/drivers/iio/dac/mcp4725.c
index f8e54f1..74ffe56 100644
--- a/drivers/iio/dac/mcp4725.c
+++ b/drivers/iio/dac/mcp4725.c
@@ -18,6 +18,7 @@
 #include <linux/i2c.h>
 #include <linux/err.h>
 #include <linux/delay.h>
+#include <linux/of.h>
 
 #include <linux/iio/iio.h>
 #include <linux/iio/sysfs.h>
@@ -326,23 +327,57 @@ static const struct iio_info mcp4725_info = {
 	.driver_module = THIS_MODULE,
 };
 
+#ifdef CONFIG_OF
+static int mcp472x_probe_dt(struct device *dev,
+			    struct mcp4725_platform_data *pdata)
+{
+	struct device_node *np = dev->of_node;
+	struct mcp4725_data *data = iio_priv(i2c_get_clientdata(
+		to_i2c_client(dev)));
+	int err;
+	unsigned vref_mv;
+	unsigned vref_mode = 0;
+
+	if (!np)
+		return -ENODEV;
+
+	err = of_property_read_u32(np, "vref-millivolt", &vref_mv);
+	if (err) {
+		dev_err(dev, "missing or invalid vref-millivolt devicetree data");
+		return err;
+	}
+
+	err = of_property_read_u32(np, "vref-mode", &vref_mode);
+	if (data->id == MCP4725 && !err) {
+		dev_warn(dev, "vref-mode is unavailable on MCP4725");
+		vref_mode = 0;
+	}
+
+	pdata->vref_mv = vref_mv;
+	pdata->vref_mode = vref_mode;
+
+	return 0;
+}
+#else
+static int mcp472x_probe_dt(struct device *dev,
+			    struct mcp4725_platform_data *platform_data)
+{
+	return -ENODEV;
+}
+#endif
+
 static int mcp4725_probe(struct i2c_client *client,
 			 const struct i2c_device_id *id)
 {
 	struct mcp4725_data *data;
 	struct iio_dev *indio_dev;
-	struct mcp4725_platform_data *platform_data = client->dev.platform_data;
+	struct mcp4725_platform_data *pdata = dev_get_platdata(&client->dev);
 	u8 inoutbuf[3];
 	u8 pd;
 	u8 vref;
 	int ret;
 	int err;
 
-	if (!platform_data || !platform_data->vref_mv) {
-		dev_err(&client->dev, "invalid platform data");
-		return -EINVAL;
-	}
-
 	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*data));
 	if (indio_dev == NULL)
 		return -ENOMEM;
@@ -351,12 +386,23 @@ static int mcp4725_probe(struct i2c_client *client,
 	data->client = client;
 	data->id = id->driver_data;
 
-	if (data->id == MCP4725 && platform_data->vref_mode > 0) {
+	if (!dev_get_platdata(&client->dev)) {
+		pdata = devm_kzalloc(&client->dev, sizeof(*pdata), GFP_KERNEL);
+		if (!pdata)
+			return -ENOMEM;
+		err = mcp472x_probe_dt(&client->dev, pdata);
+		if (err) {
+			dev_err(&client->dev, "invalid platform or devicetree data");
+			return err;
+		}
+	}
+
+	if (data->id == MCP4725 && pdata->vref_mode > 0) {
 		dev_warn(&client->dev, "vref mode is unavailable on MCP4725, ignoring");
-		platform_data->vref_mode = 0;
+		pdata->vref_mode = 0;
 	}
 
-	if (data->id == MCP4726 && platform_data->vref_mode > 3) {
+	if (data->id == MCP4726 && pdata->vref_mode > 3) {
 		dev_err(&client->dev, "vref mode is out of range");
 		return -EINVAL;
 	}
@@ -368,8 +414,8 @@ static int mcp4725_probe(struct i2c_client *client,
 	indio_dev->num_channels = 1;
 	indio_dev->modes = INDIO_DIRECT_MODE;
 
-	data->vref_mv = platform_data->vref_mv;
-	data->vref_mode = platform_data->vref_mode;
+	data->vref_mv = pdata->vref_mv;
+	data->vref_mode = pdata->vref_mode;
 
 	/* read current DAC value */
 	err = i2c_master_recv(client, inoutbuf, 3);
@@ -402,6 +448,9 @@ static int mcp4725_probe(struct i2c_client *client,
 			return -EIO;
 	}
 
+	if (!dev_get_platdata(&client->dev))
+		devm_kfree(&client->dev, pdata);
+
 	return iio_device_register(indio_dev);
 }
 
-- 
2.1.4
