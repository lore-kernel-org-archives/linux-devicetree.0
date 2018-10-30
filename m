Return-Path: <SRS0=m9OO=NK=c-sky.com=ren_guo@kernel.org>
From: Guo Ren <ren_guo@c-sky.com>
Subject: [PATCH V3 1/2] csky: remove builtin-dtb Kbuild
Date: Wed, 31 Oct 2018 01:50:26 +0800
Message-Id: <d7007cad85bb06e0f4e081bc4daf6f0f79c81861.1540921794.git.ren_guo@c-sky.com>
To: robh@kernel.org, arnd@arndb.de
Cc: linux-arch@vger.kernel.org, devicetree@vger.kernel.org, Guo Ren <ren_guo@c-sky.com>
List-ID: <devicetree@vger.kernel.org>

Remove the builtin-dtb implementation in arch/csky.

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
---
 arch/csky/Kconfig.debug     | 10 +---------
 arch/csky/Makefile          |  2 --
 arch/csky/boot/dts/Makefile |  7 -------
 3 files changed, 1 insertion(+), 18 deletions(-)

diff --git a/arch/csky/Kconfig.debug b/arch/csky/Kconfig.debug
index 48cf6ff..22a162cd 100644
--- a/arch/csky/Kconfig.debug
+++ b/arch/csky/Kconfig.debug
@@ -1,9 +1 @@
-menu "C-SKY Debug Options"
-config CSKY_BUILTIN_DTB
-	string "Use kernel builtin dtb"
-	help
-	  User could define the dtb instead of the one which is passed from
-	  bootloader.
-	  Sometimes for debug, we want to use a built-in dtb and then we needn't
-	  modify bootloader at all.
-endmenu
+# dummy file, do not delete
diff --git a/arch/csky/Makefile b/arch/csky/Makefile
index 67a4ae1..91f7222 100644
--- a/arch/csky/Makefile
+++ b/arch/csky/Makefile
@@ -65,9 +65,7 @@ libs-y += arch/csky/lib/ \
 	$(shell $(CC) $(KBUILD_CFLAGS) $(KCFLAGS) -print-libgcc-file-name)
 
 boot := arch/csky/boot
-ifneq '$(CONFIG_CSKY_BUILTIN_DTB)' '""'
 core-y += $(boot)/dts/
-endif
 
 all: zImage
 
diff --git a/arch/csky/boot/dts/Makefile b/arch/csky/boot/dts/Makefile
index 305e81a..19a7f02 100644
--- a/arch/csky/boot/dts/Makefile
+++ b/arch/csky/boot/dts/Makefile
@@ -1,13 +1,6 @@
 dtstree	:= $(srctree)/$(src)
 
-ifneq '$(CONFIG_CSKY_BUILTIN_DTB)' '""'
-builtindtb-y := $(patsubst "%",%,$(CONFIG_CSKY_BUILTIN_DTB))
-dtb-y += $(builtindtb-y).dtb
-obj-y += $(builtindtb-y).dtb.o
-.SECONDARY: $(obj)/$(builtindtb-y).dtb.S
-else
 dtb-y := $(patsubst $(dtstree)/%.dts,%.dtb, $(wildcard $(dtstree)/*.dts))
-endif
 
 always += $(dtb-y)
 clean-files += *.dtb *.dtb.S
-- 
2.7.4
