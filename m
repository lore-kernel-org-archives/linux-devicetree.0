From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v2 4/5] gpio: add core support for pull-up/pull-down configuration
Date: Thu,  7 Feb 2019 17:28:58 +0100
Message-ID: <20190207162859.26252-5-thomas.petazzoni@bootlin.com>
References: <20190207162859.26252-1-thomas.petazzoni@bootlin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190207162859.26252-1-thomas.petazzoni@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-Id: devicetree@vger.kernel.org

This commit adds support for configuring the pull-up and pull-down
resistors available in some GPIO controllers. While configuring
pull-up/pull-down is already possible through the pinctrl subsystem,
some GPIO controllers, especially simple ones such as GPIO expanders
on I2C, don't have any pinmuxing capability and therefore do not use
the pinctrl subsystem.

This commit implements the GPIO_PULL_UP and GPIO_PULL_DOWN flags,
which can be used from the Device Tree, to enable a pull-up or
pull-down resistor on a given GPIO.

The flag is simply propagated all the way to the core GPIO subsystem,
where it is used to call the gpio_chip ->set_config callback with the
appropriate existing PIN_CONFIG_BIAS_* values.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 drivers/gpio/gpiolib-of.c    |  5 +++++
 drivers/gpio/gpiolib.c       | 18 ++++++++++++++++++
 drivers/gpio/gpiolib.h       |  2 ++
 include/linux/gpio/machine.h |  2 ++
 include/linux/of_gpio.h      |  2 ++
 5 files changed, 29 insertions(+)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index a6e1891217e2..9a8b78477f79 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -345,6 +345,11 @@ struct gpio_desc *of_find_gpio(struct device *dev, const char *con_id,
 	if (of_flags & OF_GPIO_TRANSITORY)
 		*flags |= GPIO_TRANSITORY;
 
+	if (of_flags & OF_GPIO_PULL_UP)
+		*flags |= GPIO_PULL_UP;
+	if (of_flags & OF_GPIO_PULL_DOWN)
+		*flags |= GPIO_PULL_DOWN;
+
 	return desc;
 }
 
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 9762a836fec9..9be4c9401172 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2610,6 +2610,13 @@ int gpiod_direction_input(struct gpio_desc *desc)
 	if (status == 0)
 		clear_bit(FLAG_IS_OUT, &desc->flags);
 
+	if (test_bit(FLAG_PULL_UP, &desc->flags))
+		gpio_set_config(chip, gpio_chip_hwgpio(desc),
+				PIN_CONFIG_BIAS_PULL_UP);
+	else if (test_bit(FLAG_PULL_DOWN, &desc->flags))
+		gpio_set_config(chip, gpio_chip_hwgpio(desc),
+				PIN_CONFIG_BIAS_PULL_DOWN);
+
 	trace_gpio_direction(desc_to_gpio(desc), 1, status);
 
 	return status;
@@ -4087,6 +4094,17 @@ int gpiod_configure_flags(struct gpio_desc *desc, const char *con_id,
 	if (lflags & GPIO_OPEN_SOURCE)
 		set_bit(FLAG_OPEN_SOURCE, &desc->flags);
 
+	if ((lflags & GPIO_PULL_UP) && (lflags & GPIO_PULL_DOWN)) {
+		gpiod_err(desc,
+			  "both pull-up and pull-down enabled, invalid configuration\n");
+		return -EINVAL;
+	}
+
+	if (lflags & GPIO_PULL_UP)
+		set_bit(FLAG_PULL_UP, &desc->flags);
+	else if (lflags & GPIO_PULL_DOWN)
+		set_bit(FLAG_PULL_DOWN, &desc->flags);
+
 	status = gpiod_set_transitory(desc, (lflags & GPIO_TRANSITORY));
 	if (status < 0)
 		return status;
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index bc57f0dc5953..078ab17b96bf 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -219,6 +219,8 @@ struct gpio_desc {
 #define FLAG_IRQ_IS_ENABLED 10	/* GPIO is connected to an enabled IRQ */
 #define FLAG_IS_HOGGED	11	/* GPIO is hogged */
 #define FLAG_TRANSITORY 12	/* GPIO may lose value in sleep or reset */
+#define FLAG_PULL_UP    13	/* GPIO has pull up enabled */
+#define FLAG_PULL_DOWN  14	/* GPIO has pull down enabled */
 
 	/* Connection label */
 	const char		*label;
diff --git a/include/linux/gpio/machine.h b/include/linux/gpio/machine.h
index daa44eac9241..69673be10213 100644
--- a/include/linux/gpio/machine.h
+++ b/include/linux/gpio/machine.h
@@ -12,6 +12,8 @@ enum gpio_lookup_flags {
 	GPIO_OPEN_SOURCE = (1 << 2),
 	GPIO_PERSISTENT = (0 << 3),
 	GPIO_TRANSITORY = (1 << 3),
+	GPIO_PULL_UP = (1 << 4),
+	GPIO_PULL_DOWN = (1 << 5),
 };
 
 /**
diff --git a/include/linux/of_gpio.h b/include/linux/of_gpio.h
index 163b79ecd01a..f9737dea9d1f 100644
--- a/include/linux/of_gpio.h
+++ b/include/linux/of_gpio.h
@@ -28,6 +28,8 @@ enum of_gpio_flags {
 	OF_GPIO_SINGLE_ENDED = 0x2,
 	OF_GPIO_OPEN_DRAIN = 0x4,
 	OF_GPIO_TRANSITORY = 0x8,
+	OF_GPIO_PULL_UP = 0x10,
+	OF_GPIO_PULL_DOWN = 0x20,
 };
 
 #ifdef CONFIG_OF_GPIO
-- 
2.20.1
