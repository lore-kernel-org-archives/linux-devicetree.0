From: Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH 2/7] iio: adc: sun4i-gpadc: introduce temp_data in gpadc_data
Date: Fri,  3 May 2019 03:28:08 -0400
Message-ID: <20190503072813.2719-3-tiny.windzz@gmail.com>
References: <20190503072813.2719-1-tiny.windzz@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190503072813.2719-1-tiny.windzz@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, maxime.ripard@bootlin.com, wens@csie.org, jic23@kernel.org, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, Yangtao Li <tiny.windzz@gmail.com>
List-Id: devicetree@vger.kernel.org

For some SOCs, the temperature data register start address may be
different, so introduce temp_data in gpadc_data.

Also modify read temperature to support multiple sensor.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/iio/adc/sun4i-gpadc-iio.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/adc/sun4i-gpadc-iio.c b/drivers/iio/adc/sun4i-gpadc-iio.c
index 844fd52bd22f..b41ec0d5964d 100644
--- a/drivers/iio/adc/sun4i-gpadc-iio.c
+++ b/drivers/iio/adc/sun4i-gpadc-iio.c
@@ -57,6 +57,7 @@ struct gpadc_data {
 	unsigned int	(*adc_chan_select)(unsigned int chan);
 	unsigned int	adc_chan_mask;
 	unsigned int    sensor_count;
+	unsigned int    temp_data_base;
 };
 
 static const struct gpadc_data sun4i_gpadc_data = {
@@ -67,6 +68,7 @@ static const struct gpadc_data sun4i_gpadc_data = {
 	.adc_chan_select = &sun4i_gpadc_chan_select,
 	.adc_chan_mask = SUN4I_GPADC_CTRL1_ADC_CHAN_MASK,
 	.sensor_count = 1,
+	.temp_data_base = SUN4I_GPADC_TEMP_DATA,
 };
 
 static const struct gpadc_data sun5i_gpadc_data = {
@@ -77,6 +79,7 @@ static const struct gpadc_data sun5i_gpadc_data = {
 	.adc_chan_select = &sun4i_gpadc_chan_select,
 	.adc_chan_mask = SUN4I_GPADC_CTRL1_ADC_CHAN_MASK,
 	.sensor_count = 1,
+	.temp_data_base = SUN4I_GPADC_TEMP_DATA,
 };
 
 static const struct gpadc_data sun6i_gpadc_data = {
@@ -87,6 +90,7 @@ static const struct gpadc_data sun6i_gpadc_data = {
 	.adc_chan_select = &sun6i_gpadc_chan_select,
 	.adc_chan_mask = SUN6I_GPADC_CTRL1_ADC_CHAN_MASK,
 	.sensor_count = 1,
+	.temp_data_base = SUN4I_GPADC_TEMP_DATA,
 };
 
 static const struct gpadc_data sun8i_a33_gpadc_data = {
@@ -94,6 +98,7 @@ static const struct gpadc_data sun8i_a33_gpadc_data = {
 	.temp_scale = 162,
 	.tp_mode_en = SUN8I_GPADC_CTRL1_CHOP_TEMP_EN,
 	.sensor_count = 1,
+	.temp_data_base = SUN4I_GPADC_TEMP_DATA,
 };
 
 struct sun4i_sensor_tzd {
@@ -291,7 +296,8 @@ static int sun4i_gpadc_temp_read(struct iio_dev *indio_dev, int *val,
 	if (info->no_irq) {
 		pm_runtime_get_sync(indio_dev->dev.parent);
 
-		regmap_read(info->regmap, SUN4I_GPADC_TEMP_DATA, val);
+		regmap_read(info->regmap, info->data->temp_data_base +
+			    0x4 * sensor, val);
 
 		pm_runtime_mark_last_busy(indio_dev->dev.parent);
 		pm_runtime_put_autosuspend(indio_dev->dev.parent);
-- 
2.17.1
