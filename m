From: Simon Glass <sjg@chromium.org>
Subject: [PATCH] fdt: Adjust Makefile to find .dtsi include files
Date: Thu, 19 Apr 2012 07:29:37 -0700
Message-ID: <1334845777-30913-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: U-Boot Mailing List <u-boot@lists.denx.de>
Cc: Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, Jerry Van Baren <vanbaren@cideas.com>
List-Id: devicetree@vger.kernel.org

The device tree compiler now has an option to specify the search path
for its files. Use this option when compiling in preference to
pre-processing the file.

Update Tegra here also to prevent build breakage.

This requires a recent dtc (commit de6b762 in git://jdl.com/software/dtc.git).

Signed-off-by: Simon Glass <sjg@chromium.org>
---
 board/nvidia/dts/tegra2-seaboard.dts |    2 +-
 dts/Makefile                         |    8 +++-----
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/board/nvidia/dts/tegra2-seaboard.dts b/board/nvidia/dts/tegra2-seaboard.dts
index 6ba3ec4..70df567 100644
--- a/board/nvidia/dts/tegra2-seaboard.dts
+++ b/board/nvidia/dts/tegra2-seaboard.dts
@@ -1,7 +1,7 @@
 /dts-v1/;
 
 /memreserve/ 0x1c000000 0x04000000;
-/include/ ARCH_CPU_DTS
+/include/ "tegra20.dtsi"
 
 / {
 	model = "NVIDIA Seaboard";
diff --git a/dts/Makefile b/dts/Makefile
index 5792afd..e771498 100644
--- a/dts/Makefile
+++ b/dts/Makefile
@@ -35,8 +35,8 @@ $(if $(CONFIG_ARCH_DEVICE_TREE),,\
 $(error Your architecture does not have device tree support enabled. \
 Please define CONFIG_ARCH_DEVICE_TREE))
 
-# We preprocess the device tree file provide a useful define
-DTS_CPPFLAGS := -DARCH_CPU_DTS=\"../arch/$(ARCH)/dts/$(CONFIG_ARCH_DEVICE_TREE).dtsi\"
+# Provide a list of include directories for dtc
+DTS_FLAGS := -i $(SRCTREE)/arch/$(ARCH)/dts
 
 all:	$(obj).depend $(LIB)
 
@@ -46,9 +46,7 @@ all:	$(obj).depend $(LIB)
 DT_BIN	:= $(obj)dt.dtb
 
 $(DT_BIN): $(TOPDIR)/board/$(VENDOR)/dts/$(DEVICE_TREE).dts
-	cat $< | $(CPP) -P $(DTS_CPPFLAGS) - >$@.tmp
-	$(DTC) -R 4 -p 0x1000 -O dtb -o ${DT_BIN} $@.tmp
-	rm $@.tmp
+	$(DTC) -R 4 -p 0x1000 -O dtb -o ${DT_BIN} $(DTS_FLAGS) $<
 
 process_lds = \
 	$(1) | sed -r -n 's/^OUTPUT_$(2)[ ("]*([^")]*).*/\1/p'
-- 
1.7.7.3
