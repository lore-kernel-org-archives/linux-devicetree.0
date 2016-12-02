From: Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: [PATCH 2/3] ARM: dts: stm32: Add ADC support to stm32f429
Date: Fri, 2 Dec 2016 14:57:01 +0100
Message-ID: <1480687022-12851-3-git-send-email-fabrice.gasnier@st.com>
References: <1480687022-12851-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1480687022-12851-1-git-send-email-fabrice.gasnier@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: alexandre.torgue@st.com, mcoquelin.stm32@gmail.com, linux@armlinux.org.uk, mark.rutland@arm.com, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add ADC support & pinctrl analog phandle (adc3_in8) to stm32f429.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
---
 arch/arm/boot/dts/stm32f429.dtsi | 49 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f429.dtsi b/arch/arm/boot/dts/stm32f429.dtsi
index 3dd47eb..be1d970 100644
--- a/arch/arm/boot/dts/stm32f429.dtsi
+++ b/arch/arm/boot/dts/stm32f429.dtsi
@@ -172,6 +172,49 @@
 			status = "disabled";
 		};
 
+		adc: adc@40012000 {
+			compatible = "st,stm32f4-adc-core";
+			reg = <0x40012000 0x400>;
+			interrupts = <18>;
+			clocks = <&rcc 0 168>;
+			clock-names = "adc";
+			interrupt-controller;
+			#interrupt-cells = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+
+			adc1: adc@0 {
+				compatible = "st,stm32f4-adc";
+				#io-channel-cells = <1>;
+				reg = <0x0>;
+				clocks = <&rcc 0 168>;
+				interrupt-parent = <&adc>;
+				interrupts = <0>;
+				status = "disabled";
+			};
+
+			adc2: adc@100 {
+				compatible = "st,stm32f4-adc";
+				#io-channel-cells = <1>;
+				reg = <0x100>;
+				clocks = <&rcc 0 169>;
+				interrupt-parent = <&adc>;
+				interrupts = <1>;
+				status = "disabled";
+			};
+
+			adc3: adc@200 {
+				compatible = "st,stm32f4-adc";
+				#io-channel-cells = <1>;
+				reg = <0x200>;
+				clocks = <&rcc 0 170>;
+				interrupt-parent = <&adc>;
+				interrupts = <2>;
+				status = "disabled";
+			};
+		};
+
 		syscfg: system-config@40013800 {
 			compatible = "syscon";
 			reg = <0x40013800 0x400>;
@@ -334,6 +377,12 @@
 					slew-rate = <2>;
 				};
 			};
+
+			adc3_in8_pin: adc@200 {
+				pins {
+					pinmux = <STM32F429_PF10_FUNC_ANALOG>;
+				};
+			};
 		};
 
 		rcc: rcc@40023810 {
-- 
1.9.1
