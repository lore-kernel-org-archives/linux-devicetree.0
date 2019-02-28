From: Hugues Fruchet <hugues.fruchet@st.com>
Subject: [PATCH 3/4] ARM: dts: stm32: add DCMI pins to stm32mp157c
Date: Thu, 28 Feb 2019 15:25:44 +0100
Message-ID: <1551363945-19497-4-git-send-email-hugues.fruchet@st.com>
References: <1551363945-19497-1-git-send-email-hugues.fruchet@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1551363945-19497-1-git-send-email-hugues.fruchet@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Torgue <alexandre.torgue@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
List-Id: devicetree@vger.kernel.org

Add DCMI pins to stm32mp157c.

Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
---
 arch/arm/boot/dts/stm32mp157-pinctrl.dtsi | 41 +++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
index 6b3a9c6..b299afc 100644
--- a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
@@ -414,6 +414,47 @@
 					bias-disable;
 				};
 			};
+
+			dcmi_pins_a: dcmi-0 {
+				pins {
+					pinmux = <STM32_PINMUX('H', 8,  AF13)>,/* DCMI_HSYNC */
+						 <STM32_PINMUX('B', 7,  AF13)>,/* DCMI_VSYNC */
+						 <STM32_PINMUX('A', 6,  AF13)>,/* DCMI_PIXCLK */
+						 <STM32_PINMUX('H', 9,  AF13)>,/* DCMI_D0 */
+						 <STM32_PINMUX('H', 10, AF13)>,/* DCMI_D1 */
+						 <STM32_PINMUX('H', 11, AF13)>,/* DCMI_D2 */
+						 <STM32_PINMUX('H', 12, AF13)>,/* DCMI_D3 */
+						 <STM32_PINMUX('H', 14, AF13)>,/* DCMI_D4 */
+						 <STM32_PINMUX('I', 4,  AF13)>,/* DCMI_D5 */
+						 <STM32_PINMUX('B', 8,  AF13)>,/* DCMI_D6 */
+						 <STM32_PINMUX('E', 6,  AF13)>,/* DCMI_D7 */
+						 <STM32_PINMUX('I', 1,  AF13)>,/* DCMI_D8 */
+						 <STM32_PINMUX('H', 7,  AF13)>,/* DCMI_D9 */
+						 <STM32_PINMUX('I', 3,  AF13)>,/* DCMI_D10 */
+						 <STM32_PINMUX('H', 15, AF13)>;/* DCMI_D11 */
+					bias-disable;
+				};
+			};
+
+			dcmi_sleep_pins_a: dcmi-sleep-0 {
+				pins {
+					pinmux = <STM32_PINMUX('H', 8,  ANALOG)>,/* DCMI_HSYNC */
+						 <STM32_PINMUX('B', 7,  ANALOG)>,/* DCMI_VSYNC */
+						 <STM32_PINMUX('A', 6,  ANALOG)>,/* DCMI_PIXCLK */
+						 <STM32_PINMUX('H', 9,  ANALOG)>,/* DCMI_D0 */
+						 <STM32_PINMUX('H', 10, ANALOG)>,/* DCMI_D1 */
+						 <STM32_PINMUX('H', 11, ANALOG)>,/* DCMI_D2 */
+						 <STM32_PINMUX('H', 12, ANALOG)>,/* DCMI_D3 */
+						 <STM32_PINMUX('H', 14, ANALOG)>,/* DCMI_D4 */
+						 <STM32_PINMUX('I', 4,  ANALOG)>,/* DCMI_D5 */
+						 <STM32_PINMUX('B', 8,  ANALOG)>,/* DCMI_D6 */
+						 <STM32_PINMUX('E', 6,  ANALOG)>,/* DCMI_D7 */
+						 <STM32_PINMUX('I', 1,  ANALOG)>,/* DCMI_D8 */
+						 <STM32_PINMUX('H', 7,  ANALOG)>,/* DCMI_D9 */
+						 <STM32_PINMUX('I', 3,  ANALOG)>,/* DCMI_D10 */
+						 <STM32_PINMUX('H', 15, ANALOG)>;/* DCMI_D11 */
+				};
+			};
 		};
 
 		pinctrl_z: pin-controller-z@54004000 {
-- 
2.7.4
