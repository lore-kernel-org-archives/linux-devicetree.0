From: NeilBrown <neil@brown.name>
Subject: [PATCH 2/3] TTY: add support for tty_slave devices.
Date: Wed, 18 Mar 2015 16:58:31 +1100
Message-ID: <20150318055831.21025.85317.stgit@notabene.brown>
References: <20150318055437.21025.13990.stgit@notabene.brown>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150318055437.21025.13990.stgit@notabene.brown>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Peter Hurley <peter@hurleysoftware.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sebastian Reichel <sre@kernel.org>, Pavel Machek <pavel@ucw.cz>, Grant Likely <grant.likely@linaro.org>, Jiri Slaby <jslaby@suse.cz>
Cc: GTA04 owners <gta04-owner@goldelico.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

A "tty slave" is a device connected via UART.
Such a device may need its own driver, e.g. for powering
it up on tty open and powering it down on tty release.

tty-slave is a new bus-type which drivers can be written and devices
created.

A "tty slave" device is declared as a child of the uart in
device-tree:

&uart1 {
    bluetooth {
        compatible = "wi2wi,w2cbw003";
        vdd-supply = <&vaux4>;
    };
};

This device will be inserted in the driver-model tree between the uart
and the tty.

The tty-slave driver can replace any of the tty_operations functions
so a call by the tty can be intercepted before being handled by the uart.


Signed-off-by: NeilBrown <neil@brown.name>
---
 drivers/tty/Kconfig                |    1 
 drivers/tty/Makefile               |    1 
 drivers/tty/slave/Kconfig          |    7 ++
 drivers/tty/slave/Makefile         |    2 +
 drivers/tty/slave/tty_slave_core.c |  136 ++++++++++++++++++++++++++++++++++++
 drivers/tty/tty_io.c               |   54 +++++++++++---
 include/linux/tty.h                |    1 
 include/linux/tty_slave.h          |   26 +++++++
 8 files changed, 215 insertions(+), 13 deletions(-)
 create mode 100644 drivers/tty/slave/Kconfig
 create mode 100644 drivers/tty/slave/Makefile
 create mode 100644 drivers/tty/slave/tty_slave_core.c
 create mode 100644 include/linux/tty_slave.h

diff --git a/drivers/tty/Kconfig b/drivers/tty/Kconfig
index b24aa010f68c..f9155a45ee7c 100644
--- a/drivers/tty/Kconfig
+++ b/drivers/tty/Kconfig
@@ -419,4 +419,5 @@ config DA_CONSOLE
 	help
 	  This enables a console on a Dash channel.
 
+source drivers/tty/slave/Kconfig
 endif # TTY
diff --git a/drivers/tty/Makefile b/drivers/tty/Makefile
index 58ad1c05b7f8..ec57846eac29 100644
--- a/drivers/tty/Makefile
+++ b/drivers/tty/Makefile
@@ -31,3 +31,4 @@ obj-$(CONFIG_GOLDFISH_TTY)	+= goldfish.o
 obj-$(CONFIG_DA_TTY)		+= metag_da.o
 
 obj-y += ipwireless/
+obj-y += slave/
diff --git a/drivers/tty/slave/Kconfig b/drivers/tty/slave/Kconfig
new file mode 100644
index 000000000000..3976760c2e28
--- /dev/null
+++ b/drivers/tty/slave/Kconfig
@@ -0,0 +1,7 @@
+menuconfig TTY_SLAVE
+	tristate "TTY slave devices"
+	depends on OF
+	help
+	  Devices which attach via a uart, but need extra
+	  driver support for power management etc.
+
diff --git a/drivers/tty/slave/Makefile b/drivers/tty/slave/Makefile
new file mode 100644
index 000000000000..65669acb392e
--- /dev/null
+++ b/drivers/tty/slave/Makefile
@@ -0,0 +1,2 @@
+
+obj-$(CONFIG_TTY_SLAVE) += tty_slave_core.o
diff --git a/drivers/tty/slave/tty_slave_core.c b/drivers/tty/slave/tty_slave_core.c
new file mode 100644
index 000000000000..6218ea5bb69e
--- /dev/null
+++ b/drivers/tty/slave/tty_slave_core.c
@@ -0,0 +1,136 @@
+/*
+ * tty-slave-core - device bus for tty slaves
+ *
+ * Copyright (C) 2015 NeilBrown <neil@brown.name>
+ *
+ *    This program is free software; you can redistribute it and/or modify
+ *   it under the terms of the GNU General Public License as published by
+ *   the Free Software Foundation; either version 2 of the License, or
+ *   (at your option) any later version.
+ *
+ *    This program is distributed in the hope that it will be useful,
+ *   but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *   GNU General Public License for more details.
+ */
+
+/*
+ * A "tty-slave" is a device permanently attached to a particularly
+ * tty, typically wired to a UART.
+ * A tty-slave has two particular roles.
+ * Firstly it can intercept any tty_operations to provide extra control
+ * of the device.  For example it might intercept "open" and "close"
+ * in order to power the device up and down.  It might intercept
+ * "hangup" to toggle a reset line on the device.
+ *
+ * Secondly it appears as a parent of the tty in the device model, so
+ * that any attributes it presents are visible to udev when the tty
+ * is added.  This allows udev to start appropriate handlers such as
+ * hciattach or inputattach.
+ *
+ * tty-slave devices must be described in devicetree as a child node
+ * of the node which described the parent of the tty, typically a
+ * UART.
+ * If such a child is present, the tty device will not be registered
+ * until the slave device is fully probed and initialized.
+ */
+#include <linux/types.h>
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <linux/errno.h>
+#include <linux/device.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/tty.h>
+#include <linux/tty_driver.h>
+#include <linux/tty_slave.h>
+
+
+static int tty_slave_match(struct device *dev, struct device_driver *drv)
+{
+	return of_driver_match_device(dev, drv);
+}
+
+static void tty_slave_release(struct device *dev)
+{
+	kfree(dev);
+}
+
+struct bus_type tty_slave_bus_type = {
+	.name		= "tty-slave",
+	.match		= tty_slave_match,
+};
+
+int tty_slave_register(struct device *parent, struct device_node *node,
+		       struct device *tty, struct tty_driver *drv)
+{
+	struct tty_slave *slave;
+	int retval;
+
+	if (!of_get_property(node, "compatible", NULL))
+		return -ENODEV;
+
+	slave = kzalloc(sizeof(*slave), GFP_KERNEL);
+	if (!slave)
+		return -ENOMEM;
+
+	slave->dev.bus = &tty_slave_bus_type;
+	slave->dev.parent = parent;
+	slave->dev.release = tty_slave_release;
+	slave->dev.of_node = of_node_get(node);
+	dev_set_name(&slave->dev, "%s", node->name);
+	slave->tty_dev = tty;
+	slave->tty_drv = drv;
+	slave->ops = *drv->ops;
+	retval = device_register(&slave->dev);
+	if (retval) {
+		of_node_put(node);
+		kfree(slave);
+	}
+	return retval;
+}
+EXPORT_SYMBOL(tty_slave_register);
+
+void tty_slave_activate(struct tty_struct *tty)
+{
+	struct device *parent = NULL;
+	if (tty->dev)
+		parent = tty->dev->parent;
+	if (parent &&
+	    parent->bus == &tty_slave_bus_type)
+	{
+		struct tty_slave *dev =
+			container_of(parent, struct tty_slave, dev);
+		tty->ops = &dev->ops;
+	}
+}
+EXPORT_SYMBOL(tty_slave_activate);
+
+int tty_slave_finalize(struct tty_slave *slave)
+{
+	slave->tty_dev->parent = &slave->dev;
+	return tty_register_finalize(slave->tty_drv,
+				     slave->tty_dev);
+}
+EXPORT_SYMBOL(tty_slave_finalize);
+
+int tty_slave_driver_register(struct device_driver *drv)
+{
+	drv->bus = &tty_slave_bus_type;
+	return driver_register(drv);
+}
+EXPORT_SYMBOL(tty_slave_driver_register);
+
+static int __init tty_slave_init(void)
+{
+	return bus_register(&tty_slave_bus_type);
+}
+
+static void __exit tty_slave_exit(void)
+{
+	bus_unregister(&tty_slave_bus_type);
+}
+
+postcore_initcall(tty_slave_init);
+module_exit(tty_slave_exit);
diff --git a/drivers/tty/tty_io.c b/drivers/tty/tty_io.c
index 27632ad17d6f..2b2d3b549a58 100644
--- a/drivers/tty/tty_io.c
+++ b/drivers/tty/tty_io.c
@@ -95,6 +95,8 @@
 #include <linux/seq_file.h>
 #include <linux/serial.h>
 #include <linux/ratelimit.h>
+#include <linux/of.h>
+#include <linux/tty_slave.h>
 
 #include <linux/uaccess.h>
 
@@ -3124,6 +3126,7 @@ struct tty_struct *alloc_tty_struct(struct tty_driver *driver, int idx)
 	tty->index = idx;
 	tty_line_name(driver, idx, tty->name);
 	tty->dev = tty_get_device(tty);
+	tty_slave_activate(tty);
 
 	return tty;
 }
@@ -3205,6 +3208,29 @@ static void tty_device_create_release(struct device *dev)
 	kfree(dev);
 }
 
+int tty_register_finalize(struct tty_driver *driver, struct device *dev)
+{
+	int retval;
+	bool cdev = false;
+	int index = dev->devt - MKDEV(driver->major,
+				      driver->minor_start);
+	printk("REGISTER %d %d 0x%x %d\n", driver->major, driver->minor_start, dev->devt, index);
+	if (!(driver->flags & TTY_DRIVER_DYNAMIC_ALLOC)) {
+		retval = tty_cdev_add(driver,
+				      dev->devt,
+				      index, 1);
+		if (retval)
+			return retval;
+		cdev = true;
+	}
+	retval = device_register(dev);
+	if (retval == 0)
+		return 0;
+	if (cdev)
+		cdev_del(&driver->cdevs[index]);
+	return retval;
+}
+EXPORT_SYMBOL(tty_register_finalize);
 /**
  *	tty_register_device_attr - register a tty device
  *	@driver: the tty driver that describes the tty device
@@ -3234,7 +3260,8 @@ struct device *tty_register_device_attr(struct tty_driver *driver,
 	dev_t devt = MKDEV(driver->major, driver->minor_start) + index;
 	struct device *dev = NULL;
 	int retval = -ENODEV;
-	bool cdev = false;
+	struct device_node *node;
+	bool slave_registered = false;
 
 	if (index >= driver->num) {
 		printk(KERN_ERR "Attempt to register invalid tty line number "
@@ -3247,13 +3274,6 @@ struct device *tty_register_device_attr(struct tty_driver *driver,
 	else
 		tty_line_name(driver, index, name);
 
-	if (!(driver->flags & TTY_DRIVER_DYNAMIC_ALLOC)) {
-		retval = tty_cdev_add(driver, devt, index, 1);
-		if (retval)
-			goto error;
-		cdev = true;
-	}
-
 	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
 	if (!dev) {
 		retval = -ENOMEM;
@@ -3268,16 +3288,24 @@ struct device *tty_register_device_attr(struct tty_driver *driver,
 	dev->groups = attr_grp;
 	dev_set_drvdata(dev, drvdata);
 
-	retval = device_register(dev);
-	if (retval)
-		goto error;
+	if (device && device->of_node)
+		for_each_available_child_of_node(device->of_node, node) {
+			if (tty_slave_register(device, node, dev, driver) == 0)
+				slave_registered = true;
+			if (slave_registered)
+				break;
+		}
+
+	if (!slave_registered) {
+		retval = tty_register_finalize(driver, dev);
+		if (retval)
+			goto error;
+	}
 
 	return dev;
 
 error:
 	put_device(dev);
-	if (cdev)
-		cdev_del(&driver->cdevs[index]);
 	return ERR_PTR(retval);
 }
 EXPORT_SYMBOL_GPL(tty_register_device_attr);
diff --git a/include/linux/tty.h b/include/linux/tty.h
index 04d5f1213700..efb4e053b856 100644
--- a/include/linux/tty.h
+++ b/include/linux/tty.h
@@ -373,6 +373,7 @@ extern void proc_clear_tty(struct task_struct *p);
 extern struct tty_struct *get_current_tty(void);
 /* tty_io.c */
 extern int __init tty_init(void);
+extern int tty_register_finalize(struct tty_driver *driver, struct device *dev);
 #else
 static inline void console_init(void)
 { }
diff --git a/include/linux/tty_slave.h b/include/linux/tty_slave.h
new file mode 100644
index 000000000000..21bfd7c01a2e
--- /dev/null
+++ b/include/linux/tty_slave.h
@@ -0,0 +1,26 @@
+
+struct tty_slave {
+	struct device *tty_dev;
+	struct tty_driver *tty_drv;
+	struct tty_operations ops;
+	struct device dev;
+};
+
+int tty_slave_finalize(struct tty_slave *slave);
+int tty_slave_driver_register(struct device_driver *drv);
+#if config_enabled(CONFIG_TTY_SLAVE)
+void tty_slave_activate(struct tty_struct *tty);
+int tty_slave_register(struct device *parent, struct device_node *node,
+		       struct device *tty, struct tty_driver *drv);
+#else
+static inline void tty_slave_activate(struct tty_struct *tty)
+{
+}
+static inline int tty_slave_register(struct device *parent,
+				     struct device_node *node,
+				     struct device *tty,
+				     struct tty_driver *drv)
+{
+	return -ENODEV;
+}
+#endif
