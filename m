Return-Path: <SRS0=pQYc=SK=vger.kernel.org=devicetree-owner@kernel.org>
Received: from muru.com ([72.249.23.125]:44934 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726693AbfDHWKh (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 8 Apr 2019 18:10:37 -0400
From: Tony Lindgren <tony@atomide.com>
Subject: [PATCH 2/2] ARM: dts: Add l4 abe interconnect hierarchy and ti-sysc data for omap4
Date: Mon,  8 Apr 2019 15:10:21 -0700
Message-Id: <20190408221021.2620-3-tony@atomide.com>
In-Reply-To: <20190408221021.2620-1-tony@atomide.com>
References: <20190408221021.2620-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: linux-omap@vger.kernel.org
Cc: =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>, devicetree@vger.kernel.org, Peter Ujfalusi <peter.ujfalusi@ti.com>
List-ID: <devicetree@vger.kernel.org>

We can now add l4 abe interconnect hierarchy and ti-sysc data with
ti-sysc driver supporting external optional clocks needed by mcpdm.

This data is generated based on platform data from a booted system
and the interconnect acces protection registers for ranges. To avoid
regressions, we initially validate the device tree provided data
against the existing platform data on boot.

Note that mcpdm we now need to enable at module level only for devices
that have the external pdmclk wired from the PMIC as the clock is
needed for the module to be accessible.

Cc: devicetree@vger.kernel.org
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap4-l4-abe.dtsi | 501 ++++++++++++++++++++++++++++
 arch/arm/boot/dts/omap4-mcpdm.dtsi  |  12 +-
 arch/arm/boot/dts/omap4.dtsi        | 192 +----------
 3 files changed, 514 insertions(+), 191 deletions(-)
 create mode 100644 arch/arm/boot/dts/omap4-l4-abe.dtsi

diff --git a/arch/arm/boot/dts/omap4-l4-abe.dtsi b/arch/arm/boot/dts/omap4-l4-abe.dtsi
new file mode 100644
--- /dev/null
+++ b/arch/arm/boot/dts/omap4-l4-abe.dtsi
@@ -0,0 +1,501 @@
+&l4_abe {						/* 0x40100000 */
+	compatible = "ti,omap4-l4-abe", "simple-bus";
+	reg = <0x40100000 0x400>,
+	      <0x40100400 0x400>;
+	reg-names = "la", "ap";
+	#address-cells = <1>;
+	#size-cells = <1>;
+	ranges = <0x00000000 0x40100000 0x100000>,	/* segment 0 */
+		 <0x49000000 0x49000000 0x100000>;
+	segment@0 {					/* 0x40100000 */
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges =
+			 /* CPU to L4 ABE mapping */
+			 <0x00000000 0x00000000 0x000400>,	/* ap 0 */
+			 <0x00000400 0x00000400 0x000400>,	/* ap 1 */
+			 <0x00022000 0x00022000 0x001000>,	/* ap 2 */
+			 <0x00023000 0x00023000 0x001000>,	/* ap 3 */
+			 <0x00024000 0x00024000 0x001000>,	/* ap 4 */
+			 <0x00025000 0x00025000 0x001000>,	/* ap 5 */
+			 <0x00026000 0x00026000 0x001000>,	/* ap 6 */
+			 <0x00027000 0x00027000 0x001000>,	/* ap 7 */
+			 <0x00028000 0x00028000 0x001000>,	/* ap 8 */
+			 <0x00029000 0x00029000 0x001000>,	/* ap 9 */
+			 <0x0002a000 0x0002a000 0x001000>,	/* ap 10 */
+			 <0x0002b000 0x0002b000 0x001000>,	/* ap 11 */
+			 <0x0002e000 0x0002e000 0x001000>,	/* ap 12 */
+			 <0x0002f000 0x0002f000 0x001000>,	/* ap 13 */
+			 <0x00030000 0x00030000 0x001000>,	/* ap 14 */
+			 <0x00031000 0x00031000 0x001000>,	/* ap 15 */
+			 <0x00032000 0x00032000 0x001000>,	/* ap 16 */
+			 <0x00033000 0x00033000 0x001000>,	/* ap 17 */
+			 <0x00038000 0x00038000 0x001000>,	/* ap 18 */
+			 <0x00039000 0x00039000 0x001000>,	/* ap 19 */
+			 <0x0003a000 0x0003a000 0x001000>,	/* ap 20 */
+			 <0x0003b000 0x0003b000 0x001000>,	/* ap 21 */
+			 <0x0003c000 0x0003c000 0x001000>,	/* ap 22 */
+			 <0x0003d000 0x0003d000 0x001000>,	/* ap 23 */
+			 <0x0003e000 0x0003e000 0x001000>,	/* ap 24 */
+			 <0x0003f000 0x0003f000 0x001000>,	/* ap 25 */
+			 <0x00080000 0x00080000 0x010000>,	/* ap 26 */
+			 <0x00080000 0x00080000 0x001000>,	/* ap 27 */
+			 <0x000a0000 0x000a0000 0x010000>,	/* ap 28 */
+			 <0x000a0000 0x000a0000 0x001000>,	/* ap 29 */
+			 <0x000c0000 0x000c0000 0x010000>,	/* ap 30 */
+			 <0x000c0000 0x000c0000 0x001000>,	/* ap 31 */
+			 <0x000f1000 0x000f1000 0x001000>,	/* ap 32 */
+			 <0x000f2000 0x000f2000 0x001000>,	/* ap 33 */
+
+			 /* L3 to L4 ABE mapping */
+			 <0x49000000 0x49000000 0x000400>,	/* ap 0 */
+			 <0x49000400 0x49000400 0x000400>,	/* ap 1 */
+			 <0x49022000 0x49022000 0x001000>,	/* ap 2 */
+			 <0x49023000 0x49023000 0x001000>,	/* ap 3 */
+			 <0x49024000 0x49024000 0x001000>,	/* ap 4 */
+			 <0x49025000 0x49025000 0x001000>,	/* ap 5 */
+			 <0x49026000 0x49026000 0x001000>,	/* ap 6 */
+			 <0x49027000 0x49027000 0x001000>,	/* ap 7 */
+			 <0x49028000 0x49028000 0x001000>,	/* ap 8 */
+			 <0x49029000 0x49029000 0x001000>,	/* ap 9 */
+			 <0x4902a000 0x4902a000 0x001000>,	/* ap 10 */
+			 <0x4902b000 0x4902b000 0x001000>,	/* ap 11 */
+			 <0x4902e000 0x4902e000 0x001000>,	/* ap 12 */
+			 <0x4902f000 0x4902f000 0x001000>,	/* ap 13 */
+			 <0x49030000 0x49030000 0x001000>,	/* ap 14 */
+			 <0x49031000 0x49031000 0x001000>,	/* ap 15 */
+			 <0x49032000 0x49032000 0x001000>,	/* ap 16 */
+			 <0x49033000 0x49033000 0x001000>,	/* ap 17 */
+			 <0x49038000 0x49038000 0x001000>,	/* ap 18 */
+			 <0x49039000 0x49039000 0x001000>,	/* ap 19 */
+			 <0x4903a000 0x4903a000 0x001000>,	/* ap 20 */
+			 <0x4903b000 0x4903b000 0x001000>,	/* ap 21 */
+			 <0x4903c000 0x4903c000 0x001000>,	/* ap 22 */
+			 <0x4903d000 0x4903d000 0x001000>,	/* ap 23 */
+			 <0x4903e000 0x4903e000 0x001000>,	/* ap 24 */
+			 <0x4903f000 0x4903f000 0x001000>,	/* ap 25 */
+			 <0x49080000 0x49080000 0x010000>,	/* ap 26 */
+			 <0x49080000 0x49080000 0x001000>,	/* ap 27 */
+			 <0x490a0000 0x490a0000 0x010000>,	/* ap 28 */
+			 <0x490a0000 0x490a0000 0x001000>,	/* ap 29 */
+			 <0x490c0000 0x490c0000 0x010000>,	/* ap 30 */
+			 <0x490c0000 0x490c0000 0x001000>,	/* ap 31 */
+			 <0x490f1000 0x490f1000 0x001000>,	/* ap 32 */
+			 <0x490f2000 0x490f2000 0x001000>;	/* ap 33 */
+
+		target-module@22000 {			/* 0x40122000, ap 2 02.0 */
+			compatible = "ti,sysc-omap2", "ti,sysc";
+			ti,hwmods = "mcbsp1";
+			reg = <0x2208c 0x4>;
+			reg-names = "sysc";
+			ti,sysc-mask = <(SYSC_OMAP2_CLOCKACTIVITY |
+					 SYSC_OMAP2_ENAWAKEUP |
+					 SYSC_OMAP2_SOFTRESET)>;
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>;
+			/* Domains (V, P, C): iva, abe_pwrdm, abe_clkdm */
+			clocks = <&abe_clkctrl OMAP4_MCBSP1_CLKCTRL 0>;
+			clock-names = "fck";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x22000 0x1000>,
+				 <0x49022000 0x49022000 0x1000>;
+
+			mcbsp1: mcbsp@0 {
+				compatible = "ti,omap4-mcbsp";
+				reg = <0x0 0xff>, /* MPU private access */
+				      <0x49022000 0xff>; /* L3 Interconnect */
+				reg-names = "mpu", "dma";
+				interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "common";
+				ti,buffer-size = <128>;
+				dmas = <&sdma 33>,
+				       <&sdma 34>;
+				dma-names = "tx", "rx";
+				status = "disabled";
+			};
+		};
+
+		target-module@24000 {			/* 0x40124000, ap 4 04.0 */
+			compatible = "ti,sysc-omap2", "ti,sysc";
+			ti,hwmods = "mcbsp2";
+			reg = <0x2408c 0x4>;
+			reg-names = "sysc";
+			ti,sysc-mask = <(SYSC_OMAP2_CLOCKACTIVITY |
+					 SYSC_OMAP2_ENAWAKEUP |
+					 SYSC_OMAP2_SOFTRESET)>;
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>;
+			/* Domains (V, P, C): iva, abe_pwrdm, abe_clkdm */
+			clocks = <&abe_clkctrl OMAP4_MCBSP2_CLKCTRL 0>;
+			clock-names = "fck";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x24000 0x1000>,
+				 <0x49024000 0x49024000 0x1000>;
+
+			mcbsp2: mcbsp@0 {
+				compatible = "ti,omap4-mcbsp";
+				reg = <0x0 0xff>, /* MPU private access */
+				      <0x49024000 0xff>; /* L3 Interconnect */
+				reg-names = "mpu", "dma";
+				interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "common";
+				ti,buffer-size = <128>;
+				dmas = <&sdma 17>,
+				       <&sdma 18>;
+				dma-names = "tx", "rx";
+				status = "disabled";
+			};
+		};
+
+		target-module@26000 {			/* 0x40126000, ap 6 06.0 */
+			compatible = "ti,sysc-omap2", "ti,sysc";
+			ti,hwmods = "mcbsp3";
+			reg = <0x2608c 0x4>;
+			reg-names = "sysc";
+			ti,sysc-mask = <(SYSC_OMAP2_CLOCKACTIVITY |
+					 SYSC_OMAP2_ENAWAKEUP |
+					 SYSC_OMAP2_SOFTRESET)>;
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>;
+			/* Domains (V, P, C): iva, abe_pwrdm, abe_clkdm */
+			clocks = <&abe_clkctrl OMAP4_MCBSP3_CLKCTRL 0>;
+			clock-names = "fck";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x26000 0x1000>,
+				 <0x49026000 0x49026000 0x1000>;
+
+			mcbsp3: mcbsp@0 {
+				compatible = "ti,omap4-mcbsp";
+				reg = <0x0 0xff>, /* MPU private access */
+				      <0x49026000 0xff>; /* L3 Interconnect */
+				reg-names = "mpu", "dma";
+				interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "common";
+				ti,buffer-size = <128>;
+				dmas = <&sdma 19>,
+				       <&sdma 20>;
+				dma-names = "tx", "rx";
+				status = "disabled";
+			};
+		};
+
+		target-module@28000 {			/* 0x40128000, ap 8 08.0 */
+			compatible = "ti,sysc-mcasp", "ti,sysc";
+			ti,hwmods = "mcasp";
+			reg = <0x28000 0x4>,
+			      <0x28004 0x4>;
+			reg-names = "rev", "sysc";
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>,
+					<SYSC_IDLE_SMART_WKUP>;
+			/* Domains (V, P, C): iva, abe_pwrdm, abe_clkdm */
+			clocks = <&abe_clkctrl OMAP4_MCASP_CLKCTRL 0>;
+			clock-names = "fck";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x28000 0x1000>,
+				 <0x49028000 0x49028000 0x1000>;
+
+			/*
+			 * Child device unsupported by davinci-mcasp. At least
+			 * RX path is disabled for omap4, and only DIT mode
+			 * works with no I2S. See also old Android kernel
+			 * omap-mcasp driver for more information.
+			 */
+		};
+
+		target-module@2a000 {			/* 0x4012a000, ap 10 0a.0 */
+			compatible = "ti,sysc";
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x2a000 0x1000>,
+				 <0x4902a000 0x4902a000 0x1000>;
+		};
+
+		target-module@2e000 {			/* 0x4012e000, ap 12 0c.0 */
+			compatible = "ti,sysc-omap4", "ti,sysc";
+			ti,hwmods = "dmic";
+			reg = <0x2e000 0x4>,
+			      <0x2e010 0x4>;
+			reg-names = "rev", "sysc";
+			ti,sysc-mask = <(SYSC_OMAP4_FREEEMU |
+					 SYSC_OMAP4_SOFTRESET)>;
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>,
+					<SYSC_IDLE_SMART_WKUP>;
+			/* Domains (V, P, C): iva, abe_pwrdm, abe_clkdm */
+			clocks = <&abe_clkctrl OMAP4_DMIC_CLKCTRL 0>;
+			clock-names = "fck";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x2e000 0x1000>,
+				 <0x4902e000 0x4902e000 0x1000>;
+
+			dmic: dmic@0 {
+				compatible = "ti,omap4-dmic";
+				reg = <0x0 0x7f>, /* MPU private access */
+				      <0x4902e000 0x7f>; /* L3 Interconnect */
+				reg-names = "mpu", "dma";
+				interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&sdma 67>;
+				dma-names = "up_link";
+				status = "disabled";
+			};
+		};
+
+		target-module@30000 {			/* 0x40130000, ap 14 0e.0 */
+			compatible = "ti,sysc-omap2", "ti,sysc";
+			ti,hwmods = "wd_timer3";
+			reg = <0x30000 0x4>,
+			      <0x30010 0x4>,
+			      <0x30014 0x4>;
+			reg-names = "rev", "sysc", "syss";
+			ti,sysc-mask = <(SYSC_OMAP2_EMUFREE |
+					 SYSC_OMAP2_SOFTRESET)>;
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>,
+					<SYSC_IDLE_SMART_WKUP>;
+			ti,syss-mask = <1>;
+			/* Domains (V, P, C): iva, abe_pwrdm, abe_clkdm */
+			clocks = <&abe_clkctrl OMAP4_WD_TIMER3_CLKCTRL 0>;
+			clock-names = "fck";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x30000 0x1000>,
+				 <0x49030000 0x49030000 0x1000>;
+
+			wdt3: wdt@0 {
+				compatible = "ti,omap4-wdt", "ti,omap3-wdt";
+				reg = <0x0 0x80>;
+				interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
+		mcpdm_module: target-module@32000 {	/* 0x40132000, ap 16 10.0 */
+			compatible = "ti,sysc-omap4", "ti,sysc";
+			ti,hwmods = "mcpdm";
+			reg = <0x32000 0x4>,
+			      <0x32010 0x4>;
+			reg-names = "rev", "sysc";
+			ti,sysc-mask = <(SYSC_OMAP4_FREEEMU |
+					 SYSC_OMAP4_SOFTRESET)>;
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>,
+					<SYSC_IDLE_SMART_WKUP>;
+			/* Domains (V, P, C): iva, abe_pwrdm, abe_clkdm */
+			clocks = <&abe_clkctrl OMAP4_MCPDM_CLKCTRL 0>;
+			clock-names = "fck";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x32000 0x1000>,
+				 <0x49032000 0x49032000 0x1000>;
+
+			/* Must be only enabled for boards with pdmclk wired */
+			status = "disabled";
+
+			mcpdm: mcpdm@0 {
+				compatible = "ti,omap4-mcpdm";
+				reg = <0x0 0x7f>, /* MPU private access */
+				      <0x49032000 0x7f>; /* L3 Interconnect */
+				reg-names = "mpu", "dma";
+				interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&sdma 65>,
+				       <&sdma 66>;
+				dma-names = "up_link", "dn_link";
+			};
+		};
+
+		target-module@38000 {			/* 0x40138000, ap 18 12.0 */
+			compatible = "ti,sysc-omap4-timer", "ti,sysc";
+			ti,hwmods = "timer5";
+			reg = <0x38000 0x4>,
+			      <0x38010 0x4>;
+			reg-names = "rev", "sysc";
+			ti,sysc-mask = <(SYSC_OMAP4_FREEEMU |
+					 SYSC_OMAP4_SOFTRESET)>;
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>,
+					<SYSC_IDLE_SMART_WKUP>;
+			/* Domains (V, P, C): iva, abe_pwrdm, abe_clkdm */
+			clocks = <&abe_clkctrl OMAP4_TIMER5_CLKCTRL 0>;
+			clock-names = "fck";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x38000 0x1000>,
+				 <0x49038000 0x49038000 0x1000>;
+
+			timer5: timer@0 {
+				compatible = "ti,omap4430-timer";
+				reg = <0x00000000 0x80>,
+				      <0x49038000 0x80>;
+				clocks = <&abe_clkctrl OMAP4_TIMER5_CLKCTRL 24>;
+				clock-names = "fck";
+				interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
+				ti,timer-dsp;
+			};
+		};
+
+		target-module@3a000 {			/* 0x4013a000, ap 20 14.0 */
+			compatible = "ti,sysc-omap4-timer", "ti,sysc";
+			ti,hwmods = "timer6";
+			reg = <0x3a000 0x4>,
+			      <0x3a010 0x4>;
+			reg-names = "rev", "sysc";
+			ti,sysc-mask = <(SYSC_OMAP4_FREEEMU |
+					 SYSC_OMAP4_SOFTRESET)>;
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>,
+					<SYSC_IDLE_SMART_WKUP>;
+			/* Domains (V, P, C): iva, abe_pwrdm, abe_clkdm */
+			clocks = <&abe_clkctrl OMAP4_TIMER6_CLKCTRL 0>;
+			clock-names = "fck";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x3a000 0x1000>,
+				 <0x4903a000 0x4903a000 0x1000>;
+
+			timer6: timer@0 {
+				compatible = "ti,omap4430-timer";
+				reg = <0x00000000 0x80>,
+				      <0x4903a000 0x80>;
+				clocks = <&abe_clkctrl OMAP4_TIMER6_CLKCTRL 24>;
+				clock-names = "fck";
+				interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
+				ti,timer-dsp;
+			};
+		};
+
+		target-module@3c000 {			/* 0x4013c000, ap 22 16.0 */
+			compatible = "ti,sysc-omap4-timer", "ti,sysc";
+			ti,hwmods = "timer7";
+			reg = <0x3c000 0x4>,
+			      <0x3c010 0x4>;
+			reg-names = "rev", "sysc";
+			ti,sysc-mask = <(SYSC_OMAP4_FREEEMU |
+					 SYSC_OMAP4_SOFTRESET)>;
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>,
+					<SYSC_IDLE_SMART_WKUP>;
+			/* Domains (V, P, C): iva, abe_pwrdm, abe_clkdm */
+			clocks = <&abe_clkctrl OMAP4_TIMER7_CLKCTRL 0>;
+			clock-names = "fck";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x3c000 0x1000>,
+				 <0x4903c000 0x4903c000 0x1000>;
+
+			timer7: timer@0 {
+				compatible = "ti,omap4430-timer";
+				reg = <0x00000000 0x80>,
+				      <0x4903c000 0x80>;
+				clocks = <&abe_clkctrl OMAP4_TIMER7_CLKCTRL 24>;
+				clock-names = "fck";
+				interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
+				ti,timer-dsp;
+			};
+		};
+
+		target-module@3e000 {			/* 0x4013e000, ap 24 18.0 */
+			compatible = "ti,sysc-omap4-timer", "ti,sysc";
+			ti,hwmods = "timer8";
+			reg = <0x3e000 0x4>,
+			      <0x3e010 0x4>;
+			reg-names = "rev", "sysc";
+			ti,sysc-mask = <(SYSC_OMAP4_FREEEMU |
+					 SYSC_OMAP4_SOFTRESET)>;
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>,
+					<SYSC_IDLE_SMART_WKUP>;
+			/* Domains (V, P, C): iva, abe_pwrdm, abe_clkdm */
+			clocks = <&abe_clkctrl OMAP4_TIMER8_CLKCTRL 0>;
+			clock-names = "fck";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x3e000 0x1000>,
+				 <0x4903e000 0x4903e000 0x1000>;
+
+			timer8: timer@0 {
+				compatible = "ti,omap4430-timer";
+				reg = <0x00000000 0x80>,
+				      <0x4903e000 0x80>;
+				clocks = <&abe_clkctrl OMAP4_TIMER8_CLKCTRL 24>;
+				clock-names = "fck";
+				interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+				ti,timer-pwm;
+				ti,timer-dsp;
+			};
+		};
+
+		target-module@80000 {			/* 0x40180000, ap 26 1a.0 */
+			compatible = "ti,sysc";
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x80000 0x10000>,
+				 <0x49080000 0x49080000 0x10000>;
+		};
+
+		target-module@a0000 {			/* 0x401a0000, ap 28 1c.0 */
+			compatible = "ti,sysc";
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0xa0000 0x10000>,
+				 <0x490a0000 0x490a0000 0x10000>;
+		};
+
+		target-module@c0000 {			/* 0x401c0000, ap 30 1e.0 */
+			compatible = "ti,sysc";
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0xc0000 0x10000>,
+				 <0x490c0000 0x490c0000 0x10000>;
+		};
+
+		target-module@f1000 {			/* 0x401f1000, ap 32 20.0 */
+			compatible = "ti,sysc-omap4", "ti,sysc";
+			ti,hwmods = "aess";
+			reg = <0xf1000 0x4>,
+			      <0xf1010 0x4>;
+			reg-names = "rev", "sysc";
+			ti,sysc-midle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>,
+					<SYSC_IDLE_SMART_WKUP>;
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>;
+			/* Domains (V, P, C): iva, abe_pwrdm, abe_clkdm */
+			clocks = <&abe_clkctrl OMAP4_AESS_CLKCTRL 0>;
+			clock-names = "fck";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0xf1000 0x1000>,
+				 <0x490f1000 0x490f1000 0x1000>;
+
+			/*
+			 * No child device binding or driver in mainline.
+			 * See Android tree and related upstreaming efforts
+			 * for the old driver.
+			 */
+		};
+	};
+};
+
diff --git a/arch/arm/boot/dts/omap4-mcpdm.dtsi b/arch/arm/boot/dts/omap4-mcpdm.dtsi
--- a/arch/arm/boot/dts/omap4-mcpdm.dtsi
+++ b/arch/arm/boot/dts/omap4-mcpdm.dtsi
@@ -27,12 +27,18 @@
 	};
 };
 
-&mcpdm {
+&mcpdm_module {
+	/*
+	 * McPDM pads must be muxed at the interconnect target module
+	 * level as the module on the SoC needs external clock from
+	 * the PMIC
+	 */
 	pinctrl-names = "default";
 	pinctrl-0 = <&mcpdm_pins>;
+	status = "okay";
+};
 
+&mcpdm {
 	clocks = <&twl6040>;
 	clock-names = "pdmclk";
-
-	status = "okay";
 };
diff --git a/arch/arm/boot/dts/omap4.dtsi b/arch/arm/boot/dts/omap4.dtsi
--- a/arch/arm/boot/dts/omap4.dtsi
+++ b/arch/arm/boot/dts/omap4.dtsi
@@ -148,6 +148,9 @@
 		l4_per: interconnect@48000000 {
 		};
 
+		l4_abe: interconnect@40100000 {
+		};
+
 		ocmcram: ocmcram@40304000 {
 			compatible = "mmio-sram";
 			reg = <0x40304000 0xa000>; /* 40k */
@@ -214,130 +217,6 @@
 			#iommu-cells = <0>;
 			ti,iommu-bus-err-back;
 		};
-		target-module@40130000 {
-			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "wd_timer3";
-			reg = <0x40130000 0x4>,
-			      <0x40130010 0x4>,
-			      <0x40130014 0x4>;
-			reg-names = "rev", "sysc", "syss";
-			ti,sysc-mask = <(SYSC_OMAP2_EMUFREE |
-					 SYSC_OMAP2_SOFTRESET)>;
-			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
-					<SYSC_IDLE_NO>,
-					<SYSC_IDLE_SMART>,
-					<SYSC_IDLE_SMART_WKUP>;
-			ti,syss-mask = <1>;
-			/* Domains (V, P, C): abe, abe_pwrdm, abe_clkdm */
-			clocks = <&abe_clkctrl OMAP4_WD_TIMER3_CLKCTRL 0>;
-			clock-names = "fck";
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges = <0x00000000 0x40130000 0x1000>, /* MPU private access */
-				 <0x49030000 0x49030000 0x0080>; /* L3 Interconnect */
-
-			wdt3: wdt@0 {
-				compatible = "ti,omap4-wdt", "ti,omap3-wdt";
-				reg = <0x0 0x80>;
-				interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
-			};
-		};
-
-		mcpdm: mcpdm@40132000 {
-			compatible = "ti,omap4-mcpdm";
-			reg = <0x40132000 0x7f>, /* MPU private access */
-			      <0x49032000 0x7f>; /* L3 Interconnect */
-			reg-names = "mpu", "dma";
-			interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "mcpdm";
-			dmas = <&sdma 65>,
-			       <&sdma 66>;
-			dma-names = "up_link", "dn_link";
-			status = "disabled";
-		};
-
-		dmic: dmic@4012e000 {
-			compatible = "ti,omap4-dmic";
-			reg = <0x4012e000 0x7f>, /* MPU private access */
-			      <0x4902e000 0x7f>; /* L3 Interconnect */
-			reg-names = "mpu", "dma";
-			interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "dmic";
-			dmas = <&sdma 67>;
-			dma-names = "up_link";
-			status = "disabled";
-		};
-
-		mcbsp1: mcbsp@40122000 {
-			compatible = "ti,omap4-mcbsp";
-			reg = <0x40122000 0xff>, /* MPU private access */
-			      <0x49022000 0xff>; /* L3 Interconnect */
-			reg-names = "mpu", "dma";
-			interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "common";
-			ti,buffer-size = <128>;
-			ti,hwmods = "mcbsp1";
-			dmas = <&sdma 33>,
-			       <&sdma 34>;
-			dma-names = "tx", "rx";
-			status = "disabled";
-		};
-
-		mcbsp2: mcbsp@40124000 {
-			compatible = "ti,omap4-mcbsp";
-			reg = <0x40124000 0xff>, /* MPU private access */
-			      <0x49024000 0xff>; /* L3 Interconnect */
-			reg-names = "mpu", "dma";
-			interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "common";
-			ti,buffer-size = <128>;
-			ti,hwmods = "mcbsp2";
-			dmas = <&sdma 17>,
-			       <&sdma 18>;
-			dma-names = "tx", "rx";
-			status = "disabled";
-		};
-
-		mcbsp3: mcbsp@40126000 {
-			compatible = "ti,omap4-mcbsp";
-			reg = <0x40126000 0xff>, /* MPU private access */
-			      <0x49026000 0xff>; /* L3 Interconnect */
-			reg-names = "mpu", "dma";
-			interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "common";
-			ti,buffer-size = <128>;
-			ti,hwmods = "mcbsp3";
-			dmas = <&sdma 19>,
-			       <&sdma 20>;
-			dma-names = "tx", "rx";
-			status = "disabled";
-		};
-
-		target-module@40128000 {
-			compatible = "ti,sysc-mcasp", "ti,sysc";
-			ti,hwmods = "mcasp";
-			reg = <0x40128000 0x4>,
-			      <0x40128004 0x4>;
-			reg-names = "rev", "sysc";
-			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
-					<SYSC_IDLE_NO>,
-					<SYSC_IDLE_SMART>,
-					<SYSC_IDLE_SMART_WKUP>;
-			clocks = <&abe_clkctrl OMAP4_MCASP_CLKCTRL 0>;
-			clock-names = "fck";
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges = <0x00000000 0x40128000 0x1000>, /* MPU */
-				 <0x49028000 0x49028000 0x1000>; /* L3 */
-
-			/*
-			 * Child device unsupported by davinci-mcasp. At least
-			 * RX path is disabled for omap4, and only DIT mode
-			 * works with no I2S. See also old Android kernel
-			 * omap-mcasp driver for more information.
-			 */
-		};
-
 		target-module@4012c000 {
 			compatible = "ti,sysc-omap4", "ti,sysc";
 			ti,hwmods = "slimbus1";
@@ -359,33 +238,6 @@
 			/* No child device binding or driver in mainline */
 		};
 
-		target-module@401f1000 {
-			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "aess";
-			reg = <0x401f1000 0x4>,
-			      <0x401f1010 0x4>;
-			reg-names = "rev", "sysc";
-			ti,sysc-midle = <SYSC_IDLE_FORCE>,
-					<SYSC_IDLE_NO>,
-					<SYSC_IDLE_SMART>,
-					<SYSC_IDLE_SMART_WKUP>;
-			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
-					<SYSC_IDLE_NO>,
-					<SYSC_IDLE_SMART>;
-			clocks = <&abe_clkctrl OMAP4_AESS_CLKCTRL 0>;
-			clock-names = "fck";
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges = <0x00000000 0x401f1000 0x1000>, /* MPU */
-				 <0x490f1000 0x490f1000 0x1000>; /* L3 */
-
-			/*
-			 * No child device binding or driver in mainline.
-			 * See Android tree and related upstreaming efforts
-			 * for the old driver.
-			 */
-		};
-
 		dmm@4e000000 {
 			compatible = "ti,omap4-dmm";
 			reg = <0x4e000000 0x800>;
@@ -417,43 +269,6 @@
 			hw-caps-temp-alert;
 		};
 
-		timer5: timer@40138000 {
-			compatible = "ti,omap4430-timer";
-			reg = <0x40138000 0x80>,
-			      <0x49038000 0x80>;
-			interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "timer5";
-			ti,timer-dsp;
-		};
-
-		timer6: timer@4013a000 {
-			compatible = "ti,omap4430-timer";
-			reg = <0x4013a000 0x80>,
-			      <0x4903a000 0x80>;
-			interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "timer6";
-			ti,timer-dsp;
-		};
-
-		timer7: timer@4013c000 {
-			compatible = "ti,omap4430-timer";
-			reg = <0x4013c000 0x80>,
-			      <0x4903c000 0x80>;
-			interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "timer7";
-			ti,timer-dsp;
-		};
-
-		timer8: timer@4013e000 {
-			compatible = "ti,omap4430-timer";
-			reg = <0x4013e000 0x80>,
-			      <0x4903e000 0x80>;
-			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "timer8";
-			ti,timer-pwm;
-			ti,timer-dsp;
-		};
-
 		aes1: aes@4b501000 {
 			compatible = "ti,omap4-aes";
 			ti,hwmods = "aes1";
@@ -629,4 +444,5 @@
 };
 
 #include "omap4-l4.dtsi"
+#include "omap4-l4-abe.dtsi"
 #include "omap44xx-clocks.dtsi"
-- 
2.21.0
