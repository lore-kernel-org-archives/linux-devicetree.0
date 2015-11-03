From: <atull@opensource.altera.com>
Subject: [PATCH v13 4/6] fpga: add fpga bridge framework
Date: Tue, 3 Nov 2015 11:11:02 -0600
Message-ID: <1446570664-10293-5-git-send-email-atull@opensource.altera.com>
References: <1446570664-10293-1-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1446570664-10293-1-git-send-email-atull@opensource.altera.com>
Sender: linux-doc-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Moritz Fischer <moritz.fischer@ettus.com>, Josh Cartwright <joshc@ni.com>, gregkh@linuxfoundation.org, monstr@monstr.eu, michal.simek@xilinx.com, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, pantelis.antoniou@konsulko.com, delicious.quinoa@gmail.com, dinguyen@opensource.altera.com, Alan Tull <atull@opensource.altera.com>
List-Id: devicetree@vger.kernel.org

From: Alan Tull <atull@opensource.altera.com>

This framework adds API functions for enabling/
disabling FPGA bridges under kernel control.

This allows the Linux kernel to disable FPGA bridges
during FPGA reprogramming and to enable FPGA bridges
when FPGA reprogramming is done.  This framework is
be manufacturer-agnostic, allowing it to be used in
interfaces that use the FPGA Manager Framework to
reprogram FPGAs.

The functions are:
* of_fpga_bridge_get
* fpga_bridge_put
   Get/put a reference to a FPGA bridge.

* fpga_bridge_enable
* fpga_bridge_disable
   Enable/Disable traffic through a bridge.

* fpga_bridge_register
* fpga_bridge_unregister
   Register/unregister a device-specific low level FPGA
   Bridge driver.

Signed-off-by: Alan Tull <atull@opensource.altera.com>
---
v2:  Minor cleanup
v12: Bump version to line up with simple fpga bus
     Remove sysfs
     Improve get/put functions, get the low level driver too.
     Clean up class implementation
     Add kernel doc documentation
     Rename (un)register_fpga_bridge -> fpga_bridge_(un)register
v13: Add inlined empty functions for if not CONFIG_FPGA_BRIDGE
     Clean up debugging
     Remove unneeded #include in .h
     Remove unnecessary prints
     Remove 'label' DT binding.
     Document the mutex
---
 drivers/fpga/Kconfig             |   7 ++
 drivers/fpga/Makefile            |   3 +
 drivers/fpga/fpga-bridge.c       | 229 +++++++++++++++++++++++++++++++++++++++
 include/linux/fpga/fpga-bridge.h |  74 +++++++++++++
 4 files changed, 313 insertions(+)
 create mode 100644 drivers/fpga/fpga-bridge.c
 create mode 100644 include/linux/fpga/fpga-bridge.h

diff --git a/drivers/fpga/Kconfig b/drivers/fpga/Kconfig
index 5fcf60a..6383b47 100644
--- a/drivers/fpga/Kconfig
+++ b/drivers/fpga/Kconfig
@@ -31,6 +31,13 @@ config FPGA_MGR_ZYNQ_FPGA
 	help
 	  FPGA manager driver support for Xilinx Zynq FPGAs.
 
+config FPGA_BRIDGE
+       bool "FPGA Bridge Drivers"
+       depends on OF
+       help
+         Say Y here if you want to support bridges connected between host
+	 processors and FPGAs or between FPGAs.
+
 endif # FPGA
 
 endmenu
diff --git a/drivers/fpga/Makefile b/drivers/fpga/Makefile
index 9b55ae0..5e9e0e1 100644
--- a/drivers/fpga/Makefile
+++ b/drivers/fpga/Makefile
@@ -9,5 +9,8 @@ obj-$(CONFIG_FPGA)			+= fpga-mgr.o
 obj-$(CONFIG_FPGA_MGR_SOCFPGA)		+= socfpga.o
 obj-$(CONFIG_FPGA_MGR_ZYNQ_FPGA)	+= zynq-fpga.o
 
+# FPGA Bridge Drivers
+obj-$(CONFIG_FPGA_BRIDGE)		+= fpga-bridge.o
+
 # High Level Interfaces
 obj-$(CONFIG_SIMPLE_FPGA_BUS)		+= simple-fpga-bus.o
diff --git a/drivers/fpga/fpga-bridge.c b/drivers/fpga/fpga-bridge.c
new file mode 100644
index 0000000..14cdb7f
--- /dev/null
+++ b/drivers/fpga/fpga-bridge.c
@@ -0,0 +1,229 @@
+/*
+ * fpga bridge driver
+ *
+ *  Copyright (C) 2013-2015 Altera Corporation, All Rights Reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+#include <linux/fpga/fpga-bridge.h>
+#include <linux/idr.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/slab.h>
+
+static DEFINE_IDA(fpga_bridge_ida);
+static struct class *fpga_bridge_class;
+
+/**
+ * fpga_bridge_enable
+ * @bridge: fpga bridge
+ *
+ * Enable transactions on the bridge
+ *
+ * Return: 0 for success, error code otherwise.
+ */
+int fpga_bridge_enable(struct fpga_bridge *bridge)
+{
+	return bridge->br_ops->enable_set(bridge, 1);
+}
+EXPORT_SYMBOL_GPL(fpga_bridge_enable);
+
+/**
+ * fpga_bridge_disable
+ * @bridge: fpga bridge
+ *
+ * Disable transactions on the bridge
+ *
+ * Return: 0 for success, error code otherwise.
+ */
+int fpga_bridge_disable(struct fpga_bridge *bridge)
+{
+	return bridge->br_ops->enable_set(bridge, 0);
+}
+EXPORT_SYMBOL_GPL(fpga_bridge_disable);
+
+static int fpga_bridge_of_node_match(struct device *dev, const void *data)
+{
+	return dev->of_node == data;
+}
+
+/**
+ * of_fpga_bridge_get - get an exclusive reference to a fpga bridge
+ * @node: device node
+ *
+ * Given a device node, get an exclusive reference to a fpga bridge.
+ *
+ * Returns a fpga manager struct or IS_ERR() condition containing errno.
+ */
+struct fpga_bridge *of_fpga_bridge_get(struct device_node *node)
+{
+	struct device *dev;
+	struct fpga_bridge *bridge;
+	int ret = -ENODEV;
+
+	dev = class_find_device(fpga_bridge_class, NULL, node,
+				fpga_bridge_of_node_match);
+	if (!dev)
+		return ERR_PTR(-ENODEV);
+
+	bridge = to_fpga_bridge(dev);
+	if (!bridge)
+		goto err_dev;
+
+	if (!mutex_trylock(&bridge->mutex)) {
+		ret = -EBUSY;
+		goto err_dev;
+	}
+
+	if (!try_module_get(dev->parent->driver->owner))
+		goto err_ll_mod;
+
+	return bridge;
+
+err_ll_mod:
+	mutex_unlock(&bridge->mutex);
+err_dev:
+	put_device(dev);
+	return ERR_PTR(ret);
+}
+EXPORT_SYMBOL_GPL(of_fpga_bridge_get);
+
+/**
+ * fpga_bridge_put - release a reference to a fpga bridge
+ * @bridge: fpga bridge
+ */
+void fpga_bridge_put(struct fpga_bridge *bridge)
+{
+	module_put(bridge->dev.parent->driver->owner);
+	mutex_unlock(&bridge->mutex);
+	put_device(&bridge->dev);
+}
+EXPORT_SYMBOL_GPL(fpga_bridge_put);
+
+/**
+ * fpga_bridge_register - register a fpga bridge driver
+ * @dev:	fpga bridge device from pdev
+ * @name:	fpga bridge name
+ * @br_ops:	pointer to structure of fpga bridge ops
+ * @priv:	fpga bridge private data
+ *
+ * Return: 0 on success, negative error code otherwise.
+ */
+int fpga_bridge_register(struct device *dev, const char *name,
+			 struct fpga_bridge_ops *br_ops, void *priv)
+{
+	struct fpga_bridge *bridge;
+	int id, ret = 0;
+
+	if (!br_ops || !br_ops->enable_set || !br_ops->enable_show) {
+		dev_err(dev, "Attempt to register without fpga_bridge_ops\n");
+		return -EINVAL;
+	}
+
+	if (!name || !strlen(name)) {
+		dev_err(dev, "Attempt to register with no name!\n");
+		return -EINVAL;
+	}
+
+	bridge = kzalloc(sizeof(*bridge), GFP_KERNEL);
+	if (!bridge)
+		return -ENOMEM;
+
+	id = ida_simple_get(&fpga_bridge_ida, 0, 0, GFP_KERNEL);
+	if (id < 0) {
+		ret = id;
+		goto error_kfree;
+	}
+
+	mutex_init(&bridge->mutex);
+
+	bridge->name = name;
+	bridge->br_ops = br_ops;
+	bridge->priv = priv;
+
+	device_initialize(&bridge->dev);
+	bridge->dev.class = fpga_bridge_class;
+	bridge->dev.parent = dev;
+	bridge->dev.of_node = dev->of_node;
+	bridge->dev.id = id;
+	dev_set_drvdata(dev, bridge);
+
+	ret = dev_set_name(&bridge->dev, "br%d", id);
+	if (ret)
+		goto error_device;
+
+	ret = device_add(&bridge->dev);
+	if (ret)
+		goto error_device;
+
+	dev_info(bridge->dev.parent, "fpga bridge [%s] registered\n",
+		 bridge->name);
+
+	return 0;
+
+error_device:
+	ida_simple_remove(&fpga_bridge_ida, id);
+error_kfree:
+	kfree(bridge);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(fpga_bridge_register);
+
+void fpga_bridge_unregister(struct device *dev)
+{
+	struct fpga_bridge *bridge = dev_get_drvdata(dev);
+
+	/*
+	 * If the low level driver provides a method for putting bridge into
+	 * a desired state upon unregister, do it.
+	 */
+	if (bridge->br_ops->fpga_bridge_remove)
+		bridge->br_ops->fpga_bridge_remove(bridge);
+
+	device_unregister(&bridge->dev);
+}
+EXPORT_SYMBOL_GPL(fpga_bridge_unregister);
+
+static void fpga_bridge_dev_release(struct device *dev)
+{
+	struct fpga_bridge *bridge = to_fpga_bridge(dev);
+
+	ida_simple_remove(&fpga_bridge_ida, bridge->dev.id);
+	kfree(bridge);
+}
+
+static int __init fpga_bridge_dev_init(void)
+{
+	fpga_bridge_class = class_create(THIS_MODULE, "fpga_bridge");
+	if (IS_ERR(fpga_bridge_class))
+		return PTR_ERR(fpga_bridge_class);
+
+	fpga_bridge_class->dev_release = fpga_bridge_dev_release;
+
+	return 0;
+}
+
+static void __exit fpga_bridge_dev_exit(void)
+{
+	class_destroy(fpga_bridge_class);
+	ida_destroy(&fpga_bridge_ida);
+}
+
+MODULE_DESCRIPTION("FPGA Bridge Driver");
+MODULE_AUTHOR("Alan Tull <atull@opensource.altera.com>");
+MODULE_LICENSE("GPL v2");
+
+subsys_initcall(fpga_bridge_dev_init);
+module_exit(fpga_bridge_dev_exit);
diff --git a/include/linux/fpga/fpga-bridge.h b/include/linux/fpga/fpga-bridge.h
new file mode 100644
index 0000000..d6da725
--- /dev/null
+++ b/include/linux/fpga/fpga-bridge.h
@@ -0,0 +1,74 @@
+#include <linux/device.h>
+#include <linux/platform_device.h>
+
+#ifndef _LINUX_FPGA_BRIDGE_H
+#define _LINUX_FPGA_BRIDGE_H
+
+struct fpga_bridge;
+
+/**
+ * struct fpga_bridge_ops - ops for low level fpga bridge drivers
+ * @enable_show: returns the FPGA bridge's status
+ * @enable_set: set a FPGA bridge as enabled or disabled
+ * @fpga_bridge_remove: set FPGA into a specific state during driver remove
+ */
+struct fpga_bridge_ops {
+	int (*enable_show)(struct fpga_bridge *bridge);
+	int (*enable_set)(struct fpga_bridge *bridge, bool enable);
+	void (*fpga_bridge_remove)(struct fpga_bridge *bridge);
+};
+
+/**
+ * struct fpga_bridge - fpga bridge structure
+ * @name: name of low level fpga bridge
+ * @dev: fpga bridge device
+ * @mutex: enforces exclusive reference to bridge
+ * @br_ops: pointer to struct of fpga bridge ops
+ * @priv: low level driver private date
+ */
+struct fpga_bridge {
+	const char *name;
+	struct device dev;
+	struct mutex mutex; /* for exclusive reference to bridge */
+	struct fpga_bridge_ops *br_ops;
+	void *priv;
+};
+
+#define to_fpga_bridge(d) container_of(d, struct fpga_bridge, dev)
+
+#if defined(CONFIG_FPGA_BRIDGE)
+
+struct fpga_bridge *of_fpga_bridge_get(struct device_node *node);
+void fpga_bridge_put(struct fpga_bridge *bridge);
+
+int fpga_bridge_enable(struct fpga_bridge *bridge);
+int fpga_bridge_disable(struct fpga_bridge *bridge);
+
+#else
+
+inline struct fpga_bridge *of_fpga_bridge_get(struct device_node *node)
+{
+	return 0;
+}
+
+inline void fpga_bridge_put(struct fpga_bridge *bridge)
+{
+}
+
+inline int fpga_bridge_enable(struct fpga_bridge *bridge)
+{
+	return 0;
+}
+
+inline int fpga_bridge_disable(struct fpga_bridge *bridge)
+{
+	return 0;
+}
+
+#endif /* CONFIG_FPGA_BRIDGE */
+
+int fpga_bridge_register(struct device *dev, const char *name,
+			 struct fpga_bridge_ops *br_ops, void *priv);
+void fpga_bridge_unregister(struct device *dev);
+
+#endif /* _LINUX_FPGA_BRIDGE_H */
-- 
1.9.1

