From: Jamie Iles <jamie@jamieiles.com>
Subject: [RFC PATCH] : add a generic clk based cpufreq driver
Date: Fri,  5 Aug 2011 14:30:10 +0100
Message-ID: <1312551010-24723-1-git-send-email-jamie@jamieiles.com>
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
To: cpufreq@vger.kernel.org
Cc: devicetree-discuss@lists.ozlabs.org, Jamie Iles <jamie@jamieiles.com>, Dave Jones <davej@redhat.com>
List-Id: devicetree@vger.kernel.org

This patch adds support for a generic clk based cpufreq driver using the
device tree.  Each cpu node must have a cpu-clock property that defines
the clock to use to set the CPU frequency and a clock-frequency property
that defines the maximum speed.

Cc: Dave Jones <davej@redhat.com>
Cc: Signed-off-by: Jamie Iles <jamie@jamieiles.com>
---

There are a few potential issues to be resolved here so any feedback would be
much appreciated.  In particular, I'm not sure how best to document the bindings
as there isn't a compatible property.  Related to this is the initialisation; at
the moment the platform is required to call generic_clk_cpufreq_init() as I
can't think of a sensible way to do this automatically without lots of machine
compatibility tests.

The final one is the transition latency and how to get that from the DT.  The
most logical place is in the clock node and parse the phandle of the clock from
the cpu node then read something like a transition-latency property, but I'm not
sure if that's best.

 drivers/cpufreq/Kconfig       |   12 +++
 drivers/cpufreq/Makefile      |    4 +
 drivers/cpufreq/clk-cpufreq.c |  157 +++++++++++++++++++++++++++++++++++++++++
 include/linux/cpufreq.h       |   12 +++
 4 files changed, 185 insertions(+), 0 deletions(-)
 create mode 100644 drivers/cpufreq/clk-cpufreq.c

diff --git a/drivers/cpufreq/Kconfig b/drivers/cpufreq/Kconfig
index e24a2a1..70b4d6f 100644
--- a/drivers/cpufreq/Kconfig
+++ b/drivers/cpufreq/Kconfig
@@ -194,5 +194,17 @@ depends on PPC32 || PPC64
 source "drivers/cpufreq/Kconfig.powerpc"
 endmenu
 
+menu "Generic CPU frequency scaling drivers"
+
+config GENERIC_CLK_CPUFREQ
+	bool "Generic CLK based CPU frequency scaling driver"
+	depends on HAVE_CLK && OF
+	help
+	  This adds support for a generic CPU frequency scaling driver using the
+	  clk framework.  The driver uses the device tree to obtain the clks for
+	  the CPUs.
+
+endmenu
+
 endif
 endmenu
diff --git a/drivers/cpufreq/Makefile b/drivers/cpufreq/Makefile
index a48bc02..4c2914d 100644
--- a/drivers/cpufreq/Makefile
+++ b/drivers/cpufreq/Makefile
@@ -47,3 +47,7 @@ obj-$(CONFIG_ARM_EXYNOS4210_CPUFREQ)	+= exynos4210-cpufreq.o
 ##################################################################################
 # PowerPC platform drivers
 obj-$(CONFIG_CPU_FREQ_MAPLE)		+= maple-cpufreq.o
+
+##################################################################################
+# Generic cpufreq drivers
+obj-$(CONFIG_GENERIC_CLK_CPUFREQ)	+= clk-cpufreq.o
diff --git a/drivers/cpufreq/clk-cpufreq.c b/drivers/cpufreq/clk-cpufreq.c
new file mode 100644
index 0000000..0c1fc2a
--- /dev/null
+++ b/drivers/cpufreq/clk-cpufreq.c
@@ -0,0 +1,157 @@
+/*
+ * Copyright (c) 2011 picoChip Designs Ltd., Jamie Iles
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This driver uses the clk API to control the frequency of the CPU cores.  Each
+ * CPU in the device tree must have a cpu-clock property that defines the clk
+ * that controls the CPU frequency and a clock-frequency property (u32) that
+ * defines the maximum frequency to scale the core to.
+ */
+#include <linux/clk.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/cpufreq.h>
+#include <linux/of.h>
+#include <linux/of_clk.h>
+#include <linux/percpu.h>
+#include <linux/smp.h>
+
+static DEFINE_PER_CPU(struct clk *, cpu_clk);
+
+static struct device_node *get_this_cpu_node(void)
+{
+	unsigned int cpu_id = smp_processor_id();
+	struct device_node *cpus, *np;
+
+	cpus = of_find_node_by_path("/cpus");
+	if (!cpus)
+		return NULL;
+
+	for_each_child_of_node(cpus, np) {
+		u32 reg;
+
+		if (of_property_read_u32(np, "reg", &reg)) {
+			pr_err("cpu node %u has no reg property\n", cpu_id);
+			continue;
+		}
+
+		if (reg == cpu_id) {
+			of_node_put(cpus);
+			return np;
+		}
+	}
+
+	of_node_put(np);
+	of_node_put(cpus);
+
+	return NULL;
+}
+
+static int clk_cpufreq_init(struct cpufreq_policy *policy)
+{
+	struct device_node *np = get_this_cpu_node();
+	struct clk *clk;
+	u32 max_freq;
+	int err;
+
+	if (of_property_read_u32(np, "clock-frequency", &max_freq)) {
+		pr_err("no clock-frequency property for cpu %u\n",
+		       smp_processor_id());
+		err = -EINVAL;
+		goto out;
+	}
+
+	clk = of_clk_get(np, "cpu");
+	if (IS_ERR(clk)) {
+		err = PTR_ERR(clk);
+		goto out;
+	}
+
+	policy->cpuinfo.max_freq = max_freq / 1000;
+	policy->cpuinfo.min_freq = clk_round_rate(clk, 0) / 1000;
+	policy->cpuinfo.transition_latency = CPUFREQ_ETERNAL;
+	policy->min = policy->cpuinfo.min_freq;
+	policy->max = policy->cpuinfo.max_freq;
+	policy->cur = clk_get_rate(clk) / 1000;
+
+	__get_cpu_var(cpu_clk) = clk;
+
+	return 0;
+
+out:
+	of_node_put(np);
+	return err;
+}
+
+static int clk_cpufreq_verify(struct cpufreq_policy *policy)
+{
+	struct clk *clk = per_cpu(cpu_clk, policy->cpu);
+
+	cpufreq_verify_within_limits(policy, policy->cpuinfo.min_freq,
+				     policy->cpuinfo.max_freq);
+	policy->min = clk_round_rate(clk, policy->min * 1000) / 1000;
+	policy->max = clk_round_rate(clk, policy->max * 1000) / 1000;
+	cpufreq_verify_within_limits(policy, policy->cpuinfo.min_freq,
+				     policy->cpuinfo.max_freq);
+
+	return 0;
+}
+
+static int clk_cpufreq_target(struct cpufreq_policy *policy,
+			      unsigned int target, unsigned int relation)
+{
+	struct clk *clk = per_cpu(cpu_clk, policy->cpu);
+	struct cpufreq_freqs freqs;
+	int ret;
+
+	freqs.old = clk_get_rate(clk) / 1000;
+	freqs.new = target;
+	freqs.cpu = policy->cpu;
+
+	if (freqs.new == freqs.old)
+		return 0;
+
+	cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
+
+	ret = clk_set_rate(clk, target * 1000);
+	if (ret) {
+		pr_err("unable to set cpufreq rate to %u\n", target);
+		freqs.new = freqs.old;
+	} else {
+		freqs.new = clk_get_rate(clk) / 1000;
+	}
+
+	cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
+
+	return ret;
+}
+
+static unsigned int clk_cpufreq_get(unsigned int cpu)
+{
+	struct clk *clk = per_cpu(cpu_clk, cpu);
+
+	return clk_get_rate(clk) / 1000;
+}
+
+static struct cpufreq_driver clk_cpufreq_driver = {
+	.owner		= THIS_MODULE,
+	.flags		= CPUFREQ_STICKY,
+	.name		= "generic-clk",
+	.init		= clk_cpufreq_init,
+	.verify		= clk_cpufreq_verify,
+	.target		= clk_cpufreq_target,
+	.get		= clk_cpufreq_get,
+};
+
+int generic_clk_cpufreq_init(void)
+{
+	return cpufreq_register_driver(&clk_cpufreq_driver);
+}
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Generic clk based cpufreq driver");
+MODULE_AUTHOR("Jamie Iles");
diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
index 6216115..dbcca1a 100644
--- a/include/linux/cpufreq.h
+++ b/include/linux/cpufreq.h
@@ -404,5 +404,17 @@ void cpufreq_frequency_table_get_attr(struct cpufreq_frequency_table *table,
 
 void cpufreq_frequency_table_put_attr(unsigned int cpu);
 
+/*********************************************************************
+ *                     COMMON CPUFREQ DRIVERS                        *
+ *********************************************************************/
+
+#ifdef CONFIG_GENERIC_CLK_CPUFREQ
+extern int generic_clk_cpufreq_init(void);
+#else /* CONFIG_GENERIC_CLK_CPUFREQ */
+static inline int generic_clk_cpufreq_init(void)
+{
+	return -ENOSYS;
+}
+#endif /* CONFIG_GENERIC_CLK_CPUFREQ */
 
 #endif /* _LINUX_CPUFREQ_H */
-- 
1.7.4.1

