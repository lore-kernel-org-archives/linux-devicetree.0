From: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Subject: [PATCH 2/3] pinctrl: sx150x: sort chips by part number
Date: Thu, 24 Nov 2016 21:45:19 +0100
Message-ID: <1480020320-28354-3-git-send-email-peda@axentia.se>
References: <1480020320-28354-1-git-send-email-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1480020320-28354-1-git-send-email-peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
---
 .../devicetree/bindings/pinctrl/pinctrl-sx150x.txt |   6 +-
 drivers/pinctrl/pinctrl-sx150x.c                   | 142 ++++++++++-----------
 2 files changed, 74 insertions(+), 74 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-sx150x.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-sx150x.txt
index 25b4ec80c759..83f8d5c449ba 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-sx150x.txt
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-sx150x.txt
@@ -6,11 +6,11 @@ pin controller, GPIO, and interrupt bindings.
 
 Required properties:
 - compatible: should be one of :
+			"semtech,sx1502q",
+			"semtech,sx1503q",
 			"semtech,sx1506q",
 			"semtech,sx1508q",
-			"semtech,sx1509q",
-			"semtech,sx1502q",
-			"semtech,sx1503q".
+			"semtech,sx1509q".
 
 - reg: The I2C slave address for this device.
 
diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-sx150x.c
index a19c814843aa..97df9302e84b 100644
--- a/drivers/pinctrl/pinctrl-sx150x.c
+++ b/drivers/pinctrl/pinctrl-sx150x.c
@@ -148,71 +148,6 @@ static const struct pinctrl_pin_desc sx150x_16_pins[] = {
 	PINCTRL_PIN(16, "oscio"),
 };
 
-static const struct sx150x_device_data sx1508q_device_data = {
-	.model = SX150X_789,
-	.reg_pullup	= 0x03,
-	.reg_pulldn	= 0x04,
-	.reg_dir	= 0x07,
-	.reg_data	= 0x08,
-	.reg_irq_mask	= 0x09,
-	.reg_irq_src	= 0x0c,
-	.reg_sense	= 0x0a,
-	.pri.x789 = {
-		.reg_drain	= 0x05,
-		.reg_polarity	= 0x06,
-		.reg_clock	= 0x0f,
-		.reg_misc	= 0x10,
-		.reg_reset	= 0x7d,
-	},
-	.ngpios = 8,
-	.pins = sx150x_8_pins,
-	.npins = ARRAY_SIZE(sx150x_8_pins),
-};
-
-static const struct sx150x_device_data sx1509q_device_data = {
-	.model = SX150X_789,
-	.reg_pullup	= 0x06,
-	.reg_pulldn	= 0x08,
-	.reg_dir	= 0x0e,
-	.reg_data	= 0x10,
-	.reg_irq_mask	= 0x12,
-	.reg_irq_src	= 0x18,
-	.reg_sense	= 0x14,
-	.pri.x789 = {
-		.reg_drain	= 0x0a,
-		.reg_polarity	= 0x0c,
-		.reg_clock	= 0x1e,
-		.reg_misc	= 0x1f,
-		.reg_reset	= 0x7d,
-	},
-	.ngpios	= 16,
-	.pins = sx150x_16_pins,
-	.npins = ARRAY_SIZE(sx150x_16_pins),
-};
-
-static const struct sx150x_device_data sx1506q_device_data = {
-	.model = SX150X_456,
-	.reg_pullup	= 0x04,
-	.reg_pulldn	= 0x06,
-	.reg_dir	= 0x02,
-	.reg_data	= 0x00,
-	.reg_irq_mask	= 0x08,
-	.reg_irq_src	= 0x0e,
-	.reg_sense	= 0x0a,
-	.pri.x456 = {
-		.reg_pld_mode	= 0x20,
-		.reg_pld_table0	= 0x22,
-		.reg_pld_table1	= 0x24,
-		.reg_pld_table2	= 0x26,
-		.reg_pld_table3	= 0x28,
-		.reg_pld_table4	= 0x2a,
-		.reg_advance	= 0xad,
-	},
-	.ngpios	= 16,
-	.pins = sx150x_16_pins,
-	.npins = 16, /* oscio not available */
-};
-
 static const struct sx150x_device_data sx1502q_device_data = {
 	.model = SX150X_123,
 	.reg_pullup	= 0x02,
@@ -259,6 +194,71 @@ static const struct sx150x_device_data sx1503q_device_data = {
 	.npins  = 16, /* oscio not available */
 };
 
+static const struct sx150x_device_data sx1506q_device_data = {
+	.model = SX150X_456,
+	.reg_pullup	= 0x04,
+	.reg_pulldn	= 0x06,
+	.reg_dir	= 0x02,
+	.reg_data	= 0x00,
+	.reg_irq_mask	= 0x08,
+	.reg_irq_src	= 0x0e,
+	.reg_sense	= 0x0a,
+	.pri.x456 = {
+		.reg_pld_mode	= 0x20,
+		.reg_pld_table0	= 0x22,
+		.reg_pld_table1	= 0x24,
+		.reg_pld_table2	= 0x26,
+		.reg_pld_table3	= 0x28,
+		.reg_pld_table4	= 0x2a,
+		.reg_advance	= 0xad,
+	},
+	.ngpios	= 16,
+	.pins = sx150x_16_pins,
+	.npins = 16, /* oscio not available */
+};
+
+static const struct sx150x_device_data sx1508q_device_data = {
+	.model = SX150X_789,
+	.reg_pullup	= 0x03,
+	.reg_pulldn	= 0x04,
+	.reg_dir	= 0x07,
+	.reg_data	= 0x08,
+	.reg_irq_mask	= 0x09,
+	.reg_irq_src	= 0x0c,
+	.reg_sense	= 0x0a,
+	.pri.x789 = {
+		.reg_drain	= 0x05,
+		.reg_polarity	= 0x06,
+		.reg_clock	= 0x0f,
+		.reg_misc	= 0x10,
+		.reg_reset	= 0x7d,
+	},
+	.ngpios = 8,
+	.pins = sx150x_8_pins,
+	.npins = ARRAY_SIZE(sx150x_8_pins),
+};
+
+static const struct sx150x_device_data sx1509q_device_data = {
+	.model = SX150X_789,
+	.reg_pullup	= 0x06,
+	.reg_pulldn	= 0x08,
+	.reg_dir	= 0x0e,
+	.reg_data	= 0x10,
+	.reg_irq_mask	= 0x12,
+	.reg_irq_src	= 0x18,
+	.reg_sense	= 0x14,
+	.pri.x789 = {
+		.reg_drain	= 0x0a,
+		.reg_polarity	= 0x0c,
+		.reg_clock	= 0x1e,
+		.reg_misc	= 0x1f,
+		.reg_reset	= 0x7d,
+	},
+	.ngpios	= 16,
+	.pins = sx150x_16_pins,
+	.npins = ARRAY_SIZE(sx150x_16_pins),
+};
+
 static int sx150x_pinctrl_get_groups_count(struct pinctrl_dev *pctldev)
 {
 	return 0;
@@ -758,20 +758,20 @@ static const struct pinconf_ops sx150x_pinconf_ops = {
 };
 
 static const struct i2c_device_id sx150x_id[] = {
-	{"sx1508q", (kernel_ulong_t) &sx1508q_device_data },
-	{"sx1509q", (kernel_ulong_t) &sx1509q_device_data },
-	{"sx1506q", (kernel_ulong_t) &sx1506q_device_data },
 	{"sx1502q", (kernel_ulong_t) &sx1502q_device_data },
 	{"sx1503q", (kernel_ulong_t) &sx1503q_device_data },
+	{"sx1506q", (kernel_ulong_t) &sx1506q_device_data },
+	{"sx1508q", (kernel_ulong_t) &sx1508q_device_data },
+	{"sx1509q", (kernel_ulong_t) &sx1509q_device_data },
 	{}
 };
 
 static const struct of_device_id sx150x_of_match[] = {
-	{ .compatible = "semtech,sx1508q", .data = &sx1508q_device_data },
-	{ .compatible = "semtech,sx1509q", .data = &sx1509q_device_data },
-	{ .compatible = "semtech,sx1506q", .data = &sx1506q_device_data },
 	{ .compatible = "semtech,sx1502q", .data = &sx1502q_device_data },
 	{ .compatible = "semtech,sx1503q", .data = &sx1503q_device_data },
+	{ .compatible = "semtech,sx1506q", .data = &sx1506q_device_data },
+	{ .compatible = "semtech,sx1508q", .data = &sx1508q_device_data },
+	{ .compatible = "semtech,sx1509q", .data = &sx1509q_device_data },
 	{},
 };
 
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
