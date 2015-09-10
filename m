From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH 2/2] ARM: efm32: switch to vendor,device compatible strings
Date: Thu, 10 Sep 2015 10:09:52 +0200
Message-ID: <1441872592-388-3-git-send-email-u.kleine-koenig@pengutronix.de>
References: <1441872592-388-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1441872592-388-1-git-send-email-u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

The mainline drivers were fixed in commits

 - 4ea8dafd2475 (serial: efm32: use $vendor,$device scheme for
   compatible string)
 - 12f6dd860cf8 (spi: efm32: use $vendor,$device scheme for compatible
   string)
 - 63cc122381bd (clocksource: efm32: use $vendor,$device scheme for
   compatible string)

which are all in 3.16-rc1 to also support these compatible strings.

=46or the other affected peripherals (adc and gpio) there are no driver=
s in
mainline yet.

Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 arch/arm/boot/dts/efm32gg.dtsi | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/arm/boot/dts/efm32gg.dtsi b/arch/arm/boot/dts/efm32gg=
=2Edtsi
index 106d505c5d3d..c747983771c7 100644
--- a/arch/arm/boot/dts/efm32gg.dtsi
+++ b/arch/arm/boot/dts/efm32gg.dtsi
@@ -23,7 +23,7 @@
=20
 	soc {
 		adc: adc@40002000 {
-			compatible =3D "efm32,adc";
+			compatible =3D "energymicro,efm32-adc";
 			reg =3D <0x40002000 0x400>;
 			interrupts =3D <7>;
 			clocks =3D <&cmu clk_HFPERCLKADC0>;
@@ -31,7 +31,7 @@
 		};
=20
 		gpio: gpio@40006000 {
-			compatible =3D "efm32,gpio";
+			compatible =3D "energymicro,efm32-gpio";
 			reg =3D <0x40006000 0x1000>;
 			interrupts =3D <1 11>;
 			gpio-controller;
@@ -45,7 +45,7 @@
 		i2c0: i2c@4000a000 {
 			#address-cells =3D <1>;
 			#size-cells =3D <0>;
-			compatible =3D "efm32,i2c";
+			compatible =3D "energymicro,efm32-i2c";
 			reg =3D <0x4000a000 0x400>;
 			interrupts =3D <9>;
 			clocks =3D <&cmu clk_HFPERCLKI2C0>;
@@ -56,7 +56,7 @@
 		i2c1: i2c@4000a400 {
 			#address-cells =3D <1>;
 			#size-cells =3D <0>;
-			compatible =3D "efm32,i2c";
+			compatible =3D "energymicro,efm32-i2c";
 			reg =3D <0x4000a400 0x400>;
 			interrupts =3D <10>;
 			clocks =3D <&cmu clk_HFPERCLKI2C1>;
@@ -67,7 +67,7 @@
 		spi0: spi@4000c000 { /* USART0 */
 			#address-cells =3D <1>;
 			#size-cells =3D <0>;
-			compatible =3D "efm32,spi";
+			compatible =3D "energymicro,efm32-spi";
 			reg =3D <0x4000c000 0x400>;
 			interrupts =3D <3 4>;
 			clocks =3D <&cmu clk_HFPERCLKUSART0>;
@@ -77,7 +77,7 @@
 		spi1: spi@4000c400 { /* USART1 */
 			#address-cells =3D <1>;
 			#size-cells =3D <0>;
-			compatible =3D "efm32,spi";
+			compatible =3D "energymicro,efm32-spi";
 			reg =3D <0x4000c400 0x400>;
 			interrupts =3D <15 16>;
 			clocks =3D <&cmu clk_HFPERCLKUSART1>;
@@ -87,7 +87,7 @@
 		spi2: spi@4000c800 { /* USART2 */
 			#address-cells =3D <1>;
 			#size-cells =3D <0>;
-			compatible =3D "efm32,spi";
+			compatible =3D "energymicro,efm32-spi";
 			reg =3D <0x4000c800 0x400>;
 			interrupts =3D <18 19>;
 			clocks =3D <&cmu clk_HFPERCLKUSART2>;
@@ -95,7 +95,7 @@
 		};
=20
 		uart0: uart@4000c000 { /* USART0 */
-			compatible =3D "efm32,uart";
+			compatible =3D "energymicro,efm32-uart";
 			reg =3D <0x4000c000 0x400>;
 			interrupts =3D <3 4>;
 			clocks =3D <&cmu clk_HFPERCLKUSART0>;
@@ -103,7 +103,7 @@
 		};
=20
 		uart1: uart@4000c400 { /* USART1 */
-			compatible =3D "efm32,uart";
+			compatible =3D "energymicro,efm32-uart";
 			reg =3D <0x4000c400 0x400>;
 			interrupts =3D <15 16>;
 			clocks =3D <&cmu clk_HFPERCLKUSART1>;
@@ -111,7 +111,7 @@
 		};
=20
 		uart2: uart@4000c800 { /* USART2 */
-			compatible =3D "efm32,uart";
+			compatible =3D "energymicro,efm32-uart";
 			reg =3D <0x4000c800 0x400>;
 			interrupts =3D <18 19>;
 			clocks =3D <&cmu clk_HFPERCLKUSART2>;
@@ -119,7 +119,7 @@
 		};
=20
 		uart3: uart@4000e000 { /* UART0 */
-			compatible =3D "efm32,uart";
+			compatible =3D "energymicro,efm32-uart";
 			reg =3D <0x4000e000 0x400>;
 			interrupts =3D <20 21>;
 			clocks =3D <&cmu clk_HFPERCLKUART0>;
@@ -127,7 +127,7 @@
 		};
=20
 		uart4: uart@4000e400 { /* UART1 */
-			compatible =3D "efm32,uart";
+			compatible =3D "energymicro,efm32-uart";
 			reg =3D <0x4000e400 0x400>;
 			interrupts =3D <22 23>;
 			clocks =3D <&cmu clk_HFPERCLKUART1>;
@@ -135,28 +135,28 @@
 		};
=20
 		timer0: timer@40010000 {
-			compatible =3D "efm32,timer";
+			compatible =3D "energymicro,efm32-timer";
 			reg =3D <0x40010000 0x400>;
 			interrupts =3D <2>;
 			clocks =3D <&cmu clk_HFPERCLKTIMER0>;
 		};
=20
 		timer1: timer@40010400 {
-			compatible =3D "efm32,timer";
+			compatible =3D "energymicro,efm32-timer";
 			reg =3D <0x40010400 0x400>;
 			interrupts =3D <12>;
 			clocks =3D <&cmu clk_HFPERCLKTIMER1>;
 		};
=20
 		timer2: timer@40010800 {
-			compatible =3D "efm32,timer";
+			compatible =3D "energymicro,efm32-timer";
 			reg =3D <0x40010800 0x400>;
 			interrupts =3D <13>;
 			clocks =3D <&cmu clk_HFPERCLKTIMER2>;
 		};
=20
 		timer3: timer@40010c00 {
-			compatible =3D "efm32,timer";
+			compatible =3D "energymicro,efm32-timer";
 			reg =3D <0x40010c00 0x400>;
 			interrupts =3D <14>;
 			clocks =3D <&cmu clk_HFPERCLKTIMER3>;
--=20
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
