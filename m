From: <atull@opensource.altera.com>
Subject: [PATCH v16 5/6] fpga: fpga-region: device tree control for FPGA
Date: Fri, 5 Feb 2016 15:30:02 -0600
Message-ID: <1454707803-27947-6-git-send-email-atull@opensource.altera.com>
References: <1454707803-27947-1-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1454707803-27947-1-git-send-email-atull@opensource.altera.com>
Sender: linux-doc-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, pantelis.antoniou@konsulko.com
Cc: Moritz Fischer <moritz.fischer@ettus.com>, Josh Cartwright <joshc@ni.com>, gregkh@linuxfoundation.org, monstr@monstr.eu, michal.simek@xilinx.com, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, delicious.quinoa@gmail.com, dinguyen@opensource.altera.com, Alan Tull <atull@opensource.altera.com>
List-Id: devicetree@vger.kernel.org

From: Alan Tull <atull@opensource.altera.com>

FPGA Regions support programming FPGA under control of the Device
Tree.

Signed-off-by: Alan Tull <atull@opensource.altera.com>
---
v9:  initial version (this patch added during rest of patchset's v9)
v10: request deferral if fpga mgr or bridges not available yet
     cleanup as fpga manager core goes into the real kernel
     Don't assume bridges are disabled before programming FPGA
     Don't hang onto reference for fpga manager
     Move to staging/simple-fpga-bus
v11: No change in this patch for v11 of the patch set
v12: Moved out of staging.
     Use fpga bridges framework.
v13: If no bridges are specified, assume we don't need any.
     Clean up debug messages
     Some dev_info -> dev_dbg
     Remove unneeded #include
     Fix size of array of pointers
     Don't need to specify .owner
     Use common binding: firmware-name
v14: OK it's not a simple bus.  Call it "FPGA Area"
     Remove bindings that specify FPGA manager and FPGA bridges
     Use parent FPGA bridge and bridges that are its peers
     Use ancestor FPGA Manager
v15: Add altr,fpga-bus implementation
     Change compatible string "fpga-area" -> "altr,fpga-area"
v16: Much changes as FPGA Areas and Busses become FPGA Regions
     Add reconfig notifier, don't rely on simple-bus
---
 drivers/fpga/Kconfig       |    7 +
 drivers/fpga/Makefile      |    3 +
 drivers/fpga/fpga-region.c |  460 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 470 insertions(+)
 create mode 100644 drivers/fpga/fpga-region.c

diff --git a/drivers/fpga/Kconfig b/drivers/fpga/Kconfig
index b6cfd89..c419d4b 100644
--- a/drivers/fpga/Kconfig
+++ b/drivers/fpga/Kconfig
@@ -13,6 +13,13 @@ config FPGA
 
 if FPGA
 
+config FPGA_REGION
+       bool "FPGA Region"
+       depends on OF
+       help
+	 FPGA Regions allow loading FPGA images under control of
+	 the Device Tree.
+
 config FPGA_MGR_SOCFPGA
 	tristate "Altera SOCFPGA FPGA Manager"
 	depends on ARCH_SOCFPGA
diff --git a/drivers/fpga/Makefile b/drivers/fpga/Makefile
index 4baef00..8d746c3 100644
--- a/drivers/fpga/Makefile
+++ b/drivers/fpga/Makefile
@@ -11,3 +11,6 @@ obj-$(CONFIG_FPGA_MGR_ZYNQ_FPGA)	+= zynq-fpga.o
 
 # FPGA Bridge Drivers
 obj-$(CONFIG_FPGA_BRIDGE)		+= fpga-bridge.o
+
+# High Level Interfaces
+obj-$(CONFIG_FPGA_REGION)		+= fpga-region.o
diff --git a/drivers/fpga/fpga-region.c b/drivers/fpga/fpga-region.c
new file mode 100644
index 0000000..eb4d3a6
--- /dev/null
+++ b/drivers/fpga/fpga-region.c
@@ -0,0 +1,460 @@
+/*
+ * FPGA Region - Device Tree support for FPGA programming under Linux
+ *
+ *  Copyright (C) 2013-2016 Altera Corporation
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
+#include <linux/idr.h>
+#include <linux/fpga/fpga-bridge.h>
+#include <linux/fpga/fpga-mgr.h>
+#include <linux/kernel.h>
+#include <linux/list.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+
+/**
+ * struct fpga_region - FPGA Region structure
+ * @dev: FPGA Region device
+ * @mutex: enforces exclusive reference to region
+ * @bridge_list: list of FPGA bridges specified in region
+ */
+struct fpga_region {
+	struct device dev;
+	struct mutex mutex; /* for exclusive reference to region */
+	struct list_head bridge_list;
+};
+
+#define to_fpga_region(d) container_of(d, struct fpga_region, dev)
+
+static DEFINE_IDA(fpga_region_ida);
+static struct class *fpga_region_class;
+
+static const struct of_device_id fpga_region_of_match[] = {
+	{ .compatible = "fpga-region", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, fpga_region_of_match);
+
+static int fpga_region_of_node_match(struct device *dev, const void *data)
+{
+	return dev->of_node == data;
+}
+
+/**
+ * fpga_region_find - find FPGA region
+ * @np: device node of FPGA Region
+ * Caller will need to put_device(&region->dev) when done.
+ * Returns FPGA Region struct or NULL
+ */
+static struct fpga_region *fpga_region_find(struct device_node *np)
+{
+	struct device *dev;
+
+	dev = class_find_device(fpga_region_class, NULL, np,
+				fpga_region_of_node_match);
+	if (!dev) {
+		pr_err("%s did not find FPGA Region in class: %s\n", __func__,
+		       np->full_name);
+		return NULL;
+	}
+
+	return to_fpga_region(dev);
+}
+
+/**
+ * fpga_region_get - get an exclusive reference to a fpga region
+ * @region: FPGA Region struct
+ *
+ * Caller should call fpga_region_put() when done with region.
+ *
+ * Return fpga_region struct if successful.
+ * Return -EBUSY if someone already has a reference to the region.
+ * Return -ENODEV if @np is not a FPGA Region.
+ */
+static struct fpga_region *fpga_region_get(struct fpga_region *region)
+{
+	struct device *dev = &region->dev;
+
+	if (!mutex_trylock(&region->mutex)) {
+		dev_dbg(dev, "%s: FPGA Region already in use\n", __func__);
+		return ERR_PTR(-EBUSY);
+	}
+
+	get_device(dev);
+	of_node_get(dev->of_node);
+	if (!try_module_get(dev->parent->driver->owner)) {
+		of_node_put(dev->of_node);
+		put_device(dev);
+		mutex_unlock(&region->mutex);
+		return ERR_PTR(-ENODEV);
+	}
+
+	dev_dbg(&region->dev, "get\n");
+
+	return region;
+}
+
+/**
+ * fpga_region_put - release a reference to a region
+ *
+ * @region: FPGA region
+ */
+static void fpga_region_put(struct fpga_region *region)
+{
+	struct device *dev = &region->dev;
+
+	dev_dbg(&region->dev, "put\n");
+
+	module_put(dev->parent->driver->owner);
+	of_node_put(dev->of_node);
+	put_device(dev);
+	mutex_unlock(&region->mutex);
+}
+
+/**
+ * fpga_region_get_manager - get exclusive reference for FPGA manager
+ * @region: FPGA region
+ *
+ * Get FPGA Manager from "fpga-mgr" property or from ancestor region.
+ *
+ * Caller should call fpga_mgr_put() when done with manager.
+ *
+ * Return: fpga manager struct or IS_ERR() condition containing error code.
+ */
+static struct fpga_manager *fpga_region_get_manager(struct fpga_region *region)
+{
+	struct device *dev = &region->dev;
+	struct device_node *np = dev->of_node;
+	struct device_node  *mgr_node;
+	struct fpga_manager *mgr;
+
+	of_node_get(np);
+	while (np) {
+		if (of_device_is_compatible(np, "fpga-region")) {
+			mgr_node = of_parse_phandle(np, "fpga-mgr", 0);
+			if (mgr_node) {
+				mgr = of_fpga_mgr_get(mgr_node);
+				of_node_put(np);
+				return mgr;
+			}
+		}
+		np = of_get_next_parent(np);
+	}
+	of_node_put(np);
+
+	return ERR_PTR(-EINVAL);
+}
+
+/**
+ * fpga_region_get_bridges - create a list of bridges
+ * @region: FPGA region
+ *
+ * Create a list of bridges specified by "fpga-bridges" property.
+ * If no bridges are specified, list will be empty.  Note that the
+ * fpga_bridges_enable/disable/put functions are all fine with an empty list.
+ *
+ * Caller should call fpga_bridges_put(&region->bridge_list) when
+ * done with the bridges.
+ *
+ * Return 0 for success (even if there are no bridges specified)
+ * or -EBUSY if any of the bridges are in use.
+ */
+static int fpga_region_get_bridges(struct fpga_region *region)
+{
+	struct device *dev = &region->dev;
+	struct device_node *np = dev->of_node;
+	struct device_node *br_node;
+	int i, ret;
+
+	for (i = 0; ; i++) {
+		br_node = of_parse_phandle(np, "fpga-bridges", i);
+		if (!br_node)
+			break;
+
+		/* If node is a bridge, get it and add to list */
+		ret = fpga_bridge_get_to_list(br_node, &region->bridge_list);
+
+		/* If any of the bridges are in use, give up */
+		if (ret == -EBUSY) {
+			fpga_bridges_put(&region->bridge_list);
+			return -EBUSY;
+		}
+	}
+
+	return 0;
+}
+
+/**
+ * fpga_region_program_fpga - program FPGA
+ * @region: FPGA region
+ * Program an FPGA using information in the device tree.
+ * Function assumes that there is a firmware-name property.
+ * Return 0 for success or negative error code.
+ */
+static int fpga_region_program_fpga(struct fpga_region *region)
+{
+	struct device *dev = &region->dev;
+	struct device_node *np = dev->of_node;
+	struct fpga_manager *mgr;
+	const char *path;
+	u32 flags = 0;
+	int ret;
+
+	region = fpga_region_get(region);
+	if (IS_ERR(region))
+		return PTR_ERR(region);
+
+	mgr = fpga_region_get_manager(region);
+	if (IS_ERR(mgr))
+		return PTR_ERR(mgr);
+
+	of_property_read_string(np, "firmware-name", &path);
+
+	if (of_property_read_bool(np, "partial-reconfig"))
+		flags |= FPGA_MGR_PARTIAL_RECONFIG;
+
+	ret = fpga_region_get_bridges(region);
+	if (ret)
+		goto err_put_mgr;
+
+	ret = fpga_bridges_disable(&region->bridge_list);
+	if (ret)
+		goto err_put_br;
+
+	ret = fpga_mgr_firmware_load(mgr, flags, path);
+	if (ret)
+		goto err_put_br;
+
+	ret = fpga_bridges_enable(&region->bridge_list);
+	if (ret)
+		goto err_put_br;
+
+	fpga_mgr_put(mgr);
+	fpga_region_put(region);
+
+	return 0;
+
+err_put_br:
+	fpga_bridges_put(&region->bridge_list);
+err_put_mgr:
+	fpga_mgr_put(mgr);
+	fpga_region_put(region);
+
+	return ret;
+}
+
+/**
+ * fpga_region_notify_remove_property - handle firmware-name property remove
+ * @region: FPGA Region structure
+ *
+ * This function handles the case where a firmware-name property has been
+ * removed from a FPGA Region.  The FPGA bridges for that region will be
+ * disabled and released.
+ */
+static void fpga_region_notify_remove_property(struct fpga_region *region)
+{
+	region = fpga_region_get(region);
+	if (IS_ERR(region))
+		return;
+
+	fpga_bridges_disable(&region->bridge_list);
+	fpga_bridges_put(&region->bridge_list);
+
+	fpga_region_put(region);
+}
+
+/**
+ * of_fpga_region_notify - reconfig notifier for dynamic DT changes
+ * @nb:		notifier block
+ * @action:	notifier action
+ * @arg:	reconfig data
+ *
+ * This notifier handles programming a FPGA when a "firmware-name" property is
+ * added to a fpga-region.
+ *
+ * Returns NOTIFY_OK or error if FPGA programming fails.
+ */
+static int of_fpga_region_notify(struct notifier_block *nb,
+				 unsigned long action, void *arg)
+{
+	struct of_reconfig_data *rd = arg;
+	struct device_node *np;
+	struct fpga_region *region;
+	int ret;
+
+	switch (action) {
+	case OF_RECONFIG_ADD_PROPERTY:
+	case OF_RECONFIG_REMOVE_PROPERTY:
+		/* Add/Remove a region's 'firmware-name' property */
+		np = rd->dn;
+		if (!of_device_is_compatible(np, "fpga-region") ||
+		    strcmp(rd->prop->name, "firmware-name"))
+			return NOTIFY_OK;       /* not for us */
+
+		region = fpga_region_find(np);
+		if (!region)
+			return NOTIFY_OK;
+
+		if (action == OF_RECONFIG_ADD_PROPERTY) {
+			ret = fpga_region_program_fpga(region);
+			if (ret) {
+				put_device(&region->dev);
+				return notifier_from_errno(ret);
+			}
+			of_platform_populate(np, fpga_region_of_match,
+					     NULL, &region->dev);
+		} else { /* OF_RECONFIG_REMOVE_PROPERTY */
+			fpga_region_notify_remove_property(region);
+		}
+
+		put_device(&region->dev);
+		break;
+
+	default:
+		break;
+	}
+
+	return NOTIFY_OK;
+}
+
+static struct notifier_block fpga_region_of_nb = {
+	.notifier_call = of_fpga_region_notify,
+};
+
+static int fpga_region_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct fpga_region *region;
+	const char *path;
+	int id, ret = 0;
+
+	region = kzalloc(sizeof(*region), GFP_KERNEL);
+	if (!region)
+		return -ENOMEM;
+
+	id = ida_simple_get(&fpga_region_ida, 0, 0, GFP_KERNEL);
+	if (id < 0) {
+		ret = id;
+		goto err_kfree;
+	}
+
+	mutex_init(&region->mutex);
+	INIT_LIST_HEAD(&region->bridge_list);
+
+	device_initialize(&region->dev);
+	region->dev.class = fpga_region_class;
+	region->dev.parent = dev;
+	region->dev.of_node = np;
+	region->dev.id = id;
+	dev_set_drvdata(dev, region);
+
+	ret = dev_set_name(&region->dev, "region%d", id);
+	if (ret)
+		goto err_remove;
+
+	ret = device_add(&region->dev);
+	if (ret)
+		goto err_remove;
+
+	if (!of_property_read_string(np, "firmware-name", &path)) {
+		ret = fpga_region_program_fpga(region);
+		if (ret)
+			goto err_unreg;
+	}
+
+	of_platform_populate(np, fpga_region_of_match, NULL, &region->dev);
+
+	dev_info(dev, "FPGA Region probed\n");
+
+	return 0;
+
+err_unreg:
+	device_unregister(dev);
+err_remove:
+	ida_simple_remove(&fpga_region_ida, id);
+err_kfree:
+	kfree(region);
+
+	return ret;
+}
+
+static int fpga_region_remove(struct platform_device *pdev)
+{
+	struct fpga_region *region = platform_get_drvdata(pdev);
+
+	/* If fpga_region_probe programmed the FPGA, disable/put bridges */
+	fpga_bridges_disable(&region->bridge_list);
+	fpga_bridges_put(&region->bridge_list);
+
+	device_unregister(&region->dev);
+
+	return 0;
+}
+
+static struct platform_driver fpga_region_driver = {
+	.probe = fpga_region_probe,
+	.remove = fpga_region_remove,
+	.driver = {
+		.name	= "fpga-region",
+		.of_match_table = of_match_ptr(fpga_region_of_match),
+	},
+};
+
+static void fpga_region_dev_release(struct device *dev)
+{
+	struct fpga_region *region = to_fpga_region(dev);
+
+	ida_simple_remove(&fpga_region_ida, region->dev.id);
+	kfree(region);
+}
+
+/**
+ * fpga_region_init - init function for fpga_region class
+ * Creates the fpga_region class and registers a reconfig notifier.
+ */
+static int __init fpga_region_init(void)
+{
+	int ret;
+
+	fpga_region_class = class_create(THIS_MODULE, "fpga_region");
+	if (IS_ERR(fpga_region_class))
+		return PTR_ERR(fpga_region_class);
+
+	fpga_region_class->dev_release = fpga_region_dev_release;
+
+	ret = of_reconfig_notifier_register(&fpga_region_of_nb);
+	if (ret)
+		return ret;
+
+	return platform_driver_register(&fpga_region_driver);
+}
+
+static void __exit fpga_region_exit(void)
+{
+	platform_driver_unregister(&fpga_region_driver);
+	of_reconfig_notifier_unregister(&fpga_region_of_nb);
+
+	class_destroy(fpga_region_class);
+	ida_destroy(&fpga_region_ida);
+}
+
+module_init(fpga_region_init);
+module_exit(fpga_region_exit);
+
+MODULE_DESCRIPTION("FPGA Region");
+MODULE_AUTHOR("Alan Tull <atull@opensource.altera.com>");
+MODULE_LICENSE("GPL v2");
-- 
1.7.9.5

