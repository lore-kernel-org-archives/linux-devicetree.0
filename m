From: Rob Herring <robh@kernel.org>
Subject: [PATCH v4 3/9] nios2: use common rules to build built-in dtb
Date: Mon,  1 Oct 2018 10:25:25 -0500
Message-ID: <20181001152531.3385-4-robh@kernel.org>
References: <20181001152531.3385-1-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181001152531.3385-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Frank Rowand <frowand.list@gmail.com>
Cc: Ley Foon Tan <lftan@altera.com>, nios2-dev@lists.rocketboards.org
List-Id: devicetree@vger.kernel.org

Using the common build support for built-in dtb files just requires
adding a .dtb.o target to obj-y.

This has the side effect that CONFIG_NIOS2_DTB_SOURCE should now be just
the dts filename in arch/nios2/boot/dts/ directory. Before any path was
supported, but if you want to build in your dtb to the kernel, it should
be in the kernel tree.

Cc: Ley Foon Tan <lftan@altera.com>
Cc: nios2-dev@lists.rocketboards.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/nios2/Makefile          |  6 ++----
 arch/nios2/boot/Makefile     | 14 --------------
 arch/nios2/boot/dts/Makefile |  2 ++
 arch/nios2/boot/linked_dtb.S | 19 -------------------
 4 files changed, 4 insertions(+), 37 deletions(-)
 delete mode 100644 arch/nios2/boot/linked_dtb.S

diff --git a/arch/nios2/Makefile b/arch/nios2/Makefile
index 50eece1c6adb..db2e78fe65c7 100644
--- a/arch/nios2/Makefile
+++ b/arch/nios2/Makefile
@@ -49,16 +49,14 @@ BOOT_TARGETS = vmImage zImage
 PHONY += $(BOOT_TARGETS) install
 KBUILD_IMAGE := $(nios2-boot)/vmImage
 
-ifneq ($(CONFIG_NIOS2_DTB_SOURCE),"")
-	core-y	+= $(nios2-boot)/
-endif
+core-y	+= $(nios2-boot)/dts/
 
 all: vmImage
 
 archclean:
 	$(Q)$(MAKE) $(clean)=$(nios2-boot)
 
-%.dtb: | scripts
+%.dtb %.dtb.S %.dtb.o: | scripts
 	$(Q)$(MAKE) $(build)=$(nios2-boot)/dts $(nios2-boot)/dts/$@
 
 dtbs:
diff --git a/arch/nios2/boot/Makefile b/arch/nios2/boot/Makefile
index 007586094dde..0b48f1bf086d 100644
--- a/arch/nios2/boot/Makefile
+++ b/arch/nios2/boot/Makefile
@@ -31,20 +31,6 @@ $(obj)/zImage: $(obj)/compressed/vmlinux FORCE
 $(obj)/compressed/vmlinux: $(obj)/vmlinux.gz FORCE
 	$(Q)$(MAKE) $(build)=$(obj)/compressed $@
 
-# Rule to build device tree blobs
-DTB_SRC := $(patsubst "%",%,$(CONFIG_NIOS2_DTB_SOURCE))
-
-# Make sure the generated dtb gets removed during clean
-extra-$(CONFIG_NIOS2_DTB_SOURCE_BOOL) += system.dtb
-
-$(obj)/system.dtb: $(DTB_SRC) FORCE
-	$(call cmd,dtc)
-
-# Ensure system.dtb exists
-$(obj)/linked_dtb.o: $(obj)/system.dtb
-
-obj-$(CONFIG_NIOS2_DTB_SOURCE_BOOL) += linked_dtb.o
-
 targets += $(dtb-y)
 
 $(obj)/dtbs: $(addprefix $(obj)/, $(dtb-y))
diff --git a/arch/nios2/boot/dts/Makefile b/arch/nios2/boot/dts/Makefile
index f66554cd5c45..f6358e395b25 100644
--- a/arch/nios2/boot/dts/Makefile
+++ b/arch/nios2/boot/dts/Makefile
@@ -1 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
+
+obj-y := $(patsubst "%.dts",%.dtb.o,$(CONFIG_NIOS2_DTB_SOURCE))
diff --git a/arch/nios2/boot/linked_dtb.S b/arch/nios2/boot/linked_dtb.S
deleted file mode 100644
index 071f922db338..000000000000
--- a/arch/nios2/boot/linked_dtb.S
+++ /dev/null
@@ -1,19 +0,0 @@
-/*
- * Copyright (C) 2011 Thomas Chou <thomas@wytron.com.tw>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program.  If not, see <http://www.gnu.org/licenses/>.
- *
- */
-.section .dtb.init.rodata,"a"
-.incbin "arch/nios2/boot/system.dtb"
-- 
2.17.1
