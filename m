From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Subject: [RFC PATCH] gpio: use "output-active" and "output-inactive" for gpio-hogs
Date: Sun,  4 Jun 2017 12:10:49 +0200
Message-ID: <20170604101049.4592-1-uwe@kleine-koenig.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, Andrey Smirnov <andrew.smirnov@gmail.com>, Nikita Yushchenko <nikita.yoush@cogentembedded.com>
List-Id: devicetree@vger.kernel.org

Using the following gpio hog:

	{
		gpio-hog;
		gpios = <17 GPIO_ACTIVE_LOW>;
		output-high;
	}

results in the gpio to be set to (physically) low value, which is
surprising. So support "output-active" which makes the semantic more
obvious. The old semantic is still supported for backward compatibility.

Signed-off-by: Uwe Kleine-König <uwe@kleine-koenig.org>
---
Hello,

the next logical step would be to go through all in-tree dts files and
substitute the old properties by the new ones. I can do this as soon as
the idea is discussed and considered to be good.

Maybe the same idea can be applied to the cpp definitions GPIOD_OUT_LOW
and GPIOD_OUT_HIGH.

And btw I wondered about the binding that defines what should happen in
this case:

	{
		gpio-hog;
		gpios = <...>;
		output-high;
		output-low;
	}

I would have defined as undefined instead of inactive.

Best regards
Uwe

 Documentation/devicetree/bindings/gpio/gpio.txt | 10 ++++++----
 drivers/gpio/gpiolib-of.c                       |  4 ++++
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentation/devicetree/bindings/gpio/gpio.txt
index 68d28f62a6f4..4d29e0b33435 100644
--- a/Documentation/devicetree/bindings/gpio/gpio.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio.txt
@@ -196,10 +196,12 @@ This means that when multiple properties are present they will be searched
 in the order presented below and the first match is taken as the intended
 configuration.
 - input:      A property specifying to set the GPIO direction as input.
-- output-low  A property specifying to set the GPIO direction as output with
-	      the value low.
-- output-high A property specifying to set the GPIO direction as output with
-	      the value high.
+- output-inactive: A property specifying to set the GPIO direction as output
+	      using the inactive level as value.
+- output-active: A property specifying to set the GPIO direction as output
+	      using the active level as value.
+- output-low  A deprecated alias for "output-inactive".
+- output-high A deprecated alias for "output-active".
 
 Optional properties:
 - line-name:  The GPIO label name. If not present the node name is used.
diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 193f15d50bba..c465511eae8a 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -209,6 +209,10 @@ static struct gpio_desc *of_parse_own_gpio(struct device_node *np,
 
 	if (of_property_read_bool(np, "input"))
 		*dflags |= GPIOD_IN;
+	else if (of_property_read_bool(np, "output-inactive"))
+		*dflags |= GPIOD_OUT_LOW;
+	else if (of_property_read_bool(np, "output-active"))
+		*dflags |= GPIOD_OUT_HIGH;
 	else if (of_property_read_bool(np, "output-low"))
 		*dflags |= GPIOD_OUT_LOW;
 	else if (of_property_read_bool(np, "output-high"))
-- 
2.11.0

