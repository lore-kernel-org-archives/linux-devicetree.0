From: Stefan Popa <stefan.popa@analog.com>
Subject: [PATCH v2 3/5] iio: imu: adis16480: Treat temperature scale in a generic way
Date: Thu, 21 Feb 2019 15:15:04 +0200
Message-ID: <1550754906-24640-4-git-send-email-stefan.popa@analog.com>
References: <1550754906-24640-1-git-send-email-stefan.popa@analog.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550754906-24640-1-git-send-email-stefan.popa@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jic23@kernel.org, robh+dt@kernel.org
Cc: Stefan Popa <stefan.popa@analog.com>, Michael.Hennerich@analog.com, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

All supported devices provide internal temperature measurement from -40 C
to +85 C, with +25 C representing value 0x00.

This patch treats the temperature scale in a generic way, similar to the
accelerometer and gyroscope scales. So far, there are no temperature max
scale differences between the supported devices. However, devices that
will make use of this feature will be added in the future.

Signed-off-by: Stefan Popa <stefan.popa@analog.com>
---
 drivers/iio/imu/adis16480.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/imu/adis16480.c b/drivers/iio/imu/adis16480.c
index 150d814..5a2864a 100644
--- a/drivers/iio/imu/adis16480.c
+++ b/drivers/iio/imu/adis16480.c
@@ -124,6 +124,7 @@ struct adis16480_chip_info {
 	unsigned int gyro_max_scale;
 	unsigned int accel_max_val;
 	unsigned int accel_max_scale;
+	unsigned int temp_scale;
 };
 
 enum adis16480_int_pin {
@@ -530,6 +531,7 @@ static int adis16480_read_raw(struct iio_dev *indio_dev,
 	const struct iio_chan_spec *chan, int *val, int *val2, long info)
 {
 	struct adis16480 *st = iio_priv(indio_dev);
+	unsigned int temp;
 
 	switch (info) {
 	case IIO_CHAN_INFO_RAW:
@@ -549,8 +551,13 @@ static int adis16480_read_raw(struct iio_dev *indio_dev,
 			*val2 = 100; /* 0.0001 gauss */
 			return IIO_VAL_INT_PLUS_MICRO;
 		case IIO_TEMP:
-			*val = 5;
-			*val2 = 650000; /* 5.65 milli degree Celsius */
+			/*
+			 * +85 degrees Celsius = temp_max_scale
+			 * +25 degrees Celsius = 0
+			 * LSB, 25 degrees Celsius  = 60 / temp_max_scale
+			 */
+			*val = st->chip_info->temp_scale / 1000;
+			*val2 = (st->chip_info->temp_scale % 1000) * 1000;
 			return IIO_VAL_INT_PLUS_MICRO;
 		case IIO_PRESSURE:
 			*val = 0;
@@ -561,7 +568,8 @@ static int adis16480_read_raw(struct iio_dev *indio_dev,
 		}
 	case IIO_CHAN_INFO_OFFSET:
 		/* Only the temperature channel has a offset */
-		*val = 4425; /* 25 degree Celsius = 0x0000 */
+		temp = 25 * 1000000LL; /* 25 degree Celsius = 0x0000 */
+		*val = DIV_ROUND_CLOSEST_ULL(temp, st->chip_info->temp_scale);
 		return IIO_VAL_INT;
 	case IIO_CHAN_INFO_CALIBBIAS:
 		return adis16480_get_calibbias(indio_dev, chan, val);
@@ -717,6 +725,7 @@ static const struct adis16480_chip_info adis16480_chip_info[] = {
 		.gyro_max_scale = 300,
 		.accel_max_val = IIO_M_S_2_TO_G(21973),
 		.accel_max_scale = 18,
+		.temp_scale = 5650, /* 5.65 milli degree Celsius */
 	},
 	[ADIS16480] = {
 		.channels = adis16480_channels,
@@ -725,6 +734,7 @@ static const struct adis16480_chip_info adis16480_chip_info[] = {
 		.gyro_max_scale = 450,
 		.accel_max_val = IIO_M_S_2_TO_G(12500),
 		.accel_max_scale = 10,
+		.temp_scale = 5650, /* 5.65 milli degree Celsius */
 	},
 	[ADIS16485] = {
 		.channels = adis16485_channels,
@@ -733,6 +743,7 @@ static const struct adis16480_chip_info adis16480_chip_info[] = {
 		.gyro_max_scale = 450,
 		.accel_max_val = IIO_M_S_2_TO_G(20000),
 		.accel_max_scale = 5,
+		.temp_scale = 5650, /* 5.65 milli degree Celsius */
 	},
 	[ADIS16488] = {
 		.channels = adis16480_channels,
@@ -741,6 +752,7 @@ static const struct adis16480_chip_info adis16480_chip_info[] = {
 		.gyro_max_scale = 450,
 		.accel_max_val = IIO_M_S_2_TO_G(22500),
 		.accel_max_scale = 18,
+		.temp_scale = 5650, /* 5.65 milli degree Celsius */
 	},
 };
 
-- 
2.7.4
