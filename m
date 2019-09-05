From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 15/19] MIPS: Loongson64: Load built-in dtbs
Date: Thu,  5 Sep 2019 22:43:12 +0800
Message-ID: <20190905144316.12527-16-jiaxun.yang@flygoat.com>
References: <20190905144316.12527-1-jiaxun.yang@flygoat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190905144316.12527-1-jiaxun.yang@flygoat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@vger.kernel.org
Cc: chenhc@lemote.com, paul.burton@mips.com, tglx@linutronix.de, jason@lakedaemon.net, maz@kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.co, devicetree@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
List-Id: devicetree@vger.kernel.org

Load proper dtb according to firmware passed parameters and
CPU PRID.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 .../asm/mach-loongson64/builtin_dtbs.h        | 16 ++++++++++++
 .../include/asm/mach-loongson64/loongson64.h  |  2 ++
 arch/mips/loongson64/env.c                    | 26 +++++++++++++++++++
 arch/mips/loongson64/setup.c                  | 16 ++++++++++++
 4 files changed, 60 insertions(+)
 create mode 100644 arch/mips/include/asm/mach-loongson64/builtin_dtbs.h

diff --git a/arch/mips/include/asm/mach-loongson64/builtin_dtbs.h b/arch/mips/include/asm/mach-loongson64/builtin_dtbs.h
new file mode 100644
index 000000000000..38063c7d20b1
--- /dev/null
+++ b/arch/mips/include/asm/mach-loongson64/builtin_dtbs.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (C) 2019 Jiaxun Yang <jiaxun.yang@flygoat.com>
+ *
+ * Built-in Generic dtbs for MACH_LOONGSON64
+ */
+
+#ifndef __ASM_MACH_LOONGSON64_BUILTIN_DTBS_H_
+#define __ASM_MACH_LOONGSON64_BUILTIN_DTBS_H_
+
+extern u32 __dtb_3a1000_780e_begin[];
+extern u32 __dtb_3a2000_780e_begin[];
+extern u32 __dtb_3a3000_780e_begin[];
+extern u32 __dtb_3b1x00_780e_begin[];
+
+#endif
diff --git a/arch/mips/include/asm/mach-loongson64/loongson64.h b/arch/mips/include/asm/mach-loongson64/loongson64.h
index ace91d52744e..58e07b7d835f 100644
--- a/arch/mips/include/asm/mach-loongson64/loongson64.h
+++ b/arch/mips/include/asm/mach-loongson64/loongson64.h
@@ -45,4 +45,6 @@ extern u64 loongson_freqctrl[MAX_PACKAGES];
 
 extern const struct plat_smp_ops loongson3_smp_ops;
 extern void __init prom_init_lefi(void);
+extern void *loongson_fdt_blob;
+
 #endif
diff --git a/arch/mips/loongson64/env.c b/arch/mips/loongson64/env.c
index 93658cfbf3a6..34b4d77097f2 100644
--- a/arch/mips/loongson64/env.c
+++ b/arch/mips/loongson64/env.c
@@ -20,6 +20,7 @@
 
 #include <loongson64.h>
 #include <boot_param.h>
+#include <builtin_dtbs.h>
 #include <workarounds.h>
 
 u32 cpu_clock_freq;
@@ -126,6 +127,31 @@ void __init prom_init_lefi(void)
 		loongson_sysconf.cores_per_node - 1) /
 		loongson_sysconf.cores_per_node;
 
+	if ((read_c0_prid() & PRID_IMP_MASK) == PRID_IMP_LOONGSON_64) {
+		switch (read_c0_prid() & PRID_REV_MASK) {
+		case PRID_REV_LOONGSON3A_R1:
+			loongson_fdt_blob = __dtb_3a1000_780e_begin;
+			break;
+		case PRID_REV_LOONGSON3A_R2_0:
+		case PRID_REV_LOONGSON3A_R2_1:
+			loongson_fdt_blob = __dtb_3a2000_780e_begin;
+			break;
+		case PRID_REV_LOONGSON3A_R3_0:
+		case PRID_REV_LOONGSON3A_R3_1:
+			loongson_fdt_blob = __dtb_3a3000_780e_begin;
+			break;
+		case PRID_REV_LOONGSON3B_R1:
+		case PRID_REV_LOONGSON3B_R2:
+			loongson_fdt_blob = __dtb_3b1x00_780e_begin;
+			break;
+		default:
+			break;
+		}
+	}
+
+	if (!loongson_fdt_blob)
+		pr_err("Failed to determine built-in Loongson64 dtb\n");
+
 	loongson_sysconf.pci_mem_start_addr = eirq_source->pci_mem_start_addr;
 	loongson_sysconf.pci_mem_end_addr = eirq_source->pci_mem_end_addr;
 	loongson_sysconf.pci_io_base = eirq_source->pci_io_start_addr;
diff --git a/arch/mips/loongson64/setup.c b/arch/mips/loongson64/setup.c
index ed014374780a..3b850b3128ea 100644
--- a/arch/mips/loongson64/setup.c
+++ b/arch/mips/loongson64/setup.c
@@ -7,9 +7,15 @@
 #include <asm/setup.h>
 #include <asm/smp-ops.h>
 #include <asm/cacheflush.h>
+#include <linux/libfdt.h>
+#include <linux/of_fdt.h>
+
+#include <asm/prom.h>
 
 #include <loongson64.h>
 
+void *loongson_fdt_blob;
+
 static void wbflush_loongson(void)
 {
 	asm(".set\tpush\n\t"
@@ -81,6 +87,8 @@ void __init prom_free_prom_memory(void)
 
 void __init plat_mem_setup(void)
 {
+	if (loongson_fdt_blob)
+		__dt_setup_arch(loongson_fdt_blob);
 }
 
 void __init plat_time_init(void)
@@ -89,3 +97,11 @@ void __init plat_time_init(void)
 	setup_hpet_timer();
 #endif
 }
+
+void __init device_tree_init(void)
+{
+	if (!initial_boot_params)
+		return;
+
+	unflatten_and_copy_device_tree();
+}
-- 
2.22.0
