Return-Path: <SRS0=B8vl=RM=st.com=denis.ciocca@kernel.org>
From: Denis CIOCCA <denis.ciocca@st.com>
Subject: RE: [PATCH 2/2] iio: accel: add support to LIS2DE12
Date: Sat, 9 Mar 2019 01:14:21 +0000
Message-ID: <4e7c32c8a3d74636a6bf5e82d8fa4b72@SFHDAG2NODE1.st.com>
References: <20190305203252.13647-1-rjones@gateworks.com>
 <20190305203252.13647-3-rjones@gateworks.com>
In-Reply-To: <20190305203252.13647-3-rjones@gateworks.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Robert Jones <rjones@gateworks.com>, Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>Peter
List-ID: <devicetree@vger.kernel.org>

Acked-by: Denis Ciocca <denis.ciocca@st.com>

Thanks,
Denis

-----Original Message-----
From: linux-iio-owner@vger.kernel.org <linux-iio-owner@vger.kernel.org> On =
Behalf Of Robert Jones
Sent: Tuesday, March 5, 2019 12:33 PM
To: Jonathan Cameron <jic23@kernel.org>; Rob Herring <robh+dt@kernel.org>; =
Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org; linux-iio@vger.kernel.org; Hartmut Knaack <=
knaack.h@gmx.de>; Lars-Peter Clausen <lars@metafoo.de>; Peter Meerwald-Stad=
ler <pmeerw@pmeerw.net>; Robert Jones <rjones@gateworks.com>
Subject: [PATCH 2/2] iio: accel: add support to LIS2DE12

Add support to STMicroelectronics LIS2DE12 accelerometer in st_accel framew=
ork.

http://www.st.com/resource/en/datasheet/lis2de12.pdf

Signed-off-by: Robert Jones <rjones@gateworks.com>
---
 drivers/iio/accel/Kconfig         |  2 +-
 drivers/iio/accel/st_accel.h      |  2 ++
 drivers/iio/accel/st_accel_core.c | 76 +++++++++++++++++++++++++++++++++++=
++++
 drivers/iio/accel/st_accel_i2c.c  |  5 +++
 4 files changed, 84 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/accel/Kconfig b/drivers/iio/accel/Kconfig index 89=
8839c..ffd0b4d 100644
--- a/drivers/iio/accel/Kconfig
+++ b/drivers/iio/accel/Kconfig
@@ -223,7 +223,7 @@ config IIO_ST_ACCEL_3AXIS
 	  Say yes here to build support for STMicroelectronics accelerometers:
 	  LSM303DLH, LSM303DLHC, LIS3DH, LSM330D, LSM330DL, LSM330DLC,
 	  LIS331DLH, LSM303DL, LSM303DLM, LSM330, LIS2DH12, H3LIS331DL,
-	  LNG2DM, LIS3DE
+	  LNG2DM, LIS3DE, LIS2DE12
=20
 	  This driver can also be built as a module. If so, these modules
 	  will be created:
diff --git a/drivers/iio/accel/st_accel.h b/drivers/iio/accel/st_accel.h in=
dex fd53258..753a5671 100644
--- a/drivers/iio/accel/st_accel.h
+++ b/drivers/iio/accel/st_accel.h
@@ -34,6 +34,7 @@ enum st_accel_type {
 	LIS3LV02DL,
 	LIS2DW12,
 	LIS3DHH,
+	LIS2DE12,
 	ST_ACCEL_MAX,
 };
=20
@@ -57,6 +58,7 @@ enum st_accel_type {
 #define LIS2DW12_ACCEL_DEV_NAME		"lis2dw12"
 #define LIS3DHH_ACCEL_DEV_NAME		"lis3dhh"
 #define LIS3DE_ACCEL_DEV_NAME		"lis3de"
+#define LIS2DE12_ACCEL_DEV_NAME		"lis2de12_accel"
=20
 /**
 * struct st_sensors_platform_data - default accel platform data diff --git=
 a/drivers/iio/accel/st_accel_core.c b/drivers/iio/accel/st_accel_core.c
index 9930edf..aebd611 100644
--- a/drivers/iio/accel/st_accel_core.c
+++ b/drivers/iio/accel/st_accel_core.c
@@ -831,6 +831,82 @@ static const struct st_sensor_settings st_accel_sensor=
s_settings[] =3D {
 		.multi_read_bit =3D false,
 		.bootime =3D 2,
 	},
+	{
+	.wai =3D 0x33,
+	.wai_addr =3D ST_SENSORS_DEFAULT_WAI_ADDRESS,
+	.sensors_supported =3D {
+		[0] =3D LIS2DE12_ACCEL_DEV_NAME,
+	},
+	.ch =3D (struct iio_chan_spec *)st_accel_8bit_channels,
+	.odr =3D {
+		.addr =3D 0x20,
+		.mask =3D 0xf0,
+		.odr_avl =3D {
+			{ .hz =3D 1, .value =3D 0x01, },
+			{ .hz =3D 10, .value =3D 0x02, },
+			{ .hz =3D 25, .value =3D 0x03, },
+			{ .hz =3D 50, .value =3D 0x04, },
+			{ .hz =3D 100, .value =3D 0x05, },
+			{ .hz =3D 200, .value =3D 0x06, },
+			{ .hz =3D 400, .value =3D 0x07, },
+			{ .hz =3D 1600, .value =3D 0x08, },
+			{ .hz =3D 5376, .value =3D 0x09, },
+		},
+	},
+	.pw =3D {
+		.addr =3D 0x20,
+		.mask =3D 0xf0,
+		.value_off =3D ST_SENSORS_DEFAULT_POWER_OFF_VALUE,
+	},
+	.enable_axis =3D {
+		.addr =3D ST_SENSORS_DEFAULT_AXIS_ADDR,
+		.mask =3D ST_SENSORS_DEFAULT_AXIS_MASK,
+	},
+	.fs =3D {
+		.addr =3D 0x23,
+		.mask =3D 0x30,
+		.fs_avl =3D {
+			[0] =3D {
+				.num =3D ST_ACCEL_FS_AVL_2G,
+				.value =3D 0x00,
+				.gain =3D IIO_G_TO_M_S_2(15600),
+			},
+			[1] =3D {
+				.num =3D ST_ACCEL_FS_AVL_4G,
+				.value =3D 0x01,
+				.gain =3D IIO_G_TO_M_S_2(31200),
+			},
+			[2] =3D {
+				.num =3D ST_ACCEL_FS_AVL_8G,
+				.value =3D 0x02,
+				.gain =3D IIO_G_TO_M_S_2(62500),
+			},
+			[3] =3D {
+				.num =3D ST_ACCEL_FS_AVL_16G,
+				.value =3D 0x03,
+				.gain =3D IIO_G_TO_M_S_2(187500),
+			},
+			},
+	},
+	.bdu =3D {
+		.addr =3D 0x23,
+		.mask =3D 0x80,
+	},
+	.drdy_irq =3D {
+		.addr =3D 0x22,
+		.mask_int1 =3D 0x10,
+		.mask_int2 =3D 0x00,
+		.addr_ihl =3D 0x25,
+		.mask_ihl =3D 0x02,
+		.addr_stat_drdy =3D ST_SENSORS_DEFAULT_STAT_ADDR,
+	},
+	.sim =3D {
+		.addr =3D 0x23,
+		.value =3D BIT(0),
+	},
+	.multi_read_bit =3D true,
+	.bootime =3D 2,
+	},
 };
=20
 static int st_accel_read_raw(struct iio_dev *indio_dev, diff --git a/drive=
rs/iio/accel/st_accel_i2c.c b/drivers/iio/accel/st_accel_i2c.c
index de8ae43..cb6eb6f 100644
--- a/drivers/iio/accel/st_accel_i2c.c
+++ b/drivers/iio/accel/st_accel_i2c.c
@@ -102,6 +102,10 @@ static const struct of_device_id st_accel_of_match[] =
=3D {
 		.compatible =3D "st,lis3de",
 		.data =3D LIS3DE_ACCEL_DEV_NAME,
 	},
+	{
+		.compatible =3D "st,lis2de12-accel",
+		.data =3D LIS2DE12_ACCEL_DEV_NAME,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, st_accel_of_match); @@ -140,6 +144,7 @@ static con=
st struct i2c_device_id st_accel_id_table[] =3D {
 	{ LIS3LV02DL_ACCEL_DEV_NAME },
 	{ LIS2DW12_ACCEL_DEV_NAME },
 	{ LIS3DE_ACCEL_DEV_NAME },
+	{ LIS2DE12_ACCEL_DEV_NAME },
 	{},
 };
 MODULE_DEVICE_TABLE(i2c, st_accel_id_table);
--
2.9.2
