Return-Path: <SRS0=UTzV=JZ=atomide.com=tony@kernel.org>
From: Tony Lindgren <tony@atomide.com>
Subject: [PATCH 4/5] ARM: dts: omap4: Move l4 child devices to probe them with ti-sysc
Date: Sun,  8 Jul 2018 23:36:11 -0700
Message-Id: <20180709063612.12025-5-tony@atomide.com>
In-Reply-To: <20180709063612.12025-1-tony@atomide.com>
References: <20180709063612.12025-1-tony@atomide.com>
To: linux-omap@vger.kernel.org
Cc: =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Rob Herring <robh+dt@kernel.org>, Tero Kristo <t-kristo@ti.com>
List-ID: <devicetree@vger.kernel.org>

With l4 interconnect hierarchy and ti-sysc interconnect target module
data in place, we can simply move all the related child devices to
their proper location and enable probing using ti-sysc.

In general the first child device address range starts at range 0
from the ti-sysc interconnect target so the move involves adjusting
the child device reg properties for that.

And we cannot yet move mmu_dsp until we have a proper reset controller
driver for rstctrl registers.

In case of any regressions, problem devices can be reverted to probe
with legacy platform data as needed by moving them back and removing
the related interconnect target module node.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap4-l4.dtsi      | 645 +++++++++++++++++++++-
 arch/arm/boot/dts/omap4-panda-es.dts |   2 +-
 arch/arm/boot/dts/omap4.dtsi         | 781 +--------------------------
 3 files changed, 643 insertions(+), 785 deletions(-)

diff --git a/arch/arm/boot/dts/omap4-l4.dtsi b/arch/arm/boot/dts/omap4-l4.dtsi
--- a/arch/arm/boot/dts/omap4-l4.dtsi
+++ b/arch/arm/boot/dts/omap4-l4.dtsi
@@ -55,22 +55,83 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x2000 0x1000>;
+
+			omap4_scm_core: scm@0 {
+				compatible = "ti,omap4-scm-core", "simple-bus";
+				reg = <0x0 0x1000>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges = <0 0 0x1000>;
+
+				scm_conf: scm_conf@0 {
+					compatible = "syscon";
+					reg = <0x0 0x800>;
+					#address-cells = <1>;
+					#size-cells = <1>;
+				};
+
+				omap_control_usb2phy: control-phy@300 {
+					compatible = "ti,control-phy-usb2";
+					reg = <0x300 0x4>;
+					reg-names = "power";
+				};
+
+				omap_control_usbotg: control-phy@33c {
+					compatible = "ti,control-phy-otghs";
+					reg = <0x33c 0x4>;
+					reg-names = "otghs_control";
+				};
+			};
 		};
 
 		target-module@4000 {			/* 0x4a004000, ap 5 02.0 */
-			compatible = "ti,sysc";
-			status = "disabled";
+			compatible = "ti,sysc-omap4", "ti,sysc";
+			reg = <0x4000 0x4>;
+			reg-names = "rev";
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x4000 0x1000>;
+
+			cm1: cm1@0 {
+				compatible = "ti,omap4-cm1", "simple-bus";
+				reg = <0x0 0x2000>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges = <0 0 0x2000>;
+
+				cm1_clocks: clocks {
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+
+				cm1_clockdomains: clockdomains {
+				};
+			};
 		};
 
 		target-module@8000 {			/* 0x4a008000, ap 23 32.0 */
-			compatible = "ti,sysc";
-			status = "disabled";
+			compatible = "ti,sysc-omap4", "ti,sysc";
+			reg = <0x8000 0x4>;
+			reg-names = "rev";
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x8000 0x2000>;
+
+			cm2: cm2@0 {
+				compatible = "ti,omap4-cm2", "simple-bus";
+				reg = <0x0 0x2000>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges = <0 0 0x2000>;
+
+				cm2_clocks: clocks {
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+
+				cm2_clockdomains: clockdomains {
+				};
+			};
 		};
 
 		target-module@56000 {			/* 0x4a056000, ap 7 0a.0 */
@@ -97,6 +158,18 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x56000 0x1000>;
+
+			sdma: dma-controller@0 {
+				compatible = "ti,omap4430-sdma";
+				reg = <0x0 0x1000>;
+				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
+				#dma-cells = <1>;
+				dma-channels = <32>;
+				dma-requests = <127>;
+			};
 		};
 
 		target-module@58000 {			/* 0x4a058000, ap 10 0e.0 */
@@ -124,6 +197,39 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x58000 0x4000>;
+
+			hsi: hsi@0 {
+				compatible = "ti,omap4-hsi";
+				reg = <0x0 0x4000>,
+				      <0x4a05c000 0x1000>;
+				reg-names = "sys", "gdd";
+
+				clocks = <&l3_init_clkctrl OMAP4_HSI_CLKCTRL 0>;
+				clock-names = "hsi_fck";
+
+				interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "gdd_mpu";
+
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges = <0 0 0x4000>;
+
+				hsi_port1: hsi-port@2000 {
+					compatible = "ti,omap4-hsi-port";
+					reg = <0x2000 0x800>,
+					      <0x2800 0x800>;
+					reg-names = "tx", "rx";
+					interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
+				};
+
+				hsi_port2: hsi-port@3000 {
+					compatible = "ti,omap4-hsi-port";
+					reg = <0x3000 0x800>,
+					      <0x3800 0x800>;
+					reg-names = "tx", "rx";
+					interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
+				};
+			};
 		};
 
 		target-module@5e000 {			/* 0x4a05e000, ap 80 68.0 */
@@ -154,6 +260,12 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x62000 0x1000>;
+
+			usbhstll: usbhstll@0 {
+				compatible = "ti,usbhs-tll";
+				reg = <0x0 0x1000>;
+				interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
+			};
 		};
 
 		target-module@64000 {			/* 0x4a064000, ap 86 1e.0 */
@@ -178,6 +290,33 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x64000 0x1000>;
+
+			usbhshost: usbhshost@0 {
+				compatible = "ti,usbhs-host";
+				reg = <0x0 0x800>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges = <0 0 0x1000>;
+				clocks = <&init_60m_fclk>,
+					 <&xclk60mhsp1_ck>,
+					 <&xclk60mhsp2_ck>;
+				clock-names = "refclk_60m_int",
+					      "refclk_60m_ext_p1",
+					      "refclk_60m_ext_p2";
+
+				usbhsohci: ohci@800 {
+					compatible = "ti,ohci-omap3";
+					reg = <0x800 0x400>;
+					interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
+					remote-wakeup-connected;
+				};
+
+				usbhsehci: ehci@c00 {
+					compatible = "ti,ehci-omap";
+					reg = <0xc00 0x400>;
+					interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
+				};
+			};
 		};
 
 		target-module@66000 {			/* 0x4a066000, ap 25 26.0 */
@@ -199,6 +338,9 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x66000 0x1000>;
+
+			/* mmu_dsp cannot be moved before reset driver */
+			status = "disabled";
 		};
 	};
 
@@ -261,6 +403,20 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x2b000 0x1000>;
+
+			usb_otg_hs: usb_otg_hs@0 {
+				compatible = "ti,omap4-musb";
+				reg = <0x0 0x7ff>;
+				interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "mc", "dma";
+				usb-phy = <&usb2_phy>;
+				phys = <&usb2_phy>;
+				phy-names = "usb2-phy";
+				multipoint = <1>;
+				num-eps = <16>;
+				ram-bits = <12>;
+				ctrl-module = <&omap_control_usbotg>;
+			};
 		};
 
 		target-module@2d000 {			/* 0x4a0ad000, ap 88 0c.0 */
@@ -282,6 +438,22 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x2d000 0x1000>;
+
+			ocp2scp@0 {
+				compatible = "ti,omap-ocp2scp";
+				reg = <0x0 0x1f>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges = <0 0 0x1000>;
+				usb2_phy: usb2phy@80 {
+					compatible = "ti,omap-usb2";
+					reg = <0x80 0x58>;
+					ctrl-module = <&omap_control_usb2phy>;
+					clocks = <&usb_phy_cm_clk32k>;
+					clock-names = "wkupclk";
+					#phy-cells = <0>;
+				};
+			};
 		};
 
 		target-module@36000 {			/* 0x4a0b6000, ap 69 60.0 */
@@ -316,6 +488,12 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x59000 0x1000>;
+
+			smartreflex_mpu: smartreflex@0 {
+				compatible = "ti,omap4-smartreflex-mpu";
+				reg = <0x0 0x80>;
+				interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
+			};
 		};
 
 		target-module@5b000 {			/* 0x4a0db000, ap 15 08.0 */
@@ -334,6 +512,12 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x5b000 0x1000>;
+
+			smartreflex_iva: smartreflex@0 {
+				compatible = "ti,omap4-smartreflex-iva";
+				reg = <0x0 0x80>;
+				interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
+			};
 		};
 
 		target-module@5d000 {			/* 0x4a0dd000, ap 17 22.0 */
@@ -352,6 +536,12 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x5d000 0x1000>;
+
+			smartreflex_core: smartreflex@0 {
+				compatible = "ti,omap4-smartreflex-core";
+				reg = <0x0 0x80>;
+				interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
+			};
 		};
 
 		target-module@60000 {			/* 0x4a0e0000, ap 19 1c.0 */
@@ -378,6 +568,23 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x74000 0x1000>;
+
+			mailbox: mailbox@0 {
+				compatible = "ti,omap4-mailbox";
+				reg = <0x0 0x200>;
+				interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
+				#mbox-cells = <1>;
+				ti,mbox-num-users = <3>;
+				ti,mbox-num-fifos = <8>;
+				mbox_ipu: mbox_ipu {
+					ti,mbox-tx = <0 0 0>;
+					ti,mbox-rx = <1 0 0>;
+				};
+				mbox_dsp: mbox_dsp {
+					ti,mbox-tx = <3 0 0>;
+					ti,mbox-rx = <2 0 0>;
+				};
+			};
 		};
 
 		target-module@76000 {			/* 0x4a0f6000, ap 29 3a.0 */
@@ -401,6 +608,12 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x76000 0x1000>;
+
+			hwspinlock: spinlock@0 {
+				compatible = "ti,omap4-hwspinlock";
+				reg = <0x0 0x1000>;
+				#hwlock-cells = <1>;
+			};
 		};
 	};
 
@@ -431,6 +644,39 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x0 0x1000>;
+
+			omap4_pmx_core: pinmux@40 {
+				compatible = "ti,omap4-padconf",
+					     "pinctrl-single";
+				reg = <0x40 0x0196>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				#pinctrl-cells = <1>;
+				#interrupt-cells = <1>;
+				interrupt-controller;
+				pinctrl-single,register-width = <16>;
+				pinctrl-single,function-mask = <0x7fff>;
+			};
+
+			omap4_padconf_global: omap4_padconf_global@5a0 {
+				compatible = "syscon",
+					     "simple-bus";
+				reg = <0x5a0 0x170>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges = <0 0x5a0 0x170>;
+
+				pbias_regulator: pbias_regulator@60 {
+					compatible = "ti,pbias-omap4", "ti,pbias-omap";
+					reg = <0x60 0x4>;
+					syscon = <&omap4_padconf_global>;
+					pbias_mmc_reg: pbias_mmc_omap4 {
+						regulator-name = "pbias_mmc_omap4";
+						regulator-min-microvolt = <1800000>;
+						regulator-max-microvolt = <3000000>;
+					};
+				};
+			};
 		};
 
 		target-module@2000 {			/* 0x4a102000, ap 61 3c.0 */
@@ -469,6 +715,8 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0xa000 0x1000>;
+
+			/* No child device binding or driver in mainline */
 		};
 	};
 
@@ -717,22 +965,59 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x4000 0x1000>;
+
+			counter32k: counter@0 {
+				compatible = "ti,omap-counter32k";
+				reg = <0x0 0x20>;
+			};
 		};
 
 		target-module@6000 {			/* 0x4a306000, ap 3 08.0 */
-			compatible = "ti,sysc";
-			status = "disabled";
+			compatible = "ti,sysc-omap4", "ti,sysc";
+			reg = <0x6000 0x4>;
+			reg-names = "rev";
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x6000 0x2000>;
+
+			prm: prm@0 {
+				compatible = "ti,omap4-prm";
+				reg = <0x0 0x2000>;
+				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges = <0 0 0x2000>;
+
+				prm_clocks: clocks {
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+
+				prm_clockdomains: clockdomains {
+				};
+			};
 		};
 
 		target-module@a000 {			/* 0x4a30a000, ap 15 34.0 */
-			compatible = "ti,sysc";
-			status = "disabled";
+			compatible = "ti,sysc-omap4", "ti,sysc";
+			reg = <0xa000 0x4>;
+			reg-names = "rev";
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0xa000 0x1000>;
+
+			scrm: scrm@0 {
+				compatible = "ti,omap4-scrm";
+				reg = <0x0 0x2000>;
+
+				scrm_clocks: clocks {
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+
+				scrm_clockdomains: clockdomains {
+				};
+			};
 		};
 
 		target-module@c000 {			/* 0x4a30c000, ap 19 2c.0 */
@@ -749,6 +1034,11 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0xc000 0x1000>;
+
+			omap4_scm_wkup: scm@c000 {
+				compatible = "ti,omap4-scm-wkup";
+				reg = <0xc000 0x1000>;
+			};
 		};
 	};
 
@@ -767,7 +1057,7 @@
 			 <0x0000e000 0x0001e000 0x001000>,	/* ap 21 */
 			 <0x0000f000 0x0001f000 0x001000>;	/* ap 22 */
 
-		target-module@0 {			/* 0x4a310000, ap 5 14.0 */
+		gpio1_target: target-module@0 {			/* 0x4a310000, ap 5 14.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
 			ti,hwmods = "gpio1";
 			reg = <0x0 0x4>,
@@ -789,6 +1079,17 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x0 0x1000>;
+
+			gpio1: gpio@0 {
+				compatible = "ti,omap4-gpio";
+				reg = <0x0 0x200>;
+				interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
+				ti,gpio-always-on;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+			};
 		};
 
 		target-module@4000 {			/* 0x4a314000, ap 7 18.0 */
@@ -811,6 +1112,12 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x4000 0x1000>;
+
+			wdt2: wdt@0 {
+				compatible = "ti,omap4-wdt", "ti,omap3-wdt";
+				reg = <0x0 0x80>;
+				interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
+			};
 		};
 
 		target-module@8000 {			/* 0x4a318000, ap 9 1c.0 */
@@ -835,6 +1142,15 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x8000 0x1000>;
+
+			timer1: timer@0 {
+				compatible = "ti,omap3430-timer";
+				reg = <0x0 0x80>;
+				clocks = <&l4_wkup_clkctrl OMAP4_TIMER1_CLKCTRL 24>;
+				clock-names = "fck";
+				interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
+				ti,timer-alwon;
+			};
 		};
 
 		target-module@c000 {			/* 0x4a31c000, ap 11 20.0 */
@@ -859,6 +1175,13 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0xc000 0x1000>;
+
+			keypad: keypad@0 {
+				compatible = "ti,omap4-keypad";
+				reg = <0x0 0x80>;
+				interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
+				reg-names = "mpu";
+			};
 		};
 
 		target-module@e000 {			/* 0x4a31e000, ap 21 30.0 */
@@ -875,6 +1198,19 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0xe000 0x1000>;
+
+			omap4_pmx_wkup: pinmux@40 {
+				compatible = "ti,omap4-padconf",
+					     "pinctrl-single";
+				reg = <0x40 0x0038>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				#pinctrl-cells = <1>;
+				#interrupt-cells = <1>;
+				interrupt-controller;
+				pinctrl-single,register-width = <16>;
+				pinctrl-single,function-mask = <0x7fff>;
+			};
 		};
 	};
 
@@ -1054,6 +1390,13 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x20000 0x1000>;
+
+			uart3: serial@0 {
+				compatible = "ti,omap4-uart";
+				reg = <0x0 0x100>;
+				interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
+				clock-frequency = <48000000>;
+			};
 		};
 
 		target-module@32000 {			/* 0x48032000, ap 5 02.0 */
@@ -1078,6 +1421,14 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x32000 0x1000>;
+
+			timer2: timer@0 {
+				compatible = "ti,omap3430-timer";
+				reg = <0x0 0x80>;
+				clocks = <&l4_per_clkctrl OMAP4_TIMER2_CLKCTRL 24>;
+				clock-names = "fck";
+				interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
+			};
 		};
 
 		target-module@34000 {			/* 0x48034000, ap 7 04.0 */
@@ -1098,6 +1449,14 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x34000 0x1000>;
+
+			timer3: timer@0 {
+				compatible = "ti,omap4430-timer";
+				reg = <0x0 0x80>;
+				clocks = <&l4_per_clkctrl OMAP4_TIMER3_CLKCTRL 24>;
+				clock-names = "fck";
+				interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
+			};
 		};
 
 		target-module@36000 {			/* 0x48036000, ap 9 0e.0 */
@@ -1118,6 +1477,14 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x36000 0x1000>;
+
+			timer4: timer@0 {
+				compatible = "ti,omap4430-timer";
+				reg = <0x0 0x80>;
+				clocks = <&l4_per_clkctrl OMAP4_TIMER4_CLKCTRL 24>;
+				clock-names = "fck";
+				interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
+			};
 		};
 
 		target-module@3e000 {			/* 0x4803e000, ap 11 08.0 */
@@ -1138,6 +1505,15 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x3e000 0x1000>;
+
+			timer9: timer@0 {
+				compatible = "ti,omap4430-timer";
+				reg = <0x0 0x80>;
+				clocks = <&l4_per_clkctrl OMAP4_TIMER9_CLKCTRL 24>;
+				clock-names = "fck";
+				interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
+				ti,timer-pwm;
+			};
 		};
 
 		target-module@40000 {			/* 0x48040000, ap 13 0a.0 */
@@ -1170,6 +1546,16 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x55000 0x1000>;
+
+			gpio2: gpio@0 {
+				compatible = "ti,omap4-gpio";
+				reg = <0x0 0x200>;
+				interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+			};
 		};
 
 		target-module@57000 {			/* 0x48057000, ap 17 16.0 */
@@ -1194,6 +1580,16 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x57000 0x1000>;
+
+			gpio3: gpio@0 {
+				compatible = "ti,omap4-gpio";
+				reg = <0x0 0x200>;
+				interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+			};
 		};
 
 		target-module@59000 {			/* 0x48059000, ap 19 10.0 */
@@ -1218,6 +1614,16 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x59000 0x1000>;
+
+			gpio4: gpio@0 {
+				compatible = "ti,omap4-gpio";
+				reg = <0x0 0x200>;
+				interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+			};
 		};
 
 		target-module@5b000 {			/* 0x4805b000, ap 21 12.0 */
@@ -1242,6 +1648,16 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x5b000 0x1000>;
+
+			gpio5: gpio@0 {
+				compatible = "ti,omap4-gpio";
+				reg = <0x0 0x200>;
+				interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+			};
 		};
 
 		target-module@5d000 {			/* 0x4805d000, ap 23 14.0 */
@@ -1266,6 +1682,16 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x5d000 0x1000>;
+
+			gpio6: gpio@0 {
+				compatible = "ti,omap4-gpio";
+				reg = <0x0 0x200>;
+				interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+			};
 		};
 
 		target-module@60000 {			/* 0x48060000, ap 25 1e.0 */
@@ -1290,6 +1716,14 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x60000 0x1000>;
+
+			i2c3: i2c@0 {
+				compatible = "ti,omap4-i2c";
+				reg = <0x0 0x100>;
+				interrupts = <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
 		};
 
 		target-module@6a000 {			/* 0x4806a000, ap 26 18.0 */
@@ -1313,6 +1747,13 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x6a000 0x1000>;
+
+			uart1: serial@0 {
+				compatible = "ti,omap4-uart";
+				reg = <0x0 0x100>;
+				interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
+				clock-frequency = <48000000>;
+			};
 		};
 
 		target-module@6c000 {			/* 0x4806c000, ap 28 20.0 */
@@ -1336,6 +1777,13 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x6c000 0x1000>;
+
+			uart2: serial@0 {
+				compatible = "ti,omap4-uart";
+				reg = <0x0 0x100>;
+				interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
+				clock-frequency = <48000000>;
+			};
 		};
 
 		target-module@6e000 {			/* 0x4806e000, ap 30 1c.1 */
@@ -1359,6 +1807,13 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x6e000 0x1000>;
+
+			uart4: serial@0 {
+				compatible = "ti,omap4-uart";
+				reg = <0x0 0x100>;
+				interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
+				clock-frequency = <48000000>;
+			};
 		};
 
 		target-module@70000 {			/* 0x48070000, ap 32 28.0 */
@@ -1383,6 +1838,14 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x70000 0x1000>;
+
+			i2c1: i2c@0 {
+				compatible = "ti,omap4-i2c";
+				reg = <0x0 0x100>;
+				interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
 		};
 
 		target-module@72000 {			/* 0x48072000, ap 34 30.0 */
@@ -1407,6 +1870,14 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x72000 0x1000>;
+
+			i2c2: i2c@0 {
+				compatible = "ti,omap4-i2c";
+				reg = <0x0 0x100>;
+				interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
 		};
 
 		target-module@76000 {			/* 0x48076000, ap 39 38.0 */
@@ -1426,6 +1897,8 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x76000 0x1000>;
+
+			/* No child device binding or driver in mainline */
 		};
 
 		target-module@78000 {			/* 0x48078000, ap 41 1a.0 */
@@ -1448,6 +1921,13 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x78000 0x1000>;
+
+			elm: elm@0 {
+				compatible = "ti,am3352-elm";
+				reg = <0x0 0x2000>;
+				interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
 		};
 
 		target-module@86000 {			/* 0x48086000, ap 43 24.0 */
@@ -1472,6 +1952,15 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x86000 0x1000>;
+
+			timer10: timer@0 {
+				compatible = "ti,omap3430-timer";
+				reg = <0x0 0x80>;
+				clocks = <&l4_per_clkctrl OMAP4_TIMER10_CLKCTRL 24>;
+				clock-names = "fck";
+				interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
+				ti,timer-pwm;
+			};
 		};
 
 		target-module@88000 {			/* 0x48088000, ap 45 2e.0 */
@@ -1492,6 +1981,15 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x88000 0x1000>;
+
+			timer11: timer@0 {
+				compatible = "ti,omap4430-timer";
+				reg = <0x0 0x80>;
+				clocks = <&l4_per_clkctrl OMAP4_TIMER11_CLKCTRL 24>;
+				clock-names = "fck";
+				interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
+				ti,timer-pwm;
+			};
 		};
 
 		target-module@90000 {			/* 0x48090000, ap 57 2a.0 */
@@ -1519,6 +2017,19 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x96000 0x1000>;
+
+			mcbsp4: mcbsp@0 {
+				compatible = "ti,omap4-mcbsp";
+				reg = <0x0 0xff>; /* L4 Interconnect */
+				reg-names = "mpu";
+				interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "common";
+				ti,buffer-size = <128>;
+				dmas = <&sdma 31>,
+				       <&sdma 32>;
+				dma-names = "tx", "rx";
+				status = "disabled";
+			};
 		};
 
 		target-module@98000 {			/* 0x48098000, ap 49 22.0 */
@@ -1539,6 +2050,25 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x98000 0x1000>;
+
+			mcspi1: spi@0 {
+				compatible = "ti,omap4-mcspi";
+				reg = <0x0 0x200>;
+				interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				ti,spi-num-cs = <4>;
+				dmas = <&sdma 35>,
+				       <&sdma 36>,
+				       <&sdma 37>,
+				       <&sdma 38>,
+				       <&sdma 39>,
+				       <&sdma 40>,
+				       <&sdma 41>,
+				       <&sdma 42>;
+				dma-names = "tx0", "rx0", "tx1", "rx1",
+					    "tx2", "rx2", "tx3", "rx3";
+			};
 		};
 
 		target-module@9a000 {			/* 0x4809a000, ap 51 2c.0 */
@@ -1559,6 +2089,20 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x9a000 0x1000>;
+
+			mcspi2: spi@0 {
+				compatible = "ti,omap4-mcspi";
+				reg = <0x0 0x200>;
+				interrupts = <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				ti,spi-num-cs = <2>;
+				dmas = <&sdma 43>,
+				       <&sdma 44>,
+				       <&sdma 45>,
+				       <&sdma 46>;
+				dma-names = "tx0", "rx0", "tx1", "rx1";
+			};
 		};
 
 		target-module@9c000 {			/* 0x4809c000, ap 53 36.0 */
@@ -1583,6 +2127,17 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x9c000 0x1000>;
+
+			mmc1: mmc@0 {
+				compatible = "ti,omap4-hsmmc";
+				reg = <0x0 0x400>;
+				interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+				ti,dual-volt;
+				ti,needs-special-reset;
+				dmas = <&sdma 61>, <&sdma 62>;
+				dma-names = "tx", "rx";
+				pbias-supply = <&pbias_mmc_reg>;
+			};
 		};
 
 		target-module@9e000 {			/* 0x4809e000, ap 55 48.0 */
@@ -1640,6 +2195,15 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0xad000 0x1000>;
+
+			mmc3: mmc@0 {
+				compatible = "ti,omap4-hsmmc";
+				reg = <0x0 0x400>;
+				interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
+				ti,needs-special-reset;
+				dmas = <&sdma 77>, <&sdma 78>;
+				dma-names = "tx", "rx";
+			};
 		};
 
 		target-module@b0000 {			/* 0x480b0000, ap 47 40.0 */
@@ -1667,6 +2231,12 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0xb2000 0x1000>;
+
+			hdqw1w: 1w@0 {
+				compatible = "ti,omap3-1w";
+				reg = <0x0 0x1000>;
+				interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
+			};
 		};
 
 		target-module@b4000 {			/* 0x480b4000, ap 67 46.0 */
@@ -1691,6 +2261,15 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0xb4000 0x1000>;
+
+			mmc2: mmc@0 {
+				compatible = "ti,omap4-hsmmc";
+				reg = <0x0 0x400>;
+				interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
+				ti,needs-special-reset;
+				dmas = <&sdma 47>, <&sdma 48>;
+				dma-names = "tx", "rx";
+			};
 		};
 
 		target-module@b8000 {			/* 0x480b8000, ap 69 58.0 */
@@ -1711,6 +2290,17 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0xb8000 0x1000>;
+
+			mcspi3: spi@0 {
+				compatible = "ti,omap4-mcspi";
+				reg = <0x0 0x200>;
+				interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				ti,spi-num-cs = <2>;
+				dmas = <&sdma 15>, <&sdma 16>;
+				dma-names = "tx0", "rx0";
+			};
 		};
 
 		target-module@ba000 {			/* 0x480ba000, ap 71 32.0 */
@@ -1731,6 +2321,17 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0xba000 0x1000>;
+
+			mcspi4: spi@0 {
+				compatible = "ti,omap4-mcspi";
+				reg = <0x0 0x200>;
+				interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				ti,spi-num-cs = <1>;
+				dmas = <&sdma 70>, <&sdma 71>;
+				dma-names = "tx0", "rx0";
+			};
 		};
 
 		target-module@d1000 {			/* 0x480d1000, ap 73 44.0 */
@@ -1755,6 +2356,15 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0xd1000 0x1000>;
+
+			mmc4: mmc@0 {
+				compatible = "ti,omap4-hsmmc";
+				reg = <0x0 0x400>;
+				interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
+				ti,needs-special-reset;
+				dmas = <&sdma 57>, <&sdma 58>;
+				dma-names = "tx", "rx";
+			};
 		};
 
 		target-module@d5000 {			/* 0x480d5000, ap 75 4e.0 */
@@ -1779,6 +2389,15 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0xd5000 0x1000>;
+
+			mmc5: mmc@0 {
+				compatible = "ti,omap4-hsmmc";
+				reg = <0x0 0x400>;
+				interrupts = <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
+				ti,needs-special-reset;
+				dmas = <&sdma 59>, <&sdma 60>;
+				dma-names = "tx", "rx";
+			};
 		};
 	};
 
@@ -1811,6 +2430,14 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x150000 0x1000>;
+
+			i2c4: i2c@0 {
+				compatible = "ti,omap4-i2c";
+				reg = <0x0 0x100>;
+				interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/omap4-panda-es.dts b/arch/arm/boot/dts/omap4-panda-es.dts
--- a/arch/arm/boot/dts/omap4-panda-es.dts
+++ b/arch/arm/boot/dts/omap4-panda-es.dts
@@ -68,6 +68,6 @@
 	};
 };
 
-&gpio1 {
+&gpio1_target {
 	 ti,no-reset-on-init;
 };
diff --git a/arch/arm/boot/dts/omap4.dtsi b/arch/arm/boot/dts/omap4.dtsi
--- a/arch/arm/boot/dts/omap4.dtsi
+++ b/arch/arm/boot/dts/omap4.dtsi
@@ -139,174 +139,13 @@
 		interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
 
-		l4_cfg: l4@4a000000 {
-			compatible = "ti,omap4-l4-cfg", "simple-bus";
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges = <0 0x4a000000 0x1000000>;
-
-			cm1: cm1@4000 {
-				compatible = "ti,omap4-cm1", "simple-bus";
-				reg = <0x4000 0x2000>;
-				#address-cells = <1>;
-				#size-cells = <1>;
-				ranges = <0 0x4000 0x2000>;
-
-				cm1_clocks: clocks {
-					#address-cells = <1>;
-					#size-cells = <0>;
-				};
-
-				cm1_clockdomains: clockdomains {
-				};
-			};
-
-			cm2: cm2@8000 {
-				compatible = "ti,omap4-cm2", "simple-bus";
-				reg = <0x8000 0x2000>;
-				#address-cells = <1>;
-				#size-cells = <1>;
-				ranges = <0 0x8000 0x2000>;
-
-				cm2_clocks: clocks {
-					#address-cells = <1>;
-					#size-cells = <0>;
-				};
-
-				cm2_clockdomains: clockdomains {
-				};
-			};
-
-			omap4_scm_core: scm@2000 {
-				compatible = "ti,omap4-scm-core", "simple-bus";
-				reg = <0x2000 0x1000>;
-				#address-cells = <1>;
-				#size-cells = <1>;
-				ranges = <0 0x2000 0x1000>;
-				ti,hwmods = "ctrl_module_core";
-
-				scm_conf: scm_conf@0 {
-					compatible = "syscon";
-					reg = <0x0 0x800>;
-					#address-cells = <1>;
-					#size-cells = <1>;
-				};
-			};
-
-			omap4_padconf_core: scm@100000 {
-				compatible = "ti,omap4-scm-padconf-core",
-					     "simple-bus";
-				reg = <0x100000 0x1000>;
-				#address-cells = <1>;
-				#size-cells = <1>;
-				ranges = <0 0x100000 0x1000>;
-				ti,hwmods = "ctrl_module_pad_core";
-
-				omap4_pmx_core: pinmux@40 {
-					compatible = "ti,omap4-padconf",
-						     "pinctrl-single";
-					reg = <0x40 0x0196>;
-					#address-cells = <1>;
-					#size-cells = <0>;
-					#pinctrl-cells = <1>;
-					#interrupt-cells = <1>;
-					interrupt-controller;
-					pinctrl-single,register-width = <16>;
-					pinctrl-single,function-mask = <0x7fff>;
-				};
-
-				omap4_padconf_global: omap4_padconf_global@5a0 {
-					compatible = "syscon",
-						     "simple-bus";
-					reg = <0x5a0 0x170>;
-					#address-cells = <1>;
-					#size-cells = <1>;
-					ranges = <0 0x5a0 0x170>;
-
-					pbias_regulator: pbias_regulator@60 {
-						compatible = "ti,pbias-omap4", "ti,pbias-omap";
-						reg = <0x60 0x4>;
-						syscon = <&omap4_padconf_global>;
-						pbias_mmc_reg: pbias_mmc_omap4 {
-							regulator-name = "pbias_mmc_omap4";
-							regulator-min-microvolt = <1800000>;
-							regulator-max-microvolt = <3000000>;
-						};
-					};
-				};
-			};
-
-			l4_wkup: l4@300000 {
-				compatible = "ti,omap4-l4-wkup", "simple-bus";
-				#address-cells = <1>;
-				#size-cells = <1>;
-				ranges = <0 0x300000 0x40000>;
-
-				counter32k: counter@4000 {
-					compatible = "ti,omap-counter32k";
-					reg = <0x4000 0x20>;
-					ti,hwmods = "counter_32k";
-				};
-
-				prm: prm@6000 {
-					compatible = "ti,omap4-prm";
-					reg = <0x6000 0x2000>;
-					interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
-					#address-cells = <1>;
-					#size-cells = <1>;
-					ranges = <0 0x6000 0x2000>;
-
-					prm_clocks: clocks {
-						#address-cells = <1>;
-						#size-cells = <0>;
-					};
-
-					prm_clockdomains: clockdomains {
-					};
-				};
-
-				scrm: scrm@a000 {
-					compatible = "ti,omap4-scrm";
-					reg = <0xa000 0x2000>;
-
-					scrm_clocks: clocks {
-						#address-cells = <1>;
-						#size-cells = <0>;
-					};
-
-					scrm_clockdomains: clockdomains {
-					};
-				};
-
-				omap4_scm_wkup: scm@c000 {
-					compatible = "ti,omap4-scm-wkup";
-					reg = <0xc000 0x1000>;
-					ti,hwmods = "ctrl_module_wkup";
-				};
+		l4_wkup: interconnect@4a300000 {
+		};
 
-				omap4_padconf_wkup: padconf@1e000 {
-					compatible = "ti,omap4-scm-padconf-wkup",
-						     "simple-bus";
-					reg = <0x1e000 0x1000>;
-					#address-cells = <1>;
-					#size-cells = <1>;
-					ranges = <0 0x1e000 0x1000>;
-					ti,hwmods = "ctrl_module_pad_wkup";
+		l4_cfg: interconnect@4a000000 {
+		};
 
-					omap4_pmx_wkup: pinmux@40 {
-						compatible = "ti,omap4-padconf",
-							     "pinctrl-single";
-						reg = <0x40 0x0038>;
-						#address-cells = <1>;
-						#size-cells = <0>;
-						#pinctrl-cells = <1>;
-						#interrupt-cells = <1>;
-						interrupt-controller;
-						pinctrl-single,register-width = <16>;
-						pinctrl-single,function-mask = <0x7fff>;
-					};
-				};
-			};
+		l4_per: interconnect@48000000 {
 		};
 
 		ocmcram: ocmcram@40304000 {
@@ -314,114 +153,6 @@
 			reg = <0x40304000 0xa000>; /* 40k */
 		};
 
-		sdma: dma-controller@4a056000 {
-			compatible = "ti,omap4430-sdma";
-			reg = <0x4a056000 0x1000>;
-			interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
-			#dma-cells = <1>;
-			dma-channels = <32>;
-			dma-requests = <127>;
-			ti,hwmods = "dma_system";
-		};
-
-		gpio1: gpio@4a310000 {
-			compatible = "ti,omap4-gpio";
-			reg = <0x4a310000 0x200>;
-			interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "gpio1";
-			ti,gpio-always-on;
-			gpio-controller;
-			#gpio-cells = <2>;
-			interrupt-controller;
-			#interrupt-cells = <2>;
-		};
-
-		gpio2: gpio@48055000 {
-			compatible = "ti,omap4-gpio";
-			reg = <0x48055000 0x200>;
-			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "gpio2";
-			gpio-controller;
-			#gpio-cells = <2>;
-			interrupt-controller;
-			#interrupt-cells = <2>;
-		};
-
-		gpio3: gpio@48057000 {
-			compatible = "ti,omap4-gpio";
-			reg = <0x48057000 0x200>;
-			interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "gpio3";
-			gpio-controller;
-			#gpio-cells = <2>;
-			interrupt-controller;
-			#interrupt-cells = <2>;
-		};
-
-		gpio4: gpio@48059000 {
-			compatible = "ti,omap4-gpio";
-			reg = <0x48059000 0x200>;
-			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "gpio4";
-			gpio-controller;
-			#gpio-cells = <2>;
-			interrupt-controller;
-			#interrupt-cells = <2>;
-		};
-
-		gpio5: gpio@4805b000 {
-			compatible = "ti,omap4-gpio";
-			reg = <0x4805b000 0x200>;
-			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "gpio5";
-			gpio-controller;
-			#gpio-cells = <2>;
-			interrupt-controller;
-			#interrupt-cells = <2>;
-		};
-
-		gpio6: gpio@4805d000 {
-			compatible = "ti,omap4-gpio";
-			reg = <0x4805d000 0x200>;
-			interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "gpio6";
-			gpio-controller;
-			#gpio-cells = <2>;
-			interrupt-controller;
-			#interrupt-cells = <2>;
-		};
-
-		target-module@48076000 {
-			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "slimbus2";
-			reg = <0x48076000 0x4>,
-			      <0x48076010 0x4>;
-			reg-names = "rev", "sysc";
-			ti,sysc-mask = <SYSC_OMAP4_SOFTRESET>;
-			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
-					<SYSC_IDLE_NO>,
-					<SYSC_IDLE_SMART>,
-					<SYSC_IDLE_SMART_WKUP>;
-			clocks = <&l4_per_clkctrl OMAP4_SLIMBUS2_CLKCTRL 0>;
-			clock-names = "fck";
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges = <0 0x48076000 0x001000>;
-
-			/* No child device binding or driver in mainline */
-		};
-
-		elm: elm@48078000 {
-			compatible = "ti,am3352-elm";
-			reg = <0x48078000 0x2000>;
-			interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "elm";
-			status = "disabled";
-		};
-
 		gpmc: gpmc@50000000 {
 			compatible = "ti,omap4430-gpmc";
 			reg = <0x50000000 0x1000>;
@@ -442,302 +173,6 @@
 			#gpio-cells = <2>;
 		};
 
-		uart1: serial@4806a000 {
-			compatible = "ti,omap4-uart";
-			reg = <0x4806a000 0x100>;
-			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "uart1";
-			clock-frequency = <48000000>;
-		};
-
-		uart2: serial@4806c000 {
-			compatible = "ti,omap4-uart";
-			reg = <0x4806c000 0x100>;
-			interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "uart2";
-			clock-frequency = <48000000>;
-		};
-
-		uart3: serial@48020000 {
-			compatible = "ti,omap4-uart";
-			reg = <0x48020000 0x100>;
-			interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "uart3";
-			clock-frequency = <48000000>;
-		};
-
-		uart4: serial@4806e000 {
-			compatible = "ti,omap4-uart";
-			reg = <0x4806e000 0x100>;
-			interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "uart4";
-			clock-frequency = <48000000>;
-		};
-
-		target-module@4a0db000 {
-			compatible = "ti,sysc-omap4-sr", "ti,sysc";
-			ti,hwmods = "smartreflex_iva";
-			reg = <0x4a0db038 0x4>;
-			reg-names = "sysc";
-			ti,sysc-mask = <SYSC_OMAP3_SR_ENAWAKEUP>;
-			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
-					<SYSC_IDLE_NO>,
-					<SYSC_IDLE_SMART>,
-					<SYSC_IDLE_SMART_WKUP>;
-			clocks = <&l4_ao_clkctrl OMAP4_SMARTREFLEX_IVA_CLKCTRL 0>;
-			clock-names = "fck";
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges = <0 0x4a0db000 0x001000>;
-
-			smartreflex_iva: smartreflex@0 {
-				compatible = "ti,omap4-smartreflex-iva";
-				reg = <0 0x80>;
-				interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
-			};
-		};
-
-		target-module@4a0dd000 {
-			compatible = "ti,sysc-omap4-sr", "ti,sysc";
-			ti,hwmods = "smartreflex_core";
-			reg = <0x4a0dd038 0x4>;
-			reg-names = "sysc";
-			ti,sysc-mask = <SYSC_OMAP3_SR_ENAWAKEUP>;
-			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
-					<SYSC_IDLE_NO>,
-					<SYSC_IDLE_SMART>,
-					<SYSC_IDLE_SMART_WKUP>;
-			clocks = <&l4_ao_clkctrl OMAP4_SMARTREFLEX_CORE_CLKCTRL 0>;
-			clock-names = "fck";
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges = <0 0x4a0dd000 0x001000>;
-
-			smartreflex_core: smartreflex@0 {
-				compatible = "ti,omap4-smartreflex-core";
-				reg = <0 0x80>;
-				interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
-			};
-		};
-
-		target-module@4a0d9000 {
-			compatible = "ti,sysc-omap4-sr", "ti,sysc";
-			ti,hwmods = "smartreflex_mpu";
-			reg = <0x4a0d9038 0x4>;
-			reg-names = "sysc";
-			ti,sysc-mask = <SYSC_OMAP3_SR_ENAWAKEUP>;
-			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
-					<SYSC_IDLE_NO>,
-					<SYSC_IDLE_SMART>,
-					<SYSC_IDLE_SMART_WKUP>;
-			clocks = <&l4_ao_clkctrl OMAP4_SMARTREFLEX_MPU_CLKCTRL 0>;
-			clock-names = "fck";
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges = <0 0x4a0d9000 0x001000>;
-
-			smartreflex_mpu: smartreflex@0 {
-				compatible = "ti,omap4-smartreflex-mpu";
-				reg = <0 0x80>;
-				interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
-			};
-		};
-
-		hwspinlock: spinlock@4a0f6000 {
-			compatible = "ti,omap4-hwspinlock";
-			reg = <0x4a0f6000 0x1000>;
-			ti,hwmods = "spinlock";
-			#hwlock-cells = <1>;
-		};
-
-		i2c1: i2c@48070000 {
-			compatible = "ti,omap4-i2c";
-			reg = <0x48070000 0x100>;
-			interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			ti,hwmods = "i2c1";
-		};
-
-		i2c2: i2c@48072000 {
-			compatible = "ti,omap4-i2c";
-			reg = <0x48072000 0x100>;
-			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			ti,hwmods = "i2c2";
-		};
-
-		i2c3: i2c@48060000 {
-			compatible = "ti,omap4-i2c";
-			reg = <0x48060000 0x100>;
-			interrupts = <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			ti,hwmods = "i2c3";
-		};
-
-		i2c4: i2c@48350000 {
-			compatible = "ti,omap4-i2c";
-			reg = <0x48350000 0x100>;
-			interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			ti,hwmods = "i2c4";
-		};
-
-		mcspi1: spi@48098000 {
-			compatible = "ti,omap4-mcspi";
-			reg = <0x48098000 0x200>;
-			interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			ti,hwmods = "mcspi1";
-			ti,spi-num-cs = <4>;
-			dmas = <&sdma 35>,
-			       <&sdma 36>,
-			       <&sdma 37>,
-			       <&sdma 38>,
-			       <&sdma 39>,
-			       <&sdma 40>,
-			       <&sdma 41>,
-			       <&sdma 42>;
-			dma-names = "tx0", "rx0", "tx1", "rx1",
-				    "tx2", "rx2", "tx3", "rx3";
-		};
-
-		mcspi2: spi@4809a000 {
-			compatible = "ti,omap4-mcspi";
-			reg = <0x4809a000 0x200>;
-			interrupts = <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			ti,hwmods = "mcspi2";
-			ti,spi-num-cs = <2>;
-			dmas = <&sdma 43>,
-			       <&sdma 44>,
-			       <&sdma 45>,
-			       <&sdma 46>;
-			dma-names = "tx0", "rx0", "tx1", "rx1";
-		};
-
-		hdqw1w: 1w@480b2000 {
-			compatible = "ti,omap3-1w";
-			reg = <0x480b2000 0x1000>;
-			interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "hdq1w";
-		};
-
-		mcspi3: spi@480b8000 {
-			compatible = "ti,omap4-mcspi";
-			reg = <0x480b8000 0x200>;
-			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			ti,hwmods = "mcspi3";
-			ti,spi-num-cs = <2>;
-			dmas = <&sdma 15>, <&sdma 16>;
-			dma-names = "tx0", "rx0";
-		};
-
-		mcspi4: spi@480ba000 {
-			compatible = "ti,omap4-mcspi";
-			reg = <0x480ba000 0x200>;
-			interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			ti,hwmods = "mcspi4";
-			ti,spi-num-cs = <1>;
-			dmas = <&sdma 70>, <&sdma 71>;
-			dma-names = "tx0", "rx0";
-		};
-
-		mmc1: mmc@4809c000 {
-			compatible = "ti,omap4-hsmmc";
-			reg = <0x4809c000 0x400>;
-			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "mmc1";
-			ti,dual-volt;
-			ti,needs-special-reset;
-			dmas = <&sdma 61>, <&sdma 62>;
-			dma-names = "tx", "rx";
-			pbias-supply = <&pbias_mmc_reg>;
-		};
-
-		mmc2: mmc@480b4000 {
-			compatible = "ti,omap4-hsmmc";
-			reg = <0x480b4000 0x400>;
-			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "mmc2";
-			ti,needs-special-reset;
-			dmas = <&sdma 47>, <&sdma 48>;
-			dma-names = "tx", "rx";
-		};
-
-		mmc3: mmc@480ad000 {
-			compatible = "ti,omap4-hsmmc";
-			reg = <0x480ad000 0x400>;
-			interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "mmc3";
-			ti,needs-special-reset;
-			dmas = <&sdma 77>, <&sdma 78>;
-			dma-names = "tx", "rx";
-		};
-
-		mmc4: mmc@480d1000 {
-			compatible = "ti,omap4-hsmmc";
-			reg = <0x480d1000 0x400>;
-			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "mmc4";
-			ti,needs-special-reset;
-			dmas = <&sdma 57>, <&sdma 58>;
-			dma-names = "tx", "rx";
-		};
-
-		mmc5: mmc@480d5000 {
-			compatible = "ti,omap4-hsmmc";
-			reg = <0x480d5000 0x400>;
-			interrupts = <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "mmc5";
-			ti,needs-special-reset;
-			dmas = <&sdma 59>, <&sdma 60>;
-			dma-names = "tx", "rx";
-		};
-
-		hsi: hsi@4a058000 {
-			compatible = "ti,omap4-hsi";
-			reg = <0x4a058000 0x4000>,
-			      <0x4a05c000 0x1000>;
-			reg-names = "sys", "gdd";
-			ti,hwmods = "hsi";
-
-			clocks = <&l3_init_clkctrl OMAP4_HSI_CLKCTRL 0>;
-			clock-names = "hsi_fck";
-
-			interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "gdd_mpu";
-
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges = <0 0x4a058000 0x4000>;
-
-			hsi_port1: hsi-port@2000 {
-				compatible = "ti,omap4-hsi-port";
-				reg = <0x2000 0x800>,
-				      <0x2800 0x800>;
-				reg-names = "tx", "rx";
-				interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
-			};
-
-			hsi_port2: hsi-port@3000 {
-				compatible = "ti,omap4-hsi-port";
-				reg = <0x3000 0x800>,
-				      <0x3800 0x800>;
-				reg-names = "tx", "rx";
-				interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
-			};
-		};
-
 		mmu_dsp: mmu@4a066000 {
 			compatible = "ti,omap4-iommu";
 			reg = <0x4a066000 0x100>;
@@ -779,14 +214,6 @@
 			#iommu-cells = <0>;
 			ti,iommu-bus-err-back;
 		};
-
-		wdt2: wdt@4a314000 {
-			compatible = "ti,omap4-wdt", "ti,omap3-wdt";
-			reg = <0x4a314000 0x80>;
-			interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "wd_timer2";
-		};
-
 		target-module@40130000 {
 			compatible = "ti,sysc-omap2", "ti,sysc";
 			ti,hwmods = "wd_timer3";
@@ -959,28 +386,6 @@
 			 */
 		};
 
-		mcbsp4: mcbsp@48096000 {
-			compatible = "ti,omap4-mcbsp";
-			reg = <0x48096000 0xff>; /* L4 Interconnect */
-			reg-names = "mpu";
-			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "common";
-			ti,buffer-size = <128>;
-			ti,hwmods = "mcbsp4";
-			dmas = <&sdma 31>,
-			       <&sdma 32>;
-			dma-names = "tx", "rx";
-			status = "disabled";
-		};
-
-		keypad: keypad@4a31c000 {
-			compatible = "ti,omap4-keypad";
-			reg = <0x4a31c000 0x80>;
-			interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
-			reg-names = "mpu";
-			ti,hwmods = "kbd";
-		};
-
 		dmm@4e000000 {
 			compatible = "ti,omap4-dmm";
 			reg = <0x4e000000 0x800>;
@@ -1012,95 +417,6 @@
 			hw-caps-temp-alert;
 		};
 
-		ocp2scp@4a0ad000 {
-			compatible = "ti,omap-ocp2scp";
-			reg = <0x4a0ad000 0x1f>;
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges;
-			ti,hwmods = "ocp2scp_usb_phy";
-			usb2_phy: usb2phy@4a0ad080 {
-				compatible = "ti,omap-usb2";
-				reg = <0x4a0ad080 0x58>;
-				ctrl-module = <&omap_control_usb2phy>;
-				clocks = <&usb_phy_cm_clk32k>;
-				clock-names = "wkupclk";
-				#phy-cells = <0>;
-			};
-		};
-
-		mailbox: mailbox@4a0f4000 {
-			compatible = "ti,omap4-mailbox";
-			reg = <0x4a0f4000 0x200>;
-			interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "mailbox";
-			#mbox-cells = <1>;
-			ti,mbox-num-users = <3>;
-			ti,mbox-num-fifos = <8>;
-			mbox_ipu: mbox_ipu {
-				ti,mbox-tx = <0 0 0>;
-				ti,mbox-rx = <1 0 0>;
-			};
-			mbox_dsp: mbox_dsp {
-				ti,mbox-tx = <3 0 0>;
-				ti,mbox-rx = <2 0 0>;
-			};
-		};
-
-		target-module@4a10a000 {
-			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "fdif";
-			reg = <0x4a10a000 0x4>,
-			      <0x4a10a010 0x4>;
-			reg-names = "rev", "sysc";
-			ti,sysc-mask = <SYSC_OMAP4_SOFTRESET>;
-			ti,sysc-midle = <SYSC_IDLE_FORCE>,
-					<SYSC_IDLE_NO>,
-					<SYSC_IDLE_SMART>;
-			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
-					<SYSC_IDLE_NO>,
-					<SYSC_IDLE_SMART>;
-			ti,sysc-delay-us = <2>;
-			clocks = <&iss_clkctrl OMAP4_FDIF_CLKCTRL 0>;
-			clock-names = "fck";
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges = <0 0x4a10a000 0x1000>;
-
-			/* No child device binding or driver in mainline */
-		};
-
-		timer1: timer@4a318000 {
-			compatible = "ti,omap3430-timer";
-			reg = <0x4a318000 0x80>;
-			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "timer1";
-			ti,timer-alwon;
-			clocks = <&l4_wkup_clkctrl OMAP4_TIMER1_CLKCTRL 24>;
-			clock-names = "fck";
-		};
-
-		timer2: timer@48032000 {
-			compatible = "ti,omap3430-timer";
-			reg = <0x48032000 0x80>;
-			interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "timer2";
-		};
-
-		timer3: timer@48034000 {
-			compatible = "ti,omap4430-timer";
-			reg = <0x48034000 0x80>;
-			interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "timer3";
-		};
-
-		timer4: timer@48036000 {
-			compatible = "ti,omap4430-timer";
-			reg = <0x48036000 0x80>;
-			interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "timer4";
-		};
-
 		timer5: timer@40138000 {
 			compatible = "ti,omap4430-timer";
 			reg = <0x40138000 0x80>,
@@ -1138,92 +454,6 @@
 			ti,timer-dsp;
 		};
 
-		timer9: timer@4803e000 {
-			compatible = "ti,omap4430-timer";
-			reg = <0x4803e000 0x80>;
-			interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "timer9";
-			ti,timer-pwm;
-		};
-
-		timer10: timer@48086000 {
-			compatible = "ti,omap3430-timer";
-			reg = <0x48086000 0x80>;
-			interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "timer10";
-			ti,timer-pwm;
-		};
-
-		timer11: timer@48088000 {
-			compatible = "ti,omap4430-timer";
-			reg = <0x48088000 0x80>;
-			interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "timer11";
-			ti,timer-pwm;
-		};
-
-		usbhstll: usbhstll@4a062000 {
-			compatible = "ti,usbhs-tll";
-			reg = <0x4a062000 0x1000>;
-			interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "usb_tll_hs";
-		};
-
-		usbhshost: usbhshost@4a064000 {
-			compatible = "ti,usbhs-host";
-			reg = <0x4a064000 0x800>;
-			ti,hwmods = "usb_host_hs";
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges;
-			clocks = <&init_60m_fclk>,
-				 <&xclk60mhsp1_ck>,
-				 <&xclk60mhsp2_ck>;
-			clock-names = "refclk_60m_int",
-				      "refclk_60m_ext_p1",
-				      "refclk_60m_ext_p2";
-
-			usbhsohci: ohci@4a064800 {
-				compatible = "ti,ohci-omap3";
-				reg = <0x4a064800 0x400>;
-				interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
-				remote-wakeup-connected;
-			};
-
-			usbhsehci: ehci@4a064c00 {
-				compatible = "ti,ehci-omap";
-				reg = <0x4a064c00 0x400>;
-				interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
-			};
-		};
-
-		omap_control_usb2phy: control-phy@4a002300 {
-			compatible = "ti,control-phy-usb2";
-			reg = <0x4a002300 0x4>;
-			reg-names = "power";
-		};
-
-		omap_control_usbotg: control-phy@4a00233c {
-			compatible = "ti,control-phy-otghs";
-			reg = <0x4a00233c 0x4>;
-			reg-names = "otghs_control";
-		};
-
-		usb_otg_hs: usb_otg_hs@4a0ab000 {
-			compatible = "ti,omap4-musb";
-			reg = <0x4a0ab000 0x7ff>;
-			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "mc", "dma";
-			ti,hwmods = "usb_otg_hs";
-			usb-phy = <&usb2_phy>;
-			phys = <&usb2_phy>;
-			phy-names = "usb2-phy";
-			multipoint = <1>;
-			num-eps = <16>;
-			ram-bits = <12>;
-			ctrl-module = <&omap_control_usbotg>;
-		};
-
 		aes1: aes@4b501000 {
 			compatible = "ti,omap4-aes";
 			ti,hwmods = "aes1";
@@ -1398,4 +628,5 @@
 	};
 };
 
+#include "omap4-l4.dtsi"
 #include "omap44xx-clocks.dtsi"
-- 
2.17.1
