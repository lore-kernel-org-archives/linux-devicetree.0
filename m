From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH 1/2] ARM: dts: meson8: use stable UART bindings with correct gate clock
Date: Sat, 28 Oct 2017 14:34:29 +0200
Message-ID: <20171028123430.7796-2-martin.blumenstingl@googlemail.com>
References: <20171028123430.7796-1-martin.blumenstingl@googlemail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171028123430.7796-1-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, hgkr.klein-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Switch to the stable UART bindings and add the correct gate clocks
to the non-AO UART nodes.
This fixes the non-AO UARTs if the bootloader didn't un-gate the clocks.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
---
 arch/arm/boot/dts/meson8.dtsi | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
index 661287806ead..eb3f8161eef0 100644
--- a/arch/arm/boot/dts/meson8.dtsi
+++ b/arch/arm/boot/dts/meson8.dtsi
@@ -337,19 +337,27 @@
 };
 
 &uart_AO {
-	clocks = <&clkc CLKID_CLK81>;
+	compatible = "amlogic,meson8-uart", "amlogic,meson-uart";
+	clocks = <&clkc CLKID_XTAL>, <&clkc CLKID_CLK81>, <&clkc CLKID_CLK81>;
+	clock-names = "xtal", "pclk", "baud";
 };
 
 &uart_A {
-	clocks = <&clkc CLKID_CLK81>;
+	compatible = "amlogic,meson8-uart", "amlogic,meson-uart";
+	clocks = <&clkc CLKID_XTAL>, <&clkc CLKID_UART0>, <&clkc CLKID_CLK81>;
+	clock-names = "xtal", "pclk", "baud";
 };
 
 &uart_B {
-	clocks = <&clkc CLKID_CLK81>;
+	compatible = "amlogic,meson8-uart", "amlogic,meson-uart";
+	clocks = <&clkc CLKID_XTAL>, <&clkc CLKID_UART1>, <&clkc CLKID_CLK81>;
+	clock-names = "xtal", "pclk", "baud";
 };
 
 &uart_C {
-	clocks = <&clkc CLKID_CLK81>;
+	compatible = "amlogic,meson8-uart", "amlogic,meson-uart";
+	clocks = <&clkc CLKID_XTAL>, <&clkc CLKID_UART2>, <&clkc CLKID_CLK81>;
+	clock-names = "xtal", "pclk", "baud";
 };
 
 &usb0 {
-- 
2.14.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
