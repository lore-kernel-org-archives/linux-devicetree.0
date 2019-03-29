From: =?UTF-8?q?Yannick=20Fertr=C3=A9?= <yannick.fertre@st.com>
Subject: [PATCH] ARM: dts: stm32: add ltdc pins muxing on stm32mp157
Date: Fri, 29 Mar 2019 13:27:55 +0100
Message-ID: <1553862475-5956-1-git-send-email-yannick.fertre@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Benjamin Gaignard <benjamin.gaignard@st.com>, Yannick Fertre <yannick.fertre@st.com>, Philippe Cornu <philippe.cornu@st.com>, Fabrice Gasnier <fabrice.gasnier@st.com>
List-Id: devicetree@vger.kernel.org

Add ltdc pins muxing on stm32mp157.

Signed-off-by: Yannick Fertré <yannick.fertre@st.com>
---
 arch/arm/boot/dts/stm32mp157-pinctrl.dtsi | 138 ++++++++++++++++++++++++++++++
 1 file changed, 138 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
index 9104896..da4b411 100644
--- a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
@@ -233,6 +233,144 @@
 				};
 			};
 
+			ltdc_pins_a: ltdc-a-0 {
+				pins {
+					pinmux = <STM32_PINMUX('G',  7, AF14)>, /* LCD_CLK */
+						 <STM32_PINMUX('I', 10, AF14)>, /* LCD_HSYNC */
+						 <STM32_PINMUX('I',  9, AF14)>, /* LCD_VSYNC */
+						 <STM32_PINMUX('F', 10, AF14)>, /* LCD_DE */
+						 <STM32_PINMUX('H',  2, AF14)>, /* LCD_R0 */
+						 <STM32_PINMUX('H',  3, AF14)>, /* LCD_R1 */
+						 <STM32_PINMUX('H',  8, AF14)>, /* LCD_R2 */
+						 <STM32_PINMUX('H',  9, AF14)>, /* LCD_R3 */
+						 <STM32_PINMUX('H', 10, AF14)>, /* LCD_R4 */
+						 <STM32_PINMUX('C',  0, AF14)>, /* LCD_R5 */
+						 <STM32_PINMUX('H', 12, AF14)>, /* LCD_R6 */
+						 <STM32_PINMUX('E', 15, AF14)>, /* LCD_R7 */
+						 <STM32_PINMUX('E',  5, AF14)>, /* LCD_G0 */
+						 <STM32_PINMUX('E',  6, AF14)>, /* LCD_G1 */
+						 <STM32_PINMUX('H', 13, AF14)>, /* LCD_G2 */
+						 <STM32_PINMUX('H', 14, AF14)>, /* LCD_G3 */
+						 <STM32_PINMUX('H', 15, AF14)>, /* LCD_G4 */
+						 <STM32_PINMUX('I',  0, AF14)>, /* LCD_G5 */
+						 <STM32_PINMUX('I',  1, AF14)>, /* LCD_G6 */
+						 <STM32_PINMUX('I',  2, AF14)>, /* LCD_G7 */
+						 <STM32_PINMUX('D',  9, AF14)>, /* LCD_B0 */
+						 <STM32_PINMUX('G', 12, AF14)>, /* LCD_B1 */
+						 <STM32_PINMUX('G', 10, AF14)>, /* LCD_B2 */
+						 <STM32_PINMUX('D', 10, AF14)>, /* LCD_B3 */
+						 <STM32_PINMUX('I',  4, AF14)>, /* LCD_B4 */
+						 <STM32_PINMUX('A',  3, AF14)>, /* LCD_B5 */
+						 <STM32_PINMUX('B',  8, AF14)>, /* LCD_B6 */
+						 <STM32_PINMUX('D',  8, AF14)>; /* LCD_B7 */
+					bias-disable;
+					drive-push-pull;
+					slew-rate = <1>;
+				};
+			};
+
+			ltdc_pins_sleep_a: ltdc-a-1 {
+				pins {
+					pinmux = <STM32_PINMUX('G',  7, ANALOG)>, /* LCD_CLK */
+						 <STM32_PINMUX('I', 10, ANALOG)>, /* LCD_HSYNC */
+						 <STM32_PINMUX('I',  9, ANALOG)>, /* LCD_VSYNC */
+						 <STM32_PINMUX('F', 10, ANALOG)>, /* LCD_DE */
+						 <STM32_PINMUX('H',  2, ANALOG)>, /* LCD_R0 */
+						 <STM32_PINMUX('H',  3, ANALOG)>, /* LCD_R1 */
+						 <STM32_PINMUX('H',  8, ANALOG)>, /* LCD_R2 */
+						 <STM32_PINMUX('H',  9, ANALOG)>, /* LCD_R3 */
+						 <STM32_PINMUX('H', 10, ANALOG)>, /* LCD_R4 */
+						 <STM32_PINMUX('C',  0, ANALOG)>, /* LCD_R5 */
+						 <STM32_PINMUX('H', 12, ANALOG)>, /* LCD_R6 */
+						 <STM32_PINMUX('E', 15, ANALOG)>, /* LCD_R7 */
+						 <STM32_PINMUX('E',  5, ANALOG)>, /* LCD_G0 */
+						 <STM32_PINMUX('E',  6, ANALOG)>, /* LCD_G1 */
+						 <STM32_PINMUX('H', 13, ANALOG)>, /* LCD_G2 */
+						 <STM32_PINMUX('H', 14, ANALOG)>, /* LCD_G3 */
+						 <STM32_PINMUX('H', 15, ANALOG)>, /* LCD_G4 */
+						 <STM32_PINMUX('I',  0, ANALOG)>, /* LCD_G5 */
+						 <STM32_PINMUX('I',  1, ANALOG)>, /* LCD_G6 */
+						 <STM32_PINMUX('I',  2, ANALOG)>, /* LCD_G7 */
+						 <STM32_PINMUX('D',  9, ANALOG)>, /* LCD_B0 */
+						 <STM32_PINMUX('G', 12, ANALOG)>, /* LCD_B1 */
+						 <STM32_PINMUX('G', 10, ANALOG)>, /* LCD_B2 */
+						 <STM32_PINMUX('D', 10, ANALOG)>, /* LCD_B3 */
+						 <STM32_PINMUX('I',  4, ANALOG)>, /* LCD_B4 */
+						 <STM32_PINMUX('A',  3, ANALOG)>, /* LCD_B5 */
+						 <STM32_PINMUX('B',  8, ANALOG)>, /* LCD_B6 */
+						 <STM32_PINMUX('D',  8, ANALOG)>; /* LCD_B7 */
+				};
+			};
+
+			ltdc_pins_b: ltdc-b-0 {
+				pins {
+					pinmux = <STM32_PINMUX('I', 14, AF14)>, /* LCD_CLK */
+						 <STM32_PINMUX('I', 12, AF14)>, /* LCD_HSYNC */
+						 <STM32_PINMUX('I', 13, AF14)>, /* LCD_VSYNC */
+						 <STM32_PINMUX('K',  7, AF14)>, /* LCD_DE */
+						 <STM32_PINMUX('I', 15, AF14)>, /* LCD_R0 */
+						 <STM32_PINMUX('J',  0, AF14)>, /* LCD_R1 */
+						 <STM32_PINMUX('J',  1, AF14)>, /* LCD_R2 */
+						 <STM32_PINMUX('J',  2, AF14)>, /* LCD_R3 */
+						 <STM32_PINMUX('J',  3, AF14)>, /* LCD_R4 */
+						 <STM32_PINMUX('J',  4, AF14)>, /* LCD_R5 */
+						 <STM32_PINMUX('J',  5, AF14)>, /* LCD_R6 */
+						 <STM32_PINMUX('J',  6, AF14)>, /* LCD_R7 */
+						 <STM32_PINMUX('J',  7, AF14)>, /* LCD_G0 */
+						 <STM32_PINMUX('J',  8, AF14)>, /* LCD_G1 */
+						 <STM32_PINMUX('J',  9, AF14)>, /* LCD_G2 */
+						 <STM32_PINMUX('J', 10, AF14)>, /* LCD_G3 */
+						 <STM32_PINMUX('J', 11, AF14)>, /* LCD_G4 */
+						 <STM32_PINMUX('K',  0, AF14)>, /* LCD_G5 */
+						 <STM32_PINMUX('K',  1, AF14)>, /* LCD_G6 */
+						 <STM32_PINMUX('K',  2, AF14)>, /* LCD_G7 */
+						 <STM32_PINMUX('J', 12, AF14)>, /* LCD_B0 */
+						 <STM32_PINMUX('J', 13, AF14)>, /* LCD_B1 */
+						 <STM32_PINMUX('J', 14, AF14)>, /* LCD_B2 */
+						 <STM32_PINMUX('J', 15, AF14)>, /* LCD_B3 */
+						 <STM32_PINMUX('K',  3, AF14)>, /* LCD_B4 */
+						 <STM32_PINMUX('K',  4, AF14)>, /* LCD_B5 */
+						 <STM32_PINMUX('K',  5, AF14)>, /* LCD_B6 */
+						 <STM32_PINMUX('K',  6, AF14)>; /* LCD_B7 */
+					bias-disable;
+					drive-push-pull;
+					slew-rate = <1>;
+				};
+			};
+
+			ltdc_pins_sleep_b: ltdc-b-1 {
+				pins {
+					pinmux = <STM32_PINMUX('I', 14, ANALOG)>, /* LCD_CLK */
+						 <STM32_PINMUX('I', 12, ANALOG)>, /* LCD_HSYNC */
+						 <STM32_PINMUX('I', 13, ANALOG)>, /* LCD_VSYNC */
+						 <STM32_PINMUX('K',  7, ANALOG)>, /* LCD_DE */
+						 <STM32_PINMUX('I', 15, ANALOG)>, /* LCD_R0 */
+						 <STM32_PINMUX('J',  0, ANALOG)>, /* LCD_R1 */
+						 <STM32_PINMUX('J',  1, ANALOG)>, /* LCD_R2 */
+						 <STM32_PINMUX('J',  2, ANALOG)>, /* LCD_R3 */
+						 <STM32_PINMUX('J',  3, ANALOG)>, /* LCD_R4 */
+						 <STM32_PINMUX('J',  4, ANALOG)>, /* LCD_R5 */
+						 <STM32_PINMUX('J',  5, ANALOG)>, /* LCD_R6 */
+						 <STM32_PINMUX('J',  6, ANALOG)>, /* LCD_R7 */
+						 <STM32_PINMUX('J',  7, ANALOG)>, /* LCD_G0 */
+						 <STM32_PINMUX('J',  8, ANALOG)>, /* LCD_G1 */
+						 <STM32_PINMUX('J',  9, ANALOG)>, /* LCD_G2 */
+						 <STM32_PINMUX('J', 10, ANALOG)>, /* LCD_G3 */
+						 <STM32_PINMUX('J', 11, ANALOG)>, /* LCD_G4 */
+						 <STM32_PINMUX('K',  0, ANALOG)>, /* LCD_G5 */
+						 <STM32_PINMUX('K',  1, ANALOG)>, /* LCD_G6 */
+						 <STM32_PINMUX('K',  2, ANALOG)>, /* LCD_G7 */
+						 <STM32_PINMUX('J', 12, ANALOG)>, /* LCD_B0 */
+						 <STM32_PINMUX('J', 13, ANALOG)>, /* LCD_B1 */
+						 <STM32_PINMUX('J', 14, ANALOG)>, /* LCD_B2 */
+						 <STM32_PINMUX('J', 15, ANALOG)>, /* LCD_B3 */
+						 <STM32_PINMUX('K',  3, ANALOG)>, /* LCD_B4 */
+						 <STM32_PINMUX('K',  4, ANALOG)>, /* LCD_B5 */
+						 <STM32_PINMUX('K',  5, ANALOG)>, /* LCD_B6 */
+						 <STM32_PINMUX('K',  6, ANALOG)>; /* LCD_B7 */
+				};
+			};
+
 			m_can1_pins_a: m-can1-0 {
 				pins1 {
 					pinmux = <STM32_PINMUX('H', 13, AF9)>; /* CAN1_TX */
-- 
2.7.4
