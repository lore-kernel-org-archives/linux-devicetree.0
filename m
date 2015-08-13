From: <atull@opensource.altera.com>
Subject: [PATCH v10 8/8] staging: add simple-fpga-bus
Date: Thu, 13 Aug 2015 12:37:32 -0500
Message-ID: <1439487452-23977-10-git-send-email-atull@opensource.altera.com>
References: <1439487452-23977-1-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1439487452-23977-1-git-send-email-atull@opensource.altera.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: gregkh@linuxfoundation.org, jgunthorpe@obsidianresearch.com, hpa@zytor.com, monstr@monstr.eu, michal.simek@xilinx.com, rdunlap@infradead.org
Cc: mark.rutland@arm.com, linux-doc@vger.kernel.org, rubini@gnudd.com, pantelis.antoniou@konsulko.com, s.trumtrar@pengutronix.de, devel@driverdev.osuosl.org, sameo@linux.intel.com, nico@linaro.org, ijc+devicetree@hellion.org.uk, kyle.teske@ni.com, grant.likely@linaro.org, davidb@codeaurora.org, linus.walleij@linaro.org, cesarb@cesarb.net, devicetree@vger.kernel.org, jason@lakedaemon.net, pawel.moll@arm.com, iws@ovro.caltech.edu, Alan Tull <atull@opensource.altera.com>, broonie@kernel.org, philip@balister.org, Petr Cvek <petr.cvek@tul.cz>, dinguyen@opensource.altera.com, pavel@denx.de, linux-kernel@vger.kernel.org, balbi@ti.com, delicious.quinoa@gmail.com, robh+dt@kernel.org, rob@landley.net, galak@codeaurora.org, akpm@linux-foundation.org, davem@davemloft.net, m.chehab@samsung.com
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
v9:  initial version (this patch added during rest of patchset's v9)

v10: request deferral if fpga mgr or bridges not available yet
     cleanup as fpga manager core goes into the real kernel
     Don't assume bridges are disabled before programming FPGA
     Don't hang onto reference for fpga manager
     Move to staging/simple-fpga-bus
---
 drivers/staging/Kconfig                           |    2 +
 drivers/staging/Makefile                          |    1 +
 drivers/staging/simple-fpga-bus/Kconfig           |   14 +
 drivers/staging/simple-fpga-bus/Makefile          |    5 +
 drivers/staging/simple-fpga-bus/simple-fpga-bus.c |  330 +++++++++++++++++++++
 5 files changed, 352 insertions(+)
 create mode 100644 drivers/staging/simple-fpga-bus/Kconfig
 create mode 100644 drivers/staging/simple-fpga-bus/Makefile
 create mode 100644 drivers/staging/simple-fpga-bus/simple-fpga-bus.c

diff --git a/drivers/staging/Kconfig b/drivers/staging/Kconfig
index 7f6cae5..e655799 100644
--- a/drivers/staging/Kconfig
+++ b/drivers/staging/Kconfig
@@ -112,4 +112,6 @@ source "drivers/staging/fsl-mc/Kconfig"
 
 source "drivers/staging/wilc1000/Kconfig"
 
+source "drivers/staging/simple-fpga-bus/Kconfig"
+
 endif # STAGING
diff --git a/drivers/staging/Makefile b/drivers/staging/Makefile
index 347f647..6b5472e 100644
--- a/drivers/staging/Makefile
+++ b/drivers/staging/Makefile
@@ -48,3 +48,4 @@ obj-$(CONFIG_COMMON_CLK_XLNX_CLKWZRD)	+= clocking-wizard/
 obj-$(CONFIG_FB_TFT)		+= fbtft/
 obj-$(CONFIG_FSL_MC_BUS)	+= fsl-mc/
 obj-$(CONFIG_WILC1000)		+= wilc1000/
+obj-$(CONFIG_FPGA)		+= simple-fpga-bus/
diff --git a/drivers/staging/simple-fpga-bus/Kconfig b/drivers/staging/simple-fpga-bus/Kconfig
new file mode 100644
index 0000000..1c46be5
--- /dev/null
+++ b/drivers/staging/simple-fpga-bus/Kconfig
@@ -0,0 +1,14 @@
+#
+# FPGA framework configuration
+#
+
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
diff --git a/drivers/staging/simple-fpga-bus/Makefile b/drivers/staging/simple-fpga-bus/Makefile
new file mode 100644
index 0000000..ee4844b
--- /dev/null
+++ b/drivers/staging/simple-fpga-bus/Makefile
@@ -0,0 +1,5 @@
+#
+# Makefile for staging/fpga/
+#
+
+obj-$(CONFIG_SIMPLE_FPGA_BUS)		+= simple-fpga-bus.o
diff --git a/drivers/staging/simple-fpga-bus/simple-fpga-bus.c b/drivers/staging/simple-fpga-bus/simple-fpga-bus.c
new file mode 100644
index 0000000..011f36b
--- /dev/null
+++ b/drivers/staging/simple-fpga-bus/simple-fpga-bus.c
@@ -0,0 +1,330 @@
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
+		return -EPROBE_DEFER;
+
+	if (priv->mgr) {
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
+		ret = simple_fpga_bus_load_image(priv);
+		if (ret)
+			goto err_release_br;
+
+		ret = simple_fpga_bus_bridge_enable(priv);
+		if (ret)
+			goto err_release_br;
+
+		fpga_mgr_put(priv->mgr);
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
