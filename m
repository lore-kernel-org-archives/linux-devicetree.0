From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v3] ARM: new platform for Energy Micro's EFM32 Cortex-M3 SoCs
Date: Thu,  3 Oct 2013 22:36:57 +0200
Message-ID: <1380832617-2199-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Jonathan Austin <jonathan.austin-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
Changes since v2, sent with
Message-id:1379447884-14025-1-git-send-email-u.kleine-koenig@pengutroni=
x.de
   =20
    - merge common.c and dtmachine.c
    - drop init_{irq,time,machine}
      dropping init_time adds a runtime dependency on Sebastian Hesselb=
arth's patch
      "ARM: call of_clk_init from default time_init handler"
      (Message-Id: 1379922870-2325-1-git-send-email-sebastian.hesselbar=
th-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org)
    - drop selection of HAVE_CLK as this is implied by COMMON_CLK
    - adapt for ARCH_MULTIPLATFORM, drop all headers from include/mach =
and
      Makefile.boot. This makes this patch depend on my patches
        ARM: drop !ARCH_MULTIPLATFORM dependency of XIP_KERNEL
        ARM: allow MULTIPLATFORM on no-MMU machines; and
        [RFC] ARM: prepare ARMv7-M for MULTIPLATFORM use

 arch/arm/Kconfig                 |   4 +-
 arch/arm/Makefile                |   1 +
 arch/arm/configs/efm32_defconfig | 104 +++++++++++++++++++++++++++++++=
++++++++
 arch/arm/mach-efm32/Kconfig      |   8 +++
 arch/arm/mach-efm32/Makefile     |   1 +
 arch/arm/mach-efm32/cmu.h        |  15 ++++++
 arch/arm/mach-efm32/dtmachine.c  |  21 ++++++++
 7 files changed, 153 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/configs/efm32_defconfig
 create mode 100644 arch/arm/mach-efm32/Kconfig
 create mode 100644 arch/arm/mach-efm32/Makefile
 create mode 100644 arch/arm/mach-efm32/cmu.h
 create mode 100644 arch/arm/mach-efm32/dtmachine.c

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 4d749fa..c9c4f4d 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -946,6 +946,8 @@ source "arch/arm/mach-dove/Kconfig"
=20
 source "arch/arm/mach-ep93xx/Kconfig"
=20
+source "arch/arm/mach-efm32/Kconfig"
+
 source "arch/arm/mach-footbridge/Kconfig"
=20
 source "arch/arm/mach-gemini/Kconfig"
@@ -1833,7 +1835,7 @@ config FORCE_MAX_ZONEORDER
 	int "Maximum zone order" if ARCH_SHMOBILE
 	range 11 64 if ARCH_SHMOBILE
 	default "12" if SOC_AM33XX
-	default "9" if SA1111
+	default "9" if SA1111 || ARCH_EFM32
 	default "11"
 	help
 	  The kernel memory allocator divides physically contiguous memory
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
diff --git a/arch/arm/mach-efm32/Kconfig b/arch/arm/mach-efm32/Kconfig
new file mode 100644
index 0000000..941e4a6
--- /dev/null
+++ b/arch/arm/mach-efm32/Kconfig
@@ -0,0 +1,8 @@
+config ARCH_EFM32
+        bool "Energy Micro Cortex M3 Platform" if ARCH_MULTI_V7M
+        select ARM_NVIC
+        select CLKSRC_MMIO
+        select CLKSRC_OF
+        select GENERIC_CLOCKEVENTS
+        select NO_DMA
+        select NO_IOPORT
diff --git a/arch/arm/mach-efm32/Makefile b/arch/arm/mach-efm32/Makefil=
e
new file mode 100644
index 0000000..081f45a
--- /dev/null
+++ b/arch/arm/mach-efm32/Makefile
@@ -0,0 +1 @@
+obj-y +=3D common.o dtmachine.o
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
diff --git a/arch/arm/mach-efm32/dtmachine.c b/arch/arm/mach-efm32/dtma=
chine.c
new file mode 100644
index 0000000..cf3461b
--- /dev/null
+++ b/arch/arm/mach-efm32/dtmachine.c
@@ -0,0 +1,21 @@
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
+static const char *const efm32gg_compat[] __initconst =3D {
+	"efm32,dk3750",
+	NULL
+};
+
+DT_MACHINE_START(EFM32DT, "EFM32 (Device Tree Support)")
+	.dt_compat =3D efm32gg_compat,
+	.restart =3D armv7m_restart,
+MACHINE_END
--=20
1.8.4.rc3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
