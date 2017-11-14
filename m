From: Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v8 6/6] arm: dts: stm32: remove useless clocksource nodes
Date: Tue, 14 Nov 2017 09:52:43 +0100
Message-ID: <1510649563-22975-7-git-send-email-benjamin.gaignard@linaro.org>
References: <1510649563-22975-1-git-send-email-benjamin.gaignard@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1510649563-22975-1-git-send-email-benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alexandre.torgue-qxv4g6HH51o@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, ludovic.barre-qxv4g6HH51o@public.gmane.org, julien.thierry-5wv7dgnIgG8@public.gmane.org, sudeep.holla-5wv7dgnIgG8@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

16 bits timers aren't accurate enough to be used as
clocksource, remove them from stm32f4 and stm32f7 devicetree.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/stm32f429.dtsi | 32 --------------------------------
 arch/arm/boot/dts/stm32f746.dtsi | 32 --------------------------------
 2 files changed, 64 deletions(-)

diff --git a/arch/arm/boot/dts/stm32f429.dtsi b/arch/arm/boot/dts/stm32f429.dtsi
index dd7e99b..ac9a3e6 100644
--- a/arch/arm/boot/dts/stm32f429.dtsi
+++ b/arch/arm/boot/dts/stm32f429.dtsi
@@ -108,14 +108,6 @@
 			};
 		};
 
-		timer3: timer@40000400 {
-			compatible = "st,stm32-timer";
-			reg = <0x40000400 0x400>;
-			interrupts = <29>;
-			clocks = <&rcc 0 STM32F4_APB1_CLOCK(TIM3)>;
-			status = "disabled";
-		};
-
 		timers3: timers@40000400 {
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -137,14 +129,6 @@
 			};
 		};
 
-		timer4: timer@40000800 {
-			compatible = "st,stm32-timer";
-			reg = <0x40000800 0x400>;
-			interrupts = <30>;
-			clocks = <&rcc 0 STM32F4_APB1_CLOCK(TIM4)>;
-			status = "disabled";
-		};
-
 		timers4: timers@40000800 {
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -194,14 +178,6 @@
 			};
 		};
 
-		timer6: timer@40001000 {
-			compatible = "st,stm32-timer";
-			reg = <0x40001000 0x400>;
-			interrupts = <54>;
-			clocks = <&rcc 0 STM32F4_APB1_CLOCK(TIM6)>;
-			status = "disabled";
-		};
-
 		timers6: timers@40001000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -218,14 +194,6 @@
 			};
 		};
 
-		timer7: timer@40001400 {
-			compatible = "st,stm32-timer";
-			reg = <0x40001400 0x400>;
-			interrupts = <55>;
-			clocks = <&rcc 0 STM32F4_APB1_CLOCK(TIM7)>;
-			status = "disabled";
-		};
-
 		timers7: timers@40001400 {
 			#address-cells = <1>;
 			#size-cells = <0>;
diff --git a/arch/arm/boot/dts/stm32f746.dtsi b/arch/arm/boot/dts/stm32f746.dtsi
index 5633860..a9077e6 100644
--- a/arch/arm/boot/dts/stm32f746.dtsi
+++ b/arch/arm/boot/dts/stm32f746.dtsi
@@ -82,22 +82,6 @@
 			status = "disabled";
 		};
 
-		timer3: timer@40000400 {
-			compatible = "st,stm32-timer";
-			reg = <0x40000400 0x400>;
-			interrupts = <29>;
-			clocks = <&rcc 0 STM32F7_APB1_CLOCK(TIM3)>;
-			status = "disabled";
-		};
-
-		timer4: timer@40000800 {
-			compatible = "st,stm32-timer";
-			reg = <0x40000800 0x400>;
-			interrupts = <30>;
-			clocks = <&rcc 0 STM32F7_APB1_CLOCK(TIM4)>;
-			status = "disabled";
-		};
-
 		timer5: timer@40000c00 {
 			compatible = "st,stm32-timer";
 			reg = <0x40000c00 0x400>;
@@ -105,22 +89,6 @@
 			clocks = <&rcc 0 STM32F7_APB1_CLOCK(TIM5)>;
 		};
 
-		timer6: timer@40001000 {
-			compatible = "st,stm32-timer";
-			reg = <0x40001000 0x400>;
-			interrupts = <54>;
-			clocks = <&rcc 0 STM32F7_APB1_CLOCK(TIM6)>;
-			status = "disabled";
-		};
-
-		timer7: timer@40001400 {
-			compatible = "st,stm32-timer";
-			reg = <0x40001400 0x400>;
-			interrupts = <55>;
-			clocks = <&rcc 0 STM32F7_APB1_CLOCK(TIM7)>;
-			status = "disabled";
-		};
-
 		rtc: rtc@40002800 {
 			compatible = "st,stm32-rtc";
 			reg = <0x40002800 0x400>;
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
