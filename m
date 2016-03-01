From: Gregor Boirie <gregor.boirie-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v4 2/3] iio:pressure:ms5611: complete DT support
Date: Tue, 1 Mar 2016 11:31:37 +0100
Message-ID: <6cbaba17e57b0bdc6c3550f49af9161e33438f84.1456828051.git.gregor.boirie@parrot.com>
References: <cover.1456828051.git.gregor.boirie@parrot.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1456828051.git.gregor.boirie-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Tomasz Duszynski <tduszyns-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Baluta <daniel.baluta-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, =?UTF-8?q?Gr=C3=A9gor=20Boirie?= <gregor.boirie-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

=46rom: Gr=C3=A9gor Boirie <gregor.boirie-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>

Add device-tree ID tables and document bindings.

Signed-off-by: Gregor Boirie <gregor.boirie-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>
---
 .../devicetree/bindings/iio/pressure/ms5611.txt       | 19 +++++++++++=
++++++++
 Documentation/devicetree/bindings/vendor-prefixes.txt |  1 +
 drivers/iio/pressure/ms5611_i2c.c                     | 13 +++++++++++=
++
 drivers/iio/pressure/ms5611_spi.c                     | 13 +++++++++++=
++
 4 files changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/pressure/ms56=
11.txt

diff --git a/Documentation/devicetree/bindings/iio/pressure/ms5611.txt =
b/Documentation/devicetree/bindings/iio/pressure/ms5611.txt
new file mode 100644
index 0000000..17bca86
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/pressure/ms5611.txt
@@ -0,0 +1,19 @@
+MEAS ms5611 family pressure sensors
+
+Pressure sensors from MEAS Switzerland with SPI and I2C bus interfaces=
=2E
+
+Required properties:
+- compatible: "meas,ms5611" or "meas,ms5607"
+- reg: the I2C address or SPI chip select the device will respond to
+
+Optional properties:
+- vdd-supply: an optional regulator that needs to be on to provide VDD
+  power to the sensor.
+
+Example:
+
+ms5607@77 {
+	compatible =3D "meas,ms5607";
+	reg =3D <0x77>;
+	vdd-supply =3D <&ldo_3v3_gnss>;
+};
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Do=
cumentation/devicetree/bindings/vendor-prefixes.txt
index 44ddc98..7733f8c 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -136,6 +136,7 @@ lsi	LSI Corp. (LSI Logic)
 lltc	Linear Technology Corporation
 marvell	Marvell Technology Group Ltd.
 maxim	Maxim Integrated Products
+meas	Measurement Specialties
 mediatek	MediaTek Inc.
 melexis	Melexis N.V.
 merrii	Merrii Technology Co., Ltd.
diff --git a/drivers/iio/pressure/ms5611_i2c.c b/drivers/iio/pressure/m=
s5611_i2c.c
index 7f6fc8e..57a8f2c 100644
--- a/drivers/iio/pressure/ms5611_i2c.c
+++ b/drivers/iio/pressure/ms5611_i2c.c
@@ -17,6 +17,7 @@
 #include <linux/delay.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
+#include <linux/of_device.h>
=20
 #include "ms5611.h"
=20
@@ -113,6 +114,17 @@ static int ms5611_i2c_remove(struct i2c_client *cl=
ient)
 	return ms5611_remove(i2c_get_clientdata(client));
 }
=20
+#if defined(CONFIG_OF)
+static const struct of_device_id ms5611_i2c_matches[] =3D {
+	{ .compatible =3D "meas,ms5611" },
+	{ .compatible =3D "ms5611" },
+	{ .compatible =3D "meas,ms5607" },
+	{ .compatible =3D "ms5607" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ms5611_i2c_matches);
+#endif
+
 static const struct i2c_device_id ms5611_id[] =3D {
 	{ "ms5611", MS5611 },
 	{ "ms5607", MS5607 },
@@ -123,6 +135,7 @@ MODULE_DEVICE_TABLE(i2c, ms5611_id);
 static struct i2c_driver ms5611_driver =3D {
 	.driver =3D {
 		.name =3D "ms5611",
+		.of_match_table =3D of_match_ptr(ms5611_i2c_matches)
 	},
 	.id_table =3D ms5611_id,
 	.probe =3D ms5611_i2c_probe,
diff --git a/drivers/iio/pressure/ms5611_spi.c b/drivers/iio/pressure/m=
s5611_spi.c
index 5cc009e..7ec0c64 100644
--- a/drivers/iio/pressure/ms5611_spi.c
+++ b/drivers/iio/pressure/ms5611_spi.c
@@ -12,6 +12,7 @@
 #include <linux/delay.h>
 #include <linux/module.h>
 #include <linux/spi/spi.h>
+#include <linux/of_device.h>
=20
 #include "ms5611.h"
=20
@@ -114,6 +115,17 @@ static int ms5611_spi_remove(struct spi_device *sp=
i)
 	return ms5611_remove(spi_get_drvdata(spi));
 }
=20
+#if defined(CONFIG_OF)
+static const struct of_device_id ms5611_spi_matches[] =3D {
+	{ .compatible =3D "meas,ms5611" },
+	{ .compatible =3D "ms5611" },
+	{ .compatible =3D "meas,ms5607" },
+	{ .compatible =3D "ms5607" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ms5611_spi_matches);
+#endif
+
 static const struct spi_device_id ms5611_id[] =3D {
 	{ "ms5611", MS5611 },
 	{ "ms5607", MS5607 },
@@ -124,6 +136,7 @@ MODULE_DEVICE_TABLE(spi, ms5611_id);
 static struct spi_driver ms5611_driver =3D {
 	.driver =3D {
 		.name =3D "ms5611",
+		.of_match_table =3D of_match_ptr(ms5611_spi_matches)
 	},
 	.id_table =3D ms5611_id,
 	.probe =3D ms5611_spi_probe,
--=20
2.1.4
