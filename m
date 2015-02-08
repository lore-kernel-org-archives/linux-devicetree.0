From: Rabin Vincent <rabin@rab.in>
Subject: [PATCH 1/4] CRIS: add device tree support
Date: Sun,  8 Feb 2015 16:35:42 +0100
Message-ID: <1423409745-2230-1-git-send-email-rabin@rab.in>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: jesper.nilsson@axis.com
Cc: linux-cris-kernel@axis.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rabin Vincent <rabin@rab.in>
List-Id: devicetree@vger.kernel.org

Add support for booting CRIS with a built-in device tree.

Signed-off-by: Rabin Vincent <rabin@rab.in>
---
 arch/cris/Kconfig             |  6 ++++++
 arch/cris/Makefile            |  4 ++++
 arch/cris/boot/dts/Makefile   |  6 ++++++
 arch/cris/kernel/Makefile     |  1 +
 arch/cris/kernel/devicetree.c | 14 ++++++++++++++
 arch/cris/kernel/setup.c      | 13 +++++++++++++
 6 files changed, 44 insertions(+)
 create mode 100644 arch/cris/boot/dts/Makefile
 create mode 100644 arch/cris/kernel/devicetree.c

diff --git a/arch/cris/Kconfig b/arch/cris/Kconfig
index 8474c66..cbbc2dc 100644
--- a/arch/cris/Kconfig
+++ b/arch/cris/Kconfig
@@ -53,11 +53,17 @@ config CRIS
 	select OLD_SIGSUSPEND
 	select OLD_SIGACTION
 	select ARCH_REQUIRE_GPIOLIB
+	select OF
+	select OF_EARLY_FLATTREE
 
 config HZ
 	int
 	default 100
 
+config BUILTIN_DTB
+	string "DTB to build into the kernel image"
+	depends on OF
+
 source "init/Kconfig"
 
 source "kernel/Kconfig.freezer"
diff --git a/arch/cris/Makefile b/arch/cris/Makefile
index 39dc7d0..4a5404b 100644
--- a/arch/cris/Makefile
+++ b/arch/cris/Makefile
@@ -40,6 +40,10 @@ else
 MACH :=
 endif
 
+ifneq ($(CONFIG_BUILTIN_DTB),"")
+core-$(CONFIG_OF) += arch/cris/boot/dts/
+endif
+
 LD = $(CROSS_COMPILE)ld -mcrislinux
 
 OBJCOPYFLAGS := -O binary -R .note -R .comment -S
diff --git a/arch/cris/boot/dts/Makefile b/arch/cris/boot/dts/Makefile
new file mode 100644
index 0000000..faf69fb
--- /dev/null
+++ b/arch/cris/boot/dts/Makefile
@@ -0,0 +1,6 @@
+BUILTIN_DTB := $(patsubst "%",%,$(CONFIG_BUILTIN_DTB)).dtb.o
+ifneq ($(CONFIG_BUILTIN_DTB),"")
+obj-$(CONFIG_OF) += $(BUILTIN_DTB)
+endif
+
+clean-files := *.dtb.S
diff --git a/arch/cris/kernel/Makefile b/arch/cris/kernel/Makefile
index b45640b..edef71f 100644
--- a/arch/cris/kernel/Makefile
+++ b/arch/cris/kernel/Makefile
@@ -7,6 +7,7 @@ CPPFLAGS_vmlinux.lds := -DDRAM_VIRTUAL_BASE=0x$(CONFIG_ETRAX_DRAM_VIRTUAL_BASE)
 extra-y	:= vmlinux.lds
 
 obj-y   := process.o traps.o irq.o ptrace.o setup.o time.o sys_cris.o
+obj-y += devicetree.o
 
 obj-$(CONFIG_MODULES)    += crisksyms.o
 obj-$(CONFIG_MODULES)	 += module.o
diff --git a/arch/cris/kernel/devicetree.c b/arch/cris/kernel/devicetree.c
new file mode 100644
index 0000000..53ff8d7
--- /dev/null
+++ b/arch/cris/kernel/devicetree.c
@@ -0,0 +1,14 @@
+#include <linux/init.h>
+#include <linux/bootmem.h>
+#include <linux/printk.h>
+
+void __init early_init_dt_add_memory_arch(u64 base, u64 size)
+{
+	pr_err("%s(%llx, %llx)\n",
+	       __func__, base, size);
+}
+
+void * __init early_init_dt_alloc_memory_arch(u64 size, u64 align)
+{
+	return alloc_bootmem_align(size, align);
+}
diff --git a/arch/cris/kernel/setup.c b/arch/cris/kernel/setup.c
index 905b70e..f11538e 100644
--- a/arch/cris/kernel/setup.c
+++ b/arch/cris/kernel/setup.c
@@ -19,6 +19,9 @@
 #include <linux/utsname.h>
 #include <linux/pfn.h>
 #include <linux/cpu.h>
+#include <linux/of.h>
+#include <linux/of_fdt.h>
+#include <linux/of_platform.h>
 #include <asm/setup.h>
 #include <arch/system.h>
 
@@ -64,6 +67,8 @@ void __init setup_arch(char **cmdline_p)
 	unsigned long start_pfn, max_pfn;
 	unsigned long memory_start;
 
+	early_init_dt_scan(__dtb_start);
+
 	/* register an initial console printing routine for printk's */
 
 	init_etrax_debug();
@@ -141,6 +146,8 @@ void __init setup_arch(char **cmdline_p)
 
 	reserve_bootmem(PFN_PHYS(start_pfn), bootmap_size, BOOTMEM_DEFAULT);
 
+	unflatten_and_copy_device_tree();
+
 	/* paging_init() sets up the MMU and marks all pages as reserved */
 
 	paging_init();
@@ -204,3 +211,9 @@ static int __init topology_init(void)
 
 subsys_initcall(topology_init);
 
+static int __init cris_of_init(void)
+{
+	of_platform_populate(NULL, of_default_bus_match_table, NULL, NULL);
+	return 0;
+}
+core_initcall(cris_of_init);
-- 
2.1.4
