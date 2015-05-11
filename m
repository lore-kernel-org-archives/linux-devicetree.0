From: NeilBrown <neil@brown.name>
Subject: [PATCH 3/4] TTY: add support for uart_slave devices.
Date: Mon, 11 May 2015 11:56:14 +1000
Message-ID: <20150511015614.5709.16746.stgit@notabene.brown>
References: <20150511013540.5709.93626.stgit@notabene.brown>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150511013540.5709.93626.stgit@notabene.brown>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Peter Hurley <peter@hurleysoftware.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sebastian Reichel <sre@kernel.org>, Rob Herring <robherring2@gmail.com>, Pavel Machek <pavel@ucw.cz>, Grant Likely <grant.likely@linaro.org>, Jiri Slaby <jslaby@suse.cz>
Cc: GTA04 owners <gta04-owner@goldelico.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

A "uart slave" is a device permanently connected via UART.
Such a device may need its own driver, e.g. for powering
it up on tty open and powering it down on tty release.

When a device is connected to a UART by a 'standard' bus, such as
RS-232, signaling for power control typically uses "DTR".  When the
connection is permanent, as is common on "embedded" boards, separate
signaling may be needed and this requires a separate driver.

uart-slave is a new bus-type which drivers can be written and devices
created.

A "uart slave" device is declared as a child of the uart in
device-tree:

&uart1 {
    bluetooth {
        compatible = "wi2wi,w2cbw003";
        vdd-supply = <&vaux4>;
    };
};

This device will be inserted in the driver-model tree between the uart
and the tty.

The uart-slave driver can replace any of the tty_operations functions
so a call by the tty can be intercepted before being handled by the
uart.

When the tty port is initialized, the uart_slave device is created and
waits for a driver to be bound to it.  Once this happens the tty
device, which was previously initialized, will be added.  This slave
is now considered "finalized".

Any "finalized" slaves will be removed when the tty device is
unregistered.  e.g. by destruct_tty_driver.
While slaves are non-finalized they hold a reference to the tty driver
to prevent destruct_tty_driver from being called, as it cannot find
and free slave devices.

Signed-off-by: NeilBrown <neil@brown.name>
---
 drivers/tty/serial/Kconfig                 |    1 
 drivers/tty/serial/Makefile                |    2 
 drivers/tty/serial/serial_core.c           |    9 +-
 drivers/tty/serial/slave/Kconfig           |    6 +
 drivers/tty/serial/slave/Makefile          |    2 
 drivers/tty/serial/slave/uart_slave_core.c |  168 ++++++++++++++++++++++++++++
 drivers/tty/tty_io.c                       |    3 +
 include/linux/uart_slave.h                 |   29 +++++
 8 files changed, 219 insertions(+), 1 deletion(-)
 create mode 100644 drivers/tty/serial/slave/Kconfig
 create mode 100644 drivers/tty/serial/slave/Makefile
 create mode 100644 drivers/tty/serial/slave/uart_slave_core.c
 create mode 100644 include/linux/uart_slave.h

diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
index f8120c1bde14..2601a8fb41a3 100644
--- a/drivers/tty/serial/Kconfig
+++ b/drivers/tty/serial/Kconfig
@@ -1594,4 +1594,5 @@ endmenu
 config SERIAL_MCTRL_GPIO
 	tristate
 
+source drivers/tty/serial/slave/Kconfig
 endif # TTY
diff --git a/drivers/tty/serial/Makefile b/drivers/tty/serial/Makefile
index c3ac3d930b33..7a6ed85257f6 100644
--- a/drivers/tty/serial/Makefile
+++ b/drivers/tty/serial/Makefile
@@ -96,3 +96,5 @@ obj-$(CONFIG_SERIAL_SPRD) += sprd_serial.o
 
 # GPIOLIB helpers for modem control lines
 obj-$(CONFIG_SERIAL_MCTRL_GPIO)	+= serial_mctrl_gpio.o
+
+obj-y += slave/
diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
index 3ea16f524e89..fcad5b30486f 100644
--- a/drivers/tty/serial/serial_core.c
+++ b/drivers/tty/serial/serial_core.c
@@ -34,6 +34,7 @@
 #include <linux/serial_core.h>
 #include <linux/delay.h>
 #include <linux/mutex.h>
+#include <linux/uart_slave.h>
 
 #include <asm/irq.h>
 #include <asm/uaccess.h>
@@ -2710,10 +2711,16 @@ int uart_add_one_port(struct uart_driver *drv, struct uart_port *uport)
 	 * Register the port whether it's detected or not.  This allows
 	 * setserial to be used to alter this port's parameters.
 	 */
-	tty_dev = tty_port_register_device_attr(port, drv->tty_driver,
+	tty_dev = tty_port_initialize_device_attr(port, drv->tty_driver,
 			uport->line, uport->dev, port, uport->tty_groups);
 	if (likely(!IS_ERR(tty_dev))) {
 		device_set_wakeup_capable(tty_dev, 1);
+		if (uart_slave_register(uport->dev, tty_dev,
+					drv->tty_driver) < 0) {
+			ret = tty_device_add(drv->tty_driver, tty_dev);
+			if (ret)
+				put_device(tty_dev);
+		}
 	} else {
 		dev_err(uport->dev, "Cannot register tty device on line %d\n",
 		       uport->line);
diff --git a/drivers/tty/serial/slave/Kconfig b/drivers/tty/serial/slave/Kconfig
new file mode 100644
index 000000000000..6620e78b763e
--- /dev/null
+++ b/drivers/tty/serial/slave/Kconfig
@@ -0,0 +1,6 @@
+menuconfig UART_SLAVE
+	tristate "UART slave devices"
+	depends on OF
+	help
+	 Devices which attach via a uart, but need extra
+	 driver support for power management etc.
diff --git a/drivers/tty/serial/slave/Makefile b/drivers/tty/serial/slave/Makefile
new file mode 100644
index 000000000000..aac8697fa406
--- /dev/null
+++ b/drivers/tty/serial/slave/Makefile
@@ -0,0 +1,2 @@
+
+obj-$(CONFIG_UART_SLAVE) += uart_slave_core.o
diff --git a/drivers/tty/serial/slave/uart_slave_core.c b/drivers/tty/serial/slave/uart_slave_core.c
new file mode 100644
index 000000000000..d48d672300c2
--- /dev/null
+++ b/drivers/tty/serial/slave/uart_slave_core.c
@@ -0,0 +1,168 @@
+/*
+ * uart slave core - device bus for uart slaves
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
+ * A "uart-slave" is a device permanently attached to a particular
+ * wired to a UART.
+ * A uart-slave has two particular roles.
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
+ * uart-slave devices must be described in devicetree as a child node
+ * of the node which described the attaching UART.
+ *
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
+#include <linux/uart_slave.h>
+
+static int uart_slave_match(struct device *dev, struct device_driver *drv)
+{
+	return of_driver_match_device(dev, drv);
+}
+
+static void uart_slave_release(struct device *dev)
+{
+	struct uart_slave *slave =
+		container_of(dev, struct uart_slave, dev);
+
+	if (!slave->finalized) {
+		put_device(slave->tty_dev);
+		tty_driver_kref_put(slave->tty_drv);
+	}
+	of_node_put(dev->of_node);
+	kfree(slave);
+}
+
+struct bus_type uart_slave_bus_type = {
+	.name		= "uart-slave",
+	.match		= uart_slave_match,
+};
+
+int uart_slave_register(struct device *parent,
+			struct device *tty, struct tty_driver *drv)
+{
+	struct device_node *node, *found = NULL;
+	struct uart_slave *slave;
+	int retval;
+
+	if (!parent || !parent->of_node)
+		return -ENODEV;
+
+	for_each_available_child_of_node(parent->of_node, node) {
+		if (!of_get_property(node, "compatible", NULL))
+			continue;
+		if (found) {
+			dev_err(parent, "Multiple connected children found - non registered");
+			return -ENODEV;
+		}
+		found = node;
+	}
+	if (!found)
+		return -ENODEV;
+
+	slave = kzalloc(sizeof(*slave), GFP_KERNEL);
+	if (!slave)
+		return -ENOMEM;
+
+	slave->dev.bus = &uart_slave_bus_type;
+	slave->dev.parent = parent;
+	slave->dev.release = uart_slave_release;
+	slave->dev.of_node = of_node_get(found);
+	dev_set_name(&slave->dev, "%s", found->name);
+	slave->tty_dev = tty;
+	slave->tty_drv = tty_driver_kref_get(drv);
+	slave->ops = *drv->ops;
+	retval = device_register(&slave->dev);
+	if (retval)
+		put_device(&slave->dev);
+	return retval;
+}
+EXPORT_SYMBOL(uart_slave_register);
+
+void uart_slave_activate(struct tty_struct *tty)
+{
+	struct device *parent = NULL;
+	if (tty->dev)
+		parent = tty->dev->parent;
+	if (parent &&
+	    parent->bus == &uart_slave_bus_type)
+	{
+		struct uart_slave *dev =
+			container_of(parent, struct uart_slave, dev);
+		tty->ops = &dev->ops;
+	}
+}
+EXPORT_SYMBOL(uart_slave_activate);
+
+int uart_slave_add_tty(struct uart_slave *slave)
+{
+	int retval;
+	if (slave->finalized)
+		return -EBUSY;
+	slave->tty_dev->parent = &slave->dev;
+	retval = tty_device_add(slave->tty_drv,
+				slave->tty_dev);
+	/* If that succeeded, the tty now holds a reference to
+	 * the slave through ->parent, so that ref we hold
+	 * can be dropped, as can our ref on the tty driver.
+	 */
+	slave->finalized = true;
+	tty_driver_kref_put(slave->tty_drv);
+	put_device(&slave->dev);
+	return retval;
+}
+EXPORT_SYMBOL(uart_slave_add_tty);
+
+int uart_slave_driver_register(struct device_driver *drv)
+{
+	drv->bus = &uart_slave_bus_type;
+	return driver_register(drv);
+}
+EXPORT_SYMBOL(uart_slave_driver_register);
+
+static int __init uart_slave_init(void)
+{
+	return bus_register(&uart_slave_bus_type);
+}
+
+static void __exit uart_slave_exit(void)
+{
+	bus_unregister(&uart_slave_bus_type);
+}
+
+postcore_initcall(uart_slave_init);
+module_exit(uart_slave_exit);
+MODULE_AUTHOR("NeilBrown <neil@brown.name>");
+MODULE_DESCRIPTION("UART-slave core support.");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/tty/tty_io.c b/drivers/tty/tty_io.c
index 83ca25b9c2da..2bf516f99dd2 100644
--- a/drivers/tty/tty_io.c
+++ b/drivers/tty/tty_io.c
@@ -95,6 +95,7 @@
 #include <linux/seq_file.h>
 #include <linux/serial.h>
 #include <linux/ratelimit.h>
+#include <linux/uart_slave.h>
 
 #include <linux/uaccess.h>
 
@@ -1531,6 +1532,8 @@ struct tty_struct *tty_init_dev(struct tty_driver *driver, int idx)
 	if (retval < 0)
 		goto err_deinit_tty;
 
+	uart_slave_activate(tty);
+
 	if (!tty->port)
 		tty->port = driver->ports[idx];
 
diff --git a/include/linux/uart_slave.h b/include/linux/uart_slave.h
new file mode 100644
index 000000000000..9a19825ce47a
--- /dev/null
+++ b/include/linux/uart_slave.h
@@ -0,0 +1,29 @@
+#ifndef _LINUX_UART_SLAVE_H
+#define _LINUX_UART_SLAVE_H
+struct uart_slave {
+	struct device *tty_dev;
+	struct tty_driver *tty_drv;
+	struct tty_operations ops;
+	struct device dev;
+	bool finalized;
+};
+
+int uart_slave_add_tty(struct uart_slave *slave);
+int uart_slave_driver_register(struct device_driver *drv);
+#if IS_ENABLED(CONFIG_UART_SLAVE)
+void uart_slave_activate(struct tty_struct *tty);
+int uart_slave_register(struct device *parent,
+			struct device *tty, struct tty_driver *drv);
+#else
+static inline void uart_slave_activate(struct tty_struct *tty)
+{
+}
+static inline int uart_slave_register(struct device *parent,
+				     struct device *tty,
+				     struct tty_driver *drv)
+{
+	return -ENODEV;
+}
+#endif
+
+#endif /* _LINUX_UART_SLAVE_H */
