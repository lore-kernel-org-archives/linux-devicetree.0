From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH] fdt: Enhance dts/Makefile to be all things to all men
Date: Tue, 28 May 2013 12:36:18 -0700
Message-ID: <1369769778-12455-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>
Cc: u-boot-review-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-l0cyMroinI0@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

There are a few partially conflicting requirements in compiling the device
tree, since U-Boot relies on whatever is installed on the build machine.

Some versions of dtc support -i, and this is often better than using #include
since you get correct line number information in errors. Unfortunately this
version must be installed manually in current Linux distributions.

Some device tree files use the word 'linux' which gets replaced with '1' by
many version of gcc, including version 4.7. So undefine this.

When an device tree file has an error we want to direct the user to the
right file and line number. So instead of piping the file into dts through
stdin, put it in a real file so that we get a fairly sensible error message
from dts. Then print out the original file details to help further.

This is based on a commit from Tom Warren. It would help if people can
test it in different environments.

Signed-off-by: Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 dts/Makefile | 34 +++++++++++++++++++++++++++++-----
 1 file changed, 29 insertions(+), 5 deletions(-)

diff --git a/dts/Makefile b/dts/Makefile
index 03e163e..1f6fabb 100644
--- a/dts/Makefile
+++ b/dts/Makefile
@@ -37,11 +37,29 @@ $(if $(CONFIG_ARCH_DEVICE_TREE),,\
 $(error Your architecture does not have device tree support enabled. \
 Please define CONFIG_ARCH_DEVICE_TREE))
 
+# Provide a list of include directories for dtc
+DTS_INCS-y := -i $(SRCTREE)/arch/$(ARCH)/dts
+
+DTS_INCS-y += -i $(SRCTREE)/board/$(VENDOR)/dts
+
+DTS_INCS-$(CONFIG_CHROMEOS) += -i $(SRCTREE)/cros/dts
+
+# Check if our dtc includes the -i option
+DTS_FLAGS := $(shell if ! dtc -i 2>&1 | grep -q "invalid option"; then \
+		echo $(DTS_INCS-y); fi)
+
 # We preprocess the device tree file provide a useful define
-DTS_CPPFLAGS := -x assembler-with-cpp \
+# Undefine 'linux' since it might be used in device tree files
+DTS_CPPFLAGS := -x assembler-with-cpp -Ulinux \
 		-DARCH_CPU_DTS=\"$(SRCTREE)/arch/$(ARCH)/dts/$(CONFIG_ARCH_DEVICE_TREE).dtsi\" \
 		-DBOARD_DTS=\"$(SRCTREE)/board/$(VENDOR)/$(BOARD)/dts/$(DEVICE_TREE).dts\" \
-		-I$(SRCTREE)/board/$(VENDOR)/dts -I$(SRCTREE)/arch/$(ARCH)/dts
+		-D__ASSEMBLY__ -I$(OBJTREE)/include -I$(SRCTREE)/include \
+		-I$(OBJTREE)/include2 \
+		-I$(SRCTREE)/board/$(VENDOR)/dts -I$(SRCTREE)/arch/$(ARCH)/dts \
+		-include $(OBJTREE)/include/config.h
+
+DTS_TMP := $(OBJTREE)/include/generated/$(DEVICE_TREE).dts.in
+DTS_SRC := board/$(VENDOR)/dts/$(DEVICE_TREE).dts
 
 all:	$(obj).depend $(LIB)
 
@@ -50,13 +68,19 @@ all:	$(obj).depend $(LIB)
 # the filename.
 DT_BIN	:= $(obj)dt.dtb
 
-$(DT_BIN): $(TOPDIR)/board/$(VENDOR)/dts/$(DEVICE_TREE).dts
+DTC_CMD := $(DTC) -R 4 -p 0x1000 -O dtb -o ${DT_BIN} $(DTS_FLAGS) $(DTS_TMP)
+
+$(DT_BIN): $(TOPDIR)/$(DTS_SRC)
 	rc=$$( \
-		cat $< | $(CPP) -P $(DTS_CPPFLAGS) - | \
-		{ { $(DTC) -R 4 -p 0x1000 -O dtb -o ${DT_BIN} - 2>&1 ; \
+		cat $< | $(CPP) -P $(DTS_CPPFLAGS) - > $(DTS_TMP); \
+		{ { $(DTC_CMD)  2>&1 ; \
 		    echo $$? >&3 ; } | \
 		  grep -v '^DTC: dts->dtb  on file' ; \
 	        } 3>&1 1>&2 ) ; \
+	if [ $$rc != 0 ]; then \
+		echo "Source file is $(DTS_SRC)"; \
+		echo "Compiler: $(DTC_CMD)"; \
+	fi; \
 	exit $$rc
 
 process_lds = \
-- 
1.8.2.1
