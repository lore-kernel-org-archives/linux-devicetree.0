From: Stefan Popa <stefan.popa@analog.com>
Subject: [PATCH v2 4/5] iio: imu: adis16480: Add support for ADIS1649x family of devices
Date: Thu, 21 Feb 2019 15:15:05 +0200
Message-ID: <1550754906-24640-5-git-send-email-stefan.popa@analog.com>
References: <1550754906-24640-1-git-send-email-stefan.popa@analog.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550754906-24640-1-git-send-email-stefan.popa@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jic23@kernel.org, robh+dt@kernel.org
Cc: Stefan Popa <stefan.popa@analog.com>, Michael.Hennerich@analog.com, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The ADIS16495 and ADIS16497 are inertial systems that include a triaxis
gyroscope and a triaxis accelerometer. The serial peripheral interface
(SPI) provide a simple interface for data collection and configuration
control. The devices are similar to ADIS16475, ADIS16480, ADIS16485 and
ADIS16488, the main differences are related to range and scale factors.

The temperature data scale is 0.00565 C/LSB for ADIS16475 and ADIS1648x
devices, while for ADIS1649x 0.0125 C/LSB.

Another difference is that ADIS1649x devices support different gyroscope
measurement ranges which are dependent on the dash number (-1, -2, -3),
see Table 24 in the ADIS16495 datasheet. However, the ADIS16497
gyroscopes have the same scale as ADIS16495.

Furthermore, ADIS16495 devices support the acceleration maximum range of
8g, while ADIS16497 devices go up to 40g.

Datasheets:
Link: https://www.analog.com/media/en/technical-documentation/data-sheets/adis16495.pdf
Link: https://www.analog.com/media/en/technical-documentation/data-sheets/adis16497.pdf

Signed-off-by: Stefan Popa <stefan.popa@analog.com>
---
 drivers/iio/imu/adis16480.c | 72 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/drivers/iio/imu/adis16480.c b/drivers/iio/imu/adis16480.c
index 5a2864a..313936c 100644
--- a/drivers/iio/imu/adis16480.c
+++ b/drivers/iio/imu/adis16480.c
@@ -710,6 +710,12 @@ enum adis16480_variant {
 	ADIS16480,
 	ADIS16485,
 	ADIS16488,
+	ADIS16495_1,
+	ADIS16495_2,
+	ADIS16495_3,
+	ADIS16497_1,
+	ADIS16497_2,
+	ADIS16497_3,
 };
 
 static const struct adis16480_chip_info adis16480_chip_info[] = {
@@ -754,6 +760,60 @@ static const struct adis16480_chip_info adis16480_chip_info[] = {
 		.accel_max_scale = 18,
 		.temp_scale = 5650, /* 5.65 milli degree Celsius */
 	},
+	[ADIS16495_1] = {
+		.channels = adis16485_channels,
+		.num_channels = ARRAY_SIZE(adis16485_channels),
+		.gyro_max_val = IIO_RAD_TO_DEGREE(20000),
+		.gyro_max_scale = 125,
+		.accel_max_val = IIO_M_S_2_TO_G(32000),
+		.accel_max_scale = 8,
+		.temp_scale = 12500, /* 12.5 milli degree Celsius */
+	},
+	[ADIS16495_2] = {
+		.channels = adis16485_channels,
+		.num_channels = ARRAY_SIZE(adis16485_channels),
+		.gyro_max_val = IIO_RAD_TO_DEGREE(18000),
+		.gyro_max_scale = 450,
+		.accel_max_val = IIO_M_S_2_TO_G(32000),
+		.accel_max_scale = 8,
+		.temp_scale = 12500, /* 12.5 milli degree Celsius */
+	},
+	[ADIS16495_3] = {
+		.channels = adis16485_channels,
+		.num_channels = ARRAY_SIZE(adis16485_channels),
+		.gyro_max_val = IIO_RAD_TO_DEGREE(20000),
+		.gyro_max_scale = 2000,
+		.accel_max_val = IIO_M_S_2_TO_G(32000),
+		.accel_max_scale = 8,
+		.temp_scale = 12500, /* 12.5 milli degree Celsius */
+	},
+	[ADIS16497_1] = {
+		.channels = adis16485_channels,
+		.num_channels = ARRAY_SIZE(adis16485_channels),
+		.gyro_max_val = IIO_RAD_TO_DEGREE(20000),
+		.gyro_max_scale = 125,
+		.accel_max_val = IIO_M_S_2_TO_G(32000),
+		.accel_max_scale = 40,
+		.temp_scale = 12500, /* 12.5 milli degree Celsius */
+	},
+	[ADIS16497_2] = {
+		.channels = adis16485_channels,
+		.num_channels = ARRAY_SIZE(adis16485_channels),
+		.gyro_max_val = IIO_RAD_TO_DEGREE(18000),
+		.gyro_max_scale = 450,
+		.accel_max_val = IIO_M_S_2_TO_G(32000),
+		.accel_max_scale = 40,
+		.temp_scale = 12500, /* 12.5 milli degree Celsius */
+	},
+	[ADIS16497_3] = {
+		.channels = adis16485_channels,
+		.num_channels = ARRAY_SIZE(adis16485_channels),
+		.gyro_max_val = IIO_RAD_TO_DEGREE(20000),
+		.gyro_max_scale = 2000,
+		.accel_max_val = IIO_M_S_2_TO_G(32000),
+		.accel_max_scale = 40,
+		.temp_scale = 12500, /* 12.5 milli degree Celsius */
+	},
 };
 
 static const struct iio_info adis16480_info = {
@@ -999,6 +1059,12 @@ static const struct spi_device_id adis16480_ids[] = {
 	{ "adis16480", ADIS16480 },
 	{ "adis16485", ADIS16485 },
 	{ "adis16488", ADIS16488 },
+	{ "adis16495-1", ADIS16495_1 },
+	{ "adis16495-2", ADIS16495_2 },
+	{ "adis16495-3", ADIS16495_3 },
+	{ "adis16497-1", ADIS16497_1 },
+	{ "adis16497-2", ADIS16497_2 },
+	{ "adis16497-3", ADIS16497_3 },
 	{ }
 };
 MODULE_DEVICE_TABLE(spi, adis16480_ids);
@@ -1008,6 +1074,12 @@ static const struct of_device_id adis16480_of_match[] = {
 	{ .compatible = "adi,adis16480" },
 	{ .compatible = "adi,adis16485" },
 	{ .compatible = "adi,adis16488" },
+	{ .compatible = "adi,adis16495-1" },
+	{ .compatible = "adi,adis16495-2" },
+	{ .compatible = "adi,adis16495-3" },
+	{ .compatible = "adi,adis16497-1" },
+	{ .compatible = "adi,adis16497-2" },
+	{ .compatible = "adi,adis16497-3" },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, adis16480_of_match);
-- 
2.7.4
