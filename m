From: Renato Lui Geh <renatogeh@gmail.com>
Subject: [PATCH v5 04/11] staging: iio: ad7780: add filter reading to ad778x
Date: Fri, 15 Mar 2019 23:13:42 -0300
Message-ID: <66a914ed7d1512f5aedfc5a0c6cbae38f5588e35.1552700652.git.renatogeh@gmail.com>
References: <cover.1552700652.git.renatogeh@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cover.1552700652.git.renatogeh@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org, knaack.h@gmx.de, pmeerw@pmeerw.net, gregkh@linuxfoundation.org, stefan.popa@analog.com, alexandru.Ardelean@analog.com, giuliano.belinassi@usp.br, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-iio@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-usp@googlegroups.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch adds the new feature of reading the filter odr value for
ad778x chips. This value is stored in the chip's state struct whenever a
read or write call is performed on the chip's driver.

This feature requires sharing SAMP_FREQ. Since the ad717x does not have
a filter option, the driver only shares the relevant info mask for the
ad778x family.

Signed-off-by: Renato Lui Geh <renatogeh@gmail.com>
---
Changes in v4:
 - As mentioned in the previous patch, this was originally as part of
   the 'add gain & filter gpio support' patch
Changes in v5:
 - Moved ad778x_odr_avail declaration from GPIO patch to this one

 drivers/staging/iio/adc/ad7780.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/iio/adc/ad7780.c b/drivers/staging/iio/adc/ad7780.c
index fbcc0d3345ca..8ff74427d975 100644
--- a/drivers/staging/iio/adc/ad7780.c
+++ b/drivers/staging/iio/adc/ad7780.c
@@ -42,7 +42,8 @@
 #define AD7780_GAIN_MIDPOINT	64
 #define AD7780_FILTER_MIDPOINT	13350
 
-static const unsigned int ad778x_gain[2] = { 1, 128 };
+static const unsigned int ad778x_gain[2]      = { 1, 128 };
+static const unsigned int ad778x_odr_avail[2] = { 10000, 16700 };
 
 struct ad7780_chip_info {
 	struct iio_chan_spec	channel;
@@ -58,6 +59,7 @@ struct ad7780_state {
 	struct gpio_desc		*gain_gpio;
 	struct gpio_desc		*filter_gpio;
 	unsigned int			gain;
+	unsigned int			odr;
 	unsigned int			int_vref_mv;
 
 	struct ad_sigma_delta sd;
@@ -120,6 +122,9 @@ static int ad7780_read_raw(struct iio_dev *indio_dev,
 	case IIO_CHAN_INFO_OFFSET:
 		*val = -(1 << (chan->scan_type.realbits - 1));
 		return IIO_VAL_INT;
+	case IIO_CHAN_INFO_SAMP_FREQ:
+		*val = st->odr;
+		return IIO_VAL_INT;
 	default:
 		break;
 	}
@@ -162,6 +167,7 @@ static int ad7780_write_raw(struct iio_dev *indio_dev,
 			val = 0;
 		else
 			val = 1;
+		st->odr = ad778x_odr_avail[val];
 		gpiod_set_value(st->filter_gpio, val);
 		break;
 	default:
@@ -181,8 +187,10 @@ static int ad7780_postprocess_sample(struct ad_sigma_delta *sigma_delta,
 	    ((raw_sample & chip_info->pattern_mask) != chip_info->pattern))
 		return -EIO;
 
-	if (chip_info->is_ad778x)
+	if (chip_info->is_ad778x) {
 		st->gain = ad778x_gain[raw_sample & AD7780_GAIN];
+		st->odr = ad778x_odr_avail[raw_sample & AD7780_FILTER];
+	}
 
 	return 0;
 }
@@ -194,17 +202,19 @@ static const struct ad_sigma_delta_info ad7780_sigma_delta_info = {
 };
 
 #define AD7780_CHANNEL(bits, wordsize) \
+	AD_SD_CHANNEL(1, 0, 0, bits, 32, wordsize - bits)
+#define AD7170_CHANNEL(bits, wordsize) \
 	AD_SD_CHANNEL_NO_SAMP_FREQ(1, 0, 0, bits, 32, wordsize - bits)
 
 static const struct ad7780_chip_info ad7780_chip_info_tbl[] = {
 	[ID_AD7170] = {
-		.channel = AD7780_CHANNEL(12, 24),
+		.channel = AD7170_CHANNEL(12, 24),
 		.pattern = AD7170_PATTERN,
 		.pattern_mask = AD7170_PATTERN_MASK,
 		.is_ad778x = false,
 	},
 	[ID_AD7171] = {
-		.channel = AD7780_CHANNEL(16, 24),
+		.channel = AD7170_CHANNEL(16, 24),
 		.pattern = AD7170_PATTERN,
 		.pattern_mask = AD7170_PATTERN_MASK,
 		.is_ad778x = false,
-- 
2.21.0
