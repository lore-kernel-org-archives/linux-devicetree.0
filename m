From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v2] ARM: new platform for Energy Micro's EFM32 Cortex-M3 SoCs
Date: Tue, 17 Sep 2013 21:58:04 +0200
Message-ID: <1379447884-14025-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
Changes since (implicit) v1 sent with Message-id:
1376552964-16296-1-git-send-email-u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org:

 - drop adding device trees as this depends on a patch not yet mainline
   (clk: new driver for efm32 SoC)
 - drop adding code for timekeeping. Sent as a separate patch which add=
s code
   to drivers/clocksource. (No compile time dependencies)

 arch/arm/Kconfig                               |  16 +++-
 arch/arm/Kconfig.debug                         |  16 ++++
 arch/arm/Makefile                              |   1 +
 arch/arm/configs/efm32_defconfig               | 104 +++++++++++++++++=
++++++++
 arch/arm/mach-efm32/Makefile                   |   1 +
 arch/arm/mach-efm32/Makefile.boot              |   2 +
 arch/arm/mach-efm32/cmu.h                      |  15 ++++
 arch/arm/mach-efm32/common.c                   |  19 +++++
 arch/arm/mach-efm32/common.h                   |   1 +
 arch/arm/mach-efm32/dtmachine.c                |  31 ++++++++
 arch/arm/mach-efm32/include/mach/debug-macro.S |  48 ++++++++++++
 arch/arm/mach-efm32/include/mach/entry-macro.S |   5 ++
 arch/arm/mach-efm32/include/mach/io.h          |   6 ++
 arch/arm/mach-efm32/include/mach/irqs.h        |   6 ++
 arch/arm/mach-efm32/include/mach/timex.h       |   7 ++
 15 files changed, 277 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/configs/efm32_defconfig
 create mode 100644 arch/arm/mach-efm32/Makefile
 create mode 100644 arch/arm/mach-efm32/Makefile.boot
 create mode 100644 arch/arm/mach-efm32/cmu.h
 create mode 100644 arch/arm/mach-efm32/common.c
 create mode 100644 arch/arm/mach-efm32/common.h
 create mode 100644 arch/arm/mach-efm32/dtmachine.c
 create mode 100644 arch/arm/mach-efm32/include/mach/debug-macro.S
 create mode 100644 arch/arm/mach-efm32/include/mach/entry-macro.S
 create mode 100644 arch/arm/mach-efm32/include/mach/io.h
 create mode 100644 arch/arm/mach-efm32/include/mach/irqs.h
 create mode 100644 arch/arm/mach-efm32/include/mach/timex.h

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 3f7714d..88198e4 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -406,6 +406,20 @@ config ARCH_EBSA110
 	  Ethernet interface, two PCMCIA sockets, two serial ports and a
 	  parallel port.
=20
+config ARCH_EFM32
+	bool "Energy Micro Cortex M3 Platform"
+	depends on !MMU
+	select ARM_NVIC
+	select CLKSRC_MMIO
+	select CLKSRC_OF
+	select COMMON_CLK
+	select CPU_V7M
+	select GENERIC_CLOCKEVENTS
+	select HAVE_CLK
+	select NO_DMA
+	select NO_IOPORT
+	select USE_OF
+
 config ARCH_EP93XX
 	bool "EP93xx-based"
 	select ARCH_HAS_HOLES_MEMORYMODEL
@@ -1803,7 +1817,7 @@ config FORCE_MAX_ZONEORDER
 	int "Maximum zone order" if ARCH_SHMOBILE
 	range 11 64 if ARCH_SHMOBILE
 	default "12" if SOC_AM33XX
-	default "9" if SA1111
+	default "9" if SA1111 || ARCH_EFM32
 	default "11"
 	help
 	  The kernel memory allocator divides physically contiguous memory
diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
index 9762c84..27f37e8 100644
--- a/arch/arm/Kconfig.debug
+++ b/arch/arm/Kconfig.debug
@@ -173,6 +173,22 @@ choice
 		  Say Y here if you want the debug print routines to direct
 		  their output to the serial port in the DC21285 (Footbridge).
=20
+	config DEBUG_EFM32_UART1
+		bool "Kernel low-level debugging messages via UART1 (ttyefm4)"
+		depends on ARCH_EFM32
+		help
+		  Say Y here if you want the debug print routines to direct
+		  their output to the second UART port on efm32 based
+		  machines.
+
+	config DEBUG_EFM32_USART1
+		bool "Kernel low-level debugging messages via USART1 (ttyefm1)"
+		depends on ARCH_EFM32
+		help
+		  Say Y here if you want the debug print routines to direct
+		  their output to the second USART port on efm32 based
+		  machines.
+
 	config DEBUG_FOOTBRIDGE_COM1
 		bool "Kernel low-level debugging messages via footbridge 8250 at PCI=
 COM1"
 		depends on FOOTBRIDGE
diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index a37a50f..bee8be4 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -152,6 +152,7 @@ machine-$(CONFIG_ARCH_CNS3XXX)		+=3D cns3xxx
 machine-$(CONFIG_ARCH_DAVINCI)		+=3D davinci
 machine-$(CONFIG_ARCH_DOVE)		+=3D dove
 machine-$(CONFIG_ARCH_EBSA110)		+=3D ebsa110
+machine-$(CONFIG_ARCH_EFM32)		+=3D efm32
 machine-$(CONFIG_ARCH_EP93XX)		+=3D ep93xx
 machine-$(CONFIG_ARCH_EXYNOS)		+=3D exynos
 machine-$(CONFIG_ARCH_GEMINI)		+=3D gemini
diff --git a/arch/arm/configs/efm32_defconfig b/arch/arm/configs/efm32_=
defconfig
new file mode 100644
index 0000000..b31af07
--- /dev/null
+++ b/arch/arm/configs/efm32_defconfig
@@ -0,0 +1,104 @@
+CONFIG_HIGH_RES_TIMERS=3Dy
+CONFIG_LOG_BUF_SHIFT=3D12
+CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy
+# CONFIG_UID16 is not set
+# CONFIG_BASE_FULL is not set
+# CONFIG_FUTEX is not set
+# CONFIG_EPOLL is not set
+# CONFIG_SIGNALFD is not set
+# CONFIG_EVENTFD is not set
+# CONFIG_AIO is not set
+CONFIG_EMBEDDED=3Dy
+# CONFIG_VM_EVENT_COUNTERS is not set
+# CONFIG_SLUB_DEBUG is not set
+# CONFIG_SLUB_CPU_PARTIAL is not set
+# CONFIG_LBDAF is not set
+# CONFIG_BLK_DEV_BSG is not set
+# CONFIG_IOSCHED_DEADLINE is not set
+# CONFIG_IOSCHED_CFQ is not set
+# CONFIG_MMU is not set
+CONFIG_ARCH_EFM32=3Dy
+# CONFIG_KUSER_HELPERS is not set
+CONFIG_SET_MEM_PARAM=3Dy
+CONFIG_DRAM_BASE=3D0x88000000
+CONFIG_DRAM_SIZE=3D0x00400000
+CONFIG_FLASH_MEM_BASE=3D0x8c000000
+CONFIG_FLASH_SIZE=3D0x01000000
+CONFIG_PREEMPT=3Dy
+CONFIG_ZBOOT_ROM_TEXT=3D0x0
+CONFIG_ZBOOT_ROM_BSS=3D0x0
+CONFIG_XIP_KERNEL=3Dy
+CONFIG_XIP_PHYS_ADDR=3D0x8c000000
+CONFIG_BINFMT_FLAT=3Dy
+CONFIG_BINFMT_SHARED_FLAT=3Dy
+# CONFIG_COREDUMP is not set
+CONFIG_NET=3Dy
+CONFIG_PACKET=3Dy
+CONFIG_UNIX=3Dy
+CONFIG_INET=3Dy
+# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
+# CONFIG_INET_XFRM_MODE_TUNNEL is not set
+# CONFIG_INET_XFRM_MODE_BEET is not set
+# CONFIG_INET_LRO is not set
+# CONFIG_INET_DIAG is not set
+# CONFIG_IPV6 is not set
+# CONFIG_WIRELESS is not set
+CONFIG_DEVTMPFS=3Dy
+CONFIG_DEVTMPFS_MOUNT=3Dy
+# CONFIG_FW_LOADER is not set
+CONFIG_MTD=3Dy
+CONFIG_MTD_BLOCK_RO=3Dy
+CONFIG_MTD_ROM=3Dy
+CONFIG_MTD_UCLINUX=3Dy
+CONFIG_PROC_DEVICETREE=3Dy
+# CONFIG_BLK_DEV is not set
+CONFIG_NETDEVICES=3Dy
+# CONFIG_NET_VENDOR_ARC is not set
+# CONFIG_NET_CADENCE is not set
+# CONFIG_NET_VENDOR_BROADCOM is not set
+# CONFIG_NET_VENDOR_CIRRUS is not set
+# CONFIG_NET_VENDOR_FARADAY is not set
+# CONFIG_NET_VENDOR_INTEL is not set
+# CONFIG_NET_VENDOR_MARVELL is not set
+CONFIG_KS8851=3Dy
+# CONFIG_NET_VENDOR_MICROCHIP is not set
+# CONFIG_NET_VENDOR_NATSEMI is not set
+# CONFIG_NET_VENDOR_SEEQ is not set
+# CONFIG_NET_VENDOR_SMSC is not set
+# CONFIG_NET_VENDOR_STMICRO is not set
+# CONFIG_NET_VENDOR_VIA is not set
+# CONFIG_NET_VENDOR_WIZNET is not set
+# CONFIG_WLAN is not set
+# CONFIG_INPUT is not set
+# CONFIG_SERIO is not set
+# CONFIG_VT is not set
+# CONFIG_UNIX98_PTYS is not set
+# CONFIG_LEGACY_PTYS is not set
+CONFIG_SERIAL_NONSTANDARD=3Dy
+# CONFIG_DEVKMEM is not set
+CONFIG_SERIAL_EFM32_UART=3Dy
+CONFIG_SERIAL_EFM32_UART_CONSOLE=3Dy
+# CONFIG_HW_RANDOM is not set
+CONFIG_SPI=3Dy
+CONFIG_SPI_EFM32=3Dy
+# CONFIG_USB_SUPPORT is not set
+CONFIG_MMC=3Dy
+CONFIG_MMC_SPI=3Dy
+# CONFIG_IOMMU_SUPPORT is not set
+CONFIG_EXT2_FS=3Dy
+# CONFIG_FILE_LOCKING is not set
+# CONFIG_DNOTIFY is not set
+# CONFIG_INOTIFY_USER is not set
+CONFIG_ROMFS_FS=3Dy
+CONFIG_ROMFS_BACKED_BY_MTD=3Dy
+# CONFIG_NETWORK_FILESYSTEMS is not set
+CONFIG_PRINTK_TIME=3Dy
+CONFIG_DEBUG_INFO=3Dy
+# CONFIG_ENABLE_WARN_DEPRECATED is not set
+# CONFIG_ENABLE_MUST_CHECK is not set
+CONFIG_MAGIC_SYSRQ=3Dy
+# CONFIG_SCHED_DEBUG is not set
+# CONFIG_DEBUG_BUGVERBOSE is not set
+# CONFIG_FTRACE is not set
+CONFIG_DEBUG_LL=3Dy
+CONFIG_EARLY_PRINTK=3Dy
diff --git a/arch/arm/mach-efm32/Makefile b/arch/arm/mach-efm32/Makefil=
e
new file mode 100644
index 0000000..081f45a
--- /dev/null
+++ b/arch/arm/mach-efm32/Makefile
@@ -0,0 +1 @@
+obj-y +=3D common.o dtmachine.o
diff --git a/arch/arm/mach-efm32/Makefile.boot b/arch/arm/mach-efm32/Ma=
kefile.boot
new file mode 100644
index 0000000..1d56a92
--- /dev/null
+++ b/arch/arm/mach-efm32/Makefile.boot
@@ -0,0 +1,2 @@
+# This file is still needed because we cannot select ARCH_MULTIPLATFOR=
M (as it
+# depends on MMU) and then this file is sourced in arch/arm/boot/Makef=
ile
diff --git a/arch/arm/mach-efm32/cmu.h b/arch/arm/mach-efm32/cmu.h
new file mode 100644
index 0000000..a7e5741
--- /dev/null
+++ b/arch/arm/mach-efm32/cmu.h
@@ -0,0 +1,15 @@
+/*
+ * Register definition for efm32's CMU component
+ */
+
+#define CMU_OSCENCMD		0x20
+#define CMU_OSCENCMD_HFXOEN		0x00000004
+
+#define CMU_CMD			0x24
+#define CMU_CMD_HFCLKSEL_HFXO		0x00000002
+
+#define CMU_STATUS		0x2c
+#define CMU_STATUS_HFRCOSEL		0x00000400
+#define CMU_STATUS_HFXOSEL		0x00000800
+
+#define CMU_HFPERCLKEN0		0x44
diff --git a/arch/arm/mach-efm32/common.c b/arch/arm/mach-efm32/common.=
c
new file mode 100644
index 0000000..3a4528d
--- /dev/null
+++ b/arch/arm/mach-efm32/common.c
@@ -0,0 +1,19 @@
+/*
+ * Copyright (C) 2012-2013 Uwe Kleine-Koenig for Pengutronix
+ *
+ * This program is free software; you can redistribute it and/or modif=
y it under
+ * the terms of the GNU General Public License version 2 as published =
by the
+ * Free Software Foundation.
+ */
+#include <linux/kernel.h>
+#include <linux/init.h>
+#include <linux/clk-provider.h>
+#include <linux/clocksource.h>
+
+#include "common.h"
+
+void __init efm32_init_time(void)
+{
+	of_clk_init(NULL);
+	clocksource_of_init();
+}
diff --git a/arch/arm/mach-efm32/common.h b/arch/arm/mach-efm32/common.=
h
new file mode 100644
index 0000000..5ee82f2
--- /dev/null
+++ b/arch/arm/mach-efm32/common.h
@@ -0,0 +1 @@
+void efm32_init_time(void);
diff --git a/arch/arm/mach-efm32/dtmachine.c b/arch/arm/mach-efm32/dtma=
chine.c
new file mode 100644
index 0000000..d0362e3
--- /dev/null
+++ b/arch/arm/mach-efm32/dtmachine.c
@@ -0,0 +1,31 @@
+#include <linux/kernel.h>
+#include <linux/pinctrl/machine.h>
+#include <linux/irqdomain.h>
+#include <linux/of_platform.h>
+#include <linux/of_irq.h>
+#include <linux/irqchip.h>
+
+#include <asm/v7m.h>
+
+#include <asm/mach/arch.h>
+#include <asm/mach/time.h>
+
+#include "common.h"
+
+static void __init efm32_init(void)
+{
+	of_platform_populate(NULL, of_default_bus_match_table, NULL, NULL);
+}
+
+static const char *const efm32gg_compat[] __initconst =3D {
+	"efm32,dk3750",
+	NULL
+};
+
+DT_MACHINE_START(EFM32DT, "EFM32 (Device Tree Support)")
+	.init_irq =3D irqchip_init,
+	.init_time =3D efm32_init_time,
+	.init_machine =3D efm32_init,
+	.dt_compat =3D efm32gg_compat,
+	.restart =3D armv7m_restart,
+MACHINE_END
diff --git a/arch/arm/mach-efm32/include/mach/debug-macro.S b/arch/arm/=
mach-efm32/include/mach/debug-macro.S
new file mode 100644
index 0000000..c58915c
--- /dev/null
+++ b/arch/arm/mach-efm32/include/mach/debug-macro.S
@@ -0,0 +1,48 @@
+/*
+ * This program is free software; you can redistribute it and/or modif=
y
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#define UARTn_CMD		0x000c
+#define UARTn_CMD_TXEN			0x0004
+
+#define	UARTn_STATUS		0x0010
+#define	UARTn_STATUS_TXC		0x0020
+#define	UARTn_STATUS_TXBL		0x0040
+
+#define	UARTn_TXDATA		0x0034
+
+		.macro	addruart, rx, tmp
+#if defined(CONFIG_DEBUG_EFM32_USART1)
+		ldr	\rx, =3D(0x4000c400)		/* USART1 */
+#elif defined(CONFIG_DEBUG_EFM32_UART1)
+		ldr	\rx, =3D(0x4000e400)		/* UART1 */
+#else
+#error "No debug port configured"
+#endif
+		/*
+		 * enable TX. The driver might disable that to save energy. We
+		 * don't care about disabling at the end as during debug power
+		 * consumption isn't that important.
+		 */
+		ldr	\tmp, =3D(UARTn_CMD_TXEN)
+		str	\tmp, [\rx, #UARTn_CMD]
+		.endm
+
+
+		.macro	senduart,rd,rx
+		strb	\rd, [\rx, #UARTn_TXDATA]
+		.endm
+
+		.macro	waituart,rd,rx
+1001:		ldr	\rd, [\rx, #UARTn_STATUS]
+		tst	\rd, #UARTn_STATUS_TXBL
+		beq	1001b
+		.endm
+
+		.macro	busyuart,rd,rx
+1001:		ldr	\rd, [\rx, UARTn_STATUS]
+		tst	\rd, #UARTn_STATUS_TXC
+		bne	1001b
+		.endm
diff --git a/arch/arm/mach-efm32/include/mach/entry-macro.S b/arch/arm/=
mach-efm32/include/mach/entry-macro.S
new file mode 100644
index 0000000..f0c0f7d
--- /dev/null
+++ b/arch/arm/mach-efm32/include/mach/entry-macro.S
@@ -0,0 +1,5 @@
+		.macro	get_irqnr_preamble, base, tmp
+		.endm
+
+		.macro	arch_ret_to_user, tmp1, tmp2
+		.endm
diff --git a/arch/arm/mach-efm32/include/mach/io.h b/arch/arm/mach-efm3=
2/include/mach/io.h
new file mode 100644
index 0000000..bc3519b
--- /dev/null
+++ b/arch/arm/mach-efm32/include/mach/io.h
@@ -0,0 +1,6 @@
+#ifndef __MACH_IO_H__
+#define __MACH_IO_H__
+
+#define __mem_pci(a)		(a)
+
+#endif /* __MACH_IO_H__ */
diff --git a/arch/arm/mach-efm32/include/mach/irqs.h b/arch/arm/mach-ef=
m32/include/mach/irqs.h
new file mode 100644
index 0000000..e33ed12
--- /dev/null
+++ b/arch/arm/mach-efm32/include/mach/irqs.h
@@ -0,0 +1,6 @@
+#ifndef __MACH_IRQS_H__
+#define __MACH_IRQS_H__
+
+#define NR_IRQS			82
+
+#endif /* __MACH_IRQS_H__ */
diff --git a/arch/arm/mach-efm32/include/mach/timex.h b/arch/arm/mach-e=
fm32/include/mach/timex.h
new file mode 100644
index 0000000..b408dce
--- /dev/null
+++ b/arch/arm/mach-efm32/include/mach/timex.h
@@ -0,0 +1,7 @@
+#ifndef __MACH_TIMEX_H__
+#define __MACH_TIMEX_H__
+
+/* just a bogus value */
+#define CLOCK_TICK_RATE	12345678
+
+#endif /* __MACH_TIMEX_H__ */
--=20
1.8.4.rc3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
