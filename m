From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: [PATCH v7 10/13] ARM: efm32: use ARM_SINGLE_ARMV7M
Date: Sat, 16 May 2015 11:44:22 +0200
Message-ID: <1431769465-26867-11-git-send-email-stefan@agner.ch>
References: <1431769465-26867-1-git-send-email-stefan@agner.ch>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431769465-26867-1-git-send-email-stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org
Cc: marc.zyngier-5wv7dgnIgG8@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Use the new config symbol ARM_SINGLE_ARMV7M which groups config
symbols used by modern ARMv7-M platforms. It also support multiple
ARMv7-M platforms in one kernel image. However, this only works if
the combined platforms share the same (main) memory layout.

Also use generic debug/uncompress.h for all ARMv7-M platforms.

Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
---
 arch/arm/Kconfig                 | 28 ++++++++++------------------
 arch/arm/Kconfig.debug           |  2 +-
 arch/arm/configs/efm32_defconfig |  1 +
 3 files changed, 12 insertions(+), 19 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 2361efc..d1c035d 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -411,24 +411,6 @@ config ARCH_EBSA110
 	  Ethernet interface, two PCMCIA sockets, two serial ports and a
 	  parallel port.
 
-config ARCH_EFM32
-	bool "Energy Micro efm32"
-	depends on !MMU
-	select ARCH_REQUIRE_GPIOLIB
-	select ARM_NVIC
-	select AUTO_ZRELADDR
-	select CLKSRC_OF
-	select COMMON_CLK
-	select CPU_V7M
-	select GENERIC_CLOCKEVENTS
-	select NO_DMA
-	select NO_IOPORT_MAP
-	select SPARSE_IRQ
-	select USE_OF
-	help
-	  Support for Energy Micro's (now Silicon Labs) efm32 Giant Gecko
-	  processors.
-
 config ARCH_EP93XX
 	bool "EP93xx-based"
 	select ARCH_HAS_HOLES_MEMORYMODEL
@@ -963,6 +945,16 @@ source "arch/arm/mach-w90x900/Kconfig"
 
 source "arch/arm/mach-zynq/Kconfig"
 
+# ARMv7-M architecture
+config ARCH_EFM32
+	bool "Energy Micro efm32"
+	depends on ARM_SINGLE_ARMV7M
+	select ARCH_REQUIRE_GPIOLIB
+	select AUTO_ZRELADDR
+	help
+	  Support for Energy Micro's (now Silicon Labs) efm32 Giant Gecko
+	  processors.
+
 # Definitions to make life easier
 config ARCH_ACORN
 	bool
diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
index e4441de..5d63c56 100644
--- a/arch/arm/Kconfig.debug
+++ b/arch/arm/Kconfig.debug
@@ -1561,7 +1561,7 @@ config DEBUG_UNCOMPRESS
 config UNCOMPRESS_INCLUDE
 	string
 	default "debug/uncompress.h" if ARCH_MULTIPLATFORM || ARCH_MSM || \
-					PLAT_SAMSUNG || ARCH_EFM32 || \
+					PLAT_SAMSUNG || ARM_SINGLE_ARMV7M || \
 					ARCH_SHMOBILE_LEGACY
 	default "mach/uncompress.h"
 
diff --git a/arch/arm/configs/efm32_defconfig b/arch/arm/configs/efm32_defconfig
index c4c17e3..e969f78 100644
--- a/arch/arm/configs/efm32_defconfig
+++ b/arch/arm/configs/efm32_defconfig
@@ -16,6 +16,7 @@ CONFIG_EMBEDDED=y
 # CONFIG_IOSCHED_DEADLINE is not set
 # CONFIG_IOSCHED_CFQ is not set
 # CONFIG_MMU is not set
+CONFIG_ARM_SINGLE_ARMV7M=y
 CONFIG_ARCH_EFM32=y
 CONFIG_SET_MEM_PARAM=y
 CONFIG_DRAM_BASE=0x88000000
-- 
2.4.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
