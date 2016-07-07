From: Dirk Behme <dirk.behme@de.bosch.com>
Subject: [PATCH RFC] drivers: misc: boardcfg: Export GPIOs from device tree to user space
Date: Thu, 7 Jul 2016 12:30:40 +0200
Message-ID: <1467887440-17737-1-git-send-email-dirk.behme@de.bosch.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Oleksij Rempel <fixed-term.Oleksij.Rempel@de.bosch.com>, Jonas Oester <jonas.oester@de.bosch.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Oleksij Rempel <fixed-term.Oleksij.Rempel@de.bosch.com>

The device tree is the only source of board dependent information in
the system, and thus it is the logical place to list which GPIOs, ADC
channels etc. to use for various functions.  It is straight-forward to
use this information in kernel space and the contents of the device
tree can also be exported to user space.

If user space applications need to use GPIOs, they can do so over the
existing sysfs interface and they could use the device tree
information to find out which GPIO pin to use for a given function,
but unfortunately the numbering of GPIOs exported through sysfs is
totally unrelated to the device tree standard for how references to
GPIO pins are made.  This patch creates a virtual device which is used
to provide symbolic links to GPIO pins in sysfs using logical names
taken from the device tree.

Signed-off-by: Jonas Oester <jonas.oester@de.bosch.com>
Cc: devicetree@vger.kernel.org
Cc: linux-gpio@vger.kernel.org
---
 drivers/misc/Kconfig             |   1 +
 drivers/misc/Makefile            |   1 +
 drivers/misc/boardcfg/Kconfig    |   6 +
 drivers/misc/boardcfg/Makefile   |   1 +
 drivers/misc/boardcfg/boardcfg.c | 315 +++++++++++++++++++++++++++++++++++++++
 5 files changed, 324 insertions(+)
 create mode 100644 drivers/misc/boardcfg/Kconfig
 create mode 100644 drivers/misc/boardcfg/Makefile
 create mode 100644 drivers/misc/boardcfg/boardcfg.c

diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index a216b46..c8657b9 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -804,6 +804,7 @@ config PANEL_BOOT_MESSAGE
 	  An empty message will only clear the display at driver init time. Any other
 	  printf()-formatted message is valid with newline and escape codes.
 
+source "drivers/misc/boardcfg/Kconfig"
 source "drivers/misc/c2port/Kconfig"
 source "drivers/misc/eeprom/Kconfig"
 source "drivers/misc/cb710/Kconfig"
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index b2fb6dbf..b04a2dc 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -12,6 +12,7 @@ obj-$(CONFIG_ATMEL_TCLIB)	+= atmel_tclib.o
 obj-$(CONFIG_BMP085)		+= bmp085.o
 obj-$(CONFIG_BMP085_I2C)	+= bmp085-i2c.o
 obj-$(CONFIG_BMP085_SPI)	+= bmp085-spi.o
+obj-$(CONFIG_BOARDCFG)		+= boardcfg/
 obj-$(CONFIG_DUMMY_IRQ)		+= dummy-irq.o
 obj-$(CONFIG_ICS932S401)	+= ics932s401.o
 obj-$(CONFIG_LKDTM)		+= lkdtm.o
diff --git a/drivers/misc/boardcfg/Kconfig b/drivers/misc/boardcfg/Kconfig
new file mode 100644
index 0000000..f4a748d
--- /dev/null
+++ b/drivers/misc/boardcfg/Kconfig
@@ -0,0 +1,6 @@
+config BOARDCFG
+	tristate "Board configuration export to user space"
+	default m
+	depends on OF
+	help
+	  Support for board configuration in device tree.
diff --git a/drivers/misc/boardcfg/Makefile b/drivers/misc/boardcfg/Makefile
new file mode 100644
index 0000000..7909b9a
--- /dev/null
+++ b/drivers/misc/boardcfg/Makefile
@@ -0,0 +1 @@
+obj-$(CONFIG_BOARDCFG)	+= boardcfg.o
diff --git a/drivers/misc/boardcfg/boardcfg.c b/drivers/misc/boardcfg/boardcfg.c
new file mode 100644
index 0000000..e8e2acf
--- /dev/null
+++ b/drivers/misc/boardcfg/boardcfg.c
@@ -0,0 +1,315 @@
+/*
+ * boardcfg.c
+ *
+ * Copyright (C) Robert Bosch Car Multimedia GmbH Hildesheim 2012
+ * Written by Jonas Oester <jonas.oester@de.bosch.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <linux/cdev.h>
+#include <linux/fs.h>
+#include <linux/device.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/of_platform.h>
+#include <linux/of_gpio.h>
+#include <linux/gpio.h>
+
+#define BOARDCFG_MAX_EXPORTED_GPIOS	64
+
+static struct class *boardcfg_class;
+static struct device *boardcfg_device;
+
+struct boardcfg_gpio {
+	struct device_node *node;
+	int gpio;
+};
+
+static void unexport_one(struct device *dev,
+			 struct boardcfg_gpio *gpio)
+{
+	if (gpio == NULL)
+		return;
+
+	if (gpio->node == NULL)
+		return;
+
+	gpio_unexport(gpio->gpio);
+	gpio_free(gpio->gpio);
+	sysfs_remove_link(&dev->kobj, gpio->node->name);
+	of_node_put(gpio->node);
+	gpio->node = NULL;
+}
+
+struct boardcfg_data {
+	struct mutex lock;
+	struct boardcfg_gpio exported[BOARDCFG_MAX_EXPORTED_GPIOS];
+	int num_gpios;
+};
+
+static int add_one(struct boardcfg_data *data,
+		   struct device_node *node,
+		   int gpio)
+{
+	if (data->num_gpios > BOARDCFG_MAX_EXPORTED_GPIOS - 1) {
+		pr_warn("exceeded maximum number of exported GPIOs\n");
+		return 0;
+	}
+
+	of_node_get(node);
+	data->exported[data->num_gpios].node = node;
+	data->exported[data->num_gpios].gpio = gpio;
+	data->num_gpios++;
+	return 1;
+}
+
+static int remove_one_by_name(struct device *dev,
+			      struct boardcfg_data *data,
+			      char *name)
+{
+	int i, j;
+	int ret = 0;
+
+	mutex_lock(&data->lock);
+	for (i = j = 0; i < data->num_gpios; ++i) {
+		if (strcmp(data->exported[i].node->name, name) == 0) {
+			unexport_one(dev, &data->exported[i]);
+			ret = 1;
+			continue;
+		}
+
+		data->exported[j++] = data->exported[i];
+	}
+
+	data->num_gpios = j;
+	mutex_unlock(&data->lock);
+	return ret;
+}
+
+static struct boardcfg_data private_data;
+
+static const char *gpio_dt_node_path = "/board-configuration/exported-gpios";
+
+static int trigger_exports(struct device *dev,
+			   struct boardcfg_data *bc,
+			   char *export_named)
+{
+	struct device_node *dn;
+	struct device_node *dn_child;
+	struct property *prop;
+
+	dn = of_find_node_by_path(gpio_dt_node_path);
+	if (!dn) {
+		pr_warn("can't find %s node in device tree\n",
+		       gpio_dt_node_path);
+		return -ENOENT;
+	}
+
+	mutex_lock(&bc->lock);
+
+	for_each_child_of_node(dn, dn_child) {
+		int gpio;
+		unsigned int gpio_flags = 0;
+		int err = 0;
+		u32 value;
+
+		if (export_named == NULL) {
+			prop = of_find_property(dn_child, "export-named", NULL);
+			if (prop != NULL)
+				continue;
+		} else if (strcmp(export_named, dn_child->name) != 0)
+			continue;
+
+		gpio = of_get_gpio(dn_child, 0);
+		if (gpio < 0) {
+			pr_warn("of_get_gpio returned %d for %s",
+			       gpio, dn_child->name);
+			continue;
+		}
+
+		prop = of_find_property(dn_child, "input", NULL);
+		if (prop != NULL)
+			gpio_flags |= GPIOF_DIR_IN;
+
+		prop = of_find_property(dn_child, "output", NULL);
+		if (prop != NULL) {
+			if (!(gpio_flags & GPIOF_DIR_IN))
+				gpio_flags |= GPIOF_DIR_OUT;
+			else {
+				pr_warn("Input and output mode for GPIO %s\n",
+					dn_child->name);
+				continue;
+			}
+		}
+
+		err = of_property_read_u32_array(dn_child, "value", &value, 1);
+		if ((err < 0) && !(gpio_flags & GPIOF_DIR_IN)) {
+			pr_warn("No value given for output GPIO %s\n",
+			       dn_child->name);
+			continue;
+		}
+
+		if (!(gpio_flags & GPIOF_DIR_IN))
+			gpio_flags |= value ? GPIOF_INIT_HIGH : GPIOF_INIT_LOW;
+
+		gpio_flags |= GPIOF_EXPORT_DIR_CHANGEABLE;
+		err = gpio_request_one(gpio, gpio_flags, dn_child->name);
+		if (err < 0) {
+			pr_warn("gpio_request_one returned %d for %s (%d)\n",
+			       err, dn_child->name, gpio);
+			continue;
+		}
+
+		err = gpio_export_link(dev, dn_child->name, gpio);
+		if (err < 0) {
+			pr_warn("gpio_export_link returned %d for %s (%d)\n",
+			       err, dn_child->name, gpio);
+			gpio_free(gpio);
+			continue;
+		}
+
+		if (!add_one(bc, dn_child, gpio)) {
+			gpio_unexport(gpio);
+			gpio_free(gpio);
+			sysfs_remove_link(&dev->kobj, dn_child->name);
+		}
+		pr_debug("%s (%d) exported\n", dn_child->name, gpio);
+	}
+
+	mutex_unlock(&bc->lock);
+
+	of_node_put(dn);
+
+	return 0;
+}
+
+static ssize_t export_named_store(struct device *dev,
+			       struct device_attribute *attr,
+			       const char *buf, size_t count)
+{
+	struct boardcfg_data *bc = (struct boardcfg_data *)
+		dev_get_drvdata(boardcfg_device);
+	char sbuf[80];
+
+	if (count > sizeof(sbuf) - 1)
+		return 0;
+
+	/* Copy the string into sbuf and add zero byte, since buf is
+	 * not a zero terminated string
+	 */
+	memcpy(sbuf, buf, count);
+	sbuf[count] = '\0';
+
+	trigger_exports(dev, bc, sbuf);
+
+	return count;
+}
+
+DEVICE_ATTR(export_named, S_IWUSR, NULL, export_named_store);
+
+static ssize_t unexport_named_store(struct device *dev,
+			       struct device_attribute *attr,
+			       const char *buf, size_t count)
+{
+	struct boardcfg_data *bc = (struct boardcfg_data *)
+		dev_get_drvdata(boardcfg_device);
+	char sbuf[80];
+
+	if (count > sizeof(sbuf) - 1)
+		return 0;
+
+	/* Copy the string into sbuf and add zero byte, since buf is
+	 * not a zero terminated string
+	 */
+	memcpy(sbuf, buf, count);
+	sbuf[count] = '\0';
+
+	remove_one_by_name(dev, bc, sbuf);
+
+	return count;
+}
+
+DEVICE_ATTR(unexport_named, S_IWUSR, NULL, unexport_named_store);
+
+static void boardcfg_create_attrs(void)
+{
+	device_create_file(boardcfg_device, &dev_attr_export_named);
+	device_create_file(boardcfg_device, &dev_attr_unexport_named);
+}
+
+static void boardcfg_remove_attrs(void)
+{
+	device_remove_file(boardcfg_device, &dev_attr_export_named);
+	device_remove_file(boardcfg_device, &dev_attr_unexport_named);
+}
+
+static int __init boardcfg_init_module(void)
+{
+	int err = 0;
+
+	boardcfg_class = class_create(THIS_MODULE, "boardcfg");
+	if (IS_ERR(boardcfg_class)) {
+		pr_err("can't create device class\n");
+		err = PTR_ERR(boardcfg_class);
+		goto error;
+	}
+
+	boardcfg_device = device_create(boardcfg_class, NULL, 0, NULL,
+				"boardcfg");
+	if (IS_ERR(boardcfg_device)) {
+		pr_err("can't create device\n");
+		err = PTR_ERR(boardcfg_device);
+		goto error_after_class;
+	}
+
+	memset(&private_data, 0, sizeof(private_data));
+	mutex_init(&private_data.lock);
+
+	dev_set_drvdata(boardcfg_device, &private_data);
+
+	boardcfg_create_attrs();
+
+	trigger_exports(boardcfg_device, &private_data, NULL);
+
+	pr_info("boardcfg_init_module: done\n");
+	return err;
+
+error_after_class:
+	class_destroy(boardcfg_class);
+error:
+	pr_info("boardcfg_init_module returns %d\n", err);
+	return err;
+}
+
+static void boardcfg_exit_module(void)
+{
+	struct boardcfg_data *private_data = (struct boardcfg_data *)
+		dev_get_drvdata(boardcfg_device);
+	int i;
+
+	mutex_lock(&private_data->lock);
+	for (i = 0; i < private_data->num_gpios; ++i)
+		unexport_one(boardcfg_device,
+			     &private_data->exported[i]);
+	mutex_unlock(&private_data->lock);
+
+	boardcfg_remove_attrs();
+	device_destroy(boardcfg_class, 0);
+	class_destroy(boardcfg_class);
+
+	pr_info("boardcfg_exit_module: done\n");
+}
+
+module_init(boardcfg_init_module);
+module_exit(boardcfg_exit_module);
+
+MODULE_AUTHOR("Jonas Oester <jonas.oester@de.bosch.com>");
+MODULE_DESCRIPTION("boardcfg module");
+MODULE_LICENSE("GPL v2");
-- 
1.9.1

