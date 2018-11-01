From: Atish Patra <atish.patra@wdc.com>
Subject: [RFC 2/2] RISC-V: Introduce cpu topology.
Date: Thu,  1 Nov 2018 16:04:28 -0700
Message-ID: <1541113468-22097-3-git-send-email-atish.patra@wdc.com>
References: <1541113468-22097-1-git-send-email-atish.patra@wdc.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1541113468-22097-1-git-send-email-atish.patra@wdc.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-riscv@lists.infradead.org
Cc: palmer@sifive.com, anup@brainfault.org, hch@infradead.org, Damien.LeMoal@wdc.com, tglx@linutronix.de, mark.rutland@arm.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org, alankao@andestech.com, zong@andestech.com
List-Id: devicetree@vger.kernel.org

Currently, cpu topology is not defined for RISC-V.

Parse cpu-topology from a new DT entry "cpu-topology"
to create different cpu sibling maps.
As of now, only bare minimum requirements are implemented
but it is capable of describing any type of topology in future.

CPU topology after applying the patch.
$cat /sys/devices/system/cpu/cpu2/topology/core_siblings_list
0-3
$cat /sys/devices/system/cpu/cpu3/topology/core_siblings_list
0-3
$cat /sys/devices/system/cpu/cpu3/topology/physical_package_id
0
$cat /sys/devices/system/cpu/cpu3/topology/core_id
3

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/include/asm/topology.h |  28 ++++++
 arch/riscv/kernel/Makefile        |   1 +
 arch/riscv/kernel/smpboot.c       |   5 +-
 arch/riscv/kernel/topology.c      | 194 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 227 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/include/asm/topology.h
 create mode 100644 arch/riscv/kernel/topology.c

diff --git a/arch/riscv/include/asm/topology.h b/arch/riscv/include/asm/topology.h
new file mode 100644
index 00000000..d412edc8
--- /dev/null
+++ b/arch/riscv/include/asm/topology.h
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#ifndef __ASM_TOPOLOGY_H
+#define __ASM_TOPOLOGY_H
+
+#include <linux/cpumask.h>
+#include <asm-generic/topology.h>
+
+struct riscv_cpu_topology {
+	int core_id;
+	int package_id;
+	int hart_id;
+	cpumask_t thread_sibling;
+	cpumask_t core_sibling;
+};
+
+extern struct riscv_cpu_topology cpu_topology[NR_CPUS];
+
+#define topology_physical_package_id(cpu)	(cpu_topology[cpu].package_id)
+#define topology_core_id(cpu)		(cpu_topology[cpu].core_id)
+#define topology_core_cpumask(cpu)	(&cpu_topology[cpu].core_sibling)
+#define topology_sibling_cpumask(cpu)	(&cpu_topology[cpu].thread_sibling)
+
+void init_cpu_topology(void);
+void remove_cpu_topology(unsigned int cpuid);
+void set_topology_masks(unsigned int cpuid);
+
+#endif /* _ASM_RISCV_TOPOLOGY_H */
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index e1274fc0..128766f8 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -27,6 +27,7 @@ obj-y	+= riscv_ksyms.o
 obj-y	+= stacktrace.o
 obj-y	+= vdso.o
 obj-y	+= cacheinfo.o
+obj-y	+= topology.o
 obj-y	+= vdso/
 
 CFLAGS_setup.o := -mcmodel=medany
diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 56abab6a..1324f4b2 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -45,6 +45,7 @@ void __init smp_prepare_boot_cpu(void)
 
 void __init smp_prepare_cpus(unsigned int max_cpus)
 {
+	init_cpu_topology();
 }
 
 void __init setup_smp(void)
@@ -98,13 +99,15 @@ void __init smp_cpus_done(unsigned int max_cpus)
 asmlinkage void __init smp_callin(void)
 {
 	struct mm_struct *mm = &init_mm;
+	int cpu = smp_processor_id();
 
 	/* All kernel threads share the same mm context.  */
 	atomic_inc(&mm->mm_count);
 	current->active_mm = mm;
 
 	trap_init();
-	notify_cpu_starting(smp_processor_id());
+	notify_cpu_starting(cpu);
+	set_topology_masks(cpu);
 	set_cpu_online(smp_processor_id(), 1);
 	local_flush_tlb_all();
 	local_irq_enable();
diff --git a/arch/riscv/kernel/topology.c b/arch/riscv/kernel/topology.c
new file mode 100644
index 00000000..5195de14
--- /dev/null
+++ b/arch/riscv/kernel/topology.c
@@ -0,0 +1,194 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2018 Western Digital Corporation or its affiliates.
+ *
+ * Based on the arm64 version arch/arm64/kernel/topology.c
+ *
+ */
+
+#include <linux/cpu.h>
+#include <linux/cpumask.h>
+#include <linux/of.h>
+#include <linux/smp.h>
+#include <linux/string.h>
+
+#include <asm/topology.h>
+
+/*
+ * cpu topology array
+ */
+struct riscv_cpu_topology cpu_topology[NR_CPUS];
+EXPORT_SYMBOL_GPL(cpu_topology);
+
+void set_topology_masks(unsigned int cpuid)
+{
+	struct riscv_cpu_topology *ctopo, *cpuid_topo = &cpu_topology[cpuid];
+	int cpu;
+
+	/* update core and thread sibling masks */
+	for_each_online_cpu(cpu) {
+		ctopo = &cpu_topology[cpu];
+
+		if (cpuid_topo->package_id != ctopo->package_id)
+			continue;
+
+		cpumask_set_cpu(cpuid, &ctopo->core_sibling);
+		cpumask_set_cpu(cpu, &cpuid_topo->core_sibling);
+
+		if (cpuid_topo->core_id != ctopo->core_id)
+			continue;
+
+		cpumask_set_cpu(cpuid, &ctopo->thread_sibling);
+		cpumask_set_cpu(cpu, &cpuid_topo->thread_sibling);
+	}
+}
+
+static int __init get_hartid_for_cnode(struct device_node *node,
+				       unsigned int count)
+{
+	char name[10];
+	struct device_node *cpu_node;
+	int cpu;
+
+	snprintf(name, sizeof(name), "cpu%d", count);
+	cpu_node = of_parse_phandle(node, name, 0);
+	if (!cpu_node)
+		return -1;
+
+	cpu = of_cpu_node_to_id(cpu_node);
+	if (cpu < 0)
+		pr_err("Unable to find CPU node for %pOF\n", cpu_node);
+
+	of_node_put(cpu_node);
+	return cpu;
+}
+
+static int __init parse_core(struct device_node *core, int pid)
+{
+	char name[10];
+	struct device_node *cnode;
+	int count, hid = 0;
+	int coreid = 0;
+	bool found_hart = false;
+
+	do {
+		snprintf(name, sizeof(name), "core%d", coreid);
+		cnode = of_get_child_by_name(core, name);
+		if (cnode) {
+			count = 0;
+			do {
+				hid = get_hartid_for_cnode(cnode, count);
+				if (hid >= 0) {
+					found_hart = true;
+					cpu_topology[hid].package_id = pid;
+					cpu_topology[hid].core_id = coreid;
+					cpu_topology[hid].hart_id = hid;
+				}
+				count++;
+			} while (hid >= 0);
+			coreid++;
+			of_node_put(cnode);
+		}
+	} while (cnode);
+
+	if (!found_hart) {
+		pr_err("%pOF: no hart found\n", cnode);
+		of_node_put(cnode);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+static int __init parse_package(struct device_node *package)
+{
+	char name[10];
+	struct device_node *pnode;
+	int ret, package_id = 0;
+
+	/*
+	 * Current RISC-V system doesn't have child package node. It has a
+	 * flat package hierarchy. Once, we have such a system, the following
+	 * code can be modified to support that.
+	 */
+	do {
+		snprintf(name, sizeof(name), "package%d", package_id);
+		pnode = of_get_child_by_name(package, name);
+		if (pnode) {
+			ret = parse_core(pnode, package_id);
+			if (ret < 0)
+				pr_warn("%pOF: empty package\n", package);
+
+			package_id++;
+		}
+	} while (pnode);
+
+	return 0;
+}
+
+static int __init parse_dt_topology(void)
+{
+	struct device_node *cn, *map;
+	int ret = 0;
+	int cpu;
+
+	cn = of_find_node_by_path("/cpus");
+	if (!cn) {
+		pr_err("No CPU information found in DT\n");
+		return 0;
+	}
+
+	map = of_get_child_by_name(cn, "cpu-topology");
+	if (!map)
+		goto out;
+
+	ret = parse_package(map);
+	if (ret != 0)
+		goto out_map;
+
+	/*
+	 * Check that all cores are in the topology; the SMP code will
+	 * only mark cores described in the DT as possible.
+	 */
+	for_each_possible_cpu(cpu)
+		if (cpu_topology[cpu].package_id == -1)
+			ret = -EINVAL;
+
+out_map:
+	of_node_put(map);
+out:
+	of_node_put(cn);
+	return ret;
+}
+
+static void clear_all_topology_masks(int cpu)
+{
+	struct riscv_cpu_topology *ctopo = &cpu_topology[cpu];
+
+	cpumask_clear(&ctopo->core_sibling);
+	cpumask_set_cpu(cpu, &ctopo->core_sibling);
+	cpumask_clear(&ctopo->thread_sibling);
+	cpumask_set_cpu(cpu, &ctopo->thread_sibling);
+}
+
+static void __init reset_cpu_topology(void)
+{
+	unsigned int cpu;
+
+	for_each_possible_cpu(cpu) {
+		struct riscv_cpu_topology *ctopo = &cpu_topology[cpu];
+
+		ctopo->hart_id = 0;
+		ctopo->core_id = 0;
+		ctopo->package_id = -1;
+
+		clear_all_topology_masks(cpu);
+	}
+}
+
+void __init init_cpu_topology(void)
+{
+	reset_cpu_topology();
+
+	if (of_have_populated_dt() && parse_dt_topology())
+		reset_cpu_topology();
+}
-- 
2.7.4
