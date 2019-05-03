From: Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH 1/7] iio: adc: sun4i-gpadc: rework for support multiple thermal sensor
Date: Fri,  3 May 2019 03:28:07 -0400
Message-ID: <20190503072813.2719-2-tiny.windzz@gmail.com>
References: <20190503072813.2719-1-tiny.windzz@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190503072813.2719-1-tiny.windzz@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, maxime.ripard@bootlin.com, wens@csie.org, jic23@kernel.org, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, Yangtao Li <tiny.windzz@gmail.com>
List-Id: devicetree@vger.kernel.org

For some SOCs, there are more than one thermal sensor, and there are
currently four sensors on the A80. So we need to do some work in order
to support multiple thermal sensors:

  1) add sensor_count in gpadc_data.
  2) introduce sun4i_sensor_tzd in sun4i_gpadc_iio, to support multiple
     thermal_zone_device and distinguish between different sensors.
  3) modify read temperature and initialization function.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/iio/adc/sun4i-gpadc-iio.c | 61 +++++++++++++++++++++++--------
 1 file changed, 45 insertions(+), 16 deletions(-)

diff --git a/drivers/iio/adc/sun4i-gpadc-iio.c b/drivers/iio/adc/sun4i-gpadc-iio.c
index 04d7147e0110..844fd52bd22f 100644
--- a/drivers/iio/adc/sun4i-gpadc-iio.c
+++ b/drivers/iio/adc/sun4i-gpadc-iio.c
@@ -56,6 +56,7 @@ struct gpadc_data {
 	unsigned int	tp_adc_select;
 	unsigned int	(*adc_chan_select)(unsigned int chan);
 	unsigned int	adc_chan_mask;
+	unsigned int    sensor_count;
 };
 
 static const struct gpadc_data sun4i_gpadc_data = {
@@ -65,6 +66,7 @@ static const struct gpadc_data sun4i_gpadc_data = {
 	.tp_adc_select = SUN4I_GPADC_CTRL1_TP_ADC_SELECT,
 	.adc_chan_select = &sun4i_gpadc_chan_select,
 	.adc_chan_mask = SUN4I_GPADC_CTRL1_ADC_CHAN_MASK,
+	.sensor_count = 1,
 };
 
 static const struct gpadc_data sun5i_gpadc_data = {
@@ -74,6 +76,7 @@ static const struct gpadc_data sun5i_gpadc_data = {
 	.tp_adc_select = SUN4I_GPADC_CTRL1_TP_ADC_SELECT,
 	.adc_chan_select = &sun4i_gpadc_chan_select,
 	.adc_chan_mask = SUN4I_GPADC_CTRL1_ADC_CHAN_MASK,
+	.sensor_count = 1,
 };
 
 static const struct gpadc_data sun6i_gpadc_data = {
@@ -83,14 +86,24 @@ static const struct gpadc_data sun6i_gpadc_data = {
 	.tp_adc_select = SUN6I_GPADC_CTRL1_TP_ADC_SELECT,
 	.adc_chan_select = &sun6i_gpadc_chan_select,
 	.adc_chan_mask = SUN6I_GPADC_CTRL1_ADC_CHAN_MASK,
+	.sensor_count = 1,
 };
 
 static const struct gpadc_data sun8i_a33_gpadc_data = {
 	.temp_offset = -1662,
 	.temp_scale = 162,
 	.tp_mode_en = SUN8I_GPADC_CTRL1_CHOP_TEMP_EN,
+	.sensor_count = 1,
 };
 
+struct sun4i_sensor_tzd {
+	struct sun4i_gpadc_iio          *info;
+	struct thermal_zone_device      *tzd;
+	unsigned int                    sensor_id;
+};
+
+#define MAX_SENSOR_COUNT	4
+
 struct sun4i_gpadc_iio {
 	struct iio_dev			*indio_dev;
 	struct completion		completion;
@@ -105,7 +118,7 @@ struct sun4i_gpadc_iio {
 	bool				no_irq;
 	/* prevents concurrent reads of temperature and ADC */
 	struct mutex			mutex;
-	struct thermal_zone_device	*tzd;
+	struct sun4i_sensor_tzd         tzds[MAX_SENSOR_COUNT];
 	struct device			*sensor_device;
 };
 
@@ -270,7 +283,8 @@ static int sun4i_gpadc_adc_read(struct iio_dev *indio_dev, int channel,
 	return sun4i_gpadc_read(indio_dev, channel, val, info->fifo_data_irq);
 }
 
-static int sun4i_gpadc_temp_read(struct iio_dev *indio_dev, int *val)
+static int sun4i_gpadc_temp_read(struct iio_dev *indio_dev, int *val,
+				 unsigned int sensor)
 {
 	struct sun4i_gpadc_iio *info = iio_priv(indio_dev);
 
@@ -324,7 +338,7 @@ static int sun4i_gpadc_read_raw(struct iio_dev *indio_dev,
 			ret = sun4i_gpadc_adc_read(indio_dev, chan->channel,
 						   val);
 		else
-			ret = sun4i_gpadc_temp_read(indio_dev, val);
+			ret = sun4i_gpadc_temp_read(indio_dev, val, 0);
 
 		if (ret)
 			return ret;
@@ -417,10 +431,11 @@ static int sun4i_gpadc_runtime_resume(struct device *dev)
 
 static int sun4i_gpadc_get_temp(void *data, int *temp)
 {
-	struct sun4i_gpadc_iio *info = data;
+	struct sun4i_sensor_tzd *tzd = data;
+	struct sun4i_gpadc_iio *info = tzd->info;
 	int val, scale, offset;
 
-	if (sun4i_gpadc_temp_read(info->indio_dev, &val))
+	if (sun4i_gpadc_temp_read(info->indio_dev, &val, tzd->sensor_id))
 		return -ETIMEDOUT;
 
 	sun4i_gpadc_temp_scale(info->indio_dev, &scale);
@@ -609,6 +624,28 @@ static int sun4i_gpadc_probe_mfd(struct platform_device *pdev,
 	return 0;
 }
 
+static int sun4i_sensor_init(struct sun4i_gpadc_iio *info)
+{
+	int i = 0;
+
+	for (; i < info->data->sensor_count; i++) {
+		info->tzds[i].info = info;
+		info->tzds[i].sensor_id = i;
+		info->tzds[i].tzd = devm_thermal_zone_of_sensor_register(
+					info->sensor_device, i, &info->tzds[i],
+					&sun4i_ts_tz_ops);
+
+		if (IS_ERR(info->tzds[i].tzd)) {
+			dev_err(info->sensor_device,
+				"could not register thermal sensor: %ld\n",
+				PTR_ERR(info->tzds[i].tzd));
+			return PTR_ERR(info->tzds[i].tzd);
+		}
+	}
+
+	return 0;
+}
+
 static int sun4i_gpadc_probe(struct platform_device *pdev)
 {
 	struct sun4i_gpadc_iio *info;
@@ -646,19 +683,13 @@ static int sun4i_gpadc_probe(struct platform_device *pdev)
 	pm_runtime_enable(&pdev->dev);
 
 	if (IS_ENABLED(CONFIG_THERMAL_OF)) {
-		info->tzd = thermal_zone_of_sensor_register(info->sensor_device,
-							    0, info,
-							    &sun4i_ts_tz_ops);
+		ret = sun4i_sensor_init(info);
 		/*
 		 * Do not fail driver probing when failing to register in
 		 * thermal because no thermal DT node is found.
 		 */
-		if (IS_ERR(info->tzd) && PTR_ERR(info->tzd) != -ENODEV) {
-			dev_err(&pdev->dev,
-				"could not register thermal sensor: %ld\n",
-				PTR_ERR(info->tzd));
-			return PTR_ERR(info->tzd);
-		}
+		if (ret && ret != -ENODEV)
+			return ret;
 	}
 
 	ret = devm_iio_device_register(&pdev->dev, indio_dev);
@@ -690,8 +721,6 @@ static int sun4i_gpadc_remove(struct platform_device *pdev)
 	if (!IS_ENABLED(CONFIG_THERMAL_OF))
 		return 0;
 
-	thermal_zone_of_sensor_unregister(info->sensor_device, info->tzd);
-
 	if (!info->no_irq)
 		iio_map_array_unregister(indio_dev);
 
-- 
2.17.1
