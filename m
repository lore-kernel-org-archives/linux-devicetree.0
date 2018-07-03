From: Vladimir Zapolskiy <vz@mleia.com>
Subject: [PATCH 2/3] ARM: dts: imx31: add device tree description of basic
 controllers
Date: Tue,  3 Jul 2018 22:29:33 +0300
Message-ID: <20180703192934.6080-3-vz@mleia.com>
References: <20180703192934.6080-1-vz@mleia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180703192934.6080-1-vz@mleia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>
List-Id: devicetree@vger.kernel.org

The change adds a number of basic peripherals found on i.MX31 SoC:
* GPIO controllers,
* I2C master controllers,
* SPI master controllers,
* ATA controller,
* SDHC controllers,
* RTC, watchdog and PWM contollers,
* SDMA,
* IRAM,
* NAND and WEIM controllers on EMI.

The added controller devices were tested on Freescale i.MX31 powered
LogicPD Lite SoM and baseboard.

DMA functionality was tested on SDHC and SPI controllers so far,
thus dmas properties are added to those device nodes only.

Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
---
 arch/arm/boot/dts/imx31.dtsi | 222 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 222 insertions(+)

diff --git a/arch/arm/boot/dts/imx31.dtsi b/arch/arm/boot/dts/imx31.dtsi
index 4642c81..62bafa6 100644
--- a/arch/arm/boot/dts/imx31.dtsi
+++ b/arch/arm/boot/dts/imx31.dtsi
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0+
 //
+// Copyright 2016-2018 Vladimir Zapolskiy <vz@mleia.com>
 // Copyright 2012 Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
 
 / {
@@ -15,11 +16,22 @@
 	memory { device_type = "memory"; };
 
 	aliases {
+		gpio0 = &gpio1;
+		gpio1 = &gpio2;
+		gpio2 = &gpio3;
+		i2c0 = &i2c1;
+		i2c1 = &i2c2;
+		i2c2 = &i2c3;
+		mmc0 = &sdhci1;
+		mmc1 = &sdhci2;
 		serial0 = &uart1;
 		serial1 = &uart2;
 		serial2 = &uart3;
 		serial3 = &uart4;
 		serial4 = &uart5;
+		spi0 = &spi1;
+		spi1 = &spi2;
+		spi2 = &spi3;
 	};
 
 	cpus {
@@ -47,6 +59,11 @@
 		interrupt-parent = <&avic>;
 		ranges;
 
+		iram: iram@1fffc000 {
+			compatible = "mmio-sram";
+			reg = <0x1fffc000 0x4000>;
+		};
+
 		aips@43f00000 { /* AIPS1 */
 			compatible = "fsl,aips-bus", "simple-bus";
 			#address-cells = <1>;
@@ -54,6 +71,34 @@
 			reg = <0x43f00000 0x100000>;
 			ranges;
 
+			i2c1: i2c@43f80000 {
+				compatible = "fsl,imx31-i2c", "fsl,imx21-i2c";
+				reg = <0x43f80000 0x4000>;
+				interrupts = <10>;
+				clocks = <&clks 33>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			i2c3: i2c@43f84000 {
+				compatible = "fsl,imx31-i2c", "fsl,imx21-i2c";
+				reg = <0x43f84000 0x4000>;
+				interrupts = <3>;
+				clocks = <&clks 35>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			ata: ata@43f8c000 {
+				compatible = "fsl,imx31-pata", "fsl,imx27-pata";
+				reg = <0x43f8c000 0x4000>;
+				interrupts = <15>;
+				clocks = <&clks 26>;
+				status = "disabled";
+			};
+
 			uart1: serial@43f90000 {
 				compatible = "fsl,imx31-uart", "fsl,imx21-uart";
 				reg = <0x43f90000 0x4000>;
@@ -72,6 +117,29 @@
 				status = "disabled";
 			};
 
+			i2c2: i2c@43f98000 {
+				compatible = "fsl,imx31-i2c", "fsl,imx21-i2c";
+				reg = <0x43f98000 0x4000>;
+				interrupts = <4>;
+				clocks = <&clks 34>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			spi1: spi@43fa4000 {
+				compatible = "fsl,imx31-cspi";
+				reg = <0x43fa4000 0x4000>;
+				interrupts = <14>;
+				clocks = <&clks 10>, <&clks 53>;
+				clock-names = "ipg", "per";
+				dmas = <&sdma 8 8 0>, <&sdma 9 8 0>;
+				dma-names = "rx", "tx";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
 			kpp: kpp@43fa8000 {
 				compatible = "fsl,imx31-kpp", "fsl,imx21-kpp";
 				reg = <0x43fa8000 0x4000>;
@@ -106,6 +174,28 @@
 			reg = <0x50000000 0x100000>;
 			ranges;
 
+			sdhci1: sdhci@50004000 {
+				compatible = "fsl,imx31-mmc";
+				reg = <0x50004000 0x4000>;
+				interrupts = <9>;
+				clocks = <&clks 10>, <&clks 20>;
+				clock-names = "ipg", "per";
+				dmas = <&sdma 20 3 0>;
+				dma-names = "rx-tx";
+				status = "disabled";
+			};
+
+			sdhci2: sdhci@50008000 {
+				compatible = "fsl,imx31-mmc";
+				reg = <0x50008000 0x4000>;
+				interrupts = <8>;
+				clocks = <&clks 10>, <&clks 21>;
+				clock-names = "ipg", "per";
+				dmas = <&sdma 21 3 0>;
+				dma-names = "rx-tx";
+				status = "disabled";
+			};
+
 			uart3: serial@5000c000 {
 				compatible = "fsl,imx31-uart", "fsl,imx21-uart";
 				reg = <0x5000c000 0x4000>;
@@ -115,6 +205,19 @@
 				status = "disabled";
 			};
 
+			spi2: cspi@50010000 {
+				compatible = "fsl,imx31-cspi";
+				reg = <0x50010000 0x4000>;
+				interrupts = <13>;
+				clocks = <&clks 10>, <&clks 54>;
+				clock-names = "ipg", "per";
+				dmas = <&sdma 6 8 0>, <&sdma 7 8 0>;
+				dma-names = "rx", "tx";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
 			iim: iim@5001c000 {
 				compatible = "fsl,imx31-iim", "fsl,imx27-iim";
 				reg = <0x5001c000 0x1000>;
@@ -137,6 +240,19 @@
 				#clock-cells = <1>;
 			};
 
+			spi3: cspi@53f84000 {
+				compatible = "fsl,imx31-cspi";
+				reg = <0x53f84000 0x4000>;
+				interrupts = <17>;
+				clocks = <&clks 10>, <&clks 28>;
+				clock-names = "ipg", "per";
+				dmas = <&sdma 10 8 0>, <&sdma 11 8 0>;
+				dma-names = "rx", "tx";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
 			gpt: timer@53f90000 {
 				compatible = "fsl,imx31-gpt";
 				reg = <0x53f90000 0x4000>;
@@ -144,6 +260,112 @@
 				clocks = <&clks 10>, <&clks 22>;
 				clock-names = "ipg", "per";
 			};
+
+			gpio3: gpio@53fa4000 {
+				compatible = "fsl,imx31-gpio";
+				reg = <0x53fa4000 0x4000>;
+				interrupts = <56>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+			};
+
+			rng@53fb0000 {
+				compatible = "fsl,imx31-rnga";
+				reg = <0x53fb0000 0x4000>;
+				interrupts = <22>;
+				clocks = <&clks 29>;
+			};
+
+			gpio1: gpio@53fcc000 {
+				compatible = "fsl,imx31-gpio";
+				reg = <0x53fcc000 0x4000>;
+				interrupts = <52>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+			};
+
+			gpio2: gpio@53fd0000 {
+				compatible = "fsl,imx31-gpio";
+				reg = <0x53fd0000 0x4000>;
+				interrupts = <51>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+			};
+
+			sdma: sdma@53fd4000 {
+				compatible = "fsl,imx31-sdma";
+				reg = <0x53fd4000 0x4000>;
+				interrupts = <34>;
+				clocks = <&clks 10>, <&clks 27>;
+				clock-names = "ipg", "ahb";
+				#dma-cells = <3>;
+				fsl,sdma-ram-script-name = "imx/sdma/sdma-imx31.bin";
+			};
+
+			rtc: rtc@53fd8000 {
+				compatible = "fsl,imx31-rtc", "fsl,imx21-rtc";
+				reg = <0x53fd8000 0x4000>;
+				interrupts = <25>;
+				clocks = <&clks 2>, <&clks 40>;
+				clock-names = "ref", "ipg";
+			};
+
+			wdog: wdog@53fdc000 {
+				compatible = "fsl,imx31-wdt", "fsl,imx21-wdt";
+				reg = <0x53fdc000 0x4000>;
+				clocks = <&clks 41>;
+			};
+
+			pwm: pwm@53fe0000 {
+				compatible = "fsl,imx31-pwm", "fsl,imx27-pwm";
+				reg = <0x53fe0000 0x4000>;
+				interrupts = <26>;
+				clocks = <&clks 10>, <&clks 42>;
+				clock-names = "ipg", "per";
+				#pwm-cells = <2>;
+				status = "disabled";
+			};
+		};
+
+		emi@b8000000 { /* External Memory Interface */
+			compatible = "simple-bus";
+			reg = <0xb8000000 0x5000>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			nfc: nand@b8000000 {
+				compatible = "fsl,imx31-nand", "fsl,imx27-nand";
+				reg = <0xb8000000 0x1000>;
+				interrupts = <33>;
+				clocks = <&clks 9>;
+				dmas = <&sdma 30 17 0>;
+				dma-names = "rx-tx";
+				#address-cells = <1>;
+				#size-cells = <1>;
+				status = "disabled";
+			};
+
+			weim: weim@b8002000 {
+				compatible = "fsl,imx31-weim", "fsl,imx27-weim";
+				reg = <0xb8002000 0x1000>;
+				clocks = <&clks 56>;
+				#address-cells = <2>;
+				#size-cells = <1>;
+				ranges = <0 0 0xa0000000 0x08000000
+					  1 0 0xa8000000 0x08000000
+					  2 0 0xb0000000 0x02000000
+					  3 0 0xb2000000 0x02000000
+					  4 0 0xb4000000 0x02000000
+					  5 0 0xb6000000 0x02000000>;
+				status = "disabled";
+			};
 		};
 	};
 };
-- 
2.10.2
