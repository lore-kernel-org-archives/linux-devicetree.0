From: matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Subject: [PATCH v5 4/4] fpga pr ip: Platform driver for Altera Partial Reconfiguration IP.
Date: Fri, 10 Mar 2017 11:40:27 -0800
Message-ID: <1489174827-6033-5-git-send-email-matthew.gerlach@linux.intel.com>
References: <1489174827-6033-1-git-send-email-matthew.gerlach@linux.intel.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1489174827-6033-1-git-send-email-matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: atull-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org, linux-fpga-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, agust-ynQEQJNshbs@public.gmane.org
Cc: Matthew Gerlach <matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Matthew Gerlach <matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>

This adds a platform bus driver for a fpga-mgr driver
that uses the Altera Partial Reconfiguration IP component.

Signed-off-by: Matthew Gerlach <matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
---
v5: fix comment as suggested by Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
v4: v3 patch set mistakenly sent out labeled as v4
v3:
    s/altr,pr-ip/altr,a10-pr-ip/
    s/alt_pr_probe/alt_pr_register/
    s/alt_pr_remove/alt_pr_unregister/
    fix error found by kbuild robot with more precise Kconfig depends

v2: s/altr,pr-ip-core/altr,pr-ip/
---
 drivers/fpga/Kconfig                  |  7 ++++
 drivers/fpga/Makefile                 |  1 +
 drivers/fpga/altera-pr-ip-core-plat.c | 65 +++++++++++++++++++++++++++++++++++
 3 files changed, 73 insertions(+)
 create mode 100644 drivers/fpga/altera-pr-ip-core-plat.c

diff --git a/drivers/fpga/Kconfig b/drivers/fpga/Kconfig
index a46c173..0c51427 100644
--- a/drivers/fpga/Kconfig
+++ b/drivers/fpga/Kconfig
@@ -68,6 +68,13 @@ config ALTERA_PR_IP_CORE
         help
           Core driver support for Altera Partial Reconfiguration IP component
 
+config ALTERA_PR_IP_CORE_PLAT
+	tristate "Platform support of Altera Partial Reconfiguration IP Core"
+	depends on ALTERA_PR_IP_CORE && OF && HAS_IOMEM
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
index 0000000..cff189a
--- /dev/null
+++ b/drivers/fpga/altera-pr-ip-core-plat.c
@@ -0,0 +1,65 @@
+/*
+ * Driver for Altera Partial Reconfiguration IP Core
+ *
+ * Copyright (C) 2016-2017 Intel Corporation
+ *
+ * Based on socfpga-a10.c Copyright (C) 2015-2016 Altera Corporation
+ *  by Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
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
+	return alt_pr_register(dev, reg_base);
+}
+
+static int alt_pr_platform_remove(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+
+	return alt_pr_unregister(dev);
+}
+
+static const struct of_device_id alt_pr_of_match[] = {
+	{ .compatible = "altr,a10-pr-ip", },
+	{},
+};
+
+MODULE_DEVICE_TABLE(of, alt_pr_of_match);
+
+static struct platform_driver alt_pr_platform_driver = {
+	.probe = alt_pr_platform_probe,
+	.remove = alt_pr_platform_remove,
+	.driver = {
+		.name	= "alt_a10_pr_ip",
+		.of_match_table = alt_pr_of_match,
+	},
+};
+
+module_platform_driver(alt_pr_platform_driver);
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
