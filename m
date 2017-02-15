From: matthew.gerlach@linux.intel.com
Subject: [PATCH 4/4] fpga pr ip: Platform driver for Altera Partial Reconfiguration IP.
Date: Wed, 15 Feb 2017 13:10:38 -0800
Message-ID: <1487193038-3490-5-git-send-email-matthew.gerlach@linux.intel.com>
References: <1487193038-3490-1-git-send-email-matthew.gerlach@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1487193038-3490-1-git-send-email-matthew.gerlach@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: atull@opensource.altera.com, moritz.fischer@ettus.com, linux-fpga@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: Matthew Gerlach <matthew.gerlach@linux.intel.com>
List-Id: devicetree@vger.kernel.org

From: Matthew Gerlach <matthew.gerlach@linux.intel.com>

This adds a platform bus driver for a fpga-mgr driver
that uses the Altera Partial Reconfiguration IP component.

Signed-off-by: Matthew Gerlach <matthew.gerlach@linux.intel.com>
---
 drivers/fpga/Kconfig                  |  7 ++++
 drivers/fpga/Makefile                 |  1 +
 drivers/fpga/altera-pr-ip-core-plat.c | 65 +++++++++++++++++++++++++++++++++++
 3 files changed, 73 insertions(+)
 create mode 100644 drivers/fpga/altera-pr-ip-core-plat.c

diff --git a/drivers/fpga/Kconfig b/drivers/fpga/Kconfig
index a46c173..40f75d0 100644
--- a/drivers/fpga/Kconfig
+++ b/drivers/fpga/Kconfig
@@ -68,6 +68,13 @@ config ALTERA_PR_IP_CORE
         help
           Core driver support for Altera Partial Reconfiguration IP component
 
+config ALTERA_PR_IP_CORE_PLAT
+	tristate "Platform support of Altera Partial Reconfiguration IP Core"
+	depends on ALTERA_PR_IP_CORE && OF
+	help
+	  Platform driver support for Altera Partial Reconfiguration IP
+	  component
+
 endif # FPGA
 
 endmenu
diff --git a/drivers/fpga/Makefile b/drivers/fpga/Makefile
index 82693d2..5b8ae2b 100644
--- a/drivers/fpga/Makefile
+++ b/drivers/fpga/Makefile
@@ -10,6 +10,7 @@ obj-$(CONFIG_FPGA_MGR_SOCFPGA)		+= socfpga.o
 obj-$(CONFIG_FPGA_MGR_SOCFPGA_A10)	+= socfpga-a10.o
 obj-$(CONFIG_FPGA_MGR_ZYNQ_FPGA)	+= zynq-fpga.o
 obj-$(CONFIG_ALTERA_PR_IP_CORE)         += altera-pr-ip-core.o
+obj-$(CONFIG_ALTERA_PR_IP_CORE_PLAT)    += altera-pr-ip-core-plat.o
 
 # FPGA Bridge Drivers
 obj-$(CONFIG_FPGA_BRIDGE)		+= fpga-bridge.o
diff --git a/drivers/fpga/altera-pr-ip-core-plat.c b/drivers/fpga/altera-pr-ip-core-plat.c
new file mode 100644
index 0000000..1c3e4b5
--- /dev/null
+++ b/drivers/fpga/altera-pr-ip-core-plat.c
@@ -0,0 +1,65 @@
+/*
+ * Driver for Altera Partial Reconfiguration IP Core
+ *
+ * Copyright (C) 2016-2017 Intel Corporation
+ *
+ * Based on socfpga-a10.c Copyright (C) 2015-2016 Altera Corporation
+ *  by Alan Tull <atull@opensource.altera.com>
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
+#include "altera-pr-ip-core.h"
+#include <linux/module.h>
+#include <linux/of_device.h>
+
+static int alt_pr_platform_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	void __iomem *reg_base;
+	struct resource *res;
+
+	/* First mmio base is for register access */
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+
+	reg_base = devm_ioremap_resource(dev, res);
+
+	if (IS_ERR(reg_base))
+		return PTR_ERR(reg_base);
+
+	return alt_pr_probe(dev, reg_base);
+}
+
+static int alt_pr_platform_remove(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+
+	return alt_pr_remove(dev);
+}
+
+static const struct of_device_id alt_pr_of_match[] = {
+	{ .compatible = "altr,pr-ip-core", },
+	{},
+};
+
+MODULE_DEVICE_TABLE(of, alt_pr_of_match);
+
+static struct platform_driver alt_pr_platform_driver = {
+	.probe = alt_pr_platform_probe,
+	.remove = alt_pr_platform_remove,
+	.driver = {
+		.name	= "alt_pr_ip_core",
+		.of_match_table = alt_pr_of_match,
+	},
+};
+
+module_platform_driver(alt_pr_platform_driver);
-- 
2.7.4
