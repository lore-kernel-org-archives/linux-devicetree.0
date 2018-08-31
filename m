Return-Path: <SRS0=WyUm=LO=vger.kernel.org=devicetree-owner@kernel.org>
Received: from lelv0143.ext.ti.com ([198.47.23.248]:46070 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727303AbeHaTXO (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 31 Aug 2018 15:23:14 -0400
From: Tero Kristo <t-kristo@ti.com>
Subject: [PATCH 3/3] ARM: dts: dra7: convert to use new clkctrl layout
Date: Fri, 31 Aug 2018 18:14:51 +0300
Message-ID: <1535728491-25321-4-git-send-email-t-kristo@ti.com>
In-Reply-To: <1535728491-25321-1-git-send-email-t-kristo@ti.com>
References: <1535728491-25321-1-git-send-email-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: tony@atomide.com, linux-omap@vger.kernel.org
Cc: devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Convert DRA7xx to use the new clockdomain based layout. Previously the
clkctrl split was based on CM isntance boundaries. The new layout
helps with introducing the interconnect driver instances.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 arch/arm/boot/dts/am57xx-beagle-x15-common.dtsi |   2 +-
 arch/arm/boot/dts/dra7-evm-common.dtsi          |   4 +-
 arch/arm/boot/dts/dra7.dtsi                     |  76 +++++------
 arch/arm/boot/dts/dra72-evm-common.dtsi         |   4 +-
 arch/arm/boot/dts/dra72x.dtsi                   |   4 +-
 arch/arm/boot/dts/dra74x.dtsi                   |   6 +-
 arch/arm/boot/dts/dra76x.dtsi                   |   2 +-
 arch/arm/boot/dts/dra7xx-clocks.dtsi            | 159 ++++++++++++++++++------
 8 files changed, 171 insertions(+), 86 deletions(-)

diff --git a/arch/arm/boot/dts/am57xx-beagle-x15-common.dtsi b/arch/arm/boot/dts/am57xx-beagle-x15-common.dtsi
index ad95311..1e6620f 100644
--- a/arch/arm/boot/dts/am57xx-beagle-x15-common.dtsi
+++ b/arch/arm/boot/dts/am57xx-beagle-x15-common.dtsi
@@ -555,7 +555,7 @@
 
 &mcasp3 {
 	#sound-dai-cells = <0>;
-	assigned-clocks = <&l4per_clkctrl DRA7_MCASP3_CLKCTRL 24>;
+	assigned-clocks = <&l4per2_clkctrl DRA7_L4PER2_MCASP3_CLKCTRL 24>;
 	assigned-clock-parents = <&sys_clkin2>;
 	status = "okay";
 
diff --git a/arch/arm/boot/dts/dra7-evm-common.dtsi b/arch/arm/boot/dts/dra7-evm-common.dtsi
index 7e18147..0d6f864 100644
--- a/arch/arm/boot/dts/dra7-evm-common.dtsi
+++ b/arch/arm/boot/dts/dra7-evm-common.dtsi
@@ -214,7 +214,7 @@
 
 &atl {
 	assigned-clocks = <&abe_dpll_sys_clk_mux>,
-			  <&atl_clkctrl DRA7_ATL_CLKCTRL 26>,
+			  <&atl_clkctrl DRA7_ATL_ATL_CLKCTRL 26>,
 			  <&dpll_abe_ck>,
 			  <&dpll_abe_m2x2_ck>,
 			  <&atl_clkin2_ck>;
@@ -232,7 +232,7 @@
 &mcasp3 {
 	#sound-dai-cells = <0>;
 
-	assigned-clocks = <&l4per_clkctrl DRA7_MCASP3_CLKCTRL 24>;
+	assigned-clocks = <&l4per2_clkctrl DRA7_L4PER2_MCASP3_CLKCTRL 24>;
 	assigned-clock-parents = <&atl_clkin2_ck>;
 
 	status = "okay";
diff --git a/arch/arm/boot/dts/dra7.dtsi b/arch/arm/boot/dts/dra7.dtsi
index a0ddf49..74967f4 100644
--- a/arch/arm/boot/dts/dra7.dtsi
+++ b/arch/arm/boot/dts/dra7.dtsi
@@ -897,7 +897,7 @@
 			ti,hwmods = "timer1";
 			ti,timer-alwon;
 			clock-names = "fck";
-			clocks = <&wkupaon_clkctrl DRA7_TIMER1_CLKCTRL 24>;
+			clocks = <&wkupaon_clkctrl DRA7_WKUPAON_TIMER1_CLKCTRL 24>;
 		};
 
 		timer2: timer@48032000 {
@@ -1378,7 +1378,7 @@
 			#address-cells = <1>;
 			#size-cells = <0>;
 			ti,hwmods = "qspi";
-			clocks = <&l4per_clkctrl DRA7_QSPI_CLKCTRL 25>;
+			clocks = <&l4per2_clkctrl DRA7_L4PER2_QSPI_CLKCTRL 25>;
 			clock-names = "fck";
 			num-cs = <4>;
 			interrupts = <GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH>;
@@ -1401,7 +1401,7 @@
 				reg-names = "phy_rx", "phy_tx", "pll_ctrl";
 				syscon-phy-power = <&scm_conf 0x374>;
 				clocks = <&sys_clkin1>,
-					 <&l3init_clkctrl DRA7_SATA_CLKCTRL 8>;
+					 <&l3init_clkctrl DRA7_L3INIT_SATA_CLKCTRL 8>;
 				clock-names = "sysclk", "refclk";
 				syscon-pllreset = <&scm_conf 0x3fc>;
 				#phy-cells = <0>;
@@ -1416,9 +1416,9 @@
 				syscon-pcs = <&scm_conf_pcie 0x10>;
 				clocks = <&dpll_pcie_ref_ck>,
 					 <&dpll_pcie_ref_m2ldo_ck>,
-					 <&l3init_clkctrl DRA7_PCIE1_CLKCTRL 8>,
-					 <&l3init_clkctrl DRA7_PCIE1_CLKCTRL 9>,
-					 <&l3init_clkctrl DRA7_PCIE1_CLKCTRL 10>,
+					 <&pcie_clkctrl DRA7_PCIE_PCIE1_CLKCTRL 8>,
+					 <&pcie_clkctrl DRA7_PCIE_PCIE1_CLKCTRL 9>,
+					 <&pcie_clkctrl DRA7_PCIE_PCIE1_CLKCTRL 10>,
 					 <&optfclk_pciephy_div>,
 					 <&sys_clkin1>;
 				clock-names = "dpll_ref", "dpll_ref_m2",
@@ -1436,9 +1436,9 @@
 				syscon-pcs = <&scm_conf_pcie 0x10>;
 				clocks = <&dpll_pcie_ref_ck>,
 					 <&dpll_pcie_ref_m2ldo_ck>,
-					 <&l3init_clkctrl DRA7_PCIE2_CLKCTRL 8>,
-					 <&l3init_clkctrl DRA7_PCIE2_CLKCTRL 9>,
-					 <&l3init_clkctrl DRA7_PCIE2_CLKCTRL 10>,
+					 <&pcie_clkctrl DRA7_PCIE_PCIE2_CLKCTRL 8>,
+					 <&pcie_clkctrl DRA7_PCIE_PCIE2_CLKCTRL 9>,
+					 <&pcie_clkctrl DRA7_PCIE_PCIE2_CLKCTRL 10>,
 					 <&optfclk_pciephy_div>,
 					 <&sys_clkin1>;
 				clock-names = "dpll_ref", "dpll_ref_m2",
@@ -1455,7 +1455,7 @@
 			interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
 			phys = <&sata_phy>;
 			phy-names = "sata-phy";
-			clocks = <&l3init_clkctrl DRA7_SATA_CLKCTRL 8>;
+			clocks = <&l3init_clkctrl DRA7_L3INIT_SATA_CLKCTRL 8>;
 			ti,hwmods = "sata";
 			ports-implemented = <0x1>;
 		};
@@ -1483,7 +1483,7 @@
 				reg = <0x4a084000 0x400>;
 				syscon-phy-power = <&scm_conf 0x300>;
 				clocks = <&usb_phy1_always_on_clk32k>,
-					 <&l3init_clkctrl DRA7_USB_OTG_SS1_CLKCTRL 8>;
+					 <&l3init_clkctrl DRA7_L3INIT_USB_OTG_SS1_CLKCTRL 8>;
 				clock-names =	"wkupclk",
 						"refclk";
 				#phy-cells = <0>;
@@ -1495,7 +1495,7 @@
 				reg = <0x4a085000 0x400>;
 				syscon-phy-power = <&scm_conf 0xe74>;
 				clocks = <&usb_phy2_always_on_clk32k>,
-					 <&l3init_clkctrl DRA7_USB_OTG_SS2_CLKCTRL 8>;
+					 <&l3init_clkctrl DRA7_L3INIT_USB_OTG_SS2_CLKCTRL 8>;
 				clock-names =	"wkupclk",
 						"refclk";
 				#phy-cells = <0>;
@@ -1510,7 +1510,7 @@
 				syscon-phy-power = <&scm_conf 0x370>;
 				clocks = <&usb_phy3_always_on_clk32k>,
 					 <&sys_clkin1>,
-					 <&l3init_clkctrl DRA7_USB_OTG_SS1_CLKCTRL 8>;
+					 <&l3init_clkctrl DRA7_L3INIT_USB_OTG_SS1_CLKCTRL 8>;
 				clock-names =	"wkupclk",
 						"sysclk",
 						"refclk";
@@ -1528,7 +1528,7 @@
 					<SYSC_IDLE_NO>,
 					<SYSC_IDLE_SMART>,
 					<SYSC_IDLE_SMART_WKUP>;
-			clocks = <&coreaon_clkctrl DRA7_SMARTREFLEX_CORE_CLKCTRL 0>;
+			clocks = <&coreaon_clkctrl DRA7_COREAON_SMARTREFLEX_CORE_CLKCTRL 0>;
 			clock-names = "fck";
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -1547,7 +1547,7 @@
 					<SYSC_IDLE_NO>,
 					<SYSC_IDLE_SMART>,
 					<SYSC_IDLE_SMART_WKUP>;
-			clocks = <&coreaon_clkctrl DRA7_SMARTREFLEX_MPU_CLKCTRL 0>;
+			clocks = <&coreaon_clkctrl DRA7_COREAON_SMARTREFLEX_MPU_CLKCTRL 0>;
 			clock-names = "fck";
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -1670,7 +1670,7 @@
 			ti,hwmods = "atl";
 			ti,provided-clocks = <&atl_clkin0_ck>, <&atl_clkin1_ck>,
 					     <&atl_clkin2_ck>, <&atl_clkin3_ck>;
-			clocks = <&atl_clkctrl DRA7_ATL_CLKCTRL 26>;
+			clocks = <&atl_clkctrl DRA7_ATL_ATL_CLKCTRL 26>;
 			clock-names = "fck";
 			status = "disabled";
 		};
@@ -1686,8 +1686,8 @@
 			interrupt-names = "tx", "rx";
 			dmas = <&edma_xbar 129 1>, <&edma_xbar 128 1>;
 			dma-names = "tx", "rx";
-			clocks = <&ipu_clkctrl DRA7_MCASP1_CLKCTRL 22>, <&ipu_clkctrl DRA7_MCASP1_CLKCTRL 24>,
-				 <&ipu_clkctrl DRA7_MCASP1_CLKCTRL 28>;
+			clocks = <&ipu_clkctrl DRA7_IPU_MCASP1_CLKCTRL 22>, <&ipu_clkctrl DRA7_IPU_MCASP1_CLKCTRL 24>,
+				 <&ipu_clkctrl DRA7_IPU_MCASP1_CLKCTRL 28>;
 			clock-names = "fck", "ahclkx", "ahclkr";
 			status = "disabled";
 		};
@@ -1703,9 +1703,9 @@
 			interrupt-names = "tx", "rx";
 			dmas = <&edma_xbar 131 1>, <&edma_xbar 130 1>;
 			dma-names = "tx", "rx";
-			clocks = <&l4per_clkctrl DRA7_MCASP2_CLKCTRL 22>,
-				 <&l4per_clkctrl DRA7_MCASP2_CLKCTRL 24>,
-				 <&l4per_clkctrl DRA7_MCASP2_CLKCTRL 28>;
+			clocks = <&l4per2_clkctrl DRA7_L4PER2_MCASP2_CLKCTRL 22>,
+				 <&l4per2_clkctrl DRA7_L4PER2_MCASP2_CLKCTRL 24>,
+				 <&l4per2_clkctrl DRA7_L4PER2_MCASP2_CLKCTRL 28>;
 			clock-names = "fck", "ahclkx", "ahclkr";
 			status = "disabled";
 		};
@@ -1721,8 +1721,8 @@
 			interrupt-names = "tx", "rx";
 			dmas = <&edma_xbar 133 1>, <&edma_xbar 132 1>;
 			dma-names = "tx", "rx";
-			clocks = <&l4per_clkctrl DRA7_MCASP3_CLKCTRL 22>,
-				 <&l4per_clkctrl DRA7_MCASP3_CLKCTRL 24>;
+			clocks = <&l4per2_clkctrl DRA7_L4PER2_MCASP3_CLKCTRL 22>,
+				 <&l4per2_clkctrl DRA7_L4PER2_MCASP3_CLKCTRL 24>;
 			clock-names = "fck", "ahclkx";
 			status = "disabled";
 		};
@@ -1738,8 +1738,8 @@
 			interrupt-names = "tx", "rx";
 			dmas = <&edma_xbar 135 1>, <&edma_xbar 134 1>;
 			dma-names = "tx", "rx";
-			clocks = <&l4per_clkctrl DRA7_MCASP4_CLKCTRL 22>,
-				 <&l4per_clkctrl DRA7_MCASP4_CLKCTRL 24>;
+			clocks = <&l4per2_clkctrl DRA7_L4PER2_MCASP4_CLKCTRL 22>,
+				 <&l4per2_clkctrl DRA7_L4PER2_MCASP4_CLKCTRL 24>;
 			clock-names = "fck", "ahclkx";
 			status = "disabled";
 		};
@@ -1755,8 +1755,8 @@
 			interrupt-names = "tx", "rx";
 			dmas = <&edma_xbar 137 1>, <&edma_xbar 136 1>;
 			dma-names = "tx", "rx";
-			clocks = <&l4per_clkctrl DRA7_MCASP5_CLKCTRL 22>,
-				 <&l4per_clkctrl DRA7_MCASP5_CLKCTRL 24>;
+			clocks = <&l4per2_clkctrl DRA7_L4PER2_MCASP5_CLKCTRL 22>,
+				 <&l4per2_clkctrl DRA7_L4PER2_MCASP5_CLKCTRL 24>;
 			clock-names = "fck", "ahclkx";
 			status = "disabled";
 		};
@@ -1772,8 +1772,8 @@
 			interrupt-names = "tx", "rx";
 			dmas = <&edma_xbar 139 1>, <&edma_xbar 138 1>;
 			dma-names = "tx", "rx";
-			clocks = <&l4per_clkctrl DRA7_MCASP6_CLKCTRL 22>,
-				 <&l4per_clkctrl DRA7_MCASP6_CLKCTRL 24>;
+			clocks = <&l4per2_clkctrl DRA7_L4PER2_MCASP6_CLKCTRL 22>,
+				 <&l4per2_clkctrl DRA7_L4PER2_MCASP6_CLKCTRL 24>;
 			clock-names = "fck", "ahclkx";
 			status = "disabled";
 		};
@@ -1789,8 +1789,8 @@
 			interrupt-names = "tx", "rx";
 			dmas = <&edma_xbar 141 1>, <&edma_xbar 140 1>;
 			dma-names = "tx", "rx";
-			clocks = <&l4per_clkctrl DRA7_MCASP7_CLKCTRL 22>,
-				 <&l4per_clkctrl DRA7_MCASP7_CLKCTRL 24>;
+			clocks = <&l4per2_clkctrl DRA7_L4PER2_MCASP7_CLKCTRL 22>,
+				 <&l4per2_clkctrl DRA7_L4PER2_MCASP7_CLKCTRL 24>;
 			clock-names = "fck", "ahclkx";
 			status = "disabled";
 		};
@@ -1806,8 +1806,8 @@
 			interrupt-names = "tx", "rx";
 			dmas = <&edma_xbar 143 1>, <&edma_xbar 142 1>;
 			dma-names = "tx", "rx";
-			clocks = <&l4per_clkctrl DRA7_MCASP8_CLKCTRL 22>,
-				 <&l4per_clkctrl DRA7_MCASP8_CLKCTRL 24>;
+			clocks = <&l4per2_clkctrl DRA7_L4PER2_MCASP8_CLKCTRL 22>,
+				 <&l4per2_clkctrl DRA7_L4PER2_MCASP8_CLKCTRL 24>;
 			clock-names = "fck", "ahclkx";
 			status = "disabled";
 		};
@@ -1829,7 +1829,7 @@
 		mac: ethernet@48484000 {
 			compatible = "ti,dra7-cpsw","ti,cpsw";
 			ti,hwmods = "gmac";
-			clocks = <&gmac_main_clk>, <&l3init_clkctrl DRA7_GMAC_CLKCTRL 25>;
+			clocks = <&gmac_main_clk>, <&gmac_clkctrl DRA7_GMAC_GMAC_CLKCTRL 25>;
 			clock-names = "fck", "cpts";
 			cpdma_channels = <8>;
 			ale_entries = <1024>;
@@ -1899,7 +1899,7 @@
 			reg = <0x4ae3c000 0x2000>;
 			syscon-raminit = <&scm_conf 0x558 0>;
 			interrupts = <GIC_SPI 222 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&wkupaon_clkctrl DRA7_DCAN1_CLKCTRL 24>;
+			clocks = <&wkupaon_clkctrl DRA7_WKUPAON_DCAN1_CLKCTRL 24>;
 			status = "disabled";
 		};
 
@@ -1930,7 +1930,7 @@
 				reg = <0x58001000 0x1000>;
 				interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
 				ti,hwmods = "dss_dispc";
-				clocks = <&dss_clkctrl DRA7_DSS_CORE_CLKCTRL 8>;
+				clocks = <&dss_clkctrl DRA7_DSS_DSS_CORE_CLKCTRL 8>;
 				clock-names = "fck";
 				/* CTRL_CORE_SMA_SW_1 */
 				syscon-pol = <&scm_conf 0x534>;
@@ -1946,8 +1946,8 @@
 				interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
 				status = "disabled";
 				ti,hwmods = "dss_hdmi";
-				clocks = <&dss_clkctrl DRA7_DSS_CORE_CLKCTRL 9>,
-					 <&dss_clkctrl DRA7_DSS_CORE_CLKCTRL 10>;
+				clocks = <&dss_clkctrl DRA7_DSS_DSS_CORE_CLKCTRL 9>,
+					 <&dss_clkctrl DRA7_DSS_DSS_CORE_CLKCTRL 10>;
 				clock-names = "fck", "sys_clk";
 				dmas = <&sdma_xbar 76>;
 				dma-names = "audio_tx";
diff --git a/arch/arm/boot/dts/dra72-evm-common.dtsi b/arch/arm/boot/dts/dra72-evm-common.dtsi
index e297b92..be65f3bc5 100644
--- a/arch/arm/boot/dts/dra72-evm-common.dtsi
+++ b/arch/arm/boot/dts/dra72-evm-common.dtsi
@@ -530,7 +530,7 @@
 
 &atl {
 	assigned-clocks = <&abe_dpll_sys_clk_mux>,
-			  <&atl_clkctrl DRA7_ATL_CLKCTRL 26>,
+			  <&atl_clkctrl DRA7_ATL_ATL_CLKCTRL 26>,
 			  <&dpll_abe_ck>,
 			  <&dpll_abe_m2x2_ck>,
 			  <&atl_clkin2_ck>;
@@ -548,7 +548,7 @@
 &mcasp3 {
 	#sound-dai-cells = <0>;
 
-	assigned-clocks = <&l4per_clkctrl DRA7_MCASP3_CLKCTRL 24>;
+	assigned-clocks = <&l4per2_clkctrl DRA7_L4PER2_MCASP3_CLKCTRL 24>;
 	assigned-clock-parents = <&atl_clkin2_ck>;
 
 	status = "okay";
diff --git a/arch/arm/boot/dts/dra72x.dtsi b/arch/arm/boot/dts/dra72x.dtsi
index c011d2e..8983155 100644
--- a/arch/arm/boot/dts/dra72x.dtsi
+++ b/arch/arm/boot/dts/dra72x.dtsi
@@ -25,8 +25,8 @@
 	      <0x58004300 0x20>;
 	reg-names = "dss", "pll1_clkctrl", "pll1";
 
-	clocks = <&dss_clkctrl DRA7_DSS_CORE_CLKCTRL 8>,
-		 <&dss_clkctrl DRA7_DSS_CORE_CLKCTRL 12>;
+	clocks = <&dss_clkctrl DRA7_DSS_DSS_CORE_CLKCTRL 8>,
+		 <&dss_clkctrl DRA7_DSS_DSS_CORE_CLKCTRL 12>;
 	clock-names = "fck", "video1_clk";
 };
 
diff --git a/arch/arm/boot/dts/dra74x.dtsi b/arch/arm/boot/dts/dra74x.dtsi
index 8f9df09..8294a60 100644
--- a/arch/arm/boot/dts/dra74x.dtsi
+++ b/arch/arm/boot/dts/dra74x.dtsi
@@ -103,9 +103,9 @@
 	reg-names = "dss", "pll1_clkctrl", "pll1",
 		    "pll2_clkctrl", "pll2";
 
-	clocks = <&dss_clkctrl DRA7_DSS_CORE_CLKCTRL 8>,
-		 <&dss_clkctrl DRA7_DSS_CORE_CLKCTRL 12>,
-		 <&dss_clkctrl DRA7_DSS_CORE_CLKCTRL 13>;
+	clocks = <&dss_clkctrl DRA7_DSS_DSS_CORE_CLKCTRL 8>,
+		 <&dss_clkctrl DRA7_DSS_DSS_CORE_CLKCTRL 12>,
+		 <&dss_clkctrl DRA7_DSS_DSS_CORE_CLKCTRL 13>;
 	clock-names = "fck", "video1_clk", "video2_clk";
 };
 
diff --git a/arch/arm/boot/dts/dra76x.dtsi b/arch/arm/boot/dts/dra76x.dtsi
index 613e4dc..9ee45aa 100644
--- a/arch/arm/boot/dts/dra76x.dtsi
+++ b/arch/arm/boot/dts/dra76x.dtsi
@@ -24,7 +24,7 @@
 			ti,sysc-mask = <(SYSC_OMAP4_SOFTRESET |
 					 SYSC_DRA7_MCAN_ENAWAKEUP)>;
 			ti,syss-mask = <1>;
-			clocks = <&wkupaon_clkctrl DRA7_ADC_CLKCTRL 0>;
+			clocks = <&wkupaon_clkctrl DRA7_WKUPAON_ADC_CLKCTRL 0>;
 			clock-names = "fck";
 
 			m_can0: mcan@1a00 {
diff --git a/arch/arm/boot/dts/dra7xx-clocks.dtsi b/arch/arm/boot/dts/dra7xx-clocks.dtsi
index 69562cd..bb52c6f 100644
--- a/arch/arm/boot/dts/dra7xx-clocks.dtsi
+++ b/arch/arm/boot/dts/dra7xx-clocks.dtsi
@@ -11,25 +11,25 @@
 	atl_clkin0_ck: atl_clkin0_ck {
 		#clock-cells = <0>;
 		compatible = "ti,dra7-atl-clock";
-		clocks = <&atl_clkctrl DRA7_ATL_CLKCTRL 26>;
+		clocks = <&atl_clkctrl DRA7_ATL_ATL_CLKCTRL 26>;
 	};
 
 	atl_clkin1_ck: atl_clkin1_ck {
 		#clock-cells = <0>;
 		compatible = "ti,dra7-atl-clock";
-		clocks = <&atl_clkctrl DRA7_ATL_CLKCTRL 26>;
+		clocks = <&atl_clkctrl DRA7_ATL_ATL_CLKCTRL 26>;
 	};
 
 	atl_clkin2_ck: atl_clkin2_ck {
 		#clock-cells = <0>;
 		compatible = "ti,dra7-atl-clock";
-		clocks = <&atl_clkctrl DRA7_ATL_CLKCTRL 26>;
+		clocks = <&atl_clkctrl DRA7_ATL_ATL_CLKCTRL 26>;
 	};
 
 	atl_clkin3_ck: atl_clkin3_ck {
 		#clock-cells = <0>;
 		compatible = "ti,dra7-atl-clock";
-		clocks = <&atl_clkctrl DRA7_ATL_CLKCTRL 26>;
+		clocks = <&atl_clkctrl DRA7_ATL_ATL_CLKCTRL 26>;
 	};
 
 	hdmi_clkin_ck: hdmi_clkin_ck {
@@ -1526,44 +1526,82 @@
 };
 
 &cm_core_aon {
-	mpu_cm: mpu_cm@300 {
+	mpu_cm: mpu-cm@300 {
 		compatible = "ti,omap4-cm";
 		reg = <0x300 0x100>;
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0 0x300 0x100>;
 
-		mpu_clkctrl: clk@20 {
+		mpu_clkctrl: mpu-clkctrl@20 {
 			compatible = "ti,clkctrl";
 			reg = <0x20 0x4>;
 			#clock-cells = <2>;
 		};
+
+	};
+
+	dsp1_cm: dsp1-cm@400 {
+		compatible = "ti,omap4-cm";
+		reg = <0x400 0x100>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0x400 0x100>;
+
+		dsp1_clkctrl: dsp1-clkctrl@20 {
+			compatible = "ti,clkctrl";
+			reg = <0x20 0x4>;
+			#clock-cells = <2>;
+		};
+
 	};
 
-	ipu_cm: ipu_cm@500 {
+	ipu_cm: ipu-cm@500 {
 		compatible = "ti,omap4-cm";
 		reg = <0x500 0x100>;
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0 0x500 0x100>;
 
-		ipu_clkctrl: clk@40 {
+		ipu1_clkctrl: ipu1-clkctrl@20 {
+			compatible = "ti,clkctrl";
+			reg = <0x20 0x4>;
+			#clock-cells = <2>;
+		};
+
+		ipu_clkctrl: ipu-clkctrl@50 {
+			compatible = "ti,clkctrl";
+			reg = <0x50 0x34>;
+			#clock-cells = <2>;
+		};
+
+	};
+
+	dsp2_cm: dsp2-cm@600 {
+		compatible = "ti,omap4-cm";
+		reg = <0x600 0x100>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0x600 0x100>;
+
+		dsp2_clkctrl: dsp2-clkctrl@20 {
 			compatible = "ti,clkctrl";
-			reg = <0x40 0x44>;
+			reg = <0x20 0x4>;
 			#clock-cells = <2>;
 		};
+
 	};
 
-	rtc_cm: rtc_cm@700 {
+	rtc_cm: rtc-cm@700 {
 		compatible = "ti,omap4-cm";
 		reg = <0x700 0x100>;
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0 0x700 0x100>;
 
-		rtc_clkctrl: clk@40 {
+		rtc_clkctrl: rtc-clkctrl@20 {
 			compatible = "ti,clkctrl";
-			reg = <0x40 0x8>;
+			reg = <0x20 0x28>;
 			#clock-cells = <2>;
 		};
 	};
@@ -1571,160 +1609,207 @@
 };
 
 &cm_core {
-	coreaon_cm: coreaon_cm@600 {
+	coreaon_cm: coreaon-cm@600 {
 		compatible = "ti,omap4-cm";
 		reg = <0x600 0x100>;
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0 0x600 0x100>;
 
-		coreaon_clkctrl: clk@20 {
+		coreaon_clkctrl: coreaon-clkctrl@20 {
 			compatible = "ti,clkctrl";
 			reg = <0x20 0x1c>;
 			#clock-cells = <2>;
 		};
 	};
 
-	l3main1_cm: l3main1_cm@700 {
+	l3main1_cm: l3main1-cm@700 {
 		compatible = "ti,omap4-cm";
 		reg = <0x700 0x100>;
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0 0x700 0x100>;
 
-		l3main1_clkctrl: clk@20 {
+		l3main1_clkctrl: l3main1-clkctrl@20 {
 			compatible = "ti,clkctrl";
 			reg = <0x20 0x74>;
 			#clock-cells = <2>;
 		};
+
+	};
+
+	ipu2_cm: ipu2-cm@900 {
+		compatible = "ti,omap4-cm";
+		reg = <0x900 0x100>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0x900 0x100>;
+
+		ipu2_clkctrl: ipu2-clkctrl@20 {
+			compatible = "ti,clkctrl";
+			reg = <0x20 0x4>;
+			#clock-cells = <2>;
+		};
+
 	};
 
-	dma_cm: dma_cm@a00 {
+	dma_cm: dma-cm@a00 {
 		compatible = "ti,omap4-cm";
 		reg = <0xa00 0x100>;
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0 0xa00 0x100>;
 
-		dma_clkctrl: clk@20 {
+		dma_clkctrl: dma-clkctrl@20 {
 			compatible = "ti,clkctrl";
 			reg = <0x20 0x4>;
 			#clock-cells = <2>;
 		};
 	};
 
-	emif_cm: emif_cm@b00 {
+	emif_cm: emif-cm@b00 {
 		compatible = "ti,omap4-cm";
 		reg = <0xb00 0x100>;
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0 0xb00 0x100>;
 
-		emif_clkctrl: clk@20 {
+		emif_clkctrl: emif-clkctrl@20 {
 			compatible = "ti,clkctrl";
 			reg = <0x20 0x4>;
 			#clock-cells = <2>;
 		};
 	};
 
-	atl_cm: atl_cm@c00 {
+	atl_cm: atl-cm@c00 {
 		compatible = "ti,omap4-cm";
 		reg = <0xc00 0x100>;
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0 0xc00 0x100>;
 
-		atl_clkctrl: clk@0 {
+		atl_clkctrl: atl-clkctrl@0 {
 			compatible = "ti,clkctrl";
 			reg = <0x0 0x4>;
 			#clock-cells = <2>;
 		};
 	};
 
-	l4cfg_cm: l4cfg_cm@d00 {
+	l4cfg_cm: l4cfg-cm@d00 {
 		compatible = "ti,omap4-cm";
 		reg = <0xd00 0x100>;
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0 0xd00 0x100>;
 
-		l4cfg_clkctrl: clk@20 {
+		l4cfg_clkctrl: l4cfg-clkctrl@20 {
 			compatible = "ti,clkctrl";
 			reg = <0x20 0x84>;
 			#clock-cells = <2>;
 		};
 	};
 
-	l3instr_cm: l3instr_cm@e00 {
+	l3instr_cm: l3instr-cm@e00 {
 		compatible = "ti,omap4-cm";
 		reg = <0xe00 0x100>;
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0 0xe00 0x100>;
 
-		l3instr_clkctrl: clk@20 {
+		l3instr_clkctrl: l3instr-clkctrl@20 {
 			compatible = "ti,clkctrl";
 			reg = <0x20 0xc>;
 			#clock-cells = <2>;
 		};
 	};
 
-	dss_cm: dss_cm@1100 {
+	dss_cm: dss-cm@1100 {
 		compatible = "ti,omap4-cm";
 		reg = <0x1100 0x100>;
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0 0x1100 0x100>;
 
-		dss_clkctrl: clk@20 {
+		dss_clkctrl: dss-clkctrl@20 {
 			compatible = "ti,clkctrl";
 			reg = <0x20 0x14>;
 			#clock-cells = <2>;
 		};
 	};
 
-	l3init_cm: l3init_cm@1300 {
+	l3init_cm: l3init-cm@1300 {
 		compatible = "ti,omap4-cm";
 		reg = <0x1300 0x100>;
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0 0x1300 0x100>;
 
-		l3init_clkctrl: clk@20 {
+		l3init_clkctrl: l3init-clkctrl@20 {
+			compatible = "ti,clkctrl";
+			reg = <0x20 0x6c>, <0xe0 0x14>;
+			#clock-cells = <2>;
+		};
+
+		pcie_clkctrl: pcie-clkctrl@b0 {
+			compatible = "ti,clkctrl";
+			reg = <0xb0 0xc>;
+			#clock-cells = <2>;
+		};
+
+		gmac_clkctrl: gmac-clkctrl@d0 {
 			compatible = "ti,clkctrl";
-			reg = <0x20 0xd4>;
+			reg = <0xd0 0x4>;
 			#clock-cells = <2>;
 		};
+
 	};
 
-	l4per_cm: l4per_cm@1700 {
+	l4per_cm: l4per-cm@1700 {
 		compatible = "ti,omap4-cm";
 		reg = <0x1700 0x300>;
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0 0x1700 0x300>;
 
-		l4per_clkctrl: clk@0 {
+		l4per_clkctrl: l4per-clkctrl@28 {
 			compatible = "ti,clkctrl";
-			reg = <0x0 0x20c>;
+			reg = <0x28 0x64>, <0xa0 0x24>, <0xf0 0x3c>, <0x140 0x1c>, <0x170 0x4>;
 			#clock-cells = <2>;
 
-			assigned-clocks = <&l4per_clkctrl DRA7_MCASP3_CLKCTRL 24>;
+			assigned-clocks = <&l4per2_clkctrl DRA7_L4PER2_MCASP3_CLKCTRL 24>;
 			assigned-clock-parents = <&abe_24m_fclk>;
 		};
+
+		l4sec_clkctrl: l4sec-clkctrl@1a0 {
+			compatible = "ti,clkctrl";
+			reg = <0x1a0 0x2c>;
+			#clock-cells = <2>;
+		};
+
+		l4per2_clkctrl: l4per2-clkctrl@c {
+			compatible = "ti,clkctrl";
+			reg = <0xc 0x4>, <0x18 0xc>, <0x90 0xc>, <0xc4 0x4>, <0x138 0x4>, <0x160 0xc>, <0x178 0x24>, <0x1d0 0x3c>;
+			#clock-cells = <2>;
+		};
+
+		l4per3_clkctrl: l4per3-clkctrl@14 {
+			compatible = "ti,clkctrl";
+			reg = <0x14 0x4>, <0xc8 0x14>, <0x130 0x4>;
+			#clock-cells = <2>;
+		};
 	};
 
 };
 
 &prm {
-	wkupaon_cm: wkupaon_cm@1800 {
+	wkupaon_cm: wkupaon-cm@1800 {
 		compatible = "ti,omap4-cm";
 		reg = <0x1800 0x100>;
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0 0x1800 0x100>;
 
-		wkupaon_clkctrl: clk@20 {
+		wkupaon_clkctrl: wkupaon-clkctrl@20 {
 			compatible = "ti,clkctrl";
 			reg = <0x20 0x6c>;
 			#clock-cells = <2>;
-- 
1.9.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
