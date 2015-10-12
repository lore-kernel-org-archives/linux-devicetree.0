From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH 2/2] gpiolib: Add and use OF_GPIO_SINGLE_ENDED flag
Date: Tue, 13 Oct 2015 00:20:21 +0300
Message-ID: <1444684821-17389-3-git-send-email-laurent.pinchart@ideasonboard.com>
References: <1444684821-17389-1-git-send-email-laurent.pinchart@ideasonboard.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1444684821-17389-1-git-send-email-laurent.pinchart@ideasonboard.com>
Sender: linux-gpio-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The flag matches the DT GPIO_SINGLE_ENDED flag and allows drivers to
parse and use the DT flag to handle single-ended (open-drain or
open-source) GPIOs.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpio/gpiolib.c  | 20 ++++++++++++++++++--
 include/linux/of_gpio.h |  1 +
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index de93fc0a380f..53aa9c80604d 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1709,6 +1709,13 @@ static struct gpio_desc *of_find_gpio(struct device *dev, const char *con_id,
 	if (of_flags & OF_GPIO_ACTIVE_LOW)
 		*flags |= GPIO_ACTIVE_LOW;
 
+	if (of_flags & OF_GPIO_SINGLE_ENDED) {
+		if (of_flags & OF_GPIO_ACTIVE_LOW)
+			*flags |= GPIO_OPEN_DRAIN;
+		else
+			*flags |= GPIO_OPEN_SOURCE;
+	}
+
 	return desc;
 }
 
@@ -2062,6 +2069,7 @@ struct gpio_desc *fwnode_get_named_gpiod(struct fwnode_handle *fwnode,
 {
 	struct gpio_desc *desc = ERR_PTR(-ENODEV);
 	bool active_low = false;
+	bool single_ended = false;
 	int ret;
 
 	if (!fwnode)
@@ -2072,8 +2080,10 @@ struct gpio_desc *fwnode_get_named_gpiod(struct fwnode_handle *fwnode,
 
 		desc = of_get_named_gpiod_flags(to_of_node(fwnode), propname, 0,
 						&flags);
-		if (!IS_ERR(desc))
+		if (!IS_ERR(desc)) {
 			active_low = flags & OF_GPIO_ACTIVE_LOW;
+			single_ended = flags & OF_GPIO_SINGLE_ENDED;
+		}
 	} else if (is_acpi_node(fwnode)) {
 		struct acpi_gpio_info info;
 
@@ -2086,10 +2096,16 @@ struct gpio_desc *fwnode_get_named_gpiod(struct fwnode_handle *fwnode,
 	if (IS_ERR(desc))
 		return desc;
 
-	/* Only value flag can be set from both DT and ACPI is active_low */
 	if (active_low)
 		set_bit(FLAG_ACTIVE_LOW, &desc->flags);
 
+	if (single_ended) {
+		if (active_low)
+			set_bit(FLAG_OPEN_DRAIN, &desc->flags);
+		else
+			set_bit(FLAG_OPEN_SOURCE, &desc->flags);
+	}
+
 	ret = gpiod_request(desc, NULL);
 	if (ret)
 		return ERR_PTR(ret);
diff --git a/include/linux/of_gpio.h b/include/linux/of_gpio.h
index 69dbe312b11b..e8d662a1b6d1 100644
--- a/include/linux/of_gpio.h
+++ b/include/linux/of_gpio.h
@@ -29,6 +29,7 @@ struct device_node;
  */
 enum of_gpio_flags {
 	OF_GPIO_ACTIVE_LOW = 0x1,
+	OF_GPIO_SINGLE_ENDED = 0x2,
 };
 
 #ifdef CONFIG_OF_GPIO
-- 
2.4.9

