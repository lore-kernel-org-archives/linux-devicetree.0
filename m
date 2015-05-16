From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH v7 09/13] ARM: introduce ARM_SINGLE_ARMV7M for ARMv7-M platforms
Date: Sat, 16 May 2015 11:44:21 +0200
Message-ID: <1431769465-26867-10-git-send-email-stefan@agner.ch>
References: <1431769465-26867-1-git-send-email-stefan@agner.ch>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1431769465-26867-1-git-send-email-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: shawn.guo@linaro.org, kernel@pengutronix.de, jason@lakedaemon.net
Cc: marc.zyngier@arm.com, linux@arm.linux.org.uk, u.kleine-koenig@pengutronix.de, olof@lixom.net, arnd@arndb.de, daniel.lezcano@linaro.org, tglx@linutronix.de, mark.rutland@arm.com, pawel.moll@arm.com, robh+dt@kernel.org, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, mcoquelin.stm32@gmail.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>
List-Id: devicetree@vger.kernel.org

This introduces a new top level config symbol ARM_SINGLE_ARMV7M
for non-MMU, ARMv7-M platforms. It also support multiple ARMv7-M
platforms in one kernel image since the cores share the same
basic memory layout and interrupt controller. However, this works
only if the combined platforms also have a similar (main) memory
layout.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 arch/arm/Kconfig       | 13 +++++++++++++
 arch/arm/Kconfig.debug |  2 +-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 45df48b..2361efc 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -329,6 +329,19 @@ config ARCH_MULTIPLATFORM
 	select SPARSE_IRQ
 	select USE_OF
 
+config ARM_SINGLE_ARMV7M
+	bool "ARMv7-M based platforms (Cortex-M0/M3/M4)"
+	depends on !MMU
+	select ARCH_WANT_OPTIONAL_GPIOLIB
+	select ARM_NVIC
+	select CLKSRC_OF
+	select COMMON_CLK
+	select CPU_V7M
+	select GENERIC_CLOCKEVENTS
+	select NO_IOPORT_MAP
+	select SPARSE_IRQ
+	select USE_OF
+
 config ARCH_REALVIEW
 	bool "ARM Ltd. RealView family"
 	select ARCH_WANT_OPTIONAL_GPIOLIB
diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
index 0c12ffb..e4441de 100644
--- a/arch/arm/Kconfig.debug
+++ b/arch/arm/Kconfig.debug
@@ -1544,7 +1544,7 @@ config DEBUG_UART_8250_FLOW_CONTROL
 
 config DEBUG_UNCOMPRESS
 	bool
-	depends on ARCH_MULTIPLATFORM || PLAT_SAMSUNG
+	depends on ARCH_MULTIPLATFORM || PLAT_SAMSUNG || ARM_SINGLE_ARMV7M
 	default y if DEBUG_LL && !DEBUG_OMAP2PLUS_UART && \
 		     (!DEBUG_TEGRA_UART || !ZBOOT_ROM)
 	help
-- 
2.4.1
