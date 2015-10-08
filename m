From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 12/13] powerpc: enable building of all dtbs
Date: Thu,  8 Oct 2015 12:53:46 -0500
Message-ID: <1444326827-3565-13-git-send-email-robh@kernel.org>
References: <1444326827-3565-1-git-send-email-robh@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1444326827-3565-1-git-send-email-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Enable building all dtb files when CONFIG_OF_ALL_DTBS is enabled. The dtbs
are not really dependent on a platform being enabled or any other kernel
config, so for testing coverage it is convenient to build all of the dtbs.
This builds all dts files in the tree, not just targets listed.

Supporting this requires adding 'dtbs' make target which was not yet
supported on powerpc.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>
Cc: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
Cc: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
---
 arch/powerpc/Makefile          | 6 ++++++
 arch/powerpc/boot/Makefile     | 5 ++++-
 arch/powerpc/boot/dts/Makefile | 5 +++++
 3 files changed, 15 insertions(+), 1 deletion(-)
 create mode 100644 arch/powerpc/boot/dts/Makefile

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index b9b4af2..0ec35ff 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -273,6 +273,11 @@ bootwrapper_install:
 %.dtb: scripts
 	$(Q)$(MAKE) ARCH=ppc64 $(build)=$(boot) $(patsubst %,$(boot)/%,$@)
 
+PHONY += dtbs
+
+dtbs: prepare scripts
+	$(Q)$(MAKE) ARCH=ppc64 $(build)=$(boot)/dts
+
 # Used to create 'merged defconfigs'
 # To use it $(call) it with the first argument as the base defconfig
 # and the second argument as a space separated list of .config files to merge,
@@ -317,6 +322,7 @@ define archhelp
   @echo '  dtbImage.<dt>   - zImage with an embedded device tree blob'
   @echo '  simpleImage.<dt> - Firmware independent image.'
   @echo '  treeImage.<dt>  - Support for older IBM 4xx firmware (not U-Boot)'
+  echo  '  dtbs            - Build device tree blobs for enabled boards'
   @echo '  install         - Install kernel using'
   @echo '                    (your) ~/bin/$(INSTALLKERNEL) or'
   @echo '                    (distribution) /sbin/$(INSTALLKERNEL) or'
diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index 4eec430..381df1a 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -402,7 +402,7 @@ zInstall: $(CONFIGURE) $(addprefix $(obj)/, $(image-y))
 clean-files += $(image-) $(initrd-) cuImage.* dtbImage.* treeImage.* \
 	zImage zImage.initrd zImage.chrp zImage.coff zImage.holly \
 	zImage.miboot zImage.pmac zImage.pseries \
-	zImage.maple simpleImage.* otheros.bld *.dtb
+	zImage.maple simpleImage.* otheros.bld
 
 # clean up files cached by wrapper
 clean-kernel := vmlinux.strip vmlinux.bin
@@ -410,6 +410,9 @@ clean-kernel += $(addsuffix .gz,$(clean-kernel))
 # If not absolute clean-files are relative to $(obj).
 clean-files += $(addprefix $(objtree)/, $(clean-kernel))
 
+# Let clean descend into subdirs
+subdir- := dts
+
 WRAPPER_OBJDIR := /usr/lib/kernel-wrapper
 WRAPPER_DTSDIR := /usr/lib/kernel-wrapper/dts
 WRAPPER_BINDIR := /usr/sbin
diff --git a/arch/powerpc/boot/dts/Makefile b/arch/powerpc/boot/dts/Makefile
new file mode 100644
index 0000000..f121775
--- /dev/null
+++ b/arch/powerpc/boot/dts/Makefile
@@ -0,0 +1,5 @@
+dtstree		:= $(srctree)/$(src)
+dtb-$(CONFIG_OF_ALL_DTBS) := $(patsubst $(dtstree)/%.dts,%.dtb, $(wildcard $(dtstree)/*.dts))
+
+always		:= $(dtb-y)
+clean-files	:= *.dtb
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
