From: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Subject: [PATCH] ARM: dts: at91: sama5d3_uart: fix reg sizes to match documentation
Date: Thu, 10 Nov 2016 08:46:40 +0100
Message-ID: <1478764000-32233-1-git-send-email-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The new size (0x100) also matches the size given in sama5d3.dtsi

Documentation reference: section 43.6 "Universal Asynchronous
Receiver Transmitter (UART) User Interface", table 43-4 "Register
Mapping" in [1].

[1] Atmel-11121F-ATARM-SAMA5D3-Series-Datasheet_02-Feb-16

Signed-off-by: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
---
 arch/arm/boot/dts/sama5d3_uart.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/sama5d3_uart.dtsi b/arch/arm/boot/dts/sama5d3_uart.dtsi
index 2511d748867b..186377d41c91 100644
--- a/arch/arm/boot/dts/sama5d3_uart.dtsi
+++ b/arch/arm/boot/dts/sama5d3_uart.dtsi
@@ -55,7 +55,7 @@
 
 			uart0: serial@f0024000 {
 				compatible = "atmel,at91sam9260-usart";
-				reg = <0xf0024000 0x200>;
+				reg = <0xf0024000 0x100>;
 				interrupts = <16 IRQ_TYPE_LEVEL_HIGH 5>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&pinctrl_uart0>;
@@ -66,7 +66,7 @@
 
 			uart1: serial@f8028000 {
 				compatible = "atmel,at91sam9260-usart";
-				reg = <0xf8028000 0x200>;
+				reg = <0xf8028000 0x100>;
 				interrupts = <17 IRQ_TYPE_LEVEL_HIGH 5>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&pinctrl_uart1>;
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
