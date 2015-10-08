From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 10/13] nios2: use common make variables for dtb builds
Date: Thu,  8 Oct 2015 12:53:44 -0500
Message-ID: <1444326827-3565-11-git-send-email-robh@kernel.org>
References: <1444326827-3565-1-git-send-email-robh@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1444326827-3565-1-git-send-email-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Ley Foon Tan <lftan-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, nios2-dev-g9ZBwUv/Ih/yUk5EbOjzuce+I+R0W71w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Use common rules and dtb-y and always make variables to build dtbs
instead of explicit dtbs rule. Add the missing script dependencies as
well.

This is in preparation to support building all dtbs.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Ley Foon Tan <lftan-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
Cc: nios2-dev-g9ZBwUv/Ih/yUk5EbOjzuce+I+R0W71w@public.gmane.org
---
 arch/nios2/Makefile          | 10 +++++-----
 arch/nios2/boot/Makefile     | 13 +++----------
 arch/nios2/boot/dts/Makefile |  3 +++
 3 files changed, 11 insertions(+), 15 deletions(-)
 create mode 100644 arch/nios2/boot/dts/Makefile

diff --git a/arch/nios2/Makefile b/arch/nios2/Makefile
index 2328f82..5508587 100644
--- a/arch/nios2/Makefile
+++ b/arch/nios2/Makefile
@@ -41,7 +41,7 @@ core-y		+= arch/nios2/platform/
 INSTALL_PATH ?= /tftpboot
 nios2-boot := arch/$(ARCH)/boot
 BOOT_TARGETS = vmImage zImage
-PHONY += $(BOOT_TARGETS) install
+PHONY += $(BOOT_TARGETS) install dtbs
 KBUILD_IMAGE := $(nios2-boot)/vmImage
 
 ifneq ($(CONFIG_NIOS2_DTB_SOURCE),"")
@@ -53,11 +53,11 @@ all: vmImage
 archclean:
 	$(Q)$(MAKE) $(clean)=$(nios2-boot)
 
-%.dtb:
-	$(Q)$(MAKE) $(build)=$(nios2-boot) $(nios2-boot)/$@
+%.dtb: scripts
+	$(Q)$(MAKE) $(build)=$(nios2-boot)/dts $(nios2-boot)/dts/$@
 
-dtbs:
-	$(Q)$(MAKE) $(build)=$(nios2-boot) $(nios2-boot)/$@
+dtbs: prepare scripts
+	$(Q)$(MAKE) $(build)=$(nios2-boot)/dts
 
 $(BOOT_TARGETS): vmlinux
 	$(Q)$(MAKE) $(build)=$(nios2-boot) $(nios2-boot)/$@
diff --git a/arch/nios2/boot/Makefile b/arch/nios2/boot/Makefile
index c899876..187e45d 100644
--- a/arch/nios2/boot/Makefile
+++ b/arch/nios2/boot/Makefile
@@ -31,6 +31,9 @@ $(obj)/zImage: $(obj)/compressed/vmlinux FORCE
 $(obj)/compressed/vmlinux: $(obj)/vmlinux.gz FORCE
 	$(Q)$(MAKE) $(build)=$(obj)/compressed $@
 
+# Let clean descend into subdirs
+subdir- := dts
+
 # Rule to build device tree blobs
 DTB_SRC := $(patsubst "%",%,$(CONFIG_NIOS2_DTB_SOURCE))
 
@@ -45,15 +48,5 @@ $(obj)/linked_dtb.o: $(obj)/system.dtb
 
 obj-$(CONFIG_NIOS2_DTB_SOURCE_BOOL) += linked_dtb.o
 
-targets += $(dtb-y)
-
-# Rule to build device tree blobs with make command
-$(obj)/%.dtb: $(src)/dts/%.dts FORCE
-	$(call if_changed_dep,dtc)
-
-$(obj)/dtbs: $(addprefix $(obj)/, $(dtb-y))
-
-clean-files := *.dtb
-
 install:
 	sh $(srctree)/$(src)/install.sh $(KERNELRELEASE) $(BOOTIMAGE) System.map "$(INSTALL_PATH)"
diff --git a/arch/nios2/boot/dts/Makefile b/arch/nios2/boot/dts/Makefile
new file mode 100644
index 0000000..1c52039
--- /dev/null
+++ b/arch/nios2/boot/dts/Makefile
@@ -0,0 +1,3 @@
+always          := $(dtb-y)
+clean-files     := *.dtb
+
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
