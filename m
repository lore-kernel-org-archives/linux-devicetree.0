From: Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCHv2] iio:light:tsl2563: Add DT support
Date: Thu, 24 Oct 2013 16:27:15 +0200
Message-ID: <1382624835-10228-1-git-send-email-sre@debian.org>
References: <1382565063-17083-1-git-send-email-sre@debian.org>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1382565063-17083-1-git-send-email-sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Reichel <sre-GFxCN5SEZAc@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Jonathan Cameron <jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>, Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Bill Pemberton <wfp5p-4Ng6DfrEGID2fBVCVOL8/A@public.gmane.org>, Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add Device Tree support for the TSL2563 driver
and document the binding.

Signed-off-by: Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
---
 .../devicetree/bindings/iio/light/tsl2563.txt         | 19 +++++++++++++++++++
 Documentation/devicetree/bindings/vendor-prefixes.txt |  1 +
 drivers/iio/light/tsl2563.c                           |  4 ++++
 3 files changed, 24 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/light/tsl2563.txt

diff --git a/Documentation/devicetree/bindings/iio/light/tsl2563.txt b/Documentation/devicetree/bindings/iio/light/tsl2563.txt
new file mode 100644
index 0000000..f91e809
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/light/tsl2563.txt
@@ -0,0 +1,19 @@
+* AMS TAOS TSL2563 ambient light sensor
+
+Required properties:
+
+  - compatible : should be "amstaos,tsl2563"
+  - reg : the I2C address of the sensor
+
+Optional properties:
+
+  - amstaos,cover-comp-gain : integer used as multiplier for gain
+                              compensation (default = 1)
+
+Example:
+
+tsl2563@29 {
+	compatible = "amstaos,tsl2563";
+	reg = <0x29>;
+	amstaos,cover-comp-gain = <16>;
+};
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 2cc3dad..d26c834 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -9,6 +9,7 @@ aeroflexgaisler	Aeroflex Gaisler AB
 ak	Asahi Kasei Corp.
 altr	Altera Corp.
 amcc	Applied Micro Circuits Corporation (APM, formally AMCC)
+amstaos	AMS Taos Inc.
 apm	Applied Micro Circuits Corporation (APM)
 arm	ARM Ltd.
 atmel	Atmel Corporation
diff --git a/drivers/iio/light/tsl2563.c b/drivers/iio/light/tsl2563.c
index ebb962c..261660a 100644
--- a/drivers/iio/light/tsl2563.c
+++ b/drivers/iio/light/tsl2563.c
@@ -699,6 +699,7 @@ static int tsl2563_probe(struct i2c_client *client,
 	struct iio_dev *indio_dev;
 	struct tsl2563_chip *chip;
 	struct tsl2563_platform_data *pdata = client->dev.platform_data;
+	struct device_node *np = client->dev.of_node;
 	int err = 0;
 	u8 id = 0;
 
@@ -735,6 +736,9 @@ static int tsl2563_probe(struct i2c_client *client,
 
 	if (pdata)
 		chip->cover_comp_gain = pdata->cover_comp_gain;
+	else if (np)
+		of_property_read_u32_index(np, "amstaos,cover-comp-gain", 0,
+							&chip->cover_comp_gain);
 	else
 		chip->cover_comp_gain = 1;
 
-- 
1.8.4.rc3
