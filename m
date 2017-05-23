From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [PATCH v2 2/5] gpio: Add new flags to control sleep status of GPIOs
Date: Tue, 23 May 2017 15:47:29 +0100
Message-ID: <1495550852-3672-2-git-send-email-ckeepax@opensource.wolfsonmicro.com>
References: <1495550852-3672-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1495550852-3672-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-gpio-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, patches@opensource.wolfsonmicro.com, frowand.list@gmail.com, ldewangan@nvidia.com
List-Id: devicetree@vger.kernel.org

Add new flags to allow users to specify that they are not concerned with
the status of GPIOs whilst in a sleep/low power state.

Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Acked-by: Rob Herring <robh@kernel.org>
---

Changes since v1:
 - Added much more core support for the SLEEP_MAY_LOOSE_VALUE flag
 - Moved dt-binding new defines down a few lines

Rob, I carried your Ack since I assume you only care about
the dt-bindings include, which has only had the previous
defines moved down a couple of lines. I hope that is ok.

Thanks,
Charles

 drivers/gpio/gpiolib-of.c       |  3 +++
 drivers/gpio/gpiolib.c          | 12 ++++++++++++
 drivers/gpio/gpiolib.h          |  1 +
 include/dt-bindings/gpio/gpio.h |  4 ++++
 include/linux/gpio/driver.h     |  3 +++
 include/linux/gpio/machine.h    |  2 ++
 include/linux/of_gpio.h         |  1 +
 7 files changed, 26 insertions(+)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index b13b7c7..e2abf0e 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -153,6 +153,9 @@ struct gpio_desc *of_find_gpio(struct device *dev, const char *con_id,
 			*flags |= GPIO_OPEN_SOURCE;
 	}
 
+	if (of_flags & OF_GPIO_SLEEP_MAY_LOOSE_VALUE)
+		*flags |= GPIO_SLEEP_MAY_LOOSE_VALUE;
+
 	return desc;
 }
 
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 5db4413..3cdddf4 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2869,6 +2869,16 @@ bool gpiochip_line_is_open_source(struct gpio_chip *chip, unsigned int offset)
 }
 EXPORT_SYMBOL_GPL(gpiochip_line_is_open_source);
 
+bool gpiochip_line_is_persistent(struct gpio_chip *chip, unsigned int offset)
+{
+	if (offset >= chip->ngpio)
+		return false;
+
+	return !test_bit(FLAG_SLEEP_MAY_LOOSE_VALUE,
+			 &chip->gpiodev->descs[offset].flags);
+}
+EXPORT_SYMBOL_GPL(gpiochip_line_is_persistent);
+
 /**
  * gpiod_get_raw_value_cansleep() - return a gpio's raw value
  * @desc: gpio whose value will be returned
@@ -3223,6 +3233,8 @@ static int gpiod_configure_flags(struct gpio_desc *desc, const char *con_id,
 		set_bit(FLAG_OPEN_DRAIN, &desc->flags);
 	if (lflags & GPIO_OPEN_SOURCE)
 		set_bit(FLAG_OPEN_SOURCE, &desc->flags);
+	if (lflags & GPIO_SLEEP_MAY_LOOSE_VALUE)
+		set_bit(FLAG_SLEEP_MAY_LOOSE_VALUE, &desc->flags);
 
 	/* No particular flag request, return here... */
 	if (!(dflags & GPIOD_FLAGS_BIT_DIR_SET)) {
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 2495b7e..f74b8a7 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -190,6 +190,7 @@ struct gpio_desc {
 #define FLAG_OPEN_SOURCE 8	/* Gpio is open source type */
 #define FLAG_USED_AS_IRQ 9	/* GPIO is connected to an IRQ */
 #define FLAG_IS_HOGGED	11	/* GPIO is hogged */
+#define FLAG_SLEEP_MAY_LOOSE_VALUE 12	/* GPIO may loose value in sleep */
 
 	/* Connection label */
 	const char		*label;
diff --git a/include/dt-bindings/gpio/gpio.h b/include/dt-bindings/gpio/gpio.h
index b4f54da..c507458 100644
--- a/include/dt-bindings/gpio/gpio.h
+++ b/include/dt-bindings/gpio/gpio.h
@@ -28,4 +28,8 @@
 #define GPIO_OPEN_DRAIN (GPIO_SINGLE_ENDED | GPIO_LINE_OPEN_DRAIN)
 #define GPIO_OPEN_SOURCE (GPIO_SINGLE_ENDED | GPIO_LINE_OPEN_SOURCE)
 
+/* Bit 3 express GPIO suspend/resume persistence */
+#define GPIO_SLEEP_MAINTAIN_VALUE 0
+#define GPIO_SLEEP_MAY_LOOSE_VALUE 8
+
 #endif
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 3935828..af20369 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -213,6 +213,9 @@ bool gpiochip_line_is_irq(struct gpio_chip *chip, unsigned int offset);
 bool gpiochip_line_is_open_drain(struct gpio_chip *chip, unsigned int offset);
 bool gpiochip_line_is_open_source(struct gpio_chip *chip, unsigned int offset);
 
+/* Sleep persistence inquiry for drivers */
+bool gpiochip_line_is_persistent(struct gpio_chip *chip, unsigned int offset);
+
 /* get driver data */
 void *gpiochip_get_data(struct gpio_chip *chip);
 
diff --git a/include/linux/gpio/machine.h b/include/linux/gpio/machine.h
index c0d712d..13adadf 100644
--- a/include/linux/gpio/machine.h
+++ b/include/linux/gpio/machine.h
@@ -9,6 +9,8 @@ enum gpio_lookup_flags {
 	GPIO_ACTIVE_LOW = (1 << 0),
 	GPIO_OPEN_DRAIN = (1 << 1),
 	GPIO_OPEN_SOURCE = (1 << 2),
+	GPIO_SLEEP_MAINTAIN_VALUE = (0 << 3),
+	GPIO_SLEEP_MAY_LOOSE_VALUE = (1 << 3),
 };
 
 /**
diff --git a/include/linux/of_gpio.h b/include/linux/of_gpio.h
index 1e089d5..ca10f43 100644
--- a/include/linux/of_gpio.h
+++ b/include/linux/of_gpio.h
@@ -31,6 +31,7 @@ enum of_gpio_flags {
 	OF_GPIO_ACTIVE_LOW = 0x1,
 	OF_GPIO_SINGLE_ENDED = 0x2,
 	OF_GPIO_OPEN_DRAIN = 0x4,
+	OF_GPIO_SLEEP_MAY_LOOSE_VALUE = 0x8,
 };
 
 #ifdef CONFIG_OF_GPIO
-- 
2.1.4

