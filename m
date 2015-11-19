From: Cory Tusar <cory.tusar@pid1solutions.com>
Subject: [PATCH v2 5/5] misc: eeprom_93xx46: Add support for a GPIO 'select' line.
Date: Wed, 18 Nov 2015 22:29:41 -0500
Message-ID: <1447903781-3910-6-git-send-email-cory.tusar@pid1solutions.com>
References: <1447903781-3910-1-git-send-email-cory.tusar@pid1solutions.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1447903781-3910-1-git-send-email-cory.tusar@pid1solutions.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, agust@denx.de, gregkh@linuxfoundation.org
Cc: jic23@kernel.org, vz@mleia.com, broonie@kernel.org, afd@ti.com, andrew@lunn.ch, Chris.Healy@zii.aero, Keith.Vennel@zii.aero, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Cory Tusar <cory.tusar@pid1solutions.com>
List-Id: devicetree@vger.kernel.org

This commit adds support to the eeprom_93x46 driver allowing a GPIO line
to function as a 'select' or 'enable' signal prior to accessing the
EEPROM.

Signed-off-by: Cory Tusar <cory.tusar@pid1solutions.com>
---
 drivers/misc/eeprom/eeprom_93xx46.c | 26 ++++++++++++++++++++++++++
 include/linux/eeprom_93xx46.h       |  1 +
 2 files changed, 27 insertions(+)

diff --git a/drivers/misc/eeprom/eeprom_93xx46.c b/drivers/misc/eeprom/eeprom_93xx46.c
index 0386b03..375951f 100644
--- a/drivers/misc/eeprom/eeprom_93xx46.c
+++ b/drivers/misc/eeprom/eeprom_93xx46.c
@@ -10,11 +10,14 @@
 
 #include <linux/delay.h>
 #include <linux/device.h>
+#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
+#include <linux/of_gpio.h>
 #include <linux/slab.h>
 #include <linux/spi/spi.h>
 #include <linux/sysfs.h>
@@ -344,6 +347,20 @@ static ssize_t eeprom_93xx46_store_erase(struct device *dev,
 static DEVICE_ATTR(erase, S_IWUSR, NULL, eeprom_93xx46_store_erase);
 
 #ifdef CONFIG_OF
+static void select_assert(void *context)
+{
+	struct eeprom_93xx46_dev *edev = context;
+
+	gpiod_set_value_cansleep(gpio_to_desc(edev->pdata->select_gpio), 1);
+}
+
+static void select_deassert(void *context)
+{
+	struct eeprom_93xx46_dev *edev = context;
+
+	gpiod_set_value_cansleep(gpio_to_desc(edev->pdata->select_gpio), 0);
+}
+
 static const struct of_device_id eeprom_93xx46_of_table[] = {
 	{ .compatible = "eeprom-93xx46", },
 	{ .compatible = "atmel,at93c46d", .data = &atmel_at93c46d_data, },
@@ -385,6 +402,15 @@ static int eeprom_93xx46_probe_dt(struct spi_device *spi)
 	if (of_property_read_bool(np, "read-only"))
 		pd->flags |= EE_READONLY;
 
+	ret = of_get_named_gpio(np, "select-gpios", 0);
+	if (ret < 0) {
+		pd->select_gpio = -1;
+	} else {
+		pd->select_gpio = ret;
+		pd->prepare = select_assert;
+		pd->finish = select_deassert;
+	}
+
 	if (of_id->data) {
 		const struct eeprom_93xx46_devtype_data *data = of_id->data;
 
diff --git a/include/linux/eeprom_93xx46.h b/include/linux/eeprom_93xx46.h
index 92fa4c3..aa472c7 100644
--- a/include/linux/eeprom_93xx46.h
+++ b/include/linux/eeprom_93xx46.h
@@ -21,4 +21,5 @@ struct eeprom_93xx46_platform_data {
 	 */
 	void (*prepare)(void *);
 	void (*finish)(void *);
+	unsigned int select_gpio;
 };
-- 
2.4.10
