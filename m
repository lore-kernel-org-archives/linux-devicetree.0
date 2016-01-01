From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] gpiolib: always initialize *flags from of_get_named_gpio_flags
Date: Fri, 01 Jan 2016 23:40:46 +0100
Message-ID: <6037371.CvRA1dDj1l@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Alexandre Courbot <gnurou@gmail.com>
List-Id: devicetree@vger.kernel.org

The of_get_named_gpio_flags() function does nothing other than returning
an error when CONFIG_OF_GPIO is disabled, but that causes spurious
warnings about possible use of uninitialized variables in any code that
does not check the of_get_named_gpio_flags() return value before trying
to use the flags:

drivers/input/misc/rotary_encoder.c: In function 'rotary_encoder_probe':
drivers/input/misc/rotary_encoder.c:223:28: warning: 'flags' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/power/bq24735-charger.c: In function 'bq24735_charger_probe':
drivers/power/bq24735-charger.c:227:12: warning: 'flags' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/power/sbs-battery.c: In function 'sbs_probe':
drivers/power/sbs-battery.c:782:17: warning: 'gpio_flags' may be used uninitialized in this function [-Wmaybe-uninitialized]

This changes the behavior of the inline helper to set the flags to zero
when OF_GPIO is disabled, to avoid the warnings. In all cases I've
encountered, we don't actually get to the place that uses the flags
if CONFIG_OF is disabled because we won't enter the DT parser code.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>

diff --git a/include/linux/of_gpio.h b/include/linux/of_gpio.h
index 87d6d1632dd4..bb85a8eeba6a 100644
--- a/include/linux/of_gpio.h
+++ b/include/linux/of_gpio.h
@@ -67,6 +67,9 @@ extern int of_gpio_simple_xlate(struct gpio_chip *gc,
 static inline int of_get_named_gpio_flags(struct device_node *np,
 		const char *list_name, int index, enum of_gpio_flags *flags)
 {
+	if (flags)
+		*flags = 0;
+
 	return -ENOSYS;
 }
 

