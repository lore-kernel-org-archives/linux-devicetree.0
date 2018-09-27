Return-Path: <SRS0=yXvz=MJ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from muru.com ([72.249.23.125]:57552 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727265AbeI1D0w (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 27 Sep 2018 23:26:52 -0400
From: Tony Lindgren <tony@atomide.com>
Subject: [PATCH 4/4] ARM: dts: dra7: Move l4 child devices to probe them with ti-sysc
Date: Thu, 27 Sep 2018 14:05:42 -0700
Message-Id: <20180927210542.69703-5-tony@atomide.com>
In-Reply-To: <20180927210542.69703-1-tony@atomide.com>
References: <20180927210542.69703-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: linux-omap@vger.kernel.org
Cc: =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>, devicetree@vger.kernel.org, Dave Gerlach <d-gerlach@ti.com>, Keerthy <j-keerthy@ti.com>, Tero Kristo <t-kristo@ti.com>
List-ID: <devicetree@vger.kernel.org>

With l4 interconnect hierarchy and ti-sysc interconnect target module
data in place, we can simply move all the related child devices to
their proper location and enable probing using ti-sysc.

In general the first child device address range starts at range 0
from the ti-sysc interconnect target so the move involves adjusting
the child device reg properties for that.

In case of any regressions, problem devices can be reverted to probe
with legacy platform data as needed by moving them back and removing
the related interconnect target module node.

Cc: Dave Gerlach <d-gerlach@ti.com>
Cc: Keerthy <j-keerthy@ti.com>
Cc: Tero Kristo <t-kristo@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/dra7-l4.dtsi | 1384 ++++++++++++++++++++++++++++++-
 arch/arm/boot/dts/dra7.dtsi    | 1424 +-------------------------------
 2 files changed, 1371 insertions(+), 1437 deletions(-)

diff --git a/arch/arm/boot/dts/dra7-l4.dtsi b/arch/arm/boot/dts/dra7-l4.dtsi
--- a/arch/arm/boot/dts/dra7-l4.dtsi
+++ b/arch/arm/boot/dts/dra7-l4.dtsi
@@ -45,27 +45,143 @@
 			 <0x00098000 0x00098000 0x001000>;	/* ap 60 */
 
 		target-module@2000 {			/* 0x4a002000, ap 3 08.0 */
-			compatible = "ti,sysc";
-			status = "disabled";
+			compatible = "ti,sysc-omap4", "ti,sysc";
+			reg = <0x2000 0x4>;
+			reg-names = "rev";
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x2000 0x2000>;
+
+			scm: scm@0 {
+				compatible = "ti,dra7-scm-core", "simple-bus";
+				reg = <0 0x2000>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges = <0 0 0x2000>;
+
+				scm_conf: scm_conf@0 {
+					compatible = "syscon", "simple-bus";
+					reg = <0x0 0x1400>;
+					#address-cells = <1>;
+					#size-cells = <1>;
+					ranges = <0 0x0 0x1400>;
+
+					pbias_regulator: pbias_regulator@e00 {
+						compatible = "ti,pbias-dra7", "ti,pbias-omap";
+						reg = <0xe00 0x4>;
+						syscon = <&scm_conf>;
+						pbias_mmc_reg: pbias_mmc_omap5 {
+							regulator-name = "pbias_mmc_omap5";
+							regulator-min-microvolt = <1800000>;
+							regulator-max-microvolt = <3300000>;
+						};
+					};
+
+					scm_conf_clocks: clocks {
+						#address-cells = <1>;
+						#size-cells = <0>;
+					};
+				};
+
+				phy_sel: cpsw-phy-sel@554 {
+					compatible = "ti,dra7xx-cpsw-phy-sel";
+					reg= <0x554 0x4>;
+					reg-names = "gmii-sel";
+				};
+
+				dra7_pmx_core: pinmux@1400 {
+					compatible = "ti,dra7-padconf",
+						     "pinctrl-single";
+					reg = <0x1400 0x0468>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+					#pinctrl-cells = <1>;
+					#interrupt-cells = <1>;
+					interrupt-controller;
+					pinctrl-single,register-width = <32>;
+					pinctrl-single,function-mask = <0x3fffffff>;
+				};
+
+				scm_conf1: scm_conf@1c04 {
+					compatible = "syscon";
+					reg = <0x1c04 0x0020>;
+					#syscon-cells = <2>;
+				};
+
+				scm_conf_pcie: scm_conf@1c24 {
+					compatible = "syscon";
+					reg = <0x1c24 0x0024>;
+				};
+
+				sdma_xbar: dma-router@b78 {
+					compatible = "ti,dra7-dma-crossbar";
+					reg = <0xb78 0xfc>;
+					#dma-cells = <1>;
+					dma-requests = <205>;
+					ti,dma-safe-map = <0>;
+					dma-masters = <&sdma>;
+				};
+
+				edma_xbar: dma-router@c78 {
+					compatible = "ti,dra7-dma-crossbar";
+					reg = <0xc78 0x7c>;
+					#dma-cells = <2>;
+					dma-requests = <204>;
+					ti,dma-safe-map = <0>;
+					dma-masters = <&edma>;
+				};
+			};
 		};
 
 		target-module@5000 {			/* 0x4a005000, ap 5 10.0 */
-			compatible = "ti,sysc";
-			status = "disabled";
+			compatible = "ti,sysc-omap4", "ti,sysc";
+			reg = <0x5000 0x4>;
+			reg-names = "rev";
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x5000 0x1000>;
+
+			cm_core_aon: cm_core_aon@0 {
+				compatible = "ti,dra7-cm-core-aon",
+					      "simple-bus";
+				#address-cells = <1>;
+				#size-cells = <1>;
+				reg = <0 0x2000>;
+				ranges = <0 0 0x2000>;
+
+				cm_core_aon_clocks: clocks {
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+
+				cm_core_aon_clockdomains: clockdomains {
+				};
+			};
 		};
 
 		target-module@8000 {			/* 0x4a008000, ap 7 0e.0 */
-			compatible = "ti,sysc";
-			status = "disabled";
+			compatible = "ti,sysc-omap4", "ti,sysc";
+			reg = <0x8000 0x4>;
+			reg-names = "rev";
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x8000 0x2000>;
+
+			cm_core: cm_core@0 {
+				compatible = "ti,dra7-cm-core", "simple-bus";
+				#address-cells = <1>;
+				#size-cells = <1>;
+				reg = <0 0x3000>;
+				ranges = <0 0 0x3000>;
+
+				cm_core_clocks: clocks {
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+
+				cm_core_clockdomains: clockdomains {
+				};
+			};
 		};
 
 		target-module@56000 {			/* 0x4a056000, ap 9 02.0 */
@@ -94,6 +210,18 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x56000 0x1000>;
+
+			sdma: dma-controller@0 {
+				compatible = "ti,omap4430-sdma";
+				reg = <0x0 0x1000>;
+				interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
+				#dma-cells = <1>;
+				dma-channels = <32>;
+				dma-requests = <127>;
+			};
 		};
 
 		target-module@5e000 {			/* 0x4a05e000, ap 11 1a.0 */
@@ -123,6 +251,53 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x80000 0x8000>;
+
+			ocp2scp@0 {
+				compatible = "ti,omap-ocp2scp";
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges = <0 0 0x8000>;
+				reg = <0x0 0x20>;
+
+				usb2_phy1: phy@4000 {
+					compatible = "ti,dra7x-usb2", "ti,omap-usb2";
+					reg = <0x4000 0x400>;
+					syscon-phy-power = <&scm_conf 0x300>;
+					clocks = <&usb_phy1_always_on_clk32k>,
+						 <&l3init_clkctrl DRA7_L3INIT_USB_OTG_SS1_CLKCTRL 8>;
+					clock-names =	"wkupclk",
+							"refclk";
+					#phy-cells = <0>;
+				};
+
+				usb2_phy2: phy@5000 {
+					compatible = "ti,dra7x-usb2-phy2",
+						     "ti,omap-usb2";
+					reg = <0x5000 0x400>;
+					syscon-phy-power = <&scm_conf 0xe74>;
+					clocks = <&usb_phy2_always_on_clk32k>,
+						 <&l3init_clkctrl DRA7_L3INIT_USB_OTG_SS2_CLKCTRL 8>;
+					clock-names =	"wkupclk",
+							"refclk";
+					#phy-cells = <0>;
+				};
+
+				usb3_phy1: phy@4400 {
+					compatible = "ti,omap-usb3";
+					reg = <0x4400 0x80>,
+					      <0x4800 0x64>,
+					      <0x4c00 0x40>;
+					reg-names = "phy_rx", "phy_tx", "pll_ctrl";
+					syscon-phy-power = <&scm_conf 0x370>;
+					clocks = <&usb_phy3_always_on_clk32k>,
+						 <&sys_clkin1>,
+						 <&l3init_clkctrl DRA7_L3INIT_USB_OTG_SS1_CLKCTRL 8>;
+					clock-names =	"wkupclk",
+							"sysclk",
+							"refclk";
+					#phy-cells = <0>;
+				};
+			};
 		};
 
 		target-module@90000 {			/* 0x4a090000, ap 59 42.0 */
@@ -144,6 +319,69 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x90000 0x8000>;
+
+			ocp2scp@0 {
+				compatible = "ti,omap-ocp2scp";
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges = <0 0 0x8000>;
+				reg = <0x0 0x20>;
+
+				pcie1_phy: pciephy@4000 {
+					compatible = "ti,phy-pipe3-pcie";
+					reg = <0x4000 0x80>, /* phy_rx */
+					      <0x4400 0x64>; /* phy_tx */
+					reg-names = "phy_rx", "phy_tx";
+					syscon-phy-power = <&scm_conf_pcie 0x1c>;
+					syscon-pcs = <&scm_conf_pcie 0x10>;
+					clocks = <&dpll_pcie_ref_ck>,
+						 <&dpll_pcie_ref_m2ldo_ck>,
+						 <&pcie_clkctrl DRA7_PCIE_PCIE1_CLKCTRL 8>,
+						 <&pcie_clkctrl DRA7_PCIE_PCIE1_CLKCTRL 9>,
+						 <&pcie_clkctrl DRA7_PCIE_PCIE1_CLKCTRL 10>,
+						 <&optfclk_pciephy_div>,
+						 <&sys_clkin1>;
+					clock-names = "dpll_ref", "dpll_ref_m2",
+						      "wkupclk", "refclk",
+						      "div-clk", "phy-div", "sysclk";
+					#phy-cells = <0>;
+				};
+
+				pcie2_phy: pciephy@5000 {
+					compatible = "ti,phy-pipe3-pcie";
+					reg = <0x5000 0x80>, /* phy_rx */
+					      <0x5400 0x64>; /* phy_tx */
+					reg-names = "phy_rx", "phy_tx";
+					syscon-phy-power = <&scm_conf_pcie 0x20>;
+					syscon-pcs = <&scm_conf_pcie 0x10>;
+					clocks = <&dpll_pcie_ref_ck>,
+						 <&dpll_pcie_ref_m2ldo_ck>,
+						 <&pcie_clkctrl DRA7_PCIE_PCIE2_CLKCTRL 8>,
+						 <&pcie_clkctrl DRA7_PCIE_PCIE2_CLKCTRL 9>,
+						 <&pcie_clkctrl DRA7_PCIE_PCIE2_CLKCTRL 10>,
+						 <&optfclk_pciephy_div>,
+						 <&sys_clkin1>;
+					clock-names = "dpll_ref", "dpll_ref_m2",
+						      "wkupclk", "refclk",
+						      "div-clk", "phy-div", "sysclk";
+					#phy-cells = <0>;
+					status = "disabled";
+				};
+
+				sata_phy: phy@6000 {
+					compatible = "ti,phy-pipe3-sata";
+					reg = <0x6000 0x80>, /* phy_rx */
+					      <0x6400 0x64>, /* phy_tx */
+					      <0x6800 0x40>; /* pll_ctrl */
+					reg-names = "phy_rx", "phy_tx", "pll_ctrl";
+					syscon-phy-power = <&scm_conf 0x374>;
+					clocks = <&sys_clkin1>,
+						 <&l3init_clkctrl DRA7_L3INIT_SATA_CLKCTRL 8>;
+					clock-names = "sysclk", "refclk";
+					syscon-pllreset = <&scm_conf 0x3fc>;
+					#phy-cells = <0>;
+				};
+			};
 		};
 
 		target-module@a0000 {			/* 0x4a0a0000, ap 15 40.0 */
@@ -155,7 +393,7 @@
 		};
 
 		target-module@d9000 {			/* 0x4a0d9000, ap 17 72.0 */
-			compatible = "ti,sysc-omap3630-sr", "ti,sysc";
+			compatible = "ti,sysc-omap4-sr", "ti,sysc";
 			ti,hwmods = "smartreflex_mpu";
 			reg = <0xd9038 0x4>;
 			reg-names = "sysc";
@@ -170,10 +408,12 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0xd9000 0x1000>;
+
+			/* SmartReflex child device marked reserved in TRM */
 		};
 
 		target-module@dd000 {			/* 0x4a0dd000, ap 19 18.0 */
-			compatible = "ti,sysc-omap3630-sr", "ti,sysc";
+			compatible = "ti,sysc-omap4-sr", "ti,sysc";
 			ti,hwmods = "smartreflex_core";
 			reg = <0xdd038 0x4>;
 			reg-names = "sysc";
@@ -188,6 +428,8 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0xdd000 0x1000>;
+
+			/* SmartReflex child device marked reserved in TRM */
 		};
 
 		target-module@e0000 {			/* 0x4a0e0000, ap 21 28.0 */
@@ -214,6 +456,18 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0xf4000 0x1000>;
+
+			mailbox1: mailbox@0 {
+				compatible = "ti,omap4-mailbox";
+				reg = <0x0 0x200>;
+				interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>;
+				#mbox-cells = <1>;
+				ti,mbox-num-users = <3>;
+				ti,mbox-num-fifos = <8>;
+				status = "disabled";
+			};
 		};
 
 		target-module@f6000 {			/* 0x4a0f6000, ap 25 78.0 */
@@ -236,6 +490,12 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0xf6000 0x1000>;
+
+			hwspinlock: spinlock@0 {
+				compatible = "ti,omap4-hwspinlock";
+				reg = <0x0 0x1000>;
+				#hwlock-cells = <1>;
+			};
 		};
 	};
 
@@ -871,14 +1131,22 @@
 					<SYSC_IDLE_SMART>,
 					<SYSC_IDLE_SMART_WKUP>;
 			ti,syss-mask = <1>;
-			ti,no-reset-on-init;
-			ti,no-idle-on-init;
 			/* Domains (P, C): l4per_pwrdm, l4per_clkdm */
 			clocks = <&l4per_clkctrl DRA7_L4PER_UART3_CLKCTRL 0>;
 			clock-names = "fck";
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x20000 0x1000>;
+
+			uart3: serial@0 {
+				compatible = "ti,dra742-uart", "ti,omap4-uart";
+				reg = <0x0 0x100>;
+				interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
+				clock-frequency = <48000000>;
+				status = "disabled";
+				dmas = <&sdma_xbar 53>, <&sdma_xbar 54>;
+				dma-names = "tx", "rx";
+			};
 		};
 
 		target-module@32000 {			/* 0x48032000, ap 5 3e.0 */
@@ -899,6 +1167,14 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x32000 0x1000>;
+
+			timer2: timer@0 {
+				compatible = "ti,omap5430-timer";
+				reg = <0x0 0x80>;
+				clocks = <&l4per_clkctrl DRA7_L4PER_TIMER2_CLKCTRL 24>;
+				clock-names = "fck";
+				interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+			};
 		};
 
 		target-module@34000 {			/* 0x48034000, ap 7 46.0 */
@@ -919,6 +1195,14 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x34000 0x1000>;
+
+			timer3: timer@0 {
+				compatible = "ti,omap5430-timer";
+				reg = <0x0 0x80>;
+				clocks = <&l4per_clkctrl DRA7_L4PER_TIMER3_CLKCTRL 24>;
+				clock-names = "fck";
+				interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
+			};
 		};
 
 		target-module@36000 {			/* 0x48036000, ap 9 4e.0 */
@@ -939,6 +1223,14 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x36000 0x1000>;
+
+			timer4: timer@0 {
+				compatible = "ti,omap5430-timer";
+				reg = <0x0 0x80>;
+				clocks = <&l4per_clkctrl DRA7_L4PER_TIMER4_CLKCTRL 24>;
+				clock-names = "fck";
+				interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
+			};
 		};
 
 		target-module@3e000 {			/* 0x4803e000, ap 11 56.0 */
@@ -959,6 +1251,14 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x3e000 0x1000>;
+
+			timer9: timer@0 {
+				compatible = "ti,omap5430-timer";
+				reg = <0x0 0x80>;
+				clocks = <&l4per_clkctrl DRA7_L4PER_TIMER9_CLKCTRL 24>;
+				clock-names = "fck";
+				interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
+			};
 		};
 
 		target-module@51000 {			/* 0x48051000, ap 45 2e.0 */
@@ -976,8 +1276,6 @@
 					<SYSC_IDLE_SMART>,
 					<SYSC_IDLE_SMART_WKUP>;
 			ti,syss-mask = <1>;
-			ti,no-reset-on-init;
-			ti,no-idle-on-init;
 			/* Domains (P, C): l4per_pwrdm, l4per_clkdm */
 			clocks = <&l4per_clkctrl DRA7_L4PER_GPIO7_CLKCTRL 0>,
 				 <&l4per_clkctrl DRA7_L4PER_GPIO7_CLKCTRL 8>;
@@ -985,6 +1283,16 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x51000 0x1000>;
+
+			gpio7: gpio@0 {
+				compatible = "ti,omap4-gpio";
+				reg = <0x0 0x200>;
+				interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+			};
 		};
 
 		target-module@53000 {			/* 0x48053000, ap 35 36.0 */
@@ -1009,6 +1317,16 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x53000 0x1000>;
+
+			gpio8: gpio@0 {
+				compatible = "ti,omap4-gpio";
+				reg = <0x0 0x200>;
+				interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+			};
 		};
 
 		target-module@55000 {			/* 0x48055000, ap 13 0e.0 */
@@ -1033,6 +1351,16 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x55000 0x1000>;
+
+			gpio2: gpio@0 {
+				compatible = "ti,omap4-gpio";
+				reg = <0x0 0x200>;
+				interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+			};
 		};
 
 		target-module@57000 {			/* 0x48057000, ap 15 06.0 */
@@ -1057,6 +1385,16 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x57000 0x1000>;
+
+			gpio3: gpio@0 {
+				compatible = "ti,omap4-gpio";
+				reg = <0x0 0x200>;
+				interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+			};
 		};
 
 		target-module@59000 {			/* 0x48059000, ap 17 16.0 */
@@ -1081,6 +1419,16 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x59000 0x1000>;
+
+			gpio4: gpio@0 {
+				compatible = "ti,omap4-gpio";
+				reg = <0x0 0x200>;
+				interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+			};
 		};
 
 		target-module@5b000 {			/* 0x4805b000, ap 19 1e.0 */
@@ -1105,6 +1453,16 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x5b000 0x1000>;
+
+			gpio5: gpio@0 {
+				compatible = "ti,omap4-gpio";
+				reg = <0x0 0x200>;
+				interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+			};
 		};
 
 		target-module@5d000 {			/* 0x4805d000, ap 21 26.0 */
@@ -1129,6 +1487,16 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x5d000 0x1000>;
+
+			gpio6: gpio@0 {
+				compatible = "ti,omap4-gpio";
+				reg = <0x0 0x200>;
+				interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+			};
 		};
 
 		target-module@60000 {			/* 0x48060000, ap 23 32.0 */
@@ -1153,6 +1521,15 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x60000 0x1000>;
+
+			i2c3: i2c@0 {
+				compatible = "ti,omap4-i2c";
+				reg = <0x0 0x100>;
+				interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
 		};
 
 		target-module@66000 {			/* 0x48066000, ap 63 14.0 */
@@ -1176,6 +1553,16 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x66000 0x1000>;
+
+			uart5: serial@0 {
+				compatible = "ti,dra742-uart", "ti,omap4-uart";
+				reg = <0x0 0x100>;
+				interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
+				clock-frequency = <48000000>;
+				status = "disabled";
+				dmas = <&sdma_xbar 63>, <&sdma_xbar 64>;
+				dma-names = "tx", "rx";
+			};
 		};
 
 		target-module@68000 {			/* 0x48068000, ap 53 1c.0 */
@@ -1199,6 +1586,16 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x68000 0x1000>;
+
+			uart6: serial@0 {
+				compatible = "ti,dra742-uart", "ti,omap4-uart";
+				reg = <0x0 0x100>;
+				interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
+				clock-frequency = <48000000>;
+				status = "disabled";
+				dmas = <&sdma_xbar 79>, <&sdma_xbar 80>;
+				dma-names = "tx", "rx";
+			};
 		};
 
 		target-module@6a000 {			/* 0x4806a000, ap 24 24.0 */
@@ -1222,6 +1619,16 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x6a000 0x1000>;
+
+			uart1: serial@0 {
+				compatible = "ti,dra742-uart", "ti,omap4-uart";
+				reg = <0x0 0x100>;
+				interrupts-extended = <&crossbar_mpu GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
+				clock-frequency = <48000000>;
+				status = "disabled";
+				dmas = <&sdma_xbar 49>, <&sdma_xbar 50>;
+				dma-names = "tx", "rx";
+			};
 		};
 
 		target-module@6c000 {			/* 0x4806c000, ap 26 2c.0 */
@@ -1245,6 +1652,16 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x6c000 0x1000>;
+
+			uart2: serial@0 {
+				compatible = "ti,dra742-uart", "ti,omap4-uart";
+				reg = <0x0 0x100>;
+				interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
+				clock-frequency = <48000000>;
+				status = "disabled";
+				dmas = <&sdma_xbar 51>, <&sdma_xbar 52>;
+				dma-names = "tx", "rx";
+			};
 		};
 
 		target-module@6e000 {			/* 0x4806e000, ap 28 0c.1 */
@@ -1268,6 +1685,16 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x6e000 0x1000>;
+
+			uart4: serial@0 {
+				compatible = "ti,dra742-uart", "ti,omap4-uart";
+				reg = <0x0 0x100>;
+				interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;
+				clock-frequency = <48000000>;
+			                        status = "disabled";
+				dmas = <&sdma_xbar 55>, <&sdma_xbar 56>;
+				dma-names = "tx", "rx";
+			};
 		};
 
 		target-module@70000 {			/* 0x48070000, ap 30 22.0 */
@@ -1292,6 +1719,15 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x70000 0x1000>;
+
+			i2c1: i2c@0 {
+				compatible = "ti,omap4-i2c";
+				reg = <0x0 0x100>;
+				interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
 		};
 
 		target-module@72000 {			/* 0x48072000, ap 32 2a.0 */
@@ -1316,6 +1752,15 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x72000 0x1000>;
+
+			i2c2: i2c@0 {
+				compatible = "ti,omap4-i2c";
+				reg = <0x0 0x100>;
+				interrupts = <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
 		};
 
 		target-module@78000 {			/* 0x48078000, ap 39 0a.0 */
@@ -1339,6 +1784,13 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x78000 0x1000>;
+
+			elm: elm@0 {
+				compatible = "ti,am3352-elm";
+				reg = <0x0 0xfc0>;      /* device IO registers */
+				interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
 		};
 
 		target-module@7a000 {			/* 0x4807a000, ap 81 3a.0 */
@@ -1363,6 +1815,15 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x7a000 0x1000>;
+
+			i2c4: i2c@0 {
+				compatible = "ti,omap4-i2c";
+				reg = <0x0 0x100>;
+				interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
 		};
 
 		target-module@7c000 {			/* 0x4807c000, ap 83 4a.0 */
@@ -1387,6 +1848,15 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x7c000 0x1000>;
+
+			i2c5: i2c@0 {
+				compatible = "ti,omap4-i2c";
+				reg = <0x0 0x100>;
+				interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
 		};
 
 		target-module@86000 {			/* 0x48086000, ap 41 5e.0 */
@@ -1407,6 +1877,14 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x86000 0x1000>;
+
+			timer10: timer@0 {
+				compatible = "ti,omap5430-timer";
+				reg = <0x0 0x80>;
+				clocks = <&l4per_clkctrl DRA7_L4PER_TIMER10_CLKCTRL 24>;
+				clock-names = "fck";
+				interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
+			};
 		};
 
 		target-module@88000 {			/* 0x48088000, ap 43 66.0 */
@@ -1427,6 +1905,14 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x88000 0x1000>;
+
+			timer11: timer@0 {
+				compatible = "ti,omap5430-timer";
+				reg = <0x0 0x80>;
+				clocks = <&l4per_clkctrl DRA7_L4PER_TIMER11_CLKCTRL 24>;
+				clock-names = "fck";
+				interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
+			};
 		};
 
 		target-module@90000 {			/* 0x48090000, ap 55 12.0 */
@@ -1444,6 +1930,14 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x90000 0x2000>;
+
+			rng: rng@0 {
+				compatible = "ti,omap4-rng";
+				reg = <0x0 0x2000>;
+				interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&l3_iclk_div>;
+				clock-names = "fck";
+			};
 		};
 
 		target-module@98000 {			/* 0x48098000, ap 47 08.0 */
@@ -1464,6 +1958,26 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x98000 0x1000>;
+
+			mcspi1: spi@0 {
+				compatible = "ti,omap4-mcspi";
+				reg = <0x0 0x200>;
+				interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				ti,spi-num-cs = <4>;
+				dmas = <&sdma_xbar 35>,
+				       <&sdma_xbar 36>,
+				       <&sdma_xbar 37>,
+				       <&sdma_xbar 38>,
+				       <&sdma_xbar 39>,
+				       <&sdma_xbar 40>,
+				       <&sdma_xbar 41>,
+				       <&sdma_xbar 42>;
+				dma-names = "tx0", "rx0", "tx1", "rx1",
+					    "tx2", "rx2", "tx3", "rx3";
+				status = "disabled";
+			};
 		};
 
 		target-module@9a000 {			/* 0x4809a000, ap 49 10.0 */
@@ -1484,6 +1998,21 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x9a000 0x1000>;
+
+			mcspi2: spi@0 {
+				compatible = "ti,omap4-mcspi";
+				reg = <0x0 0x200>;
+				interrupts = <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				ti,spi-num-cs = <2>;
+				dmas = <&sdma_xbar 43>,
+				       <&sdma_xbar 44>,
+				       <&sdma_xbar 45>,
+				       <&sdma_xbar 46>;
+				dma-names = "tx0", "rx0", "tx1", "rx1";
+				status = "disabled";
+			};
 		};
 
 		target-module@9c000 {			/* 0x4809c000, ap 51 38.0 */
@@ -1508,6 +2037,17 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x9c000 0x1000>;
+
+			mmc1: mmc@0 {
+				compatible = "ti,dra7-sdhci";
+				reg = <0x0 0x400>;
+				interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+				pbias-supply = <&pbias_mmc_reg>;
+				max-frequency = <192000000>;
+				mmc-ddr-1_8v;
+				mmc-ddr-3_3v;
+			};
 		};
 
 		target-module@a2000 {			/* 0x480a2000, ap 75 02.0 */
@@ -1557,6 +2097,17 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0xad000 0x1000>;
+
+			mmc3: mmc@0 {
+				compatible = "ti,dra7-sdhci";
+				reg = <0x0 0x400>;
+				interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+				/* Errata i887 limits max-frequency of MMC3 to 64 MHz */
+				max-frequency = <64000000>;
+				/* SDMA is not supported */
+				sdhci-caps-mask = <0x0 0x400000>;
+			};
 		};
 
 		target-module@b2000 {			/* 0x480b2000, ap 37 52.0 */
@@ -1576,6 +2127,12 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0xb2000 0x1000>;
+
+			hdqw1w: 1w@0 {
+				compatible = "ti,omap3-1w";
+				reg = <0x0 0x1000>;
+				interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
+			};
 		};
 
 		target-module@b4000 {			/* 0x480b4000, ap 65 40.0 */
@@ -1600,6 +2157,19 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0xb4000 0x1000>;
+
+			mmc2: mmc@0 {
+				compatible = "ti,dra7-sdhci";
+				reg = <0x0 0x400>;
+				interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+				max-frequency = <192000000>;
+				/* SDR104/DDR50/SDR50 bits in CAPA2 is not supported */
+				sdhci-caps-mask = <0x7 0x0>;
+				mmc-hs200-1_8v;
+				mmc-ddr-1_8v;
+				mmc-ddr-3_3v;
+			};
 		};
 
 		target-module@b8000 {			/* 0x480b8000, ap 67 48.0 */
@@ -1620,6 +2190,18 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0xb8000 0x1000>;
+
+			mcspi3: spi@0 {
+				compatible = "ti,omap4-mcspi";
+				reg = <0x0 0x200>;
+				interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				ti,spi-num-cs = <2>;
+				dmas = <&sdma_xbar 15>, <&sdma_xbar 16>;
+				dma-names = "tx0", "rx0";
+				status = "disabled";
+			};
 		};
 
 		target-module@ba000 {			/* 0x480ba000, ap 69 18.0 */
@@ -1640,6 +2222,18 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0xba000 0x1000>;
+
+			mcspi4: spi@0 {
+				compatible = "ti,omap4-mcspi";
+				reg = <0x0 0x200>;
+				interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				ti,spi-num-cs = <1>;
+				dmas = <&sdma_xbar 70>, <&sdma_xbar 71>;
+				dma-names = "tx0", "rx0";
+				status = "disabled";
+			};
 		};
 
 		target-module@d1000 {			/* 0x480d1000, ap 71 28.0 */
@@ -1664,6 +2258,16 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0xd1000 0x1000>;
+
+			mmc4: mmc@0 {
+				compatible = "ti,dra7-sdhci";
+				reg = <0x0 0x400>;
+				interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+				max-frequency = <192000000>;
+				/* SDMA is not supported */
+				sdhci-caps-mask = <0x0 0x400000>;
+			};
 		};
 
 		target-module@d5000 {			/* 0x480d5000, ap 73 30.0 */
@@ -1783,6 +2387,14 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x20000 0x1000>;
+
+			uart7: serial@0 {
+				compatible = "ti,dra742-uart", "ti,omap4-uart";
+				reg = <0x0 0x100>;
+				interrupts = <GIC_SPI 218 IRQ_TYPE_LEVEL_HIGH>;
+				clock-frequency = <48000000>;
+				status = "disabled";
+			};
 		};
 
 		target-module@22000 {			/* 0x48422000, ap 49 0a.0 */
@@ -1806,6 +2418,14 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x22000 0x1000>;
+
+			uart8: serial@0 {
+				compatible = "ti,dra742-uart", "ti,omap4-uart";
+				reg = <0x0 0x100>;
+				interrupts = <GIC_SPI 219 IRQ_TYPE_LEVEL_HIGH>;
+				clock-frequency = <48000000>;
+				status = "disabled";
+			};
 		};
 
 		target-module@24000 {			/* 0x48424000, ap 51 12.0 */
@@ -1829,6 +2449,14 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x24000 0x1000>;
+
+			uart9: serial@0 {
+				compatible = "ti,dra742-uart", "ti,omap4-uart";
+				reg = <0x0 0x100>;
+				interrupts = <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH>;
+				clock-frequency = <48000000>;
+				status = "disabled";
+			};
 		};
 
 		target-module@2c000 {			/* 0x4842c000, ap 7 18.0 */
@@ -1856,11 +2484,24 @@
 		};
 
 		target-module@3c000 {			/* 0x4843c000, ap 23 08.0 */
-			compatible = "ti,sysc";
-			status = "disabled";
+			compatible = "ti,sysc-omap4", "ti,sysc";
+			reg = <0x3c000 0x4>;
+			reg-names = "rev";
+			clocks = <&atl_clkctrl DRA7_ATL_ATL_CLKCTRL 0>;
+			clock-names = "fck";
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x3c000 0x1000>;
+
+			atl: atl@0 {
+				compatible = "ti,dra7-atl";
+				reg = <0x0 0x3ff>;
+				ti,provided-clocks = <&atl_clkin0_ck>, <&atl_clkin1_ck>,
+						     <&atl_clkin2_ck>, <&atl_clkin3_ck>;
+				clocks = <&atl_clkctrl DRA7_ATL_ATL_CLKCTRL 26>;
+				clock-names = "fck";
+				status = "disabled";
+			};
 		};
 
 		target-module@3e000 {			/* 0x4843e000, ap 25 30.0 */
@@ -1879,6 +2520,35 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x3e000 0x1000>;
+
+			epwmss0: epwmss@0 {
+				compatible = "ti,dra746-pwmss", "ti,am33xx-pwmss";
+				reg = <0x0 0x30>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+				status = "disabled";
+				ranges = <0 0 0x1000>;
+
+				ecap0: ecap@100 {
+					compatible = "ti,dra746-ecap",
+						     "ti,am3352-ecap";
+					#pwm-cells = <3>;
+					reg = <0x100 0x80>;
+					clocks = <&l4_root_clk_div>;
+					clock-names = "fck";
+					status = "disabled";
+				};
+
+				ehrpwm0: pwm@200 {
+					compatible = "ti,dra746-ehrpwm",
+						     "ti,am3352-ehrpwm";
+					#pwm-cells = <3>;
+					reg = <0x200 0x80>;
+					clocks = <&ehrpwm0_tbclk>, <&l4_root_clk_div>;
+					clock-names = "tbclk", "fck";
+					status = "disabled";
+				};
+			};
 		};
 
 		target-module@40000 {			/* 0x48440000, ap 27 38.0 */
@@ -1897,6 +2567,35 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x40000 0x1000>;
+
+			epwmss1: epwmss@0 {
+				compatible = "ti,dra746-pwmss", "ti,am33xx-pwmss";
+				reg = <0x0 0x30>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+				status = "disabled";
+				ranges = <0 0 0x1000>;
+
+				ecap1: ecap@100 {
+					compatible = "ti,dra746-ecap",
+						     "ti,am3352-ecap";
+					#pwm-cells = <3>;
+					reg = <0x100 0x80>;
+					clocks = <&l4_root_clk_div>;
+					clock-names = "fck";
+					status = "disabled";
+				};
+
+				ehrpwm1: pwm@200 {
+					compatible = "ti,dra746-ehrpwm",
+						     "ti,am3352-ehrpwm";
+					#pwm-cells = <3>;
+					reg = <0x200 0x80>;
+					clocks = <&ehrpwm1_tbclk>, <&l4_root_clk_div>;
+					clock-names = "tbclk", "fck";
+					status = "disabled";
+				};
+			};
 		};
 
 		target-module@42000 {			/* 0x48442000, ap 29 20.0 */
@@ -1915,6 +2614,35 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x42000 0x1000>;
+
+			epwmss2: epwmss@0 {
+				compatible = "ti,dra746-pwmss", "ti,am33xx-pwmss";
+				reg = <0x0 0x30>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+				status = "disabled";
+				ranges = <0 0 0x1000>;
+
+				ecap2: ecap@100 {
+					compatible = "ti,dra746-ecap",
+						     "ti,am3352-ecap";
+					#pwm-cells = <3>;
+					reg = <0x100 0x80>;
+					clocks = <&l4_root_clk_div>;
+					clock-names = "fck";
+					status = "disabled";
+				};
+
+				ehrpwm2: pwm@200 {
+					compatible = "ti,dra746-ehrpwm",
+						     "ti,am3352-ehrpwm";
+					#pwm-cells = <3>;
+					reg = <0x200 0x80>;
+					clocks = <&ehrpwm2_tbclk>, <&l4_root_clk_div>;
+					clock-names = "tbclk", "fck";
+					status = "disabled";
+				};
+			};
 		};
 
 		target-module@46000 {			/* 0x48446000, ap 53 40.0 */
@@ -2004,6 +2732,23 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x60000 0x2000>;
+
+			mcasp1: mcasp@0 {
+				compatible = "ti,dra7-mcasp-audio";
+				reg = <0x0 0x2000>,
+				      <0x45800000 0x1000>;	/* L3 data port */
+				reg-names = "mpu","dat";
+				interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "tx", "rx";
+				dmas = <&edma_xbar 129 1>, <&edma_xbar 128 1>;
+				dma-names = "tx", "rx";
+				clocks = <&ipu_clkctrl DRA7_IPU_MCASP1_CLKCTRL 22>,
+					 <&ipu_clkctrl DRA7_IPU_MCASP1_CLKCTRL 24>,
+					 <&ipu_clkctrl DRA7_IPU_MCASP1_CLKCTRL 28>;
+				clock-names = "fck", "ahclkx", "ahclkr";
+				status = "disabled";
+			};
 		};
 
 		target-module@64000 {			/* 0x48464000, ap 11 1e.0 */
@@ -2021,6 +2766,23 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x64000 0x2000>;
+
+			mcasp2: mcasp@0 {
+				compatible = "ti,dra7-mcasp-audio";
+				reg = <0x0 0x2000>,
+				      <0x45c00000 0x1000>;	/* L3 data port */
+				reg-names = "mpu","dat";
+				interrupts = <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "tx", "rx";
+				dmas = <&edma_xbar 131 1>, <&edma_xbar 130 1>;
+				dma-names = "tx", "rx";
+				clocks = <&l4per2_clkctrl DRA7_L4PER2_MCASP2_CLKCTRL 22>,
+					 <&l4per2_clkctrl DRA7_L4PER2_MCASP2_CLKCTRL 24>,
+					 <&l4per2_clkctrl DRA7_L4PER2_MCASP2_CLKCTRL 28>;
+				clock-names = "fck", "ahclkx", "ahclkr";
+				status = "disabled";
+			};
 		};
 
 		target-module@68000 {			/* 0x48468000, ap 13 26.0 */
@@ -2038,6 +2800,22 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x68000 0x2000>;
+
+			mcasp3: mcasp@0 {
+				compatible = "ti,dra7-mcasp-audio";
+				reg = <0x0 0x2000>,
+				      <0x46000000 0x1000>;	/* L3 data port */
+				reg-names = "mpu","dat";
+				interrupts = <GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "tx", "rx";
+				dmas = <&edma_xbar 133 1>, <&edma_xbar 132 1>;
+				dma-names = "tx", "rx";
+				clocks = <&l4per2_clkctrl DRA7_L4PER2_MCASP3_CLKCTRL 22>,
+					 <&l4per2_clkctrl DRA7_L4PER2_MCASP3_CLKCTRL 24>;
+				clock-names = "fck", "ahclkx";
+				status = "disabled";
+			};
 		};
 
 		target-module@6c000 {			/* 0x4846c000, ap 15 2e.0 */
@@ -2055,6 +2833,22 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x6c000 0x2000>;
+
+			mcasp4: mcasp@0 {
+				compatible = "ti,dra7-mcasp-audio";
+				reg = <0x0 0x2000>,
+				      <0x48436000 0x1000>;	/* L3 data port */
+				reg-names = "mpu","dat";
+				interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "tx", "rx";
+				dmas = <&edma_xbar 135 1>, <&edma_xbar 134 1>;
+				dma-names = "tx", "rx";
+				clocks = <&l4per2_clkctrl DRA7_L4PER2_MCASP4_CLKCTRL 22>,
+					 <&l4per2_clkctrl DRA7_L4PER2_MCASP4_CLKCTRL 24>;
+				clock-names = "fck", "ahclkx";
+				status = "disabled";
+			};
 		};
 
 		target-module@70000 {			/* 0x48470000, ap 19 36.0 */
@@ -2072,6 +2866,22 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x70000 0x2000>;
+
+			mcasp5: mcasp@0 {
+				compatible = "ti,dra7-mcasp-audio";
+				reg = <0x0 0x2000>,
+				      <0x4843a000 0x1000>;	/* L3 data port */
+				reg-names = "mpu","dat";
+				interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "tx", "rx";
+				dmas = <&edma_xbar 137 1>, <&edma_xbar 136 1>;
+				dma-names = "tx", "rx";
+				clocks = <&l4per2_clkctrl DRA7_L4PER2_MCASP5_CLKCTRL 22>,
+					 <&l4per2_clkctrl DRA7_L4PER2_MCASP5_CLKCTRL 24>;
+				clock-names = "fck", "ahclkx";
+				status = "disabled";
+			};
 		};
 
 		target-module@74000 {			/* 0x48474000, ap 35 14.0 */
@@ -2089,6 +2899,22 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x74000 0x2000>;
+
+			mcasp6: mcasp@0 {
+				compatible = "ti,dra7-mcasp-audio";
+				reg = <0x0 0x2000>,
+				      <0x4844c000 0x1000>;	/* L3 data port */
+				reg-names = "mpu","dat";
+				interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "tx", "rx";
+				dmas = <&edma_xbar 139 1>, <&edma_xbar 138 1>;
+				dma-names = "tx", "rx";
+				clocks = <&l4per2_clkctrl DRA7_L4PER2_MCASP6_CLKCTRL 22>,
+					 <&l4per2_clkctrl DRA7_L4PER2_MCASP6_CLKCTRL 24>;
+				clock-names = "fck", "ahclkx";
+				status = "disabled";
+			};
 		};
 
 		target-module@78000 {			/* 0x48478000, ap 39 0c.0 */
@@ -2106,6 +2932,22 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x78000 0x2000>;
+
+			mcasp7: mcasp@0 {
+				compatible = "ti,dra7-mcasp-audio";
+				reg = <0x0 0x2000>,
+				      <0x48450000 0x1000>;	/* L3 data port */
+				reg-names = "mpu","dat";
+				interrupts = <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "tx", "rx";
+				dmas = <&edma_xbar 141 1>, <&edma_xbar 140 1>;
+				dma-names = "tx", "rx";
+				clocks = <&l4per2_clkctrl DRA7_L4PER2_MCASP7_CLKCTRL 22>,
+					 <&l4per2_clkctrl DRA7_L4PER2_MCASP7_CLKCTRL 24>;
+				clock-names = "fck", "ahclkx";
+				status = "disabled";
+			};
 		};
 
 		target-module@7c000 {			/* 0x4847c000, ap 43 04.0 */
@@ -2123,22 +2965,123 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x7c000 0x2000>;
+
+			mcasp8: mcasp@0 {
+				compatible = "ti,dra7-mcasp-audio";
+				reg = <0x0 0x2000>,
+				      <0x48454000 0x1000>;	/* L3 data port */
+				reg-names = "mpu","dat";
+				interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "tx", "rx";
+				dmas = <&edma_xbar 143 1>, <&edma_xbar 142 1>;
+				dma-names = "tx", "rx";
+				clocks = <&l4per2_clkctrl DRA7_L4PER2_MCASP8_CLKCTRL 22>,
+					 <&l4per2_clkctrl DRA7_L4PER2_MCASP8_CLKCTRL 24>;
+				clock-names = "fck", "ahclkx";
+				status = "disabled";
+			};
 		};
 
 		target-module@80000 {			/* 0x48480000, ap 31 16.0 */
-			compatible = "ti,sysc";
-			status = "disabled";
+			compatible = "ti,sysc-omap4", "ti,sysc";
+			reg = <0x80000 0x4>;
+			reg-names = "rev";
+			clocks = <&l4per2_clkctrl DRA7_L4PER2_DCAN2_CLKCTRL 0>;
+			clock-names = "fck";
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x80000 0x2000>;
+
+			dcan2: can@0 {
+				compatible = "ti,dra7-d_can";
+				reg = <0x0 0x2000>;
+				syscon-raminit = <&scm_conf 0x558 1>;
+				interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&sys_clkin1>;
+				status = "disabled";
+			};
 		};
 
 		target-module@84000 {			/* 0x48484000, ap 3 10.0 */
-			compatible = "ti,sysc";
-			status = "disabled";
+			compatible = "ti,sysc-omap4-simple", "ti,sysc";
+			ti,hwmods = "gmac";
+			reg = <0x85200 0x4>,
+			      <0x85208 0x4>,
+			      <0x85204 0x4>;
+			reg-names = "rev", "sysc", "syss";
+			ti,sysc-mask = <0>;
+			ti,sysc-midle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>;
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>;
+			ti,syss-mask = <1>;
+			clocks = <&gmac_clkctrl DRA7_GMAC_GMAC_CLKCTRL 0>;
+			clock-names = "fck";
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x84000 0x4000>;
+
+			mac: ethernet@0 {
+				compatible = "ti,dra7-cpsw","ti,cpsw";
+				clocks = <&gmac_main_clk>, <&gmac_clkctrl DRA7_GMAC_GMAC_CLKCTRL 25>;
+				clock-names = "fck", "cpts";
+				cpdma_channels = <8>;
+				ale_entries = <1024>;
+				bd_ram_size = <0x2000>;
+				mac_control = <0x20>;
+				slaves = <2>;
+				active_slave = <0>;
+				cpts_clock_mult = <0x784CFE14>;
+				cpts_clock_shift = <29>;
+				reg = <0x0 0x1000
+				       0x1200 0x2e00>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+
+				/*
+				 * Do not allow gating of cpsw clock as workaround
+				 * for errata i877. Keeping internal clock disabled
+				 * causes the device switching characteristics
+				 * to degrade over time and eventually fail to meet
+				 * the data manual delay time/skew specs.
+				 */
+				ti,no-idle;
+
+				/*
+				 * rx_thresh_pend
+				 * rx_pend
+				 * tx_pend
+				 * misc_pend
+				 */
+				interrupts = <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH>;
+				ranges = <0 0 0x4000>;
+				syscon = <&scm_conf>;
+				cpsw-phy-sel = <&phy_sel>;
+				status = "disabled";
+
+				davinci_mdio: mdio@1000 {
+					compatible = "ti,cpsw-mdio","ti,davinci_mdio";
+					#address-cells = <1>;
+					#size-cells = <0>;
+					ti,hwmods = "davinci_mdio";
+					bus_freq = <1000000>;
+					reg = <0x1000 0x100>;
+				};
+
+				cpsw_emac0: slave@200 {
+					/* Filled in by U-Boot */
+					mac-address = [ 00 00 00 00 00 00 ];
+				};
+
+				cpsw_emac1: slave@300 {
+					/* Filled in by U-Boot */
+					mac-address = [ 00 00 00 00 00 00 ];
+				};
+			};
 		};
 	};
 };
@@ -2273,6 +3216,19 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x2000 0x1000>;
+
+			mailbox13: mailbox@0 {
+				compatible = "ti,omap4-mailbox";
+				reg = <0x0 0x200>;
+				interrupts = <GIC_SPI 379 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 380 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 381 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 382 IRQ_TYPE_LEVEL_HIGH>;
+				#mbox-cells = <1>;
+				ti,mbox-num-users = <4>;
+				ti,mbox-num-fifos = <12>;
+				status = "disabled";
+			};
 		};
 
 		target-module@4000 {			/* 0x48804000, ap 81 20.0 */
@@ -2341,6 +3297,14 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x20000 0x1000>;
+
+			timer5: timer@0 {
+				compatible = "ti,omap5430-timer";
+				reg = <0x0 0x80>;
+				clocks = <&ipu_clkctrl DRA7_IPU_TIMER5_CLKCTRL 24>;
+				clock-names = "fck";
+				interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
+			};
 		};
 
 		target-module@22000 {			/* 0x48822000, ap 7 24.0 */
@@ -2361,6 +3325,14 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x22000 0x1000>;
+
+			timer6: timer@0 {
+				compatible = "ti,omap5430-timer";
+				reg = <0x0 0x80>;
+				clocks = <&ipu_clkctrl DRA7_IPU_TIMER6_CLKCTRL 24>;
+				clock-names = "fck";
+				interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
+			};
 		};
 
 		target-module@24000 {			/* 0x48824000, ap 9 26.0 */
@@ -2381,6 +3353,14 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x24000 0x1000>;
+
+			timer7: timer@0 {
+				compatible = "ti,omap5430-timer";
+				reg = <0x0 0x80>;
+				clocks = <&ipu_clkctrl DRA7_IPU_TIMER7_CLKCTRL 24>;
+				clock-names = "fck";
+				interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
+			};
 		};
 
 		target-module@26000 {			/* 0x48826000, ap 11 0c.0 */
@@ -2401,6 +3381,14 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x26000 0x1000>;
+
+			timer8: timer@0 {
+				compatible = "ti,omap5430-timer";
+				reg = <0x0 0x80>;
+				clocks = <&ipu_clkctrl DRA7_IPU_TIMER8_CLKCTRL 24>;
+				clock-names = "fck";
+				interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
+			};
 		};
 
 		target-module@28000 {			/* 0x48828000, ap 13 16.0 */
@@ -2421,6 +3409,14 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x28000 0x1000>;
+
+			timer13: timer@0 {
+				compatible = "ti,omap5430-timer";
+				reg = <0x0 0x80>;
+				clocks = <&l4per3_clkctrl DRA7_L4PER3_TIMER13_CLKCTRL 24>;
+				clock-names = "fck";
+				interrupts = <GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH>;
+			};
 		};
 
 		target-module@2a000 {			/* 0x4882a000, ap 15 10.0 */
@@ -2441,6 +3437,14 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x2a000 0x1000>;
+
+			timer14: timer@0 {
+				compatible = "ti,omap5430-timer";
+				reg = <0x0 0x80>;
+				clocks = <&l4per3_clkctrl DRA7_L4PER3_TIMER14_CLKCTRL 24>;
+				clock-names = "fck";
+				interrupts = <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>;
+			};
 		};
 
 		target-module@2c000 {			/* 0x4882c000, ap 17 02.0 */
@@ -2461,6 +3465,14 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x2c000 0x1000>;
+
+			timer15: timer@0 {
+				compatible = "ti,omap5430-timer";
+				reg = <0x0 0x80>;
+				clocks = <&l4per3_clkctrl DRA7_L4PER3_TIMER15_CLKCTRL 24>;
+				clock-names = "fck";
+				interrupts = <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH>;
+			};
 		};
 
 		target-module@2e000 {			/* 0x4882e000, ap 19 14.0 */
@@ -2481,6 +3493,14 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x2e000 0x1000>;
+
+			timer16: timer@0 {
+				compatible = "ti,omap5430-timer";
+				reg = <0x0 0x80>;
+				clocks = <&l4per3_clkctrl DRA7_L4PER3_TIMER16_CLKCTRL 24>;
+				clock-names = "fck";
+				interrupts = <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH>;
+			};
 		};
 
 		target-module@38000 {			/* 0x48838000, ap 29 12.0 */
@@ -2499,6 +3519,14 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x38000 0x1000>;
+
+			rtc: rtc@0 {
+				compatible = "ti,am3352-rtc";
+				reg = <0x0 0x100>;
+				interrupts = <GIC_SPI 217 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 217 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&sys_32k_ck>;
+			};
 		};
 
 		target-module@3a000 {			/* 0x4883a000, ap 33 3e.0 */
@@ -2517,6 +3545,19 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x3a000 0x1000>;
+
+			mailbox2: mailbox@0 {
+				compatible = "ti,omap4-mailbox";
+				reg = <0x0 0x200>;
+				interrupts = <GIC_SPI 237 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 238 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>;
+				#mbox-cells = <1>;
+				ti,mbox-num-users = <4>;
+				ti,mbox-num-fifos = <12>;
+				status = "disabled";
+			};
 		};
 
 		target-module@3c000 {			/* 0x4883c000, ap 35 3a.0 */
@@ -2535,6 +3576,19 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x3c000 0x1000>;
+
+			mailbox3: mailbox@0 {
+				compatible = "ti,omap4-mailbox";
+				reg = <0x0 0x200>;
+				interrupts = <GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 242 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>;
+				#mbox-cells = <1>;
+				ti,mbox-num-users = <4>;
+				ti,mbox-num-fifos = <12>;
+				status = "disabled";
+			};
 		};
 
 		target-module@3e000 {			/* 0x4883e000, ap 37 46.0 */
@@ -2553,6 +3607,19 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x3e000 0x1000>;
+
+			mailbox4: mailbox@0 {
+				compatible = "ti,omap4-mailbox";
+				reg = <0x0 0x200>;
+				interrupts = <GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>;
+				#mbox-cells = <1>;
+				ti,mbox-num-users = <4>;
+				ti,mbox-num-fifos = <12>;
+				status = "disabled";
+			};
 		};
 
 		target-module@40000 {			/* 0x48840000, ap 39 64.0 */
@@ -2571,6 +3638,19 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x40000 0x1000>;
+
+			mailbox5: mailbox@0 {
+				compatible = "ti,omap4-mailbox";
+				reg = <0x0 0x200>;
+				interrupts = <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH>;
+				#mbox-cells = <1>;
+				ti,mbox-num-users = <4>;
+				ti,mbox-num-fifos = <12>;
+				status = "disabled";
+			};
 		};
 
 		target-module@42000 {			/* 0x48842000, ap 41 4e.0 */
@@ -2589,6 +3669,19 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x42000 0x1000>;
+
+			mailbox6: mailbox@0 {
+				compatible = "ti,omap4-mailbox";
+				reg = <0x0 0x200>;
+				interrupts = <GIC_SPI 253 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>;
+				#mbox-cells = <1>;
+				ti,mbox-num-users = <4>;
+				ti,mbox-num-fifos = <12>;
+				status = "disabled";
+			};
 		};
 
 		target-module@44000 {			/* 0x48844000, ap 43 42.0 */
@@ -2607,6 +3700,19 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x44000 0x1000>;
+
+			mailbox7: mailbox@0 {
+				compatible = "ti,omap4-mailbox";
+				reg = <0x0 0x200>;
+				interrupts = <GIC_SPI 257 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 258 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 259 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 260 IRQ_TYPE_LEVEL_HIGH>;
+				#mbox-cells = <1>;
+				ti,mbox-num-users = <4>;
+				ti,mbox-num-fifos = <12>;
+				status = "disabled";
+			};
 		};
 
 		target-module@46000 {			/* 0x48846000, ap 45 48.0 */
@@ -2625,6 +3731,19 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x46000 0x1000>;
+
+			mailbox8: mailbox@0 {
+				compatible = "ti,omap4-mailbox";
+				reg = <0x0 0x200>;
+				interrupts = <GIC_SPI 261 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 262 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 263 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 264 IRQ_TYPE_LEVEL_HIGH>;
+				#mbox-cells = <1>;
+				ti,mbox-num-users = <4>;
+				ti,mbox-num-fifos = <12>;
+				status = "disabled";
+			};
 		};
 
 		target-module@48000 {			/* 0x48848000, ap 47 36.0 */
@@ -2731,6 +3850,19 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x5e000 0x1000>;
+
+			mailbox9: mailbox@0 {
+				compatible = "ti,omap4-mailbox";
+				reg = <0x0 0x200>;
+				interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>;
+				#mbox-cells = <1>;
+				ti,mbox-num-users = <4>;
+				ti,mbox-num-fifos = <12>;
+				status = "disabled";
+			};
 		};
 
 		target-module@60000 {			/* 0x48860000, ap 71 4a.0 */
@@ -2749,6 +3881,19 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x60000 0x1000>;
+
+			mailbox10: mailbox@0 {
+				compatible = "ti,omap4-mailbox";
+				reg = <0x0 0x200>;
+				interrupts = <GIC_SPI 269 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 270 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 271 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
+				#mbox-cells = <1>;
+				ti,mbox-num-users = <4>;
+				ti,mbox-num-fifos = <12>;
+				status = "disabled";
+			};
 		};
 
 		target-module@62000 {			/* 0x48862000, ap 73 74.0 */
@@ -2767,6 +3912,19 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x62000 0x1000>;
+
+			mailbox11: mailbox@0 {
+				compatible = "ti,omap4-mailbox";
+				reg = <0x0 0x200>;
+				interrupts = <GIC_SPI 273 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 274 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 275 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 276 IRQ_TYPE_LEVEL_HIGH>;
+				#mbox-cells = <1>;
+				ti,mbox-num-users = <4>;
+				ti,mbox-num-fifos = <12>;
+				status = "disabled";
+			};
 		};
 
 		target-module@64000 {			/* 0x48864000, ap 67 52.0 */
@@ -2785,6 +3943,19 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x64000 0x1000>;
+
+			mailbox12: mailbox@0 {
+				compatible = "ti,omap4-mailbox";
+				reg = <0x0 0x200>;
+				interrupts = <GIC_SPI 277 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 278 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>;
+				#mbox-cells = <1>;
+				ti,mbox-num-users = <4>;
+				ti,mbox-num-fifos = <12>;
+				status = "disabled";
+			};
 		};
 
 		target-module@80000 {			/* 0x48880000, ap 83 0e.1 */
@@ -2808,6 +3979,33 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x80000 0x20000>;
+
+			omap_dwc3_1: omap_dwc3_1@0 {
+				compatible = "ti,dwc3";
+				reg = <0x0 0x10000>;
+				interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+				utmi-mode = <2>;
+				ranges = <0 0 0x20000>;
+
+				usb1: usb@10000 {
+					compatible = "snps,dwc3";
+					reg = <0x10000 0x17000>;
+					interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>,
+						     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>,
+						     <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
+					interrupt-names = "peripheral",
+							  "host",
+							  "otg";
+					phys = <&usb2_phy1>, <&usb3_phy1>;
+					phy-names = "usb2-phy", "usb3-phy";
+					maximum-speed = "super-speed";
+					dr_mode = "otg";
+					snps,dis_u3_susphy_quirk;
+					snps,dis_u2_susphy_quirk;
+				};
+			};
 		};
 
 		target-module@c0000 {			/* 0x488c0000, ap 79 06.0 */
@@ -2831,6 +4029,34 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0xc0000 0x20000>;
+
+			omap_dwc3_2: omap_dwc3_2@0 {
+				compatible = "ti,dwc3";
+				reg = <0x0 0x10000>;
+				interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+				utmi-mode = <2>;
+				ranges = <0 0 0x20000>;
+
+				usb2: usb@10000 {
+					compatible = "snps,dwc3";
+					reg = <0x10000 0x17000>;
+					interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>,
+						     <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>,
+						     <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
+					interrupt-names = "peripheral",
+							  "host",
+							  "otg";
+					phys = <&usb2_phy2>;
+					phy-names = "usb2-phy";
+					maximum-speed = "high-speed";
+					dr_mode = "otg";
+					snps,dis_u3_susphy_quirk;
+					snps,dis_u2_susphy_quirk;
+					snps,dis_metastability_quirk;
+				};
+			};
 		};
 
 		target-module@100000 {			/* 0x48900000, ap 85 04.0 */
@@ -2854,6 +4080,32 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x100000 0x20000>;
+
+			omap_dwc3_3: omap_dwc3_3@0 {
+				compatible = "ti,dwc3";
+				reg = <0x0 0x10000>;
+				interrupts = <GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+				utmi-mode = <2>;
+				ranges = <0 0 0x20000>;
+				status = "disabled";
+
+				usb3: usb@10000 {
+					compatible = "snps,dwc3";
+					reg = <0x10000 0x17000>;
+					interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>,
+						     <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>,
+						     <GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH>;
+					interrupt-names = "peripheral",
+							  "host",
+							  "otg";
+					maximum-speed = "high-speed";
+					dr_mode = "otg";
+					snps,dis_u3_susphy_quirk;
+					snps,dis_u2_susphy_quirk;
+				};
+			};
 		};
 
 		target-module@140000 {			/* 0x48940000, ap 75 3c.0 */
@@ -2956,22 +4208,51 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x4000 0x1000>;
+
+			counter32k: counter@0 {
+				compatible = "ti,omap-counter32k";
+				reg = <0x0 0x40>;
+			};
 		};
 
 		target-module@6000 {			/* 0x4ae06000, ap 3 10.0 */
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
+				compatible = "ti,dra7-prm", "simple-bus";
+				reg = <0 0x3000>;
+				interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges = <0 0 0x3000>;
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
 
 		target-module@c000 {			/* 0x4ae0c000, ap 17 50.0 */
-			compatible = "ti,sysc";
-			status = "disabled";
+			compatible = "ti,sysc-omap4", "ti,sysc";
+			reg = <0xc000 0x4>;
+			reg-names = "rev";
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0xc000 0x1000>;
+
+			scm_wkup: scm_conf@0 {
+				compatible = "syscon";
+				reg = <0 0x1000>;
+			};
 		};
 	};
 
@@ -3010,6 +4291,16 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x0 0x1000>;
+
+			gpio1: gpio@0 {
+				compatible = "ti,omap4-gpio";
+				reg = <0x0 0x200>;
+				interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+			};
 		};
 
 		target-module@4000 {			/* 0x4ae14000, ap 7 28.0 */
@@ -3032,6 +4323,12 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x4000 0x1000>;
+
+			wdt2: wdt@0 {
+				compatible = "ti,omap3-wdt";
+				reg = <0x0 0x80>;
+				interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
+			};
 		};
 
 		target-module@8000 {			/* 0x4ae18000, ap 9 30.0 */
@@ -3052,6 +4349,15 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x8000 0x1000>;
+
+			timer1: timer@0 {
+				compatible = "ti,omap5430-timer";
+				reg = <0x0 0x80>;
+				clocks = <&wkupaon_clkctrl DRA7_WKUPAON_TIMER1_CLKCTRL 24>;
+				clock-names = "fck";
+				interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+				ti,timer-alwon;
+			};
 		};
 
 		target-module@c000 {			/* 0x4ae1c000, ap 11 38.0 */
@@ -3100,6 +4406,16 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x0 0x1000>;
+
+			timer12: timer@0 {
+				compatible = "ti,omap5430-timer";
+				reg = <0x0 0x80>;
+				clocks = <&wkupaon_clkctrl DRA7_WKUPAON_TIMER12_CLKCTRL 24>;
+				clock-names = "fck";
+				interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
+				ti,timer-alwon;
+				ti,timer-secure;
+			};
 		};
 
 		target-module@2000 {			/* 0x4ae22000, ap 21 18.0 */
@@ -3144,6 +4460,14 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0xb000 0x1000>;
+
+			uart10: serial@0 {
+				compatible = "ti,dra742-uart", "ti,omap4-uart";
+				reg = <0x0 0x100>;
+				interrupts = <GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH>;
+				clock-frequency = <48000000>;
+				status = "disabled";
+			};
 		};
 
 		target-module@f000 {			/* 0x4ae2f000, ap 32 58.0 */
@@ -3214,11 +4538,23 @@
 		};
 
 		target-module@c000 {			/* 0x4ae3c000, ap 30 04.0 */
-			compatible = "ti,sysc";
-			status = "disabled";
+			compatible = "ti,sysc-omap4", "ti,sysc";
+			reg = <0xc000 0x4>;
+			reg-names = "rev";
+			clocks = <&wkupaon_clkctrl DRA7_WKUPAON_DCAN1_CLKCTRL 0>;
+			clock-names = "fck";
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0xc000 0x2000>;
+
+			dcan1: can@0 {
+				compatible = "ti,dra7-d_can";
+				reg = <0x0 0x2000>;
+				syscon-raminit = <&scm_conf 0x558 0>;
+				interrupts = <GIC_SPI 222 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&wkupaon_clkctrl DRA7_WKUPAON_DCAN1_CLKCTRL 24>;
+				status = "disabled";
+			};
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/dra7.dtsi b/arch/arm/boot/dts/dra7.dtsi
--- a/arch/arm/boot/dts/dra7.dtsi
+++ b/arch/arm/boot/dts/dra7.dtsi
@@ -156,153 +156,15 @@
 		interrupts-extended = <&crossbar_mpu GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
 				      <&wakeupgen GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
 
-		l4_cfg: l4@4a000000 {
-			compatible = "ti,dra7-l4-cfg", "simple-bus";
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges = <0 0x4a000000 0x22c000>;
-
-			scm: scm@2000 {
-				compatible = "ti,dra7-scm-core", "simple-bus";
-				reg = <0x2000 0x2000>;
-				#address-cells = <1>;
-				#size-cells = <1>;
-				ranges = <0 0x2000 0x2000>;
-
-				scm_conf: scm_conf@0 {
-					compatible = "syscon", "simple-bus";
-					reg = <0x0 0x1400>;
-					#address-cells = <1>;
-					#size-cells = <1>;
-					ranges = <0 0x0 0x1400>;
-
-					pbias_regulator: pbias_regulator@e00 {
-						compatible = "ti,pbias-dra7", "ti,pbias-omap";
-						reg = <0xe00 0x4>;
-						syscon = <&scm_conf>;
-						pbias_mmc_reg: pbias_mmc_omap5 {
-							regulator-name = "pbias_mmc_omap5";
-							regulator-min-microvolt = <1800000>;
-							regulator-max-microvolt = <3300000>;
-						};
-					};
-
-					scm_conf_clocks: clocks {
-						#address-cells = <1>;
-						#size-cells = <0>;
-					};
-				};
-
-				dra7_pmx_core: pinmux@1400 {
-					compatible = "ti,dra7-padconf",
-						     "pinctrl-single";
-					reg = <0x1400 0x0468>;
-					#address-cells = <1>;
-					#size-cells = <0>;
-					#pinctrl-cells = <1>;
-					#interrupt-cells = <1>;
-					interrupt-controller;
-					pinctrl-single,register-width = <32>;
-					pinctrl-single,function-mask = <0x3fffffff>;
-				};
-
-				scm_conf1: scm_conf@1c04 {
-					compatible = "syscon";
-					reg = <0x1c04 0x0020>;
-					#syscon-cells = <2>;
-				};
-
-				scm_conf_pcie: scm_conf@1c24 {
-					compatible = "syscon";
-					reg = <0x1c24 0x0024>;
-				};
-
-				sdma_xbar: dma-router@b78 {
-					compatible = "ti,dra7-dma-crossbar";
-					reg = <0xb78 0xfc>;
-					#dma-cells = <1>;
-					dma-requests = <205>;
-					ti,dma-safe-map = <0>;
-					dma-masters = <&sdma>;
-				};
-
-				edma_xbar: dma-router@c78 {
-					compatible = "ti,dra7-dma-crossbar";
-					reg = <0xc78 0x7c>;
-					#dma-cells = <2>;
-					dma-requests = <204>;
-					ti,dma-safe-map = <0>;
-					dma-masters = <&edma>;
-				};
-			};
-
-			cm_core_aon: cm_core_aon@5000 {
-				compatible = "ti,dra7-cm-core-aon",
-					      "simple-bus";
-				#address-cells = <1>;
-				#size-cells = <1>;
-				reg = <0x5000 0x2000>;
-				ranges = <0 0x5000 0x2000>;
-
-				cm_core_aon_clocks: clocks {
-					#address-cells = <1>;
-					#size-cells = <0>;
-				};
-
-				cm_core_aon_clockdomains: clockdomains {
-				};
-			};
-
-			cm_core: cm_core@8000 {
-				compatible = "ti,dra7-cm-core", "simple-bus";
-				#address-cells = <1>;
-				#size-cells = <1>;
-				reg = <0x8000 0x3000>;
-				ranges = <0 0x8000 0x3000>;
-
-				cm_core_clocks: clocks {
-					#address-cells = <1>;
-					#size-cells = <0>;
-				};
-
-				cm_core_clockdomains: clockdomains {
-				};
-			};
+		l4_cfg: interconnect@4a000000 {
 		};
-
-		l4_wkup: l4@4ae00000 {
-			compatible = "ti,dra7-l4-wkup", "simple-bus";
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges = <0 0x4ae00000 0x3f000>;
-
-			counter32k: counter@4000 {
-				compatible = "ti,omap-counter32k";
-				reg = <0x4000 0x40>;
-				ti,hwmods = "counter_32k";
-			};
-
-			prm: prm@6000 {
-				compatible = "ti,dra7-prm", "simple-bus";
-				reg = <0x6000 0x3000>;
-				interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
-				#address-cells = <1>;
-				#size-cells = <1>;
-				ranges = <0 0x6000 0x3000>;
-
-				prm_clocks: clocks {
-					#address-cells = <1>;
-					#size-cells = <0>;
-				};
-
-				prm_clockdomains: clockdomains {
-				};
-			};
-
-			scm_wkup: scm_conf@c000 {
-				compatible = "syscon";
-				reg = <0xc000 0x1000>;
-			};
+		l4_wkup: interconnect@4ae00000 {
+		};
+		l4_per1: interconnect@48000000 {
+		};
+		l4_per2: interconnect@48400000 {
+		};
+		l4_per3: interconnect@48800000 {
 		};
 
 		axi@0 {
@@ -467,19 +329,6 @@
 			#pinctrl-cells = <2>;
 		};
 
-		sdma: dma-controller@4a056000 {
-			compatible = "ti,omap4430-sdma";
-			reg = <0x4a056000 0x1000>;
-			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
-			#dma-cells = <1>;
-			dma-channels = <32>;
-			dma-requests = <127>;
-			ti,hwmods = "dma_system";
-		};
-
 		edma: edma@43300000 {
 			compatible = "ti,edma3-tpcc";
 			ti,hwmods = "tpcc";
@@ -519,508 +368,6 @@
 			interrupt-names = "edma3_tcerrint";
 		};
 
-		gpio1: gpio@4ae10000 {
-			compatible = "ti,omap4-gpio";
-			reg = <0x4ae10000 0x200>;
-			interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "gpio1";
-			gpio-controller;
-			#gpio-cells = <2>;
-			interrupt-controller;
-			#interrupt-cells = <2>;
-		};
-
-		gpio2: gpio@48055000 {
-			compatible = "ti,omap4-gpio";
-			reg = <0x48055000 0x200>;
-			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
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
-			interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
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
-			interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
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
-			interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
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
-			interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "gpio6";
-			gpio-controller;
-			#gpio-cells = <2>;
-			interrupt-controller;
-			#interrupt-cells = <2>;
-		};
-
-		gpio7: gpio@48051000 {
-			compatible = "ti,omap4-gpio";
-			reg = <0x48051000 0x200>;
-			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "gpio7";
-			gpio-controller;
-			#gpio-cells = <2>;
-			interrupt-controller;
-			#interrupt-cells = <2>;
-		};
-
-		gpio8: gpio@48053000 {
-			compatible = "ti,omap4-gpio";
-			reg = <0x48053000 0x200>;
-			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "gpio8";
-			gpio-controller;
-			#gpio-cells = <2>;
-			interrupt-controller;
-			#interrupt-cells = <2>;
-		};
-
-		uart1: serial@4806a000 {
-			compatible = "ti,dra742-uart", "ti,omap4-uart";
-			reg = <0x4806a000 0x100>;
-			interrupts-extended = <&crossbar_mpu GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "uart1";
-			clock-frequency = <48000000>;
-			status = "disabled";
-			dmas = <&sdma_xbar 49>, <&sdma_xbar 50>;
-			dma-names = "tx", "rx";
-		};
-
-		uart2: serial@4806c000 {
-			compatible = "ti,dra742-uart", "ti,omap4-uart";
-			reg = <0x4806c000 0x100>;
-			interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "uart2";
-			clock-frequency = <48000000>;
-			status = "disabled";
-			dmas = <&sdma_xbar 51>, <&sdma_xbar 52>;
-			dma-names = "tx", "rx";
-		};
-
-		uart3: serial@48020000 {
-			compatible = "ti,dra742-uart", "ti,omap4-uart";
-			reg = <0x48020000 0x100>;
-			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "uart3";
-			clock-frequency = <48000000>;
-			status = "disabled";
-			dmas = <&sdma_xbar 53>, <&sdma_xbar 54>;
-			dma-names = "tx", "rx";
-		};
-
-		uart4: serial@4806e000 {
-			compatible = "ti,dra742-uart", "ti,omap4-uart";
-			reg = <0x4806e000 0x100>;
-			interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "uart4";
-			clock-frequency = <48000000>;
-                        status = "disabled";
-			dmas = <&sdma_xbar 55>, <&sdma_xbar 56>;
-			dma-names = "tx", "rx";
-		};
-
-		uart5: serial@48066000 {
-			compatible = "ti,dra742-uart", "ti,omap4-uart";
-			reg = <0x48066000 0x100>;
-			interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "uart5";
-			clock-frequency = <48000000>;
-			status = "disabled";
-			dmas = <&sdma_xbar 63>, <&sdma_xbar 64>;
-			dma-names = "tx", "rx";
-		};
-
-		uart6: serial@48068000 {
-			compatible = "ti,dra742-uart", "ti,omap4-uart";
-			reg = <0x48068000 0x100>;
-			interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "uart6";
-			clock-frequency = <48000000>;
-			status = "disabled";
-			dmas = <&sdma_xbar 79>, <&sdma_xbar 80>;
-			dma-names = "tx", "rx";
-		};
-
-		uart7: serial@48420000 {
-			compatible = "ti,dra742-uart", "ti,omap4-uart";
-			reg = <0x48420000 0x100>;
-			interrupts = <GIC_SPI 218 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "uart7";
-			clock-frequency = <48000000>;
-			status = "disabled";
-		};
-
-		uart8: serial@48422000 {
-			compatible = "ti,dra742-uart", "ti,omap4-uart";
-			reg = <0x48422000 0x100>;
-			interrupts = <GIC_SPI 219 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "uart8";
-			clock-frequency = <48000000>;
-			status = "disabled";
-		};
-
-		uart9: serial@48424000 {
-			compatible = "ti,dra742-uart", "ti,omap4-uart";
-			reg = <0x48424000 0x100>;
-			interrupts = <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "uart9";
-			clock-frequency = <48000000>;
-			status = "disabled";
-		};
-
-		uart10: serial@4ae2b000 {
-			compatible = "ti,dra742-uart", "ti,omap4-uart";
-			reg = <0x4ae2b000 0x100>;
-			interrupts = <GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "uart10";
-			clock-frequency = <48000000>;
-			status = "disabled";
-		};
-
-		mailbox1: mailbox@4a0f4000 {
-			compatible = "ti,omap4-mailbox";
-			reg = <0x4a0f4000 0x200>;
-			interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "mailbox1";
-			#mbox-cells = <1>;
-			ti,mbox-num-users = <3>;
-			ti,mbox-num-fifos = <8>;
-			status = "disabled";
-		};
-
-		mailbox2: mailbox@4883a000 {
-			compatible = "ti,omap4-mailbox";
-			reg = <0x4883a000 0x200>;
-			interrupts = <GIC_SPI 237 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 238 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "mailbox2";
-			#mbox-cells = <1>;
-			ti,mbox-num-users = <4>;
-			ti,mbox-num-fifos = <12>;
-			status = "disabled";
-		};
-
-		mailbox3: mailbox@4883c000 {
-			compatible = "ti,omap4-mailbox";
-			reg = <0x4883c000 0x200>;
-			interrupts = <GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 242 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "mailbox3";
-			#mbox-cells = <1>;
-			ti,mbox-num-users = <4>;
-			ti,mbox-num-fifos = <12>;
-			status = "disabled";
-		};
-
-		mailbox4: mailbox@4883e000 {
-			compatible = "ti,omap4-mailbox";
-			reg = <0x4883e000 0x200>;
-			interrupts = <GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "mailbox4";
-			#mbox-cells = <1>;
-			ti,mbox-num-users = <4>;
-			ti,mbox-num-fifos = <12>;
-			status = "disabled";
-		};
-
-		mailbox5: mailbox@48840000 {
-			compatible = "ti,omap4-mailbox";
-			reg = <0x48840000 0x200>;
-			interrupts = <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "mailbox5";
-			#mbox-cells = <1>;
-			ti,mbox-num-users = <4>;
-			ti,mbox-num-fifos = <12>;
-			status = "disabled";
-		};
-
-		mailbox6: mailbox@48842000 {
-			compatible = "ti,omap4-mailbox";
-			reg = <0x48842000 0x200>;
-			interrupts = <GIC_SPI 253 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "mailbox6";
-			#mbox-cells = <1>;
-			ti,mbox-num-users = <4>;
-			ti,mbox-num-fifos = <12>;
-			status = "disabled";
-		};
-
-		mailbox7: mailbox@48844000 {
-			compatible = "ti,omap4-mailbox";
-			reg = <0x48844000 0x200>;
-			interrupts = <GIC_SPI 257 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 258 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 259 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 260 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "mailbox7";
-			#mbox-cells = <1>;
-			ti,mbox-num-users = <4>;
-			ti,mbox-num-fifos = <12>;
-			status = "disabled";
-		};
-
-		mailbox8: mailbox@48846000 {
-			compatible = "ti,omap4-mailbox";
-			reg = <0x48846000 0x200>;
-			interrupts = <GIC_SPI 261 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 262 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 263 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 264 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "mailbox8";
-			#mbox-cells = <1>;
-			ti,mbox-num-users = <4>;
-			ti,mbox-num-fifos = <12>;
-			status = "disabled";
-		};
-
-		mailbox9: mailbox@4885e000 {
-			compatible = "ti,omap4-mailbox";
-			reg = <0x4885e000 0x200>;
-			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "mailbox9";
-			#mbox-cells = <1>;
-			ti,mbox-num-users = <4>;
-			ti,mbox-num-fifos = <12>;
-			status = "disabled";
-		};
-
-		mailbox10: mailbox@48860000 {
-			compatible = "ti,omap4-mailbox";
-			reg = <0x48860000 0x200>;
-			interrupts = <GIC_SPI 269 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 270 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 271 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "mailbox10";
-			#mbox-cells = <1>;
-			ti,mbox-num-users = <4>;
-			ti,mbox-num-fifos = <12>;
-			status = "disabled";
-		};
-
-		mailbox11: mailbox@48862000 {
-			compatible = "ti,omap4-mailbox";
-			reg = <0x48862000 0x200>;
-			interrupts = <GIC_SPI 273 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 274 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 275 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 276 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "mailbox11";
-			#mbox-cells = <1>;
-			ti,mbox-num-users = <4>;
-			ti,mbox-num-fifos = <12>;
-			status = "disabled";
-		};
-
-		mailbox12: mailbox@48864000 {
-			compatible = "ti,omap4-mailbox";
-			reg = <0x48864000 0x200>;
-			interrupts = <GIC_SPI 277 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 278 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "mailbox12";
-			#mbox-cells = <1>;
-			ti,mbox-num-users = <4>;
-			ti,mbox-num-fifos = <12>;
-			status = "disabled";
-		};
-
-		mailbox13: mailbox@48802000 {
-			compatible = "ti,omap4-mailbox";
-			reg = <0x48802000 0x200>;
-			interrupts = <GIC_SPI 379 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 380 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 381 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 382 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "mailbox13";
-			#mbox-cells = <1>;
-			ti,mbox-num-users = <4>;
-			ti,mbox-num-fifos = <12>;
-			status = "disabled";
-		};
-
-		timer1: timer@4ae18000 {
-			compatible = "ti,omap5430-timer";
-			reg = <0x4ae18000 0x80>;
-			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "timer1";
-			ti,timer-alwon;
-			clock-names = "fck";
-			clocks = <&wkupaon_clkctrl DRA7_WKUPAON_TIMER1_CLKCTRL 24>;
-		};
-
-		timer2: timer@48032000 {
-			compatible = "ti,omap5430-timer";
-			reg = <0x48032000 0x80>;
-			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "timer2";
-		};
-
-		timer3: timer@48034000 {
-			compatible = "ti,omap5430-timer";
-			reg = <0x48034000 0x80>;
-			interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "timer3";
-		};
-
-		timer4: timer@48036000 {
-			compatible = "ti,omap5430-timer";
-			reg = <0x48036000 0x80>;
-			interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "timer4";
-		};
-
-		timer5: timer@48820000 {
-			compatible = "ti,omap5430-timer";
-			reg = <0x48820000 0x80>;
-			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "timer5";
-		};
-
-		timer6: timer@48822000 {
-			compatible = "ti,omap5430-timer";
-			reg = <0x48822000 0x80>;
-			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "timer6";
-		};
-
-		timer7: timer@48824000 {
-			compatible = "ti,omap5430-timer";
-			reg = <0x48824000 0x80>;
-			interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "timer7";
-		};
-
-		timer8: timer@48826000 {
-			compatible = "ti,omap5430-timer";
-			reg = <0x48826000 0x80>;
-			interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "timer8";
-		};
-
-		timer9: timer@4803e000 {
-			compatible = "ti,omap5430-timer";
-			reg = <0x4803e000 0x80>;
-			interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "timer9";
-		};
-
-		timer10: timer@48086000 {
-			compatible = "ti,omap5430-timer";
-			reg = <0x48086000 0x80>;
-			interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "timer10";
-		};
-
-		timer11: timer@48088000 {
-			compatible = "ti,omap5430-timer";
-			reg = <0x48088000 0x80>;
-			interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "timer11";
-		};
-
-		timer12: timer@4ae20000 {
-			compatible = "ti,omap5430-timer";
-			reg = <0x4ae20000 0x80>;
-			interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "timer12";
-			ti,timer-alwon;
-			ti,timer-secure;
-		};
-
-		timer13: timer@48828000 {
-			compatible = "ti,omap5430-timer";
-			reg = <0x48828000 0x80>;
-			interrupts = <GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "timer13";
-		};
-
-		timer14: timer@4882a000 {
-			compatible = "ti,omap5430-timer";
-			reg = <0x4882a000 0x80>;
-			interrupts = <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "timer14";
-		};
-
-		timer15: timer@4882c000 {
-			compatible = "ti,omap5430-timer";
-			reg = <0x4882c000 0x80>;
-			interrupts = <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "timer15";
-		};
-
-		timer16: timer@4882e000 {
-			compatible = "ti,omap5430-timer";
-			reg = <0x4882e000 0x80>;
-			interrupts = <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "timer16";
-		};
-
-		wdt2: wdt@4ae14000 {
-			compatible = "ti,omap3-wdt";
-			reg = <0x4ae14000 0x80>;
-			interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "wd_timer2";
-		};
-
-		hwspinlock: spinlock@4a0f6000 {
-			compatible = "ti,omap4-hwspinlock";
-			reg = <0x4a0f6000 0x1000>;
-			ti,hwmods = "spinlock";
-			#hwlock-cells = <1>;
-		};
-
 		dmm@4e000000 {
 			compatible = "ti,omap5-dmm";
 			reg = <0x4e000000 0x800>;
@@ -1028,112 +375,6 @@
 			ti,hwmods = "dmm";
 		};
 
-		i2c1: i2c@48070000 {
-			compatible = "ti,omap4-i2c";
-			reg = <0x48070000 0x100>;
-			interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			ti,hwmods = "i2c1";
-			status = "disabled";
-		};
-
-		i2c2: i2c@48072000 {
-			compatible = "ti,omap4-i2c";
-			reg = <0x48072000 0x100>;
-			interrupts = <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			ti,hwmods = "i2c2";
-			status = "disabled";
-		};
-
-		i2c3: i2c@48060000 {
-			compatible = "ti,omap4-i2c";
-			reg = <0x48060000 0x100>;
-			interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			ti,hwmods = "i2c3";
-			status = "disabled";
-		};
-
-		i2c4: i2c@4807a000 {
-			compatible = "ti,omap4-i2c";
-			reg = <0x4807a000 0x100>;
-			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			ti,hwmods = "i2c4";
-			status = "disabled";
-		};
-
-		i2c5: i2c@4807c000 {
-			compatible = "ti,omap4-i2c";
-			reg = <0x4807c000 0x100>;
-			interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			ti,hwmods = "i2c5";
-			status = "disabled";
-		};
-
-		mmc1: mmc@4809c000 {
-			compatible = "ti,dra7-sdhci";
-			reg = <0x4809c000 0x400>;
-			interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "mmc1";
-			status = "disabled";
-			pbias-supply = <&pbias_mmc_reg>;
-			max-frequency = <192000000>;
-			mmc-ddr-1_8v;
-			mmc-ddr-3_3v;
-		};
-
-		hdqw1w: 1w@480b2000 {
-			compatible = "ti,omap3-1w";
-			reg = <0x480b2000 0x1000>;
-			interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "hdq1w";
-		};
-
-		mmc2: mmc@480b4000 {
-			compatible = "ti,dra7-sdhci";
-			reg = <0x480b4000 0x400>;
-			interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "mmc2";
-			status = "disabled";
-			max-frequency = <192000000>;
-			/* SDR104/DDR50/SDR50 bits in CAPA2 is not supported */
-			sdhci-caps-mask = <0x7 0x0>;
-			mmc-hs200-1_8v;
-			mmc-ddr-1_8v;
-			mmc-ddr-3_3v;
-		};
-
-		mmc3: mmc@480ad000 {
-			compatible = "ti,dra7-sdhci";
-			reg = <0x480ad000 0x400>;
-			interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "mmc3";
-			status = "disabled";
-			/* Errata i887 limits max-frequency of MMC3 to 64 MHz */
-			max-frequency = <64000000>;
-			/* SDMA is not supported */
-			sdhci-caps-mask = <0x0 0x400000>;
-		};
-
-		mmc4: mmc@480d1000 {
-			compatible = "ti,dra7-sdhci";
-			reg = <0x480d1000 0x400>;
-			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "mmc4";
-			status = "disabled";
-			max-frequency = <192000000>;
-			/* SDMA is not supported */
-			sdhci-caps-mask = <0x0 0x400000>;
-		};
-
 		mmu0_dsp1: mmu@40d01000 {
 			compatible = "ti,dra7-dsp-iommu";
 			reg = <0x40d01000 0x100>;
@@ -1306,69 +547,6 @@
 			>;
 		};
 
-		mcspi1: spi@48098000 {
-			compatible = "ti,omap4-mcspi";
-			reg = <0x48098000 0x200>;
-			interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			ti,hwmods = "mcspi1";
-			ti,spi-num-cs = <4>;
-			dmas = <&sdma_xbar 35>,
-			       <&sdma_xbar 36>,
-			       <&sdma_xbar 37>,
-			       <&sdma_xbar 38>,
-			       <&sdma_xbar 39>,
-			       <&sdma_xbar 40>,
-			       <&sdma_xbar 41>,
-			       <&sdma_xbar 42>;
-			dma-names = "tx0", "rx0", "tx1", "rx1",
-				    "tx2", "rx2", "tx3", "rx3";
-			status = "disabled";
-		};
-
-		mcspi2: spi@4809a000 {
-			compatible = "ti,omap4-mcspi";
-			reg = <0x4809a000 0x200>;
-			interrupts = <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			ti,hwmods = "mcspi2";
-			ti,spi-num-cs = <2>;
-			dmas = <&sdma_xbar 43>,
-			       <&sdma_xbar 44>,
-			       <&sdma_xbar 45>,
-			       <&sdma_xbar 46>;
-			dma-names = "tx0", "rx0", "tx1", "rx1";
-			status = "disabled";
-		};
-
-		mcspi3: spi@480b8000 {
-			compatible = "ti,omap4-mcspi";
-			reg = <0x480b8000 0x200>;
-			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			ti,hwmods = "mcspi3";
-			ti,spi-num-cs = <2>;
-			dmas = <&sdma_xbar 15>, <&sdma_xbar 16>;
-			dma-names = "tx0", "rx0";
-			status = "disabled";
-		};
-
-		mcspi4: spi@480ba000 {
-			compatible = "ti,omap4-mcspi";
-			reg = <0x480ba000 0x200>;
-			interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			ti,hwmods = "mcspi4";
-			ti,spi-num-cs = <1>;
-			dmas = <&sdma_xbar 70>, <&sdma_xbar 71>;
-			dma-names = "tx0", "rx0";
-			status = "disabled";
-		};
-
 		qspi: spi@4b300000 {
 			compatible = "ti,dra7xxx-qspi";
 			reg = <0x4b300000 0x100>,
@@ -1386,69 +564,6 @@
 		};
 
 		/* OCP2SCP3 */
-		ocp2scp@4a090000 {
-			compatible = "ti,omap-ocp2scp";
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges;
-			reg = <0x4a090000 0x20>;
-			ti,hwmods = "ocp2scp3";
-			sata_phy: phy@4a096000 {
-				compatible = "ti,phy-pipe3-sata";
-				reg = <0x4A096000 0x80>, /* phy_rx */
-				      <0x4A096400 0x64>, /* phy_tx */
-				      <0x4A096800 0x40>; /* pll_ctrl */
-				reg-names = "phy_rx", "phy_tx", "pll_ctrl";
-				syscon-phy-power = <&scm_conf 0x374>;
-				clocks = <&sys_clkin1>,
-					 <&l3init_clkctrl DRA7_L3INIT_SATA_CLKCTRL 8>;
-				clock-names = "sysclk", "refclk";
-				syscon-pllreset = <&scm_conf 0x3fc>;
-				#phy-cells = <0>;
-			};
-
-			pcie1_phy: pciephy@4a094000 {
-				compatible = "ti,phy-pipe3-pcie";
-				reg = <0x4a094000 0x80>, /* phy_rx */
-				      <0x4a094400 0x64>; /* phy_tx */
-				reg-names = "phy_rx", "phy_tx";
-				syscon-phy-power = <&scm_conf_pcie 0x1c>;
-				syscon-pcs = <&scm_conf_pcie 0x10>;
-				clocks = <&dpll_pcie_ref_ck>,
-					 <&dpll_pcie_ref_m2ldo_ck>,
-					 <&pcie_clkctrl DRA7_PCIE_PCIE1_CLKCTRL 8>,
-					 <&pcie_clkctrl DRA7_PCIE_PCIE1_CLKCTRL 9>,
-					 <&pcie_clkctrl DRA7_PCIE_PCIE1_CLKCTRL 10>,
-					 <&optfclk_pciephy_div>,
-					 <&sys_clkin1>;
-				clock-names = "dpll_ref", "dpll_ref_m2",
-					      "wkupclk", "refclk",
-					      "div-clk", "phy-div", "sysclk";
-				#phy-cells = <0>;
-			};
-
-			pcie2_phy: pciephy@4a095000 {
-				compatible = "ti,phy-pipe3-pcie";
-				reg = <0x4a095000 0x80>, /* phy_rx */
-				      <0x4a095400 0x64>; /* phy_tx */
-				reg-names = "phy_rx", "phy_tx";
-				syscon-phy-power = <&scm_conf_pcie 0x20>;
-				syscon-pcs = <&scm_conf_pcie 0x10>;
-				clocks = <&dpll_pcie_ref_ck>,
-					 <&dpll_pcie_ref_m2ldo_ck>,
-					 <&pcie_clkctrl DRA7_PCIE_PCIE2_CLKCTRL 8>,
-					 <&pcie_clkctrl DRA7_PCIE_PCIE2_CLKCTRL 9>,
-					 <&pcie_clkctrl DRA7_PCIE_PCIE2_CLKCTRL 10>,
-					 <&optfclk_pciephy_div>,
-					 <&sys_clkin1>;
-				clock-names = "dpll_ref", "dpll_ref_m2",
-					      "wkupclk", "refclk",
-					      "div-clk", "phy-div", "sysclk";
-				#phy-cells = <0>;
-				status = "disabled";
-			};
-		};
-
 		sata: sata@4a141100 {
 			compatible = "snps,dwc-ahci";
 			reg = <0x4a140000 0x1100>, <0x4a141100 0x7>;
@@ -1460,192 +575,8 @@
 			ports-implemented = <0x1>;
 		};
 
-		rtc: rtc@48838000 {
-			compatible = "ti,am3352-rtc";
-			reg = <0x48838000 0x100>;
-			interrupts = <GIC_SPI 217 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 217 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "rtcss";
-			clocks = <&sys_32k_ck>;
-		};
-
 		/* OCP2SCP1 */
-		ocp2scp@4a080000 {
-			compatible = "ti,omap-ocp2scp";
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges;
-			reg = <0x4a080000 0x20>;
-			ti,hwmods = "ocp2scp1";
-
-			usb2_phy1: phy@4a084000 {
-				compatible = "ti,dra7x-usb2", "ti,omap-usb2";
-				reg = <0x4a084000 0x400>;
-				syscon-phy-power = <&scm_conf 0x300>;
-				clocks = <&usb_phy1_always_on_clk32k>,
-					 <&l3init_clkctrl DRA7_L3INIT_USB_OTG_SS1_CLKCTRL 8>;
-				clock-names =	"wkupclk",
-						"refclk";
-				#phy-cells = <0>;
-			};
-
-			usb2_phy2: phy@4a085000 {
-				compatible = "ti,dra7x-usb2-phy2",
-					     "ti,omap-usb2";
-				reg = <0x4a085000 0x400>;
-				syscon-phy-power = <&scm_conf 0xe74>;
-				clocks = <&usb_phy2_always_on_clk32k>,
-					 <&l3init_clkctrl DRA7_L3INIT_USB_OTG_SS2_CLKCTRL 8>;
-				clock-names =	"wkupclk",
-						"refclk";
-				#phy-cells = <0>;
-			};
-
-			usb3_phy1: phy@4a084400 {
-				compatible = "ti,omap-usb3";
-				reg = <0x4a084400 0x80>,
-				      <0x4a084800 0x64>,
-				      <0x4a084c00 0x40>;
-				reg-names = "phy_rx", "phy_tx", "pll_ctrl";
-				syscon-phy-power = <&scm_conf 0x370>;
-				clocks = <&usb_phy3_always_on_clk32k>,
-					 <&sys_clkin1>,
-					 <&l3init_clkctrl DRA7_L3INIT_USB_OTG_SS1_CLKCTRL 8>;
-				clock-names =	"wkupclk",
-						"sysclk",
-						"refclk";
-				#phy-cells = <0>;
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
-			clocks = <&coreaon_clkctrl DRA7_COREAON_SMARTREFLEX_CORE_CLKCTRL 0>;
-			clock-names = "fck";
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges = <0 0x4a0dd000 0x001000>;
-
-			/* SmartReflex child device marked reserved in TRM */
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
-			clocks = <&coreaon_clkctrl DRA7_COREAON_SMARTREFLEX_MPU_CLKCTRL 0>;
-			clock-names = "fck";
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges = <0 0x4a0d9000 0x001000>;
-
-			/* SmartReflex child device marked reserved in TRM */
-		};
-
-		omap_dwc3_1: omap_dwc3_1@48880000 {
-			compatible = "ti,dwc3";
-			ti,hwmods = "usb_otg_ss1";
-			reg = <0x48880000 0x10000>;
-			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
-			#address-cells = <1>;
-			#size-cells = <1>;
-			utmi-mode = <2>;
-			ranges;
-			usb1: usb@48890000 {
-				compatible = "snps,dwc3";
-				reg = <0x48890000 0x17000>;
-				interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
-				interrupt-names = "peripheral",
-						  "host",
-						  "otg";
-				phys = <&usb2_phy1>, <&usb3_phy1>;
-				phy-names = "usb2-phy", "usb3-phy";
-				maximum-speed = "super-speed";
-				dr_mode = "otg";
-				snps,dis_u3_susphy_quirk;
-				snps,dis_u2_susphy_quirk;
-			};
-		};
-
-		omap_dwc3_2: omap_dwc3_2@488c0000 {
-			compatible = "ti,dwc3";
-			ti,hwmods = "usb_otg_ss2";
-			reg = <0x488c0000 0x10000>;
-			interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
-			#address-cells = <1>;
-			#size-cells = <1>;
-			utmi-mode = <2>;
-			ranges;
-			usb2: usb@488d0000 {
-				compatible = "snps,dwc3";
-				reg = <0x488d0000 0x17000>;
-				interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
-				interrupt-names = "peripheral",
-						  "host",
-						  "otg";
-				phys = <&usb2_phy2>;
-				phy-names = "usb2-phy";
-				maximum-speed = "high-speed";
-				dr_mode = "otg";
-				snps,dis_u3_susphy_quirk;
-				snps,dis_u2_susphy_quirk;
-				snps,dis_metastability_quirk;
-			};
-		};
-
 		/* IRQ for DWC3_3 and DWC3_4 need IRQ crossbar */
-		omap_dwc3_3: omap_dwc3_3@48900000 {
-			compatible = "ti,dwc3";
-			ti,hwmods = "usb_otg_ss3";
-			reg = <0x48900000 0x10000>;
-			interrupts = <GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH>;
-			#address-cells = <1>;
-			#size-cells = <1>;
-			utmi-mode = <2>;
-			ranges;
-			status = "disabled";
-			usb3: usb@48910000 {
-				compatible = "snps,dwc3";
-				reg = <0x48910000 0x17000>;
-				interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH>;
-				interrupt-names = "peripheral",
-						  "host",
-						  "otg";
-				maximum-speed = "high-speed";
-				dr_mode = "otg";
-				snps,dis_u3_susphy_quirk;
-				snps,dis_u2_susphy_quirk;
-			};
-		};
-
-		elm: elm@48078000 {
-			compatible = "ti,am3352-elm";
-			reg = <0x48078000 0xfc0>;      /* device IO registers */
-			interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "elm";
-			status = "disabled";
-		};
-
 		gpmc: gpmc@50000000 {
 			compatible = "ti,am3352-gpmc";
 			ti,hwmods = "gpmc";
@@ -1664,154 +595,6 @@
 			status = "disabled";
 		};
 
-		atl: atl@4843c000 {
-			compatible = "ti,dra7-atl";
-			reg = <0x4843c000 0x3ff>;
-			ti,hwmods = "atl";
-			ti,provided-clocks = <&atl_clkin0_ck>, <&atl_clkin1_ck>,
-					     <&atl_clkin2_ck>, <&atl_clkin3_ck>;
-			clocks = <&atl_clkctrl DRA7_ATL_ATL_CLKCTRL 26>;
-			clock-names = "fck";
-			status = "disabled";
-		};
-
-		mcasp1: mcasp@48460000 {
-			compatible = "ti,dra7-mcasp-audio";
-			ti,hwmods = "mcasp1";
-			reg = <0x48460000 0x2000>,
-			      <0x45800000 0x1000>;
-			reg-names = "mpu","dat";
-			interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "tx", "rx";
-			dmas = <&edma_xbar 129 1>, <&edma_xbar 128 1>;
-			dma-names = "tx", "rx";
-			clocks = <&ipu_clkctrl DRA7_IPU_MCASP1_CLKCTRL 22>, <&ipu_clkctrl DRA7_IPU_MCASP1_CLKCTRL 24>,
-				 <&ipu_clkctrl DRA7_IPU_MCASP1_CLKCTRL 28>;
-			clock-names = "fck", "ahclkx", "ahclkr";
-			status = "disabled";
-		};
-
-		mcasp2: mcasp@48464000 {
-			compatible = "ti,dra7-mcasp-audio";
-			ti,hwmods = "mcasp2";
-			reg = <0x48464000 0x2000>,
-			      <0x45c00000 0x1000>;
-			reg-names = "mpu","dat";
-			interrupts = <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "tx", "rx";
-			dmas = <&edma_xbar 131 1>, <&edma_xbar 130 1>;
-			dma-names = "tx", "rx";
-			clocks = <&l4per2_clkctrl DRA7_L4PER2_MCASP2_CLKCTRL 22>,
-				 <&l4per2_clkctrl DRA7_L4PER2_MCASP2_CLKCTRL 24>,
-				 <&l4per2_clkctrl DRA7_L4PER2_MCASP2_CLKCTRL 28>;
-			clock-names = "fck", "ahclkx", "ahclkr";
-			status = "disabled";
-		};
-
-		mcasp3: mcasp@48468000 {
-			compatible = "ti,dra7-mcasp-audio";
-			ti,hwmods = "mcasp3";
-			reg = <0x48468000 0x2000>,
-			      <0x46000000 0x1000>;
-			reg-names = "mpu","dat";
-			interrupts = <GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "tx", "rx";
-			dmas = <&edma_xbar 133 1>, <&edma_xbar 132 1>;
-			dma-names = "tx", "rx";
-			clocks = <&l4per2_clkctrl DRA7_L4PER2_MCASP3_CLKCTRL 22>,
-				 <&l4per2_clkctrl DRA7_L4PER2_MCASP3_CLKCTRL 24>;
-			clock-names = "fck", "ahclkx";
-			status = "disabled";
-		};
-
-		mcasp4: mcasp@4846c000 {
-			compatible = "ti,dra7-mcasp-audio";
-			ti,hwmods = "mcasp4";
-			reg = <0x4846c000 0x2000>,
-			      <0x48436000 0x1000>;
-			reg-names = "mpu","dat";
-			interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "tx", "rx";
-			dmas = <&edma_xbar 135 1>, <&edma_xbar 134 1>;
-			dma-names = "tx", "rx";
-			clocks = <&l4per2_clkctrl DRA7_L4PER2_MCASP4_CLKCTRL 22>,
-				 <&l4per2_clkctrl DRA7_L4PER2_MCASP4_CLKCTRL 24>;
-			clock-names = "fck", "ahclkx";
-			status = "disabled";
-		};
-
-		mcasp5: mcasp@48470000 {
-			compatible = "ti,dra7-mcasp-audio";
-			ti,hwmods = "mcasp5";
-			reg = <0x48470000 0x2000>,
-			      <0x4843a000 0x1000>;
-			reg-names = "mpu","dat";
-			interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "tx", "rx";
-			dmas = <&edma_xbar 137 1>, <&edma_xbar 136 1>;
-			dma-names = "tx", "rx";
-			clocks = <&l4per2_clkctrl DRA7_L4PER2_MCASP5_CLKCTRL 22>,
-				 <&l4per2_clkctrl DRA7_L4PER2_MCASP5_CLKCTRL 24>;
-			clock-names = "fck", "ahclkx";
-			status = "disabled";
-		};
-
-		mcasp6: mcasp@48474000 {
-			compatible = "ti,dra7-mcasp-audio";
-			ti,hwmods = "mcasp6";
-			reg = <0x48474000 0x2000>,
-			      <0x4844c000 0x1000>;
-			reg-names = "mpu","dat";
-			interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "tx", "rx";
-			dmas = <&edma_xbar 139 1>, <&edma_xbar 138 1>;
-			dma-names = "tx", "rx";
-			clocks = <&l4per2_clkctrl DRA7_L4PER2_MCASP6_CLKCTRL 22>,
-				 <&l4per2_clkctrl DRA7_L4PER2_MCASP6_CLKCTRL 24>;
-			clock-names = "fck", "ahclkx";
-			status = "disabled";
-		};
-
-		mcasp7: mcasp@48478000 {
-			compatible = "ti,dra7-mcasp-audio";
-			ti,hwmods = "mcasp7";
-			reg = <0x48478000 0x2000>,
-			      <0x48450000 0x1000>;
-			reg-names = "mpu","dat";
-			interrupts = <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "tx", "rx";
-			dmas = <&edma_xbar 141 1>, <&edma_xbar 140 1>;
-			dma-names = "tx", "rx";
-			clocks = <&l4per2_clkctrl DRA7_L4PER2_MCASP7_CLKCTRL 22>,
-				 <&l4per2_clkctrl DRA7_L4PER2_MCASP7_CLKCTRL 24>;
-			clock-names = "fck", "ahclkx";
-			status = "disabled";
-		};
-
-		mcasp8: mcasp@4847c000 {
-			compatible = "ti,dra7-mcasp-audio";
-			ti,hwmods = "mcasp8";
-			reg = <0x4847c000 0x2000>,
-			      <0x48454000 0x1000>;
-			reg-names = "mpu","dat";
-			interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "tx", "rx";
-			dmas = <&edma_xbar 143 1>, <&edma_xbar 142 1>;
-			dma-names = "tx", "rx";
-			clocks = <&l4per2_clkctrl DRA7_L4PER2_MCASP8_CLKCTRL 22>,
-				 <&l4per2_clkctrl DRA7_L4PER2_MCASP8_CLKCTRL 24>;
-			clock-names = "fck", "ahclkx";
-			status = "disabled";
-		};
-
 		crossbar_mpu: crossbar@4a002a48 {
 			compatible = "ti,irq-crossbar";
 			reg = <0x4a002a48 0x130>;
@@ -1826,93 +609,6 @@
 			ti,irqs-safe-map = <0>;
 		};
 
-		mac: ethernet@48484000 {
-			compatible = "ti,dra7-cpsw","ti,cpsw";
-			ti,hwmods = "gmac";
-			clocks = <&gmac_main_clk>, <&gmac_clkctrl DRA7_GMAC_GMAC_CLKCTRL 25>;
-			clock-names = "fck", "cpts";
-			cpdma_channels = <8>;
-			ale_entries = <1024>;
-			bd_ram_size = <0x2000>;
-			mac_control = <0x20>;
-			slaves = <2>;
-			active_slave = <0>;
-			cpts_clock_mult = <0x784CFE14>;
-			cpts_clock_shift = <29>;
-			reg = <0x48484000 0x1000
-			       0x48485200 0x2E00>;
-			#address-cells = <1>;
-			#size-cells = <1>;
-
-			/*
-			 * Do not allow gating of cpsw clock as workaround
-			 * for errata i877. Keeping internal clock disabled
-			 * causes the device switching characteristics
-			 * to degrade over time and eventually fail to meet
-			 * the data manual delay time/skew specs.
-			 */
-			ti,no-idle;
-
-			/*
-			 * rx_thresh_pend
-			 * rx_pend
-			 * tx_pend
-			 * misc_pend
-			 */
-			interrupts = <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH>;
-			ranges;
-			syscon = <&scm_conf>;
-			status = "disabled";
-
-			davinci_mdio: mdio@48485000 {
-				compatible = "ti,cpsw-mdio","ti,davinci_mdio";
-				#address-cells = <1>;
-				#size-cells = <0>;
-				ti,hwmods = "davinci_mdio";
-				bus_freq = <1000000>;
-				reg = <0x48485000 0x100>;
-			};
-
-			cpsw_emac0: slave@48480200 {
-				/* Filled in by U-Boot */
-				mac-address = [ 00 00 00 00 00 00 ];
-			};
-
-			cpsw_emac1: slave@48480300 {
-				/* Filled in by U-Boot */
-				mac-address = [ 00 00 00 00 00 00 ];
-			};
-
-			phy_sel: cpsw-phy-sel@4a002554 {
-				compatible = "ti,dra7xx-cpsw-phy-sel";
-				reg= <0x4a002554 0x4>;
-				reg-names = "gmii-sel";
-			};
-		};
-
-		dcan1: can@4ae3c000 {
-			compatible = "ti,dra7-d_can";
-			ti,hwmods = "dcan1";
-			reg = <0x4ae3c000 0x2000>;
-			syscon-raminit = <&scm_conf 0x558 0>;
-			interrupts = <GIC_SPI 222 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&wkupaon_clkctrl DRA7_WKUPAON_DCAN1_CLKCTRL 24>;
-			status = "disabled";
-		};
-
-		dcan2: can@48480000 {
-			compatible = "ti,dra7-d_can";
-			ti,hwmods = "dcan2";
-			reg = <0x48480000 0x2000>;
-			syscon-raminit = <&scm_conf 0x558 1>;
-			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&sys_clkin1>;
-			status = "disabled";
-		};
-
 		dss: dss@58000000 {
 			compatible = "ti,dra7-dss";
 			/* 'reg' defined in dra72x.dtsi and dra74x.dtsi */
@@ -1954,96 +650,6 @@
 			};
 		};
 
-		epwmss0: epwmss@4843e000 {
-			compatible = "ti,dra746-pwmss", "ti,am33xx-pwmss";
-			reg = <0x4843e000 0x30>;
-			ti,hwmods = "epwmss0";
-			#address-cells = <1>;
-			#size-cells = <1>;
-			status = "disabled";
-			ranges;
-
-			ehrpwm0: pwm@4843e200 {
-				compatible = "ti,dra746-ehrpwm",
-					     "ti,am3352-ehrpwm";
-				#pwm-cells = <3>;
-				reg = <0x4843e200 0x80>;
-				clocks = <&ehrpwm0_tbclk>, <&l4_root_clk_div>;
-				clock-names = "tbclk", "fck";
-				status = "disabled";
-			};
-
-			ecap0: ecap@4843e100 {
-				compatible = "ti,dra746-ecap",
-					     "ti,am3352-ecap";
-				#pwm-cells = <3>;
-				reg = <0x4843e100 0x80>;
-				clocks = <&l4_root_clk_div>;
-				clock-names = "fck";
-				status = "disabled";
-			};
-		};
-
-		epwmss1: epwmss@48440000 {
-			compatible = "ti,dra746-pwmss", "ti,am33xx-pwmss";
-			reg = <0x48440000 0x30>;
-			ti,hwmods = "epwmss1";
-			#address-cells = <1>;
-			#size-cells = <1>;
-			status = "disabled";
-			ranges;
-
-			ehrpwm1: pwm@48440200 {
-				compatible = "ti,dra746-ehrpwm",
-					     "ti,am3352-ehrpwm";
-				#pwm-cells = <3>;
-				reg = <0x48440200 0x80>;
-				clocks = <&ehrpwm1_tbclk>, <&l4_root_clk_div>;
-				clock-names = "tbclk", "fck";
-				status = "disabled";
-			};
-
-			ecap1: ecap@48440100 {
-				compatible = "ti,dra746-ecap",
-					     "ti,am3352-ecap";
-				#pwm-cells = <3>;
-				reg = <0x48440100 0x80>;
-				clocks = <&l4_root_clk_div>;
-				clock-names = "fck";
-				status = "disabled";
-			};
-		};
-
-		epwmss2: epwmss@48442000 {
-			compatible = "ti,dra746-pwmss", "ti,am33xx-pwmss";
-			reg = <0x48442000 0x30>;
-			ti,hwmods = "epwmss2";
-			#address-cells = <1>;
-			#size-cells = <1>;
-			status = "disabled";
-			ranges;
-
-			ehrpwm2: pwm@48442200 {
-				compatible = "ti,dra746-ehrpwm",
-					     "ti,am3352-ehrpwm";
-				#pwm-cells = <3>;
-				reg = <0x48442200 0x80>;
-				clocks = <&ehrpwm2_tbclk>, <&l4_root_clk_div>;
-				clock-names = "tbclk", "fck";
-				status = "disabled";
-			};
-
-			ecap2: ecap@48442100 {
-				compatible = "ti,dra746-ecap",
-					     "ti,am3352-ecap";
-				#pwm-cells = <3>;
-				reg = <0x48442100 0x80>;
-				clocks = <&l4_root_clk_div>;
-				clock-names = "fck";
-				status = "disabled";
-			};
-		};
-
 		aes1: aes@4b500000 {
 			compatible = "ti,omap4-aes";
 			ti,hwmods = "aes1";
@@ -2088,15 +694,6 @@
 			clock-names = "fck";
 		};
 
-		rng: rng@48090000 {
-			compatible = "ti,omap4-rng";
-			ti,hwmods = "rng";
-			reg = <0x48090000 0x2000>;
-			interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&l3_iclk_div>;
-			clock-names = "fck";
-		};
-
 		opp_supply_mpu: opp-supply@4a003b20 {
 			compatible = "ti,omap5-opp-supply";
 			reg = <0x4a003b20 0xc>;
@@ -2146,8 +743,6 @@
 	temperature = <120000>; /* milli Celsius */
 };
 
-#include "dra7xx-clocks.dtsi"
-
 &core_crit {
 	temperature = <120000>; /* milli Celsius */
 };
@@ -2163,3 +758,6 @@
 &iva_crit {
 	temperature = <120000>; /* milli Celsius */
 };
+
+#include "dra7-l4.dtsi"
+#include "dra7xx-clocks.dtsi"
-- 
2.19.0
