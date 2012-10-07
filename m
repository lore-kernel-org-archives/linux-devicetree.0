From: Domenico Andreoli <cavokz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/6] ARM: bcm476x: Add infrastructure
Date: Sun, 07 Oct 2012 03:53:01 +0200
Message-ID: <20121007015405.958959522@gmail.com>
References: <20121007015300.828366635@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline; filename=arm-bcm476x-add-infrastructure.patch
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
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Domenico Andreoli <domenico.andreoli-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Domenico Andreoli <domenico.andreoli-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org>

BCM476x's minimal infrastructure, Kernel's great reuse.

Look mom, no include/mach directory!

Signed-off-by: Domenico Andreoli <domenico.andreoli-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org>
---
 Documentation/devicetree/bindings/arm/bcm476x.txt |    8 +
 MAINTAINERS                                       |    9 +
 arch/arm/Kconfig                                  |    2 +
 arch/arm/Makefile                                 |    1 +
 arch/arm/boot/dts/bcm476x-catalina.dts            |   11 +
 arch/arm/boot/dts/bcm476x.dtsi                    |   31 ++
 arch/arm/configs/bcm476x_defconfig                |  352 ++++++++++++++++++++++
 arch/arm/include/debug/bcm476x-uncompress.h       |   53 +++
 arch/arm/include/debug/bcm476x.S                  |   35 ++
 arch/arm/mach-bcm476x/Kconfig                     |   17 +
 arch/arm/mach-bcm476x/Makefile                    |    1 +
 arch/arm/mach-bcm476x/Makefile.boot               |    5 +
 arch/arm/mach-bcm476x/bcm476x.c                   |   83 +++++
 13 files changed, 608 insertions(+)

Index: b/Documentation/devicetree/bindings/arm/bcm476x.txt
===================================================================
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/bcm476x.txt
@@ -0,0 +1,8 @@
+Broadcom BCM476x device tree bindings
+-------------------------------------------
+
+Boards with the BCM476x SoC shall have the following properties:
+
+Required root node property:
+
+compatible = "brcm,bcm476x";
Index: b/arch/arm/Kconfig
===================================================================
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1017,6 +1017,8 @@ source "arch/arm/mach-mvebu/Kconfig"
 
 source "arch/arm/mach-at91/Kconfig"
 
+source "arch/arm/mach-bcm476x/Kconfig"
+
 source "arch/arm/mach-clps711x/Kconfig"
 
 source "arch/arm/mach-cns3xxx/Kconfig"
Index: b/arch/arm/Makefile
===================================================================
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -137,6 +137,7 @@ textofs-$(CONFIG_ARCH_MSM8960) := 0x0020
 # by CONFIG_* macro name.
 machine-$(CONFIG_ARCH_AT91)		+= at91
 machine-$(CONFIG_ARCH_BCM2835)		+= bcm2835
+machine-$(CONFIG_ARCH_BCM476X)		:= bcm476x
 machine-$(CONFIG_ARCH_CLPS711X)		+= clps711x
 machine-$(CONFIG_ARCH_CNS3XXX)		+= cns3xxx
 machine-$(CONFIG_ARCH_DAVINCI)		+= davinci
Index: b/arch/arm/boot/dts/bcm476x-catalina.dts
===================================================================
--- /dev/null
+++ b/arch/arm/boot/dts/bcm476x-catalina.dts
@@ -0,0 +1,11 @@
+/dts-v1/;
+/include/ "bcm476x.dtsi"
+
+/ {
+	compatible = "brcm,catalina", "brcm,bcm476x";
+	model = "Broadcom Catalina";
+
+	memory {
+		reg = <0x30000000 0x4000000>;
+	};
+};
Index: b/arch/arm/boot/dts/bcm476x.dtsi
===================================================================
--- /dev/null
+++ b/arch/arm/boot/dts/bcm476x.dtsi
@@ -0,0 +1,31 @@
+/include/ "skeleton.dtsi"
+
+/ {
+	compatible = "brcm,bcm476x";
+	model = "Broadcom BCM476x";
+
+	chosen {
+		bootargs = "earlyprintk";
+	};
+
+	amba {
+		compatible = "arm,amba-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		vic0: interrupt-controller@80000 {
+			compatible = "brcm,bcm476x-pl192", "arm,pl192-vic", "arm,primecell";
+			reg = <0x80000 0x1000>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+		};
+
+		vic1: interrupt-controller@81000 {
+			compatible = "brcm,bcm476x-pl192", "arm,pl192-vic", "arm,primecell";
+			reg = <0x81000 0x1000>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+		};
+	};
+};
Index: b/arch/arm/configs/bcm476x_defconfig
===================================================================
--- /dev/null
+++ b/arch/arm/configs/bcm476x_defconfig
@@ -0,0 +1,352 @@
+CONFIG_ARM=y
+CONFIG_SYS_SUPPORTS_APM_EMULATION=y
+CONFIG_HAVE_PROC_CPU=y
+CONFIG_NO_IOPORT=y
+CONFIG_STACKTRACE_SUPPORT=y
+CONFIG_HAVE_LATENCYTOP_SUPPORT=y
+CONFIG_LOCKDEP_SUPPORT=y
+CONFIG_TRACE_IRQFLAGS_SUPPORT=y
+CONFIG_RWSEM_GENERIC_SPINLOCK=y
+CONFIG_GENERIC_HWEIGHT=y
+CONFIG_GENERIC_CALIBRATE_DELAY=y
+CONFIG_NEED_DMA_MAP_STATE=y
+CONFIG_VECTORS_BASE=0xffff0000
+CONFIG_ARM_PATCH_PHYS_VIRT=y
+CONFIG_GENERIC_BUG=y
+CONFIG_DEFCONFIG_LIST="/lib/modules/$UNAME_RELEASE/.config"
+CONFIG_HAVE_IRQ_WORK=y
+CONFIG_EXPERIMENTAL=y
+CONFIG_BROKEN_ON_SMP=y
+CONFIG_INIT_ENV_ARG_LIMIT=32
+CONFIG_CROSS_COMPILE=""
+CONFIG_LOCALVERSION=""
+CONFIG_HAVE_KERNEL_GZIP=y
+CONFIG_HAVE_KERNEL_LZMA=y
+CONFIG_HAVE_KERNEL_XZ=y
+CONFIG_HAVE_KERNEL_LZO=y
+CONFIG_KERNEL_GZIP=y
+CONFIG_DEFAULT_HOSTNAME="(none)"
+CONFIG_HAVE_GENERIC_HARDIRQS=y
+CONFIG_GENERIC_HARDIRQS=y
+CONFIG_GENERIC_IRQ_PROBE=y
+CONFIG_GENERIC_IRQ_SHOW=y
+CONFIG_HARDIRQS_SW_RESEND=y
+CONFIG_GENERIC_IRQ_CHIP=y
+CONFIG_IRQ_DOMAIN=y
+CONFIG_IRQ_DOMAIN_DEBUG=y
+CONFIG_SPARSE_IRQ=y
+CONFIG_KTIME_SCALAR=y
+CONFIG_GENERIC_CLOCKEVENTS=y
+CONFIG_GENERIC_CLOCKEVENTS_BUILD=y
+CONFIG_TINY_RCU=y
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
+CONFIG_LOG_BUF_SHIFT=17
+CONFIG_NAMESPACES=y
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_INITRAMFS_SOURCE=""
+CONFIG_RD_GZIP=y
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
+CONFIG_SYSCTL=y
+CONFIG_ANON_INODES=y
+CONFIG_EXPERT=y
+CONFIG_UID16=y
+CONFIG_KALLSYMS=y
+CONFIG_HOTPLUG=y
+CONFIG_PRINTK=y
+CONFIG_BUG=y
+CONFIG_ELF_CORE=y
+CONFIG_BASE_FULL=y
+CONFIG_FUTEX=y
+CONFIG_EPOLL=y
+CONFIG_SIGNALFD=y
+CONFIG_TIMERFD=y
+CONFIG_EVENTFD=y
+CONFIG_SHMEM=y
+CONFIG_AIO=y
+CONFIG_EMBEDDED=y
+CONFIG_HAVE_PERF_EVENTS=y
+CONFIG_PERF_USE_VMALLOC=y
+CONFIG_VM_EVENT_COUNTERS=y
+CONFIG_SLAB=y
+CONFIG_HAVE_OPROFILE=y
+CONFIG_HAVE_KPROBES=y
+CONFIG_HAVE_KRETPROBES=y
+CONFIG_HAVE_ARCH_TRACEHOOK=y
+CONFIG_HAVE_DMA_ATTRS=y
+CONFIG_HAVE_DMA_CONTIGUOUS=y
+CONFIG_GENERIC_SMP_IDLE_THREAD=y
+CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
+CONFIG_HAVE_CLK=y
+CONFIG_HAVE_DMA_API_DEBUG=y
+CONFIG_HAVE_ARCH_JUMP_LABEL=y
+CONFIG_ARCH_WANT_IPC_PARSE_VERSION=y
+CONFIG_HAVE_GENERIC_DMA_COHERENT=y
+CONFIG_SLABINFO=y
+CONFIG_RT_MUTEXES=y
+CONFIG_BASE_SMALL=0
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_BLOCK=y
+CONFIG_MSDOS_PARTITION=y
+CONFIG_IOSCHED_NOOP=y
+CONFIG_DEFAULT_NOOP=y
+CONFIG_DEFAULT_IOSCHED="noop"
+CONFIG_INLINE_SPIN_UNLOCK_IRQ=y
+CONFIG_INLINE_READ_UNLOCK=y
+CONFIG_INLINE_READ_UNLOCK_IRQ=y
+CONFIG_INLINE_WRITE_UNLOCK=y
+CONFIG_INLINE_WRITE_UNLOCK_IRQ=y
+CONFIG_MMU=y
+CONFIG_ARCH_MULTIPLATFORM=y
+CONFIG_ARCH_MULTI_V6=y
+CONFIG_ARCH_MULTI_V6_V7=y
+CONFIG_ARCH_BCM476X=y
+CONFIG_CPU_V6=y
+CONFIG_CPU_32v6=y
+CONFIG_CPU_ABRT_EV6=y
+CONFIG_CPU_PABRT_V6=y
+CONFIG_CPU_CACHE_V6=y
+CONFIG_CPU_CACHE_VIPT=y
+CONFIG_CPU_COPY_V6=y
+CONFIG_CPU_TLB_V6=y
+CONFIG_CPU_HAS_ASID=y
+CONFIG_CPU_CP15=y
+CONFIG_CPU_CP15_MMU=y
+CONFIG_CPU_USE_DOMAINS=y
+CONFIG_ARM_THUMB=y
+CONFIG_ARM_L1_CACHE_SHIFT=5
+CONFIG_ARM_DMA_MEM_BUFFERABLE=y
+CONFIG_ARM_NR_BANKS=8
+CONFIG_CPU_HAS_PMU=y
+CONFIG_MULTI_IRQ_HANDLER=y
+CONFIG_ARM_ERRATA_411920=y
+CONFIG_ARM_ERRATA_364296=y
+CONFIG_ARM_VIC=y
+CONFIG_ARM_VIC_NR=2
+CONFIG_ARM_AMBA=y
+CONFIG_VMSPLIT_3G=y
+CONFIG_PAGE_OFFSET=0xC0000000
+CONFIG_ARCH_NR_GPIO=0
+CONFIG_PREEMPT_NONE=y
+CONFIG_PREEMPT_COUNT=y
+CONFIG_HZ=100
+CONFIG_AEABI=y
+CONFIG_HAVE_ARCH_PFN_VALID=y
+CONFIG_SELECT_MEMORY_MODEL=y
+CONFIG_FLATMEM_MANUAL=y
+CONFIG_FLATMEM=y
+CONFIG_FLAT_NODE_MEM_MAP=y
+CONFIG_HAVE_MEMBLOCK=y
+CONFIG_MEMORY_ISOLATION=y
+CONFIG_PAGEFLAGS_EXTENDED=y
+CONFIG_SPLIT_PTLOCK_CPUS=4
+CONFIG_MIGRATION=y
+CONFIG_ZONE_DMA_FLAG=0
+CONFIG_VIRT_TO_BUS=y
+CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
+CONFIG_CROSS_MEMORY_ATTACH=y
+CONFIG_NEED_PER_CPU_KM=y
+CONFIG_FORCE_MAX_ZONEORDER=11
+CONFIG_ALIGNMENT_TRAP=y
+CONFIG_DEPRECATED_PARAM_STRUCT=y
+CONFIG_USE_OF=y
+CONFIG_ZBOOT_ROM_TEXT=0
+CONFIG_ZBOOT_ROM_BSS=0
+CONFIG_ARM_APPENDED_DTB=y
+CONFIG_ARM_ATAG_DTB_COMPAT=y
+CONFIG_ARM_ATAG_DTB_COMPAT_CMDLINE_FROM_BOOTLOADER=y
+CONFIG_CMDLINE="root=/dev/mmcblk0p2 ro console=ttyAMA1,115200 rootwait init=/bin/bash"
+CONFIG_CMDLINE_FROM_BOOTLOADER=y
+CONFIG_AUTO_ZRELADDR=y
+CONFIG_VFP=y
+CONFIG_BINFMT_ELF=y
+CONFIG_ARCH_BINFMT_ELF_RANDOMIZE_PIE=y
+CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS=y
+CONFIG_HAVE_AOUT=y
+CONFIG_ARCH_SUSPEND_POSSIBLE=y
+CONFIG_HAVE_BPF_JIT=y
+CONFIG_UEVENT_HELPER_PATH=""
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_STANDALONE=y
+CONFIG_PREVENT_FIRMWARE_BUILD=y
+CONFIG_FW_LOADER=y
+CONFIG_EXTRA_FIRMWARE=""
+CONFIG_CMA=y
+CONFIG_CMA_SIZE_MBYTES=16
+CONFIG_CMA_SIZE_SEL_MBYTES=y
+CONFIG_CMA_ALIGNMENT=8
+CONFIG_CMA_AREAS=7
+CONFIG_DTC=y
+CONFIG_OF=y
+CONFIG_PROC_DEVICETREE=y
+CONFIG_OF_FLATTREE=y
+CONFIG_OF_EARLY_FLATTREE=y
+CONFIG_OF_ADDRESS=y
+CONFIG_OF_IRQ=y
+CONFIG_OF_DEVICE=y
+CONFIG_OF_I2C=y
+CONFIG_BLK_DEV=y
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_BLK_DEV_LOOP_MIN_COUNT=8
+CONFIG_BLK_DEV_RAM=y
+CONFIG_BLK_DEV_RAM_COUNT=16
+CONFIG_BLK_DEV_RAM_SIZE=4096
+CONFIG_SCSI_MOD=y
+CONFIG_SCSI=y
+CONFIG_SCSI_DMA=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_SCSI_MULTI_LUN=y
+CONFIG_INPUT=y
+CONFIG_INPUT_EVDEV=y
+CONFIG_SERIO=y
+CONFIG_SERIO_SERPORT=y
+CONFIG_VT=y
+CONFIG_CONSOLE_TRANSLATIONS=y
+CONFIG_VT_CONSOLE=y
+CONFIG_HW_CONSOLE=y
+CONFIG_UNIX98_PTYS=y
+CONFIG_SERIAL_AMBA_PL010=y
+CONFIG_SERIAL_AMBA_PL010_CONSOLE=y
+CONFIG_SERIAL_AMBA_PL011=y
+CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
+CONFIG_SERIAL_CORE=y
+CONFIG_SERIAL_CORE_CONSOLE=y
+CONFIG_I2C=y
+CONFIG_I2C_BOARDINFO=y
+CONFIG_I2C_CHARDEV=y
+CONFIG_I2C_ALGOBIT=y
+CONFIG_SPI=y
+CONFIG_SPI_MASTER=y
+CONFIG_SPI_PL022=y
+CONFIG_PINCTRL=y
+CONFIG_PINMUX=y
+CONFIG_PINCONF=y
+CONFIG_DEBUG_PINCTRL=y
+CONFIG_PINCTRL_BCM476X=y
+CONFIG_ARCH_HAVE_CUSTOM_GPIO_H=y
+CONFIG_ARCH_WANT_OPTIONAL_GPIOLIB=y
+CONFIG_SSB_POSSIBLE=y
+CONFIG_SSB=y
+CONFIG_SSB_SDIOHOST_POSSIBLE=y
+CONFIG_BCMA_POSSIBLE=y
+CONFIG_BCMA=y
+CONFIG_REGULATOR=y
+CONFIG_REGULATOR_DEBUG=y
+CONFIG_REGULATOR_BCM59040=y
+CONFIG_DUMMY_CONSOLE=y
+CONFIG_HID=y
+CONFIG_HID_GENERIC=y
+CONFIG_USB_SUPPORT=y
+CONFIG_USB_COMMON=y
+CONFIG_USB_ARCH_HAS_HCD=y
+CONFIG_USB_GADGET=y
+CONFIG_USB_GADGET_VBUS_DRAW=2
+CONFIG_USB_GADGET_STORAGE_NUM_BUFFERS=2
+CONFIG_USB_MASS_STORAGE=y
+CONFIG_MMC=y
+CONFIG_MMC_DEBUG=y
+CONFIG_MMC_BLOCK=y
+CONFIG_MMC_BLOCK_MINORS=8
+CONFIG_MMC_SDHCI=y
+CONFIG_MMC_SDHCI_PLTFM=y
+CONFIG_RTC_LIB=y
+CONFIG_DMADEVICES=y
+CONFIG_AMBA_PL08X=y
+CONFIG_DMA_ENGINE=y
+CONFIG_DMA_VIRTUAL_CHANNELS=y
+CONFIG_CLKDEV_LOOKUP=y
+CONFIG_HAVE_CLK_PREPARE=y
+CONFIG_COMMON_CLK=y
+CONFIG_COMMON_CLK_DEBUG=y
+CONFIG_CLKSRC_MMIO=y
+CONFIG_DCACHE_WORD_ACCESS=y
+CONFIG_EXT2_FS=y
+CONFIG_EXT3_FS=y
+CONFIG_EXT4_FS=y
+CONFIG_JBD=y
+CONFIG_JBD2=y
+CONFIG_FILE_LOCKING=y
+CONFIG_FSNOTIFY=y
+CONFIG_DNOTIFY=y
+CONFIG_INOTIFY_USER=y
+CONFIG_FANOTIFY=y
+CONFIG_FAT_FS=y
+CONFIG_MSDOS_FS=y
+CONFIG_VFAT_FS=y
+CONFIG_FAT_DEFAULT_CODEPAGE=437
+CONFIG_FAT_DEFAULT_IOCHARSET="iso8859-1"
+CONFIG_PROC_FS=y
+CONFIG_PROC_SYSCTL=y
+CONFIG_PROC_PAGE_MONITOR=y
+CONFIG_SYSFS=y
+CONFIG_TMPFS=y
+CONFIG_MISC_FILESYSTEMS=y
+CONFIG_CRAMFS=y
+CONFIG_ROMFS_FS=y
+CONFIG_ROMFS_BACKED_BY_BLOCK=y
+CONFIG_ROMFS_ON_BLOCK=y
+CONFIG_NLS=y
+CONFIG_NLS_DEFAULT="iso8859-1"
+CONFIG_NLS_CODEPAGE_437=y
+CONFIG_NLS_CODEPAGE_850=y
+CONFIG_NLS_ISO8859_1=y
+CONFIG_NLS_ISO8859_15=y
+CONFIG_PRINTK_TIME=y
+CONFIG_DEFAULT_MESSAGE_LOGLEVEL=7
+CONFIG_ENABLE_WARN_DEPRECATED=y
+CONFIG_ENABLE_MUST_CHECK=y
+CONFIG_FRAME_WARN=1024
+CONFIG_MAGIC_SYSRQ=y
+CONFIG_STRIP_ASM_SYMS=y
+CONFIG_DEBUG_FS=y
+CONFIG_DEBUG_SECTION_MISMATCH=y
+CONFIG_DEBUG_KERNEL=y
+CONFIG_PANIC_ON_OOPS_VALUE=0
+CONFIG_DEBUG_ATOMIC_SLEEP=y
+CONFIG_DEBUG_BUGVERBOSE=y
+CONFIG_DEBUG_INFO=y
+CONFIG_DEBUG_INFO_REDUCED=y
+CONFIG_FRAME_POINTER=y
+CONFIG_HAVE_FUNCTION_TRACER=y
+CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
+CONFIG_HAVE_DYNAMIC_FTRACE=y
+CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
+CONFIG_HAVE_C_RECORDMCOUNT=y
+CONFIG_TRACING_SUPPORT=y
+CONFIG_HAVE_ARCH_KGDB=y
+CONFIG_DEBUG_LL=y
+CONFIG_DEBUG_BCM476X_UART2=y
+CONFIG_DEBUG_LL_INCLUDE="debug/bcm476x.S"
+CONFIG_UNCOMPRESS_INCLUDE="debug/bcm476x-uncompress.h"
+CONFIG_EARLY_PRINTK=y
+CONFIG_DEFAULT_SECURITY_DAC=y
+CONFIG_DEFAULT_SECURITY=""
+CONFIG_CRYPTO=y
+CONFIG_CRYPTO_ALGAPI=y
+CONFIG_CRYPTO_ALGAPI2=y
+CONFIG_CRYPTO_BLKCIPHER=y
+CONFIG_CRYPTO_BLKCIPHER2=y
+CONFIG_CRYPTO_HASH=y
+CONFIG_CRYPTO_HASH2=y
+CONFIG_CRYPTO_RNG2=y
+CONFIG_CRYPTO_WORKQUEUE=y
+CONFIG_CRYPTO_CRC32C=y
+CONFIG_CRYPTO_AES=y
+CONFIG_CRYPTO_ARC4=y
+CONFIG_BITREVERSE=y
+CONFIG_GENERIC_STRNCPY_FROM_USER=y
+CONFIG_GENERIC_STRNLEN_USER=y
+CONFIG_GENERIC_PCI_IOMAP=y
+CONFIG_GENERIC_IO=y
+CONFIG_CRC16=y
+CONFIG_CRC32=y
+CONFIG_CRC32_SLICEBY8=y
+CONFIG_ZLIB_INFLATE=y
+CONFIG_DECOMPRESS_GZIP=y
+CONFIG_HAS_IOMEM=y
+CONFIG_HAS_DMA=y
+CONFIG_GENERIC_ATOMIC64=y
+CONFIG_ARCH_HAS_ATOMIC64_DEC_IF_POSITIVE=y
+CONFIG_AVERAGE=y
Index: b/arch/arm/mach-bcm476x/Makefile
===================================================================
--- /dev/null
+++ b/arch/arm/mach-bcm476x/Makefile
@@ -0,0 +1 @@
+obj-y += bcm476x.o
Index: b/arch/arm/mach-bcm476x/Makefile.boot
===================================================================
--- /dev/null
+++ b/arch/arm/mach-bcm476x/Makefile.boot
@@ -0,0 +1,5 @@
+   zreladdr-y := 0x00008000
+params_phys-y := 0x00000100
+initrd_phys-y := 0x00800000
+
+dtb-y += bcm4760-catalina.dtb
Index: b/arch/arm/mach-bcm476x/bcm476x.c
===================================================================
--- /dev/null
+++ b/arch/arm/mach-bcm476x/bcm476x.c
@@ -0,0 +1,83 @@
+/*
+ * Broadcom BCM476x SoCs platform support
+ *
+ * Copyright (C) 2012 Domenico Andreoli <domenico.andreoli-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/init.h>
+#include <linux/of_irq.h>
+#include <linux/of_platform.h>
+
+#include <asm/hardware/vic.h>
+#include <asm/mach/arch.h>
+#include <asm/mach/map.h>
+#include <asm/mach/time.h>
+
+#define BCM476X_PERIPH_PHYS   0x00080000
+#define BCM476X_PERIPH_VIRT   0xd0080000
+#define BCM476X_PERIPH_SIZE   SZ_512K
+
+static struct map_desc io_map __initdata = {
+	.virtual = BCM476X_PERIPH_VIRT,
+	.pfn = __phys_to_pfn(BCM476X_PERIPH_PHYS),
+	.length = BCM476X_PERIPH_SIZE,
+	.type = MT_DEVICE,
+};
+
+void __init bcm476x_map_io(void)
+{
+	iotable_init(&io_map, 1);
+}
+
+void __init bcm476x_init(void)
+{
+	int ret;
+
+	ret = of_platform_populate(NULL, of_default_bus_match_table, NULL, NULL);
+	if (ret) {
+		pr_err("of_platform_populate failed: %d\n", ret);
+		BUG();
+	}
+}
+
+static const struct of_device_id vic_of_match[] __initconst = {
+	{ .compatible = "arm,pl192-vic", .data = vic_of_init, },
+	{ /* Sentinel */ }
+};
+
+static void __init bcm476x_init_irq(void)
+{
+	of_irq_init(vic_of_match);
+}
+
+static void __init bcm476x_timer_init(void)
+{
+}
+
+struct sys_timer bcm476x_timer = {
+	.init = bcm476x_timer_init
+};
+
+static const char * const bcm476x_compat[] = {
+	"brcm,bcm476x",
+	NULL
+};
+
+DT_MACHINE_START(BCM476X, "Broadcom BCM476x")
+	.map_io = bcm476x_map_io,
+	.init_irq = bcm476x_init_irq,
+	.handle_irq = vic_handle_irq,
+	.init_machine = bcm476x_init,
+	.timer = &bcm476x_timer,
+	.dt_compat = bcm476x_compat
+MACHINE_END
Index: b/arch/arm/include/debug/bcm476x.S
===================================================================
--- /dev/null
+++ b/arch/arm/include/debug/bcm476x.S
@@ -0,0 +1,35 @@
+/*
+ * Broadcom BCM476x SoCs DEBUG_LL support
+ *
+ * Copyright (C) 2012 Domenico Andreoli <domenico.andreoli-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#if defined(CONFIG_DEBUG_BCM476X_UART0)
+# define BCM476X_DEBUG_PHYS	0x000c0000
+# define BCM476X_DEBUG_VIRT	0xd00c0000
+#elif defined(CONFIG_DEBUG_BCM476X_UART1)
+# define BCM476X_DEBUG_PHYS	0x000c1000
+# define BCM476X_DEBUG_VIRT	0xd00c1000
+#elif defined(CONFIG_DEBUG_BCM476X_UART2)
+# define BCM476X_DEBUG_PHYS	0x000b2000
+# define BCM476X_DEBUG_VIRT	0xd00b2000
+#else
+# error Unknown BCM476x debug port
+#endif
+
+	.macro	addruart, rp, rv, tmp
+	ldr	\rp, =BCM476X_DEBUG_PHYS
+	ldr	\rv, =BCM476X_DEBUG_VIRT
+	.endm
+
+#include <asm/hardware/debug-pl01x.S>
Index: b/arch/arm/include/debug/bcm476x-uncompress.h
===================================================================
--- /dev/null
+++ b/arch/arm/include/debug/bcm476x-uncompress.h
@@ -0,0 +1,53 @@
+/*
+ * Broadcom BCM476x SoCs decompressor output
+ *
+ * Copyright (C) 2012 Domenico Andreoli <domenico.andreoli-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/io.h>
+#include <linux/amba/serial.h>
+
+#if defined(CONFIG_DEBUG_BCM476X_UART0)
+# define BCM476X_DEBUG_PHYS	0x000c0000
+#elif defined(CONFIG_DEBUG_BCM476X_UART1)
+# define BCM476X_DEBUG_PHYS	0x000c1000
+#elif defined(CONFIG_DEBUG_BCM476X_UART2)
+# define BCM476X_DEBUG_PHYS	0x000b2000
+#else
+# error Unknown BCM476x debug port
+#endif
+
+#define BCM476X_UART_DR IOMEM(BCM476X_DEBUG_PHYS + UART01x_DR)
+#define BCM476X_UART_FR IOMEM(BCM476X_DEBUG_PHYS + UART01x_FR)
+#define BCM476X_UART_CR IOMEM(BCM476X_DEBUG_PHYS + UART011_CR)
+
+static inline void putc(int c)
+{
+	while (__raw_readl(BCM476X_UART_FR) & UART01x_FR_TXFF)
+		barrier();
+
+	__raw_writel(c, BCM476X_UART_DR);
+	barrier();
+}
+
+static inline void flush(void)
+{
+	int fr;
+
+	do {
+		fr = __raw_readl(BCM476X_UART_FR);
+		barrier();
+	} while ((fr & (UART011_FR_TXFE | UART01x_FR_BUSY)) != UART011_FR_TXFE);
+}
+
+#define arch_decomp_setup()
Index: b/arch/arm/mach-bcm476x/Kconfig
===================================================================
--- /dev/null
+++ b/arch/arm/mach-bcm476x/Kconfig
@@ -0,0 +1,17 @@
+config ARCH_BCM476X
+	bool "Broadcom BCM476X family" if ARCH_MULTI_V6
+	select CPU_V6
+	select ARM_VIC
+	select ARM_AMBA
+	select NO_IOPORT
+	select GENERIC_IRQ_CHIP
+	select SPARSE_IRQ
+	select MULTI_IRQ_HANDLER
+	select ARCH_WANT_OPTIONAL_GPIOLIB
+	select GENERIC_CLOCKEVENTS
+	select CLKSRC_MMIO
+	select COMMON_CLK
+	select CLKDEV_LOOKUP
+	select PINCTRL
+	select PINMUX
+	select USE_OF
Index: b/MAINTAINERS
===================================================================
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1618,6 +1618,15 @@ F:	arch/arm/boot/dts/bcm2835*
 F:	arch/arm/configs/bcm2835_defconfig
 F:	drivers/*/*bcm2835*
 
+ARM/BCM476x ARM ARCHITECTURE
+M:	Domenico Andreoli <domenico.andreoli-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org>
+L:	linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org (moderated for non-subscribers)
+S:	Maintained
+F:	arch/arm/mach-bcm476x
+F:	arch/arm/boot/dts/bcm476x*
+F:	arch/arm/configs/bcm476x_defconfig
+F:	drivers/*/*bcm476x*
+
 BROADCOM TG3 GIGABIT ETHERNET DRIVER
 M:	Matt Carlson <mcarlson-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
 M:	Michael Chan <mchan-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
