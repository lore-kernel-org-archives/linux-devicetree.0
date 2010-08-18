From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: [RFC PATCH 11/14] ARM: PMU: add device tree probing
Date: Wed, 18 Aug 2010 19:59:57 +0100
Message-ID: <1282158000-23081-12-git-send-email-lorenzo.pieralisi@arm.com>
References: <1282158000-23081-1-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-2-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-3-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-4-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-5-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-6-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-7-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-8-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-9-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-10-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-11-git-send-email-lorenzo.pieralisi@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1282158000-23081-11-git-send-email-lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, philippe.robin-5wv7dgnIgG8@public.gmane.org, jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org
List-Id: devicetree@vger.kernel.org

When OF is enabled, platform drivers are required to define a
match table in order to allow the kernel to find drivers suitable
for a given device. The device tree allows to retrieve resources
from device tree nodes dynamically.

This patch adds device tree support to the ARM PMU driver. This
includes a match table and code to initialize the driver id from
the respective device tree node compatible property.

Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
---
 arch/arm/include/asm/pmu.h |    6 ++++++
 arch/arm/kernel/Makefile   |    3 ++-
 arch/arm/kernel/pmu-of.c   |   30 ++++++++++++++++++++++++++++++
 arch/arm/kernel/pmu.c      |   18 ++++++++++++------
 4 files changed, 50 insertions(+), 7 deletions(-)
 create mode 100644 arch/arm/kernel/pmu-of.c

diff --git a/arch/arm/include/asm/pmu.h b/arch/arm/include/asm/pmu.h
index 8ccea01..d317b64 100644
--- a/arch/arm/include/asm/pmu.h
+++ b/arch/arm/include/asm/pmu.h
@@ -17,6 +17,12 @@ enum arm_pmu_type {
 	ARM_NUM_PMU_DEVICES,
 };
 
+#ifndef CONFIG_OF
+static inline int pmu_probe_dt(struct platform_device *pdev) { return -ENODEV; }
+#else
+extern int __devinit pmu_probe_dt(struct platform_device *pdev);
+#endif
+
 #ifdef CONFIG_CPU_HAS_PMU
 
 /**
diff --git a/arch/arm/kernel/Makefile b/arch/arm/kernel/Makefile
index 0ace897..b7d846f 100644
--- a/arch/arm/kernel/Makefile
+++ b/arch/arm/kernel/Makefile
@@ -48,7 +48,8 @@ obj-$(CONFIG_CPU_XSCALE)	+= xscale-cp0.o
 obj-$(CONFIG_CPU_XSC3)		+= xscale-cp0.o
 obj-$(CONFIG_CPU_MOHAWK)	+= xscale-cp0.o
 obj-$(CONFIG_IWMMXT)		+= iwmmxt.o
-obj-$(CONFIG_CPU_HAS_PMU)	+= pmu.o
+pmu_of-$(CONFIG_OF)		:= pmu-of.o
+obj-$(CONFIG_CPU_HAS_PMU)	+= pmu.o $(pmu_of-y)
 obj-$(CONFIG_HW_PERF_EVENTS)	+= perf_event.o
 AFLAGS_iwmmxt.o			:= -Wa,-mcpu=iwmmxt
 
diff --git a/arch/arm/kernel/pmu-of.c b/arch/arm/kernel/pmu-of.c
new file mode 100644
index 0000000..5c5ee94
--- /dev/null
+++ b/arch/arm/kernel/pmu-of.c
@@ -0,0 +1,30 @@
+/*
+ *  linux/arch/arm/kernel/pmu-of.c --  PMU DT probe function
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ */
+
+#include <linux/kernel.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+
+#include <asm/pmu.h>
+
+int __devinit pmu_probe_dt(struct platform_device *pdev)
+{
+	int ret = -ENODEV;
+	struct device_node *node = pdev->dev.of_node;
+
+	if (of_device_is_compatible(node, "arm,arm-pmu")) {
+		pdev->id = ARM_PMU_DEVICE_CPU;
+		ret = 0;
+	} else {
+		pr_warning("Probing device not recognized "
+				"device %s\n", node->full_name);
+	}
+
+	return ret;
+}
diff --git a/arch/arm/kernel/pmu.c b/arch/arm/kernel/pmu.c
index b8af96e..f070b3d 100644
--- a/arch/arm/kernel/pmu.c
+++ b/arch/arm/kernel/pmu.c
@@ -27,12 +27,12 @@ static struct platform_device *pmu_devices[ARM_NUM_PMU_DEVICES];
 
 static int __devinit pmu_device_probe(struct platform_device *pdev)
 {
-
-	if (pdev->id < 0 || pdev->id >= ARM_NUM_PMU_DEVICES) {
-		pr_warning("received registration request for unknown "
-				"device %d\n", pdev->id);
-		return -EINVAL;
-	}
+	if (pmu_probe_dt(pdev) == -ENODEV)
+		if (pdev->id < 0 || pdev->id >= ARM_NUM_PMU_DEVICES) {
+			pr_warning("received registration request for unknown "
+					"device %d\n", pdev->id);
+			return -EINVAL;
+		}
 
 	if (pmu_devices[pdev->id])
 		pr_warning("registering new PMU device type %d overwrites "
@@ -45,6 +45,11 @@ static int __devinit pmu_device_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static struct of_device_id arm_pmu_matches[] = {
+	{ .compatible = "arm,arm-pmu"},
+	{},
+};
+
 static struct platform_driver pmu_driver = {
 	.driver		= {
 		.name	= "arm-pmu",
@@ -54,6 +59,7 @@ static struct platform_driver pmu_driver = {
 
 static int __init register_pmu_driver(void)
 {
+	platform_init_match(&pmu_driver, arm_pmu_matches);
 	return platform_driver_register(&pmu_driver);
 }
 device_initcall(register_pmu_driver);
-- 
1.6.3.3
