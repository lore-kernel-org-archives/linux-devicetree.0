From: Eva Rachel Retuya <eraretuya-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 3/4] iio: accel: adxl345: Setup DATA_READY trigger
Date: Mon, 13 Mar 2017 19:11:36 +0800
Message-ID: <1489403497-27849-4-git-send-email-eraretuya@gmail.com>
References: <1489403497-27849-1-git-send-email-eraretuya@gmail.com>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1489403497-27849-1-git-send-email-eraretuya-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, michael.hennerich-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org, daniel.baluta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, amsfield22-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, florian.vaussard-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Eva Rachel Retuya <eraretuya-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Eva Rachel Retuya <eraretuya-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/iio/accel/adxl345.h      |   4 +-
 drivers/iio/accel/adxl345_core.c | 113 +++++++++++++++++++++++++++++++++++++--
 drivers/iio/accel/adxl345_i2c.c  |  10 +++-
 drivers/iio/accel/adxl345_spi.c  |  10 +++-
 4 files changed, 130 insertions(+), 7 deletions(-)

diff --git a/drivers/iio/accel/adxl345.h b/drivers/iio/accel/adxl345.h
index c1ddf39..f28a503 100644
--- a/drivers/iio/accel/adxl345.h
+++ b/drivers/iio/accel/adxl345.h
@@ -11,8 +11,8 @@
 #ifndef _ADXL345_H_
 #define _ADXL345_H_
 
-int adxl345_core_probe(struct device *dev, struct regmap *regmap,
-		       const char *name);
+int adxl345_core_probe(struct device *dev, struct regmap *regmap, int irq,
+		       const char *name, bool use_int2);
 int adxl345_core_remove(struct device *dev);
 
 #endif /* _ADXL345_H_ */
diff --git a/drivers/iio/accel/adxl345_core.c b/drivers/iio/accel/adxl345_core.c
index 7eee31d..4b7055c 100644
--- a/drivers/iio/accel/adxl345_core.c
+++ b/drivers/iio/accel/adxl345_core.c
@@ -9,15 +9,19 @@
  */
 
 #include <linux/delay.h>
+#include <linux/interrupt.h>
 #include <linux/module.h>
 #include <linux/regmap.h>
 
 #include <linux/iio/iio.h>
+#include <linux/iio/trigger.h>
 
 #include "adxl345.h"
 
 #define ADXL345_REG_DEVID		0x00
 #define ADXL345_REG_POWER_CTL		0x2D
+#define ADXL345_REG_INT_ENABLE		0x2E
+#define ADXL345_REG_INT_MAP		0x2F
 #define ADXL345_REG_INT_SOURCE		0x30
 #define ADXL345_REG_DATA_FORMAT		0x31
 #define ADXL345_REG_DATAX0		0x32
@@ -39,6 +43,8 @@
 
 #define ADXL345_DEVID			0xE5
 
+#define ADXL345_IRQ_NAME		"adxl345_event"
+
 /*
  * In full-resolution mode, scale factor is maintained at ~4 mg/LSB
  * in all g ranges.
@@ -49,7 +55,9 @@
 static const int adxl345_uscale = 38300;
 
 struct adxl345_data {
+	struct iio_trigger *drdy_trig;
 	struct regmap *regmap;
+	bool drdy_trig_on;
 	u8 data_range;
 };
 
@@ -167,13 +175,57 @@ static int adxl345_read_raw(struct iio_dev *indio_dev,
 	return -EINVAL;
 }
 
+static irqreturn_t adxl345_irq(int irq, void *p)
+{
+	struct iio_dev *indio_dev = p;
+	struct adxl345_data *data = iio_priv(indio_dev);
+	int ret = IRQ_NONE;
+	u32 int_stat;
+
+	ret = regmap_read(data->regmap, ADXL345_REG_INT_SOURCE, &int_stat);
+	if (ret < 0)
+		return ret;
+
+	if (int_stat & ADXL345_INT_DATA_READY) {
+		iio_trigger_poll(data->drdy_trig);
+		ret = IRQ_HANDLED;
+	}
+
+	return ret;
+}
+
+static int adxl345_drdy_trigger_set_state(struct iio_trigger *trig, bool state)
+{
+	struct iio_dev *indio_dev = iio_trigger_get_drvdata(trig);
+	struct adxl345_data *data = iio_priv(indio_dev);
+	struct device *dev;
+	int ret;
+
+	dev = regmap_get_device(data->regmap);
+	ret = regmap_update_bits(data->regmap, ADXL345_REG_INT_ENABLE,
+				 ADXL345_INT_DATA_READY, (state ?
+				 ADXL345_INT_DATA_READY : 0));
+	if (ret < 0) {
+		dev_err(dev, "Failed to update INT_ENABLE bits\n");
+		return ret;
+	}
+	data->drdy_trig_on = state;
+
+	return ret;
+}
+
+static const struct iio_trigger_ops adxl345_trigger_ops = {
+	.owner = THIS_MODULE,
+	.set_trigger_state = adxl345_drdy_trigger_set_state,
+};
+
 static const struct iio_info adxl345_info = {
 	.driver_module	= THIS_MODULE,
 	.read_raw	= adxl345_read_raw,
 };
 
-int adxl345_core_probe(struct device *dev, struct regmap *regmap,
-		       const char *name)
+int adxl345_core_probe(struct device *dev, struct regmap *regmap, int irq,
+		       const char *name, bool use_int2)
 {
 	struct adxl345_data *data;
 	struct iio_dev *indio_dev;
@@ -212,6 +264,20 @@ int adxl345_core_probe(struct device *dev, struct regmap *regmap,
 		return ret;
 	}
 
+	/*
+	 * Any bits set to 0 send their respective interrupts to the INT1 pin,
+	 * whereas bits set to 1 send their respective interrupts to the INT2
+	 * pin. Map all interrupts to the specified pin.
+	 */
+	if (!use_int2)
+		ret = regmap_write(data->regmap, ADXL345_REG_INT_MAP, 0x00);
+	else
+		ret = regmap_write(data->regmap, ADXL345_REG_INT_MAP, 0xFF);
+	if (ret < 0) {
+		dev_err(dev, "Failed to set up interrupts: %d\n", ret);
+		return ret;
+	}
+
 	indio_dev->dev.parent = dev;
 	indio_dev->name = name;
 	indio_dev->info = &adxl345_info;
@@ -219,7 +285,46 @@ int adxl345_core_probe(struct device *dev, struct regmap *regmap,
 	indio_dev->channels = adxl345_channels;
 	indio_dev->num_channels = ARRAY_SIZE(adxl345_channels);
 
-	return iio_device_register(indio_dev);
+	if (irq > 0) {
+		ret =
+		devm_request_threaded_irq(dev, irq, NULL, adxl345_irq,
+					  IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
+					  ADXL345_IRQ_NAME, indio_dev);
+		if (ret < 0) {
+			dev_err(dev, "Failed to request irq: %d\n", irq);
+			return ret;
+		}
+
+		data->drdy_trig = devm_iio_trigger_alloc(dev, "%s-dev%d",
+							 indio_dev->name,
+							 indio_dev->id);
+		if (!data->drdy_trig)
+			return -ENOMEM;
+
+		data->drdy_trig->dev.parent = dev;
+		data->drdy_trig->ops = &adxl345_trigger_ops;
+		iio_trigger_set_drvdata(data->drdy_trig, indio_dev);
+
+		ret = iio_trigger_register(data->drdy_trig);
+		if (ret) {
+			dev_err(dev, "Failed to register trigger: %d\n", ret);
+			return ret;
+		}
+	}
+
+	ret = iio_device_register(indio_dev);
+	if (ret < 0) {
+		dev_err(dev, "iio_device_register failed: %d\n", ret);
+		goto err_trigger_unregister;
+	}
+
+	return ret;
+
+err_trigger_unregister:
+	if (data->drdy_trig)
+		iio_trigger_unregister(data->drdy_trig);
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(adxl345_core_probe);
 
@@ -229,6 +334,8 @@ int adxl345_core_remove(struct device *dev)
 	struct adxl345_data *data = iio_priv(indio_dev);
 
 	iio_device_unregister(indio_dev);
+	if (data->drdy_trig)
+		iio_trigger_unregister(data->drdy_trig);
 
 	return adxl345_set_mode(data, ADXL345_POWER_CTL_STANDBY);
 }
diff --git a/drivers/iio/accel/adxl345_i2c.c b/drivers/iio/accel/adxl345_i2c.c
index 05e1ec4..8c791b8 100644
--- a/drivers/iio/accel/adxl345_i2c.c
+++ b/drivers/iio/accel/adxl345_i2c.c
@@ -13,6 +13,7 @@
 
 #include <linux/i2c.h>
 #include <linux/module.h>
+#include <linux/of_irq.h>
 #include <linux/regmap.h>
 
 #include "adxl345.h"
@@ -26,6 +27,8 @@ static int adxl345_i2c_probe(struct i2c_client *client,
 			     const struct i2c_device_id *id)
 {
 	struct regmap *regmap;
+	bool use_int2 = false;
+	int irq;
 
 	regmap = devm_regmap_init_i2c(client, &adxl345_i2c_regmap_config);
 	if (IS_ERR(regmap)) {
@@ -34,7 +37,12 @@ static int adxl345_i2c_probe(struct i2c_client *client,
 		return PTR_ERR(regmap);
 	}
 
-	return adxl345_core_probe(&client->dev, regmap, id ? id->name : NULL);
+	irq = of_irq_get_byname(client->dev.of_node, "INT2");
+	if (irq == client->irq)
+		use_int2 = true;
+
+	return adxl345_core_probe(&client->dev, regmap, client->irq,
+				  id ? id->name : NULL, use_int2);
 }
 
 static int adxl345_i2c_remove(struct i2c_client *client)
diff --git a/drivers/iio/accel/adxl345_spi.c b/drivers/iio/accel/adxl345_spi.c
index 6d65819..731d675 100644
--- a/drivers/iio/accel/adxl345_spi.c
+++ b/drivers/iio/accel/adxl345_spi.c
@@ -9,6 +9,7 @@
  */
 
 #include <linux/module.h>
+#include <linux/of_irq.h>
 #include <linux/regmap.h>
 #include <linux/spi/spi.h>
 
@@ -27,6 +28,8 @@ static int adxl345_spi_probe(struct spi_device *spi)
 {
 	const struct spi_device_id *id = spi_get_device_id(spi);
 	struct regmap *regmap;
+	bool use_int2 = false;
+	int irq;
 
 	/* Bail out if max_speed_hz exceeds 5 MHz */
 	if (spi->max_speed_hz > ADXL345_MAX_SPI_FREQ_HZ) {
@@ -42,7 +45,12 @@ static int adxl345_spi_probe(struct spi_device *spi)
 		return PTR_ERR(regmap);
 	}
 
-	return adxl345_core_probe(&spi->dev, regmap, id->name);
+	irq = of_irq_get_byname(spi->dev.of_node, "INT2");
+	if (irq == spi->irq)
+		use_int2 = true;
+
+	return adxl345_core_probe(&spi->dev, regmap, spi->irq, id->name,
+				  use_int2);
 }
 
 static int adxl345_spi_remove(struct spi_device *spi)
-- 
2.7.4
