From: Mathieu Malaterre <malat-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] dts: Remove leading 0x and 0s from bindings notation
Date: Wed, 13 Dec 2017 22:07:01 +0100
Message-ID: <20171213210701.13311-1-malat@debian.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>, Mathieu Malaterre <malat-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Improve the DTS files by removing all the leading "0x" and zeros to fix the
following dtc warnings:

Warning (unit_address_format): Node /XXX unit name should not have leading "0x"

and

Warning (unit_address_format): Node /XXX unit name should not have leading 0s

Converted using the following command:

find . -type f \( -iname *.dts -o -iname *.dtsi \) -exec sed -E -i -e "s/@0x([0-9a-fA-F\.]+)[[:space:]]?\{/@\L\1 \{/g" -e "s/@0+([0-9a-fA-F\.]+)([[:space:]]?\{)/@\L\1 \{/g" {} +

For simplicity, two sed expressions were used to solve each warnings separately.

To make the regex expression more robust a few other issues were resolved,
namely setting unit-address to lower case, and adding a whitespace before the
the opening curly brace:

https://elinux.org/Device_Tree_Linux#Linux_conventions

This is a follow up to commit 4c9847b7375a ("dt-bindings: Remove leading 0x from bindings notation")

Reported-by: David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Suggested-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Mathieu Malaterre <malat-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
---
 arch/arc/boot/dts/abilis_tb10x.dtsi            |  4 +--
 arch/arc/boot/dts/axc001.dtsi                  |  6 ++---
 arch/arc/boot/dts/axc003.dtsi                  |  6 ++---
 arch/arc/boot/dts/axc003_idu.dtsi              |  6 ++---
 arch/arc/boot/dts/axs10x_mb.dtsi               | 22 ++++++++--------
 arch/arc/boot/dts/vdk_axc003.dtsi              |  4 +--
 arch/arc/boot/dts/vdk_axc003_idu.dtsi          |  4 +--
 arch/arc/boot/dts/vdk_axs10x_mb.dtsi           | 14 +++++-----
 arch/arm/boot/dts/am3517.dtsi                  |  4 +--
 arch/arm/boot/dts/arm-realview-eb.dtsi         | 18 ++++++-------
 arch/arm/boot/dts/arm-realview-pb1176.dts      | 18 ++++++-------
 arch/arm/boot/dts/arm-realview-pb11mp.dts      | 18 ++++++-------
 arch/arm/boot/dts/arm-realview-pbx.dtsi        | 18 ++++++-------
 arch/arm/boot/dts/artpec6.dtsi                 |  2 +-
 arch/arm/boot/dts/at91sam9261.dtsi             |  2 +-
 arch/arm/boot/dts/at91sam9261ek.dts            |  2 +-
 arch/arm/boot/dts/at91sam9263.dtsi             |  2 +-
 arch/arm/boot/dts/at91sam9263ek.dts            |  2 +-
 arch/arm/boot/dts/at91sam9g25ek.dts            |  2 +-
 arch/arm/boot/dts/at91sam9g45.dtsi             |  2 +-
 arch/arm/boot/dts/at91sam9m10g45ek.dts         |  2 +-
 arch/arm/boot/dts/atlas7.dtsi                  | 12 ++++-----
 arch/arm/boot/dts/bcm11351.dtsi                |  2 +-
 arch/arm/boot/dts/bcm21664.dtsi                |  2 +-
 arch/arm/boot/dts/bcm283x.dtsi                 |  2 +-
 arch/arm/boot/dts/da850-lcdk.dts               |  4 +--
 arch/arm/boot/dts/dm8148-evm.dts               |  8 +++---
 arch/arm/boot/dts/dm8168-evm.dts               |  8 +++---
 arch/arm/boot/dts/dra62x-j5eco-evm.dts         |  8 +++---
 arch/arm/boot/dts/exynos5420.dtsi              | 36 +++++++++++++-------------
 arch/arm/boot/dts/exynos5422-odroid-core.dtsi  |  2 +-
 arch/arm/boot/dts/imx7d.dtsi                   |  2 +-
 arch/arm/boot/dts/keystone-k2e-netcp.dtsi      |  2 +-
 arch/arm/boot/dts/keystone-k2hk-netcp.dtsi     |  2 +-
 arch/arm/boot/dts/keystone-k2l-netcp.dtsi      |  2 +-
 arch/arm/boot/dts/omap3-cm-t3x.dtsi            |  8 +++---
 arch/arm/boot/dts/omap3-evm-37xx.dts           |  8 +++---
 arch/arm/boot/dts/omap3-lilly-a83x.dtsi        |  8 +++---
 arch/arm/boot/dts/s3c2416.dtsi                 |  2 +-
 arch/arm/boot/dts/sama5d3xmb.dtsi              |  2 +-
 arch/arm/boot/dts/sama5d3xmb_cmp.dtsi          |  2 +-
 arch/arm/boot/dts/socfpga.dtsi                 |  2 +-
 arch/arm/boot/dts/spear300.dtsi                |  2 +-
 arch/arm/boot/dts/spear310.dtsi                |  2 +-
 arch/arm/boot/dts/spear320.dtsi                |  2 +-
 arch/arm/boot/dts/versatile-ab.dts             | 16 ++++++------
 arch/arm/boot/dts/zx296702.dtsi                | 20 +++++++-------
 arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts |  2 +-
 arch/arm64/boot/dts/mediatek/mt8173.dtsi       |  2 +-
 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi   |  6 ++---
 arch/arm64/boot/dts/qcom/msm8996.dtsi          |  6 ++---
 arch/c6x/boot/dts/dsk6455.dts                  |  2 +-
 arch/c6x/boot/dts/tms320c6455.dtsi             |  2 +-
 arch/metag/boot/dts/tz1090.dtsi                | 10 +++----
 arch/mips/boot/dts/img/boston.dts              |  2 +-
 arch/mips/boot/dts/ingenic/ci20.dts            |  8 +++---
 arch/nios2/boot/dts/3c120_devboard.dts         | 16 ++++++------
 arch/powerpc/boot/dts/a3m071.dts               | 10 +++----
 arch/powerpc/boot/dts/akebono.dts              |  4 +--
 arch/powerpc/boot/dts/c2k.dts                  |  6 ++---
 arch/powerpc/boot/dts/currituck.dts            |  2 +-
 arch/powerpc/boot/dts/fsl/mpc8568mds.dts       | 12 ++++-----
 arch/powerpc/boot/dts/fsl/mpc8569mds.dts       | 20 +++++++-------
 arch/powerpc/boot/dts/fsl/p1021mds.dts         |  6 ++---
 arch/powerpc/boot/dts/fsl/p1025rdb.dtsi        |  8 +++---
 arch/powerpc/boot/dts/fsl/p1025rdb_32b.dts     |  2 +-
 arch/powerpc/boot/dts/fsl/p1025twr.dtsi        |  8 +++---
 arch/powerpc/boot/dts/fsl/t1040rdb.dts         |  2 +-
 arch/powerpc/boot/dts/fsl/t1042d4rdb.dts       | 10 +++----
 arch/powerpc/boot/dts/fsl/t1042rdb.dts         |  2 +-
 arch/powerpc/boot/dts/fsl/t104xrdb.dtsi        |  6 ++---
 arch/powerpc/boot/dts/fsp2.dts                 |  6 ++---
 arch/powerpc/boot/dts/gamecube.dts             | 14 +++++-----
 arch/powerpc/boot/dts/haleakala.dts            |  2 +-
 arch/powerpc/boot/dts/kilauea.dts              |  4 +--
 arch/powerpc/boot/dts/kmeter1.dts              | 10 +++----
 arch/powerpc/boot/dts/makalu.dts               |  4 +--
 arch/powerpc/boot/dts/mpc832x_mds.dts          | 10 +++----
 arch/powerpc/boot/dts/mpc832x_rdb.dts          |  8 +++---
 arch/powerpc/boot/dts/mpc836x_mds.dts          |  8 +++---
 arch/powerpc/boot/dts/sbc8548-altflash.dts     |  8 +++---
 arch/powerpc/boot/dts/sbc8548.dts              |  8 +++---
 arch/powerpc/boot/dts/wii.dts                  | 32 +++++++++++------------
 arch/xtensa/boot/dts/csp.dts                   |  2 +-
 arch/xtensa/boot/dts/xtfpga-flash-128m.dtsi    | 10 +++----
 arch/xtensa/boot/dts/xtfpga-flash-16m.dtsi     | 10 +++----
 arch/xtensa/boot/dts/xtfpga-flash-4m.dtsi      |  6 ++---
 arch/xtensa/boot/dts/xtfpga.dtsi               | 10 +++----
 88 files changed, 315 insertions(+), 315 deletions(-)

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
index 4e6e9f57e790..f33694d08e1f 100644
--- a/arch/arc/boot/dts/axc003.dtsi
+++ b/arch/arc/boot/dts/axc003.dtsi
@@ -47,7 +47,7 @@
 		 * this GPIO block ORs all interrupts on CPU card (creg,..)
 		 * to uplink only 1 IRQ to ARC core intc
 		 */
-		dw-apb-gpio@0x2000 {
+		dw-apb-gpio@2000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = < 0x2000 0x80 >;
 			#address-cells = <1>;
@@ -66,7 +66,7 @@
 			};
 		};
 
-		debug_uart: dw-apb-uart@0x5000 {
+		debug_uart: dw-apb-uart@5000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x5000 0x100>;
 			clock-frequency = <33333000>;
@@ -98,7 +98,7 @@
 	 * avoid duplicating the MB dtsi file given that IRQ from
 	 * this intc to cpu intc are different for axs101 and axs103
 	 */
-	mb_intc: dw-apb-ictl@0xe0012000 {
+	mb_intc: dw-apb-ictl@e0012000 {
 		#interrupt-cells = <1>;
 		compatible = "snps,dw-apb-ictl";
 		reg = < 0x0 0xe0012000 0x0 0x200 >;
diff --git a/arch/arc/boot/dts/axc003_idu.dtsi b/arch/arc/boot/dts/axc003_idu.dtsi
index 63954a8b0100..256790bbd4a0 100644
--- a/arch/arc/boot/dts/axc003_idu.dtsi
+++ b/arch/arc/boot/dts/axc003_idu.dtsi
@@ -54,7 +54,7 @@
 		 * this GPIO block ORs all interrupts on CPU card (creg,..)
 		 * to uplink only 1 IRQ to ARC core intc
 		 */
-		dw-apb-gpio@0x2000 {
+		dw-apb-gpio@2000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = < 0x2000 0x80 >;
 			#address-cells = <1>;
@@ -73,7 +73,7 @@
 			};
 		};
 
-		debug_uart: dw-apb-uart@0x5000 {
+		debug_uart: dw-apb-uart@5000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x5000 0x100>;
 			clock-frequency = <33333000>;
@@ -104,7 +104,7 @@
 	 * avoid duplicating the MB dtsi file given that IRQ from
 	 * this intc to cpu intc are different for axs101 and axs103
 	 */
-	mb_intc: dw-apb-ictl@0xe0012000 {
+	mb_intc: dw-apb-ictl@e0012000 {
 		#interrupt-cells = <1>;
 		compatible = "snps,dw-apb-ictl";
 		reg = < 0x0 0xe0012000 0x0 0x200 >;
diff --git a/arch/arc/boot/dts/axs10x_mb.dtsi b/arch/arc/boot/dts/axs10x_mb.dtsi
index 74d070cd3c13..e4c64c05e32f 100644
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
 				compatible = "24c01";
 				reg = <0x54>;
 				pagesize = <0x8>;
 			};
 
-			eeprom@0x57{
+			eeprom@57 {
 				compatible = "24c04";
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
diff --git a/arch/arm/boot/dts/am3517.dtsi b/arch/arm/boot/dts/am3517.dtsi
index 00da3f2c4072..76994165fb3a 100644
--- a/arch/arm/boot/dts/am3517.dtsi
+++ b/arch/arm/boot/dts/am3517.dtsi
@@ -26,7 +26,7 @@
 			interrupt-names = "mc";
 		};
 
-		davinci_emac: ethernet@0x5c000000 {
+		davinci_emac: ethernet@5c000000 {
 			compatible = "ti,am3517-emac";
 			ti,hwmods = "davinci_emac";
 			status = "disabled";
@@ -41,7 +41,7 @@
 			local-mac-address = [ 00 00 00 00 00 00 ];
 		};
 
-		davinci_mdio: ethernet@0x5c030000 {
+		davinci_mdio: ethernet@5c030000 {
 			compatible = "ti,davinci_mdio";
 			ti,hwmods = "davinci_mdio";
 			status = "disabled";
diff --git a/arch/arm/boot/dts/arm-realview-eb.dtsi b/arch/arm/boot/dts/arm-realview-eb.dtsi
index e2e9599596e2..f92fb6debc13 100644
--- a/arch/arm/boot/dts/arm-realview-eb.dtsi
+++ b/arch/arm/boot/dts/arm-realview-eb.dtsi
@@ -154,7 +154,7 @@
 			compatible = "arm,realview-eb-syscon", "syscon", "simple-mfd";
 			reg = <0x10000000 0x1000>;
 
-			led@08.0 {
+			led@8.0 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x01>;
@@ -162,7 +162,7 @@
 				linux,default-trigger = "heartbeat";
 				default-state = "on";
 			};
-			led@08.1 {
+			led@8.1 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x02>;
@@ -170,7 +170,7 @@
 				linux,default-trigger = "mmc0";
 				default-state = "off";
 			};
-			led@08.2 {
+			led@8.2 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x04>;
@@ -178,42 +178,42 @@
 				linux,default-trigger = "cpu0";
 				default-state = "off";
 			};
-			led@08.3 {
+			led@8.3 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x08>;
 				label = "versatile:3";
 				default-state = "off";
 			};
-			led@08.4 {
+			led@8.4 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x10>;
 				label = "versatile:4";
 				default-state = "off";
 			};
-			led@08.5 {
+			led@8.5 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x20>;
 				label = "versatile:5";
 				default-state = "off";
 			};
-			led@08.6 {
+			led@8.6 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x40>;
 				label = "versatile:6";
 				default-state = "off";
 			};
-			led@08.7 {
+			led@8.7 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x80>;
 				label = "versatile:7";
 				default-state = "off";
 			};
-			oscclk0: osc0@0c {
+			oscclk0: osc0@c {
 				compatible = "arm,syscon-icst307";
 				#clock-cells = <0>;
 				lock-offset = <0x20>;
diff --git a/arch/arm/boot/dts/arm-realview-pb1176.dts b/arch/arm/boot/dts/arm-realview-pb1176.dts
index c789564f2803..c918949d7c21 100644
--- a/arch/arm/boot/dts/arm-realview-pb1176.dts
+++ b/arch/arm/boot/dts/arm-realview-pb1176.dts
@@ -172,7 +172,7 @@
 			compatible = "arm,realview-pb1176-syscon", "syscon", "simple-mfd";
 			reg = <0x10000000 0x1000>;
 
-			led@08.0 {
+			led@8.0 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x01>;
@@ -180,7 +180,7 @@
 				linux,default-trigger = "heartbeat";
 				default-state = "on";
 			};
-			led@08.1 {
+			led@8.1 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x02>;
@@ -188,7 +188,7 @@
 				linux,default-trigger = "mmc0";
 				default-state = "off";
 			};
-			led@08.2 {
+			led@8.2 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x04>;
@@ -196,42 +196,42 @@
 				linux,default-trigger = "cpu0";
 				default-state = "off";
 			};
-			led@08.3 {
+			led@8.3 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x08>;
 				label = "versatile:3";
 				default-state = "off";
 			};
-			led@08.4 {
+			led@8.4 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x10>;
 				label = "versatile:4";
 				default-state = "off";
 			};
-			led@08.5 {
+			led@8.5 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x20>;
 				label = "versatile:5";
 				default-state = "off";
 			};
-			led@08.6 {
+			led@8.6 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x40>;
 				label = "versatile:6";
 				default-state = "off";
 			};
-			led@08.7 {
+			led@8.7 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x80>;
 				label = "versatile:7";
 				default-state = "off";
 			};
-			oscclk0: osc0@0c {
+			oscclk0: osc0@c {
 				compatible = "arm,syscon-icst307";
 				#clock-cells = <0>;
 				lock-offset = <0x20>;
diff --git a/arch/arm/boot/dts/arm-realview-pb11mp.dts b/arch/arm/boot/dts/arm-realview-pb11mp.dts
index 3944765ac4b0..12c3fb69038a 100644
--- a/arch/arm/boot/dts/arm-realview-pb11mp.dts
+++ b/arch/arm/boot/dts/arm-realview-pb11mp.dts
@@ -253,7 +253,7 @@
 			compatible = "arm,realview-pb11mp-syscon", "syscon", "simple-mfd";
 			reg = <0x10000000 0x1000>;
 
-			led@08.0 {
+			led@8.0 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x01>;
@@ -261,7 +261,7 @@
 				linux,default-trigger = "heartbeat";
 				default-state = "on";
 			};
-			led@08.1 {
+			led@8.1 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x02>;
@@ -269,7 +269,7 @@
 				linux,default-trigger = "mmc0";
 				default-state = "off";
 			};
-			led@08.2 {
+			led@8.2 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x04>;
@@ -277,7 +277,7 @@
 				linux,default-trigger = "cpu0";
 				default-state = "off";
 			};
-			led@08.3 {
+			led@8.3 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x08>;
@@ -285,7 +285,7 @@
 				linux,default-trigger = "cpu1";
 				default-state = "off";
 			};
-			led@08.4 {
+			led@8.4 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x10>;
@@ -293,7 +293,7 @@
 				linux,default-trigger = "cpu2";
 				default-state = "off";
 			};
-			led@08.5 {
+			led@8.5 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x20>;
@@ -301,14 +301,14 @@
 				linux,default-trigger = "cpu3";
 				default-state = "off";
 			};
-			led@08.6 {
+			led@8.6 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x40>;
 				label = "versatile:6";
 				default-state = "off";
 			};
-			led@08.7 {
+			led@8.7 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x80>;
@@ -316,7 +316,7 @@
 				default-state = "off";
 			};
 
-			oscclk0: osc0@0c {
+			oscclk0: osc0@c {
 				compatible = "arm,syscon-icst307";
 				#clock-cells = <0>;
 				lock-offset = <0x20>;
diff --git a/arch/arm/boot/dts/arm-realview-pbx.dtsi b/arch/arm/boot/dts/arm-realview-pbx.dtsi
index aeb49c4bd773..ae080739229e 100644
--- a/arch/arm/boot/dts/arm-realview-pbx.dtsi
+++ b/arch/arm/boot/dts/arm-realview-pbx.dtsi
@@ -169,7 +169,7 @@
 			compatible = "arm,realview-pbx-syscon", "syscon", "simple-mfd";
 			reg = <0x10000000 0x1000>;
 
-			led@08.0 {
+			led@8.0 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x01>;
@@ -177,7 +177,7 @@
 				linux,default-trigger = "heartbeat";
 				default-state = "on";
 			};
-			led@08.1 {
+			led@8.1 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x02>;
@@ -185,7 +185,7 @@
 				linux,default-trigger = "mmc0";
 				default-state = "off";
 			};
-			led@08.2 {
+			led@8.2 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x04>;
@@ -193,42 +193,42 @@
 				linux,default-trigger = "cpu0";
 				default-state = "off";
 			};
-			led@08.3 {
+			led@8.3 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x08>;
 				label = "versatile:3";
 				default-state = "off";
 			};
-			led@08.4 {
+			led@8.4 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x10>;
 				label = "versatile:4";
 				default-state = "off";
 			};
-			led@08.5 {
+			led@8.5 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x20>;
 				label = "versatile:5";
 				default-state = "off";
 			};
-			led@08.6 {
+			led@8.6 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x40>;
 				label = "versatile:6";
 				default-state = "off";
 			};
-			led@08.7 {
+			led@8.7 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x80>;
 				label = "versatile:7";
 				default-state = "off";
 			};
-			oscclk0: osc0@0c {
+			oscclk0: osc0@c {
 				compatible = "arm,syscon-icst307";
 				#clock-cells = <0>;
 				lock-offset = <0x20>;
diff --git a/arch/arm/boot/dts/artpec6.dtsi b/arch/arm/boot/dts/artpec6.dtsi
index 2ed11773048d..71e0e75e986b 100644
--- a/arch/arm/boot/dts/artpec6.dtsi
+++ b/arch/arm/boot/dts/artpec6.dtsi
@@ -98,7 +98,7 @@
 		clock-frequency = <125000000>;
 	};
 
-	clkctrl: clkctrl@0xf8000000 {
+	clkctrl: clkctrl@f8000000 {
 		#clock-cells = <1>;
 		compatible = "axis,artpec6-clkctrl";
 		reg = <0xf8000000 0x48>;
diff --git a/arch/arm/boot/dts/at91sam9261.dtsi b/arch/arm/boot/dts/at91sam9261.dtsi
index 66876019101d..eb186245fb4c 100644
--- a/arch/arm/boot/dts/at91sam9261.dtsi
+++ b/arch/arm/boot/dts/at91sam9261.dtsi
@@ -80,7 +80,7 @@
 			status = "disabled";
 		};
 
-		fb0: fb@0x00600000 {
+		fb0: fb@600000 {
 			compatible = "atmel,at91sam9261-lcdc";
 			reg = <0x00600000 0x1000>;
 			interrupts = <21 IRQ_TYPE_LEVEL_HIGH 3>;
diff --git a/arch/arm/boot/dts/at91sam9261ek.dts b/arch/arm/boot/dts/at91sam9261ek.dts
index 960d6940ebf6..9733db3f739b 100644
--- a/arch/arm/boot/dts/at91sam9261ek.dts
+++ b/arch/arm/boot/dts/at91sam9261ek.dts
@@ -36,7 +36,7 @@
 			status = "okay";
 		};
 
-		fb0: fb@0x00600000 {
+		fb0: fb@600000 {
 			display = <&display0>;
 			atmel,power-control-gpio = <&pioA 12 GPIO_ACTIVE_LOW>;
 			status = "okay";
diff --git a/arch/arm/boot/dts/at91sam9263.dtsi b/arch/arm/boot/dts/at91sam9263.dtsi
index e54f14d36b6f..a26f7ada429d 100644
--- a/arch/arm/boot/dts/at91sam9263.dtsi
+++ b/arch/arm/boot/dts/at91sam9263.dtsi
@@ -999,7 +999,7 @@
 			};
 		};
 
-		fb0: fb@0x00700000 {
+		fb0: fb@700000 {
 			compatible = "atmel,at91sam9263-lcdc";
 			reg = <0x00700000 0x1000>;
 			interrupts = <26 IRQ_TYPE_LEVEL_HIGH 3>;
diff --git a/arch/arm/boot/dts/at91sam9263ek.dts b/arch/arm/boot/dts/at91sam9263ek.dts
index 5a2e1af793f5..f095b5d4d410 100644
--- a/arch/arm/boot/dts/at91sam9263ek.dts
+++ b/arch/arm/boot/dts/at91sam9263ek.dts
@@ -95,7 +95,7 @@
 			};
 		};
 
-		fb0: fb@0x00700000 {
+		fb0: fb@700000 {
 			display = <&display0>;
 			status = "okay";
 
diff --git a/arch/arm/boot/dts/at91sam9g25ek.dts b/arch/arm/boot/dts/at91sam9g25ek.dts
index 91a71774472e..31fecc2cdaf9 100644
--- a/arch/arm/boot/dts/at91sam9g25ek.dts
+++ b/arch/arm/boot/dts/at91sam9g25ek.dts
@@ -25,7 +25,7 @@
 			};
 
 			i2c0: i2c@f8010000 {
-				ov2640: camera@0x30 {
+				ov2640: camera@30 {
 					compatible = "ovti,ov2640";
 					reg = <0x30>;
 					pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/at91sam9g45.dtsi b/arch/arm/boot/dts/at91sam9g45.dtsi
index 2b127ca7aaa0..98348ebd6488 100644
--- a/arch/arm/boot/dts/at91sam9g45.dtsi
+++ b/arch/arm/boot/dts/at91sam9g45.dtsi
@@ -1302,7 +1302,7 @@
 			};
 		};
 
-		fb0: fb@0x00500000 {
+		fb0: fb@500000 {
 			compatible = "atmel,at91sam9g45-lcdc";
 			reg = <0x00500000 0x1000>;
 			interrupts = <23 IRQ_TYPE_LEVEL_HIGH 3>;
diff --git a/arch/arm/boot/dts/at91sam9m10g45ek.dts b/arch/arm/boot/dts/at91sam9m10g45ek.dts
index e922552a04cb..d793451ee04c 100644
--- a/arch/arm/boot/dts/at91sam9m10g45ek.dts
+++ b/arch/arm/boot/dts/at91sam9m10g45ek.dts
@@ -220,7 +220,7 @@
 			};
 		};
 
-		fb0: fb@0x00500000 {
+		fb0: fb@500000 {
 			display = <&display0>;
 			status = "okay";
 
diff --git a/arch/arm/boot/dts/atlas7.dtsi b/arch/arm/boot/dts/atlas7.dtsi
index 83449b33de6b..920d22882f21 100644
--- a/arch/arm/boot/dts/atlas7.dtsi
+++ b/arch/arm/boot/dts/atlas7.dtsi
@@ -1170,7 +1170,7 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x13240000 0x13240000 0x00010000>;
-			pmipc@0x13240000 {
+			pmipc@13240000 {
 				compatible = "sirf,atlas7-pmipc";
 				reg = <0x13240000 0x00010000>;
 			};
@@ -1265,7 +1265,7 @@
 				#dma-cells = <1>;
 			};
 
-			gnssmfw@0x18100000 {
+			gnssmfw@18100000 {
 				compatible = "sirf,nocfw-gnssm";
 				reg = <0x18100000 0x3000>;
 			};
@@ -1374,7 +1374,7 @@
 				<0x13010000 0x13010000 0x1400>,
 				<0x13010800 0x13010800 0x100>,
 				<0x13011000 0x13011000 0x100>;
-			gpum@0x13000000 {
+			gpum@13000000 {
 				compatible = "sirf,nocfw-gpum";
 				reg = <0x13000000 0x3000>;
 			};
@@ -1396,7 +1396,7 @@
 				#dma-cells = <1>;
 				#dma-channels = <1>;
 			};
-			sdr@0x13010000 {
+			sdr@13010000 {
 				compatible = "sirf,atlas7-sdr";
 				reg = <0x13010000 0x1400>;
 				interrupts = <0 7 0>,
@@ -1780,7 +1780,7 @@
 				interrupts = <0 105 0>;
 			};
 
-			memory-controller@0x10800000 {
+			memory-controller@10800000 {
 				compatible = "sirf,atlas7-memc";
 				reg = <0x10800000 0x2000>;
 			};
@@ -1896,7 +1896,7 @@
 				#size-cells = <0>;
 			};
 
-			retain@0x188D0000 {
+			retain@188d0000 {
 				compatible = "sirf,atlas7-retain";
 				reg = <0x188D0000 0x1000>;
 			};
diff --git a/arch/arm/boot/dts/bcm11351.dtsi b/arch/arm/boot/dts/bcm11351.dtsi
index 18045c38bcf1..db7cded1b7ad 100644
--- a/arch/arm/boot/dts/bcm11351.dtsi
+++ b/arch/arm/boot/dts/bcm11351.dtsi
@@ -55,7 +55,7 @@
 		      <0x3ff00100 0x100>;
 	};
 
-	smc@0x3404c000 {
+	smc@3404c000 {
 		compatible = "brcm,bcm11351-smc", "brcm,kona-smc";
 		reg = <0x3404c000 0x400>; /* 1 KiB in SRAM */
 	};
diff --git a/arch/arm/boot/dts/bcm21664.dtsi b/arch/arm/boot/dts/bcm21664.dtsi
index 6dde95f21cef..266f2611dc22 100644
--- a/arch/arm/boot/dts/bcm21664.dtsi
+++ b/arch/arm/boot/dts/bcm21664.dtsi
@@ -55,7 +55,7 @@
 		      <0x3ff00100 0x100>;
 	};
 
-	smc@0x3404e000 {
+	smc@3404e000 {
 		compatible = "brcm,bcm21664-smc", "brcm,kona-smc";
 		reg = <0x3404e000 0x400>; /* 1 KiB in SRAM */
 	};
diff --git a/arch/arm/boot/dts/bcm283x.dtsi b/arch/arm/boot/dts/bcm283x.dtsi
index dcde93c85c2d..2ee4f04ea9d4 100644
--- a/arch/arm/boot/dts/bcm283x.dtsi
+++ b/arch/arm/boot/dts/bcm283x.dtsi
@@ -464,7 +464,7 @@
 			status = "disabled";
 		};
 
-		aux: aux@0x7e215000 {
+		aux: aux@7e215000 {
 			compatible = "brcm,bcm2835-aux";
 			#clock-cells = <1>;
 			reg = <0x7e215000 0x8>;
diff --git a/arch/arm/boot/dts/da850-lcdk.dts b/arch/arm/boot/dts/da850-lcdk.dts
index eed89e659143..a1f4d6d5a569 100644
--- a/arch/arm/boot/dts/da850-lcdk.dts
+++ b/arch/arm/boot/dts/da850-lcdk.dts
@@ -293,12 +293,12 @@
 					label = "u-boot env";
 					reg = <0 0x020000>;
 				};
-				partition@0x020000 {
+				partition@20000 {
 					/* The LCDK defaults to booting from this partition */
 					label = "u-boot";
 					reg = <0x020000 0x080000>;
 				};
-				partition@0x0a0000 {
+				partition@a0000 {
 					label = "free space";
 					reg = <0x0a0000 0>;
 				};
diff --git a/arch/arm/boot/dts/dm8148-evm.dts b/arch/arm/boot/dts/dm8148-evm.dts
index d6657b3bae84..7747a5b9657f 100644
--- a/arch/arm/boot/dts/dm8148-evm.dts
+++ b/arch/arm/boot/dts/dm8148-evm.dts
@@ -74,19 +74,19 @@
 			label = "X-Loader";
 			reg = <0 0x80000>;
 		};
-		partition@0x80000 {
+		partition@80000 {
 			label = "U-Boot";
 			reg = <0x80000 0x1c0000>;
 		};
-		partition@0x1c0000 {
+		partition@1c0000 {
 			label = "Environment";
 			reg = <0x240000 0x40000>;
 		};
-		partition@0x280000 {
+		partition@280000 {
 			label = "Kernel";
 			reg = <0x280000 0x500000>;
 		};
-		partition@0x780000 {
+		partition@780000 {
 			label = "Filesystem";
 			reg = <0x780000 0xf880000>;
 		};
diff --git a/arch/arm/boot/dts/dm8168-evm.dts b/arch/arm/boot/dts/dm8168-evm.dts
index c72a2132aa82..85dd3c703dff 100644
--- a/arch/arm/boot/dts/dm8168-evm.dts
+++ b/arch/arm/boot/dts/dm8168-evm.dts
@@ -158,19 +158,19 @@
 			label = "X-Loader";
 			reg = <0 0x80000>;
 		};
-		partition@0x80000 {
+		partition@80000 {
 			label = "U-Boot";
 			reg = <0x80000 0x1c0000>;
 		};
-		partition@0x1c0000 {
+		partition@1c0000 {
 			label = "Environment";
 			reg = <0x240000 0x40000>;
 		};
-		partition@0x280000 {
+		partition@280000 {
 			label = "Kernel";
 			reg = <0x280000 0x500000>;
 		};
-		partition@0x780000 {
+		partition@780000 {
 			label = "Filesystem";
 			reg = <0x780000 0xf880000>;
 		};
diff --git a/arch/arm/boot/dts/dra62x-j5eco-evm.dts b/arch/arm/boot/dts/dra62x-j5eco-evm.dts
index 155eb32ee213..fee0547f7302 100644
--- a/arch/arm/boot/dts/dra62x-j5eco-evm.dts
+++ b/arch/arm/boot/dts/dra62x-j5eco-evm.dts
@@ -74,19 +74,19 @@
 			label = "X-Loader";
 			reg = <0 0x80000>;
 		};
-		partition@0x80000 {
+		partition@80000 {
 			label = "U-Boot";
 			reg = <0x80000 0x1c0000>;
 		};
-		partition@0x1c0000 {
+		partition@1c0000 {
 			label = "Environment";
 			reg = <0x240000 0x40000>;
 		};
-		partition@0x280000 {
+		partition@280000 {
 			label = "Kernel";
 			reg = <0x280000 0x500000>;
 		};
-		partition@0x780000 {
+		partition@780000 {
 			label = "Filesystem";
 			reg = <0x780000 0xf880000>;
 		};
diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 8aa2cc7aa125..05ddbcf4413b 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -752,7 +752,7 @@
 			#include "exynos5420-tmu-sensor-conf.dtsi"
 		};
 
-		sysmmu_g2dr: sysmmu@0x10A60000 {
+		sysmmu_g2dr: sysmmu@10a60000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x10A60000 0x1000>;
 			interrupt-parent = <&combiner>;
@@ -762,7 +762,7 @@
 			#iommu-cells = <0>;
 		};
 
-		sysmmu_g2dw: sysmmu@0x10A70000 {
+		sysmmu_g2dw: sysmmu@10a70000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x10A70000 0x1000>;
 			interrupt-parent = <&combiner>;
@@ -772,7 +772,7 @@
 			#iommu-cells = <0>;
 		};
 
-		sysmmu_tv: sysmmu@0x14650000 {
+		sysmmu_tv: sysmmu@14650000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x14650000 0x1000>;
 			interrupt-parent = <&combiner>;
@@ -783,7 +783,7 @@
 			#iommu-cells = <0>;
 		};
 
-		sysmmu_gscl0: sysmmu@0x13E80000 {
+		sysmmu_gscl0: sysmmu@13e80000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x13E80000 0x1000>;
 			interrupt-parent = <&combiner>;
@@ -794,7 +794,7 @@
 			#iommu-cells = <0>;
 		};
 
-		sysmmu_gscl1: sysmmu@0x13E90000 {
+		sysmmu_gscl1: sysmmu@13e90000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x13E90000 0x1000>;
 			interrupt-parent = <&combiner>;
@@ -805,7 +805,7 @@
 			#iommu-cells = <0>;
 		};
 
-		sysmmu_scaler0r: sysmmu@0x12880000 {
+		sysmmu_scaler0r: sysmmu@12880000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x12880000 0x1000>;
 			interrupt-parent = <&combiner>;
@@ -815,7 +815,7 @@
 			#iommu-cells = <0>;
 		};
 
-		sysmmu_scaler1r: sysmmu@0x12890000 {
+		sysmmu_scaler1r: sysmmu@12890000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x12890000 0x1000>;
 			interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>;
@@ -824,7 +824,7 @@
 			#iommu-cells = <0>;
 		};
 
-		sysmmu_scaler2r: sysmmu@0x128A0000 {
+		sysmmu_scaler2r: sysmmu@128a0000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x128A0000 0x1000>;
 			interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>;
@@ -833,7 +833,7 @@
 			#iommu-cells = <0>;
 		};
 
-		sysmmu_scaler0w: sysmmu@0x128C0000 {
+		sysmmu_scaler0w: sysmmu@128c0000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x128C0000 0x1000>;
 			interrupt-parent = <&combiner>;
@@ -843,7 +843,7 @@
 			#iommu-cells = <0>;
 		};
 
-		sysmmu_scaler1w: sysmmu@0x128D0000 {
+		sysmmu_scaler1w: sysmmu@128d0000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x128D0000 0x1000>;
 			interrupt-parent = <&combiner>;
@@ -853,7 +853,7 @@
 			#iommu-cells = <0>;
 		};
 
-		sysmmu_scaler2w: sysmmu@0x128E0000 {
+		sysmmu_scaler2w: sysmmu@128e0000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x128E0000 0x1000>;
 			interrupt-parent = <&combiner>;
@@ -863,7 +863,7 @@
 			#iommu-cells = <0>;
 		};
 
-		sysmmu_rotator: sysmmu@0x11D40000 {
+		sysmmu_rotator: sysmmu@11d40000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x11D40000 0x1000>;
 			interrupt-parent = <&combiner>;
@@ -873,7 +873,7 @@
 			#iommu-cells = <0>;
 		};
 
-		sysmmu_jpeg0: sysmmu@0x11F10000 {
+		sysmmu_jpeg0: sysmmu@11f10000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x11F10000 0x1000>;
 			interrupt-parent = <&combiner>;
@@ -883,7 +883,7 @@
 			#iommu-cells = <0>;
 		};
 
-		sysmmu_jpeg1: sysmmu@0x11F20000 {
+		sysmmu_jpeg1: sysmmu@11f20000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x11F20000 0x1000>;
 			interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>;
@@ -892,7 +892,7 @@
 			#iommu-cells = <0>;
 		};
 
-		sysmmu_mfc_l: sysmmu@0x11200000 {
+		sysmmu_mfc_l: sysmmu@11200000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x11200000 0x1000>;
 			interrupt-parent = <&combiner>;
@@ -903,7 +903,7 @@
 			#iommu-cells = <0>;
 		};
 
-		sysmmu_mfc_r: sysmmu@0x11210000 {
+		sysmmu_mfc_r: sysmmu@11210000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x11210000 0x1000>;
 			interrupt-parent = <&combiner>;
@@ -914,7 +914,7 @@
 			#iommu-cells = <0>;
 		};
 
-		sysmmu_fimd1_0: sysmmu@0x14640000 {
+		sysmmu_fimd1_0: sysmmu@14640000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x14640000 0x1000>;
 			interrupt-parent = <&combiner>;
@@ -925,7 +925,7 @@
 			#iommu-cells = <0>;
 		};
 
-		sysmmu_fimd1_1: sysmmu@0x14680000 {
+		sysmmu_fimd1_1: sysmmu@14680000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x14680000 0x1000>;
 			interrupt-parent = <&combiner>;
diff --git a/arch/arm/boot/dts/exynos5422-odroid-core.dtsi b/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
index a5b8d0f0877e..353428fe10c4 100644
--- a/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
+++ b/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
@@ -26,7 +26,7 @@
 		stdout-path = "serial2:115200n8";
 	};
 
-	firmware@02073000 {
+	firmware@2073000 {
 		compatible = "samsung,secure-firmware";
 		reg = <0x02073000 0x1000>;
 	};
diff --git a/arch/arm/boot/dts/imx7d.dtsi b/arch/arm/boot/dts/imx7d.dtsi
index 4d308d17f040..369d5a166b3e 100644
--- a/arch/arm/boot/dts/imx7d.dtsi
+++ b/arch/arm/boot/dts/imx7d.dtsi
@@ -129,7 +129,7 @@
 		status = "disabled";
 	};
 
-	pcie: pcie@0x33800000 {
+	pcie: pcie@33800000 {
 		compatible = "fsl,imx7d-pcie", "snps,dw-pcie";
 		reg = <0x33800000 0x4000>,
 		      <0x4ff00000 0x80000>;
diff --git a/arch/arm/boot/dts/keystone-k2e-netcp.dtsi b/arch/arm/boot/dts/keystone-k2e-netcp.dtsi
index ba828cb59587..940b64935bde 100644
--- a/arch/arm/boot/dts/keystone-k2e-netcp.dtsi
+++ b/arch/arm/boot/dts/keystone-k2e-netcp.dtsi
@@ -98,7 +98,7 @@ qmss: qmss@2a40000 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges;
-		pdsp0@0x2a10000 {
+		pdsp0@2a10000 {
 			reg = <0x2a10000 0x1000    /*iram */
 			       0x2a0f000 0x100     /*reg*/
 			       0x2a0c000 0x3c8	   /*intd */
diff --git a/arch/arm/boot/dts/keystone-k2hk-netcp.dtsi b/arch/arm/boot/dts/keystone-k2hk-netcp.dtsi
index a5ac845464bf..ed7287a274a0 100644
--- a/arch/arm/boot/dts/keystone-k2hk-netcp.dtsi
+++ b/arch/arm/boot/dts/keystone-k2hk-netcp.dtsi
@@ -115,7 +115,7 @@ qmss: qmss@2a40000 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges;
-		pdsp0@0x2a10000 {
+		pdsp0@2a10000 {
 			reg = <0x2a10000 0x1000    /*iram */
 			       0x2a0f000 0x100     /*reg*/
 			       0x2a0c000 0x3c8	   /*intd */
diff --git a/arch/arm/boot/dts/keystone-k2l-netcp.dtsi b/arch/arm/boot/dts/keystone-k2l-netcp.dtsi
index 66f615a74118..b6af5f78e498 100644
--- a/arch/arm/boot/dts/keystone-k2l-netcp.dtsi
+++ b/arch/arm/boot/dts/keystone-k2l-netcp.dtsi
@@ -97,7 +97,7 @@ qmss: qmss@2a40000 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges;
-		pdsp0@0x2a10000 {
+		pdsp0@2a10000 {
 			reg = <0x2a10000 0x1000    /*iram */
 			       0x2a0f000 0x100     /*reg*/
 			       0x2a0c000 0x3c8	   /*intd */
diff --git a/arch/arm/boot/dts/omap3-cm-t3x.dtsi b/arch/arm/boot/dts/omap3-cm-t3x.dtsi
index ab6003fe5a43..9dcb18d22cde 100644
--- a/arch/arm/boot/dts/omap3-cm-t3x.dtsi
+++ b/arch/arm/boot/dts/omap3-cm-t3x.dtsi
@@ -306,19 +306,19 @@
 			label = "xloader";
 			reg = <0 0x80000>;
 		};
-		partition@0x80000 {
+		partition@80000 {
 			label = "uboot";
 			reg = <0x80000 0x1e0000>;
 		};
-		partition@0x260000 {
+		partition@260000 {
 			label = "uboot environment";
 			reg = <0x260000 0x40000>;
 		};
-		partition@0x2a0000 {
+		partition@2a0000 {
 			label = "linux";
 			reg = <0x2a0000 0x400000>;
 		};
-		partition@0x6a0000 {
+		partition@6a0000 {
 			label = "rootfs";
 			reg = <0x6a0000 0x1f880000>;
 		};
diff --git a/arch/arm/boot/dts/omap3-evm-37xx.dts b/arch/arm/boot/dts/omap3-evm-37xx.dts
index 5a4ba0aea447..a14303b09ae2 100644
--- a/arch/arm/boot/dts/omap3-evm-37xx.dts
+++ b/arch/arm/boot/dts/omap3-evm-37xx.dts
@@ -90,19 +90,19 @@
 			label = "X-Loader";
 			reg = <0 0x80000>;
 		};
-		partition@0x80000 {
+		partition@80000 {
 			label = "U-Boot";
 			reg = <0x80000 0x1c0000>;
 		};
-		partition@0x1c0000 {
+		partition@1c0000 {
 			label = "Environment";
 			reg = <0x240000 0x40000>;
 		};
-		partition@0x280000 {
+		partition@280000 {
 			label = "Kernel";
 			reg = <0x280000 0x500000>;
 		};
-		partition@0x780000 {
+		partition@780000 {
 			label = "Filesystem";
 			reg = <0x780000 0x1f880000>;
 		};
diff --git a/arch/arm/boot/dts/omap3-lilly-a83x.dtsi b/arch/arm/boot/dts/omap3-lilly-a83x.dtsi
index 7ada1e93e166..cf7a2a72348d 100644
--- a/arch/arm/boot/dts/omap3-lilly-a83x.dtsi
+++ b/arch/arm/boot/dts/omap3-lilly-a83x.dtsi
@@ -405,22 +405,22 @@
 			reg = <0 0x80000>;
 		};
 
-		partition@0x80000 {
+		partition@80000 {
 			label = "u-boot";
 			reg = <0x80000 0x1e0000>;
 		};
 
-		partition@0x260000 {
+		partition@260000 {
 			label = "u-boot-environment";
 			reg = <0x260000 0x20000>;
 		};
 
-		partition@0x280000 {
+		partition@280000 {
 			label = "kernel";
 			reg = <0x280000 0x500000>;
 		};
 
-		partition@0x780000 {
+		partition@780000 {
 			label = "filesystem";
 			reg = <0x780000 0xf880000>;
 		};
diff --git a/arch/arm/boot/dts/s3c2416.dtsi b/arch/arm/boot/dts/s3c2416.dtsi
index 80f007550324..66840f02a618 100644
--- a/arch/arm/boot/dts/s3c2416.dtsi
+++ b/arch/arm/boot/dts/s3c2416.dtsi
@@ -33,7 +33,7 @@
 		compatible = "samsung,s3c2416-irq";
 	};
 
-	clocks: clock-controller@0x4c000000 {
+	clocks: clock-controller@4c000000 {
 		compatible = "samsung,s3c2416-clock";
 		reg = <0x4c000000 0x40>;
 		#clock-cells = <1>;
diff --git a/arch/arm/boot/dts/sama5d3xmb.dtsi b/arch/arm/boot/dts/sama5d3xmb.dtsi
index 7f55050dd405..ef0f2d049e15 100644
--- a/arch/arm/boot/dts/sama5d3xmb.dtsi
+++ b/arch/arm/boot/dts/sama5d3xmb.dtsi
@@ -53,7 +53,7 @@
 			};
 
 			i2c1: i2c@f0018000 {
-				ov2640: camera@0x30 {
+				ov2640: camera@30 {
 					compatible = "ovti,ov2640";
 					reg = <0x30>;
 					pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/sama5d3xmb_cmp.dtsi b/arch/arm/boot/dts/sama5d3xmb_cmp.dtsi
index 83e3d3e08fd4..97e171db5970 100644
--- a/arch/arm/boot/dts/sama5d3xmb_cmp.dtsi
+++ b/arch/arm/boot/dts/sama5d3xmb_cmp.dtsi
@@ -88,7 +88,7 @@
 			};
 
 			i2c1: i2c@f0018000 {
-				ov2640: camera@0x30 {
+				ov2640: camera@30 {
 					compatible = "ovti,ov2640";
 					reg = <0x30>;
 					pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/socfpga.dtsi b/arch/arm/boot/dts/socfpga.dtsi
index 7e24dc8e82d4..36f87eb389b1 100644
--- a/arch/arm/boot/dts/socfpga.dtsi
+++ b/arch/arm/boot/dts/socfpga.dtsi
@@ -724,7 +724,7 @@
 			arm,prefetch-offset = <7>;
 		};
 
-		l3regs@0xff800000 {
+		l3regs@ff800000 {
 			compatible = "altr,l3regs", "syscon";
 			reg = <0xff800000 0x1000>;
 		};
diff --git a/arch/arm/boot/dts/spear300.dtsi b/arch/arm/boot/dts/spear300.dtsi
index f4e92e599729..266fefa67223 100644
--- a/arch/arm/boot/dts/spear300.dtsi
+++ b/arch/arm/boot/dts/spear300.dtsi
@@ -52,7 +52,7 @@
 			status = "disabled";
 		};
 
-		shirq: interrupt-controller@0x50000000 {
+		shirq: interrupt-controller@50000000 {
 			compatible = "st,spear300-shirq";
 			reg = <0x50000000 0x1000>;
 			interrupts = <28>;
diff --git a/arch/arm/boot/dts/spear310.dtsi b/arch/arm/boot/dts/spear310.dtsi
index da210b454753..f995ecf09acf 100644
--- a/arch/arm/boot/dts/spear310.dtsi
+++ b/arch/arm/boot/dts/spear310.dtsi
@@ -40,7 +40,7 @@
 			status = "disabled";
 		};
 
-		shirq: interrupt-controller@0xb4000000 {
+		shirq: interrupt-controller@b4000000 {
 			compatible = "st,spear310-shirq";
 			reg = <0xb4000000 0x1000>;
 			interrupts = <28 29 30 1>;
diff --git a/arch/arm/boot/dts/spear320.dtsi b/arch/arm/boot/dts/spear320.dtsi
index 22be6e5edaac..2a062a3ee139 100644
--- a/arch/arm/boot/dts/spear320.dtsi
+++ b/arch/arm/boot/dts/spear320.dtsi
@@ -55,7 +55,7 @@
 			status = "disabled";
 		};
 
-		shirq: interrupt-controller@0xb3000000 {
+		shirq: interrupt-controller@b3000000 {
 			compatible = "st,spear320-shirq";
 			reg = <0xb3000000 0x1000>;
 			interrupts = <30 28 29 1>;
diff --git a/arch/arm/boot/dts/versatile-ab.dts b/arch/arm/boot/dts/versatile-ab.dts
index 4a51612996bc..8b0ad47e7b1f 100644
--- a/arch/arm/boot/dts/versatile-ab.dts
+++ b/arch/arm/boot/dts/versatile-ab.dts
@@ -34,7 +34,7 @@
 		compatible = "arm,core-module-versatile", "syscon", "simple-mfd";
 		reg = <0x10000000 0x200>;
 
-		led@08.0 {
+		led@8.0 {
 			compatible = "register-bit-led";
 			offset = <0x08>;
 			mask = <0x01>;
@@ -42,7 +42,7 @@
 			linux,default-trigger = "heartbeat";
 			default-state = "on";
 		};
-		led@08.1 {
+		led@8.1 {
 			compatible = "register-bit-led";
 			offset = <0x08>;
 			mask = <0x02>;
@@ -50,7 +50,7 @@
 			linux,default-trigger = "mmc0";
 			default-state = "off";
 		};
-		led@08.2 {
+		led@8.2 {
 			compatible = "register-bit-led";
 			offset = <0x08>;
 			mask = <0x04>;
@@ -58,35 +58,35 @@
 			linux,default-trigger = "cpu0";
 			default-state = "off";
 		};
-		led@08.3 {
+		led@8.3 {
 			compatible = "register-bit-led";
 			offset = <0x08>;
 			mask = <0x08>;
 			label = "versatile:3";
 			default-state = "off";
 		};
-		led@08.4 {
+		led@8.4 {
 			compatible = "register-bit-led";
 			offset = <0x08>;
 			mask = <0x10>;
 			label = "versatile:4";
 			default-state = "off";
 		};
-		led@08.5 {
+		led@8.5 {
 			compatible = "register-bit-led";
 			offset = <0x08>;
 			mask = <0x20>;
 			label = "versatile:5";
 			default-state = "off";
 		};
-		led@08.6 {
+		led@8.6 {
 			compatible = "register-bit-led";
 			offset = <0x08>;
 			mask = <0x40>;
 			label = "versatile:6";
 			default-state = "off";
 		};
-		led@08.7 {
+		led@8.7 {
 			compatible = "register-bit-led";
 			offset = <0x08>;
 			mask = <0x80>;
diff --git a/arch/arm/boot/dts/zx296702.dtsi b/arch/arm/boot/dts/zx296702.dtsi
index 8a74efdb6360..240e7a23d81f 100644
--- a/arch/arm/boot/dts/zx296702.dtsi
+++ b/arch/arm/boot/dts/zx296702.dtsi
@@ -56,7 +56,7 @@
 			clocks = <&topclk ZX296702_A9_PERIPHCLK>;
 		};
 
-		l2cc: l2-cache-controller@0x00c00000 {
+		l2cc: l2-cache-controller@c00000 {
 			compatible = "arm,pl310-cache";
 			reg = <0x00c00000 0x1000>;
 			cache-unified;
@@ -67,30 +67,30 @@
 			arm,double-linefill-incr = <0>;
 		};
 
-		pcu: pcu@0xa0008000 {
+		pcu: pcu@a0008000 {
 			compatible = "zte,zx296702-pcu";
 			reg = <0xa0008000 0x1000>;
 		};
 
-		topclk: topclk@0x09800000 {
+		topclk: topclk@9800000 {
 			compatible = "zte,zx296702-topcrm-clk";
 			reg = <0x09800000 0x1000>;
 			#clock-cells = <1>;
 		};
 
-		lsp1clk: lsp1clk@0x09400000 {
+		lsp1clk: lsp1clk@9400000 {
 			compatible = "zte,zx296702-lsp1crpm-clk";
 			reg = <0x09400000 0x1000>;
 			#clock-cells = <1>;
 		};
 
-		lsp0clk: lsp0clk@0x0b000000 {
+		lsp0clk: lsp0clk@b000000 {
 			compatible = "zte,zx296702-lsp0crpm-clk";
 			reg = <0x0b000000 0x1000>;
 			#clock-cells = <1>;
 		};
 
-		uart0: serial@0x09405000 {
+		uart0: serial@9405000 {
 			compatible = "zte,zx296702-uart";
 			reg = <0x09405000 0x1000>;
 			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
@@ -98,7 +98,7 @@
 			status = "disabled";
 		};
 
-		uart1: serial@0x09406000 {
+		uart1: serial@9406000 {
 			compatible = "zte,zx296702-uart";
 			reg = <0x09406000 0x1000>;
 			interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
@@ -106,7 +106,7 @@
 			status = "disabled";
 		};
 
-		mmc0: mmc@0x09408000 {
+		mmc0: mmc@9408000 {
 			compatible = "snps,dw-mshc";
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -119,7 +119,7 @@
 			status = "disabled";
 		};
 
-		mmc1: mmc@0x0b003000 {
+		mmc1: mmc@b003000 {
 			compatible = "snps,dw-mshc";
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -132,7 +132,7 @@
 			status = "disabled";
 		};
 
-		sysctrl: sysctrl@0xa0007000 {
+		sysctrl: sysctrl@a0007000 {
 			compatible = "zte,sysctrl", "syscon";
 			reg = <0xa0007000 0x1000>;
 		};
diff --git a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
index 3aee6123d161..3f5ff76109be 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
+++ b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
@@ -51,7 +51,7 @@
 		#size-cells = <2>;
 		ranges;
 
-		ramoops@0x21f00000 {
+		ramoops@21f00000 {
 			compatible = "ramoops";
 			reg = <0x0 0x21f00000 0x0 0x00100000>;
 			record-size	= <0x00020000>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 26396ef53bde..0446b122a6e2 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -249,7 +249,7 @@
 			reg = <0 0x10005000 0 0x1000>;
 		};
 
-		pio: pinctrl@0x10005000 {
+		pio: pinctrl@10005000 {
 			compatible = "mediatek,mt8173-pinctrl";
 			reg = <0 0x1000b000 0 0x1000>;
 			mediatek,pctl-regmap = <&syscfg_pctl_a>;
diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
index 492a011f14f6..1c8f1b86472d 100644
--- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
@@ -140,16 +140,16 @@
 		};
 
 		agnoc@0 {
-			qcom,pcie@00600000 {
+			qcom,pcie@600000 {
 				perst-gpio = <&msmgpio 35 GPIO_ACTIVE_LOW>;
 			};
 
-			qcom,pcie@00608000 {
+			qcom,pcie@608000 {
 				status = "okay";
 				perst-gpio = <&msmgpio 130 GPIO_ACTIVE_LOW>;
 			};
 
-			qcom,pcie@00610000 {
+			qcom,pcie@610000 {
 				status = "okay";
 				perst-gpio = <&msmgpio 114 GPIO_ACTIVE_LOW>;
 			};
diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 4b2afcc4fdf4..0a6f7952bbb1 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -840,7 +840,7 @@
 			#size-cells = <1>;
 			ranges;
 
-			pcie0: qcom,pcie@00600000 {
+			pcie0: qcom,pcie@600000 {
 				compatible = "qcom,pcie-msm8996", "snps,dw-pcie";
 				status = "disabled";
 				power-domains = <&gcc PCIE0_GDSC>;
@@ -893,7 +893,7 @@
 
 			};
 
-			pcie1: qcom,pcie@00608000 {
+			pcie1: qcom,pcie@608000 {
 				compatible = "qcom,pcie-msm8996", "snps,dw-pcie";
 				power-domains = <&gcc PCIE1_GDSC>;
 				bus-range = <0x00 0xff>;
@@ -946,7 +946,7 @@
 						"bus_slave";
 			};
 
-			pcie2: qcom,pcie@00610000 {
+			pcie2: qcom,pcie@610000 {
 				compatible = "qcom,pcie-msm8996", "snps,dw-pcie";
 				power-domains = <&gcc PCIE2_GDSC>;
 				bus-range = <0x00 0xff>;
diff --git a/arch/c6x/boot/dts/dsk6455.dts b/arch/c6x/boot/dts/dsk6455.dts
index 2b71f800618d..3012f44e9357 100644
--- a/arch/c6x/boot/dts/dsk6455.dts
+++ b/arch/c6x/boot/dts/dsk6455.dts
@@ -55,7 +55,7 @@
 			interrupts = < 69 >;
 		};
 
-		clock-controller@029a0000 {
+		clock-controller@29a0000 {
 			clock-frequency = <50000000>;
 		};
 	};
diff --git a/arch/c6x/boot/dts/tms320c6455.dtsi b/arch/c6x/boot/dts/tms320c6455.dtsi
index 0b21cb30343b..b5c36fb351db 100644
--- a/arch/c6x/boot/dts/tms320c6455.dtsi
+++ b/arch/c6x/boot/dts/tms320c6455.dtsi
@@ -68,7 +68,7 @@
 			ti,dscr-dev-enable = <4>;
 		};
 
-		clock-controller@029a0000 {
+		clock-controller@29a0000 {
 			compatible = "ti,c6455-pll", "ti,c64x+pll";
 			reg = <0x029a0000 0x200>;
 			ti,c64x+pll-bypass-delay = <1440>;
diff --git a/arch/metag/boot/dts/tz1090.dtsi b/arch/metag/boot/dts/tz1090.dtsi
index 24ea7d2e9138..a3a3be7796f1 100644
--- a/arch/metag/boot/dts/tz1090.dtsi
+++ b/arch/metag/boot/dts/tz1090.dtsi
@@ -28,7 +28,7 @@
 		#size-cells = <1>;
 		ranges;
 
-		pdc: pdc@0x02006000 {
+		pdc: pdc@2006000 {
 			interrupt-controller;
 			#interrupt-cells = <2>;
 
@@ -44,19 +44,19 @@
 			             <31 IRQ_TYPE_LEVEL_HIGH>; /* Perip 2 (WDT) */
 		};
 
-		pinctrl: pinctrl@02005800 {
+		pinctrl: pinctrl@2005800 {
 			#gpio-range-cells = <3>;
 			compatible = "img,tz1090-pinctrl";
 			reg = <0x02005800 0xe4>;
 		};
 
-		pdc_pinctrl: pinctrl@02006500 {
+		pdc_pinctrl: pinctrl@2006500 {
 			#gpio-range-cells = <3>;
 			compatible = "img,tz1090-pdc-pinctrl";
 			reg = <0x02006500 0x100>;
 		};
 
-		gpios: gpios@02005800 {
+		gpios: gpios@2005800 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			compatible = "img,tz1090-gpio";
@@ -91,7 +91,7 @@
 			};
 		};
 
-		pdc_gpios: gpios@02006500 {
+		pdc_gpios: gpios@2006500 {
 			gpio-controller;
 			#gpio-cells = <2>;
 
diff --git a/arch/mips/boot/dts/img/boston.dts b/arch/mips/boot/dts/img/boston.dts
index 2cd49b60e030..1bd105428f61 100644
--- a/arch/mips/boot/dts/img/boston.dts
+++ b/arch/mips/boot/dts/img/boston.dts
@@ -157,7 +157,7 @@
 					#address-cells = <1>;
 					#size-cells = <0>;
 
-					rtc@0x68 {
+					rtc@68 {
 						compatible = "st,m41t81s";
 						reg = <0x68>;
 					};
diff --git a/arch/mips/boot/dts/ingenic/ci20.dts b/arch/mips/boot/dts/ingenic/ci20.dts
index a4cc52214dbd..7d5e49e40b0d 100644
--- a/arch/mips/boot/dts/ingenic/ci20.dts
+++ b/arch/mips/boot/dts/ingenic/ci20.dts
@@ -110,22 +110,22 @@
 					reg = <0x0 0x0 0x0 0x800000>;
 				};
 
-				partition@0x800000 {
+				partition@800000 {
 					label = "u-boot";
 					reg = <0x0 0x800000 0x0 0x200000>;
 				};
 
-				partition@0xa00000 {
+				partition@a00000 {
 					label = "u-boot-env";
 					reg = <0x0 0xa00000 0x0 0x200000>;
 				};
 
-				partition@0xc00000 {
+				partition@c00000 {
 					label = "boot";
 					reg = <0x0 0xc00000 0x0 0x4000000>;
 				};
 
-				partition@0x8c00000 {
+				partition@8c00000 {
 					label = "system";
 					reg = <0x0 0x4c00000 0x1 0xfb400000>;
 				};
diff --git a/arch/nios2/boot/dts/3c120_devboard.dts b/arch/nios2/boot/dts/3c120_devboard.dts
index 36ccdf05837d..56f4b5df6d65 100644
--- a/arch/nios2/boot/dts/3c120_devboard.dts
+++ b/arch/nios2/boot/dts/3c120_devboard.dts
@@ -29,7 +29,7 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		cpu: cpu@0x0 {
+		cpu: cpu@0 {
 			device_type = "cpu";
 			compatible = "altr,nios2-1.0";
 			reg = <0x00000000>;
@@ -69,7 +69,7 @@
 		compatible = "altr,avalon", "simple-bus";
 		bus-frequency = <125000000>;
 
-		pb_cpu_to_io: bridge@0x8000000 {
+		pb_cpu_to_io: bridge@8000000 {
 			compatible = "simple-bus";
 			reg = <0x08000000 0x00800000>;
 			#address-cells = <1>;
@@ -83,7 +83,7 @@
 				<0x00008000 0x08008000 0x00000020>,
 				<0x00400000 0x08400000 0x00000020>;
 
-			timer_1ms: timer@0x400000 {
+			timer_1ms: timer@400000 {
 				compatible = "altr,timer-1.0";
 				reg = <0x00400000 0x00000020>;
 				interrupt-parent = <&cpu>;
@@ -91,7 +91,7 @@
 				clock-frequency = <125000000>;
 			};
 
-			timer_0: timer@0x8000 {
+			timer_0: timer@8000 {
 				compatible = "altr,timer-1.0";
 				reg = < 0x00008000 0x00000020 >;
 				interrupt-parent = < &cpu >;
@@ -99,14 +99,14 @@
 				clock-frequency = < 125000000 >;
 			};
 
-			jtag_uart: serial@0x4d50 {
+			jtag_uart: serial@4d50 {
 				compatible = "altr,juart-1.0";
 				reg = <0x00004d50 0x00000008>;
 				interrupt-parent = <&cpu>;
 				interrupts = <1>;
 			};
 
-			tse_mac: ethernet@0x4000 {
+			tse_mac: ethernet@4000 {
 				compatible = "altr,tse-1.0";
 				reg = <0x00004000 0x00000400>,
 					<0x00004400 0x00000040>,
@@ -133,7 +133,7 @@
 				};
 			};
 
-			uart: serial@0x4c80 {
+			uart: serial@4c80 {
 				compatible = "altr,uart-1.0";
 				reg = <0x00004c80 0x00000020>;
 				interrupt-parent = <&cpu>;
@@ -143,7 +143,7 @@
 			};
 		};
 
-		cfi_flash_64m: flash@0x0 {
+		cfi_flash_64m: flash@0 {
 			compatible = "cfi-flash";
 			reg = <0x00000000 0x04000000>;
 			bank-width = <2>;
diff --git a/arch/powerpc/boot/dts/a3m071.dts b/arch/powerpc/boot/dts/a3m071.dts
index bf81b8f9704c..187ce458d03a 100644
--- a/arch/powerpc/boot/dts/a3m071.dts
+++ b/arch/powerpc/boot/dts/a3m071.dts
@@ -105,24 +105,24 @@
 			reg = <0 0x0 0x02000000>;
 			compatible = "cfi-flash";
 			bank-width = <2>;
-			partition@0x0 {
+			partition@0 {
 				label = "u-boot";
 				reg = <0x00000000 0x00040000>;
 				read-only;
 			};
-			partition@0x00040000 {
+			partition@40000 {
 				label = "env";
 				reg = <0x00040000 0x00020000>;
 			};
-			partition@0x00060000 {
+			partition@60000 {
 				label = "dtb";
 				reg = <0x00060000 0x00020000>;
 			};
-			partition@0x00080000 {
+			partition@80000 {
 				label = "kernel";
 				reg = <0x00080000 0x00500000>;
 			};
-			partition@0x00580000 {
+			partition@580000 {
 				label = "root";
 				reg = <0x00580000 0x00A80000>;
 			};
diff --git a/arch/powerpc/boot/dts/akebono.dts b/arch/powerpc/boot/dts/akebono.dts
index e61d5dc598c1..746779202a12 100644
--- a/arch/powerpc/boot/dts/akebono.dts
+++ b/arch/powerpc/boot/dts/akebono.dts
@@ -216,7 +216,7 @@
 				interrupts = <39 2>;
 			};
 
-			IIC0: i2c@00000000 {
+			IIC0: i2c@0 {
 				compatible = "ibm,iic-476gtr", "ibm,iic";
 				reg = <0x0 0x00000020>;
 				interrupt-parent = <&MPIC>;
@@ -229,7 +229,7 @@
 				};
 			};
 
-			IIC1: i2c@00000100 {
+			IIC1: i2c@100 {
 				compatible = "ibm,iic-476gtr", "ibm,iic";
 				reg = <0x100 0x00000020>;
 				interrupt-parent = <&MPIC>;
diff --git a/arch/powerpc/boot/dts/c2k.dts b/arch/powerpc/boot/dts/c2k.dts
index 1e32903cb0a8..27f169e3ade9 100644
--- a/arch/powerpc/boot/dts/c2k.dts
+++ b/arch/powerpc/boot/dts/c2k.dts
@@ -276,14 +276,14 @@
 			>;
 		};
 
-		cpu-error@0070 {
+		cpu-error@70 {
 			compatible = "marvell,mv64360-cpu-error";
 			reg = <0x0070 0x10 0x0128 0x28>;
 			interrupts = <3>;
 			interrupt-parent = <&PIC>;
 		};
 
-		sram-ctrl@0380 {
+		sram-ctrl@380 {
 			compatible = "marvell,mv64360-sram-ctrl";
 			reg = <0x0380 0x80>;
 			interrupts = <13>;
@@ -311,7 +311,7 @@
 			interrupt-parent = <&PIC>;
 		};
 		/* Devices attached to the device controller */
-		devicebus@045c {
+		devicebus@45c {
 			#address-cells = <2>;
 			#size-cells = <1>;
 			compatible = "marvell,mv64306-devctrl";
diff --git a/arch/powerpc/boot/dts/currituck.dts b/arch/powerpc/boot/dts/currituck.dts
index 4191e1850ea1..f2ad5815f08d 100644
--- a/arch/powerpc/boot/dts/currituck.dts
+++ b/arch/powerpc/boot/dts/currituck.dts
@@ -108,7 +108,7 @@
 				reg = <0x50000000 0x4>;
 			};
 
-			IIC0: i2c@00000000 {
+			IIC0: i2c@0 {
 				compatible = "ibm,iic-currituck", "ibm,iic";
 				reg = <0x0 0x00000014>;
 				interrupt-parent = <&MPIC>;
diff --git a/arch/powerpc/boot/dts/fsl/mpc8568mds.dts b/arch/powerpc/boot/dts/fsl/mpc8568mds.dts
index 01706a339603..bc3e8039bdc7 100644
--- a/arch/powerpc/boot/dts/fsl/mpc8568mds.dts
+++ b/arch/powerpc/boot/dts/fsl/mpc8568mds.dts
@@ -126,7 +126,7 @@
 		par_io@e0100 {
 			num-ports = <7>;
 
-			pio1: ucc_pin@01 {
+			pio1: ucc_pin@1 {
 				pio-map = <
 			/* port  pin  dir  open_drain  assignment  has_irq */
 					0x4  0xa  0x1  0x0  0x2  0x0 	/* TxD0 */
@@ -154,7 +154,7 @@
 					0x1  0x1f  0x2  0x0  0x3  0x0>;	/* GTX125 */
 			};
 
-			pio2: ucc_pin@02 {
+			pio2: ucc_pin@2 {
 				pio-map = <
 			/* port  pin  dir  open_drain  assignment  has_irq */
 					0x5  0xa 0x1  0x0  0x2  0x0   /* TxD0 */
@@ -228,22 +228,22 @@
 
 			/* These are the same PHYs as on
 			 * gianfar's MDIO bus */
-			qe_phy0: ethernet-phy@07 {
+			qe_phy0: ethernet-phy@7 {
 				interrupt-parent = <&mpic>;
 				interrupts = <1 1 0 0>;
 				reg = <0x7>;
 			};
-			qe_phy1: ethernet-phy@01 {
+			qe_phy1: ethernet-phy@1 {
 				interrupt-parent = <&mpic>;
 				interrupts = <2 1 0 0>;
 				reg = <0x1>;
 			};
-			qe_phy2: ethernet-phy@02 {
+			qe_phy2: ethernet-phy@2 {
 				interrupt-parent = <&mpic>;
 				interrupts = <1 1 0 0>;
 				reg = <0x2>;
 			};
-			qe_phy3: ethernet-phy@03 {
+			qe_phy3: ethernet-phy@3 {
 				interrupt-parent = <&mpic>;
 				interrupts = <2 1 0 0>;
 				reg = <0x3>;
diff --git a/arch/powerpc/boot/dts/fsl/mpc8569mds.dts b/arch/powerpc/boot/dts/fsl/mpc8569mds.dts
index 76b2bd6f7742..d8367ceddea6 100644
--- a/arch/powerpc/boot/dts/fsl/mpc8569mds.dts
+++ b/arch/powerpc/boot/dts/fsl/mpc8569mds.dts
@@ -141,7 +141,7 @@
 				gpio-controller;
 			};
 
-			pio1: ucc_pin@01 {
+			pio1: ucc_pin@1 {
 				pio-map = <
 			/* port  pin  dir  open_drain  assignment  has_irq */
 					0x2  0x1f 0x1  0x0  0x1  0x0	/* QE_MUX_MDC */
@@ -161,7 +161,7 @@
 					0x2  0x14 0x1  0x0  0x2  0x0>;	/* ENET1_GTXCLK	*/
 			};
 
-			pio2: ucc_pin@02 {
+			pio2: ucc_pin@2 {
 				pio-map = <
 			/* port  pin  dir  open_drain  assignment  has_irq */
 					0x2  0x1f 0x1  0x0  0x1  0x0	/* QE_MUX_MDC */
@@ -181,7 +181,7 @@
 					0x2  0x2 0x1  0x0  0x2  0x0>;	/* ENET2_GTXCLK	*/
 			};
 
-			pio3: ucc_pin@03 {
+			pio3: ucc_pin@3 {
 				pio-map = <
 			/* port  pin  dir  open_drain  assignment  has_irq */
 					0x2  0x1f 0x1  0x0  0x1  0x0	/* QE_MUX_MDC */
@@ -201,7 +201,7 @@
 					0x2  0x19 0x1  0x0  0x2  0x0>;	/* ENET3_GTXCLK	*/
 			};
 
-			pio4: ucc_pin@04 {
+			pio4: ucc_pin@4 {
 				pio-map = <
 			/* port  pin  dir  open_drain  assignment  has_irq */
 					0x2  0x1f 0x1  0x0  0x1  0x0	/* QE_MUX_MDC */
@@ -272,30 +272,30 @@
 			reg = <0x2120 0x18>;
 			compatible = "fsl,ucc-mdio";
 
-			qe_phy0: ethernet-phy@07 {
+			qe_phy0: ethernet-phy@7 {
 				interrupt-parent = <&mpic>;
 				interrupts = <1 1 0 0>;
 				reg = <0x7>;
 			};
-			qe_phy1: ethernet-phy@01 {
+			qe_phy1: ethernet-phy@1 {
 				interrupt-parent = <&mpic>;
 				interrupts = <2 1 0 0>;
 				reg = <0x1>;
 			};
-			qe_phy2: ethernet-phy@02 {
+			qe_phy2: ethernet-phy@2 {
 				interrupt-parent = <&mpic>;
 				interrupts = <3 1 0 0>;
 				reg = <0x2>;
 			};
-			qe_phy3: ethernet-phy@03 {
+			qe_phy3: ethernet-phy@3 {
 				interrupt-parent = <&mpic>;
 				interrupts = <4 1 0 0>;
 				reg = <0x3>;
 			};
-			qe_phy5: ethernet-phy@04 {
+			qe_phy5: ethernet-phy@4 {
 				reg = <0x04>;
 			};
-			qe_phy7: ethernet-phy@06 {
+			qe_phy7: ethernet-phy@6 {
 				reg = <0x6>;
 			};
 			tbi1: tbi-phy@11 {
diff --git a/arch/powerpc/boot/dts/fsl/p1021mds.dts b/arch/powerpc/boot/dts/fsl/p1021mds.dts
index 291454c75dda..1047802f4d2a 100644
--- a/arch/powerpc/boot/dts/fsl/p1021mds.dts
+++ b/arch/powerpc/boot/dts/fsl/p1021mds.dts
@@ -202,7 +202,7 @@
 			ranges = <0x0 0xe0100 0x60>;
 			device_type = "par_io";
 			num-ports = <3>;
-			pio1: ucc_pin@01 {
+			pio1: ucc_pin@1 {
 				pio-map = <
 			/* port  pin  dir  open_drain  assignment  has_irq */
 					0x1  0x13 0x1  0x0  0x1  0x0    /* QE_MUX_MDC */
@@ -225,7 +225,7 @@
 					0x0  0x10 0x2  0x0  0x2  0x0>;    /* ENET1_COL */
 			};
 
-			pio2: ucc_pin@02 {
+			pio2: ucc_pin@2 {
 				pio-map = <
 			/* port  pin  dir  open_drain  assignment  has_irq */
 					0x1  0x13 0x1  0x0  0x1  0x0    /* QE_MUX_MDC */
@@ -296,7 +296,7 @@
 				interrupts = <4 1 0 0>;
 				reg = <0x0>;
 			};
-			qe_phy1: ethernet-phy@03 {
+			qe_phy1: ethernet-phy@3 {
 				interrupt-parent = <&mpic>;
 				interrupts = <5 1 0 0>;
 				reg = <0x3>;
diff --git a/arch/powerpc/boot/dts/fsl/p1025rdb.dtsi b/arch/powerpc/boot/dts/fsl/p1025rdb.dtsi
index d44bb12debb0..0a5434a631c3 100644
--- a/arch/powerpc/boot/dts/fsl/p1025rdb.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p1025rdb.dtsi
@@ -245,7 +245,7 @@
 		ranges = <0x0 0xe0100 0x60>;
 		device_type = "par_io";
 		num-ports = <3>;
-		pio1: ucc_pin@01 {
+		pio1: ucc_pin@1 {
 			pio-map = <
 		/* port  pin  dir  open_drain  assignment  has_irq */
 				0x1  0x13 0x1  0x0  0x1  0x0    /* QE_MUX_MDC */
@@ -268,7 +268,7 @@
 				0x0  0x10 0x2  0x0  0x2  0x0>;    /* ENET1_COL */
 		};
 
-		pio2: ucc_pin@02 {
+		pio2: ucc_pin@2 {
 			pio-map = <
 		/* port  pin  dir  open_drain  assignment  has_irq */
 				0x1  0x13 0x1  0x0  0x1  0x0    /* QE_MUX_MDC */
@@ -283,7 +283,7 @@
 				0x1  0x8  0x2  0x0  0x2  0x0>;    /* ENET5_RX_ER_SER5_CD_B */
 		};
 
-		pio3: ucc_pin@03 {
+		pio3: ucc_pin@3 {
 			pio-map = <
 		/* port  pin  dir  open_drain  assignment  has_irq */
 				0x0  0x16 0x2  0x0  0x2  0x0    /* SER7_CD_B*/
@@ -293,7 +293,7 @@
 				0x0  0x15 0x1  0x0  0x2  0x0>;    /* SER7_TXD0*/
 		};
 
-		pio4: ucc_pin@04 {
+		pio4: ucc_pin@4 {
 			pio-map = <
 		/* port  pin  dir  open_drain  assignment  has_irq */
 				0x1  0x0  0x2  0x0  0x2  0x0    /* SER3_CD_B*/
diff --git a/arch/powerpc/boot/dts/fsl/p1025rdb_32b.dts b/arch/powerpc/boot/dts/fsl/p1025rdb_32b.dts
index b15acbaea34b..ea33b57f8774 100644
--- a/arch/powerpc/boot/dts/fsl/p1025rdb_32b.dts
+++ b/arch/powerpc/boot/dts/fsl/p1025rdb_32b.dts
@@ -106,7 +106,7 @@
 				interrupts = <4 1 0 0>;
 				reg = <0x6>;
 			};
-			qe_phy1: ethernet-phy@03 {
+			qe_phy1: ethernet-phy@3 {
 				interrupt-parent = <&mpic>;
 				interrupts = <5 1 0 0>;
 				reg = <0x3>;
diff --git a/arch/powerpc/boot/dts/fsl/p1025twr.dtsi b/arch/powerpc/boot/dts/fsl/p1025twr.dtsi
index 08816fb474f5..ab75b8f29ae2 100644
--- a/arch/powerpc/boot/dts/fsl/p1025twr.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p1025twr.dtsi
@@ -172,7 +172,7 @@
 		ranges = <0x0 0xe0100 0x60>;
 		device_type = "par_io";
 		num-ports = <3>;
-		pio1: ucc_pin@01 {
+		pio1: ucc_pin@1 {
 			pio-map = <
 		/* port  pin  dir  open_drain  assignment  has_irq */
 				0x1  0x13 0x1  0x0  0x1  0x0    /* QE_MUX_MDC */
@@ -195,7 +195,7 @@
 				0x0  0x10 0x2  0x0  0x2  0x0>;    /* ENET1_COL */
 		};
 
-		pio2: ucc_pin@02 {
+		pio2: ucc_pin@2 {
 			pio-map = <
 		/* port  pin  dir  open_drain  assignment  has_irq */
 				0x1  0x13 0x1  0x0  0x1  0x0    /* QE_MUX_MDC */
@@ -210,7 +210,7 @@
 				0x1  0x8  0x2  0x0  0x2  0x0>;    /* ENET5_RX_ER_SER5_CD_B */
 		};
 
-		pio3: ucc_pin@03 {
+		pio3: ucc_pin@3 {
 			pio-map = <
 		/* port  pin  dir  open_drain  assignment  has_irq */
 				0x0  0x16 0x2  0x0  0x2  0x0    /* SER7_CD_B*/
@@ -220,7 +220,7 @@
 				0x0  0x15 0x1  0x0  0x2  0x0>;    /* SER7_TXD0*/
 		};
 
-		pio4: ucc_pin@04 {
+		pio4: ucc_pin@4 {
 			pio-map = <
 		/* port  pin  dir  open_drain  assignment  has_irq */
 				0x1  0x0  0x2  0x0  0x2  0x0    /* SER3_CD_B*/
diff --git a/arch/powerpc/boot/dts/fsl/t1040rdb.dts b/arch/powerpc/boot/dts/fsl/t1040rdb.dts
index 621f2c6ee6ad..65ff34c49025 100644
--- a/arch/powerpc/boot/dts/fsl/t1040rdb.dts
+++ b/arch/powerpc/boot/dts/fsl/t1040rdb.dts
@@ -61,7 +61,7 @@
 			};
 
 			mdio@fc000 {
-				phy_sgmii_2: ethernet-phy@03 {
+				phy_sgmii_2: ethernet-phy@3 {
 					reg = <0x03>;
 				};
 			};
diff --git a/arch/powerpc/boot/dts/fsl/t1042d4rdb.dts b/arch/powerpc/boot/dts/fsl/t1042d4rdb.dts
index fcd2aeb5b8ac..4fa15f48a4c3 100644
--- a/arch/powerpc/boot/dts/fsl/t1042d4rdb.dts
+++ b/arch/powerpc/boot/dts/fsl/t1042d4rdb.dts
@@ -77,23 +77,23 @@
 			};
 
 			mdio0: mdio@fc000 {
-				phy_sgmii_0: ethernet-phy@02 {
+				phy_sgmii_0: ethernet-phy@2 {
 					reg = <0x02>;
 				};
 
-				phy_sgmii_1: ethernet-phy@03 {
+				phy_sgmii_1: ethernet-phy@3 {
 					reg = <0x03>;
 				};
 
-				phy_sgmii_2: ethernet-phy@01 {
+				phy_sgmii_2: ethernet-phy@1 {
 					reg = <0x01>;
 				};
 
-				phy_rgmii_0: ethernet-phy@04 {
+				phy_rgmii_0: ethernet-phy@4 {
 					reg = <0x04>;
 				};
 
-				phy_rgmii_1: ethernet-phy@05 {
+				phy_rgmii_1: ethernet-phy@5 {
 					reg = <0x05>;
 				};
 			};
diff --git a/arch/powerpc/boot/dts/fsl/t1042rdb.dts b/arch/powerpc/boot/dts/fsl/t1042rdb.dts
index 2c138627b1b4..3ebb712224cb 100644
--- a/arch/powerpc/boot/dts/fsl/t1042rdb.dts
+++ b/arch/powerpc/boot/dts/fsl/t1042rdb.dts
@@ -59,7 +59,7 @@
 			};
 
 			mdio@fc000 {
-				phy_sgmii_2: ethernet-phy@03 {
+				phy_sgmii_2: ethernet-phy@3 {
 					reg = <0x03>;
 				};
 			};
diff --git a/arch/powerpc/boot/dts/fsl/t104xrdb.dtsi b/arch/powerpc/boot/dts/fsl/t104xrdb.dtsi
index 5fdddbd2a62b..099a598c74c0 100644
--- a/arch/powerpc/boot/dts/fsl/t104xrdb.dtsi
+++ b/arch/powerpc/boot/dts/fsl/t104xrdb.dtsi
@@ -148,15 +148,15 @@
 			};
 
 			mdio0: mdio@fc000 {
-				phy_sgmii_2: ethernet-phy@03 {
+				phy_sgmii_2: ethernet-phy@3 {
 					reg = <0x03>;
 				};
 
-				phy_rgmii_0: ethernet-phy@01 {
+				phy_rgmii_0: ethernet-phy@1 {
 					reg = <0x01>;
 				};
 
-				phy_rgmii_1: ethernet-phy@02 {
+				phy_rgmii_1: ethernet-phy@2 {
 					reg = <0x02>;
 				};
 			};
diff --git a/arch/powerpc/boot/dts/fsp2.dts b/arch/powerpc/boot/dts/fsp2.dts
index f10a64aeb83b..6560283c5aec 100644
--- a/arch/powerpc/boot/dts/fsp2.dts
+++ b/arch/powerpc/boot/dts/fsp2.dts
@@ -583,21 +583,21 @@
 			};
 		};
 
-		OHCI1: ohci@02040000 {
+		OHCI1: ohci@2040000 {
 			compatible = "ohci-le";
 			reg = <0x02040000 0xa0>;
 			interrupt-parent = <&UIC1_3>;
 			interrupts = <28 0x8 29 0x8>;
 		};
 
-		OHCI2: ohci@02080000 {
+		OHCI2: ohci@2080000 {
 			compatible = "ohci-le";
 			reg = <0x02080000 0xa0>;
 			interrupt-parent = <&UIC1_3>;
 			interrupts = <30 0x8 31 0x8>;
 		};
 
-		EHCI: ehci@02000000 {
+		EHCI: ehci@2000000 {
 			compatible = "usb-ehci";
 			reg = <0x02000000 0xa4>;
 			interrupt-parent = <&UIC1_3>;
diff --git a/arch/powerpc/boot/dts/gamecube.dts b/arch/powerpc/boot/dts/gamecube.dts
index ef3be0e58b02..58d06c9ee08b 100644
--- a/arch/powerpc/boot/dts/gamecube.dts
+++ b/arch/powerpc/boot/dts/gamecube.dts
@@ -54,13 +54,13 @@
 		ranges = <0x0c000000 0x0c000000 0x00010000>;
 		interrupt-parent = <&PIC>;
 
-		video@0c002000 {
+		video@c002000 {
 			compatible = "nintendo,flipper-vi";
 			reg = <0x0c002000 0x100>;
 			interrupts = <8>;
 		};
 
-		processor-interface@0c003000 {
+		processor-interface@c003000 {
 			compatible = "nintendo,flipper-pi";
 			reg = <0x0c003000 0x100>;
 
@@ -71,7 +71,7 @@
 			};
 		};
 
-		dsp@0c005000 {
+		dsp@c005000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			compatible = "nintendo,flipper-dsp";
@@ -84,26 +84,26 @@
 			};
 		};
 
-		disk@0c006000 {
+		disk@c006000 {
 			compatible = "nintendo,flipper-di";
 			reg = <0x0c006000 0x40>;
 			interrupts = <2>;
 		};
 
-		audio@0c006c00 {
+		audio@c006c00 {
 			compatible = "nintendo,flipper-ai";
 			reg = <0x0c006c00 0x20>;
 			interrupts = <6>;
 		};
 
-		gamepad-controller@0c006400 {
+		gamepad-controller@c006400 {
 			compatible = "nintendo,flipper-si";
 			reg = <0x0c006400 0x100>;
 			interrupts = <3>;
 		};
 
 		/* External Interface bus */
-		exi@0c006800 {
+		exi@c006800 {
 			compatible = "nintendo,flipper-exi";
 			reg = <0x0c006800 0x40>;
 			virtual-reg = <0x0c006800>;
diff --git a/arch/powerpc/boot/dts/haleakala.dts b/arch/powerpc/boot/dts/haleakala.dts
index 2b256694eca6..cb16dad43c92 100644
--- a/arch/powerpc/boot/dts/haleakala.dts
+++ b/arch/powerpc/boot/dts/haleakala.dts
@@ -237,7 +237,7 @@
 			};
 		};
 
-		PCIE0: pciex@0a0000000 {
+		PCIE0: pciex@a0000000 {
 			device_type = "pci";
 			#interrupt-cells = <1>;
 			#size-cells = <2>;
diff --git a/arch/powerpc/boot/dts/kilauea.dts b/arch/powerpc/boot/dts/kilauea.dts
index 5ba7f01e2a29..2a3413221cc1 100644
--- a/arch/powerpc/boot/dts/kilauea.dts
+++ b/arch/powerpc/boot/dts/kilauea.dts
@@ -322,7 +322,7 @@
 			};
 		};
 
-		PCIE0: pciex@0a0000000 {
+		PCIE0: pciex@a0000000 {
 			device_type = "pci";
 			#interrupt-cells = <1>;
 			#size-cells = <2>;
@@ -363,7 +363,7 @@
 				0x0 0x0 0x0 0x4 &UIC2 0x3 0x4 /* swizzled int D */>;
 		};
 
-		PCIE1: pciex@0c0000000 {
+		PCIE1: pciex@c0000000 {
 			device_type = "pci";
 			#interrupt-cells = <1>;
 			#size-cells = <2>;
diff --git a/arch/powerpc/boot/dts/kmeter1.dts b/arch/powerpc/boot/dts/kmeter1.dts
index 983aee185793..9fa33d9ba966 100644
--- a/arch/powerpc/boot/dts/kmeter1.dts
+++ b/arch/powerpc/boot/dts/kmeter1.dts
@@ -434,27 +434,27 @@
 				compatible = "fsl,ucc-mdio";
 
 				/* Piggy2 (UCC4, MDIO 0x00, RMII) */
-				phy_piggy2: ethernet-phy@00 {
+				phy_piggy2: ethernet-phy@0 {
 					reg = <0x0>;
 				};
 
 				/* Eth-1 (UCC5, MDIO 0x08, RMII) */
-				phy_eth1: ethernet-phy@08 {
+				phy_eth1: ethernet-phy@8 {
 					reg = <0x08>;
 				};
 
 				/* Eth-2 (UCC6, MDIO 0x09, RMII) */
-				phy_eth2: ethernet-phy@09 {
+				phy_eth2: ethernet-phy@9 {
 					reg = <0x09>;
 				};
 
 				/* Eth-3 (UCC7, MDIO 0x0a, RMII) */
-				phy_eth3: ethernet-phy@0a {
+				phy_eth3: ethernet-phy@a {
 					reg = <0x0a>;
 				};
 
 				/* Eth-4 (UCC8, MDIO 0x0b, RMII) */
-				phy_eth4: ethernet-phy@0b {
+				phy_eth4: ethernet-phy@b {
 					reg = <0x0b>;
 				};
 
diff --git a/arch/powerpc/boot/dts/makalu.dts b/arch/powerpc/boot/dts/makalu.dts
index 63d48b632c84..bf8fe1629392 100644
--- a/arch/powerpc/boot/dts/makalu.dts
+++ b/arch/powerpc/boot/dts/makalu.dts
@@ -268,7 +268,7 @@
 			};
 		};
 
-		PCIE0: pciex@0a0000000 {
+		PCIE0: pciex@a0000000 {
 			device_type = "pci";
 			#interrupt-cells = <1>;
 			#size-cells = <2>;
@@ -309,7 +309,7 @@
 				0x0 0x0 0x0 0x4 &UIC2 0x3 0x4 /* swizzled int D */>;
 		};
 
-		PCIE1: pciex@0c0000000 {
+		PCIE1: pciex@c0000000 {
 			device_type = "pci";
 			#interrupt-cells = <1>;
 			#size-cells = <2>;
diff --git a/arch/powerpc/boot/dts/mpc832x_mds.dts b/arch/powerpc/boot/dts/mpc832x_mds.dts
index 0793cdf0d46e..49c7d657118a 100644
--- a/arch/powerpc/boot/dts/mpc832x_mds.dts
+++ b/arch/powerpc/boot/dts/mpc832x_mds.dts
@@ -186,7 +186,7 @@
 			device_type = "par_io";
 			num-ports = <7>;
 
-			pio3: ucc_pin@03 {
+			pio3: ucc_pin@3 {
 				pio-map = <
 			/* port  pin  dir  open_drain  assignment  has_irq */
 					3  4  3  0  2  0  /* MDIO */
@@ -208,7 +208,7 @@
 					1 12  1  0  1  0 	/* TX_EN */
 					1 13  2  0  1  0>;	/* CRS */
 			};
-			pio4: ucc_pin@04 {
+			pio4: ucc_pin@4 {
 				pio-map = <
 			/* port  pin  dir  open_drain  assignment  has_irq */
 					3 31  2  0  1  0 	/* RX_CLK (CLK7) */
@@ -228,7 +228,7 @@
 					1 30  1  0  1  0 	/* TX_EN */
 					1 31  2  0  1  0>;	/* CRS */
 			};
-			pio5: ucc_pin@05 {
+			pio5: ucc_pin@5 {
 				pio-map = <
 				/*
 				 *    		      open       has
@@ -352,12 +352,12 @@
 			reg = <0x2320 0x18>;
 			compatible = "fsl,ucc-mdio";
 
-			phy3: ethernet-phy@03 {
+			phy3: ethernet-phy@3 {
 				interrupt-parent = <&ipic>;
 				interrupts = <17 0x8>;
 				reg = <0x3>;
 			};
-			phy4: ethernet-phy@04 {
+			phy4: ethernet-phy@4 {
 				interrupt-parent = <&ipic>;
 				interrupts = <18 0x8>;
 				reg = <0x4>;
diff --git a/arch/powerpc/boot/dts/mpc832x_rdb.dts b/arch/powerpc/boot/dts/mpc832x_rdb.dts
index 91df1eb16667..647cae14c16d 100644
--- a/arch/powerpc/boot/dts/mpc832x_rdb.dts
+++ b/arch/powerpc/boot/dts/mpc832x_rdb.dts
@@ -175,7 +175,7 @@
 				gpio-controller;
 			};
 
-			ucc2pio:ucc_pin@02 {
+			ucc2pio:ucc_pin@2 {
 				pio-map = <
 			/* port  pin  dir  open_drain  assignment  has_irq */
 					3  4  3  0  2  0 	/* MDIO */
@@ -197,7 +197,7 @@
 					0 30  1  0  1  0 	/* TX_EN */
 					0 31  2  0  1  0>;      /* CRS */
 			};
-			ucc3pio:ucc_pin@03 {
+			ucc3pio:ucc_pin@3 {
 				pio-map = <
 			/* port  pin  dir  open_drain  assignment  has_irq */
 					0 13  2  0  1  0 	/* RX_CLK (CLK9) */
@@ -310,12 +310,12 @@
 			reg = <0x3120 0x18>;
 			compatible = "fsl,ucc-mdio";
 
-			phy00:ethernet-phy@00 {
+			phy00:ethernet-phy@0 {
 				interrupt-parent = <&ipic>;
 				interrupts = <0>;
 				reg = <0x0>;
 			};
-			phy04:ethernet-phy@04 {
+			phy04:ethernet-phy@4 {
 				interrupt-parent = <&ipic>;
 				interrupts = <0>;
 				reg = <0x4>;
diff --git a/arch/powerpc/boot/dts/mpc836x_mds.dts b/arch/powerpc/boot/dts/mpc836x_mds.dts
index ecb6ccd3a6aa..539fd9f72eda 100644
--- a/arch/powerpc/boot/dts/mpc836x_mds.dts
+++ b/arch/powerpc/boot/dts/mpc836x_mds.dts
@@ -228,7 +228,7 @@
 				gpio-controller;
 			};
 
-			pio1: ucc_pin@01 {
+			pio1: ucc_pin@1 {
 				pio-map = <
 			/* port  pin  dir  open_drain  assignment  has_irq */
 					0  3  1  0  1  0 	/* TxD0 */
@@ -255,7 +255,7 @@
 					2  9  1  0  3  0 	/* GTX_CLK - CLK10 */
 					2  8  2  0  1  0>;	/* GTX125 - CLK9 */
 			};
-			pio2: ucc_pin@02 {
+			pio2: ucc_pin@2 {
 				pio-map = <
 			/* port  pin  dir  open_drain  assignment  has_irq */
 					0  17 1  0  1  0   /* TxD0 */
@@ -393,12 +393,12 @@
 			reg = <0x2120 0x18>;
 			compatible = "fsl,ucc-mdio";
 
-			phy0: ethernet-phy@00 {
+			phy0: ethernet-phy@0 {
 				interrupt-parent = <&ipic>;
 				interrupts = <17 0x8>;
 				reg = <0x0>;
 			};
-			phy1: ethernet-phy@01 {
+			phy1: ethernet-phy@1 {
 				interrupt-parent = <&ipic>;
 				interrupts = <18 0x8>;
 				reg = <0x1>;
diff --git a/arch/powerpc/boot/dts/sbc8548-altflash.dts b/arch/powerpc/boot/dts/sbc8548-altflash.dts
index 0b38a0defd2c..8967a56adad4 100644
--- a/arch/powerpc/boot/dts/sbc8548-altflash.dts
+++ b/arch/powerpc/boot/dts/sbc8548-altflash.dts
@@ -40,12 +40,12 @@
 			compatible = "intel,JS28F128", "cfi-flash";
 			bank-width = <4>;
 			device-width = <1>;
-			partition@0x0 {
+			partition@0 {
 				label = "space";
 				/* FC000000 -> FFEFFFFF */
 				reg = <0x00000000 0x03f00000>;
 			};
-			partition@0x03f00000 {
+			partition@3f00000 {
 				label = "bootloader";
 				/* FFF00000 -> FFFFFFFF */
 				reg = <0x03f00000 0x00100000>;
@@ -95,12 +95,12 @@
 			reg = <0x6 0x0 0x800000>;
 			bank-width = <1>;
 			device-width = <1>;
-			partition@0x0 {
+			partition@0 {
 				label = "space";
 				/* EF800000 -> EFF9FFFF */
 				reg = <0x00000000 0x007a0000>;
 			};
-			partition@0x7a0000 {
+			partition@7a0000 {
 				label = "bootloader";
 				/* EFFA0000 -> EFFFFFFF */
 				reg = <0x007a0000 0x00060000>;
diff --git a/arch/powerpc/boot/dts/sbc8548.dts b/arch/powerpc/boot/dts/sbc8548.dts
index 1df2a0955668..9bdb828a504e 100644
--- a/arch/powerpc/boot/dts/sbc8548.dts
+++ b/arch/powerpc/boot/dts/sbc8548.dts
@@ -38,12 +38,12 @@
 			reg = <0x0 0x0 0x800000>;
 			bank-width = <1>;
 			device-width = <1>;
-			partition@0x0 {
+			partition@0 {
 				label = "space";
 				/* FF800000 -> FFF9FFFF */
 				reg = <0x00000000 0x007a0000>;
 			};
-			partition@0x7a0000 {
+			partition@7a0000 {
 				label = "bootloader";
 				/* FFFA0000 -> FFFFFFFF */
 				reg = <0x007a0000 0x00060000>;
@@ -92,12 +92,12 @@
 			compatible = "intel,JS28F128", "cfi-flash";
 			bank-width = <4>;
 			device-width = <1>;
-			partition@0x0 {
+			partition@0 {
 				label = "space";
 				/* EC000000 -> EFEFFFFF */
 				reg = <0x00000000 0x03f00000>;
 			};
-			partition@0x03f00000 {
+			partition@3f00000 {
 				label = "bootloader";
 				/* EFF00000 -> EFFFFFFF */
 				reg = <0x03f00000 0x00100000>;
diff --git a/arch/powerpc/boot/dts/wii.dts b/arch/powerpc/boot/dts/wii.dts
index 77528c9a8dbd..17a5babb098d 100644
--- a/arch/powerpc/boot/dts/wii.dts
+++ b/arch/powerpc/boot/dts/wii.dts
@@ -65,14 +65,14 @@
 			  0x0d800000 0x0d800000 0x00800000>;
 		interrupt-parent = <&PIC0>;
 
-		video@0c002000 {
+		video@c002000 {
 			compatible = "nintendo,hollywood-vi",
 					"nintendo,flipper-vi";
 			reg = <0x0c002000 0x100>;
 			interrupts = <8>;
 		};
 
-		processor-interface@0c003000 {
+		processor-interface@c003000 {
 			compatible = "nintendo,hollywood-pi",
 					"nintendo,flipper-pi";
 			reg = <0x0c003000 0x100>;
@@ -84,7 +84,7 @@
 			};
 		};
 
-		dsp@0c005000 {
+		dsp@c005000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			compatible = "nintendo,hollywood-dsp",
@@ -93,14 +93,14 @@
 			interrupts = <6>;
 		};
 
-		gamepad-controller@0d006400 {
+		gamepad-controller@d006400 {
 			compatible = "nintendo,hollywood-si",
 					"nintendo,flipper-si";
 			reg = <0x0d006400 0x100>;
 			interrupts = <3>;
 		};
 
-		audio@0c006c00 {
+		audio@c006c00 {
 			compatible = "nintendo,hollywood-ai",
 					"nintendo,flipper-ai";
 			reg = <0x0d006c00 0x20>;
@@ -108,7 +108,7 @@
 		};
 
 		/* External Interface bus */
-		exi@0d006800 {
+		exi@d006800 {
 			compatible = "nintendo,hollywood-exi",
 					"nintendo,flipper-exi";
 			reg = <0x0d006800 0x40>;
@@ -116,7 +116,7 @@
 			interrupts = <4>;
 		};
 
-		usb@0d040000 {
+		usb@d040000 {
 			compatible = "nintendo,hollywood-usb-ehci",
 					"usb-ehci";
 			reg = <0x0d040000 0x100>;
@@ -124,7 +124,7 @@
 			interrupt-parent = <&PIC1>;
 		};
 
-		usb@0d050000 {
+		usb@d050000 {
 			compatible = "nintendo,hollywood-usb-ohci",
 					"usb-ohci";
 			reg = <0x0d050000 0x100>;
@@ -132,7 +132,7 @@
 			interrupt-parent = <&PIC1>;
 		};
 
-		usb@0d060000 {
+		usb@d060000 {
 			compatible = "nintendo,hollywood-usb-ohci",
 					"usb-ohci";
 			reg = <0x0d060000 0x100>;
@@ -140,7 +140,7 @@
 			interrupt-parent = <&PIC1>;
 		};
 
-		sd@0d070000 {
+		sd@d070000 {
 			compatible = "nintendo,hollywood-sdhci",
 					"sdhci";
 			reg = <0x0d070000 0x200>;
@@ -148,7 +148,7 @@
 			interrupt-parent = <&PIC1>;
 		};
 
-		sdio@0d080000 {
+		sdio@d080000 {
 			compatible = "nintendo,hollywood-sdhci",
 					"sdhci";
 			reg = <0x0d080000 0x200>;
@@ -156,14 +156,14 @@
 			interrupt-parent = <&PIC1>;
 		};
 
-		ipc@0d000000 {
+		ipc@d000000 {
 			compatible = "nintendo,hollywood-ipc";
 			reg = <0x0d000000 0x10>;
 			interrupts = <30>;
 			interrupt-parent = <&PIC1>;
 		};
 
-		PIC1: pic1@0d800030 {
+		PIC1: pic1@d800030 {
 			#interrupt-cells = <1>;
 			compatible = "nintendo,hollywood-pic";
 			reg = <0x0d800030 0x10>;
@@ -171,7 +171,7 @@
 			interrupts = <14>;
 		};
 
-		GPIO: gpio@0d8000c0 {
+		GPIO: gpio@d8000c0 {
 			#gpio-cells = <2>;
 			compatible = "nintendo,hollywood-gpio";
 			reg = <0x0d8000c0 0x40>;
@@ -203,12 +203,12 @@
 			*/
 		};
 
-		control@0d800100 {
+		control@d800100 {
 			compatible = "nintendo,hollywood-control";
 			reg = <0x0d800100 0x300>;
 		};
 
-		disk@0d806000 {
+		disk@d806000 {
 			compatible = "nintendo,hollywood-di";
 			reg = <0x0d806000 0x40>;
 			interrupts = <2>;
diff --git a/arch/xtensa/boot/dts/csp.dts b/arch/xtensa/boot/dts/csp.dts
index 885495460f7e..96c9bca1d737 100644
--- a/arch/xtensa/boot/dts/csp.dts
+++ b/arch/xtensa/boot/dts/csp.dts
@@ -44,7 +44,7 @@
 		compatible = "simple-bus";
 		ranges = <0x00000000 0xf0000000 0x10000000>;
 
-		uart0: serial@0d000000 {
+		uart0: serial@d000000 {
 			compatible = "xlnx,xuartps", "cdns,uart-r1p8";
 			clocks = <&osc>, <&osc>;
 			clock-names = "uart_clk", "pclk";
diff --git a/arch/xtensa/boot/dts/xtfpga-flash-128m.dtsi b/arch/xtensa/boot/dts/xtfpga-flash-128m.dtsi
index 9bf8bad1dd18..7b0cd356e0db 100644
--- a/arch/xtensa/boot/dts/xtfpga-flash-128m.dtsi
+++ b/arch/xtensa/boot/dts/xtfpga-flash-128m.dtsi
@@ -1,26 +1,26 @@
 // SPDX-License-Identifier: GPL-2.0
 / {
 	soc {
-		flash: flash@00000000 {
+		flash: flash@0 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			compatible = "cfi-flash";
 			reg = <0x00000000 0x08000000>;
 			bank-width = <2>;
 			device-width = <2>;
-			partition@0x0 {
+			partition@0 {
 				label = "data";
 				reg = <0x00000000 0x06000000>;
 			};
-			partition@0x6000000 {
+			partition@6000000 {
 				label = "boot loader area";
 				reg = <0x06000000 0x00800000>;
 			};
-			partition@0x6800000 {
+			partition@6800000 {
 				label = "kernel image";
 				reg = <0x06800000 0x017e0000>;
 			};
-			partition@0x7fe0000 {
+			partition@7fe0000 {
 				label = "boot environment";
 				reg = <0x07fe0000 0x00020000>;
 			};
diff --git a/arch/xtensa/boot/dts/xtfpga-flash-16m.dtsi b/arch/xtensa/boot/dts/xtfpga-flash-16m.dtsi
index 40c2f81f7cb6..c5e56cf0f8df 100644
--- a/arch/xtensa/boot/dts/xtfpga-flash-16m.dtsi
+++ b/arch/xtensa/boot/dts/xtfpga-flash-16m.dtsi
@@ -1,26 +1,26 @@
 // SPDX-License-Identifier: GPL-2.0
 / {
 	soc {
-		flash: flash@08000000 {
+		flash: flash@8000000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			compatible = "cfi-flash";
 			reg = <0x08000000 0x01000000>;
 			bank-width = <2>;
 			device-width = <2>;
-			partition@0x0 {
+			partition@0 {
 				label = "boot loader area";
 				reg = <0x00000000 0x00400000>;
 			};
-			partition@0x400000 {
+			partition@400000 {
 				label = "kernel image";
 				reg = <0x00400000 0x00600000>;
 			};
-			partition@0xa00000 {
+			partition@a00000 {
 				label = "data";
 				reg = <0x00a00000 0x005e0000>;
 			};
-			partition@0xfe0000 {
+			partition@fe0000 {
 				label = "boot environment";
 				reg = <0x00fe0000 0x00020000>;
 			};
diff --git a/arch/xtensa/boot/dts/xtfpga-flash-4m.dtsi b/arch/xtensa/boot/dts/xtfpga-flash-4m.dtsi
index fb8d3a9f33c2..ad0d2ec45447 100644
--- a/arch/xtensa/boot/dts/xtfpga-flash-4m.dtsi
+++ b/arch/xtensa/boot/dts/xtfpga-flash-4m.dtsi
@@ -1,18 +1,18 @@
 // SPDX-License-Identifier: GPL-2.0
 / {
 	soc {
-		flash: flash@08000000 {
+		flash: flash@8000000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			compatible = "cfi-flash";
 			reg = <0x08000000 0x00400000>;
 			bank-width = <2>;
 			device-width = <2>;
-			partition@0x0 {
+			partition@0 {
 				label = "boot loader area";
 				reg = <0x00000000 0x003f0000>;
 			};
-			partition@0x3f0000 {
+			partition@3f0000 {
 				label = "boot environment";
 				reg = <0x003f0000 0x00010000>;
 			};
diff --git a/arch/xtensa/boot/dts/xtfpga.dtsi b/arch/xtensa/boot/dts/xtfpga.dtsi
index 1090528825ec..5ede496ed9be 100644
--- a/arch/xtensa/boot/dts/xtfpga.dtsi
+++ b/arch/xtensa/boot/dts/xtfpga.dtsi
@@ -54,7 +54,7 @@
 			reg = <0x0d020004 0x4>;
 		};
 
-		serial0: serial@0d050020 {
+		serial0: serial@d050020 {
 			device_type = "serial";
 			compatible = "ns16550a";
 			no-loopback-test;
@@ -66,7 +66,7 @@
 			clocks = <&osc>;
 		};
 
-		enet0: ethoc@0d030000 {
+		enet0: ethoc@d030000 {
 			compatible = "opencores,ethoc";
 			reg = <0x0d030000 0x4000 0x0d800000 0x4000>;
 			native-endian;
@@ -75,7 +75,7 @@
 			clocks = <&osc>;
 		};
 
-		i2s0: xtfpga-i2s@0d080000 {
+		i2s0: xtfpga-i2s@d080000 {
 			#sound-dai-cells = <0>;
 			compatible = "cdns,xtfpga-i2s";
 			reg = <0x0d080000 0x40>;
@@ -83,7 +83,7 @@
 			clocks = <&cdce706 4>;
 		};
 
-		i2c0: i2c-master@0d090000 {
+		i2c0: i2c-master@d090000 {
 			compatible = "opencores,i2c-ocores";
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -103,7 +103,7 @@
 			};
 		};
 
-		spi0: spi-master@0d0a0000 {
+		spi0: spi-master@d0a0000 {
 			compatible = "cdns,xtfpga-spi";
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
