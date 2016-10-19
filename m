From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH v2 09/10] gpio-sx150x: Pass device type in DT match table
Date: Wed, 19 Oct 2016 07:04:05 -0700
Message-ID: <1476885846-16469-10-git-send-email-andrew.smirnov@gmail.com>
References: <1476885846-16469-1-git-send-email-andrew.smirnov@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1476885846-16469-1-git-send-email-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, cphealy@gmail.com, Andrey Smirnov <andrew.smirnov@gmail.com>
List-Id: devicetree@vger.kernel.org

Pass the same device type information in DT match table as the one being
passed via i2c_device_id

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 drivers/gpio/gpio-sx150x.c | 48 ++++++++++++++++++++++++++++++++--------------
 1 file changed, 34 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-sx150x.c b/drivers/gpio/gpio-sx150x.c
index bfb1ec3..9263d25 100644
--- a/drivers/gpio/gpio-sx150x.c
+++ b/drivers/gpio/gpio-sx150x.c
@@ -97,8 +97,15 @@ struct sx150x_chip {
 	struct mutex                     lock;
 };
 
+enum sx150x_type {
+	SX1508Q = 0,
+	SX1509Q,
+	SX1506Q,
+	SX1502Q,
+};
+
 static const struct sx150x_device_data sx150x_devices[] = {
-	[0] = { /* sx1508q */
+	[SX1508Q] = {
 		.model = SX150X_789,
 		.reg_pullup	= 0x03,
 		.reg_pulldn	= 0x04,
@@ -116,7 +123,7 @@ static const struct sx150x_device_data sx150x_devices[] = {
 		},
 		.ngpios = 8,
 	},
-	[1] = { /* sx1509q */
+	[SX1509Q] = {
 		.model = SX150X_789,
 		.reg_pullup	= 0x07,
 		.reg_pulldn	= 0x09,
@@ -134,7 +141,7 @@ static const struct sx150x_device_data sx150x_devices[] = {
 		},
 		.ngpios	= 16
 	},
-	[2] = { /* sx1506q */
+	[SX1506Q] = {
 		.model = SX150X_456,
 		.reg_pullup	= 0x05,
 		.reg_pulldn	= 0x07,
@@ -154,7 +161,7 @@ static const struct sx150x_device_data sx150x_devices[] = {
 		},
 		.ngpios	= 16
 	},
-	[3] = { /* sx1502q */
+	[SX1502Q] = {
 		.model = SX150X_123,
 		.reg_pullup	= 0x02,
 		.reg_pulldn	= 0x03,
@@ -177,19 +184,19 @@ static const struct sx150x_device_data sx150x_devices[] = {
 };
 
 static const struct i2c_device_id sx150x_id[] = {
-	{"sx1508q", 0},
-	{"sx1509q", 1},
-	{"sx1506q", 2},
-	{"sx1502q", 3},
+	{ "sx1508q", SX1508Q },
+	{ "sx1509q", SX1509Q },
+	{ "sx1506q", SX1506Q },
+	{ "sx1502q", SX1502Q },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, sx150x_id);
 
 static const struct of_device_id sx150x_of_match[] = {
-	{ .compatible = "semtech,sx1508q" },
-	{ .compatible = "semtech,sx1509q" },
-	{ .compatible = "semtech,sx1506q" },
-	{ .compatible = "semtech,sx1502q" },
+	{ .compatible = "semtech,sx1508q", .data = (void *)SX1508Q },
+	{ .compatible = "semtech,sx1509q", .data = (void *)SX1509Q },
+	{ .compatible = "semtech,sx1506q", .data = (void *)SX1506Q },
+	{ .compatible = "semtech,sx1502q", .data = (void *)SX1502Q },
 	{},
 };
 MODULE_DEVICE_TABLE(of, sx150x_of_match);
@@ -680,13 +687,14 @@ static int sx150x_install_irq_chip(struct sx150x_chip *chip)
 }
 
 static int sx150x_probe(struct i2c_client *client,
-				const struct i2c_device_id *id)
+			const struct i2c_device_id *id)
 {
 	static const u32 i2c_funcs = I2C_FUNC_SMBUS_BYTE_DATA |
 				     I2C_FUNC_SMBUS_WRITE_WORD_DATA;
 	struct sx150x_chip *chip;
 	int rc;
 	bool oscio_is_gpo;
+	kernel_ulong_t driver_data;
 
 	if (!i2c_check_functionality(client->adapter, i2c_funcs))
 		return -ENOSYS;
@@ -699,7 +707,19 @@ static int sx150x_probe(struct i2c_client *client,
 	oscio_is_gpo = of_property_read_bool(client->dev.of_node,
 					     "semtech,oscio-is-gpo");
 
-	sx150x_init_chip(chip, client, id->driver_data);
+	if (id) {
+		driver_data = id->driver_data;
+	} else {
+		const struct of_device_id *match;
+
+		match = of_match_device(sx150x_of_match, &client->dev);
+		if (!match)
+			return -ENODEV;
+
+		driver_data = (kernel_ulong_t)match->data;
+	}
+
+	sx150x_init_chip(chip, client, driver_data);
 
 	if (oscio_is_gpo)
 		chip->gpio_chip.ngpio++;
-- 
2.5.5
