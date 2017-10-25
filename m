From: Ludovic Barre <ludovic.Barre-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH v2 9/9] ARM: dts: stm32: add support of exti on stm32h743 pinctrl
Date: Wed, 25 Oct 2017 19:11:05 +0200
Message-ID: <1508951465-17152-10-git-send-email-ludovic.Barre@st.com>
References: <1508951465-17152-1-git-send-email-ludovic.Barre@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1508951465-17152-1-git-send-email-ludovic.Barre-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>

This patch adds support of external interrupt (exti) on
all gpio ports of stm32h743.

Signed-off-by: Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>
---
 arch/arm/boot/dts/stm32h743-pinctrl.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/stm32h743-pinctrl.dtsi b/arch/arm/boot/dts/stm32h743-pinctrl.dtsi
index 76bbd65..df0b441 100644
--- a/arch/arm/boot/dts/stm32h743-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32h743-pinctrl.dtsi
@@ -49,6 +49,8 @@
 			#size-cells = <1>;
 			compatible = "st,stm32h743-pinctrl";
 			ranges = <0 0x58020000 0x3000>;
+			interrupt-parent = <&exti>;
+			st,syscfg = <&syscfg 0x8>;
 			pins-are-numbered;
 
 			gpioa: gpio@58020000 {
@@ -57,6 +59,8 @@
 				reg = <0x0 0x400>;
 				clocks = <&timer_clk>;
 				st,bank-name = "GPIOA";
+				interrupt-controller;
+				#interrupt-cells = <2>;
 			};
 
 			gpiob: gpio@58020400 {
@@ -65,6 +69,8 @@
 				reg = <0x400 0x400>;
 				clocks = <&timer_clk>;
 				st,bank-name = "GPIOB";
+				interrupt-controller;
+				#interrupt-cells = <2>;
 			};
 
 			gpioc: gpio@58020800 {
@@ -73,6 +79,8 @@
 				reg = <0x800 0x400>;
 				clocks = <&timer_clk>;
 				st,bank-name = "GPIOC";
+				interrupt-controller;
+				#interrupt-cells = <2>;
 			};
 
 			gpiod: gpio@58020c00 {
@@ -81,6 +89,8 @@
 				reg = <0xc00 0x400>;
 				clocks = <&timer_clk>;
 				st,bank-name = "GPIOD";
+				interrupt-controller;
+				#interrupt-cells = <2>;
 			};
 
 			gpioe: gpio@58021000 {
@@ -89,6 +99,8 @@
 				reg = <0x1000 0x400>;
 				clocks = <&timer_clk>;
 				st,bank-name = "GPIOE";
+				interrupt-controller;
+				#interrupt-cells = <2>;
 			};
 
 			gpiof: gpio@58021400 {
@@ -97,6 +109,8 @@
 				reg = <0x1400 0x400>;
 				clocks = <&timer_clk>;
 				st,bank-name = "GPIOF";
+				interrupt-controller;
+				#interrupt-cells = <2>;
 			};
 
 			gpiog: gpio@58021800 {
@@ -105,6 +119,8 @@
 				reg = <0x1800 0x400>;
 				clocks = <&timer_clk>;
 				st,bank-name = "GPIOG";
+				interrupt-controller;
+				#interrupt-cells = <2>;
 			};
 
 			gpioh: gpio@58021c00 {
@@ -113,6 +129,8 @@
 				reg = <0x1c00 0x400>;
 				clocks = <&timer_clk>;
 				st,bank-name = "GPIOH";
+				interrupt-controller;
+				#interrupt-cells = <2>;
 			};
 
 			gpioi: gpio@58022000 {
@@ -121,6 +139,8 @@
 				reg = <0x2000 0x400>;
 				clocks = <&timer_clk>;
 				st,bank-name = "GPIOI";
+				interrupt-controller;
+				#interrupt-cells = <2>;
 			};
 
 			gpioj: gpio@58022400 {
@@ -129,6 +149,8 @@
 				reg = <0x2400 0x400>;
 				clocks = <&timer_clk>;
 				st,bank-name = "GPIOJ";
+				interrupt-controller;
+				#interrupt-cells = <2>;
 			};
 
 			gpiok: gpio@58022800 {
@@ -137,6 +159,8 @@
 				reg = <0x2800 0x400>;
 				clocks = <&timer_clk>;
 				st,bank-name = "GPIOK";
+				interrupt-controller;
+				#interrupt-cells = <2>;
 			};
 
 			usart1_pins: usart1@0 {
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
