From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [WIP PATCH] dts: Generate binaries for all relevant platforms
Date: Fri, 31 Jan 2014 14:07:11 -0700
Message-ID: <1391202431-30252-1-git-send-email-sjg@chromium.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>
Cc: Masahiro Yamada <yamada.m-NAum8xwdG0+S7A1Ibl2khg@public.gmane.org>, Vadim Bendebury <vbendeb-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Discuss <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Vadim Bendebury <vbendeb-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

(sent for the benefit of the Kbuild series - this does not apply as is)

Similar targets can use the same u-boot binary with different device
trees. It is convenient to have all similar device trees compiled and
published when u-boot is made: it allows for later easy repackaging
without the need to re-run the make file.

This follows the Linux kernel suite, which also compiles all similar
device tree targets at once.

For the purposes of exynos u-boot, as of now similar targets are those
which have the same device tree file prefix (before the first '-').

This change modifies the dts makefile to allow concurrent processing
of multiple device trees. As previously, one device tree is still
published at 'u-boot.dtb', this is a copy of the compiled default
device tree.

The problem with some DTC compiler versions generating stderr output
even when there is no compilation errors has been also addressed: all
DTC output is collected in a file, and only in case of error is the
file sent to stderr.

 Chrome OS tests:
  . emerge-{link|daisy} chromeos-u-boot - both succeed

  . to verify that all device tres get compiled run the following
    commands (the doit script below configures and builds u-boot for
    the target passed through TARGET='):

    $ rm -rf /tmp/u-*
    $ for t in link peach daisy; do
       USE_STDINT=1 U_BOOT_ROOT=$(pwd)  TARGET=$t doit
      done
    $ find /tmp/u-* -name '*.dtb'
   /tmp/u-daisy/u-boot.dtb
   /tmp/u-daisy/dts/exynos5250-snow.dtb
   /tmp/u-daisy/dts/exynos5250-smdk5250.dtb
   /tmp/u-daisy/dts/exynos5250-spring.dtb
   /tmp/u-link/u-boot.dtb
   /tmp/u-link/dts/link.dtb
   /tmp/u-peach/u-boot.dtb
   /tmp/u-peach/dts/exynos5420-smdk5420.dtb
   /tmp/u-peach/dts/exynos5420-peach_pit.dtb
   /tmp/u-peach/dts/exynos5420-peach-pit-adv.dtb

  . to verify that dt.o still builds when required run the following
    commands

   $ find /tmp/u-peach/ -name 'dt.o'
   $ CONFIG_OF_EMBED=y   TARGET=peach USE_STDINT=1 U_BOOT_ROOT=$(pwd)  doit
   $ find /tmp/u-peach/ -name 'dt.o'
   /tmp/u-peach/dts/dt.o

  . to verify that corrupting device tree still stops the build, add a
    syntax error to exynos5420-peach_pit.dts and rerun the build:

   $ TARGET=peach USE_STDINT=1 U_BOOT_ROOT=$(pwd)  doit
   Building in /tmp/u-peach
   DTC: dts->dtb  on file "/tmp/u-peach/dts/exynos5420-peach_pit.dtb.in"
   FATAL ERROR: Unable to parse input tree
   Error: /tmp/u-peach/dts/exynos5420-peach_pit.dtb.in:6.1-4 syntax error
   make[1]: *** [/tmp/u-peach/dts/exynos5420-peach_pit.dtb] Error 1
   make[1]: Target 'binary' not remade because of errors.
   make: *** [/tmp/u-peach/u-boot.dtb] Error 2
   make: Target `all' not remade because of errors.
END

Signed-off-by: Vadim Bendebury <vbendeb-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 dts/Makefile | 49 ++++++++++++++++++++++++++++++-------------------
 1 file changed, 30 insertions(+), 19 deletions(-)

diff --git a/dts/Makefile b/dts/Makefile
index 684ead3..a024b6a 100644
--- a/dts/Makefile
+++ b/dts/Makefile
@@ -30,7 +30,12 @@ LIB	= $(obj)libdts.o
 ifeq ($(DEVICE_TREE),)
 $(if $(CONFIG_DEFAULT_DEVICE_TREE),,\
 $(error Please define CONFIG_DEFAULT_DEVICE_TREE in your board header file))
-DEVICE_TREE = $(subst ",,$(CONFIG_DEFAULT_DEVICE_TREE))
+# This gets rid both of the double quotes and a possible suffix.
+DEV_TREE_BASE := $(shell echo $(CONFIG_DEFAULT_DEVICE_TREE) | sed 's/-.*//')
+DEFAULT_TREE := $(subst ",,$(obj)$(CONFIG_DEFAULT_DEVICE_TREE).dtb)
+else
+DEV_TREE_BASE := $(DEVICE_TREE)
+DEFAULT_TREE := $(obj)$(DEVICE_TREE).dtb)
 endif
 
 $(if $(CONFIG_ARCH_DEVICE_TREE),,\
@@ -52,14 +57,12 @@ DTS_FLAGS := $(shell if ! dtc -i 2>&1 | grep -q "invalid option"; then \
 # Undefine 'linux' since it might be used in device tree files
 DTS_CPPFLAGS := -x assembler-with-cpp -Ulinux \
 		-DARCH_CPU_DTS=\"$(SRCTREE)/arch/$(ARCH)/dts/$(CONFIG_ARCH_DEVICE_TREE).dtsi\" \
-		-DBOARD_DTS=\"$(SRCTREE)/board/$(VENDOR)/$(BOARD)/dts/$(DEVICE_TREE).dts\" \
 		-D__ASSEMBLY__ -I$(OBJTREE)/include -I$(SRCTREE)/include \
 		-I$(OBJTREE)/include2 \
 		-I$(SRCTREE)/board/$(VENDOR)/dts -I$(SRCTREE)/arch/$(ARCH)/dts \
 		-include $(OBJTREE)/include/config.h
 
-DTS_TMP := $(OBJTREE)/include/generated/$(DEVICE_TREE).dts.in
-DTS_SRC := board/$(VENDOR)/dts/$(DEVICE_TREE).dts
+DTS_DIR := $(TOPDIR)/board/$(VENDOR)/dts
 
 all:	$(obj).depend $(LIB)
 
@@ -68,20 +71,28 @@ all:	$(obj).depend $(LIB)
 # the filename.
 DT_BIN	:= $(obj)dt.dtb
 
-DTC_CMD := $(DTC) -R 4 -p 0x1000 -O dtb -o ${DT_BIN} $(DTS_FLAGS) $(DTS_TMP)
-
-$(DT_BIN): $(TOPDIR)/$(DTS_SRC)
-	rc=$$( \
-		cat $< | $(CPP) -P $(DTS_CPPFLAGS) - > $(DTS_TMP); \
-		{ { $(DTC_CMD)  2>&1 ; \
-		    echo $$? >&3 ; } | \
-		  grep -v '^DTC: dts->dtb  on file' ; \
-	        } 3>&1 1>&2 ) ; \
-	if [ $$rc != 0 ]; then \
-		echo "Source file is $(DTS_SRC)"; \
-		echo "Compiler: $(DTC_CMD)"; \
-	fi; \
-	exit $$rc
+DT_SOURCES := $(notdir $(wildcard $(DTS_DIR)/$(DEV_TREE_BASE)-*))
+DT_BINS := $(addprefix $(obj),$(addsuffix .dtb,$(basename $(DT_SOURCES)))) \
+	$(DT_BIN)
+
+$(obj)dt.dtb: $(DEFAULT_TREE)
+	cp $< $@
+
+# Get preprocessed version of the tree.
+$(obj)%.dts.in : $(DTS_DIR)/%.dts
+	$(CPP) -P $(DTS_CPPFLAGS) -DBOARD_DTS=$< $< -o $@
+
+# Compile the preprocessed device tree. Some DTC versions insist on sending
+# output to stderr even when everything is fine, which wrecs havoc on
+# automated testing tools watching for stderr output.
+#
+# To address this issue collect all DTC output in a file and send the file to
+# stderr only if there has been a DTC error. '&& false' enforces a make error.
+#
+$(obj)%.dtb : $(obj)%.dts.in
+	$(DTC) -R 4 -p 0x1000 -O dtb $(DTS_FLAGS) -o $@ $< > $@.errmsg 2>&1 || \
+	(export rc=$$? && cat $@.errmsg >&2 && exit $$rc)
+	rm -f $@.errmsg
 
 process_lds = \
 	$(1) | sed -r -n 's/^OUTPUT_$(2)[ ("]*([^")]*).*/\1/p'
@@ -122,7 +133,7 @@ COBJS	:= $(OBJS-y)
 
 OBJS	:= $(addprefix $(obj),$(COBJS))
 
-binary:	$(DT_BIN)
+binary:	$(DT_BINS)
 
 $(LIB):	$(OBJS) $(DTB)
 	$(call cmd_link_o_target, $(OBJS))
-- 
1.9.rc1.175.g0b1dcb5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
