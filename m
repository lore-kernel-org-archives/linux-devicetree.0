From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH v5 08/11] ARM: efm32: use ARM_SINGLE_ARMV7M
Date: Thu,  9 Apr 2015 22:04:12 +0200
Message-ID: <1428609855-27657-9-git-send-email-stefan@agner.ch>
References: <1428609855-27657-1-git-send-email-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1428609855-27657-1-git-send-email-stefan@agner.ch>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: shawn.guo@linaro.org, kernel@pengutronix.de, linux@arm.linux.org.uk, u.kleine-koenig@pengutronix.de, jason@lakedaemon.net, olof@lixom.net, arnd@arndb.de, daniel.lezcano@linaro.org, tglx@linutronix.de, mark.rutland@arm.com, pawel.moll@arm.com, robh+dt@kernel.org, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, marc.zyngier@arm.com, mcoquelin.stm32@gmail.com
Cc: devicetree@vger.kernel.org, Stefan Agner <stefan@agner.ch>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Use the new config symbol ARM_SINGLE_ARMV7M which groups config
symbols used by modern ARMv7-M platforms. It also support multiple
ARMv7-M platforms in one kernel image. However, this only works if
the combined platforms share the same (main) memory layout.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 arch/arm/Kconfig                 | 28 ++++++++++------------------
 arch/arm/configs/efm32_defconfig |  1 +
 2 files changed, 11 insertions(+), 18 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 66e60af..9c139fb 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -418,24 +418,6 @@ config ARCH_EBSA110
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
@@ -982,6 +964,16 @@ source "arch/arm/mach-w90x900/Kconfig"
 
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
2.3.5
