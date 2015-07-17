From: <atull@opensource.altera.com>
Subject: [PATCH v9 6/7] staging: add simple-fpga-bus
Date: Fri, 17 Jul 2015 10:51:16 -0500
Message-ID: <1437148277-5405-7-git-send-email-atull@opensource.altera.com>
References: <1437148277-5405-1-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1437148277-5405-1-git-send-email-atull@opensource.altera.com>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, jgunthorpe@obsidianresearch.com, hpa@zytor.com, monstr@monstr.eu, michal.simek@xilinx.com, rdunlap@infradead.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, pantelis.antoniou@konsulko.com, robh+dt@kernel.org, grant.likely@linaro.org, iws@ovro.caltech.edu, linux-doc@vger.kernel.org, pavel@denx.de, broonie@kernel.org, philip@balister.org, rubini@gnudd.com, s.trumtrar@pengutronix.de, jason@lakedaemon.net, kyle.teske@ni.com, nico@linaro.org, balbi@ti.com, m.chehab@samsung.com, davidb@codeaurora.org, rob@landley.net, davem@davemloft.net, cesarb@cesarb.net, sameo@linux.intel.com, akpm@linux-foundation.org, linus.walleij@linaro.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devel@driverdev.osuosl.org, Petr Cvek <petr.cvek@tul.cz>, delicious.quinoa@gmail.com, dinguyen@opensource.altera.com, yvanderv@opensource.altera.com, Alan Tull <atull@opensource.altera.co>
List-Id: devicetree@vger.kernel.org

From: Alan Tull <atull@opensource.altera.com>

Add simple fpga bus.  This is a bus that configures an fpga and its
bridges before populating the devices below it.  This is intended
for use with device tree overlays.

Note that FPGA bridges are seen as reset controllers so no special
framework for FPGA bridges will need to be added.

This supports fpga use where hardware blocks on a fpga will need
drivers (as opposed to fpga used as an acceleration without drivers.)

Signed-off-by: Alan Tull <atull@opensource.altera.com>
---
 drivers/staging/fpga/Kconfig           |   11 ++
 drivers/staging/fpga/Makefile          |    1 +
 drivers/staging/fpga/simple-fpga-bus.c |  323 ++++++++++++++++++++++++++++++++
 3 files changed, 335 insertions(+)
 create mode 100644 drivers/staging/fpga/simple-fpga-bus.c

diff --git a/drivers/staging/fpga/Kconfig b/drivers/staging/fpga/Kconfig
index 8254ca0..8d003e3 100644
--- a/drivers/staging/fpga/Kconfig
+++ b/drivers/staging/fpga/Kconfig
@@ -11,4 +11,15 @@ config FPGA
 	  kernel.  The FPGA framework adds a FPGA manager class and FPGA
 	  manager drivers.
 
+if FPGA
+
+config SIMPLE_FPGA_BUS
+       bool "Simple FPGA Bus"
+       depends on OF
+       help
+         Simple FPGA Bus allows loading FPGA images under control of
+	 Device Tree.
+
+endif # FPGA
+
 endmenu
diff --git a/drivers/staging/fpga/Makefile b/drivers/staging/fpga/Makefile
index 3313c52..6115213 100644
--- a/drivers/staging/fpga/Makefile
+++ b/drivers/staging/fpga/Makefile
@@ -4,5 +4,6 @@
 
 # Core FPGA Manager Framework
 obj-$(CONFIG_FPGA)			+= fpga-mgr.o
+obj-$(CONFIG_SIMPLE_FPGA_BUS)		+= simple-fpga-bus.o
 
 # FPGA Manager Drivers
diff --git a/drivers/staging/fpga/simple-fpga-bus.c b/drivers/staging/fpga/simple-fpga-bus.c
new file mode 100644
index 0000000..bf178d8
--- /dev/null
+++ b/drivers/staging/fpga/simple-fpga-bus.c
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
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/reset.h>
+#include <linux/slab.h>
+
+/**
+ * struct simple_fpga_bus - simple fpga bus private data
+ * @dev:	device from pdev
+ * @mgr:	the fpga manager associated with this bus
+ * @bridges:	an array of reset controls for controlling FPGA bridges
+ *		associated with this bus
+ * @num_bridges: size of the bridges array
+ */
+struct simple_fpga_bus {
+	struct device *dev;
+	struct fpga_manager *mgr;
+	struct reset_control **bridges;
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
+ * Return: 0 if success or if the fpga manager is not specified.
+ *         Negative error code otherwise.
+ */
+static int simple_fpga_bus_get_mgr(struct simple_fpga_bus *priv)
+{
+	struct device *dev = priv->dev;
+	struct device_node *np = dev->of_node;
+	struct fpga_manager *mgr;
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
+	mgr = of_fpga_mgr_get(mgr_node);
+	if (IS_ERR(mgr))
+		return PTR_ERR(mgr);
+
+	priv->mgr = mgr;
+
+	return 0;
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
+static int simple_fpga_bus_load_image(struct simple_fpga_bus *priv)
+{
+	struct device *dev = priv->dev;
+	struct device_node *np = dev->of_node;
+	struct fpga_manager *mgr = priv->mgr;
+	u32 flags = 0;
+	const char *path;
+
+	if (of_property_read_bool(np, "partial-reconfig"))
+		flags |= FPGA_MGR_PARTIAL_RECONFIG;
+
+	/* If firmware image is specified in the DT, load it */
+	if (!of_property_read_string(np, "fpga-firmware", &path))
+		return fpga_mgr_firmware_load(mgr, flags, path);
+
+	/*
+	 * Here we can add other methods of getting ahold of a fpga image
+	 * specified in the device tree and programming it.
+	 */
+
+	dev_info(dev, "No FPGA image to load.\n");
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
+		ret = reset_control_deassert(priv->bridges[i]);
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
+		ret = reset_control_assert(priv->bridges[i]);
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
+ * Given a simple fpga bus, get references for its associated fpga bridges so
+ * that it can enable/disable the bridges.  These are specified by "resets"
+ * and "reset-names" device tree properties.
+ *
+ * Return: 0 on success, negative error code otherwise.
+ */
+static int simple_fpga_bus_get_bridges(struct simple_fpga_bus *priv)
+{
+	struct device *dev = priv->dev;
+	struct device_node *np = dev->of_node;
+	const char *reset_name;
+	struct reset_control **bridges;
+	int i, num_resets, num_names, ret;
+
+	num_resets = of_count_phandle_with_args(np, "resets", "#reset-cells");
+	num_names = of_property_count_strings(np, "reset-names");
+	if (num_resets <= 0 || num_names <= 0) {
+		dev_info(dev, "No fpga bridge resets found\n");
+		return -EINVAL;
+	}
+	if (num_resets != num_names) {
+		dev_dbg(dev, "Number of resets and reset-names differ.");
+		return -EINVAL;
+	}
+
+	bridges = kcalloc(num_resets, sizeof(struct reset_control *),
+			  GFP_KERNEL);
+	if (!bridges)
+		return -ENOMEM;
+
+	for (i = 0; i < num_resets; i++) {
+		ret = of_property_read_string_index(np, "reset-names", i,
+						    &reset_name);
+		if (ret)
+			return ret;
+
+		bridges[i] = of_reset_control_get(np, reset_name);
+		if (IS_ERR(bridges[i])) {
+			ret = PTR_ERR(bridges[i]);
+			goto err_free_bridges;
+		}
+	}
+
+	priv->bridges = bridges;
+	priv->num_bridges = num_resets;
+
+	return 0;
+
+err_free_bridges:
+	for (i = 0; i < num_resets; i++)
+		reset_control_put(priv->bridges[i]);
+
+	kfree(bridges);
+	return ret;
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
+		reset_control_put(priv->bridges[i]);
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
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->dev = dev;
+
+	ret = simple_fpga_bus_get_mgr(priv);
+	if (ret)
+		return ret;
+
+	if (priv->mgr) {
+		ret = simple_fpga_bus_get_bridges(priv);
+		if (ret)
+			goto err_release_mgr;
+
+		ret = simple_fpga_bus_load_image(priv);
+		if (ret)
+			goto err_release_br;
+
+		ret = simple_fpga_bus_bridge_enable(priv);
+		if (ret)
+			goto err_release_br;
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
+	fpga_mgr_put(priv->mgr);
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
+	fpga_mgr_put(priv->mgr);
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
+		.owner	= THIS_MODULE,
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
+MODULE_AUTHOR("Alan Tull <atull@opensource.altera.com>");
+MODULE_LICENSE("GPL v2");
-- 
1.7.9.5
