Return-Path: <>
From: Martin Kelly <martin@martingkelly.com>
Subject: [PATCH v3 6/6] iio:bmi160: use if (ret) instead of if (ret < 0)
Date: Sun, 27 Jan 2019 12:39:11 -0800
Message-Id: <20190127203911.8696-7-martin@martingkelly.com>
In-Reply-To: <20190127203911.8696-1-martin@martingkelly.com>
References: <20190127203911.8696-1-martin@martingkelly.com>
To: linux-iio@vger.kernel.org
Cc: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Daniel Baluta <daniel.baluta@gmail.com>, devicetree@vger.kernel.org, Martin Kelly <martin@martingkelly.com>
List-ID: <devicetree@vger.kernel.org>

From: Martin Kelly <martin@martingkelly.com>

We are using "if (ret < 0)" in many places in which the function returns 0
on success. Use "if (ret)" instead for better clarity and correctness.

Signed-off-by: Martin Kelly <martin@martingkelly.com>
---
 drivers/iio/imu/bmi160/bmi160_core.c | 40 ++++++++++++++++--------------------
 1 file changed, 18 insertions(+), 22 deletions(-)

diff --git a/drivers/iio/imu/bmi160/bmi160_core.c b/drivers/iio/imu/bmi160/bmi160_core.c
index de36fe20e023..6cc11afd395e 100644
--- a/drivers/iio/imu/bmi160/bmi160_core.c
+++ b/drivers/iio/imu/bmi160/bmi160_core.c
@@ -299,7 +299,7 @@ int bmi160_set_mode(struct bmi160_data *data, enum bmi160_sensor_type t,
 		cmd = bmi160_regs[t].pmu_cmd_suspend;
 
 	ret = regmap_write(data->regmap, BMI160_REG_CMD, cmd);
-	if (ret < 0)
+	if (ret)
 		return ret;
 
 	usleep_range(bmi160_pmu_time[t], bmi160_pmu_time[t] + 1000);
@@ -331,7 +331,7 @@ int bmi160_get_scale(struct bmi160_data *data, enum bmi160_sensor_type t,
 	int i, ret, val;
 
 	ret = regmap_read(data->regmap, bmi160_regs[t].range, &val);
-	if (ret < 0)
+	if (ret)
 		return ret;
 
 	for (i = 0; i < bmi160_scale_table[t].num; i++)
@@ -354,7 +354,7 @@ static int bmi160_get_data(struct bmi160_data *data, int chan_type,
 	reg = bmi160_regs[t].data + (axis - IIO_MOD_X) * sizeof(sample);
 
 	ret = regmap_bulk_read(data->regmap, reg, &sample, sizeof(sample));
-	if (ret < 0)
+	if (ret)
 		return ret;
 
 	*val = sign_extend32(le16_to_cpu(sample), 15);
@@ -388,7 +388,7 @@ static int bmi160_get_odr(struct bmi160_data *data, enum bmi160_sensor_type t,
 	int i, val, ret;
 
 	ret = regmap_read(data->regmap, bmi160_regs[t].config, &val);
-	if (ret < 0)
+	if (ret)
 		return ret;
 
 	val &= bmi160_regs[t].config_odr_mask;
@@ -420,7 +420,7 @@ static irqreturn_t bmi160_trigger_handler(int irq, void *p)
 			 indio_dev->masklength) {
 		ret = regmap_bulk_read(data->regmap, base + i * sizeof(sample),
 				       &sample, sizeof(sample));
-		if (ret < 0)
+		if (ret)
 			goto done;
 		buf[j++] = sample;
 	}
@@ -441,18 +441,18 @@ static int bmi160_read_raw(struct iio_dev *indio_dev,
 	switch (mask) {
 	case IIO_CHAN_INFO_RAW:
 		ret = bmi160_get_data(data, chan->type, chan->channel2, val);
-		if (ret < 0)
+		if (ret)
 			return ret;
 		return IIO_VAL_INT;
 	case IIO_CHAN_INFO_SCALE:
 		*val = 0;
 		ret = bmi160_get_scale(data,
 				       bmi160_to_sensor(chan->type), val2);
-		return ret < 0 ? ret : IIO_VAL_INT_PLUS_MICRO;
+		return ret ? ret : IIO_VAL_INT_PLUS_MICRO;
 	case IIO_CHAN_INFO_SAMP_FREQ:
 		ret = bmi160_get_odr(data, bmi160_to_sensor(chan->type),
 				     val, val2);
-		return ret < 0 ? ret : IIO_VAL_INT_PLUS_MICRO;
+		return ret ? ret : IIO_VAL_INT_PLUS_MICRO;
 	default:
 		return -EINVAL;
 	}
@@ -710,7 +710,7 @@ static int bmi160_chip_init(struct bmi160_data *data, bool use_spi)
 	struct device *dev = regmap_get_device(data->regmap);
 
 	ret = regmap_write(data->regmap, BMI160_REG_CMD, BMI160_CMD_SOFTRESET);
-	if (ret < 0)
+	if (ret)
 		return ret;
 
 	usleep_range(BMI160_SOFTRESET_USLEEP, BMI160_SOFTRESET_USLEEP + 1);
@@ -721,12 +721,12 @@ static int bmi160_chip_init(struct bmi160_data *data, bool use_spi)
 	 */
 	if (use_spi) {
 		ret = regmap_read(data->regmap, BMI160_REG_DUMMY, &val);
-		if (ret < 0)
+		if (ret)
 			return ret;
 	}
 
 	ret = regmap_read(data->regmap, BMI160_REG_CHIP_ID, &val);
-	if (ret < 0) {
+	if (ret) {
 		dev_err(dev, "Error reading chip id\n");
 		return ret;
 	}
@@ -737,11 +737,11 @@ static int bmi160_chip_init(struct bmi160_data *data, bool use_spi)
 	}
 
 	ret = bmi160_set_mode(data, BMI160_ACCEL, true);
-	if (ret < 0)
+	if (ret)
 		return ret;
 
 	ret = bmi160_set_mode(data, BMI160_GYRO, true);
-	if (ret < 0)
+	if (ret)
 		return ret;
 
 	return 0;
@@ -774,7 +774,7 @@ int bmi160_probe_trigger(struct iio_dev *indio_dev, int irq, u32 irq_type)
 	ret = devm_request_irq(&indio_dev->dev, irq,
 			       &iio_trigger_generic_data_rdy_poll,
 			       irq_type, "bmi160", data->trig);
-	if (ret < 0)
+	if (ret)
 		return ret;
 
 	data->trig->dev.parent = regmap_get_device(data->regmap);
@@ -816,11 +816,11 @@ int bmi160_core_probe(struct device *dev, struct regmap *regmap,
 	data->regmap = regmap;
 
 	ret = bmi160_chip_init(data, use_spi);
-	if (ret < 0)
+	if (ret)
 		return ret;
 
 	ret = devm_add_action_or_reset(dev, bmi160_chip_uninit, data);
-	if (ret < 0)
+	if (ret)
 		return ret;
 
 	if (!name && ACPI_HANDLE(dev))
@@ -836,7 +836,7 @@ int bmi160_core_probe(struct device *dev, struct regmap *regmap,
 	ret = devm_iio_triggered_buffer_setup(dev, indio_dev,
 					      iio_pollfunc_store_time,
 					      bmi160_trigger_handler, NULL);
-	if (ret < 0)
+	if (ret)
 		return ret;
 
 	irq = bmi160_get_irq(dev->of_node, &int_pin);
@@ -849,11 +849,7 @@ int bmi160_core_probe(struct device *dev, struct regmap *regmap,
 		dev_info(&indio_dev->dev, "Not setting up IRQ trigger\n");
 	}
 
-	ret = devm_iio_device_register(dev, indio_dev);
-	if (ret < 0)
-		return ret;
-
-	return 0;
+	return devm_iio_device_register(dev, indio_dev);
 }
 EXPORT_SYMBOL_GPL(bmi160_core_probe);
 
-- 
2.11.0
