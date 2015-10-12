From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH 1/2] gpiolib: Split GPIO flags parsing and GPIO configuration
Date: Tue, 13 Oct 2015 00:20:20 +0300
Message-ID: <1444684821-17389-2-git-send-email-laurent.pinchart@ideasonboard.com>
References: <1444684821-17389-1-git-send-email-laurent.pinchart@ideasonboard.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1444684821-17389-1-git-send-email-laurent.pinchart@ideasonboard.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

When requesting a GPIO through the legacy or the gpiod_* API the
gpiochip request operation is first called and then the GPIO flags are
parsed and the GPIO is configured. This prevents the gpiochip from
rejecting the request if the flags are not supported by the device.

To fix this split the parse-and-configure operation in two and parse
flags before requesting the GPIO.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpio/gpiolib-legacy.c |  8 +++----
 drivers/gpio/gpiolib.c        | 52 ++++++++++++++++++++++++++++++-------------
 2 files changed, 40 insertions(+), 20 deletions(-)

diff --git a/drivers/gpio/gpiolib-legacy.c b/drivers/gpio/gpiolib-legacy.c
index 8b830996fe02..3a5c7011ad3b 100644
--- a/drivers/gpio/gpiolib-legacy.c
+++ b/drivers/gpio/gpiolib-legacy.c
@@ -28,10 +28,6 @@ int gpio_request_one(unsigned gpio, unsigned long flags, const char *label)
 	if (!desc && gpio_is_valid(gpio))
 		return -EPROBE_DEFER;
 
-	err = gpiod_request(desc, label);
-	if (err)
-		return err;
-
 	if (flags & GPIOF_OPEN_DRAIN)
 		set_bit(FLAG_OPEN_DRAIN, &desc->flags);
 
@@ -41,6 +37,10 @@ int gpio_request_one(unsigned gpio, unsigned long flags, const char *label)
 	if (flags & GPIOF_ACTIVE_LOW)
 		set_bit(FLAG_ACTIVE_LOW, &desc->flags);
 
+	err = gpiod_request(desc, label);
+	if (err)
+		return err;
+
 	if (flags & GPIOF_DIR_IN)
 		err = gpiod_direction_input(desc);
 	else
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index bf4bd1d120c3..de93fc0a380f 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -825,6 +825,14 @@ static int __gpiod_request(struct gpio_desc *desc, const char *label)
 		spin_lock_irqsave(&gpio_lock, flags);
 	}
 done:
+	if (status < 0) {
+		/* Clear flags that might have been set by the caller before
+		 * requesting the GPIO.
+		 */
+		clear_bit(FLAG_ACTIVE_LOW, &desc->flags);
+		clear_bit(FLAG_OPEN_DRAIN, &desc->flags);
+		clear_bit(FLAG_OPEN_SOURCE, &desc->flags);
+	}
 	spin_unlock_irqrestore(&gpio_lock, flags);
 	return status;
 }
@@ -1919,13 +1927,28 @@ struct gpio_desc *__must_check __gpiod_get_optional(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(__gpiod_get_optional);
 
+/**
+ * gpiod_parse_flags - helper function to parse GPIO lookup flags
+ * @desc:	gpio to be setup
+ * @lflags:	gpio_lookup_flags - returned from of_find_gpio() or
+ *		of_get_gpio_hog()
+ *
+ * Set the GPIO descriptor flags based on the given GPIO lookup flags.
+ */
+static void gpiod_parse_flags(struct gpio_desc *desc, unsigned long lflags)
+{
+	if (lflags & GPIO_ACTIVE_LOW)
+		set_bit(FLAG_ACTIVE_LOW, &desc->flags);
+	if (lflags & GPIO_OPEN_DRAIN)
+		set_bit(FLAG_OPEN_DRAIN, &desc->flags);
+	if (lflags & GPIO_OPEN_SOURCE)
+		set_bit(FLAG_OPEN_SOURCE, &desc->flags);
+}
 
 /**
  * gpiod_configure_flags - helper function to configure a given GPIO
  * @desc:	gpio whose value will be assigned
  * @con_id:	function within the GPIO consumer
- * @lflags:	gpio_lookup_flags - returned from of_find_gpio() or
- *		of_get_gpio_hog()
  * @dflags:	gpiod_flags - optional GPIO initialization flags
  *
  * Return 0 on success, -ENOENT if no GPIO has been assigned to the
@@ -1933,17 +1956,10 @@ EXPORT_SYMBOL_GPL(__gpiod_get_optional);
  * occurred while trying to acquire the GPIO.
  */
 static int gpiod_configure_flags(struct gpio_desc *desc, const char *con_id,
-		unsigned long lflags, enum gpiod_flags dflags)
+				 enum gpiod_flags dflags)
 {
 	int status;
 
-	if (lflags & GPIO_ACTIVE_LOW)
-		set_bit(FLAG_ACTIVE_LOW, &desc->flags);
-	if (lflags & GPIO_OPEN_DRAIN)
-		set_bit(FLAG_OPEN_DRAIN, &desc->flags);
-	if (lflags & GPIO_OPEN_SOURCE)
-		set_bit(FLAG_OPEN_SOURCE, &desc->flags);
-
 	/* No particular flag request, return here... */
 	if (!(dflags & GPIOD_FLAGS_BIT_DIR_SET)) {
 		pr_debug("no flags found for %s\n", con_id);
@@ -2010,11 +2026,13 @@ struct gpio_desc *__must_check __gpiod_get_index(struct device *dev,
 		return desc;
 	}
 
+	gpiod_parse_flags(desc, lookupflags);
+
 	status = gpiod_request(desc, con_id);
 	if (status < 0)
 		return ERR_PTR(status);
 
-	status = gpiod_configure_flags(desc, con_id, lookupflags, flags);
+	status = gpiod_configure_flags(desc, con_id, flags);
 	if (status < 0) {
 		dev_dbg(dev, "setup of GPIO %s failed\n", con_id);
 		gpiod_put(desc);
@@ -2068,14 +2086,14 @@ struct gpio_desc *fwnode_get_named_gpiod(struct fwnode_handle *fwnode,
 	if (IS_ERR(desc))
 		return desc;
 
-	ret = gpiod_request(desc, NULL);
-	if (ret)
-		return ERR_PTR(ret);
-
 	/* Only value flag can be set from both DT and ACPI is active_low */
 	if (active_low)
 		set_bit(FLAG_ACTIVE_LOW, &desc->flags);
 
+	ret = gpiod_request(desc, NULL);
+	if (ret)
+		return ERR_PTR(ret);
+
 	return desc;
 }
 EXPORT_SYMBOL_GPL(fwnode_get_named_gpiod);
@@ -2128,6 +2146,8 @@ int gpiod_hog(struct gpio_desc *desc, const char *name,
 	chip = gpiod_to_chip(desc);
 	hwnum = gpio_chip_hwgpio(desc);
 
+	gpiod_parse_flags(desc, lflags);
+
 	local_desc = gpiochip_request_own_desc(chip, hwnum, name);
 	if (IS_ERR(local_desc)) {
 		pr_err("requesting hog GPIO %s (chip %s, offset %d) failed\n",
@@ -2135,7 +2155,7 @@ int gpiod_hog(struct gpio_desc *desc, const char *name,
 		return PTR_ERR(local_desc);
 	}
 
-	status = gpiod_configure_flags(desc, name, lflags, dflags);
+	status = gpiod_configure_flags(desc, name, dflags);
 	if (status < 0) {
 		pr_err("setup of hog GPIO %s (chip %s, offset %d) failed\n",
 		       name, chip->label, hwnum);
-- 
2.4.9
