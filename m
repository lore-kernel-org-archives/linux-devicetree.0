From: Zhou Wang <wangzhou.bry@gmail.com>
Subject: [PATCH v4 3/4] gpio: Add find GPIO base in increasing order
Date: Fri,  5 Dec 2014 11:38:41 +0800
Message-ID: <1417750722-14027-4-git-send-email-wangzhou.bry@gmail.com>
References: <1417750722-14027-1-git-send-email-wangzhou.bry@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1417750722-14027-1-git-send-email-wangzhou.bry@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Russell King <linux@arm.linux.org.uk>, Haojian Zhuang <haojian.zhuang@linaro.org>, Wei Xu <xuwei5@hisilicon.com>, Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, liguozhu@hisilicon.com
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, atull@altera.com, sebastian.hesselbarth@gmail.com, bigeasy@linutronix.de, jamie@jamieiles.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, wangzhou1@hisilicon.com, Zhou Wang <wangzhou.bry@gmail.com>
List-Id: devicetree@vger.kernel.org

In function gpiochip_find_base, base number of a GPIO controller
is found in decreasing order. ARCH_NR_GPIOS is used to define from
which number we begin to search for base number of a GPIO controller.

In fact, ARCH_NR_GPIOS brings us some multiplatform problems, like:
http://www.spinics.net/lists/devicetree/msg60433.html

This patch adds the support to find base number of a GPIO controller
in increasing order. It will assign base number from 0.
A new dts property called gpio-number-forward must be add to the related
GPIO dts nodes if you want it works well.

Signed-off-by: Zhou Wang <wangzhou.bry@gmail.com>
---
 drivers/gpio/gpiolib.c |   63 +++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 54 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index e8e98ca..d5e8e13 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -55,6 +55,15 @@ static DEFINE_MUTEX(gpio_lookup_lock);
 static LIST_HEAD(gpio_lookup_list);
 LIST_HEAD(gpio_chips);
 
+/* check find_base_order to find if prior GPIO controller and current GPIO
+ * controller find base number in different orders. Backward is default.
+ */
+static enum {
+	gpio_number_backward,
+	gpio_number_forward,
+	gpio_order_different,
+} find_base_order;
+
 static inline void desc_set_label(struct gpio_desc *d, const char *label)
 {
 	d->label = label;
@@ -107,18 +116,54 @@ struct gpio_chip *gpiod_to_chip(const struct gpio_desc *desc)
 EXPORT_SYMBOL_GPL(gpiod_to_chip);
 
 /* dynamic allocation of GPIOs, e.g. on a hotplugged device */
-static int gpiochip_find_base(int ngpio)
+static int gpiochip_find_base(struct gpio_chip *gpio_chip)
 {
+	int base;
 	struct gpio_chip *chip;
-	int base = ARCH_NR_GPIOS - ngpio;
+	int ngpio = gpio_chip->ngpio;
 
-	list_for_each_entry_reverse(chip, &gpio_chips, list) {
-		/* found a free space? */
-		if (chip->base + chip->ngpio <= base)
-			break;
-		else
+	if (find_base_order == gpio_order_different) {
+		pr_err("%s: stop adding gpio chip\n", __func__);
+		return -EINVAL;
+	}
+
+	if (of_property_read_bool(gpio_chip->dev->of_node,
+	    "gpio-number-forward")) {
+		/* find base in increasing order */
+		base = 0;
+
+		if (!list_empty(&gpio_chips)) {
+			if (find_base_order == gpio_number_backward) {
+				find_base_order = gpio_order_different;
+				pr_err("%s: find base in different order\n",
+					__func__);
+				return -EINVAL;
+			}
+			chip = list_last_entry(&gpio_chips, struct gpio_chip,
+						list);
+			base = chip->base + chip->ngpio;
+		}
+
+		find_base_order = gpio_number_forward;
+	} else {
+		if (find_base_order == gpio_number_forward) {
+			find_base_order = gpio_order_different;
+			pr_err("%s: find base in different order\n", __func__);
+			return -EINVAL;
+		}
+
+		base = ARCH_NR_GPIOS - ngpio;
+
+		list_for_each_entry_reverse(chip, &gpio_chips, list) {
+			/* found a free space? */
+			if (chip->base + chip->ngpio <= base)
+				break;
+			else
 			/* nope, check the space right before the chip */
-			base = chip->base - ngpio;
+				base = chip->base - ngpio;
+		}
+
+		find_base_order = gpio_number_backward;
 	}
 
 	if (gpio_is_valid(base)) {
@@ -236,7 +281,7 @@ int gpiochip_add(struct gpio_chip *chip)
 	spin_lock_irqsave(&gpio_lock, flags);
 
 	if (base < 0) {
-		base = gpiochip_find_base(chip->ngpio);
+		base = gpiochip_find_base(chip);
 		if (base < 0) {
 			status = base;
 			goto unlock;
-- 
1.7.9.5

