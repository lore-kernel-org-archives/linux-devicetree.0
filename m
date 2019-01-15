Return-Path: <dinguyen@kernel.org>
From: Dinh Nguyen <dinguyen@kernel.org>
Subject: [PATCH] ARM: dts: socfpga: update missing reset property peripherals
Date: Tue, 15 Jan 2019 10:20:49 -0600
Message-Id: <20190115162049.743-1-dinguyen@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: robh+dt@kernel.org, mark.rutland@arm.com
Cc: dinguyen@kernel.org, simon.k.r.goldschmidt@gmail.com, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Add reset property for gpio, i2c, sdmmc, nand, qspi, spi, uart, and
watchdog on base socfpga and socfpga_arria10.

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
 arch/arm/boot/dts/socfpga.dtsi         | 12 ++++++++++++
 arch/arm/boot/dts/socfpga_arria10.dtsi | 18 ++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/arch/arm/boot/dts/socfpga.dtsi b/arch/arm/boot/dts/socfpga.dtsi
index dcb8fba3d709..f365003f0102 100644
--- a/arch/arm/boot/dts/socfpga.dtsi
+++ b/arch/arm/boot/dts/socfpga.dtsi
@@ -585,6 +585,7 @@
 			compatible = "snps,dw-apb-gpio";
 			reg = <0xff708000 0x1000>;
 			clocks = <&l4_mp_clk>;
+			resets = <&rst GPIO0_RESET>;
 			status = "disabled";
 
 			porta: gpio-controller@0 {
@@ -605,6 +606,7 @@
 			compatible = "snps,dw-apb-gpio";
 			reg = <0xff709000 0x1000>;
 			clocks = <&l4_mp_clk>;
+			resets = <&rst GPIO1_RESET>;
 			status = "disabled";
 
 			portb: gpio-controller@0 {
@@ -625,6 +627,7 @@
 			compatible = "snps,dw-apb-gpio";
 			reg = <0xff70a000 0x1000>;
 			clocks = <&l4_mp_clk>;
+			resets = <&rst GPIO2_RESET>;
 			status = "disabled";
 
 			portc: gpio-controller@0 {
@@ -735,6 +738,7 @@
 			#size-cells = <0>;
 			clocks = <&l4_mp_clk>, <&sdmmc_clk_divided>;
 			clock-names = "biu", "ciu";
+			resets = <&rst SDMMC_RESET>;
 			status = "disabled";
 		};
 
@@ -748,6 +752,7 @@
 			interrupts = <0x0 0x90 0x4>;
 			clocks = <&nand_clk>, <&nand_x_clk>, <&nand_ecc_clk>;
 			clock-names = "nand", "nand_x", "ecc";
+			resets = <&rst NAND_RESET>;
 			status = "disabled";
 		};
 
@@ -767,6 +772,7 @@
 			cdns,fifo-width = <4>;
 			cdns,trigger-address = <0x00000000>;
 			clocks = <&qspi_clk>;
+			resets = <&rst QSPI_RESET>;
 			status = "disabled";
 		};
 
@@ -801,6 +807,7 @@
 			interrupts = <0 154 4>;
 			num-cs = <4>;
 			clocks = <&spi_m_clk>;
+			resets = <&rst SPIM0_RESET>;
 			status = "disabled";
 		};
 
@@ -812,6 +819,7 @@
 			interrupts = <0 155 4>;
 			num-cs = <4>;
 			clocks = <&spi_m_clk>;
+			resets = <&rst SPIM1_RESET>;
 			status = "disabled";
 		};
 
@@ -878,6 +886,7 @@
 			dmas = <&pdma 28>,
 			       <&pdma 29>;
 			dma-names = "tx", "rx";
+			resets = <&rst UART0_RESET>;
 		};
 
 		uart1: serial1@ffc03000 {
@@ -890,6 +899,7 @@
 			dmas = <&pdma 30>,
 			       <&pdma 31>;
 			dma-names = "tx", "rx";
+			resets = <&rst UART1_RESET>;
 		};
 
 		usbphy0: usbphy {
@@ -929,6 +939,7 @@
 			reg = <0xffd02000 0x1000>;
 			interrupts = <0 171 4>;
 			clocks = <&osc1>;
+			resets = <&rst L4WD0_RESET>;
 			status = "disabled";
 		};
 
@@ -937,6 +948,7 @@
 			reg = <0xffd03000 0x1000>;
 			interrupts = <0 172 4>;
 			clocks = <&osc1>;
+			resets = <&rst L4WD1_RESET>;
 			status = "disabled";
 		};
 	};
diff --git a/arch/arm/boot/dts/socfpga_arria10.dtsi b/arch/arm/boot/dts/socfpga_arria10.dtsi
index e41fa23481c3..ae24599d5829 100644
--- a/arch/arm/boot/dts/socfpga_arria10.dtsi
+++ b/arch/arm/boot/dts/socfpga_arria10.dtsi
@@ -470,6 +470,7 @@
 			tx-fifo-depth = <4096>;
 			rx-fifo-depth = <16384>;
 			clocks = <&l4_mp_clk>;
+			resets = <&rst EMAC2_RESET>;
 			clock-names = "stmmaceth";
 			snps,axi-config = <&socfpga_axi_setup>;
 			status = "disabled";
@@ -480,6 +481,7 @@
 			#size-cells = <0>;
 			compatible = "snps,dw-apb-gpio";
 			reg = <0xffc02900 0x100>;
+			resets = <&rst GPIO0_RESET>;
 			status = "disabled";
 
 			porta: gpio-controller@0 {
@@ -499,6 +501,7 @@
 			#size-cells = <0>;
 			compatible = "snps,dw-apb-gpio";
 			reg = <0xffc02a00 0x100>;
+			resets = <&rst GPIO1_RESET>;
 			status = "disabled";
 
 			portb: gpio-controller@0 {
@@ -518,6 +521,7 @@
 			#size-cells = <0>;
 			compatible = "snps,dw-apb-gpio";
 			reg = <0xffc02b00 0x100>;
+			resets = <&rst GPIO2_RESET>;
 			status = "disabled";
 
 			portc: gpio-controller@0 {
@@ -548,6 +552,7 @@
 			reg = <0xffc02200 0x100>;
 			interrupts = <0 105 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&l4_sp_clk>;
+			resets = <&rst I2C0_RESET>;
 			status = "disabled";
 		};
 
@@ -558,6 +563,7 @@
 			reg = <0xffc02300 0x100>;
 			interrupts = <0 106 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&l4_sp_clk>;
+			resets = <&rst I2C1_RESET>;
 			status = "disabled";
 		};
 
@@ -568,6 +574,7 @@
 			reg = <0xffc02400 0x100>;
 			interrupts = <0 107 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&l4_sp_clk>;
+			resets = <&rst I2C2_RESET>;
 			status = "disabled";
 		};
 
@@ -578,6 +585,7 @@
 			reg = <0xffc02500 0x100>;
 			interrupts = <0 108 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&l4_sp_clk>;
+			resets = <&rst I2C3_RESET>;
 			status = "disabled";
 		};
 
@@ -588,6 +596,7 @@
 			reg = <0xffc02600 0x100>;
 			interrupts = <0 109 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&l4_sp_clk>;
+			resets = <&rst I2C4_RESET>;
 			status = "disabled";
 		};
 
@@ -600,6 +609,7 @@
 			num-cs = <4>;
 			/*32bit_access;*/
 			clocks = <&spi_m_clk>;
+			resets = <&rst SPIM0_RESET>;
 			status = "disabled";
 		};
 
@@ -614,6 +624,7 @@
 			tx-dma-channel = <&pdma 16>;
 			rx-dma-channel = <&pdma 17>;
 			clocks = <&spi_m_clk>;
+			resets = <&rst SPIM1_RESET>;
 			status = "disabled";
 		};
 
@@ -642,6 +653,7 @@
 			fifo-depth = <0x400>;
 			clocks = <&l4_mp_clk>, <&sdmmc_clk>;
 			clock-names = "biu", "ciu";
+			resets = <&rst SDMMC_RESET>;
 			status = "disabled";
 		};
 
@@ -655,6 +667,7 @@
 			interrupts = <0 99 4>;
 			clocks = <&nand_clk>, <&nand_x_clk>, <&nand_ecc_clk>;
 			clock-names = "nand", "nand_x", "ecc";
+			resets = <&rst NAND_RESET>;
 			status = "disabled";
 		};
 
@@ -739,6 +752,7 @@
 			cdns,fifo-width = <4>;
 			cdns,trigger-address = <0x00000000>;
 			clocks = <&qspi_clk>;
+			resets = <&rst QSPI_RESET>;
 			status = "disabled";
 		};
 
@@ -815,6 +829,7 @@
 			reg-shift = <2>;
 			reg-io-width = <4>;
 			clocks = <&l4_sp_clk>;
+			resets = <&rst UART0_RESET>;
 			status = "disabled";
 		};
 
@@ -825,6 +840,7 @@
 			reg-shift = <2>;
 			reg-io-width = <4>;
 			clocks = <&l4_sp_clk>;
+			resets = <&rst UART1_RESET>;
 			status = "disabled";
 		};
 
@@ -865,6 +881,7 @@
 			reg = <0xffd00200 0x100>;
 			interrupts = <0 119 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&l4_sys_free_clk>;
+			resets = <&rst L4WD0_RESET>;
 			status = "disabled";
 		};
 
@@ -873,6 +890,7 @@
 			reg = <0xffd00300 0x100>;
 			interrupts = <0 120 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&l4_sys_free_clk>;
+			resets = <&rst L4WD1_RESET>;
 			status = "disabled";
 		};
 	};
-- 
2.20.0
