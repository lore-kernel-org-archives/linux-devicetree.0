From: Marco Franchi <marco.franchi-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH v2] ARM: dts: imx6qdl: Remove leading zeroes from unit addresses
Date: Fri, 22 Sep 2017 11:31:06 -0300
Message-ID: <1506090666-10587-1-git-send-email-marco.franchi@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, marcofrk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Marco Franchi <marco.franchi-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The following build warnings are seen with W=1:

Warning (simple_bus_reg): Node /soc/sram@00900000 simple-bus unit 
address format error, expected "900000"
Warning (simple_bus_reg): Node /soc/aips-bus@02000000 simple-bus unit 
address format error, expected "2000000"
Warning (simple_bus_reg): Node /soc/aips-bus@02000000/pxp@020f0000 
simple-bus unit address format error, expected "20f0000"
(...)

Remove the leading zeroes from unit addresses to fix the warnings.

Signed-off-by: Marco Franchi <marco.franchi-3arQi8VN3Tc@public.gmane.org>
---
Changes since v1:
- Send to the correct list address
 arch/arm/boot/dts/imx6dl.dtsi  |  16 ++--
 arch/arm/boot/dts/imx6q.dtsi   |  16 ++--
 arch/arm/boot/dts/imx6qdl.dtsi | 178 ++++++++++++++++++++---------------------
 arch/arm/boot/dts/imx6qp.dtsi  |   2 +-
 4 files changed, 106 insertions(+), 106 deletions(-)

diff --git a/arch/arm/boot/dts/imx6dl.dtsi b/arch/arm/boot/dts/imx6dl.dtsi
index 8475e6c..4d693a7 100644
--- a/arch/arm/boot/dts/imx6dl.dtsi
+++ b/arch/arm/boot/dts/imx6dl.dtsi
@@ -60,35 +60,35 @@
 	};
 
 	soc {
-		ocram: sram@00900000 {
+		ocram: sram@900000 {
 			compatible = "mmio-sram";
 			reg = <0x00900000 0x20000>;
 			clocks = <&clks IMX6QDL_CLK_OCRAM>;
 		};
 
-		aips1: aips-bus@02000000 {
-			iomuxc: iomuxc@020e0000 {
+		aips1: aips-bus@2000000 {
+			iomuxc: iomuxc@20e0000 {
 				compatible = "fsl,imx6dl-iomuxc";
 			};
 
-			pxp: pxp@020f0000 {
+			pxp: pxp@20f0000 {
 				reg = <0x020f0000 0x4000>;
 				interrupts = <0 98 IRQ_TYPE_LEVEL_HIGH>;
 			};
 
-			epdc: epdc@020f4000 {
+			epdc: epdc@20f4000 {
 				reg = <0x020f4000 0x4000>;
 				interrupts = <0 97 IRQ_TYPE_LEVEL_HIGH>;
 			};
 
-			lcdif: lcdif@020f8000 {
+			lcdif: lcdif@20f8000 {
 				reg = <0x020f8000 0x4000>;
 				interrupts = <0 39 IRQ_TYPE_LEVEL_HIGH>;
 			};
 		};
 
-		aips2: aips-bus@02100000 {
-			i2c4: i2c@021f8000 {
+		aips2: aips-bus@2100000 {
+			i2c4: i2c@21f8000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				compatible = "fsl,imx6q-i2c", "fsl,imx21-i2c";
diff --git a/arch/arm/boot/dts/imx6q.dtsi b/arch/arm/boot/dts/imx6q.dtsi
index 90a7417..bc581aa 100644
--- a/arch/arm/boot/dts/imx6q.dtsi
+++ b/arch/arm/boot/dts/imx6q.dtsi
@@ -79,15 +79,15 @@
 	};
 
 	soc {
-		ocram: sram@00900000 {
+		ocram: sram@900000 {
 			compatible = "mmio-sram";
 			reg = <0x00900000 0x40000>;
 			clocks = <&clks IMX6QDL_CLK_OCRAM>;
 		};
 
-		aips-bus@02000000 { /* AIPS1 */
-			spba-bus@02000000 {
-				ecspi5: ecspi@02018000 {
+		aips-bus@2000000 { /* AIPS1 */
+			spba-bus@2000000 {
+				ecspi5: ecspi@2018000 {
 					#address-cells = <1>;
 					#size-cells = <0>;
 					compatible = "fsl,imx6q-ecspi", "fsl,imx51-ecspi";
@@ -102,12 +102,12 @@
 				};
 			};
 
-			iomuxc: iomuxc@020e0000 {
+			iomuxc: iomuxc@20e0000 {
 				compatible = "fsl,imx6q-iomuxc";
 			};
 		};
 
-		sata: sata@02200000 {
+		sata: sata@2200000 {
 			compatible = "fsl,imx6q-ahci";
 			reg = <0x02200000 0x4000>;
 			interrupts = <0 39 IRQ_TYPE_LEVEL_HIGH>;
@@ -118,7 +118,7 @@
 			status = "disabled";
 		};
 
-		gpu_vg: gpu@02204000 {
+		gpu_vg: gpu@2204000 {
 			compatible = "vivante,gc";
 			reg = <0x02204000 0x4000>;
 			interrupts = <0 11 IRQ_TYPE_LEVEL_HIGH>;
@@ -128,7 +128,7 @@
 			power-domains = <&pd_pu>;
 		};
 
-		ipu2: ipu@02800000 {
+		ipu2: ipu@2800000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			compatible = "fsl,imx6q-ipu";
diff --git a/arch/arm/boot/dts/imx6qdl.dtsi b/arch/arm/boot/dts/imx6qdl.dtsi
index 8884b4a..1ce4eab 100644
--- a/arch/arm/boot/dts/imx6qdl.dtsi
+++ b/arch/arm/boot/dts/imx6qdl.dtsi
@@ -87,7 +87,7 @@
 		interrupt-parent = <&gpc>;
 		ranges;
 
-		dma_apbh: dma-apbh@00110000 {
+		dma_apbh: dma-apbh@110000 {
 			compatible = "fsl,imx6q-dma-apbh", "fsl,imx28-dma-apbh";
 			reg = <0x00110000 0x2000>;
 			interrupts = <0 13 IRQ_TYPE_LEVEL_HIGH>,
@@ -100,7 +100,7 @@
 			clocks = <&clks IMX6QDL_CLK_APBH_DMA>;
 		};
 
-		gpmi: gpmi-nand@00112000 {
+		gpmi: gpmi-nand@112000 {
 			compatible = "fsl,imx6q-gpmi-nand";
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -120,7 +120,7 @@
 			status = "disabled";
 		};
 
-		hdmi: hdmi@0120000 {
+		hdmi: hdmi@120000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0x00120000 0x9000>;
@@ -148,7 +148,7 @@
 			};
 		};
 
-		gpu_3d: gpu@00130000 {
+		gpu_3d: gpu@130000 {
 			compatible = "vivante,gc";
 			reg = <0x00130000 0x4000>;
 			interrupts = <0 9 IRQ_TYPE_LEVEL_HIGH>;
@@ -159,7 +159,7 @@
 			power-domains = <&pd_pu>;
 		};
 
-		gpu_2d: gpu@00134000 {
+		gpu_2d: gpu@134000 {
 			compatible = "vivante,gc";
 			reg = <0x00134000 0x4000>;
 			interrupts = <0 10 IRQ_TYPE_LEVEL_HIGH>;
@@ -169,7 +169,7 @@
 			power-domains = <&pd_pu>;
 		};
 
-		timer@00a00600 {
+		timer@a00600 {
 			compatible = "arm,cortex-a9-twd-timer";
 			reg = <0x00a00600 0x20>;
 			interrupts = <1 13 0xf01>;
@@ -177,7 +177,7 @@
 			clocks = <&clks IMX6QDL_CLK_TWD>;
 		};
 
-		intc: interrupt-controller@00a01000 {
+		intc: interrupt-controller@a01000 {
 			compatible = "arm,cortex-a9-gic";
 			#interrupt-cells = <3>;
 			interrupt-controller;
@@ -186,7 +186,7 @@
 			interrupt-parent = <&intc>;
 		};
 
-		L2: l2-cache@00a02000 {
+		L2: l2-cache@a02000 {
 			compatible = "arm,pl310-cache";
 			reg = <0x00a02000 0x1000>;
 			interrupts = <0 92 IRQ_TYPE_LEVEL_HIGH>;
@@ -229,21 +229,21 @@
 			interrupts = <0 94 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-		aips-bus@02000000 { /* AIPS1 */
+		aips-bus@2000000 { /* AIPS1 */
 			compatible = "fsl,aips-bus", "simple-bus";
 			#address-cells = <1>;
 			#size-cells = <1>;
 			reg = <0x02000000 0x100000>;
 			ranges;
 
-			spba-bus@02000000 {
+			spba-bus@2000000 {
 				compatible = "fsl,spba-bus", "simple-bus";
 				#address-cells = <1>;
 				#size-cells = <1>;
 				reg = <0x02000000 0x40000>;
 				ranges;
 
-				spdif: spdif@02004000 {
+				spdif: spdif@2004000 {
 					compatible = "fsl,imx35-spdif";
 					reg = <0x02004000 0x4000>;
 					interrupts = <0 52 IRQ_TYPE_LEVEL_HIGH>;
@@ -263,7 +263,7 @@
 					status = "disabled";
 				};
 
-				ecspi1: ecspi@02008000 {
+				ecspi1: ecspi@2008000 {
 					#address-cells = <1>;
 					#size-cells = <0>;
 					compatible = "fsl,imx6q-ecspi", "fsl,imx51-ecspi";
@@ -277,7 +277,7 @@
 					status = "disabled";
 				};
 
-				ecspi2: ecspi@0200c000 {
+				ecspi2: ecspi@200c000 {
 					#address-cells = <1>;
 					#size-cells = <0>;
 					compatible = "fsl,imx6q-ecspi", "fsl,imx51-ecspi";
@@ -291,7 +291,7 @@
 					status = "disabled";
 				};
 
-				ecspi3: ecspi@02010000 {
+				ecspi3: ecspi@2010000 {
 					#address-cells = <1>;
 					#size-cells = <0>;
 					compatible = "fsl,imx6q-ecspi", "fsl,imx51-ecspi";
@@ -305,7 +305,7 @@
 					status = "disabled";
 				};
 
-				ecspi4: ecspi@02014000 {
+				ecspi4: ecspi@2014000 {
 					#address-cells = <1>;
 					#size-cells = <0>;
 					compatible = "fsl,imx6q-ecspi", "fsl,imx51-ecspi";
@@ -319,7 +319,7 @@
 					status = "disabled";
 				};
 
-				uart1: serial@02020000 {
+				uart1: serial@2020000 {
 					compatible = "fsl,imx6q-uart", "fsl,imx21-uart";
 					reg = <0x02020000 0x4000>;
 					interrupts = <0 26 IRQ_TYPE_LEVEL_HIGH>;
@@ -331,7 +331,7 @@
 					status = "disabled";
 				};
 
-				esai: esai@02024000 {
+				esai: esai@2024000 {
 					#sound-dai-cells = <0>;
 					compatible = "fsl,imx35-esai";
 					reg = <0x02024000 0x4000>;
@@ -347,7 +347,7 @@
 					status = "disabled";
 				};
 
-				ssi1: ssi@02028000 {
+				ssi1: ssi@2028000 {
 					#sound-dai-cells = <0>;
 					compatible = "fsl,imx6q-ssi",
 							"fsl,imx51-ssi";
@@ -363,7 +363,7 @@
 					status = "disabled";
 				};
 
-				ssi2: ssi@0202c000 {
+				ssi2: ssi@202c000 {
 					#sound-dai-cells = <0>;
 					compatible = "fsl,imx6q-ssi",
 							"fsl,imx51-ssi";
@@ -379,7 +379,7 @@
 					status = "disabled";
 				};
 
-				ssi3: ssi@02030000 {
+				ssi3: ssi@2030000 {
 					#sound-dai-cells = <0>;
 					compatible = "fsl,imx6q-ssi",
 							"fsl,imx51-ssi";
@@ -395,7 +395,7 @@
 					status = "disabled";
 				};
 
-				asrc: asrc@02034000 {
+				asrc: asrc@2034000 {
 					compatible = "fsl,imx53-asrc";
 					reg = <0x02034000 0x4000>;
 					interrupts = <0 50 IRQ_TYPE_LEVEL_HIGH>;
@@ -420,12 +420,12 @@
 					status = "okay";
 				};
 
-				spba@0203c000 {
+				spba@203c000 {
 					reg = <0x0203c000 0x4000>;
 				};
 			};
 
-			vpu: vpu@02040000 {
+			vpu: vpu@2040000 {
 				compatible = "cnm,coda960";
 				reg = <0x02040000 0x3c000>;
 				interrupts = <0 12 IRQ_TYPE_LEVEL_HIGH>,
@@ -439,11 +439,11 @@
 				iram = <&ocram>;
 			};
 
-			aipstz@0207c000 { /* AIPSTZ1 */
+			aipstz@207c000 { /* AIPSTZ1 */
 				reg = <0x0207c000 0x4000>;
 			};
 
-			pwm1: pwm@02080000 {
+			pwm1: pwm@2080000 {
 				#pwm-cells = <2>;
 				compatible = "fsl,imx6q-pwm", "fsl,imx27-pwm";
 				reg = <0x02080000 0x4000>;
@@ -454,7 +454,7 @@
 				status = "disabled";
 			};
 
-			pwm2: pwm@02084000 {
+			pwm2: pwm@2084000 {
 				#pwm-cells = <2>;
 				compatible = "fsl,imx6q-pwm", "fsl,imx27-pwm";
 				reg = <0x02084000 0x4000>;
@@ -465,7 +465,7 @@
 				status = "disabled";
 			};
 
-			pwm3: pwm@02088000 {
+			pwm3: pwm@2088000 {
 				#pwm-cells = <2>;
 				compatible = "fsl,imx6q-pwm", "fsl,imx27-pwm";
 				reg = <0x02088000 0x4000>;
@@ -476,7 +476,7 @@
 				status = "disabled";
 			};
 
-			pwm4: pwm@0208c000 {
+			pwm4: pwm@208c000 {
 				#pwm-cells = <2>;
 				compatible = "fsl,imx6q-pwm", "fsl,imx27-pwm";
 				reg = <0x0208c000 0x4000>;
@@ -487,7 +487,7 @@
 				status = "disabled";
 			};
 
-			can1: flexcan@02090000 {
+			can1: flexcan@2090000 {
 				compatible = "fsl,imx6q-flexcan";
 				reg = <0x02090000 0x4000>;
 				interrupts = <0 110 IRQ_TYPE_LEVEL_HIGH>;
@@ -497,7 +497,7 @@
 				status = "disabled";
 			};
 
-			can2: flexcan@02094000 {
+			can2: flexcan@2094000 {
 				compatible = "fsl,imx6q-flexcan";
 				reg = <0x02094000 0x4000>;
 				interrupts = <0 111 IRQ_TYPE_LEVEL_HIGH>;
@@ -507,7 +507,7 @@
 				status = "disabled";
 			};
 
-			gpt: gpt@02098000 {
+			gpt: gpt@2098000 {
 				compatible = "fsl,imx6q-gpt", "fsl,imx31-gpt";
 				reg = <0x02098000 0x4000>;
 				interrupts = <0 55 IRQ_TYPE_LEVEL_HIGH>;
@@ -517,7 +517,7 @@
 				clock-names = "ipg", "per", "osc_per";
 			};
 
-			gpio1: gpio@0209c000 {
+			gpio1: gpio@209c000 {
 				compatible = "fsl,imx6q-gpio", "fsl,imx35-gpio";
 				reg = <0x0209c000 0x4000>;
 				interrupts = <0 66 IRQ_TYPE_LEVEL_HIGH>,
@@ -528,7 +528,7 @@
 				#interrupt-cells = <2>;
 			};
 
-			gpio2: gpio@020a0000 {
+			gpio2: gpio@20a0000 {
 				compatible = "fsl,imx6q-gpio", "fsl,imx35-gpio";
 				reg = <0x020a0000 0x4000>;
 				interrupts = <0 68 IRQ_TYPE_LEVEL_HIGH>,
@@ -539,7 +539,7 @@
 				#interrupt-cells = <2>;
 			};
 
-			gpio3: gpio@020a4000 {
+			gpio3: gpio@20a4000 {
 				compatible = "fsl,imx6q-gpio", "fsl,imx35-gpio";
 				reg = <0x020a4000 0x4000>;
 				interrupts = <0 70 IRQ_TYPE_LEVEL_HIGH>,
@@ -550,7 +550,7 @@
 				#interrupt-cells = <2>;
 			};
 
-			gpio4: gpio@020a8000 {
+			gpio4: gpio@20a8000 {
 				compatible = "fsl,imx6q-gpio", "fsl,imx35-gpio";
 				reg = <0x020a8000 0x4000>;
 				interrupts = <0 72 IRQ_TYPE_LEVEL_HIGH>,
@@ -561,7 +561,7 @@
 				#interrupt-cells = <2>;
 			};
 
-			gpio5: gpio@020ac000 {
+			gpio5: gpio@20ac000 {
 				compatible = "fsl,imx6q-gpio", "fsl,imx35-gpio";
 				reg = <0x020ac000 0x4000>;
 				interrupts = <0 74 IRQ_TYPE_LEVEL_HIGH>,
@@ -572,7 +572,7 @@
 				#interrupt-cells = <2>;
 			};
 
-			gpio6: gpio@020b0000 {
+			gpio6: gpio@20b0000 {
 				compatible = "fsl,imx6q-gpio", "fsl,imx35-gpio";
 				reg = <0x020b0000 0x4000>;
 				interrupts = <0 76 IRQ_TYPE_LEVEL_HIGH>,
@@ -583,7 +583,7 @@
 				#interrupt-cells = <2>;
 			};
 
-			gpio7: gpio@020b4000 {
+			gpio7: gpio@20b4000 {
 				compatible = "fsl,imx6q-gpio", "fsl,imx35-gpio";
 				reg = <0x020b4000 0x4000>;
 				interrupts = <0 78 IRQ_TYPE_LEVEL_HIGH>,
@@ -594,7 +594,7 @@
 				#interrupt-cells = <2>;
 			};
 
-			kpp: kpp@020b8000 {
+			kpp: kpp@20b8000 {
 				compatible = "fsl,imx6q-kpp", "fsl,imx21-kpp";
 				reg = <0x020b8000 0x4000>;
 				interrupts = <0 82 IRQ_TYPE_LEVEL_HIGH>;
@@ -602,14 +602,14 @@
 				status = "disabled";
 			};
 
-			wdog1: wdog@020bc000 {
+			wdog1: wdog@20bc000 {
 				compatible = "fsl,imx6q-wdt", "fsl,imx21-wdt";
 				reg = <0x020bc000 0x4000>;
 				interrupts = <0 80 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX6QDL_CLK_DUMMY>;
 			};
 
-			wdog2: wdog@020c0000 {
+			wdog2: wdog@20c0000 {
 				compatible = "fsl,imx6q-wdt", "fsl,imx21-wdt";
 				reg = <0x020c0000 0x4000>;
 				interrupts = <0 81 IRQ_TYPE_LEVEL_HIGH>;
@@ -617,7 +617,7 @@
 				status = "disabled";
 			};
 
-			clks: ccm@020c4000 {
+			clks: ccm@20c4000 {
 				compatible = "fsl,imx6q-ccm";
 				reg = <0x020c4000 0x4000>;
 				interrupts = <0 87 IRQ_TYPE_LEVEL_HIGH>,
@@ -625,7 +625,7 @@
 				#clock-cells = <1>;
 			};
 
-			anatop: anatop@020c8000 {
+			anatop: anatop@20c8000 {
 				compatible = "fsl,imx6q-anatop", "syscon", "simple-bus";
 				reg = <0x020c8000 0x1000>;
 				interrupts = <0 49 IRQ_TYPE_LEVEL_HIGH>,
@@ -737,7 +737,7 @@
 				clocks = <&clks IMX6QDL_CLK_PLL3_USB_OTG>;
 			};
 
-			usbphy1: usbphy@020c9000 {
+			usbphy1: usbphy@20c9000 {
 				compatible = "fsl,imx6q-usbphy", "fsl,imx23-usbphy";
 				reg = <0x020c9000 0x1000>;
 				interrupts = <0 44 IRQ_TYPE_LEVEL_HIGH>;
@@ -745,7 +745,7 @@
 				fsl,anatop = <&anatop>;
 			};
 
-			usbphy2: usbphy@020ca000 {
+			usbphy2: usbphy@20ca000 {
 				compatible = "fsl,imx6q-usbphy", "fsl,imx23-usbphy";
 				reg = <0x020ca000 0x1000>;
 				interrupts = <0 45 IRQ_TYPE_LEVEL_HIGH>;
@@ -753,7 +753,7 @@
 				fsl,anatop = <&anatop>;
 			};
 
-			snvs: snvs@020cc000 {
+			snvs: snvs@20cc000 {
 				compatible = "fsl,sec-v4.0-mon", "syscon", "simple-mfd";
 				reg = <0x020cc000 0x4000>;
 
@@ -775,17 +775,17 @@
 				};
 			};
 
-			epit1: epit@020d0000 { /* EPIT1 */
+			epit1: epit@20d0000 { /* EPIT1 */
 				reg = <0x020d0000 0x4000>;
 				interrupts = <0 56 IRQ_TYPE_LEVEL_HIGH>;
 			};
 
-			epit2: epit@020d4000 { /* EPIT2 */
+			epit2: epit@20d4000 { /* EPIT2 */
 				reg = <0x020d4000 0x4000>;
 				interrupts = <0 57 IRQ_TYPE_LEVEL_HIGH>;
 			};
 
-			src: src@020d8000 {
+			src: src@20d8000 {
 				compatible = "fsl,imx6q-src", "fsl,imx51-src";
 				reg = <0x020d8000 0x4000>;
 				interrupts = <0 91 IRQ_TYPE_LEVEL_HIGH>,
@@ -793,7 +793,7 @@
 				#reset-cells = <1>;
 			};
 
-			gpc: gpc@020dc000 {
+			gpc: gpc@20dc000 {
 				compatible = "fsl,imx6q-gpc";
 				reg = <0x020dc000 0x4000>;
 				interrupt-controller;
@@ -826,9 +826,9 @@
 				};
 			};
 
-			gpr: iomuxc-gpr@020e0000 {
+			gpr: iomuxc-gpr@20e0000 {
 				compatible = "fsl,imx6q-iomuxc-gpr", "syscon", "simple-mfd";
-				reg = <0x020e0000 0x38>;
+				reg = <0x20e0000 0x38>;
 
 				mux: mux-controller {
 					compatible = "mmio-mux";
@@ -836,9 +836,9 @@
 				};
 			};
 
-			iomuxc: iomuxc@020e0000 {
+			iomuxc: iomuxc@20e0000 {
 				compatible = "fsl,imx6dl-iomuxc", "fsl,imx6q-iomuxc";
-				reg = <0x020e0000 0x4000>;
+				reg = <0x20e0000 0x4000>;
 			};
 
 			ldb: ldb {
@@ -895,17 +895,17 @@
 				};
 			};
 
-			dcic1: dcic@020e4000 {
+			dcic1: dcic@20e4000 {
 				reg = <0x020e4000 0x4000>;
 				interrupts = <0 124 IRQ_TYPE_LEVEL_HIGH>;
 			};
 
-			dcic2: dcic@020e8000 {
+			dcic2: dcic@20e8000 {
 				reg = <0x020e8000 0x4000>;
 				interrupts = <0 125 IRQ_TYPE_LEVEL_HIGH>;
 			};
 
-			sdma: sdma@020ec000 {
+			sdma: sdma@20ec000 {
 				compatible = "fsl,imx6q-sdma", "fsl,imx35-sdma";
 				reg = <0x020ec000 0x4000>;
 				interrupts = <0 2 IRQ_TYPE_LEVEL_HIGH>;
@@ -917,7 +917,7 @@
 			};
 		};
 
-		aips-bus@02100000 { /* AIPS2 */
+		aips-bus@2100000 { /* AIPS2 */
 			compatible = "fsl,aips-bus", "simple-bus";
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -950,11 +950,11 @@
 				};
 			};
 
-			aipstz@0217c000 { /* AIPSTZ2 */
+			aipstz@217c000 { /* AIPSTZ2 */
 				reg = <0x0217c000 0x4000>;
 			};
 
-			usbotg: usb@02184000 {
+			usbotg: usb@2184000 {
 				compatible = "fsl,imx6q-usb", "fsl,imx27-usb";
 				reg = <0x02184000 0x200>;
 				interrupts = <0 43 IRQ_TYPE_LEVEL_HIGH>;
@@ -967,7 +967,7 @@
 				status = "disabled";
 			};
 
-			usbh1: usb@02184200 {
+			usbh1: usb@2184200 {
 				compatible = "fsl,imx6q-usb", "fsl,imx27-usb";
 				reg = <0x02184200 0x200>;
 				interrupts = <0 40 IRQ_TYPE_LEVEL_HIGH>;
@@ -981,7 +981,7 @@
 				status = "disabled";
 			};
 
-			usbh2: usb@02184400 {
+			usbh2: usb@2184400 {
 				compatible = "fsl,imx6q-usb", "fsl,imx27-usb";
 				reg = <0x02184400 0x200>;
 				interrupts = <0 41 IRQ_TYPE_LEVEL_HIGH>;
@@ -994,7 +994,7 @@
 				status = "disabled";
 			};
 
-			usbh3: usb@02184600 {
+			usbh3: usb@2184600 {
 				compatible = "fsl,imx6q-usb", "fsl,imx27-usb";
 				reg = <0x02184600 0x200>;
 				interrupts = <0 42 IRQ_TYPE_LEVEL_HIGH>;
@@ -1007,14 +1007,14 @@
 				status = "disabled";
 			};
 
-			usbmisc: usbmisc@02184800 {
+			usbmisc: usbmisc@2184800 {
 				#index-cells = <1>;
 				compatible = "fsl,imx6q-usbmisc";
 				reg = <0x02184800 0x200>;
 				clocks = <&clks IMX6QDL_CLK_USBOH3>;
 			};
 
-			fec: ethernet@02188000 {
+			fec: ethernet@2188000 {
 				compatible = "fsl,imx6q-fec";
 				reg = <0x02188000 0x4000>;
 				interrupts-extended =
@@ -1027,14 +1027,14 @@
 				status = "disabled";
 			};
 
-			mlb@0218c000 {
+			mlb@218c000 {
 				reg = <0x0218c000 0x4000>;
 				interrupts = <0 53 IRQ_TYPE_LEVEL_HIGH>,
 					     <0 117 IRQ_TYPE_LEVEL_HIGH>,
 					     <0 126 IRQ_TYPE_LEVEL_HIGH>;
 			};
 
-			usdhc1: usdhc@02190000 {
+			usdhc1: usdhc@2190000 {
 				compatible = "fsl,imx6q-usdhc";
 				reg = <0x02190000 0x4000>;
 				interrupts = <0 22 IRQ_TYPE_LEVEL_HIGH>;
@@ -1046,7 +1046,7 @@
 				status = "disabled";
 			};
 
-			usdhc2: usdhc@02194000 {
+			usdhc2: usdhc@2194000 {
 				compatible = "fsl,imx6q-usdhc";
 				reg = <0x02194000 0x4000>;
 				interrupts = <0 23 IRQ_TYPE_LEVEL_HIGH>;
@@ -1058,7 +1058,7 @@
 				status = "disabled";
 			};
 
-			usdhc3: usdhc@02198000 {
+			usdhc3: usdhc@2198000 {
 				compatible = "fsl,imx6q-usdhc";
 				reg = <0x02198000 0x4000>;
 				interrupts = <0 24 IRQ_TYPE_LEVEL_HIGH>;
@@ -1070,7 +1070,7 @@
 				status = "disabled";
 			};
 
-			usdhc4: usdhc@0219c000 {
+			usdhc4: usdhc@219c000 {
 				compatible = "fsl,imx6q-usdhc";
 				reg = <0x0219c000 0x4000>;
 				interrupts = <0 25 IRQ_TYPE_LEVEL_HIGH>;
@@ -1082,7 +1082,7 @@
 				status = "disabled";
 			};
 
-			i2c1: i2c@021a0000 {
+			i2c1: i2c@21a0000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				compatible = "fsl,imx6q-i2c", "fsl,imx21-i2c";
@@ -1092,7 +1092,7 @@
 				status = "disabled";
 			};
 
-			i2c2: i2c@021a4000 {
+			i2c2: i2c@21a4000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				compatible = "fsl,imx6q-i2c", "fsl,imx21-i2c";
@@ -1102,7 +1102,7 @@
 				status = "disabled";
 			};
 
-			i2c3: i2c@021a8000 {
+			i2c3: i2c@21a8000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				compatible = "fsl,imx6q-i2c", "fsl,imx21-i2c";
@@ -1112,20 +1112,20 @@
 				status = "disabled";
 			};
 
-			romcp@021ac000 {
+			romcp@21ac000 {
 				reg = <0x021ac000 0x4000>;
 			};
 
-			mmdc0: mmdc@021b0000 { /* MMDC0 */
+			mmdc0: mmdc@21b0000 { /* MMDC0 */
 				compatible = "fsl,imx6q-mmdc";
 				reg = <0x021b0000 0x4000>;
 			};
 
-			mmdc1: mmdc@021b4000 { /* MMDC1 */
+			mmdc1: mmdc@21b4000 { /* MMDC1 */
 				reg = <0x021b4000 0x4000>;
 			};
 
-			weim: weim@021b8000 {
+			weim: weim@21b8000 {
 				#address-cells = <2>;
 				#size-cells = <1>;
 				compatible = "fsl,imx6q-weim";
@@ -1136,29 +1136,29 @@
 				status = "disabled";
 			};
 
-			ocotp: ocotp@021bc000 {
+			ocotp: ocotp@21bc000 {
 				compatible = "fsl,imx6q-ocotp", "syscon";
 				reg = <0x021bc000 0x4000>;
 				clocks = <&clks IMX6QDL_CLK_IIM>;
 			};
 
-			tzasc@021d0000 { /* TZASC1 */
+			tzasc@21d0000 { /* TZASC1 */
 				reg = <0x021d0000 0x4000>;
 				interrupts = <0 108 IRQ_TYPE_LEVEL_HIGH>;
 			};
 
-			tzasc@021d4000 { /* TZASC2 */
+			tzasc@21d4000 { /* TZASC2 */
 				reg = <0x021d4000 0x4000>;
 				interrupts = <0 109 IRQ_TYPE_LEVEL_HIGH>;
 			};
 
-			audmux: audmux@021d8000 {
+			audmux: audmux@21d8000 {
 				compatible = "fsl,imx6q-audmux", "fsl,imx31-audmux";
 				reg = <0x021d8000 0x4000>;
 				status = "disabled";
 			};
 
-			mipi_csi: mipi@021dc000 {
+			mipi_csi: mipi@21dc000 {
 				compatible = "fsl,imx6-mipi-csi2";
 				reg = <0x021dc000 0x4000>;
 				#address-cells = <1>;
@@ -1171,7 +1171,7 @@
 				status = "disabled";
 			};
 
-			mipi_dsi: mipi@021e0000 {
+			mipi_dsi: mipi@21e0000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				reg = <0x021e0000 0x4000>;
@@ -1199,14 +1199,14 @@
 				};
 			};
 
-			vdoa@021e4000 {
+			vdoa@21e4000 {
 				compatible = "fsl,imx6q-vdoa";
 				reg = <0x021e4000 0x4000>;
 				interrupts = <0 18 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX6QDL_CLK_VDOA>;
 			};
 
-			uart2: serial@021e8000 {
+			uart2: serial@21e8000 {
 				compatible = "fsl,imx6q-uart", "fsl,imx21-uart";
 				reg = <0x021e8000 0x4000>;
 				interrupts = <0 27 IRQ_TYPE_LEVEL_HIGH>;
@@ -1218,7 +1218,7 @@
 				status = "disabled";
 			};
 
-			uart3: serial@021ec000 {
+			uart3: serial@21ec000 {
 				compatible = "fsl,imx6q-uart", "fsl,imx21-uart";
 				reg = <0x021ec000 0x4000>;
 				interrupts = <0 28 IRQ_TYPE_LEVEL_HIGH>;
@@ -1230,7 +1230,7 @@
 				status = "disabled";
 			};
 
-			uart4: serial@021f0000 {
+			uart4: serial@21f0000 {
 				compatible = "fsl,imx6q-uart", "fsl,imx21-uart";
 				reg = <0x021f0000 0x4000>;
 				interrupts = <0 29 IRQ_TYPE_LEVEL_HIGH>;
@@ -1242,7 +1242,7 @@
 				status = "disabled";
 			};
 
-			uart5: serial@021f4000 {
+			uart5: serial@21f4000 {
 				compatible = "fsl,imx6q-uart", "fsl,imx21-uart";
 				reg = <0x021f4000 0x4000>;
 				interrupts = <0 30 IRQ_TYPE_LEVEL_HIGH>;
@@ -1255,7 +1255,7 @@
 			};
 		};
 
-		ipu1: ipu@02400000 {
+		ipu1: ipu@2400000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			compatible = "fsl,imx6q-ipu";
diff --git a/arch/arm/boot/dts/imx6qp.dtsi b/arch/arm/boot/dts/imx6qp.dtsi
index 299d863..24c5cfa 100644
--- a/arch/arm/boot/dts/imx6qp.dtsi
+++ b/arch/arm/boot/dts/imx6qp.dtsi
@@ -56,7 +56,7 @@
 			clocks = <&clks IMX6QDL_CLK_OCRAM>;
 		};
 
-		aips-bus@02100000 {
+		aips-bus@2100000 {
 			pre1: pre@21c8000 {
 				compatible = "fsl,imx6qp-pre";
 				reg = <0x021c8000 0x1000>;
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
