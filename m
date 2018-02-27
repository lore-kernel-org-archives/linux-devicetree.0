Return-Path: <>
From: Gaku Inami <gaku.inami.xh@renesas.com>
Subject: [PATCH 5/5] soc: renesas: rcar-topology: Add support to be aware cpu capacity
Date: Tue, 27 Feb 2018 11:19:55 +0900
Message-Id: <1519697995-6061-6-git-send-email-gaku.inami.xh@renesas.com>
In-Reply-To: <1519697995-6061-1-git-send-email-gaku.inami.xh@renesas.com>
References: <1519697995-6061-1-git-send-email-gaku.inami.xh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Gaku Inami <gaku.inami.xh@renesas.com>
List-ID: <devicetree@vger.kernel.org>

Some R-Car SoCs support big LITTLE architecture produced by ARM, that
have different power/performance characteristics between each CPUs.
In order to aware such as difference, this patch changes the sched
domain flags that the tasks can be scheduled with capacity awareness.
If you use big LITTLE without this patch, the scheduler may make
unintended behaviors.

Signed-off-by: Gaku Inami <gaku.inami.xh@renesas.com>
---
 drivers/soc/renesas/Kconfig         |  4 ++++
 drivers/soc/renesas/Makefile        |  1 +
 drivers/soc/renesas/rcar-topology.c | 36 ++++++++++++++++++++++++++++++++++++
 3 files changed, 41 insertions(+)
 create mode 100644 drivers/soc/renesas/rcar-topology.c

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 6efd7be..296bdee 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -16,6 +16,7 @@ config SOC_RENESAS
 	select SYSC_R8A7796 if ARCH_R8A7796
 	select SYSC_R8A77970 if ARCH_R8A77970
 	select SYSC_R8A77995 if ARCH_R8A77995
+	select RCAR_CPU_TOPOLOGY if ARCH_R8A7795 || ARCH_R8A7796
 
 if SOC_RENESAS
 
@@ -71,4 +72,7 @@ config RST_RCAR
 config SYSC_RCAR
 	bool "R-Car System Controller support" if COMPILE_TEST
 
+config RCAR_CPU_TOPOLOGY
+	bool "R-Car CPU Topology" if COMPILE_TEST
+
 endif # SOC_RENESAS
diff --git a/drivers/soc/renesas/Makefile b/drivers/soc/renesas/Makefile
index 845d62a..244f243 100644
--- a/drivers/soc/renesas/Makefile
+++ b/drivers/soc/renesas/Makefile
@@ -18,3 +18,4 @@ obj-$(CONFIG_SYSC_R8A77995)	+= r8a77995-sysc.o
 # Family
 obj-$(CONFIG_RST_RCAR)		+= rcar-rst.o
 obj-$(CONFIG_SYSC_RCAR)		+= rcar-sysc.o
+obj-$(CONFIG_RCAR_CPU_TOPOLOGY)	+= rcar-topology.o
diff --git a/drivers/soc/renesas/rcar-topology.c b/drivers/soc/renesas/rcar-topology.c
new file mode 100644
index 0000000..7e941cf
--- /dev/null
+++ b/drivers/soc/renesas/rcar-topology.c
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ *  R-Car CPU topology for ARM big.LITTLE platforms
+ *
+ * Copyright (C) 2018 Renesas Electronics Corporation.
+ *
+ */
+
+#include <linux/cpuset.h>
+#include <linux/init.h>
+#include <linux/of.h>
+#include <linux/sched/topology.h>
+#include <linux/topology.h>
+
+static int rcar_cpu_cpu_flags(void)
+{
+	return SD_ASYM_CPUCAPACITY;
+}
+
+static struct sched_domain_topology_level rcar_topology[] = {
+#ifdef CONFIG_SCHED_MC
+	{ cpu_coregroup_mask, cpu_core_flags, SD_INIT_NAME(MC) },
+#endif
+	{ cpu_cpu_mask, rcar_cpu_cpu_flags, SD_INIT_NAME(DIE) },
+	{ NULL, }
+};
+
+static int __init rcar_topology_init(void)
+{
+	if (of_machine_is_compatible("renesas,r8a7795") ||
+	    of_machine_is_compatible("renesas,r8a7796"))
+		set_sched_topology(rcar_topology);
+
+	return 0;
+}
+early_initcall(rcar_topology_init);
-- 
2.7.4
