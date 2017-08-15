From: Eugeniy Paltsev <Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 3/3] ARC: hsdk: initial port for HSDK board
Date: Tue, 15 Aug 2017 21:13:55 +0300
Message-ID: <20170815181355.29937-4-Eugeniy.Paltsev@synopsys.com>
References: <20170815181355.29937-1-Eugeniy.Paltsev@synopsys.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170815181355.29937-1-Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vineet Gupta <Vineet.Gupta1-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Alexey Brodkin <Alexey.Brodkin-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Eugeniy Paltsev <Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Alexey Brodkin <abrodkin-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>

This initial port adds support of ARC HS Development Kit board with some
basic features such serial port, USB, SD/MMC and Ethernet.

Essentially we run Linux kernel on all 4 cores (i.e. utilize SMP) and
heavily use IO Coherency for speeding-up DMA-aware peripherals.

Note as opposed to other ARC boards we link Linux kernel to
0x9000_0000 intentionally because cores 1 and 3 configured with DCCM
situated at our more usual link base 0x8000_0000. We still can use
memory region starting at 0x8000_0000 as we reallocate DCCM in our
platform code.

Note that PAE remapping for DMA clients does not work due to an RTL bug,
so CREG_PAE register must be programmed to all zeroes, otherwise it will
cause problems with DMA to/from peripherals even if PAE40 is not used.

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Alexey Brodkin <abrodkin-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
---
Changes v8 -> v9:
 * Revert removing of ARC_PLAT_HSDK (now it is called ARC_SOC_HSDK)
   as it breaks uniprocessor configuation build.
 * Enable INPUT_EVDEV in hsdk_defconfig as it is required for 
   user-space apps to work with keyboard/mice

 Documentation/devicetree/bindings/arc/hsdk.txt |   7 +
 arch/arc/Kconfig                               |   1 +
 arch/arc/Makefile                              |   1 +
 arch/arc/boot/dts/hsdk.dts                     | 189 +++++++++++++++++++++++++
 arch/arc/configs/hsdk_defconfig                |  80 +++++++++++
 arch/arc/kernel/devtree.c                      |   5 +-
 arch/arc/plat-hsdk/Kconfig                     |   9 ++
 arch/arc/plat-hsdk/Makefile                    |   9 ++
 arch/arc/plat-hsdk/platform.c                  |  79 +++++++++++
 9 files changed, 378 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arc/hsdk.txt
 create mode 100644 arch/arc/boot/dts/hsdk.dts
 create mode 100644 arch/arc/configs/hsdk_defconfig
 create mode 100644 arch/arc/plat-hsdk/Kconfig
 create mode 100644 arch/arc/plat-hsdk/Makefile
 create mode 100644 arch/arc/plat-hsdk/platform.c

diff --git a/Documentation/devicetree/bindings/arc/hsdk.txt b/Documentation/devicetree/bindings/arc/hsdk.txt
new file mode 100644
index 0000000..be50654
--- /dev/null
+++ b/Documentation/devicetree/bindings/arc/hsdk.txt
@@ -0,0 +1,7 @@
+Synopsys DesignWare ARC HS Development Kit Device Tree Bindings
+---------------------------------------------------------------------------
+
+ARC HSDK Board with quad-core ARC HS38x4 in silicon.
+
+Required root node properties:
+    - compatible = "snps,hsdk";
diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index 75e5276..825a112 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -101,6 +101,7 @@ source "arch/arc/plat-tb10x/Kconfig"
 source "arch/arc/plat-axs10x/Kconfig"
 #New platform adds here
 source "arch/arc/plat-eznps/Kconfig"
+source "arch/arc/plat-hsdk/Kconfig"
 
 endmenu
 
diff --git a/arch/arc/Makefile b/arch/arc/Makefile
index 44ef35d..e81f2bd 100644
--- a/arch/arc/Makefile
+++ b/arch/arc/Makefile
@@ -111,6 +111,7 @@ core-$(CONFIG_ARC_PLAT_SIM)	+= arch/arc/plat-sim/
 core-$(CONFIG_ARC_PLAT_TB10X)	+= arch/arc/plat-tb10x/
 core-$(CONFIG_ARC_PLAT_AXS10X)	+= arch/arc/plat-axs10x/
 core-$(CONFIG_ARC_PLAT_EZNPS)	+= arch/arc/plat-eznps/
+core-$(CONFIG_ARC_SOC_HSDK)	+= arch/arc/plat-hsdk/
 
 ifdef CONFIG_ARC_PLAT_EZNPS
 KBUILD_CPPFLAGS += -I$(srctree)/arch/arc/plat-eznps/include
diff --git a/arch/arc/boot/dts/hsdk.dts b/arch/arc/boot/dts/hsdk.dts
new file mode 100644
index 0000000..e096879
--- /dev/null
+++ b/arch/arc/boot/dts/hsdk.dts
@@ -0,0 +1,189 @@
+/*
+ * Copyright (C) 2017 Synopsys, Inc. (www.synopsys.com)
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+/*
+ * Device Tree for ARC HS Development Kit
+ */
+/dts-v1/;
+
+#include <dt-bindings/net/ti-dp83867.h>
+
+/ {
+	model = "snps,hsdk";
+	compatible = "snps,hsdk";
+
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	chosen {
+		bootargs = "earlycon=uart8250,mmio32,0xf0005000,115200n8 console=ttyS0,115200n8 debug print-fatal-signals=1";
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			device_type = "cpu";
+			compatible = "snps,archs38";
+			reg = <0>;
+			clocks = <&core_clk>;
+		};
+
+		cpu@1 {
+			device_type = "cpu";
+			compatible = "snps,archs38";
+			reg = <1>;
+			clocks = <&core_clk>;
+		};
+
+		cpu@2 {
+			device_type = "cpu";
+			compatible = "snps,archs38";
+			reg = <2>;
+			clocks = <&core_clk>;
+		};
+
+		cpu@3 {
+			device_type = "cpu";
+			compatible = "snps,archs38";
+			reg = <3>;
+			clocks = <&core_clk>;
+		};
+	};
+
+	core_clk: core-clk {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		clock-frequency = <1000000000>;
+	};
+
+	cpu_intc: cpu-interrupt-controller {
+		compatible = "snps,archs-intc";
+		interrupt-controller;
+		#interrupt-cells = <1>;
+	};
+
+	idu_intc: idu-interrupt-controller {
+		compatible = "snps,archs-idu-intc";
+		interrupt-controller;
+		#interrupt-cells = <1>;
+		interrupt-parent = <&cpu_intc>;
+	};
+
+	arcpct: pct {
+		compatible = "snps,archs-pct";
+	};
+
+	/* TIMER0 with interrupt for clockevent */
+	timer {
+		compatible = "snps,arc-timer";
+		interrupts = <16>;
+		interrupt-parent = <&cpu_intc>;
+		clocks = <&core_clk>;
+	};
+
+	/* 64-bit Global Free Running Counter */
+	gfrc {
+		compatible = "snps,archs-timer-gfrc";
+		clocks = <&core_clk>;
+	};
+
+	soc {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		interrupt-parent = <&idu_intc>;
+
+		ranges = <0x00000000 0xf0000000 0x10000000>;
+
+		serial: serial@5000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x5000 0x100>;
+			clock-frequency = <33330000>;
+			interrupts = <6>;
+			baud = <115200>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+		};
+
+		gmacclk: gmacclk {
+			compatible = "fixed-clock";
+			clock-frequency = <400000000>;
+			#clock-cells = <0>;
+		};
+
+		mmcclk_ciu: mmcclk-ciu {
+			compatible = "fixed-clock";
+			clock-frequency = <100000000>;
+			#clock-cells = <0>;
+		};
+
+		mmcclk_biu: mmcclk-biu {
+			compatible = "fixed-clock";
+			clock-frequency = <400000000>;
+			#clock-cells = <0>;
+		};
+
+		ethernet@8000 {
+			#interrupt-cells = <1>;
+			compatible = "snps,dwmac";
+			reg = <0x8000 0x2000>;
+			interrupts = <10>;
+			interrupt-names = "macirq";
+			phy-mode = "rgmii";
+			snps,pbl = <32>;
+			clocks = <&gmacclk>;
+			clock-names = "stmmaceth";
+			phy-handle = <&phy0>;
+
+			mdio {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				compatible = "snps,dwmac-mdio";
+				phy0: ethernet-phy@0 {
+					reg = <0>;
+					ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
+					ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
+					ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
+				};
+			};
+		};
+
+		ohci@60000 {
+			compatible = "snps,hsdk-v1.0-ohci", "generic-ohci";
+			reg = <0x60000 0x100>;
+			interrupts = <15>;
+		};
+
+		ehci@40000 {
+			compatible = "snps,hsdk-v1.0-ehci", "generic-ehci";
+			reg = <0x40000 0x100>;
+			interrupts = <15>;
+		};
+
+		mmc@a000 {
+			compatible = "altr,socfpga-dw-mshc";
+			reg = <0xa000 0x400>;
+			num-slots = <1>;
+			fifo-depth = <16>;
+			card-detect-delay = <200>;
+			clocks = <&mmcclk_biu>, <&mmcclk_ciu>;
+			clock-names = "biu", "ciu";
+			interrupts = <12>;
+			bus-width = <4>;
+		};
+	};
+
+	memory@80000000 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		device_type = "memory";
+		reg = <0x80000000 0x40000000>;  /* 1 GiB */
+	};
+};
diff --git a/arch/arc/configs/hsdk_defconfig b/arch/arc/configs/hsdk_defconfig
new file mode 100644
index 0000000..a7114cd
--- /dev/null
+++ b/arch/arc/configs/hsdk_defconfig
@@ -0,0 +1,80 @@
+CONFIG_DEFAULT_HOSTNAME="ARCLinux"
+CONFIG_SYSVIPC=y
+# CONFIG_CROSS_MEMORY_ATTACH is not set
+CONFIG_NO_HZ_IDLE=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
+CONFIG_NAMESPACES=y
+# CONFIG_UTS_NS is not set
+# CONFIG_PID_NS is not set
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_INITRAMFS_SOURCE="../../arc_initramfs_hs/"
+CONFIG_EMBEDDED=y
+CONFIG_PERF_EVENTS=y
+# CONFIG_VM_EVENT_COUNTERS is not set
+# CONFIG_COMPAT_BRK is not set
+CONFIG_SLAB=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_ARC_SOC_HSDK=y
+CONFIG_ISA_ARCV2=y
+CONFIG_SMP=y
+CONFIG_LINUX_LINK_BASE=0x90000000
+CONFIG_KERNEL_RAM_BASE_ADDRESS=0x80000000
+CONFIG_ARC_BUILTIN_DTB_NAME="hsdk"
+CONFIG_PREEMPT=y
+# CONFIG_COMPACTION is not set
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_DEVTMPFS=y
+# CONFIG_STANDALONE is not set
+# CONFIG_PREVENT_FIRMWARE_BUILD is not set
+# CONFIG_FIRMWARE_IN_KERNEL is not set
+CONFIG_SCSI=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_NETDEVICES=y
+CONFIG_STMMAC_ETH=y
+CONFIG_MICREL_PHY=y
+CONFIG_INPUT_EVDEV=y
+# CONFIG_INPUT_KEYBOARD is not set
+# CONFIG_INPUT_MOUSE is not set
+# CONFIG_SERIO is not set
+# CONFIG_LEGACY_PTYS is not set
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_8250_DW=y
+CONFIG_SERIAL_OF_PLATFORM=y
+# CONFIG_HW_RANDOM is not set
+# CONFIG_HWMON is not set
+CONFIG_FB=y
+CONFIG_FB_UDL=y
+CONFIG_FRAMEBUFFER_CONSOLE=y
+CONFIG_USB=y
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_EHCI_HCD_PLATFORM=y
+CONFIG_USB_OHCI_HCD=y
+CONFIG_USB_OHCI_HCD_PLATFORM=y
+CONFIG_USB_STORAGE=y
+CONFIG_MMC=y
+CONFIG_MMC_SDHCI=y
+CONFIG_MMC_SDHCI_PLTFM=y
+CONFIG_MMC_DW=y
+# CONFIG_IOMMU_SUPPORT is not set
+CONFIG_EXT3_FS=y
+CONFIG_VFAT_FS=y
+CONFIG_TMPFS=y
+CONFIG_NFS_FS=y
+CONFIG_NLS_CODEPAGE_437=y
+CONFIG_NLS_ISO8859_1=y
+# CONFIG_ENABLE_WARN_DEPRECATED is not set
+# CONFIG_ENABLE_MUST_CHECK is not set
+CONFIG_STRIP_ASM_SYMS=y
+CONFIG_LOCKUP_DETECTOR=y
+CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=10
+# CONFIG_SCHED_DEBUG is not set
+# CONFIG_DEBUG_PREEMPT is not set
+# CONFIG_FTRACE is not set
+CONFIG_CRYPTO_ECHAINIV=y
diff --git a/arch/arc/kernel/devtree.c b/arch/arc/kernel/devtree.c
index 3b67f53..521ef35 100644
--- a/arch/arc/kernel/devtree.c
+++ b/arch/arc/kernel/devtree.c
@@ -29,8 +29,9 @@ static void __init arc_set_early_base_baud(unsigned long dt_root)
 {
 	if (of_flat_dt_is_compatible(dt_root, "abilis,arc-tb10x"))
 		arc_base_baud = 166666666;	/* Fixed 166.6MHz clk (TB10x) */
-	else if (of_flat_dt_is_compatible(dt_root, "snps,arc-sdp"))
-		arc_base_baud = 33333333;	/* Fixed 33MHz clk (AXS10x) */
+	else if (of_flat_dt_is_compatible(dt_root, "snps,arc-sdp") ||
+		 of_flat_dt_is_compatible(dt_root, "snps,hsdk"))
+		arc_base_baud = 33333333;	/* Fixed 33MHz clk (AXS10x & HSDK) */
 	else if (of_flat_dt_is_compatible(dt_root, "ezchip,arc-nps"))
 		arc_base_baud = 800000000;      /* Fixed 800MHz clk (NPS) */
 	else
diff --git a/arch/arc/plat-hsdk/Kconfig b/arch/arc/plat-hsdk/Kconfig
new file mode 100644
index 0000000..5a6ed5a
--- /dev/null
+++ b/arch/arc/plat-hsdk/Kconfig
@@ -0,0 +1,9 @@
+# Copyright (C) 2017 Synopsys, Inc. (www.synopsys.com)
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
+#
+
+menuconfig ARC_SOC_HSDK
+       bool "ARC HS Development Kit SOC"
diff --git a/arch/arc/plat-hsdk/Makefile b/arch/arc/plat-hsdk/Makefile
new file mode 100644
index 0000000..9a50c51
--- /dev/null
+++ b/arch/arc/plat-hsdk/Makefile
@@ -0,0 +1,9 @@
+#
+# Copyright (C) 2017 Synopsys, Inc. (www.synopsys.com)
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
+#
+
+obj-y := platform.o
diff --git a/arch/arc/plat-hsdk/platform.c b/arch/arc/plat-hsdk/platform.c
new file mode 100644
index 0000000..5943d23
--- /dev/null
+++ b/arch/arc/plat-hsdk/platform.c
@@ -0,0 +1,79 @@
+/*
+ * ARC HSDK Platform support code
+ *
+ * Copyright (C) 2017 Synopsys, Inc. (www.synopsys.com)
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/init.h>
+#include <linux/smp.h>
+#include <asm/arcregs.h>
+#include <asm/io.h>
+#include <asm/mach_desc.h>
+
+#define ARC_CCM_UNUSED_ADDR	0x60000000
+
+/*
+ * By default ICCM is mapped to 0x7z while this area is used for
+ * Virtual kernel mappings, so move it to currently unused area.
+ */
+static void __init relocate_iccm(void)
+{
+	if (cpuinfo_arc700[smp_processor_id()].iccm.sz)
+		write_aux_reg(ARC_REG_AUX_ICCM, ARC_CCM_UNUSED_ADDR);
+}
+
+/*
+ * By default DCCM is mapped to 0x8z while this area is used by kernel,
+ * so move it to currently unused area.
+ */
+static void __init relocate_dccm(void)
+{
+	if (cpuinfo_arc700[smp_processor_id()].dccm.sz)
+		write_aux_reg(ARC_REG_AUX_DCCM, ARC_CCM_UNUSED_ADDR);
+}
+
+static void __init hsdk_init_per_cpu(unsigned int cpu)
+{
+	relocate_iccm();
+	relocate_dccm();
+}
+
+/*
+ * PAE remapping for DMA clients does not work due to an RTL bug, so
+ * CREG_PAE register must be programmed to all zeroes, otherwise it
+ * will cause problems with DMA to/from peripherals even if PAE40 is
+ * not used.
+ */
+static void __init fixup_pae_regs(void)
+{
+#define ARC_PERIPHERAL_BASE	0xf0000000
+#define	CREG_BASE		(ARC_PERIPHERAL_BASE + 0x1000)
+#define	CREG_PAE		(CREG_BASE + 0x180)
+#define	CREG_PAE_UPDATE		(CREG_BASE + 0x194)
+
+	/* Default is 1, which means "PAE offset = 4GByte" */
+	writel_relaxed(0, (void __iomem *) CREG_PAE);
+
+	/* Really apply settings made above */
+	writel(1, (void __iomem *) CREG_PAE_UPDATE);
+}
+
+static void __init hsdk_early_init(void)
+{
+	fixup_pae_regs();
+}
+
+static const char *hsdk_compat[] __initconst = {
+	"snps,hsdk",
+	NULL,
+};
+
+MACHINE_START(SIMULATION, "hsdk")
+	.dt_compat	= hsdk_compat,
+	.init_early     = hsdk_early_init,
+	.init_per_cpu	= hsdk_init_per_cpu,
+MACHINE_END
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
