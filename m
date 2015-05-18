From: =?UTF-8?q?Urs=20F=C3=A4ssler?= <urs.fassler@bytesatwork.ch>
Subject: [PATCH] iio: adc128s052: add support for adc122s021
Date: Mon, 18 May 2015 14:04:36 +0200
Message-ID: <1431950676-22379-2-git-send-email-urs.fassler@bytesatwork.ch>
References: <1431950676-22379-1-git-send-email-urs.fassler@bytesatwork.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1431950676-22379-1-git-send-email-urs.fassler@bytesatwork.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: jic23@kernel.org, angelo.compagnucci@gmail.com, urs.fassler@bytesatwork.ch
Cc: iivanov@mm-sol.com, ezequiel.garcia@imgtec.com, jacob.jun.pan@linux.intel.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Urs F=C3=A4ssler <urs.fassler@bytesatwork.ch>
---
 .../devicetree/bindings/iio/adc/ti-adc128s052.txt  |  6 ++---
 drivers/iio/adc/Kconfig                            |  4 ++--
 drivers/iio/adc/ti-adc128s052.c                    | 27 ++++++++++++++=
++++----
 3 files changed, 27 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/ti-adc128s052.tx=
t b/Documentation/devicetree/bindings/iio/adc/ti-adc128s052.txt
index 42ca7de..7cefcf7 100644
--- a/Documentation/devicetree/bindings/iio/adc/ti-adc128s052.txt
+++ b/Documentation/devicetree/bindings/iio/adc/ti-adc128s052.txt
@@ -1,7 +1,7 @@
-* Texas Instruments' ADC128S052 ADC chip
+* Texas Instruments' ADC128S052 and ADC122S021 ADC chip
=20
 Required properties:
- - compatible: Should be "ti,adc128s052"
+ - compatible: Should be "adc128s052" or "adc122s021"
  - reg: spi chip select number for the device
  - vref-supply: The regulator supply for ADC reference voltage
=20
@@ -11,7 +11,7 @@ Recommended properties:
=20
 Example:
 adc@0 {
-	compatible =3D "ti,adc128s052";
+        compatible =3D "adc128s052";
 	reg =3D <0>;
 	vref-supply =3D <&vdd_supply>;
 	spi-max-frequency =3D <1000000>;
diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
index e36a73e..92c319c 100644
--- a/drivers/iio/adc/Kconfig
+++ b/drivers/iio/adc/Kconfig
@@ -285,11 +285,11 @@ config TI_ADC081C
 	  called ti-adc081c.
=20
 config TI_ADC128S052
-	tristate "Texas Instruments ADC128S052"
+	tristate "Texas Instruments ADC128S052/ADC122S021"
 	depends on SPI
 	help
 	  If you say yes here you get support for Texas Instruments ADC128S05=
2
-	  chip.
+	  and ADC122S021 chip.
=20
 	  This driver can also be built as a module. If so, the module will b=
e
 	  called ti-adc128s052.
diff --git a/drivers/iio/adc/ti-adc128s052.c b/drivers/iio/adc/ti-adc12=
8s052.c
index 655cb56..42c7772 100644
--- a/drivers/iio/adc/ti-adc128s052.c
+++ b/drivers/iio/adc/ti-adc128s052.c
@@ -1,7 +1,7 @@
 /*
  * Copyright (C) 2014 Angelo Compagnucci <angelo.compagnucci@gmail.com=
>
  *
- * Driver for Texas Instruments' ADC128S052 ADC chip.
+ * Driver for Texas Instruments' ADC128S052 and ADC122S021 ADC chip.
  * Datasheet can be found here:
  * http://www.ti.com/lit/ds/symlink/adc128s052.pdf
  *
@@ -16,6 +16,11 @@
 #include <linux/iio/iio.h>
 #include <linux/regulator/consumer.h>
=20
+struct adc128_configuration {
+	const struct iio_chan_spec	*channels;
+	u8				num_channels;
+};
+
 struct adc128 {
 	struct spi_device *spi;
=20
@@ -92,7 +97,7 @@ static int adc128_read_raw(struct iio_dev *indio_dev,
 		.info_mask_shared_by_type =3D BIT(IIO_CHAN_INFO_SCALE) \
 	}
=20
-static const struct iio_chan_spec adc128_channels[] =3D {
+static const struct iio_chan_spec adc128s052_channels[] =3D {
 	ADC128_VOLTAGE_CHANNEL(0),
 	ADC128_VOLTAGE_CHANNEL(1),
 	ADC128_VOLTAGE_CHANNEL(2),
@@ -103,6 +108,16 @@ static const struct iio_chan_spec adc128_channels[=
] =3D {
 	ADC128_VOLTAGE_CHANNEL(7),
 };
=20
+static const struct iio_chan_spec adc122s021_channels[] =3D {
+	ADC128_VOLTAGE_CHANNEL(0),
+	ADC128_VOLTAGE_CHANNEL(1),
+};
+
+static const struct adc128_configuration adc128_config[] =3D {
+	{ adc128s052_channels, ARRAY_SIZE(adc128s052_channels) },
+	{ adc122s021_channels, ARRAY_SIZE(adc122s021_channels) },
+};
+
 static const struct iio_info adc128_info =3D {
 	.read_raw =3D adc128_read_raw,
 	.driver_module =3D THIS_MODULE,
@@ -112,6 +127,7 @@ static int adc128_probe(struct spi_device *spi)
 {
 	struct iio_dev *indio_dev;
 	struct adc128 *adc;
+	int config =3D spi_get_device_id(spi)->driver_data;
 	int ret;
=20
 	indio_dev =3D devm_iio_device_alloc(&spi->dev, sizeof(*adc));
@@ -128,8 +144,8 @@ static int adc128_probe(struct spi_device *spi)
 	indio_dev->modes =3D INDIO_DIRECT_MODE;
 	indio_dev->info =3D &adc128_info;
=20
-	indio_dev->channels =3D adc128_channels;
-	indio_dev->num_channels =3D ARRAY_SIZE(adc128_channels);
+	indio_dev->channels =3D adc128_config[config].channels;
+	indio_dev->num_channels =3D adc128_config[config].num_channels;
=20
 	adc->reg =3D devm_regulator_get(&spi->dev, "vref");
 	if (IS_ERR(adc->reg))
@@ -158,7 +174,8 @@ static int adc128_remove(struct spi_device *spi)
 }
=20
 static const struct spi_device_id adc128_id[] =3D {
-	{ "adc128s052", 0},
+	{ "adc128s052", 0},	/* index into adc128_config */
+	{ "adc122s021",	1},
 	{ }
 };
 MODULE_DEVICE_TABLE(spi, adc128_id);
--=20
2.1.4
