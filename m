From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH] ARC: dts: Remove leading 0x from node unit addresses
Date: Mon, 18 Jun 2018 21:16:45 +0200
Message-ID: <20180618191645.15247-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Vineet Gupta <vgupta@synopsys.com>, Alexey Brodkin <abrodkin@synopsys.com>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, devicetree@vger.kernel.org, linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Joe Perches <joe@perches.com>, Krzysztof Kozlowski <krzk@kernel.org>
List-Id: devicetree@vger.kernel.org

Remove leading 0x from all node unit addresses with a sed command:

    sed -E -i -e "s/@0x([0-9a-fA-F\.]+)\s?\{/@\L\1 \{/g" arch/arc/boot/dts/*.dts*

This fixes DTC warnings like:

    Warning (unit_address_format): /cpu_card/dw-apb-gpio@0x2000: unit name should not have leading "0x"

Reported-by: Joe Perches <joe@perches.com>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arc/boot/dts/abilis_tb10x.dtsi   |  4 ++--
 arch/arc/boot/dts/axc001.dtsi         |  6 +++---
 arch/arc/boot/dts/axc003.dtsi         |  6 +++---
 arch/arc/boot/dts/axc003_idu.dtsi     |  6 +++---
 arch/arc/boot/dts/axs10x_mb.dtsi      | 22 +++++++++++-----------
 arch/arc/boot/dts/vdk_axc003.dtsi     |  4 ++--
 arch/arc/boot/dts/vdk_axc003_idu.dtsi |  4 ++--
 arch/arc/boot/dts/vdk_axs10x_mb.dtsi  | 14 +++++++-------
 8 files changed, 33 insertions(+), 33 deletions(-)

diff --git a/arch/arc/boot/dts/abilis_tb10x.dtsi b/arch/arc/boot/dts/abilis_tb10x.dtsi
index 3121536b25a3..593cdd96535d 100644
--- a/arch/arc/boot/dts/abilis_tb10x.dtsi
+++ b/arch/arc/boot/dts/abilis_tb10x.dtsi
@@ -178,7 +178,7 @@
 			clocks = <&ahb_clk>;
 		};
 
-		spi0: spi@0xFE010000 {
+		spi0: spi@fe010000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			cell-index = <0>;
@@ -189,7 +189,7 @@
 			interrupts = <26 8>;
 			clocks = <&ahb_clk>;
 		};
-		spi1: spi@0xFE011000 {
+		spi1: spi@fe011000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			cell-index = <1>;
diff --git a/arch/arc/boot/dts/axc001.dtsi b/arch/arc/boot/dts/axc001.dtsi
index fdc266504ada..37be3bf03ad6 100644
--- a/arch/arc/boot/dts/axc001.dtsi
+++ b/arch/arc/boot/dts/axc001.dtsi
@@ -41,7 +41,7 @@
 		 * this GPIO block ORs all interrupts on CPU card (creg,..)
 		 * to uplink only 1 IRQ to ARC core intc
 		 */
-		dw-apb-gpio@0x2000 {
+		dw-apb-gpio@2000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = < 0x2000 0x80 >;
 			#address-cells = <1>;
@@ -60,7 +60,7 @@
 			};
 		};
 
-		debug_uart: dw-apb-uart@0x5000 {
+		debug_uart: dw-apb-uart@5000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x5000 0x100>;
 			clock-frequency = <33333000>;
@@ -88,7 +88,7 @@
 	 * avoid duplicating the MB dtsi file given that IRQ from
 	 * this intc to cpu intc are different for axs101 and axs103
 	 */
-	mb_intc: dw-apb-ictl@0xe0012000 {
+	mb_intc: dw-apb-ictl@e0012000 {
 		#interrupt-cells = <1>;
 		compatible = "snps,dw-apb-ictl";
 		reg = < 0x0 0xe0012000 0x0 0x200 >;
diff --git a/arch/arc/boot/dts/axc003.dtsi b/arch/arc/boot/dts/axc003.dtsi
index dc91c663bcc0..817e2f5ee834 100644
--- a/arch/arc/boot/dts/axc003.dtsi
+++ b/arch/arc/boot/dts/axc003.dtsi
@@ -55,7 +55,7 @@
 		 * this GPIO block ORs all interrupts on CPU card (creg,..)
 		 * to uplink only 1 IRQ to ARC core intc
 		 */
-		dw-apb-gpio@0x2000 {
+		dw-apb-gpio@2000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = < 0x2000 0x80 >;
 			#address-cells = <1>;
@@ -74,7 +74,7 @@
 			};
 		};
 
-		debug_uart: dw-apb-uart@0x5000 {
+		debug_uart: dw-apb-uart@5000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x5000 0x100>;
 			clock-frequency = <33333000>;
@@ -106,7 +106,7 @@
 	 * avoid duplicating the MB dtsi file given that IRQ from
 	 * this intc to cpu intc are different for axs101 and axs103
 	 */
-	mb_intc: dw-apb-ictl@0xe0012000 {
+	mb_intc: dw-apb-ictl@e0012000 {
 		#interrupt-cells = <1>;
 		compatible = "snps,dw-apb-ictl";
 		reg = < 0x0 0xe0012000 0x0 0x200 >;
diff --git a/arch/arc/boot/dts/axc003_idu.dtsi b/arch/arc/boot/dts/axc003_idu.dtsi
index 69ff4895f2ba..5d912f9957fe 100644
--- a/arch/arc/boot/dts/axc003_idu.dtsi
+++ b/arch/arc/boot/dts/axc003_idu.dtsi
@@ -62,7 +62,7 @@
 		 * this GPIO block ORs all interrupts on CPU card (creg,..)
 		 * to uplink only 1 IRQ to ARC core intc
 		 */
-		dw-apb-gpio@0x2000 {
+		dw-apb-gpio@2000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = < 0x2000 0x80 >;
 			#address-cells = <1>;
@@ -81,7 +81,7 @@
 			};
 		};
 
-		debug_uart: dw-apb-uart@0x5000 {
+		debug_uart: dw-apb-uart@5000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x5000 0x100>;
 			clock-frequency = <33333000>;
@@ -112,7 +112,7 @@
 	 * avoid duplicating the MB dtsi file given that IRQ from
 	 * this intc to cpu intc are different for axs101 and axs103
 	 */
-	mb_intc: dw-apb-ictl@0xe0012000 {
+	mb_intc: dw-apb-ictl@e0012000 {
 		#interrupt-cells = <1>;
 		compatible = "snps,dw-apb-ictl";
 		reg = < 0x0 0xe0012000 0x0 0x200 >;
diff --git a/arch/arc/boot/dts/axs10x_mb.dtsi b/arch/arc/boot/dts/axs10x_mb.dtsi
index 47b74fbc403c..c550364e0550 100644
--- a/arch/arc/boot/dts/axs10x_mb.dtsi
+++ b/arch/arc/boot/dts/axs10x_mb.dtsi
@@ -68,7 +68,7 @@
 			};
 		};
 
-		ethernet@0x18000 {
+		ethernet@18000 {
 			#interrupt-cells = <1>;
 			compatible = "snps,dwmac";
 			reg = < 0x18000 0x2000 >;
@@ -83,13 +83,13 @@
 			reset-names = "stmmaceth";
 		};
 
-		ehci@0x40000 {
+		ehci@40000 {
 			compatible = "generic-ehci";
 			reg = < 0x40000 0x100 >;
 			interrupts = < 8 >;
 		};
 
-		ohci@0x60000 {
+		ohci@60000 {
 			compatible = "generic-ohci";
 			reg = < 0x60000 0x100 >;
 			interrupts = < 8 >;
@@ -113,7 +113,7 @@
 		 * dw_mci_pltfm_prepare_command() is used in generic platform
 		 * code.
 		 */
-		mmc@0x15000 {
+		mmc@15000 {
 			compatible = "altr,socfpga-dw-mshc";
 			reg = < 0x15000 0x400 >;
 			fifo-depth = < 16 >;
@@ -124,7 +124,7 @@
 			bus-width = < 4 >;
 		};
 
-		uart@0x20000 {
+		uart@20000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x20000 0x100>;
 			clock-frequency = <33333333>;
@@ -134,7 +134,7 @@
 			reg-io-width = <4>;
 		};
 
-		uart@0x21000 {
+		uart@21000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x21000 0x100>;
 			clock-frequency = <33333333>;
@@ -145,7 +145,7 @@
 		};
 
 		/* UART muxed with USB data port (ttyS3) */
-		uart@0x22000 {
+		uart@22000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x22000 0x100>;
 			clock-frequency = <33333333>;
@@ -155,7 +155,7 @@
 			reg-io-width = <4>;
 		};
 
-		i2c@0x1d000 {
+		i2c@1d000 {
 			compatible = "snps,designware-i2c";
 			reg = <0x1d000 0x100>;
 			clock-frequency = <400000>;
@@ -172,7 +172,7 @@
 			#sound-dai-cells = <0>;
 		};
 
-		i2c@0x1f000 {
+		i2c@1f000 {
 			compatible = "snps,designware-i2c";
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -213,13 +213,13 @@
 				};
 			};
 
-			eeprom@0x54{
+			eeprom@54 {
 				compatible = "atmel,24c01";
 				reg = <0x54>;
 				pagesize = <0x8>;
 			};
 
-			eeprom@0x57{
+			eeprom@57 {
 				compatible = "atmel,24c04";
 				reg = <0x57>;
 				pagesize = <0x8>;
diff --git a/arch/arc/boot/dts/vdk_axc003.dtsi b/arch/arc/boot/dts/vdk_axc003.dtsi
index 0fd6ba985b16..84e8766c8ca2 100644
--- a/arch/arc/boot/dts/vdk_axc003.dtsi
+++ b/arch/arc/boot/dts/vdk_axc003.dtsi
@@ -36,7 +36,7 @@
 			#interrupt-cells = <1>;
 		};
 
-		debug_uart: dw-apb-uart@0x5000 {
+		debug_uart: dw-apb-uart@5000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x5000 0x100>;
 			clock-frequency = <2403200>;
@@ -49,7 +49,7 @@
 
 	};
 
-	mb_intc: dw-apb-ictl@0xe0012000 {
+	mb_intc: dw-apb-ictl@e0012000 {
 		#interrupt-cells = <1>;
 		compatible = "snps,dw-apb-ictl";
 		reg = < 0xe0012000 0x200 >;
diff --git a/arch/arc/boot/dts/vdk_axc003_idu.dtsi b/arch/arc/boot/dts/vdk_axc003_idu.dtsi
index 28956f9a9f3d..eb7e705e8a27 100644
--- a/arch/arc/boot/dts/vdk_axc003_idu.dtsi
+++ b/arch/arc/boot/dts/vdk_axc003_idu.dtsi
@@ -44,7 +44,7 @@
 			#interrupt-cells = <1>;
 		};
 
-		debug_uart: dw-apb-uart@0x5000 {
+		debug_uart: dw-apb-uart@5000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x5000 0x100>;
 			clock-frequency = <2403200>;
@@ -57,7 +57,7 @@
 
 	};
 
-	mb_intc: dw-apb-ictl@0xe0012000 {
+	mb_intc: dw-apb-ictl@e0012000 {
 		#interrupt-cells = <1>;
 		compatible = "snps,dw-apb-ictl";
 		reg = < 0xe0012000 0x200 >;
diff --git a/arch/arc/boot/dts/vdk_axs10x_mb.dtsi b/arch/arc/boot/dts/vdk_axs10x_mb.dtsi
index 48bb4b4cd234..f21ade2931eb 100644
--- a/arch/arc/boot/dts/vdk_axs10x_mb.dtsi
+++ b/arch/arc/boot/dts/vdk_axs10x_mb.dtsi
@@ -36,7 +36,7 @@
 			};
 		};
 
-		ethernet@0x18000 {
+		ethernet@18000 {
 			#interrupt-cells = <1>;
 			compatible = "snps,dwmac";
 			reg = < 0x18000 0x2000 >;
@@ -49,13 +49,13 @@
 			clock-names = "stmmaceth";
 		};
 
-		ehci@0x40000 {
+		ehci@40000 {
 			compatible = "generic-ehci";
 			reg = < 0x40000 0x100 >;
 			interrupts = < 8 >;
 		};
 
-		uart@0x20000 {
+		uart@20000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x20000 0x100>;
 			clock-frequency = <2403200>;
@@ -65,7 +65,7 @@
 			reg-io-width = <4>;
 		};
 
-		uart@0x21000 {
+		uart@21000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x21000 0x100>;
 			clock-frequency = <2403200>;
@@ -75,7 +75,7 @@
 			reg-io-width = <4>;
 		};
 
-		uart@0x22000 {
+		uart@22000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x22000 0x100>;
 			clock-frequency = <2403200>;
@@ -101,7 +101,7 @@
 			interrupt-names = "arc_ps2_irq";
 		};
 
-		mmc@0x15000 {
+		mmc@15000 {
 			compatible = "snps,dw-mshc";
 			reg = <0x15000 0x400>;
 			fifo-depth = <1024>;
@@ -119,7 +119,7 @@
 	 * This node is intentionally put outside of MB above becase
 	 * it maps areas outside of MB's 0xEz-0xFz.
 	 */
-	uio_ev: uio@0xD0000000 {
+	uio_ev: uio@d0000000 {
 		compatible = "generic-uio";
 		reg = <0xD0000000 0x2000 0xD1000000 0x2000 0x90000000 0x10000000 0xC0000000 0x10000000>;
 		reg-names = "ev_gsa", "ev_ctrl", "ev_shared_mem", "ev_code_mem";
-- 
2.14.1
