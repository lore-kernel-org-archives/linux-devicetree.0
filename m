Return-Path: <atull@opensource.altera.com>
From: Alan Tull <atull@opensource.altera.com>
Subject: [RFC PATCH 3/3] fpga sysfs interface
Date: Thu, 31 Jul 2014 16:59:04 -0500
Message-ID: <1406843944-7780-4-git-send-email-atull@opensource.altera.com>
In-Reply-To: <1406843944-7780-1-git-send-email-atull@opensource.altera.com>
References: <1406843944-7780-1-git-send-email-atull@opensource.altera.com>
MIME-Version: 1.0
Content-Type: text/plain
To: linux-kernel@vger.kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Pavel Machek <pavel@denx.de>, Mark Brown <broonie@kernel.org>, Philip Balister <philip@balister.org>, Alessandro Rubini <rubini@gnudd.com>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, Jason Cooper <jason@lakedaemon.net>, Kyle Teske <kyle.teske@ni.com>, Nicolas Pitre <nico@linaro.org>, Felipe Balbi <balbi@ti.com>, Mauro Carvalho Chehab <m.chehab@samsung.com>, David Brown <davidb@codeaurora.org>, Rob Landley <rob@landley.net>, "David S. Miller" <davem@davemloft.net>, Joe Perches <joe@perches.com>, Cesar Eduardo Barros <cesarb@cesarb.net>, Samuel Ortiz <sameo@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Michal Simek <monstr@monstr.eu>, Michal Simek <michal.simek@xilinx.com>, Alan Tull <delicious.quinoa@gmail.com>, Dinh Nguyen <dinguyen@opensource.altera.com>, Yves Vandervennet <yvanderv@opensource.altera.com>, Alan Tull <atull@opensource.altera.com>
List-ID: <devicetree@vger.kernel.org>

Add basic sysfs interface.  Only exports two files:

/sys/class/fpga_manager/fpga0/name
   Name of low level driver.

/sys/class/fpga_manager/fpga0/status
   status of fpga framework as returned by core
   fpga-mgr.c's fpga_mgr_ops_framework_status
   function or by the low level driver's status
   function.

Signed-off-by: Alan Tull <atull@opensource.altera.com>
---
 drivers/fpga/Kconfig     |    7 +++++
 drivers/fpga/Makefile    |    1 +
 drivers/fpga/fpga-mgr.c  |    2 ++
 drivers/fpga/sysfs.c     |   68 ++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/fpga-mgr.h |   12 ++++++++
 5 files changed, 90 insertions(+)
 create mode 100644 drivers/fpga/sysfs.c

diff --git a/drivers/fpga/Kconfig b/drivers/fpga/Kconfig
index 9a2c25b..113b8b4 100644
--- a/drivers/fpga/Kconfig
+++ b/drivers/fpga/Kconfig
@@ -17,4 +17,11 @@ config FPGA_MGR_BUS
 	help
 	  FPGA Manager Bus interface.  Allows loading FPGA images
 	  from Device Tree or from other drivers.
+
+config FPGA_MGR_SYSFS
+	bool "FPGA Manager SysFS Interface"
+	depends on FPGA
+	depends on SYSFS
+	help
+	  FPGA Manager SysFS interface.
 endmenu
diff --git a/drivers/fpga/Makefile b/drivers/fpga/Makefile
index e39911f..cad3d8c 100644
--- a/drivers/fpga/Makefile
+++ b/drivers/fpga/Makefile
@@ -7,5 +7,6 @@ fpga-mgr-core-y += fpga-mgr.o
 # Core FPGA Manager Framework
 obj-$(CONFIG_FPGA)			+= fpga-mgr-core.o
 obj-$(CONFIG_FPGA_MGR_BUS)		+= bus.o
+obj-$(CONFIG_FPGA_MGR_SYSFS)		+= sysfs.o
 
 # FPGA Manager Drivers
diff --git a/drivers/fpga/fpga-mgr.c b/drivers/fpga/fpga-mgr.c
index 32888d6..e5d1a09 100644
--- a/drivers/fpga/fpga-mgr.c
+++ b/drivers/fpga/fpga-mgr.c
@@ -402,6 +402,8 @@ static int __init fpga_mgr_dev_init(void)
 	if (IS_ERR(fpga_mgr_class))
 		return PTR_ERR(fpga_mgr_class);
 
+	fpga_mgr_sysfs_init(fpga_mgr_class);
+
 	ret = alloc_chrdev_region(&fpga_mgr_dev, 0, FPGA_MAX_MINORS,
 				  "fpga_manager");
 	if (ret) {
diff --git a/drivers/fpga/sysfs.c b/drivers/fpga/sysfs.c
new file mode 100644
index 0000000..58971b3
--- /dev/null
+++ b/drivers/fpga/sysfs.c
@@ -0,0 +1,68 @@
+/*
+ * FPGA Manager SysFS Interface
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
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/fs.h>
+#include <linux/slab.h>
+#include <linux/fpga-mgr.h>
+
+/*
+ * class attributes
+ */
+static ssize_t fpga_mgr_name_show(struct device *dev,
+				  struct device_attribute *attr, char *buf)
+{
+	struct fpga_manager *mgr = dev_get_drvdata(dev);
+
+	return fpga_mgr_name(mgr, buf);
+}
+
+static ssize_t fpga_mgr_status_show(struct device *dev,
+				    struct device_attribute *attr, char *buf)
+{
+	struct fpga_manager *mgr = dev_get_drvdata(dev);
+
+	return fpga_mgr_status_get(mgr, buf);
+}
+
+static DEVICE_ATTR(name, S_IRUGO, fpga_mgr_name_show, NULL);
+static DEVICE_ATTR(status, S_IRUGO, fpga_mgr_status_show, NULL);
+
+static struct attribute *fpga_mgr_attrs[] = {
+	&dev_attr_name.attr,
+	&dev_attr_status.attr,
+	NULL,
+};
+
+static const struct attribute_group fpga_mgr_group = {
+	.attrs = fpga_mgr_attrs,
+};
+
+const struct attribute_group *fpga_mgr_groups[] = {
+	&fpga_mgr_group,
+	NULL,
+};
+
+void fpga_mgr_sysfs_init(struct class *fpga_mgr_class)
+{
+	fpga_mgr_class->dev_groups = fpga_mgr_groups;
+}
+EXPORT_SYMBOL_GPL(fpga_mgr_sysfs_init);
+
+MODULE_DESCRIPTION("FPGA Manager framework driver sysfs interface");
+MODULE_LICENSE("GPL v2");
diff --git a/include/linux/fpga-mgr.h b/include/linux/fpga-mgr.h
index 35d3380..86eeff5 100644
--- a/include/linux/fpga-mgr.h
+++ b/include/linux/fpga-mgr.h
@@ -105,6 +105,18 @@ struct fpga_manager {
 
 #if IS_ENABLED(CONFIG_FPGA)
 
+#ifdef CONFIG_FPGA_MGR_SYSFS
+
+void fpga_mgr_sysfs_init(struct class *fpga_mgr_class);
+
+#else
+
+static inline void fpga_mgr_sysfs_init(struct class *fpga_mgr_class)
+{
+}
+
+#endif /* CONFIG_FPGA_MGR_SYSFS */
+
 struct fpga_manager *of_fpga_mgr_dev_lookup(struct device_node *node,
 					    const char *mgr_property,
 					    int *ret);
-- 
1.7.9.5
