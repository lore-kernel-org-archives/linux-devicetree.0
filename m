From: Andreas Klinger <ak@it-klinger.de>
Subject: [PATCH v3 3/4] mb1232.c: add distance iio sensor with i2c
Date: Sun, 17 Mar 2019 21:38:03 +0100
Message-ID: <20190317203801.uz2rhpyevsulh5c5@arbad>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-iio@vger.kernel.org
Cc: jic23@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, afaerber@suse.de, arnd@arndb.de, davem@davemloft.net, gregkh@linuxfoundation.org, johan@kernel.org, khilman@baylibre.com, knaack.h@gmx.de, lars@metafoo.de, linux-kernel@vger.kernel.org, martin.blumenstingl@googlemail.com, mchehab+samsung@kernel.org, m.othacehe@gmail.com, nicolas.ferre@microchip.com, pmeerw@pmeerw.net, robh@kernel.org, songqiang1304521@gmail.com, treding@nvidia.com, techsupport@maxbotix.com
List-Id: devicetree@vger.kernel.org

Add I2CXL-MaxSonar ultrasonic distance sensors of types mb1202, mb1212,
mb1222, mb1232, mb1242, mb7040, mb7137 using an i2c interface

Implemented functionality:
- reading the distance via in_distance_raw
- buffered mode with trigger
- make use of interrupt to announce completion of ranging

Add mb1232 driver to Kconfig and Makefile

Signed-off-by: Andreas Klinger <ak@it-klinger.de>
---
 drivers/iio/proximity/Kconfig  |  12 ++
 drivers/iio/proximity/Makefile |   1 +
 drivers/iio/proximity/mb1232.c | 274 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 287 insertions(+)
 create mode 100644 drivers/iio/proximity/mb1232.c

diff --git a/drivers/iio/proximity/Kconfig b/drivers/iio/proximity/Kconfig
index b99367a89f81..12a3d3d40a91 100644
--- a/drivers/iio/proximity/Kconfig
+++ b/drivers/iio/proximity/Kconfig
@@ -45,6 +45,18 @@ config LIDAR_LITE_V2
 	  To compile this driver as a module, choose M here: the
 	  module will be called pulsedlight-lite-v2
 
+config MB1232
+	tristate "MaxSonar I2CXL family ultrasonic sensors"
+	depends on I2C
+	help
+	  Say Y to build a driver for the ultrasonic sensors I2CXL of
+	  MaxBotix which have an i2c interface. It can be used to measure
+	  the distance of objects. Supported types are mb1202, mb1212,
+	  mb1222, mb1232, mb1242, mb7040, mb7137
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called mb1232.
+
 config RFD77402
 	tristate "RFD77402 ToF sensor"
 	depends on I2C
diff --git a/drivers/iio/proximity/Makefile b/drivers/iio/proximity/Makefile
index 6d031f903c4c..0bb5f9de13d6 100644
--- a/drivers/iio/proximity/Makefile
+++ b/drivers/iio/proximity/Makefile
@@ -7,6 +7,7 @@
 obj-$(CONFIG_AS3935)		+= as3935.o
 obj-$(CONFIG_ISL29501)		+= isl29501.o
 obj-$(CONFIG_LIDAR_LITE_V2)	+= pulsedlight-lidar-lite-v2.o
+obj-$(CONFIG_MB1232)		+= mb1232.o
 obj-$(CONFIG_RFD77402)		+= rfd77402.o
 obj-$(CONFIG_SRF04)		+= srf04.o
 obj-$(CONFIG_SRF08)		+= srf08.o
diff --git a/drivers/iio/proximity/mb1232.c b/drivers/iio/proximity/mb1232.c
new file mode 100644
index 000000000000..d061cb16da93
--- /dev/null
+++ b/drivers/iio/proximity/mb1232.c
@@ -0,0 +1,274 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * mb1232.c - Support for MaxBotix I2CXL-MaxSonar-EZ series ultrasonic
+ *   ranger with i2c interface
+ * actually tested with mb1232 type
+ *
+ * Copyright (c) 2019 Andreas Klinger <ak@it-klinger.de>
+ *
+ * For details about the device see:
+ * https://www.maxbotix.com/documents/I2CXL-MaxSonar-EZ_Datasheet.pdf
+ *
+ */
+
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/of_irq.h>
+#include <linux/delay.h>
+#include <linux/module.h>
+#include <linux/bitops.h>
+#include <linux/iio/iio.h>
+#include <linux/iio/sysfs.h>
+#include <linux/iio/buffer.h>
+#include <linux/iio/trigger_consumer.h>
+#include <linux/iio/triggered_buffer.h>
+
+/* registers of MaxSonar device */
+#define MB1232_RANGE_COMMAND	0x51	/* Command for reading range */
+#define MB1232_ADDR_UNLOCK_1	0xAA	/* Command 1 for changing address */
+#define MB1232_ADDR_UNLOCK_2	0xA5	/* Command 2 for changing address */
+
+struct mb1232_data {
+	struct i2c_client	*client;
+
+	struct mutex		lock;
+
+	/*
+	 * optionally a gpio can be used to announce when ranging has
+	 * finished
+	 * since we are just using the falling trigger of it we request
+	 * only the interrupt for announcing when data is ready to be read
+	 */
+	struct completion	ranging;
+	int			irqnr;
+};
+
+static irqreturn_t mb1232_handle_irq(int irq, void *dev_id)
+{
+	struct iio_dev *indio_dev = dev_id;
+	struct mb1232_data *data = iio_priv(indio_dev);
+
+	complete(&data->ranging);
+
+	return IRQ_HANDLED;
+}
+
+static s16 mb1232_read_distance(struct mb1232_data *data)
+{
+	struct i2c_client *client = data->client;
+	int ret;
+	s16 distance;
+	__be16 buf;
+
+	mutex_lock(&data->lock);
+
+	reinit_completion(&data->ranging);
+
+	ret = i2c_smbus_write_byte(client, MB1232_RANGE_COMMAND);
+	if (ret < 0) {
+		dev_err(&client->dev, "write command - err: %d\n", ret);
+		goto error_unlock;
+	}
+
+	if (data->irqnr >= 0) {
+		/* it cannot take more than 100 ms */
+		ret = wait_for_completion_killable_timeout(&data->ranging,
+									HZ/10);
+		if (ret < 0)
+			goto error_unlock;
+		else if (ret == 0) {
+			ret = -ETIMEDOUT;
+			goto error_unlock;
+		}
+	} else {
+		/* use simple sleep if announce irq is not connected */
+		msleep(15);
+	}
+
+	ret = i2c_master_recv(client, (char *)&buf, sizeof(buf));
+	if (ret < 0) {
+		dev_err(&client->dev, "i2c_master_recv: ret=%d\n", ret);
+		goto error_unlock;
+	}
+
+	distance = __be16_to_cpu(buf);
+	/* check for not returning misleading error codes */
+	if (distance < 0) {
+		dev_err(&client->dev, "distance=%d\n", distance);
+		ret = -EINVAL;
+		goto error_unlock;
+	}
+
+	mutex_unlock(&data->lock);
+
+	return distance;
+
+error_unlock:
+	mutex_unlock(&data->lock);
+
+	return ret;
+}
+
+static irqreturn_t mb1232_trigger_handler(int irq, void *p)
+{
+	struct iio_poll_func *pf = p;
+	struct iio_dev *indio_dev = pf->indio_dev;
+	struct mb1232_data *data = iio_priv(indio_dev);
+	/*
+	 * triggered buffer
+	 * 16-bit channel + 48-bit padding + 64-bit timestamp
+	 */
+	s16 buffer[8];
+
+	buffer[0] = mb1232_read_distance(data);
+	if (buffer[0] < 0)
+		goto err;
+
+	iio_push_to_buffers_with_timestamp(indio_dev, buffer, pf->timestamp);
+
+err:
+	iio_trigger_notify_done(indio_dev->trig);
+	return IRQ_HANDLED;
+}
+
+static int mb1232_read_raw(struct iio_dev *indio_dev,
+			    struct iio_chan_spec const *channel, int *val,
+			    int *val2, long mask)
+{
+	struct mb1232_data *data = iio_priv(indio_dev);
+	int ret;
+
+	if (channel->type != IIO_DISTANCE)
+		return -EINVAL;
+
+	switch (mask) {
+	case IIO_CHAN_INFO_RAW:
+		ret = mb1232_read_distance(data);
+		if (ret < 0)
+			return ret;
+		*val = ret;
+		return IIO_VAL_INT;
+	case IIO_CHAN_INFO_SCALE:
+		/* 1 LSB is 1 cm */
+		*val = 0;
+		*val2 = 10000;
+		return IIO_VAL_INT_PLUS_MICRO;
+	default:
+		return -EINVAL;
+	}
+}
+
+static const struct iio_chan_spec mb1232_channels[] = {
+	{
+		.type = IIO_DISTANCE,
+		.info_mask_separate =
+				BIT(IIO_CHAN_INFO_RAW) |
+				BIT(IIO_CHAN_INFO_SCALE),
+		.scan_index = 0,
+		.scan_type = {
+			.sign = 's',
+			.realbits = 16,
+			.storagebits = 16,
+			.endianness = IIO_CPU,
+		},
+	},
+	IIO_CHAN_SOFT_TIMESTAMP(1),
+};
+
+static const struct iio_info mb1232_info = {
+	.read_raw = mb1232_read_raw,
+};
+
+static int mb1232_probe(struct i2c_client *client,
+					 const struct i2c_device_id *id)
+{
+	struct iio_dev *indio_dev;
+	struct mb1232_data *data;
+	int ret;
+	struct device *dev = &client->dev;
+
+	if (!i2c_check_functionality(client->adapter,
+					I2C_FUNC_SMBUS_READ_BYTE |
+					I2C_FUNC_SMBUS_WRITE_BYTE))
+		return -ENODEV;
+
+	indio_dev = devm_iio_device_alloc(dev, sizeof(*data));
+	if (!indio_dev)
+		return -ENOMEM;
+
+	data = iio_priv(indio_dev);
+	i2c_set_clientdata(client, indio_dev);
+	data->client = client;
+
+	indio_dev->info = &mb1232_info;
+	indio_dev->name = id->name;
+	indio_dev->dev.parent = dev;
+	indio_dev->modes = INDIO_DIRECT_MODE;
+	indio_dev->channels = mb1232_channels;
+	indio_dev->num_channels = ARRAY_SIZE(mb1232_channels);
+
+	mutex_init(&data->lock);
+
+	init_completion(&data->ranging);
+
+	data->irqnr = irq_of_parse_and_map(dev->of_node, 0);
+	if (data->irqnr <= 0) {
+		/* usage of interrupt is optional */
+		data->irqnr = -1;
+	} else {
+		ret = devm_request_irq(dev, data->irqnr, mb1232_handle_irq,
+				IRQF_TRIGGER_FALLING, id->name, indio_dev);
+		if (ret < 0) {
+			dev_err(dev, "request_irq: %d\n", ret);
+			return ret;
+		}
+	}
+
+	ret = devm_iio_triggered_buffer_setup(dev, indio_dev,
+			iio_pollfunc_store_time, mb1232_trigger_handler, NULL);
+	if (ret < 0) {
+		dev_err(dev, "setup of iio triggered buffer failed\n");
+		return ret;
+	}
+
+	return devm_iio_device_register(dev, indio_dev);
+}
+
+static const struct of_device_id of_mb1232_match[] = {
+	{ .compatible = "maxbotix,mb1202", },
+	{ .compatible = "maxbotix,mb1212", },
+	{ .compatible = "maxbotix,mb1222", },
+	{ .compatible = "maxbotix,mb1232", },
+	{ .compatible = "maxbotix,mb1242", },
+	{ .compatible = "maxbotix,mb7040", },
+	{ .compatible = "maxbotix,mb7137", },
+	{},
+};
+
+MODULE_DEVICE_TABLE(of, of_mb1232_match);
+
+static const struct i2c_device_id mb1232_id[] = {
+	{ "maxbotix-mb1202", },
+	{ "maxbotix-mb1212", },
+	{ "maxbotix-mb1222", },
+	{ "maxbotix-mb1232", },
+	{ "maxbotix-mb1242", },
+	{ "maxbotix-mb7040", },
+	{ "maxbotix-mb7137", },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, mb1232_id);
+
+static struct i2c_driver mb1232_driver = {
+	.driver = {
+		.name	= "maxbotix-mb1232",
+		.of_match_table	= of_mb1232_match,
+	},
+	.probe = mb1232_probe,
+	.id_table = mb1232_id,
+};
+module_i2c_driver(mb1232_driver);
+
+MODULE_AUTHOR("Andreas Klinger <ak@it-klinger.de>");
+MODULE_DESCRIPTION("Maxbotix I2CXL-MaxSonar i2c ultrasonic ranger driver");
+MODULE_LICENSE("GPL");
-- 
2.11.0
