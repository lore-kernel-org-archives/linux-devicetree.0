From: <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: [PATCH 2/3] fpga bus driver
Date: Fri, 1 Aug 2014 17:28:37 -0500
Message-ID: <1406932118-13885-3-git-send-email-atull@opensource.altera.com>
References: <1406932118-13885-1-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1406932118-13885-1-git-send-email-atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org, hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org, monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, pavel-ynQEQJNshbs@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, philip-6RQC9ztksjxg9hUCZPvPmw@public.gmane.org, rubini-kaDoWcXyVrEAvxtiuMwx3w@public.gmane.org, s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, kyle.teske-acOepvfBmUk@public.gmane.org, nico-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, cesarb-PWySMVKUnqmsTnJN9+BGXg@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, yvanderv-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>

This driver allows programming the fpga from
device tree overlays.

This code is dependent on Pantelis Antoniou's current
work on Device Tree overlays, a method of dynamically
altering the kerel's live Device Tree.  This patchset
was tested with Pantelis's and Grant Likely's stuff
that is in git plus some dtc fixups for compiling
overlays.

Resume is handled by re-requesting the firmware and
reprogramming the FPGA.

Here's a simple example. Start with:
  * the altera-gpio driver built in to the kernel but not in the
    device tree.
  * raw fpga image at /lib/firmware/soc_system.rbf
  * Load appropriate device tree overlay in configfs by doing
    $ mkdir /config/device-tree/overlays/1
    $ echo socfpga_overlay.dtbo > /config/device-tree/overlays/1/path
  * This results in the FPGA getting programmed and the altera
    gpio driver getting probed.

TODO:
  * Add ability to take fpga/cpu bridges out of reset.
  * To remove/clear FPGA image, remove device tree overlay by doing:
    $ rmdir /config/device-tree/overlays/1

Device tree overlay looks like this:
/dts-v1/;
/plugin/;
/ {
	fragment@0 {
		target-path="/soc";
		__overlay__ {
			#address-cells = <1>;
	                #size-cells = <1>;

			bridge@0xff200000 {
				compatible = "fpga-mgr-bus", "simple-bus";
				reg = <0xff200000 0x200000>;
				clocks = <0x2 0x2>;
				clock-names = "h2f_lw_axi_clock", "f2h_sdram0_clock";
				#address-cells = <0x2>;
				#size-cells = <0x1>;
				ranges = <0x1 0x10040 0xff210040 0x20>;

				fpgamgr = <&hps_0_fpgamgr>;
				fpga-firmware = "soc_system.rbf";

				gpio@0x100010040 {
					compatible = "altr,pio-14.0", "altr,pio-1.0";
					reg = <0x1 0x10040 0x20>;
					clocks = <0x2>;
					altr,gpio-bank-width = <0x4>;
					resetvalue = <0x0>;
					#gpio-cells = <0x2>;
					gpio-controller;
					linux,phandle = <0x2d>;
				};
			};
		};
	};
};

This patch adds one exported function to the core
(fpga-mgr.c):

EXPORT_SYMBOL_GPL(of_fpga_mgr_dev_lookup);
  Get pointer to fpga manager struct given a phandle.

Signed-off-by: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
---
 drivers/fpga/Kconfig     |    7 +++
 drivers/fpga/Makefile    |    1 +
 drivers/fpga/bus.c       |  145 ++++++++++++++++++++++++++++++++++++++++++++++
 drivers/fpga/fpga-mgr.c  |   26 +++++++++
 include/linux/fpga-mgr.h |    4 ++
 5 files changed, 183 insertions(+)
 create mode 100644 drivers/fpga/bus.c

diff --git a/drivers/fpga/Kconfig b/drivers/fpga/Kconfig
index 49293a3..9a2c25b 100644
--- a/drivers/fpga/Kconfig
+++ b/drivers/fpga/Kconfig
@@ -10,4 +10,11 @@ config FPGA
 	  Say Y here if you want support for configuring FPGAs from the
 	  kernel.  The FPGA framework adds a FPGA manager class and FPGA
 	  manager drivers.
+
+config FPGA_MGR_BUS
+	bool "FPGA Manager Bus"
+	depends on FPGA
+	help
+	  FPGA Manager Bus interface.  Allows loading FPGA images
+	  from Device Tree or from other drivers.
 endmenu
diff --git a/drivers/fpga/Makefile b/drivers/fpga/Makefile
index c8a676f..e39911f 100644
--- a/drivers/fpga/Makefile
+++ b/drivers/fpga/Makefile
@@ -6,5 +6,6 @@ fpga-mgr-core-y += fpga-mgr.o
 
 # Core FPGA Manager Framework
 obj-$(CONFIG_FPGA)			+= fpga-mgr-core.o
+obj-$(CONFIG_FPGA_MGR_BUS)		+= bus.o
 
 # FPGA Manager Drivers
diff --git a/drivers/fpga/bus.c b/drivers/fpga/bus.c
new file mode 100644
index 0000000..3aa4a8e
--- /dev/null
+++ b/drivers/fpga/bus.c
@@ -0,0 +1,145 @@
+/*
+ * FPGA Manager Bus Driver
+ *
+ *  Copyright (C) 2013-2014 Altera Corporation
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
+#include <linux/completion.h>
+#include <linux/fs.h>
+#include <linux/fpga-mgr.h>
+#include <linux/io.h>
+#include <linux/irq.h>
+#include <linux/kernel.h>
+#include <linux/list.h>
+#include <linux/mm.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_device.h>
+#include <linux/of_platform.h>
+#include <linux/pm.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/types.h>
+
+struct fpga_mgr_bus_priv {
+	struct device *dev;
+	struct device_node *np;
+	struct fpga_manager *mgr;
+	const char *path;
+};
+
+static int fpga_mgr_bus_suspend(struct device *dev)
+{
+	return 0;
+}
+
+static int fpga_mgr_bus_resume(struct device *dev)
+{
+	struct fpga_mgr_bus_priv *priv = dev_get_drvdata(dev);
+
+	if (strlen(priv->path) != 0)
+		fpga_mgr_firmware_write(priv->mgr, priv->path);
+
+	return 0;
+}
+
+static SIMPLE_DEV_PM_OPS(fpga_mgr_bus_pm_ops,
+			 fpga_mgr_bus_suspend, fpga_mgr_bus_resume);
+
+static int fpga_mgr_bus_probe(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct device *dev = &pdev->dev;
+	struct fpga_mgr_bus_priv *priv;
+	const char *path;
+	struct fpga_manager *mgr;
+	int ret = 0;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	/* Find the FPGA Manager to associate with */
+	mgr = of_fpga_mgr_dev_lookup(np, "fpgamgr", &ret);
+	if (ret != 0) {
+		dev_err(mgr->dev, "%s could not find fpga mgr\n", __func__);
+		return -ENODEV;
+	}
+
+	/* Find the FPGA image on the firmware path */
+	of_property_read_string(np, "fpga-firmware", &path);
+
+	ret = fpga_mgr_firmware_write(mgr, path);
+	if (ret != 0) {
+		dev_err(mgr->dev, "%s fpga mgr write failure\n", __func__);
+		return -EIO;
+	}
+
+	priv->dev = dev;
+	priv->np = np;
+	priv->mgr = mgr;
+	priv->path = path;
+	platform_set_drvdata(pdev, priv);
+
+	return 0;
+}
+
+/* Called when the Device Tree overlay is removed */
+static int fpga_mgr_bus_remove(struct platform_device *pdev)
+{
+	/*
+	 * Todo - when Device Tree overlay is removed,
+         * callback to low level FPGA driver to clear
+         * out FPGA image.
+	 */
+	return 0;
+}
+
+#ifdef CONFIG_OF
+static const struct of_device_id fpga_mgr_bus_of_match[] = {
+	{ .compatible = "fpga-mgr-bus", },
+	{},
+};
+
+MODULE_DEVICE_TABLE(of, fpga_mgr_bus_of_match);
+#endif
+
+static struct platform_driver fpga_mgr_bus_driver = {
+	.probe = fpga_mgr_bus_probe,
+	.remove = fpga_mgr_bus_remove,
+	.driver = {
+		.name	= "fpga_manager_bus",
+		.owner	= THIS_MODULE,
+		.of_match_table = of_match_ptr(fpga_mgr_bus_of_match),
+		.pm = &fpga_mgr_bus_pm_ops,
+	},
+};
+
+static int __init fpga_mgr_bus_init(void)
+{
+	return platform_driver_register(&fpga_mgr_bus_driver);
+}
+
+static void __exit fpga_mgr_bus_exit(void)
+{
+	platform_driver_unregister(&fpga_mgr_bus_driver);
+}
+
+module_init(fpga_mgr_bus_init);
+module_exit(fpga_mgr_bus_exit);
+
+MODULE_AUTHOR("Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>");
+MODULE_DESCRIPTION("Altera FPGA Manager Bus");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/fpga/fpga-mgr.c b/drivers/fpga/fpga-mgr.c
index 0e2eba4..93327ea 100644
--- a/drivers/fpga/fpga-mgr.c
+++ b/drivers/fpga/fpga-mgr.c
@@ -26,6 +26,7 @@
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/of_irq.h>
 #include <linux/pm.h>
 #include <linux/slab.h>
 #include <linux/uaccess.h>
@@ -228,6 +229,31 @@ static int fpga_mgr_ops_framework_status(struct fpga_manager *mgr, char *buf)
 	return ret;
 }
 
+/* Find the fpga manager that is pointed to by a phandle */
+struct fpga_manager *of_fpga_mgr_dev_lookup(struct device_node *node,
+					    const char *mgr_property,
+					    int *ret)
+{
+	struct fpga_manager *mgr;
+	struct device_node *mgr_node;
+
+	mgr_node = of_parse_phandle(node, mgr_property, 0);
+
+	if (!mgr_node) {
+		*ret = -ENODEV;
+		return NULL;
+	}
+
+	list_for_each_entry(mgr, &fpga_manager_list, list)
+		if (mgr_node == mgr->np)
+			return mgr;
+
+	*ret = -EPROBE_DEFER;
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(of_fpga_mgr_dev_lookup);
+
 static int fpga_mgr_suspend(struct device *dev)
 {
 	struct fpga_manager *mgr = dev_get_drvdata(dev);
diff --git a/include/linux/fpga-mgr.h b/include/linux/fpga-mgr.h
index 6af0873..35d3380 100644
--- a/include/linux/fpga-mgr.h
+++ b/include/linux/fpga-mgr.h
@@ -105,6 +105,10 @@ struct fpga_manager {
 
 #if IS_ENABLED(CONFIG_FPGA)
 
+struct fpga_manager *of_fpga_mgr_dev_lookup(struct device_node *node,
+					    const char *mgr_property,
+					    int *ret);
+
 int fpga_mgr_firmware_write(struct fpga_manager *mgr, const char *path);
 int fpga_mgr_write(struct fpga_manager *mgr, const char *buf, size_t count);
 int fpga_mgr_status_get(struct fpga_manager *mgr, char *buf);
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
