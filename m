From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Subject: [PATCH] ARM: dts: stm32: add Timers driver for stm32f746 MCU
Date: Wed,  4 Oct 2017 11:27:50 +0200
Message-ID: <1507109270-24646-1-git-send-email-benjamin.gaignard@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Benjamin Gaignard <benjamin.gaignard@st.com>
List-Id: devicetree@vger.kernel.org

Add Timers and it sub-nodes into DT for stm32f746 family.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
 arch/arm/boot/dts/stm32f746.dtsi | 270 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 270 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f746.dtsi b/arch/arm/boot/dts/stm32f746.dtsi
index 4506eb9..ae84816 100644
--- a/arch/arm/boot/dts/stm32f746.dtsi
+++ b/arch/arm/boot/dts/stm32f746.dtsi
@@ -82,6 +82,27 @@
 			status = "disabled";
 		};
 
+		timers2: timers@40000000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "st,stm32-timers";
+			reg = <0x40000000 0x400>;
+			clocks = <&rcc 0 STM32F7_APB1_CLOCK(TIM2)>;
+			clock-names = "int";
+			status = "disabled";
+
+			pwm {
+				compatible = "st,stm32-pwm";
+				status = "disabled";
+			};
+
+			timer@1 {
+				compatible = "st,stm32-timer-trigger";
+				reg = <1>;
+				status = "disabled";
+			};
+		};
+
 		timer3: timer@40000400 {
 			compatible = "st,stm32-timer";
 			reg = <0x40000400 0x400>;
@@ -90,6 +111,27 @@
 			status = "disabled";
 		};
 
+		timers3: timers@40000400 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "st,stm32-timers";
+			reg = <0x40000400 0x400>;
+			clocks = <&rcc 0 STM32F7_APB1_CLOCK(TIM3)>;
+			clock-names = "int";
+			status = "disabled";
+
+			pwm {
+				compatible = "st,stm32-pwm";
+				status = "disabled";
+			};
+
+			timer@2 {
+				compatible = "st,stm32-timer-trigger";
+				reg = <2>;
+				status = "disabled";
+			};
+		};
+
 		timer4: timer@40000800 {
 			compatible = "st,stm32-timer";
 			reg = <0x40000800 0x400>;
@@ -98,6 +140,27 @@
 			status = "disabled";
 		};
 
+		timers4: timers@40000800 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "st,stm32-timers";
+			reg = <0x40000800 0x400>;
+			clocks = <&rcc 0 STM32F7_APB1_CLOCK(TIM4)>;
+			clock-names = "int";
+			status = "disabled";
+
+			pwm {
+				compatible = "st,stm32-pwm";
+				status = "disabled";
+			};
+
+			timer@3 {
+				compatible = "st,stm32-timer-trigger";
+				reg = <3>;
+				status = "disabled";
+			};
+		};
+
 		timer5: timer@40000c00 {
 			compatible = "st,stm32-timer";
 			reg = <0x40000c00 0x400>;
@@ -105,6 +168,27 @@
 			clocks = <&rcc 0 STM32F7_APB1_CLOCK(TIM5)>;
 		};
 
+		timers5: timers@40000c00 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "st,stm32-timers";
+			reg = <0x40000C00 0x400>;
+			clocks = <&rcc 0 STM32F7_APB1_CLOCK(TIM5)>;
+			clock-names = "int";
+			status = "disabled";
+
+			pwm {
+				compatible = "st,stm32-pwm";
+				status = "disabled";
+			};
+
+			timer@4 {
+				compatible = "st,stm32-timer-trigger";
+				reg = <4>;
+				status = "disabled";
+			};
+		};
+
 		timer6: timer@40001000 {
 			compatible = "st,stm32-timer";
 			reg = <0x40001000 0x400>;
@@ -113,6 +197,22 @@
 			status = "disabled";
 		};
 
+		timers6: timers@40001000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "st,stm32-timers";
+			reg = <0x40001000 0x400>;
+			clocks = <&rcc 0 STM32F7_APB1_CLOCK(TIM6)>;
+			clock-names = "int";
+			status = "disabled";
+
+			timer@5 {
+				compatible = "st,stm32-timer-trigger";
+				reg = <5>;
+				status = "disabled";
+			};
+		};
+
 		timer7: timer@40001400 {
 			compatible = "st,stm32-timer";
 			reg = <0x40001400 0x400>;
@@ -121,6 +221,73 @@
 			status = "disabled";
 		};
 
+		timers7: timers@40001400 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "st,stm32-timers";
+			reg = <0x40001400 0x400>;
+			clocks = <&rcc 0 STM32F7_APB1_CLOCK(TIM7)>;
+			clock-names = "int";
+			status = "disabled";
+
+			timer@6 {
+				compatible = "st,stm32-timer-trigger";
+				reg = <6>;
+				status = "disabled";
+			};
+		};
+
+		timers12: timers@40001800 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "st,stm32-timers";
+			reg = <0x40001800 0x400>;
+			clocks = <&rcc 0 STM32F7_APB1_CLOCK(TIM12)>;
+			clock-names = "int";
+			status = "disabled";
+
+			pwm {
+				compatible = "st,stm32-pwm";
+				status = "disabled";
+			};
+
+			timer@11 {
+				compatible = "st,stm32-timer-trigger";
+				reg = <11>;
+				status = "disabled";
+			};
+		};
+
+		timers13: timers@40001c00 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "st,stm32-timers";
+			reg = <0x40001C00 0x400>;
+			clocks = <&rcc 0 STM32F7_APB1_CLOCK(TIM13)>;
+			clock-names = "int";
+			status = "disabled";
+
+			pwm {
+				compatible = "st,stm32-pwm";
+				status = "disabled";
+			};
+		};
+
+		timers14: timers@40002000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "st,stm32-timers";
+			reg = <0x40002000 0x400>;
+			clocks = <&rcc 0 STM32F7_APB1_CLOCK(TIM14)>;
+			clock-names = "int";
+			status = "disabled";
+
+			pwm {
+				compatible = "st,stm32-pwm";
+				status = "disabled";
+			};
+		};
+
 		rtc: rtc@40002800 {
 			compatible = "st,stm32-rtc";
 			reg = <0x40002800 0x400>;
@@ -183,6 +350,48 @@
 			status = "disabled";
 		};
 
+		timers1: timers@40010000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "st,stm32-timers";
+			reg = <0x40010000 0x400>;
+			clocks = <&rcc 0 STM32F7_APB2_CLOCK(TIM1)>;
+			clock-names = "int";
+			status = "disabled";
+
+			pwm {
+				compatible = "st,stm32-pwm";
+				status = "disabled";
+			};
+
+			timer@0 {
+				compatible = "st,stm32-timer-trigger";
+				reg = <0>;
+				status = "disabled";
+			};
+		};
+
+		timers8: timers@40010400 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "st,stm32-timers";
+			reg = <0x40010400 0x400>;
+			clocks = <&rcc 0 STM32F7_APB2_CLOCK(TIM8)>;
+			clock-names = "int";
+			status = "disabled";
+
+			pwm {
+				compatible = "st,stm32-pwm";
+				status = "disabled";
+			};
+
+			timer@7 {
+				compatible = "st,stm32-timer-trigger";
+				reg = <7>;
+				status = "disabled";
+			};
+		};
+
 		usart1: serial@40011000 {
 			compatible = "st,stm32f7-usart", "st,stm32f7-uart";
 			reg = <0x40011000 0x400>;
@@ -212,11 +421,72 @@
 			interrupts = <1>, <2>, <3>, <6>, <7>, <8>, <9>, <10>, <23>, <40>, <41>, <42>, <62>, <76>;
 		};
 
+		timers9: timers@40014000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "st,stm32-timers";
+			reg = <0x40014000 0x400>;
+			clocks = <&rcc 0 STM32F7_APB2_CLOCK(TIM9)>;
+			clock-names = "int";
+			status = "disabled";
+
+			pwm {
+				compatible = "st,stm32-pwm";
+				status = "disabled";
+			};
+
+			timer@8 {
+				compatible = "st,stm32-timer-trigger";
+				reg = <8>;
+				status = "disabled";
+			};
+		};
+
+		timers10: timers@40014400 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "st,stm32-timers";
+			reg = <0x40014400 0x400>;
+			clocks = <&rcc 0 STM32F7_APB2_CLOCK(TIM10)>;
+			clock-names = "int";
+			status = "disabled";
+
+			pwm {
+				compatible = "st,stm32-pwm";
+				status = "disabled";
+			};
+		};
+
+		timers11: timers@40014800 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "st,stm32-timers";
+			reg = <0x40014800 0x400>;
+			clocks = <&rcc 0 STM32F7_APB2_CLOCK(TIM11)>;
+			clock-names = "int";
+			status = "disabled";
+
+			pwm {
+				compatible = "st,stm32-pwm";
+				status = "disabled";
+			};
+		};
+
 		pwrcfg: power-config@40007000 {
 			compatible = "syscon";
 			reg = <0x40007000 0x400>;
 		};
 
+		ltdc: display-controller@40016800 {
+			compatible = "st,stm32-ltdc";
+			reg = <0x40016800 0x200>;
+			interrupts = <88>, <89>;
+			resets = <&rcc STM32F7_APB2_RESET(LTDC)>;
+			clocks = <&rcc 1 CLK_LCD>;
+			clock-names = "lcd";
+			status = "disabled";
+		};
+
 		pin-controller {
 			#address-cells = <1>;
 			#size-cells = <1>;
-- 
2.7.4
