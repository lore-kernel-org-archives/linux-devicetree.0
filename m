From: Rob Herring <robh@kernel.org>
Subject: [PATCH v4 2/9] nios2: build .dtb files in dts directory
Date: Mon,  1 Oct 2018 10:25:24 -0500
Message-ID: <20181001152531.3385-3-robh@kernel.org>
References: <20181001152531.3385-1-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181001152531.3385-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Frank Rowand <frowand.list@gmail.com>
Cc: Ley Foon Tan <lftan@altera.com>, nios2-dev@lists.rocketboards.org
List-Id: devicetree@vger.kernel.org

Align nios2 with other architectures which build the dtb files in the
same directory as the dts files. This is also in line with most other
build targets which are located in the same directory as the source.
This move will help enable the 'dtbs' target which builds all the dtbs
regardless of kernel config.

This transition could break some scripts if they expect dtb files in
the old location.

Cc: Ley Foon Tan <lftan@altera.com>
Cc: nios2-dev@lists.rocketboards.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/nios2/Makefile          | 4 ++--
 arch/nios2/boot/Makefile     | 4 ----
 arch/nios2/boot/dts/Makefile | 1 +
 3 files changed, 3 insertions(+), 6 deletions(-)
 create mode 100644 arch/nios2/boot/dts/Makefile

diff --git a/arch/nios2/Makefile b/arch/nios2/Makefile
index 8673a79dca9c..50eece1c6adb 100644
--- a/arch/nios2/Makefile
+++ b/arch/nios2/Makefile
@@ -59,10 +59,10 @@ archclean:
 	$(Q)$(MAKE) $(clean)=$(nios2-boot)
 
 %.dtb: | scripts
-	$(Q)$(MAKE) $(build)=$(nios2-boot) $(nios2-boot)/$@
+	$(Q)$(MAKE) $(build)=$(nios2-boot)/dts $(nios2-boot)/dts/$@
 
 dtbs:
-	$(Q)$(MAKE) $(build)=$(nios2-boot) $(nios2-boot)/$@
+	$(Q)$(MAKE) $(build)=$(nios2-boot)/dts
 
 $(BOOT_TARGETS): vmlinux
 	$(Q)$(MAKE) $(build)=$(nios2-boot) $(nios2-boot)/$@
diff --git a/arch/nios2/boot/Makefile b/arch/nios2/boot/Makefile
index 2ba23a679732..007586094dde 100644
--- a/arch/nios2/boot/Makefile
+++ b/arch/nios2/boot/Makefile
@@ -47,10 +47,6 @@ obj-$(CONFIG_NIOS2_DTB_SOURCE_BOOL) += linked_dtb.o
 
 targets += $(dtb-y)
 
-# Rule to build device tree blobs with make command
-$(obj)/%.dtb: $(src)/dts/%.dts FORCE
-	$(call if_changed_dep,dtc)
-
 $(obj)/dtbs: $(addprefix $(obj)/, $(dtb-y))
 
 install:
diff --git a/arch/nios2/boot/dts/Makefile b/arch/nios2/boot/dts/Makefile
new file mode 100644
index 000000000000..f66554cd5c45
--- /dev/null
+++ b/arch/nios2/boot/dts/Makefile
@@ -0,0 +1 @@
+# SPDX-License-Identifier: GPL-2.0
-- 
2.17.1
