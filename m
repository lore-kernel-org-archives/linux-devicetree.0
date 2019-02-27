From: Stefan Popa <stefan.popa@analog.com>
Subject: [PATCH v3 5/7] iio: imu: adis16480: Deal with filter freq in a generic way
Date: Wed, 27 Feb 2019 18:14:26 +0200
Message-ID: <1551284068-4882-6-git-send-email-stefan.popa@analog.com>
References: <1551284068-4882-1-git-send-email-stefan.popa@analog.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1551284068-4882-1-git-send-email-stefan.popa@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jic23@kernel.org, robh+dt@kernel.org
Cc: Stefan Popa <stefan.popa@analog.com>, Michael.Hennerich@analog.com, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

When setting the filter frequency, the driver looks into the
adis16480_def_filter_freqs table for the best match. Pass this table to
the chip_info struct since future devices will need to use a different
table.

Signed-off-by: Stefan Popa <stefan.popa@analog.com>
---
 drivers/iio/imu/adis16480.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/imu/adis16480.c b/drivers/iio/imu/adis16480.c
index 92abc95..c90375d 100644
--- a/drivers/iio/imu/adis16480.c
+++ b/drivers/iio/imu/adis16480.c
@@ -127,6 +127,7 @@ struct adis16480_chip_info {
 	unsigned int temp_scale;
 	unsigned int int_clk;
 	unsigned int max_dec_rate;
+	const unsigned int *filter_freqs;
 };
 
 enum adis16480_int_pin {
@@ -483,7 +484,7 @@ static int adis16480_get_filter_freq(struct iio_dev *indio_dev,
 	if (!(val & enable_mask))
 		*freq = 0;
 	else
-		*freq = adis16480_def_filter_freqs[(val >> offset) & 0x3];
+		*freq = st->chip_info->filter_freqs[(val >> offset) & 0x3];
 
 	return IIO_VAL_INT;
 }
@@ -510,10 +511,10 @@ static int adis16480_set_filter_freq(struct iio_dev *indio_dev,
 		val &= ~enable_mask;
 	} else {
 		best_freq = 0;
-		best_diff = 310;
+		best_diff = st->chip_info->filter_freqs[0];
 		for (i = 0; i < ARRAY_SIZE(adis16480_def_filter_freqs); i++) {
-			if (adis16480_def_filter_freqs[i] >= freq) {
-				diff = adis16480_def_filter_freqs[i] - freq;
+			if (st->chip_info->filter_freqs[i] >= freq) {
+				diff = st->chip_info->filter_freqs[i] - freq;
 				if (diff < best_diff) {
 					best_diff = diff;
 					best_freq = i;
@@ -730,6 +731,7 @@ static const struct adis16480_chip_info adis16480_chip_info[] = {
 		.temp_scale = 5650, /* 5.65 milli degree Celsius */
 		.int_clk = 2460000,
 		.max_dec_rate = 2048,
+		.filter_freqs = adis16480_def_filter_freqs,
 	},
 	[ADIS16480] = {
 		.channels = adis16480_channels,
@@ -741,6 +743,7 @@ static const struct adis16480_chip_info adis16480_chip_info[] = {
 		.temp_scale = 5650, /* 5.65 milli degree Celsius */
 		.int_clk = 2460000,
 		.max_dec_rate = 2048,
+		.filter_freqs = adis16480_def_filter_freqs,
 	},
 	[ADIS16485] = {
 		.channels = adis16485_channels,
@@ -752,6 +755,7 @@ static const struct adis16480_chip_info adis16480_chip_info[] = {
 		.temp_scale = 5650, /* 5.65 milli degree Celsius */
 		.int_clk = 2460000,
 		.max_dec_rate = 2048,
+		.filter_freqs = adis16480_def_filter_freqs,
 	},
 	[ADIS16488] = {
 		.channels = adis16480_channels,
@@ -763,6 +767,7 @@ static const struct adis16480_chip_info adis16480_chip_info[] = {
 		.temp_scale = 5650, /* 5.65 milli degree Celsius */
 		.int_clk = 2460000,
 		.max_dec_rate = 2048,
+		.filter_freqs = adis16480_def_filter_freqs,
 	},
 };
 
-- 
2.7.4
