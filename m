From: <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: [PATCH v13 3/6] fpga: add simple-fpga-bus
Date: Tue, 3 Nov 2015 11:11:01 -0600
Message-ID: <1446570664-10293-4-git-send-email-atull@opensource.altera.com>
References: <1446570664-10293-1-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1446570664-10293-1-git-send-email-atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, Josh Cartwright <joshc-acOepvfBmUk@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org, delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>

The Simple FPGA bus uses the FPGA Manager Framework and the
FPGA Bridge Framework to provide a manufactorer-agnostic
interface for reprogramming FPGAs that is Device Tree
Overlays-based.

When a Device Tree Overlay containing a Simple FPGA Bus is
applied, the Simple FPGA Bus will be probed and will:
 * Disable the FPGA bridges specified in the overlay
 * Reprogram a specified FPGA with a specified image file
 * Enable the specified FPGA bridges
 * Populate the child devices

Removing the Device Tree Overlay is also supported.

This supports fpga use where hardware blocks on a fpga will
need drivers.

Signed-off-by: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
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
---
 drivers/fpga/Kconfig           |   7 +
 drivers/fpga/Makefile          |   3 +
 drivers/fpga/simple-fpga-bus.c | 323 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 333 insertions(+)
 create mode 100644 drivers/fpga/simple-fpga-bus.c

diff --git a/drivers/fpga/Kconfig b/drivers/fpga/Kconfig
index c9b9fdf..5fcf60a 100644
--- a/drivers/fpga/Kconfig
+++ b/drivers/fpga/Kconfig
@@ -13,6 +13,13 @@ config FPGA
 
 if FPGA
 
+config SIMPLE_FPGA_BUS
+       bool "Simple FPGA Bus"
+       depends on OF
+       help
+         Simple FPGA Bus allows loading FPGA images under control of
+	 Device Tree.
+
 config FPGA_MGR_SOCFPGA
 	tristate "Altera SOCFPGA FPGA Manager"
 	depends on ARCH_SOCFPGA
diff --git a/drivers/fpga/Makefile b/drivers/fpga/Makefile
index 8d83fc6..9b55ae0 100644
--- a/drivers/fpga/Makefile
+++ b/drivers/fpga/Makefile
@@ -8,3 +8,6 @@ obj-$(CONFIG_FPGA)			+= fpga-mgr.o
 # FPGA Manager Drivers
 obj-$(CONFIG_FPGA_MGR_SOCFPGA)		+= socfpga.o
 obj-$(CONFIG_FPGA_MGR_ZYNQ_FPGA)	+= zynq-fpga.o
+
+# High Level Interfaces
+obj-$(CONFIG_SIMPLE_FPGA_BUS)		+= simple-fpga-bus.o
diff --git a/drivers/fpga/simple-fpga-bus.c b/drivers/fpga/simple-fpga-bus.c
new file mode 100644
index 0000000..abe95a0
--- /dev/null
+++ b/drivers/fpga/simple-fpga-bus.c
@@ -0,0 +1,323 @@
+/*
+ * Simple FPGA Bus
+ *
+ *  Copyright (C) 2013-2015 Altera Corporation
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
+
+#include <linux/fpga/fpga-mgr.h>
+#include <linux/fpga/fpga-bridge.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/slab.h>
+
+/**
+ * struct simple_fpga_bus - simple fpga bus private data
+ * @dev:	device from pdev
+ * @bridges:	FPGA bridges associated with this bus
+ * @num_bridges: size of the bridges array
+ */
+struct simple_fpga_bus {
+	struct device *dev;
+	struct fpga_bridge **bridges;
+	int num_bridges;
+};
+
+/**
+ * simple_fpga_bus_get_mgr - get associated fpga manager
+ * @priv: simple fpga bus private data
+ * pointer to fpga manager in priv->mgr on success
+ *
+ * Given a simple fpga bus, get a reference to its the fpga manager specified
+ * by its "fpga-mgr" device tree property.
+ *
+ * Return: 0 if the fpga manager is not specified.
+ *         pointer to struct fpga_manager if successful.
+ *         Negative error code otherwise.
+ */
+static struct fpga_manager *simple_fpga_bus_get_mgr(
+					struct simple_fpga_bus *priv)
+{
+	struct device *dev = priv->dev;
+	struct device_node *np = dev->of_node;
+	struct device_node *mgr_node;
+
+	/*
+	 * Return 0 (not an error) if fpga manager is not specified.
+	 * This supports the case where fpga was already configured.
+	 */
+	mgr_node = of_parse_phandle(np, "fpga-mgr", 0);
+	if (!mgr_node) {
+		dev_dbg(dev, "could not find fpga-mgr DT property\n");
+		return 0;
+	}
+
+	return of_fpga_mgr_get(mgr_node);
+}
+
+/**
+ * simple_fpga_bus_load_image - load an fpga image under device tree control
+ * @priv: simple fpga bus private data
+ *
+ * Given a simple fpga bus, load the fpga image specified in its device
+ * tree node.
+ *
+ * Return: 0 on success, negative error code otherwise.
+ */
+static int simple_fpga_bus_load_image(struct simple_fpga_bus *priv,
+				      struct fpga_manager *mgr)
+{
+	struct device *dev = priv->dev;
+	struct device_node *np = dev->of_node;
+	u32 flags = 0;
+	const char *path;
+
+	if (of_property_read_bool(np, "partial-reconfig"))
+		flags |= FPGA_MGR_PARTIAL_RECONFIG;
+
+	/* If firmware image is specified in the DT, load it */
+	if (!of_property_read_string(np, "firmware-name", &path))
+		return fpga_mgr_firmware_load(mgr, flags, path);
+
+	/*
+	 * Here we can add other methods of getting ahold of a fpga image
+	 * specified in the device tree and programming it.
+	 */
+
+	dev_dbg(dev, "No FPGA image to load.\n");
+
+	/* Status is that we have a fpga manager but no image specified. */
+	return -EINVAL;
+}
+
+/**
+ * simple_fpga_bus_bridge_enable - enable the fpga bridges
+ * @priv: simple fpga bus private data
+ *
+ * Return: 0 on success, negative error code otherwise.
+ */
+static int simple_fpga_bus_bridge_enable(struct simple_fpga_bus *priv)
+{
+	int i, ret;
+
+	for (i = 0; i < priv->num_bridges; i++) {
+		ret = fpga_bridge_enable(priv->bridges[i]);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+/**
+ * simple_fpga_bus_bridge_disable - disable the bridges
+ * @priv: simple fpga bus private data
+ *
+ * Return: 0 on success, negative error code otherwise.
+ */
+static int simple_fpga_bus_bridge_disable(struct simple_fpga_bus *priv)
+{
+	int i, ret;
+
+	for (i = 0; i < priv->num_bridges; i++) {
+		ret = fpga_bridge_disable(priv->bridges[i]);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+/**
+ * simple_fpga_bus_get_bridges - get references for fpga bridges
+ * @priv: simple fpga bus private data
+ *
+ * Given a simple fpga bus, get references for its associated fpga bridges.
+ * These are pointed to by "fpga-bridges" device tree property.
+ *
+ * Return: 0 on success, negative error code otherwise.
+ */
+static int simple_fpga_bus_get_bridges(struct simple_fpga_bus *priv)
+{
+	struct device *dev = priv->dev;
+	struct device_node *np = dev->of_node;
+	struct of_phandle_args out_args;
+	struct fpga_bridge *bridge, **bridges;
+	int i, num_bridges, ret;
+
+	/* If no bridges are specified, assume we don't need any. */
+	num_bridges = of_count_phandle_with_args(np, "fpga-bridges", NULL);
+	if (num_bridges <= 0)
+		return 0;
+
+	bridges = kcalloc(num_bridges, sizeof(struct fpga_bridge *),
+			  GFP_KERNEL);
+	if (!bridges)
+		return -ENOMEM;
+
+	for (i = 0; i < num_bridges; i++) {
+		ret = of_parse_phandle_with_args(np, "fpga-bridges", NULL, i,
+						 &out_args);
+		if (ret)
+			goto err_free_bridges;
+
+		bridge = of_fpga_bridge_get(out_args.np);
+		if (!bridge) {
+			dev_err(dev, "No fpga bridge found for phandle\n");
+			goto err_free_bridges;
+		}
+
+		dev_dbg(dev, "Found bridge: %s\n", dev_name(&bridge->dev));
+
+		bridges[i] = bridge;
+	}
+
+	priv->bridges = bridges;
+	priv->num_bridges = num_bridges;
+
+	return 0;
+
+err_free_bridges:
+	while (i)
+		fpga_bridge_put(bridges[--i]);
+
+	kfree(bridges);
+	return -EINVAL;
+}
+
+/**
+ * simple_fpga_bus_put_bridges - release references for the fpga bridges
+ * @priv: simple fpga bus private data
+ */
+static void simple_fpga_bus_put_bridges(struct simple_fpga_bus *priv)
+{
+	int i;
+
+	for (i = 0; i < priv->num_bridges; i++)
+		fpga_bridge_put(priv->bridges[i]);
+
+	kfree(priv->bridges);
+	priv->num_bridges = 0;
+}
+
+/**
+ * simple_fpga_bus_probe - Probe function for simple fpga bus.
+ * @pdev: platform device
+ *
+ * Do the necessary steps to program the FPGA and enable associated bridges.
+ * Then populate the device tree below this bus to get drivers probed for the
+ * hardware that is on the FPGA.
+ *
+ * Return: 0 on success, negative error code otherwise.
+ */
+static int simple_fpga_bus_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct simple_fpga_bus *priv;
+	struct fpga_manager *mgr;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->dev = dev;
+
+	/*
+	 * If simple_fpga_bus_get_mgr returns a negative error, the fpga
+	 * manager may not have probed yet.
+	 */
+	mgr = simple_fpga_bus_get_mgr(priv);
+	if (IS_ERR(mgr))
+		return -EPROBE_DEFER;
+
+	if (mgr) {
+		ret = simple_fpga_bus_get_bridges(priv);
+		if (ret) {
+			ret = -EPROBE_DEFER;
+			goto err_release_mgr;
+		}
+
+		ret = simple_fpga_bus_bridge_disable(priv);
+		if (ret)
+			goto err_release_br;
+
+		ret = simple_fpga_bus_load_image(priv, mgr);
+		if (ret)
+			goto err_release_br;
+
+		ret = simple_fpga_bus_bridge_enable(priv);
+		if (ret)
+			goto err_release_br;
+
+		fpga_mgr_put(mgr);
+	}
+
+	of_platform_populate(np, of_default_bus_match_table, NULL, dev);
+
+	platform_set_drvdata(pdev, priv);
+
+	return 0;
+
+err_release_br:
+	simple_fpga_bus_put_bridges(priv);
+err_release_mgr:
+	fpga_mgr_put(mgr);
+
+	return ret;
+}
+
+static int simple_fpga_bus_remove(struct platform_device *pdev)
+{
+	struct simple_fpga_bus *priv = platform_get_drvdata(pdev);
+
+	simple_fpga_bus_bridge_disable(priv);
+	simple_fpga_bus_put_bridges(priv);
+
+	return 0;
+}
+
+static const struct of_device_id simple_fpga_bus_of_match[] = {
+	{ .compatible = "simple-fpga-bus", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, simple_fpga_bus_of_match);
+
+static struct platform_driver simple_fpga_bus_driver = {
+	.probe = simple_fpga_bus_probe,
+	.remove = simple_fpga_bus_remove,
+	.driver = {
+		.name	= "simple-fpga-bus",
+		.of_match_table = of_match_ptr(simple_fpga_bus_of_match),
+	},
+};
+
+static int __init simple_fpga_bus_init(void)
+{
+	return platform_driver_register(&simple_fpga_bus_driver);
+}
+
+static void __exit simple_fpga_bus_exit(void)
+{
+	platform_driver_unregister(&simple_fpga_bus_driver);
+}
+
+module_init(simple_fpga_bus_init);
+module_exit(simple_fpga_bus_exit);
+
+MODULE_DESCRIPTION("Simple FPGA Bus");
+MODULE_AUTHOR("Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>");
+MODULE_LICENSE("GPL v2");
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
