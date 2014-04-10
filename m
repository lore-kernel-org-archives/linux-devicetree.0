From: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v2 3/5] pinctrl: sunxi: define A31 R_PIO pin functions
Date: Thu, 10 Apr 2014 14:25:45 +0200
Message-ID: <1397132747-13917-4-git-send-email-boris.brezillon@free-electrons.com>
References: <1397132747-13917-1-git-send-email-boris.brezillon@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1397132747-13917-1-git-send-email-boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, =?UTF-8?q?Emilio=20L=C3=B3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Shuge <shuge-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org>, kevin-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org, Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The A31 SoC provides both PL and PM pio bank through the R_PIO block.

These pins all support gpio function and can bbe assigned to system
peripherals (like TWI, P2WI, JTAG, ...)

Add new compatible string to the DT bindings doc.

Signed-off-by: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 .../bindings/pinctrl/allwinner,sunxi-pinctrl.txt   |  1 +
 drivers/pinctrl/pinctrl-sunxi-pins.h               | 74 ++++++++++++++++++++++
 drivers/pinctrl/pinctrl-sunxi.c                    |  1 +
 3 files changed, 76 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt
index f5da7e3..d8d0656 100644
--- a/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt
@@ -11,6 +11,7 @@ Required properties:
   "allwinner,sun5i-a10s-pinctrl"
   "allwinner,sun5i-a13-pinctrl"
   "allwinner,sun6i-a31-pinctrl"
+  "allwinner,sun6i-a31-r-pinctrl"
   "allwinner,sun7i-a20-pinctrl"
 - reg: Should contain the register physical address and length for the
   pin controller.
diff --git a/drivers/pinctrl/pinctrl-sunxi-pins.h b/drivers/pinctrl/pinctrl-sunxi-pins.h
index 3d60669..51100ca 100644
--- a/drivers/pinctrl/pinctrl-sunxi-pins.h
+++ b/drivers/pinctrl/pinctrl-sunxi-pins.h
@@ -2820,6 +2820,74 @@ static const struct sunxi_desc_pin sun6i_a31_pins[] = {
 		  SUNXI_FUNCTION(0x2, "nand1")),	/* CE3 */
 };
 
+static const struct sunxi_desc_pin sun6i_a31_r_pins[] = {
+	SUNXI_PIN(SUNXI_PINCTRL_PIN_PL0,
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "s_twi"),		/* SCK */
+		  SUNXI_FUNCTION(0x3, "s_p2wi")),	/* SCK */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN_PL1,
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "s_twi"),		/* SDA */
+		  SUNXI_FUNCTION(0x3, "s_p2wi")),	/* SDA */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN_PL2,
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "s_uart")),	/* TX */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN_PL3,
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "s_uart")),	/* RX */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN_PL4,
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "s_ir")),		/* RX */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN_PL5,
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x3, "s_jtag")),	/* MS */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN_PL6,
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x3, "s_jtag")),	/* CK */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN_PL7,
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x3, "s_jtag")),	/* DO */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN_PL8,
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x3, "s_jtag")),	/* DI */
+	/* Hole */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN_PM0,
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out")),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN_PM1,
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out")),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN_PM2,
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x3, "1wire")),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN_PM3,
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out")),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN_PM4,
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out")),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN_PM5,
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out")),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN_PM6,
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out")),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN_PM7,
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x3, "rtc")),		/* CLKO */
+};
+
 static const struct sunxi_desc_pin sun7i_a20_pins[] = {
 	SUNXI_PIN(SUNXI_PINCTRL_PIN_PA0,
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
@@ -3855,6 +3923,12 @@ static const struct sunxi_pinctrl_desc sun6i_a31_pinctrl_data = {
 	.npins = ARRAY_SIZE(sun6i_a31_pins),
 };
 
+static const struct sunxi_pinctrl_desc sun6i_a31_r_pinctrl_data = {
+	.pins = sun6i_a31_r_pins,
+	.npins = ARRAY_SIZE(sun6i_a31_r_pins),
+	.pin_base = PL_BASE,
+};
+
 static const struct sunxi_pinctrl_desc sun7i_a20_pinctrl_data = {
 	.pins = sun7i_a20_pins,
 	.npins = ARRAY_SIZE(sun7i_a20_pins),
diff --git a/drivers/pinctrl/pinctrl-sunxi.c b/drivers/pinctrl/pinctrl-sunxi.c
index 64bcc68..ee62027 100644
--- a/drivers/pinctrl/pinctrl-sunxi.c
+++ b/drivers/pinctrl/pinctrl-sunxi.c
@@ -677,6 +677,7 @@ static struct of_device_id sunxi_pinctrl_match[] = {
 	{ .compatible = "allwinner,sun5i-a10s-pinctrl", .data = (void *)&sun5i_a10s_pinctrl_data },
 	{ .compatible = "allwinner,sun5i-a13-pinctrl", .data = (void *)&sun5i_a13_pinctrl_data },
 	{ .compatible = "allwinner,sun6i-a31-pinctrl", .data = (void *)&sun6i_a31_pinctrl_data },
+	{ .compatible = "allwinner,sun6i-a31-r-pinctrl", .data = (void *)&sun6i_a31_r_pinctrl_data },
 	{ .compatible = "allwinner,sun7i-a20-pinctrl", .data = (void *)&sun7i_a20_pinctrl_data },
 	{}
 };
-- 
1.8.3.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
