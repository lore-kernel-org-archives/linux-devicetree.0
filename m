From: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Subject: [PATCH v2 8/9] ARM: dts: aspeed: Correctly order UART nodes
Date: Wed,  4 Oct 2017 17:19:16 +1030
Message-ID: <20171004064917.2498-9-joel@jms.id.au>
References: <20171004064917.2498-1-joel@jms.id.au>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171004064917.2498-1-joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>, Rick Altherr <raltherr-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Brendan Higgins <brendanhiggins-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg-Bxea+6Xhats@public.gmane.org>, linux-aspeed-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Order them all by address.

Signed-off-by: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
---
 arch/arm/boot/dts/aspeed-g4.dtsi | 48 +++++++++++++++----------------
 arch/arm/boot/dts/aspeed-g5.dtsi | 61 ++++++++++++++++++++--------------------
 2 files changed, 54 insertions(+), 55 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index a549413bda3f..4125e07f22f9 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -183,6 +183,27 @@
 				clock-names = "PCLK";
 			};
 
+			uart1: serial@1e783000 {
+				compatible = "ns16550a";
+				reg = <0x1e783000 0x1000>;
+				reg-shift = <2>;
+				interrupts = <9>;
+				clocks = <&clk_uart>;
+				no-loopback-test;
+				status = "disabled";
+			};
+
+			uart5: serial@1e784000 {
+				compatible = "ns16550a";
+				reg = <0x1e784000 0x1000>;
+				reg-shift = <2>;
+				interrupts = <10>;
+				clocks = <&clk_uart>;
+				current-speed = <38400>;
+				no-loopback-test;
+				status = "disabled";
+			};
+
 			wdt1: wdt@1e785000 {
 				compatible = "aspeed,ast2400-wdt";
 				reg = <0x1e785000 0x1c>;
@@ -197,11 +218,11 @@
 				status = "disabled";
 			};
 
-			uart1: serial@1e783000 {
+			uart6: serial@1e787000 {
 				compatible = "ns16550a";
-				reg = <0x1e783000 0x1000>;
+				reg = <0x1e787000 0x1000>;
 				reg-shift = <2>;
-				interrupts = <9>;
+				interrupts = <10>;
 				clocks = <&clk_uart>;
 				no-loopback-test;
 				status = "disabled";
@@ -237,27 +258,6 @@
 				status = "disabled";
 			};
 
-			uart5: serial@1e784000 {
-				compatible = "ns16550a";
-				reg = <0x1e784000 0x1000>;
-				reg-shift = <2>;
-				interrupts = <10>;
-				clocks = <&clk_uart>;
-				current-speed = <38400>;
-				no-loopback-test;
-				status = "disabled";
-			};
-
-			uart6: serial@1e787000 {
-				compatible = "ns16550a";
-				reg = <0x1e787000 0x1000>;
-				reg-shift = <2>;
-				interrupts = <10>;
-				clocks = <&clk_uart>;
-				no-loopback-test;
-				status = "disabled";
-			};
-
 			i2c: i2c@1e78a000 {
 				compatible = "simple-bus";
 				#address-cells = <1>;
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index de2dafa71651..61cc2d25143a 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -227,6 +227,26 @@
 				clock-names = "PCLK";
 			};
 
+			uart1: serial@1e783000 {
+				compatible = "ns16550a";
+				reg = <0x1e783000 0x1000>;
+				reg-shift = <2>;
+				interrupts = <9>;
+				clocks = <&clk_uart>;
+				no-loopback-test;
+				status = "disabled";
+			};
+
+			uart5: serial@1e784000 {
+				compatible = "ns16550a";
+				reg = <0x1e784000 0x1000>;
+				reg-shift = <2>;
+				interrupts = <10>;
+				clocks = <&clk_uart>;
+				current-speed = <38400>;
+				no-loopback-test;
+				status = "disabled";
+			};
 
 			wdt1: wdt@1e785000 {
 				compatible = "aspeed,ast2500-wdt";
@@ -247,16 +267,6 @@
 				status = "disabled";
 			};
 
-			uart1: serial@1e783000 {
-				compatible = "ns16550a";
-				reg = <0x1e783000 0x1000>;
-				reg-shift = <2>;
-				interrupts = <9>;
-				clocks = <&clk_uart>;
-				no-loopback-test;
-				status = "disabled";
-			};
-
 			lpc: lpc@1e789000 {
 				compatible = "aspeed,ast2500-lpc", "simple-mfd";
 				reg = <0x1e789000 0x1000>;
@@ -287,6 +297,16 @@
 				};
 			};
 
+			uart6: serial@1e787000 {
+				compatible = "ns16550a";
+				reg = <0x1e787000 0x1000>;
+				reg-shift = <2>;
+				interrupts = <10>;
+				clocks = <&clk_uart>;
+				no-loopback-test;
+				status = "disabled";
+			};
+
 			uart2: serial@1e78d000 {
 				compatible = "ns16550a";
 				reg = <0x1e78d000 0x1000>;
@@ -317,27 +337,6 @@
 				status = "disabled";
 			};
 
-			uart5: serial@1e784000 {
-				compatible = "ns16550a";
-				reg = <0x1e784000 0x1000>;
-				reg-shift = <2>;
-				interrupts = <10>;
-				clocks = <&clk_uart>;
-				current-speed = <38400>;
-				no-loopback-test;
-				status = "disabled";
-			};
-
-			uart6: serial@1e787000 {
-				compatible = "ns16550a";
-				reg = <0x1e787000 0x1000>;
-				reg-shift = <2>;
-				interrupts = <10>;
-				clocks = <&clk_uart>;
-				no-loopback-test;
-				status = "disabled";
-			};
-
 			i2c: i2c@1e78a000 {
 				compatible = "simple-bus";
 				#address-cells = <1>;
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
