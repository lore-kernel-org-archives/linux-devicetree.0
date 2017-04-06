From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 1/1] gpio: core: Decouple open drain/source flag with active low/high
Date: Thu, 6 Apr 2017 19:05:52 +0530
Message-ID: <1491485752-28030-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com, robh+dt@kernel.org
Cc: mark.rutland@arm.com, frowand.list@gmail.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: devicetree@vger.kernel.org

Currently, the GPIO interface is said to Open Drain if it is Single
Ended and active LOW. Similarly, it is said as Open Source if it is
Single Ended and active HIGH.

The active HIGH/LOW is used in the interface for setting the pin
state to HIGH or LOW when enabling/disabling the interface.

In Open Drain interface, pin is set to HIGH by putting pin in
high impedance and LOW by driving to the LOW.

In Open Source interface, pin is set to HIGH by driving pin to
HIGH and set to LOW by putting pin in high impedance.

With above, the Open Drain/Source is unrelated to the active LOW/HIGH
in interface. There is interface where the enable/disable of interface
is ether active LOW or HIGH but it is Open Drain type.

Hence decouple the Open Drain with Single Ended + Active LOW and
Open Source with Single Ended + Active HIGH.

Adding different flag for the Open Drain/Open Source which is valid
only when Single ended flag is enabled.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
---
 drivers/gpio/gpiolib-of.c       |  2 +-
 drivers/gpio/gpiolib.c          |  4 +++-
 include/dt-bindings/gpio/gpio.h | 12 ++++++++----
 include/linux/of_gpio.h         |  1 +
 4 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 975b9f6..b13b7c7 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -147,7 +147,7 @@ struct gpio_desc *of_find_gpio(struct device *dev, const char *con_id,
 		*flags |= GPIO_ACTIVE_LOW;
 
 	if (of_flags & OF_GPIO_SINGLE_ENDED) {
-		if (of_flags & OF_GPIO_ACTIVE_LOW)
+		if (of_flags & OF_GPIO_OPEN_DRAIN)
 			*flags |= GPIO_OPEN_DRAIN;
 		else
 			*flags |= GPIO_OPEN_SOURCE;
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 4aa1e78..c22e572 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -3333,6 +3333,7 @@ struct gpio_desc *fwnode_get_named_gpiod(struct fwnode_handle *fwnode,
 	unsigned long lflags = 0;
 	bool active_low = false;
 	bool single_ended = false;
+	bool open_drain = false;
 	int ret;
 
 	if (!fwnode)
@@ -3346,6 +3347,7 @@ struct gpio_desc *fwnode_get_named_gpiod(struct fwnode_handle *fwnode,
 		if (!IS_ERR(desc)) {
 			active_low = flags & OF_GPIO_ACTIVE_LOW;
 			single_ended = flags & OF_GPIO_SINGLE_ENDED;
+			open_drain = flags & OF_GPIO_OPEN_DRAIN;
 		}
 	} else if (is_acpi_node(fwnode)) {
 		struct acpi_gpio_info info;
@@ -3366,7 +3368,7 @@ struct gpio_desc *fwnode_get_named_gpiod(struct fwnode_handle *fwnode,
 		lflags |= GPIO_ACTIVE_LOW;
 
 	if (single_ended) {
-		if (active_low)
+		if (open_drain)
 			lflags |= GPIO_OPEN_DRAIN;
 		else
 			lflags |= GPIO_OPEN_SOURCE;
diff --git a/include/dt-bindings/gpio/gpio.h b/include/dt-bindings/gpio/gpio.h
index c673d2c..b4f54da 100644
--- a/include/dt-bindings/gpio/gpio.h
+++ b/include/dt-bindings/gpio/gpio.h
@@ -17,11 +17,15 @@
 #define GPIO_PUSH_PULL 0
 #define GPIO_SINGLE_ENDED 2
 
+/* Bit 2 express Open drain or open source */
+#define GPIO_LINE_OPEN_SOURCE 0
+#define GPIO_LINE_OPEN_DRAIN 4
+
 /*
- * Open Drain/Collector is the combination of single-ended active low,
- * Open Source/Emitter is the combination of single-ended active high.
+ * Open Drain/Collector is the combination of single-ended open drain interface.
+ * Open Source/Emitter is the combination of single-ended open source interface.
  */
-#define GPIO_OPEN_DRAIN (GPIO_SINGLE_ENDED | GPIO_ACTIVE_LOW)
-#define GPIO_OPEN_SOURCE (GPIO_SINGLE_ENDED | GPIO_ACTIVE_HIGH)
+#define GPIO_OPEN_DRAIN (GPIO_SINGLE_ENDED | GPIO_LINE_OPEN_DRAIN)
+#define GPIO_OPEN_SOURCE (GPIO_SINGLE_ENDED | GPIO_LINE_OPEN_SOURCE)
 
 #endif
diff --git a/include/linux/of_gpio.h b/include/linux/of_gpio.h
index 3f87ea5..1e089d5 100644
--- a/include/linux/of_gpio.h
+++ b/include/linux/of_gpio.h
@@ -30,6 +30,7 @@ struct device_node;
 enum of_gpio_flags {
 	OF_GPIO_ACTIVE_LOW = 0x1,
 	OF_GPIO_SINGLE_ENDED = 0x2,
+	OF_GPIO_OPEN_DRAIN = 0x4,
 };
 
 #ifdef CONFIG_OF_GPIO
-- 
2.1.4

