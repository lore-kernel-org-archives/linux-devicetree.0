From: Zong Li <zongbox@gmail.com>
Subject: [PATCH] RISC-V: Support built-in dtb
Date: Wed, 20 Dec 2017 17:14:31 +0800
Message-ID: <1513761271-2386-1-git-send-email-zongbox@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: palmer@sifive.com, albert@sifive.com, robh+dt@kernel.org, mark.rutland@arm.com, wesley@sifive.com, patches@groups.riscv.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, zong@andestech.com
Cc: Zong Li <zongbox@gmail.com>
List-Id: devicetree@vger.kernel.org

Build the dtb into the kernel image.
If the DTB is given via bootloader, the external DTB is adopted first.

Signed-off-by: Zong Li <zongbox@gmail.com>
---
 arch/riscv/Kconfig           |  4 ++++
 arch/riscv/Makefile          |  9 +++++++++
 arch/riscv/boot/Makefile     | 17 +++++++++++++++++
 arch/riscv/boot/dts/Makefile | 11 +++++++++++
 arch/riscv/kernel/setup.c    |  2 +-
 5 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/boot/Makefile
 create mode 100644 arch/riscv/boot/dts/Makefile

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 2e15e85..831cbb9 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -189,6 +189,10 @@ config RISCV_ISA_C
 config RISCV_ISA_A
 	def_bool y
 
+config RISCV_BUILTIN_DTB
+        string "Builtin DTB"
+        default ""
+
 endmenu
 
 menu "Kernel type"
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 6719dd3..4c5c9f8 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -57,6 +57,12 @@ ifeq ($(CONFIG_CMODEL_MEDANY),y)
 	KBUILD_CFLAGS += -mcmodel=medany
 endif
 
+ifneq '$(CONFIG_RISCV_BUILTIN_DTB)' '""'
+BUILTIN_DTB := y
+else
+BUILTIN_DTB := n
+endif
+
 # GCC versions that support the "-mstrict-align" option default to allowing
 # unaligned accesses.  While unaligned accesses are explicitly allowed in the
 # RISC-V ISA, they're emulated by machine mode traps on all extant
@@ -69,4 +75,7 @@ core-y += arch/riscv/kernel/ arch/riscv/mm/
 
 libs-y += arch/riscv/lib/
 
+boot := arch/riscv/boot
+core-$(BUILTIN_DTB) += $(boot)/dts/
+
 all: vmlinux
diff --git a/arch/riscv/boot/Makefile b/arch/riscv/boot/Makefile
new file mode 100644
index 0000000..003d697
--- /dev/null
+++ b/arch/riscv/boot/Makefile
@@ -0,0 +1,17 @@
+# SPDX-License-Identifier: GPL-2.0
+
+targets := Image Image.gz
+
+$(obj)/Image: vmlinux FORCE
+	$(call if_changed,objcopy)
+
+$(obj)/Image.gz: $(obj)/Image FORCE
+	$(call if_changed,gzip)
+
+install: $(obj)/Image
+	$(CONFIG_SHELL) $(srctree)/$(src)/install.sh $(KERNELRELEASE) \
+	$(obj)/Image System.map "$(INSTALL_PATH)"
+
+zinstall: $(obj)/Image.gz
+	$(CONFIG_SHELL) $(srctree)/$(src)/install.sh $(KERNELRELEASE) \
+	$(obj)/Image.gz System.map "$(INSTALL_PATH)"
diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
new file mode 100644
index 0000000..b65d070
--- /dev/null
+++ b/arch/riscv/boot/dts/Makefile
@@ -0,0 +1,11 @@
+# SPDX-License-Identifier: GPL-2.0
+
+ifneq '$(CONFIG_RISCV_BUILTIN_DTB)' '""'
+BUILTIN_DTB := $(patsubst "%",%,$(CONFIG_RISCV_BUILTIN_DTB)).dtb.o
+else
+BUILTIN_DTB :=
+endif
+
+obj-$(CONFIG_OF) += $(BUILTIN_DTB)
+
+clean-files := *.dtb *.dtb.S
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index e59a28c..3c89f3d 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -149,7 +149,7 @@ asmlinkage void __init setup_vm(void)
 
 void __init sbi_save(unsigned int hartid, void *dtb)
 {
-	early_init_dt_scan(__va(dtb));
+	early_init_dt_scan(dtb ? __va(dtb) : __dtb_start);
 }
 
 /*
-- 
2.7.4
