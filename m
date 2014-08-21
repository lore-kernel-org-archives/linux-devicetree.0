From: Andrew Bresticker <abrestic@chromium.org>
Subject: [PATCH 5/7] MIPS: sead3: Move device-trees to arch/mips/boot/dts/
Date: Thu, 21 Aug 2014 13:04:24 -0700
Message-ID: <1408651466-8334-6-git-send-email-abrestic@chromium.org>
References: <1408651466-8334-1-git-send-email-abrestic@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1408651466-8334-1-git-send-email-abrestic@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Ralf Baechle <ralf@linux-mips.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
Cc: James Hogan <james.hogan@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, David Daney <david.daney@cavium.com>, John Crispin <blogic@openwrt.org>, Jayachandran C <jchandra@broadcom.com>, Qais Yousef <qais.yousef@imgtec.com>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Andrew Bresticker <abrestic@chromium.org>
List-Id: devicetree@vger.kernel.org

Move the SEAD-3 device-tree to arch/mips/boot/dts/ and update the
Makefiles accordingly.  Since SEAD-3 requires the device-tree to be
built into the kernel, select BUILTIN_DTB when building for SEAD-3.

Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
---
 arch/mips/Kconfig                           | 1 +
 arch/mips/boot/dts/Makefile                 | 1 +
 arch/mips/{mti-sead3 => boot/dts}/sead3.dts | 0
 arch/mips/mti-sead3/Makefile                | 4 ----
 4 files changed, 2 insertions(+), 4 deletions(-)
 rename arch/mips/{mti-sead3 => boot/dts}/sead3.dts (100%)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index dbfcf35..a72c7c9 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -353,6 +353,7 @@ config MIPS_SEAD3
 	bool "MIPS SEAD3 board"
 	select BOOT_ELF32
 	select BOOT_RAW
+	select BUILTIN_DTB
 	select CEVT_R4K
 	select CSRC_R4K
 	select CSRC_GIC
diff --git a/arch/mips/boot/dts/Makefile b/arch/mips/boot/dts/Makefile
index 4f265ec..8df3d3e 100644
--- a/arch/mips/boot/dts/Makefile
+++ b/arch/mips/boot/dts/Makefile
@@ -1,5 +1,6 @@
 dtb-$(CONFIG_CAVIUM_OCTEON_SOC)		+= octeon_3xxx.dtb octeon_68xx.dtb
 dtb-$(CONFIG_DT_EASY50712)		+= easy50712.dtb
+dtb-$(CONFIG_MIPS_SEAD3)		+= sead3.dtb
 
 obj-y		+= $(patsubst %.dtb, %.dtb.o, $(dtb-y))
 
diff --git a/arch/mips/mti-sead3/sead3.dts b/arch/mips/boot/dts/sead3.dts
similarity index 100%
rename from arch/mips/mti-sead3/sead3.dts
rename to arch/mips/boot/dts/sead3.dts
diff --git a/arch/mips/mti-sead3/Makefile b/arch/mips/mti-sead3/Makefile
index 071786f..febf433 100644
--- a/arch/mips/mti-sead3/Makefile
+++ b/arch/mips/mti-sead3/Makefile
@@ -19,9 +19,5 @@ obj-y				+= sead3-i2c-dev.o sead3-i2c.o \
 
 obj-$(CONFIG_EARLY_PRINTK)	+= sead3-console.o
 obj-$(CONFIG_USB_EHCI_HCD)	+= sead3-ehci.o
-obj-$(CONFIG_OF)		+= sead3.dtb.o
 
 CFLAGS_sead3-setup.o = -I$(src)/../../../scripts/dtc/libfdt
-
-$(obj)/%.dtb: $(obj)/%.dts
-	$(call if_changed,dtc)
-- 
2.1.0.rc2.206.gedb03e5
