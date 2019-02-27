From: Stefan Popa <stefan.popa@analog.com>
Subject: [PATCH v3 4/7] iio: imu: adis16480: Calculate the sampling frequency in a generic way
Date: Wed, 27 Feb 2019 18:14:25 +0200
Message-ID: <1551284068-4882-5-git-send-email-stefan.popa@analog.com>
References: <1551284068-4882-1-git-send-email-stefan.popa@analog.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1551284068-4882-1-git-send-email-stefan.popa@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jic23@kernel.org, robh+dt@kernel.org
Cc: Stefan Popa <stefan.popa@analog.com>, Michael.Hennerich@analog.com, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The adis1648x devices have an internal clock of 2.46 kSPS. The sampling
frequency is calculated by applying a decimation rate which can take the
maximum value of 2047.

Although all adis1648x devices are similar in this regard, devices that
will use this feature will be added in the future.

Signed-off-by: Stefan Popa <stefan.popa@analog.com>
---
 drivers/iio/imu/adis16480.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/imu/adis16480.c b/drivers/iio/imu/adis16480.c
index 5a2864a..92abc95 100644
--- a/drivers/iio/imu/adis16480.c
+++ b/drivers/iio/imu/adis16480.c
@@ -125,6 +125,8 @@ struct adis16480_chip_info {
 	unsigned int accel_max_val;
 	unsigned int accel_max_scale;
 	unsigned int temp_scale;
+	unsigned int int_clk;
+	unsigned int max_dec_rate;
 };
 
 enum adis16480_int_pin {
@@ -299,9 +301,9 @@ static int adis16480_set_freq(struct iio_dev *indio_dev, int val, int val2)
 	if (t <= 0)
 		return -EINVAL;
 
-	t = 2460000 / t;
-	if (t > 2048)
-		t = 2048;
+	t = st->chip_info->int_clk / t;
+	if (t > st->chip_info->max_dec_rate)
+		t = st->chip_info->max_dec_rate;
 
 	if (t != 0)
 		t--;
@@ -320,7 +322,7 @@ static int adis16480_get_freq(struct iio_dev *indio_dev, int *val, int *val2)
 	if (ret < 0)
 		return ret;
 
-	freq = 2460000 / (t + 1);
+	freq = st->chip_info->int_clk / (t + 1);
 	*val = freq / 1000;
 	*val2 = (freq % 1000) * 1000;
 
@@ -726,6 +728,8 @@ static const struct adis16480_chip_info adis16480_chip_info[] = {
 		.accel_max_val = IIO_M_S_2_TO_G(21973),
 		.accel_max_scale = 18,
 		.temp_scale = 5650, /* 5.65 milli degree Celsius */
+		.int_clk = 2460000,
+		.max_dec_rate = 2048,
 	},
 	[ADIS16480] = {
 		.channels = adis16480_channels,
@@ -735,6 +739,8 @@ static const struct adis16480_chip_info adis16480_chip_info[] = {
 		.accel_max_val = IIO_M_S_2_TO_G(12500),
 		.accel_max_scale = 10,
 		.temp_scale = 5650, /* 5.65 milli degree Celsius */
+		.int_clk = 2460000,
+		.max_dec_rate = 2048,
 	},
 	[ADIS16485] = {
 		.channels = adis16485_channels,
@@ -744,6 +750,8 @@ static const struct adis16480_chip_info adis16480_chip_info[] = {
 		.accel_max_val = IIO_M_S_2_TO_G(20000),
 		.accel_max_scale = 5,
 		.temp_scale = 5650, /* 5.65 milli degree Celsius */
+		.int_clk = 2460000,
+		.max_dec_rate = 2048,
 	},
 	[ADIS16488] = {
 		.channels = adis16480_channels,
@@ -753,6 +761,8 @@ static const struct adis16480_chip_info adis16480_chip_info[] = {
 		.accel_max_val = IIO_M_S_2_TO_G(22500),
 		.accel_max_scale = 18,
 		.temp_scale = 5650, /* 5.65 milli degree Celsius */
+		.int_clk = 2460000,
+		.max_dec_rate = 2048,
 	},
 };
 
-- 
2.7.4
