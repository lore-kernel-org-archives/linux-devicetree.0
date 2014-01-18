From: Marek Belisko <marek-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>
Subject: [PATCH] iio: gyro: itg3200: Add DT support.
Date: Sat, 18 Jan 2014 22:57:55 +0100
Message-ID: <1390082275-8688-1-git-send-email-marek@goldelico.com>
References: <1389475047-4353-1-git-send-email-marek@goldelico.com>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1389475047-4353-1-git-send-email-marek-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, hns-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org, Marek Belisko <marek-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>, NeilBrown <neilb-l3A5Bk7waGM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: NeilBrown <neilb-l3A5Bk7waGM@public.gmane.org>
Signed-off-by: Marek Belisko <marek-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>
---

V2:
Added entries to i2c/trivial-devices and also add invensense to vendor-prefixes file.

 .../devicetree/bindings/i2c/trivial-devices.txt    |  1 +
 .../devicetree/bindings/iio/gyro/itg3200.txt       | 22 ++++++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.txt        |  1 +
 drivers/iio/gyro/itg3200_core.c                    |  9 +++++++++
 4 files changed, 33 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/gyro/itg3200.txt

diff --git a/Documentation/devicetree/bindings/i2c/trivial-devices.txt b/Documentation/devicetree/bindings/i2c/trivial-devices.txt
index 1a1ac2e..86078de 100644
--- a/Documentation/devicetree/bindings/i2c/trivial-devices.txt
+++ b/Documentation/devicetree/bindings/i2c/trivial-devices.txt
@@ -40,6 +40,7 @@ fsl,sgtl5000		SGTL5000: Ultra Low-Power Audio Codec
 gmt,g751		G751: Digital Temperature Sensor and Thermal Watchdog with Two-Wire Interface
 infineon,slb9635tt	Infineon SLB9635 (Soft-) I2C TPM (old protocol, max 100khz)
 infineon,slb9645tt	Infineon SLB9645 I2C TPM (new protocol, max 400khz)
+invensense,itg3200	InvenSense ITG-3200, Gyroscope
 isl,isl12057		Intersil ISL12057 I2C RTC Chip
 maxim,ds1050		5 Bit Programmable, Pulse-Width Modulator
 maxim,max1237		Low-Power, 4-/12-Channel, 2-Wire Serial, 12-Bit ADCs
diff --git a/Documentation/devicetree/bindings/iio/gyro/itg3200.txt b/Documentation/devicetree/bindings/iio/gyro/itg3200.txt
new file mode 100644
index 0000000..b1b18dc
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/gyro/itg3200.txt
@@ -0,0 +1,22 @@
+* InvenSense ITG-3200 gyroscope
+
+http://www.invensense.com/mems/gyro/itg3200.html
+
+Required properties:
+
+  - compatible : should be "invensense,itg3200"
+  - reg : the I2C address of the sensor
+
+Optional properties:
+
+  - interrupt-parent : should be the phandle for the interrupt controller
+  - interrupts : interrupt mapping for GPIO IRQ
+
+Example:
+
+itg3200@68 {
+	compatible = "invensense,itg3200";
+	reg = <0x68>;
+	interrupt-parent = <&gpio2>;
+	interrupts = <29 IRQ_TYPE_EDGE_RISING>;
+};
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index b2635c5..01bf752 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -44,6 +44,7 @@ ibm	International Business Machines (IBM)
 idt	Integrated Device Technologies, Inc.
 img	Imagination Technologies Ltd.
 intercontrol	Inter Control Group
+invensense InvenSense
 isl	Intersil
 karo	Ka-Ro electronics GmbH
 lg	LG Corporation
diff --git a/drivers/iio/gyro/itg3200_core.c b/drivers/iio/gyro/itg3200_core.c
index 4d3f3b9..adbf20d 100644
--- a/drivers/iio/gyro/itg3200_core.c
+++ b/drivers/iio/gyro/itg3200_core.c
@@ -374,10 +374,19 @@ static const struct i2c_device_id itg3200_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, itg3200_id);
 
+#ifdef CONFIG_OF
+static const struct of_device_id itg3200_of_match[] = {
+	{ .compatible = "invensense,itg3200", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, itg3200_of_match);
+#endif
+
 static struct i2c_driver itg3200_driver = {
 	.driver = {
 		.owner  = THIS_MODULE,
 		.name	= "itg3200",
+		.of_match_table = of_match_ptr(itg3200_of_match),
 	},
 	.id_table	= itg3200_id,
 	.probe		= itg3200_probe,
-- 
1.8.3.2
