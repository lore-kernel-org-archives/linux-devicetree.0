From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH 2/2] ARM: device trees for Energy Micro's EFM32 Cortex-M3 SoCs
Date: Mon, 16 Dec 2013 20:12:03 +0100
Message-ID: <1387221123-6794-1-git-send-email-u.kleine-koenig@pengutronix.de>
References: <20131216190953.GB14866@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131216190953.GB14866-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 arch/arm/boot/dts/Makefile           |   1 +
 arch/arm/boot/dts/armv7-m.dtsi       |  18 ++++
 arch/arm/boot/dts/efm32gg-dk3750.dts |  86 ++++++++++++++++++
 arch/arm/boot/dts/efm32gg.dtsi       | 172 +++++++++++++++++++++++++++=
++++++++
 4 files changed, 277 insertions(+)
 create mode 100644 arch/arm/boot/dts/armv7-m.dtsi
 create mode 100644 arch/arm/boot/dts/efm32gg-dk3750.dts
 create mode 100644 arch/arm/boot/dts/efm32gg.dtsi

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index d57c1a6..e4a0bea 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -52,6 +52,7 @@ dtb-$(CONFIG_ARCH_DOVE) +=3D dove-cm-a510.dtb \
 	dove-d2plug.dtb \
 	dove-d3plug.dtb \
 	dove-dove-db.dtb
+dtb-$(CONFIG_ARCH_EFM32) +=3D efm32gg-dk3750.dtb
 dtb-$(CONFIG_ARCH_EXYNOS) +=3D exynos4210-origen.dtb \
 	exynos4210-smdkv310.dtb \
 	exynos4210-trats.dtb \
diff --git a/arch/arm/boot/dts/armv7-m.dtsi b/arch/arm/boot/dts/armv7-m=
=2Edtsi
new file mode 100644
index 0000000..5a660d0
--- /dev/null
+++ b/arch/arm/boot/dts/armv7-m.dtsi
@@ -0,0 +1,18 @@
+#include "skeleton.dtsi"
+
+/ {
+	nvic: nv-interrupt-controller  {
+		compatible =3D "arm,armv7m-nvic";
+		interrupt-controller;
+		#interrupt-cells =3D <1>;
+		reg =3D <0xe000e100 0xc00>;
+	};
+
+	soc {
+		#address-cells =3D <1>;
+		#size-cells =3D <1>;
+		compatible =3D "simple-bus";
+		interrupt-parent =3D <&nvic>;
+		ranges;
+	};
+};
diff --git a/arch/arm/boot/dts/efm32gg-dk3750.dts b/arch/arm/boot/dts/e=
fm32gg-dk3750.dts
new file mode 100644
index 0000000..aa5c0f6
--- /dev/null
+++ b/arch/arm/boot/dts/efm32gg-dk3750.dts
@@ -0,0 +1,86 @@
+/*
+ * Device tree for EFM32GG-DK3750 development board.
+ *
+ * Documentation available from
+ * http://www.silabs.com/Support%20Documents/TechnicalDocs/efm32gg-dk3=
750-ug.pdf
+ */
+
+/dts-v1/;
+#include "efm32gg.dtsi"
+
+/ {
+	model =3D "Energy Micro Giant Gecko Development Kit";
+	compatible =3D "efm32,dk3750";
+
+	chosen {
+		bootargs =3D "console=3Dttyefm4,115200 init=3D/linuxrc ignore_loglev=
el ihash_entries=3D64 dhash_entries=3D64 earlyprintk uclinux.physaddr=3D=
0x8c400000 root=3D/dev/mtdblock0";
+	};
+
+	memory {
+		reg =3D <0x88000000 0x400000>;
+	};
+
+	soc {
+		adc@40002000 {
+			status =3D "ok";
+		};
+
+		i2c@4000a000 {
+			location =3D <3>;
+			status =3D "ok";
+
+			temp@48 {
+				compatible =3D "st,stds75";
+				reg =3D <0x48>;
+			};
+
+			eeprom@50 {
+				compatible =3D "microchip,24c02";
+				reg =3D <0x50>;
+				pagesize =3D <16>;
+			};
+		};
+
+		spi0: spi@4000c000 { /* USART0 */
+			cs-gpios =3D <&gpio 68 1>; // E4
+			location =3D <1>;
+			status =3D "ok";
+
+			microsd@0 {
+				compatible =3D "mmc-spi-slot";
+				spi-max-frequency =3D <100000>;
+				voltage-ranges =3D <3200 3400>;
+				broken-cd;
+				reg =3D <0>;
+			};
+		};
+
+		spi1: spi@4000c400 { /* USART1 */
+			cs-gpios =3D <&gpio 51 1>; // D3
+			location =3D <1>;
+			status =3D "ok";
+
+			ks8851@0 {
+				compatible =3D "ks8851";
+				spi-max-frequency =3D <6000000>;
+				reg =3D <0>;
+				interrupt-parent =3D <&boardfpga>;
+				interrupts =3D <4>;
+			};
+		};
+
+		uart4: uart@4000e400 { /* UART1 */
+			location =3D <2>;
+			status =3D "ok";
+		};
+
+		boardfpga: boardfpga {
+			compatible =3D "efm32board";
+			reg =3D <0x80000000 0x400>;
+			irq-gpios =3D <&gpio 64 1>;
+			interrupt-controller;
+			#interrupt-cells =3D <1>;
+			status =3D "ok";
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/efm32gg.dtsi b/arch/arm/boot/dts/efm32gg=
=2Edtsi
new file mode 100644
index 0000000..a342ab0
--- /dev/null
+++ b/arch/arm/boot/dts/efm32gg.dtsi
@@ -0,0 +1,172 @@
+/*
+ * Device tree for Energy Micro EFM32 Giant Gecko SoC.
+ *
+ * Documentation available from
+ * http://www.silabs.com/Support%20Documents/TechnicalDocs/EFM32GG-RM.=
pdf
+ */
+#include "armv7-m.dtsi"
+#include "dt-bindings/clock/efm32-cmu.h"
+
+/ {
+	aliases {
+		i2c0 =3D &i2c0;
+		i2c1 =3D &i2c1;
+		serial0 =3D &uart0;
+		serial1 =3D &uart1;
+		serial2 =3D &uart2;
+		serial3 =3D &uart3;
+		serial4 =3D &uart4;
+		spi0 =3D &spi0;
+		spi1 =3D &spi1;
+		spi2 =3D &spi2;
+	};
+
+	soc {
+		adc: adc@40002000 {
+			compatible =3D "efm32,adc";
+			reg =3D <0x40002000 0x400>;
+			interrupts =3D <7>;
+			clocks =3D <&cmu clk_HFPERCLKADC0>;
+			status =3D "disabled";
+		};
+
+		gpio: gpio@40006000 {
+			compatible =3D "efm32,gpio";
+			reg =3D <0x40006000 0x1000>;
+			interrupts =3D <1 11>;
+			gpio-controller;
+			#gpio-cells =3D <2>;
+			interrupt-controller;
+			#interrupt-cells =3D <1>;
+			clocks =3D <&cmu clk_HFPERCLKGPIO>;
+			status =3D "ok";
+		};
+
+		i2c0: i2c@4000a000 {
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+			compatible =3D "efm32,i2c";
+			reg =3D <0x4000a000 0x400>;
+			interrupts =3D <9>;
+			clocks =3D <&cmu clk_HFPERCLKI2C0>;
+			clock-frequency =3D <100000>;
+			status =3D "disabled";
+		};
+
+		i2c1: i2c@4000a400 {
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+			compatible =3D "efm32,i2c";
+			reg =3D <0x4000a400 0x400>;
+			interrupts =3D <10>;
+			clocks =3D <&cmu clk_HFPERCLKI2C1>;
+			clock-frequency =3D <100000>;
+			status =3D "disabled";
+		};
+
+		spi0: spi@4000c000 { /* USART0 */
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+			compatible =3D "efm32,spi";
+			reg =3D <0x4000c000 0x400>;
+			interrupts =3D <3 4>;
+			clocks =3D <&cmu clk_HFPERCLKUSART0>;
+			status =3D "disabled";
+		};
+
+		spi1: spi@4000c400 { /* USART1 */
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+			compatible =3D "efm32,spi";
+			reg =3D <0x4000c400 0x400>;
+			interrupts =3D <15 16>;
+			clocks =3D <&cmu clk_HFPERCLKUSART1>;
+			status =3D "disabled";
+		};
+
+		spi2: spi@40x4000c800 { /* USART2 */
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+			compatible =3D "efm32,spi";
+			reg =3D <0x4000c800 0x400>;
+			interrupts =3D <18 19>;
+			clocks =3D <&cmu clk_HFPERCLKUSART2>;
+			status =3D "disabled";
+		};
+
+		uart0: uart@4000c000 { /* USART0 */
+			compatible =3D "efm32,uart";
+			reg =3D <0x4000c000 0x400>;
+			interrupts =3D <3 4>;
+			clocks =3D <&cmu clk_HFPERCLKUSART0>;
+			status =3D "disabled";
+		};
+
+		uart1: uart@4000c400 { /* USART1 */
+			compatible =3D "efm32,uart";
+			reg =3D <0x4000c400 0x400>;
+			interrupts =3D <15 16>;
+			clocks =3D <&cmu clk_HFPERCLKUSART1>;
+			status =3D "disabled";
+		};
+
+		uart2: uart@40x4000c800 { /* USART2 */
+			compatible =3D "efm32,uart";
+			reg =3D <0x4000c800 0x400>;
+			interrupts =3D <18 19>;
+			clocks =3D <&cmu clk_HFPERCLKUSART2>;
+			status =3D "disabled";
+		};
+
+		uart3: uart@4000e000 { /* UART0 */
+			compatible =3D "efm32,uart";
+			reg =3D <0x4000e000 0x400>;
+			interrupts =3D <20 21>;
+			clocks =3D <&cmu clk_HFPERCLKUART0>;
+			status =3D "disabled";
+		};
+
+		uart4: uart@4000e400 { /* UART1 */
+			compatible =3D "efm32,uart";
+			reg =3D <0x4000e400 0x400>;
+			interrupts =3D <22 23>;
+			clocks =3D <&cmu clk_HFPERCLKUART1>;
+			status =3D "disabled";
+		};
+
+		timer0: timer@40010000 {
+			compatible =3D "efm32,timer";
+			reg =3D <0x40010000 0x400>;
+			interrupts =3D <2>;
+			clocks =3D <&cmu clk_HFPERCLKTIMER0>;
+		};
+
+		timer1: timer@40010400 {
+			compatible =3D "efm32,timer";
+			reg =3D <0x40010400 0x400>;
+			interrupts =3D <12>;
+			clocks =3D <&cmu clk_HFPERCLKTIMER1>;
+		};
+
+		timer2: timer@40010800 {
+			compatible =3D "efm32,timer";
+			reg =3D <0x40010800 0x400>;
+			interrupts =3D <13>;
+			clocks =3D <&cmu clk_HFPERCLKTIMER2>;
+		};
+
+		timer3: timer@40010c00 {
+			compatible =3D "efm32,timer";
+			reg =3D <0x40010c00 0x400>;
+			interrupts =3D <14>;
+			clocks =3D <&cmu clk_HFPERCLKTIMER3>;
+		};
+
+		cmu: cmu@400c8000 {
+			compatible =3D "efm32gg,cmu";
+			reg =3D <0x400c8000 0x400>;
+			interrupts =3D <32>;
+			#clock-cells =3D <1>;
+		};
+	};
+};
--=20
1.8.4.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
