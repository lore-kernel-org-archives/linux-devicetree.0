From: Ludovic Barre <ludovic.Barre@st.com>
Subject: [PATCH  3/7] ARM: dts: stm32: add sdmmc1 support on stm32h743i eval board
Date: Fri, 1 Mar 2019 09:47:44 +0100
Message-ID: <1551430068-9456-4-git-send-email-ludovic.Barre@st.com>
References: <1551430068-9456-1-git-send-email-ludovic.Barre@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1551430068-9456-1-git-send-email-ludovic.Barre@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, Ludovic Barre <ludovic.barre@st.com>
List-Id: devicetree@vger.kernel.org

From: Ludovic Barre <ludovic.barre@st.com>

This patch adds sdmmc1 support on stm32h743i eval board.
This board has an external driver to control signal direction polarity.

Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
---
 arch/arm/boot/dts/stm32h743-pinctrl.dtsi | 68 ++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/stm32h743i-eval.dts    | 23 ++++++++++-
 2 files changed, 90 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/stm32h743-pinctrl.dtsi b/arch/arm/boot/dts/stm32h743-pinctrl.dtsi
index 24be8e6..98051a8 100644
--- a/arch/arm/boot/dts/stm32h743-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32h743-pinctrl.dtsi
@@ -173,6 +173,74 @@
 				};
 			};
 
+			sdmmc1_b4_pins_a: sdmmc1-b4-0 {
+				pins {
+					pinmux = <STM32_PINMUX('C', 8, AF12)>, /* SDMMC1_D0 */
+						 <STM32_PINMUX('C', 9, AF12)>, /* SDMMC1_D1 */
+						 <STM32_PINMUX('C', 10, AF12)>, /* SDMMC1_D2 */
+						 <STM32_PINMUX('C', 11, AF12)>, /* SDMMC1_D3 */
+						 <STM32_PINMUX('C', 12, AF12)>, /* SDMMC1_CK */
+						 <STM32_PINMUX('D', 2, AF12)>; /* SDMMC1_CMD */
+					slew-rate = <3>;
+					drive-push-pull;
+					bias-disable;
+				};
+			};
+
+			sdmmc1_b4_od_pins_a: sdmmc1-b4-od-0 {
+				pins1 {
+					pinmux = <STM32_PINMUX('C', 8, AF12)>, /* SDMMC1_D0 */
+						 <STM32_PINMUX('C', 9, AF12)>, /* SDMMC1_D1 */
+						 <STM32_PINMUX('C', 10, AF12)>, /* SDMMC1_D2 */
+						 <STM32_PINMUX('C', 11, AF12)>, /* SDMMC1_D3 */
+						 <STM32_PINMUX('C', 12, AF12)>; /* SDMMC1_CK */
+					slew-rate = <3>;
+					drive-push-pull;
+					bias-disable;
+				};
+				pins2{
+					pinmux = <STM32_PINMUX('D', 2, AF12)>; /* SDMMC1_CMD */
+					slew-rate = <3>;
+					drive-open-drain;
+					bias-disable;
+				};
+			};
+
+			sdmmc1_b4_sleep_pins_a: sdmmc1-b4-sleep-0 {
+				pins {
+					pinmux = <STM32_PINMUX('C', 8, ANALOG)>, /* SDMMC1_D0 */
+						 <STM32_PINMUX('C', 9, ANALOG)>, /* SDMMC1_D1 */
+						 <STM32_PINMUX('C', 10, ANALOG)>, /* SDMMC1_D2 */
+						 <STM32_PINMUX('C', 11, ANALOG)>, /* SDMMC1_D3 */
+						 <STM32_PINMUX('C', 12, ANALOG)>, /* SDMMC1_CK */
+						 <STM32_PINMUX('D', 2, ANALOG)>; /* SDMMC1_CMD */
+				};
+			};
+
+			sdmmc1_dir_pins_a: sdmmc1-dir-0 {
+				pins1 {
+					pinmux = <STM32_PINMUX('C', 6, AF8)>, /* SDMMC1_D0DIR */
+						 <STM32_PINMUX('C', 7, AF8)>, /* SDMMC1_D123DIR */
+						 <STM32_PINMUX('B', 9, AF7)>; /* SDMMC1_CDIR */
+					slew-rate = <3>;
+					drive-push-pull;
+					bias-pull-up;
+				};
+				pins2{
+					pinmux = <STM32_PINMUX('B', 8, AF7)>; /* SDMMC1_CKIN */
+					bias-pull-up;
+				};
+			};
+
+			sdmmc1_dir_sleep_pins_a: sdmmc1-dir-sleep-0 {
+				pins {
+					pinmux = <STM32_PINMUX('C', 6, ANALOG)>, /* SDMMC1_D0DIR */
+						 <STM32_PINMUX('C', 7, ANALOG)>, /* SDMMC1_D123DIR */
+						 <STM32_PINMUX('B', 9, ANALOG)>, /* SDMMC1_CDIR */
+						 <STM32_PINMUX('B', 8, ANALOG)>; /* SDMMC1_CKIN */
+				};
+			};
+
 			usart1_pins: usart1@0 {
 				pins1 {
 					pinmux = <STM32_PINMUX('B', 14, AF4)>; /* USART1_TX */
diff --git a/arch/arm/boot/dts/stm32h743i-eval.dts b/arch/arm/boot/dts/stm32h743i-eval.dts
index 3f8e0c4..eb5e0d4 100644
--- a/arch/arm/boot/dts/stm32h743i-eval.dts
+++ b/arch/arm/boot/dts/stm32h743i-eval.dts
@@ -69,13 +69,20 @@
 		regulator-always-on;
 	};
 
+	v2v9_sd: regulator-v2v9_sd {
+		compatible = "regulator-fixed";
+		regulator-name = "v2v9_sd";
+		regulator-min-microvolt = <2900000>;
+		regulator-max-microvolt = <2900000>;
+		regulator-always-on;
+	};
+
 	usbotg_hs_phy: usb-phy {
 		#phy-cells = <0>;
 		compatible = "usb-nop-xceiv";
 		clocks = <&rcc USB1ULPI_CK>;
 		clock-names = "main_clk";
 	};
-
 };
 
 &adc_12 {
@@ -104,6 +111,20 @@
 	status = "okay";
 };
 
+&sdmmc1 {
+	pinctrl-names = "default", "opendrain", "sleep";
+	pinctrl-0 = <&sdmmc1_b4_pins_a &sdmmc1_dir_pins_a>;
+	pinctrl-1 = <&sdmmc1_b4_od_pins_a &sdmmc1_dir_pins_a>;
+	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a &sdmmc1_dir_sleep_pins_a>;
+	broken-cd;
+	st,sig-dir;
+	st,neg-edge;
+	st,use-ckin;
+	bus-width = <4>;
+	vmmc-supply = <&v2v9_sd>;
+	status = "okay";
+};
+
 &usart1 {
 	pinctrl-0 = <&usart1_pins>;
 	pinctrl-names = "default";
-- 
2.7.4
