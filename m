From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH v3 09/12] ARM: efm32: move into multiplatform
Date: Fri, 13 Mar 2015 00:36:17 +0100
Message-ID: <1426203380-7155-10-git-send-email-stefan@agner.ch>
References: <1426203380-7155-1-git-send-email-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1426203380-7155-1-git-send-email-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: shawn.guo@linaro.org, kernel@pengutronix.de, linux@arm.linux.org.uk, u.kleine-koenig@pengutronix.de, jason@lakedaemon.net, olof@lixom.net, arnd@arndb.de, daniel.lezcano@linaro.org, tglx@linutronix.de, mark.rutland@arm.com, pawel.moll@arm.com, robh+dt@kernel.org, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, marc.zyngier@arm.com, mcoquelin.stm32@gmail.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>
List-Id: devicetree@vger.kernel.org

=46rom: Arnd Bergmann <arnd@arndb.de>

Since the multiplatform configuration can support no-MMU kernels now,
there is nothing stopping us from moving the efm32 platform in there
as well. This introduces a new ARCH_MULTI_V7M CPU architecture selectio=
n
option, since v7-M is incompatible with v7-A, and we can have either
of the two enabled for multiplatform, but not both at the same time.

Acked-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 arch/arm/Kconfig                 | 33 ++++++++++++++------------------=
-
 arch/arm/configs/efm32_defconfig |  2 ++
 2 files changed, 16 insertions(+), 19 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 636cb3f..51d1750 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -316,7 +316,7 @@ config ARCH_MULTIPLATFORM
 	select COMMON_CLK
 	select GENERIC_CLOCKEVENTS
 	select MIGHT_HAVE_PCI
-	select MULTI_IRQ_HANDLER
+	select MULTI_IRQ_HANDLER if !ARCH_MULTI_V7M
 	select SPARSE_IRQ
 	select USE_OF
=20
@@ -402,24 +402,6 @@ config ARCH_EBSA110
 	  Ethernet interface, two PCMCIA sockets, two serial ports and a
 	  parallel port.
=20
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
@@ -780,6 +762,13 @@ menu "Multiple platform selection"
=20
 comment "CPU Core family selection"
=20
+config ARCH_MULTI_V7M
+	bool "ARMv7-M based platforms (Cortex-M)"
+	depends on !MMU && !(ARCH_MULTI_V4_V5 || ARCH_MULTI_V6_V7)
+	select CPU_V7M
+	select ARM_NVIC
+	select NO_IOPORT_MAP
+
 config ARCH_MULTI_V4
 	bool "ARMv4 based platforms (FA526)"
 	depends on !ARCH_MULTI_V6_V7 && MMU
@@ -836,6 +825,12 @@ config ARCH_VIRT
 	select ARM_PSCI
 	select HAVE_ARM_ARCH_TIMER
=20
+config ARCH_EFM32
+	bool "Energy Micro efm32" if ARCH_MULTI_V7M
+	help
+	  Support for Energy Micro's (now Silicon Labs) efm32 Giant Gecko
+	  processors.
+
 #
 # This is sorted alphabetically by mach-* pathname.  However, plat-*
 # Kconfigs may be included either alphabetically (according to the
diff --git a/arch/arm/configs/efm32_defconfig b/arch/arm/configs/efm32_=
defconfig
index c4c17e3..f58cb28 100644
--- a/arch/arm/configs/efm32_defconfig
+++ b/arch/arm/configs/efm32_defconfig
@@ -16,6 +16,8 @@ CONFIG_EMBEDDED=3Dy
 # CONFIG_IOSCHED_DEADLINE is not set
 # CONFIG_IOSCHED_CFQ is not set
 # CONFIG_MMU is not set
+# CONFIG_ARCH_MULTI_V7 is not set
+CONFIG_ARCH_MULTI_V7M=3Dy
 CONFIG_ARCH_EFM32=3Dy
 CONFIG_SET_MEM_PARAM=3Dy
 CONFIG_DRAM_BASE=3D0x88000000
--=20
2.3.1
