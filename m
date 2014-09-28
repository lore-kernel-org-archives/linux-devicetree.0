From: <suravee.suthikulpanit-5C7GfCeVMHo@public.gmane.org>
Subject: [RFC 1/4] arm64: amd-seattle: Adding device tree for AMD Seattle platform
Date: Sun, 28 Sep 2014 15:53:27 -0500
Message-ID: <1411937610-22125-2-git-send-email-suravee.suthikulpanit@amd.com>
References: <1411937610-22125-1-git-send-email-suravee.suthikulpanit@amd.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1411937610-22125-1-git-send-email-suravee.suthikulpanit-5C7GfCeVMHo@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: will.deacon-5wv7dgnIgG8@public.gmane.org, liviu.dudau-5wv7dgnIgG8@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Suravee Suthikulpanit <Suravee.Suthikulpanit-5C7GfCeVMHo@public.gmane.org>, Thomas Lendacky <Thomas.Lendacky-5C7GfCeVMHo@public.gmane.org>, Joel Schopp <Joel.Schopp-5C7GfCeVMHo@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Suravee Suthikulpanit <Suravee.Suthikulpanit-5C7GfCeVMHo@public.gmane.org>

Initial revision of device tree for AMD Seattle platform

Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
Signed-off-by: Suravee Suthikulpanit <Suravee.Suthikulpanit-5C7GfCeVMHo@public.gmane.org>
Signed-off-by: Thomas Lendacky <Thomas.Lendacky-5C7GfCeVMHo@public.gmane.org>
Signed-off-by: Joel Schopp <Joel.Schopp-5C7GfCeVMHo@public.gmane.org>
---
 arch/arm64/boot/dts/Makefile                |   1 +
 arch/arm64/boot/dts/amd-seattle-periph.dtsi | 175 ++++++++++++++++++++
 arch/arm64/boot/dts/amd-seattle.dts         | 245 ++++++++++++++++++++++++++++
 3 files changed, 421 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amd-seattle-periph.dtsi
 create mode 100644 arch/arm64/boot/dts/amd-seattle.dts

diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
index c52bdb0..11cb2e3 100644
--- a/arch/arm64/boot/dts/Makefile
+++ b/arch/arm64/boot/dts/Makefile
@@ -1,5 +1,6 @@
 dtb-$(CONFIG_ARCH_VEXPRESS) += rtsm_ve-aemv8a.dtb foundation-v8.dtb
 dtb-$(CONFIG_ARCH_XGENE) += apm-mustang.dtb
+dtb-$(CONFIG_ARCH_SEATTLE) += amd-seattle.dtb
 
 targets += dtbs
 targets += $(dtb-y)
diff --git a/arch/arm64/boot/dts/amd-seattle-periph.dtsi b/arch/arm64/boot/dts/amd-seattle-periph.dtsi
new file mode 100644
index 0000000..e5bcf1c
--- /dev/null
+++ b/arch/arm64/boot/dts/amd-seattle-periph.dtsi
@@ -0,0 +1,175 @@
+/*
+ * DTS file for AMD Seattle Peripheral
+ *
+ * Copyright (C) 2014 Advanced Micro Devices, Inc.
+ */
+
+motherboard {
+	arm,v2m-memory-map = "rs1";
+	compatible = "arm,vexpress,v2m-p1", "simple-bus";
+	#address-cells = <2>;
+	#size-cells = <2>;
+	ranges;
+
+	adl3clk_100mhz: clk100mhz_0 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+		clock-output-names = "adl3clk_100mhz";
+	};
+
+	ccpclk_375mhz: clk375mhz {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <375000000>;
+		clock-output-names = "ccpclk_375mhz";
+	};
+
+	sataclk_333mhz: clk333mhz {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <333000000>;
+		clock-output-names = "sataclk_333mhz";
+	};
+
+	pcieclk_500mhz: clk500mhz_0 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <500000000>;
+		clock-output-names = "pcieclk_500mhz";
+	};
+
+	dmaclk_500mhz: clk500mhz_1 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <500000000>;
+		clock-output-names = "dmaclk_500mhz";
+	};
+
+	miscclk_250mhz: clk250mhz_4 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <250000000>;
+		clock-output-names = "miscclk_250mhz";
+	};
+
+	uartspiclk_100mhz: clk100mhz_1 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+		clock-output-names = "uartspiclk_100mhz";
+	};
+
+	dma0: dma@1,0500000 {
+		compatible = "arm,pl330", "arm,primecell";
+		reg = <0 0x0500000 0 0x1000>;
+		interrupts =
+			<0 368 4>,
+			<0 369 4>,
+			<0 370 4>,
+			<0 371 4>,
+			<0 372 4>,
+			<0 373 4>,
+			<0 374 4>,
+			<0 375 4>;
+		clocks = <&dmaclk_500mhz>;
+		clock-names = "apb_pclk";
+		#dma-cells = <1>;
+		#stream-id-cells = <32>;
+	};
+
+	sata0: sata@1,00300000 {
+		compatible = "snps,spear-ahci";
+		reg = <0 0x300000 0 0x800>;
+		interrupts = <0 355 4>;
+		clocks = <&sataclk_333mhz>;
+		clock-names = "apb_pclk";
+		#stream-id-cells = <32>;
+		dma-coherent;
+	};
+
+	i2c@1,1000000 {
+		compatible = "snps,designware-i2c";
+		reg = <0 0x01000000 0 0x1000>;
+		interrupts = <0 357 4>;
+		clocks = <&uartspiclk_100mhz>;
+		clock-names = "apb_pclk";
+	};
+
+	v2m_serial0: uart@1,1010000 {
+		compatible = "arm,pl011", "arm,primecell";
+		reg = <0 0x1010000 0 0x1000>;
+		interrupts = <0 328 4>;
+		clocks = <&uartspiclk_100mhz>, <&uartspiclk_100mhz>;
+		clock-names = "uartclk", "apb_pclk";
+	};
+
+	ssp@1,1020000 {
+		#gpio-cells = <2>;
+		compatible = "arm,pl022", "arm,primecell";
+		reg = <0 0x1020000 0 0x1000>;
+		spi-controller;
+		interrupts = <0 330 4>;
+		clocks = <&uartspiclk_100mhz>;
+		clock-names = "apb_pclk";
+	};
+
+	ssp@1,1030000 {
+		#gpio-cells = <2>;
+		compatible = "arm,pl022", "arm,primecell";
+		reg = <0 0x1030000 0 0x1000>;
+		spi-controller;
+		interrupts = <0 329 4>;
+		clocks = <&uartspiclk_100mhz>;
+		clock-names = "apb_pclk";
+		num-cs = <1>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		sdcard@1 {
+			compatible = "mmc-spi-slot";
+			reg = <0>;
+			spi-max-frequency = <20000000>;
+			pl022,hierarchy = <0>;
+			pl022,interface = <0>;
+			pl022,com-mode = <0x0>;
+			pl022,rx-level-trig = <0>;
+			pl022,tx-level-trig = <0>;
+		};
+	};
+
+	gpio@1,1040000 {
+		#gpio-cells = <2>;
+		compatible = "arm,pl061", "arm,primecell";
+		reg = <0 0x1040000 0 0x1000>;
+		gpio-controller;
+		interrupts = <0 359 4>;
+		clocks = <&uartspiclk_100mhz>;
+		clock-names = "apb_pclk";
+	};
+
+	gpio@1,1050000 {
+		#gpio-cells = <2>;
+		compatible = "arm,pl061", "arm,primecell";
+		reg = <0 0x1050000 0 0x1000>;
+		gpio-controller;
+		interrupts = <0 358 4>;
+		clocks = <&uartspiclk_100mhz>;
+		clock-names = "apb_pclk";
+	};
+
+	timer@1,1060000 {
+		compatible = "arm,standalone_a5_twd";
+		reg = <0 0x1060000 0 0x40>;
+		interrupts =
+			<0 378 4>,
+			<0 379 4>;
+	};
+
+	ccp: ccp@1,00100000 {
+		compatible = "amd,ccp-seattle-v1a";
+		reg = <0 0x00100000 0 0x10000>;
+		interrupts = <0 3 4>;
+		dma-coherent;
+	};
+};
diff --git a/arch/arm64/boot/dts/amd-seattle.dts b/arch/arm64/boot/dts/amd-seattle.dts
new file mode 100644
index 0000000..3096d1a
--- /dev/null
+++ b/arch/arm64/boot/dts/amd-seattle.dts
@@ -0,0 +1,245 @@
+/*
+ * DTS file for AMD Seattle
+ *
+ * Copyright (C) 2014 Advanced Micro Devices, Inc.
+ */
+
+/dts-v1/;
+
+/ {
+	compatible = "amd,seattle";
+	interrupt-parent = <&gic>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	chosen {
+		bootargs = "console=ttyAMA0,115200 earlycon=pl011,0xe1010000";
+		linux,pci-probe-only;
+	};
+
+	aliases {
+		serial0 = &v2m_serial0;
+	};
+
+	/* Note: This entry is modified by UEFI */
+	cpus {
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&CPU0>;
+				};
+				core1 {
+					cpu = <&CPU1>;
+				};
+			};
+			cluster1 {
+				core0 {
+					cpu = <&CPU2>;
+				};
+				core1 {
+					cpu = <&CPU3>;
+				};
+			};
+			cluster2 {
+				core0 {
+					cpu = <&CPU4>;
+				};
+				core1 {
+					cpu = <&CPU5>;
+				};
+			};
+			cluster3 {
+				core0 {
+					cpu = <&CPU6>;
+				};
+				core1 {
+					cpu = <&CPU7>;
+				};
+			};
+		};
+		/* Cluster 0 Core 0 */
+		CPU0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,armv8";
+			reg = <0x0 0x0000>;
+			enable-method = "spin-table";
+			cpu-release-addr = <0x80 0x30000050>;
+		};
+
+		/* Cluster 0 Core 1 */
+		CPU1: cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,armv8";
+			reg = <0x0 0x0001>;
+			enable-method = "spin-table";
+			cpu-release-addr = <0x80 0x30000058>;
+		};
+
+		/* Cluster 1 Core 0 */
+		CPU2: cpu@2 {
+			device_type = "cpu";
+			compatible = "arm,armv8";
+			reg = <0x0 0x0100>;
+			enable-method = "spin-table";
+			cpu-release-addr = <0x80 0x30000060>;
+		};
+
+		/* Cluster 1 Core 1 */
+		CPU3: cpu@3 {
+			device_type = "cpu";
+			compatible = "arm,armv8";
+			reg = <0x0 0x0101>;
+			enable-method = "spin-table";
+			cpu-release-addr = <0x80 0x30000068>;
+		};
+
+		/* Cluster 2 Core 0 */
+		CPU4: cpu@4 {
+			device_type = "cpu";
+			compatible = "arm,armv8";
+			reg = <0x0 0x0200>;
+			enable-method = "spin-table";
+			cpu-release-addr = <0x80 0x30000070>;
+		};
+
+		/* Cluster 2 Core 1 */
+		CPU5: cpu@5 {
+			device_type = "cpu";
+			compatible = "arm,armv8";
+			reg = <0x0 0x0201>;
+			enable-method = "spin-table";
+			cpu-release-addr = <0x80 0x30000078>;
+		};
+
+		/* Cluster 3 Core 0 */
+		CPU6: cpu@6 {
+			device_type = "cpu";
+			compatible = "arm,armv8";
+			reg = <0x0 0x0300>;
+			enable-method = "spin-table";
+			cpu-release-addr = <0x80 0x30000080>;
+		};
+
+		/* Cluster 3 Core 1 */
+		CPU7: cpu@7 {
+			device_type = "cpu";
+			compatible = "arm,armv8";
+			reg = <0x0 0x0301>;
+			enable-method = "spin-table";
+			cpu-release-addr = <0x80 0x30000088>;
+		};
+	};
+
+	/* Note: This entry is modified by UEFI */
+	memory@8000000000 {
+		device_type = "memory";
+		reg = <0x00000080 0x00000000 0x1 0x00000000>; /* 4GB */
+	};
+
+	gic: interrupt-controller@e1101000 {
+		compatible = "arm,gic-400", "arm,cortex-a15-gic";
+		#interrupt-cells = <3>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		interrupt-controller;
+		ranges = <0 0 0 0xe1100000 0 0x100000>;
+		reg = <0x0 0xe1110000 0 0x1000>,  /* gic dist */
+		      <0x0 0xe112f000 0 0x2000>,  /* gic cpu */
+		      <0x0 0xe1140000 0 0x10000>, /* gic virtual ic*/
+		      <0x0 0xe1160000 0 0x10000>; /* gic virtual cpu*/
+		interrupts = <1 8 0xf04>;
+		v2m0: v2m@0x8000 {
+			compatible = "arm,gic-v2m-frame";
+			msi-controller;
+			arm,msi-base-spi = <64>;
+			arm,msi-num-spis = <256>;
+			reg = <0x0 0x80000 0 0x1000>;
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <1 13 0xff01>,
+			     <1 14 0xff01>,
+			     <1 11 0xff01>,
+			     <1 10 0xff01>;
+	};
+
+	pmu {
+		compatible = "arm,armv8-pmuv3";
+		interrupts = <0 7 4>,
+			     <0 8 4>,
+			     <0 9 4>,
+			     <0 10 4>,
+			     <0 11 4>,
+			     <0 12 4>,
+			     <0 13 4>,
+			     <0 14 4>;
+	};
+
+	/* This entry is modified by UEFI */
+	pcie0: pcie-controller{
+		compatible = "pci-host-ecam-generic";
+		#address-cells = <3>;
+		#size-cells = <2>;
+		device_type = "pci";
+		bus-range = <0 0xff>;
+		reg = <0 0xf0000000 0 0x10000000>;
+		dma-coherent;
+		msi-parent = <&v2m0>;
+
+		interrupts =
+			<0 320 4>, /* ioc_soc_serr */
+			<0 321 4>; /* ioc_soc_sci */
+
+		ranges = <
+			/* I/O Memory (size=64K) */
+			0x01000000 0x00 0xefff0000 0x00 0xefff0000 0x00 0x00010000
+
+			/* Non-Pref 32-bit MMIO (size=512M) */
+			0x02000000 0x00 0x40000000 0x00 0x40000000 0x00 0x20000000
+
+			/* Non-Pref 32-bit MMIO (size=512M) */
+			0x02000000 0x00 0x60000000 0x00 0x60000000 0x00 0x20000000
+
+			/* Non-Pref 32-bit MMIO (size=512M) */
+			0x02000000 0x00 0x80000000 0x00 0x80000000 0x00 0x20000000
+
+			/* Non-Pref 32-bit MMIO (size=512M) */
+			0x02000000 0x00 0xa0000000 0x00 0xa0000000 0x00 0x20000000
+
+			/* Pref 64-bit MMIO (size= 4G) */
+			0x43000000 0x01 0x00000000 0x01 0x00000000 0x01 0x00000000
+
+			/* Pref 64-bit MMIO (size= 8G) */
+			0x43000000 0x02 0x00000000 0x02 0x00000000 0x02 0x00000000
+
+			/* Pref 64-bit MMIO (size=16G) */
+			0x43000000 0x04 0x00000000 0x04 0x00000000 0x04 0x00000000
+
+			/* Pref 64-bit MMIO (size=32G) */
+			0x43000000 0x08 0x00000000 0x08 0x00000000 0x08 0x00000000
+
+			/* Pref 64-bit MMIO (size=64G) */
+			0x43000000 0x10 0x00000000 0x10 0x00000000 0x10 0x00000000
+
+			/* Pref 64-bit MMIO (size=128G) */
+			0x43000000 0x20 0x00000000 0x20 0x00000000 0x20 0x00000000
+
+			/* Pref 64-bit MMIO (size=256G) */
+			0x43000000 0x40 0x00000000 0x40 0x00000000 0x40 0x00000000
+		>;
+	};
+
+	smb {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges = <0 0 0 0xE0000000 0 0x01300000>;
+
+		/include/ "amd-seattle-periph.dtsi"
+	};
+};
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
