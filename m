From: Renato Lui Geh <renatogeh@gmail.com>
Subject: [PATCH v4 1/9] staging: iio: ad7780: add gain & filter gpio support
Date: Thu, 28 Feb 2019 11:23:32 -0300
Message-ID: <b83c0558a600cb44677b0d06f31e014be550b8bf.1551358569.git.renatogeh@gmail.com>
References: <cover.1551358569.git.renatogeh@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cover.1551358569.git.renatogeh@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org, knaack.h@gmx.de, pmeerw@pmeerw.net, gregkh@linuxfoundation.org, stefan.popa@analog.com, alexandru.Ardelean@analog.com, giuliano.belinassi@usp.br, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-iio@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-usp@googlegroups.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Previously, the AD7780 driver only supported gpio for the 'powerdown'
pin. This commit adds suppport for the 'gain' and 'filter' pin.

Signed-off-by: Renato Lui Geh <renatogeh@gmail.com>
Signed-off-by: Giuliano Belinassi <giuliano.belinassi@usp.br>
Co-developed-by: Giuliano Belinassi <giuliano.belinassi@usp.br>
---
Changes in v3:
 - Renamed ad7780_chip_info's filter to odr
 - Renamed ad778x_filter to ad778x_odr_avail
 - Changed vref variable from unsigned int to unsigned long long to avoid
   overflow
 - Removed unnecessary AD_SD_CHANNEL macro
Changes in v4:
 - Removed useless macro
 - Added default case for switch to suppress warning
 - Removed chunks belonging to filter reading, adding these as a
   patch for itself

 drivers/staging/iio/adc/ad7780.c | 90 +++++++++++++++++++++++++++++---
 1 file changed, 84 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/iio/adc/ad7780.c b/drivers/staging/iio/adc/ad7780.c
index c4a85789c2db..87fbcf510d45 100644
--- a/drivers/staging/iio/adc/ad7780.c
+++ b/drivers/staging/iio/adc/ad7780.c
@@ -39,6 +39,12 @@
 #define AD7170_PATTERN		(AD7780_PAT0 | AD7170_PAT2)
 #define AD7170_PATTERN_MASK	(AD7780_PAT0 | AD7780_PAT1 | AD7170_PAT2)
 
+#define AD7780_GAIN_MIDPOINT	64
+#define AD7780_FILTER_MIDPOINT	13350
+
+static const unsigned int ad778x_gain[2]      = { 1, 128 };
+static const unsigned int ad778x_odr_avail[2] = { 10000, 16700 };
+
 struct ad7780_chip_info {
 	struct iio_chan_spec	channel;
 	unsigned int		pattern_mask;
@@ -50,7 +56,10 @@ struct ad7780_state {
 	const struct ad7780_chip_info	*chip_info;
 	struct regulator		*reg;
 	struct gpio_desc		*powerdown_gpio;
-	unsigned int	gain;
+	struct gpio_desc		*gain_gpio;
+	struct gpio_desc		*filter_gpio;
+	unsigned int			gain;
+	unsigned int			int_vref_mv;
 
 	struct ad_sigma_delta sd;
 };
@@ -104,17 +113,65 @@ static int ad7780_read_raw(struct iio_dev *indio_dev,
 		voltage_uv = regulator_get_voltage(st->reg);
 		if (voltage_uv < 0)
 			return voltage_uv;
-		*val = (voltage_uv / 1000) * st->gain;
+		voltage_uv /= 1000;
+		*val = voltage_uv * st->gain;
 		*val2 = chan->scan_type.realbits - 1;
+		st->int_vref_mv = voltage_uv;
 		return IIO_VAL_FRACTIONAL_LOG2;
 	case IIO_CHAN_INFO_OFFSET:
 		*val = -(1 << (chan->scan_type.realbits - 1));
 		return IIO_VAL_INT;
+	default:
+	break;
 	}
 
 	return -EINVAL;
 }
 
+static int ad7780_write_raw(struct iio_dev *indio_dev,
+			    struct iio_chan_spec const *chan,
+			    int val,
+			    int val2,
+			    long m)
+{
+	struct ad7780_state *st = iio_priv(indio_dev);
+	const struct ad7780_chip_info *chip_info = st->chip_info;
+	unsigned long long vref;
+	unsigned int full_scale, gain;
+
+	if (!chip_info->is_ad778x)
+		return 0;
+
+	switch (m) {
+	case IIO_CHAN_INFO_SCALE:
+		if (val != 0)
+			return -EINVAL;
+
+		vref = st->int_vref_mv * 1000000LL;
+		full_scale = 1 << (chip_info->channel.scan_type.realbits - 1);
+		gain = DIV_ROUND_CLOSEST(vref, full_scale);
+		gain = DIV_ROUND_CLOSEST(gain, val2);
+		st->gain = gain;
+		if (gain < AD7780_GAIN_MIDPOINT)
+			gain = 0;
+		else
+			gain = 1;
+		gpiod_set_value(st->gain_gpio, gain);
+		break;
+	case IIO_CHAN_INFO_SAMP_FREQ:
+		if (1000*val + val2/1000 < AD7780_FILTER_MIDPOINT)
+			val = 0;
+		else
+			val = 1;
+		gpiod_set_value(st->filter_gpio, val);
+		break;
+	default:
+	break;
+	}
+
+	return 0;
+}
+
 static int ad7780_postprocess_sample(struct ad_sigma_delta *sigma_delta,
 				     unsigned int raw_sample)
 {
@@ -126,10 +183,7 @@ static int ad7780_postprocess_sample(struct ad_sigma_delta *sigma_delta,
 		return -EIO;
 
 	if (chip_info->is_ad778x) {
-		if (raw_sample & AD7780_GAIN)
-			st->gain = 1;
-		else
-			st->gain = 128;
+		st->gain = ad778x_gain[raw_sample & AD7780_GAIN];
 	}
 
 	return 0;
@@ -173,6 +227,7 @@ static const struct ad7780_chip_info ad7780_chip_info_tbl[] = {
 
 static const struct iio_info ad7780_info = {
 	.read_raw = ad7780_read_raw,
+	.write_raw = ad7780_write_raw,
 };
 
 static int ad7780_probe(struct spi_device *spi)
@@ -222,6 +277,29 @@ static int ad7780_probe(struct spi_device *spi)
 		goto error_disable_reg;
 	}
 
+	if (st->chip_info->is_ad778x) {
+		st->gain_gpio = devm_gpiod_get_optional(&spi->dev,
+							"adi,gain",
+							GPIOD_OUT_HIGH);
+		if (IS_ERR(st->gain_gpio)) {
+			ret = PTR_ERR(st->gain_gpio);
+			dev_err(&spi->dev, "Failed to request gain GPIO: %d\n",
+				ret);
+			goto error_disable_reg;
+		}
+
+		st->filter_gpio = devm_gpiod_get_optional(&spi->dev,
+							  "adi,filter",
+							  GPIOD_OUT_HIGH);
+		if (IS_ERR(st->filter_gpio)) {
+			ret = PTR_ERR(st->filter_gpio);
+			dev_err(&spi->dev,
+				"Failed to request filter GPIO: %d\n",
+				ret);
+			goto error_disable_reg;
+		}
+	}
+
 	ret = ad_sd_setup_buffer_and_trigger(indio_dev);
 	if (ret)
 		goto error_disable_reg;
-- 
2.21.0
