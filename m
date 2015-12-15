From: Peter Rosin <peda@lysator.liu.se>
Subject: [PATCH] gpio: sx150x: Add support for sx1502
Date: Tue, 15 Dec 2015 23:01:34 +0100
Message-ID: <1450216894-19390-1-git-send-email-peda@lysator.liu.se>
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Peter Rosin <peda@axentia.se>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Wei Chen <Wei.Chen@csr.com>, Barry Song <Baohua.Song@csr.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin <peda@lysator.liu.se>
List-Id: devicetree@vger.kernel.org

From: Peter Rosin <peda@axentia.se>

Signed-off-by: Peter Rosin <peda@axentia.se>
---
 .../devicetree/bindings/gpio/gpio-sx150x.txt       |  3 +-
 drivers/gpio/gpio-sx150x.c                         | 53 ++++++++++++++++++++--
 2 files changed, 51 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-sx150x.txt b/Documentation/devicetree/bindings/gpio/gpio-sx150x.txt
index ba2bb84eeac3..c809acb9c71b 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-sx150x.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-sx150x.txt
@@ -5,7 +5,8 @@ Required properties:
 
 - compatible: should be "semtech,sx1506q",
 			"semtech,sx1508q",
-			"semtech,sx1509q".
+			"semtech,sx1509q",
+			"semtech,sx1502q".
 
 - reg: The I2C slave address for this device.
 
diff --git a/drivers/gpio/gpio-sx150x.c b/drivers/gpio/gpio-sx150x.c
index 76f920173a2f..0a3105cde82d 100644
--- a/drivers/gpio/gpio-sx150x.c
+++ b/drivers/gpio/gpio-sx150x.c
@@ -32,8 +32,19 @@
 #define NO_UPDATE_PENDING	-1
 
 /* The chip models of sx150x */
-#define SX150X_456 0
-#define SX150X_789 1
+#define SX150X_123 0
+#define SX150X_456 1
+#define SX150X_789 2
+
+struct sx150x_123_pri {
+	u8 reg_pld_mode;
+	u8 reg_pld_table0;
+	u8 reg_pld_table1;
+	u8 reg_pld_table2;
+	u8 reg_pld_table3;
+	u8 reg_pld_table4;
+	u8 reg_advance;
+};
 
 struct sx150x_456_pri {
 	u8 reg_pld_mode;
@@ -65,6 +76,7 @@ struct sx150x_device_data {
 	u8 reg_sense;
 	u8 ngpios;
 	union {
+		struct sx150x_123_pri x123;
 		struct sx150x_456_pri x456;
 		struct sx150x_789_pri x789;
 	} pri;
@@ -142,12 +154,33 @@ static const struct sx150x_device_data sx150x_devices[] = {
 		},
 		.ngpios	= 16
 	},
+	[3] = { /* sx1502q */
+		.model = SX150X_123,
+		.reg_pullup	= 0x02,
+		.reg_pulldn	= 0x03,
+		.reg_dir	= 0x01,
+		.reg_data	= 0x00,
+		.reg_irq_mask	= 0x05,
+		.reg_irq_src	= 0x08,
+		.reg_sense	= 0x07,
+		.pri.x123 = {
+			.reg_pld_mode	= 0x10,
+			.reg_pld_table0	= 0x11,
+			.reg_pld_table1	= 0x12,
+			.reg_pld_table2	= 0x13,
+			.reg_pld_table3	= 0x14,
+			.reg_pld_table4	= 0x15,
+			.reg_advance	= 0xad,
+		},
+		.ngpios	= 8,
+	},
 };
 
 static const struct i2c_device_id sx150x_id[] = {
 	{"sx1508q", 0},
 	{"sx1509q", 1},
 	{"sx1506q", 2},
+	{"sx1502q", 3},
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, sx150x_id);
@@ -156,6 +189,7 @@ static const struct of_device_id sx150x_of_match[] = {
 	{ .compatible = "semtech,sx1508q" },
 	{ .compatible = "semtech,sx1509q" },
 	{ .compatible = "semtech,sx1506q" },
+	{ .compatible = "semtech,sx1502q" },
 	{},
 };
 MODULE_DEVICE_TABLE(of, sx150x_of_match);
@@ -545,10 +579,14 @@ static int sx150x_init_hw(struct sx150x_chip *chip,
 		err = sx150x_i2c_write(chip->client,
 				chip->dev_cfg->pri.x789.reg_misc,
 				0x01);
-	else
+	else if (chip->dev_cfg->model == SX150X_456)
 		err = sx150x_i2c_write(chip->client,
 				chip->dev_cfg->pri.x456.reg_advance,
 				0x04);
+	else
+		err = sx150x_i2c_write(chip->client,
+				chip->dev_cfg->pri.x123.reg_advance,
+				0x00);
 	if (err < 0)
 		return err;
 
@@ -574,13 +612,20 @@ static int sx150x_init_hw(struct sx150x_chip *chip,
 				pdata->io_polarity);
 		if (err < 0)
 			return err;
-	} else {
+	} else if (chip->dev_cfg->model == SX150X_456) {
 		/* Set all pins to work in normal mode */
 		err = sx150x_init_io(chip,
 				chip->dev_cfg->pri.x456.reg_pld_mode,
 				0);
 		if (err < 0)
 			return err;
+	} else {
+		/* Set all pins to work in normal mode */
+		err = sx150x_init_io(chip,
+				chip->dev_cfg->pri.x123.reg_pld_mode,
+				0);
+		if (err < 0)
+			return err;
 	}
 
 
-- 
2.1.4

