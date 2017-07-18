From: Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/2] arm: dts: stm32: add cec for stm32f7 familly
Date: Tue, 18 Jul 2017 10:22:20 +0200
Message-ID: <1500366141-30706-1-git-send-email-benjamin.gaignard@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alexandre.torgue-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

add cec in devicetree for stm32f7 familly

Signed-off-by: Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/stm32f746.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f746.dtsi b/arch/arm/boot/dts/stm32f746.dtsi
index 0c3dd1f..770e474 100644
--- a/arch/arm/boot/dts/stm32f746.dtsi
+++ b/arch/arm/boot/dts/stm32f746.dtsi
@@ -167,6 +167,15 @@
 			status = "disabled";
 		};
 
+		cec: cec@40006c00 {
+			compatible = "st,stm32-cec";
+			reg = <0x40006C00 0x400>;
+			interrupts = <94>;
+			clocks = <&rcc 0 STM32F7_APB1_CLOCK(CEC)>, <&rcc 1 CLK_HDMI_CEC>;
+			clock-names = "cec", "hdmi-cec";
+			status = "disabled";
+		};
+
 		usart7: serial@40007800 {
 			compatible = "st,stm32f7-usart", "st,stm32f7-uart";
 			reg = <0x40007800 0x400>;
@@ -339,6 +348,15 @@
 				st,bank-name = "GPIOK";
 			};
 
+			cec_pins_a: cec@0 {
+				pins {
+					pinmux = <STM32F746_PA15_FUNC_HDMI_CEC>;
+					slew-rate = <3>;
+					drive-open-drain;
+					bias-disable;
+				};
+			};
+
 			usart1_pins_a: usart1@0 {
 				pins1 {
 					pinmux = <STM32F746_PA9_FUNC_USART1_TX>;
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
