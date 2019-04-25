From: Olivier Moysan <olivier.moysan@st.com>
Subject: [Linux-stm32][PATCH 2/4] ARM: dts: stm32: add sai pins muxing on stm32mp157
Date: Thu, 25 Apr 2019 16:10:38 +0200
Message-ID: <1556201440-5540-3-git-send-email-olivier.moysan@st.com>
References: <1556201440-5540-1-git-send-email-olivier.moysan@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1556201440-5540-1-git-send-email-olivier.moysan@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-stm32@st-md-mailman.stormreply.com, alexandre.torgue@st.com, robh@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, olivier.moysan@st.com
List-Id: devicetree@vger.kernel.org

Add SAI pins muxing to stm32mp157.

Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
---
 arch/arm/boot/dts/stm32mp157-pinctrl.dtsi | 73 +++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
index 85c417d9983b..6ea9b9ff45e7 100644
--- a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
@@ -506,6 +506,79 @@
 				};
 			};
 
+			sai2a_pins_a: sai2a-0 {
+				pins {
+					pinmux = <STM32_PINMUX('I', 5, AF10)>, /* SAI2_SCK_A */
+						 <STM32_PINMUX('I', 6, AF10)>, /* SAI2_SD_A */
+						 <STM32_PINMUX('I', 7, AF10)>, /* SAI2_FS_A */
+						 <STM32_PINMUX('E', 0, AF10)>; /* SAI2_MCLK_A */
+					slew-rate = <0>;
+					drive-push-pull;
+					bias-disable;
+				};
+			};
+
+			sai2a_sleep_pins_a: sai2a-1 {
+				pins {
+					pinmux = <STM32_PINMUX('I', 5, ANALOG)>, /* SAI2_SCK_A */
+						 <STM32_PINMUX('I', 6, ANALOG)>, /* SAI2_SD_A */
+						 <STM32_PINMUX('I', 7, ANALOG)>, /* SAI2_FS_A */
+						 <STM32_PINMUX('E', 0, ANALOG)>; /* SAI2_MCLK_A */
+				};
+			};
+
+			sai2b_pins_a: sai2b-0 {
+				pins1 {
+					pinmux = <STM32_PINMUX('E', 12, AF10)>, /* SAI2_SCK_B */
+						 <STM32_PINMUX('E', 13, AF10)>, /* SAI2_FS_B */
+						 <STM32_PINMUX('E', 14, AF10)>; /* SAI2_MCLK_B */
+					slew-rate = <0>;
+					drive-push-pull;
+					bias-disable;
+				};
+				pins2 {
+					pinmux = <STM32_PINMUX('F', 11, AF10)>; /* SAI2_SD_B */
+					bias-disable;
+				};
+			};
+
+			sai2b_sleep_pins_a: sai2b-1 {
+				pins {
+					pinmux = <STM32_PINMUX('F', 11, ANALOG)>, /* SAI2_SD_B */
+						 <STM32_PINMUX('E', 12, ANALOG)>, /* SAI2_SCK_B */
+						 <STM32_PINMUX('E', 13, ANALOG)>, /* SAI2_FS_B */
+						 <STM32_PINMUX('E', 14, ANALOG)>; /* SAI2_MCLK_B */
+				};
+			};
+
+			sai2b_pins_b: sai2b-2 {
+				pins {
+					pinmux = <STM32_PINMUX('F', 11, AF10)>; /* SAI2_SD_B */
+					bias-disable;
+				};
+			};
+
+			sai2b_sleep_pins_b: sai2b-3 {
+				pins {
+					pinmux = <STM32_PINMUX('F', 11, ANALOG)>; /* SAI2_SD_B */
+				};
+			};
+
+			sai4a_pins_a: sai4a-0 {
+				pins {
+					pinmux = <STM32_PINMUX('B', 5, AF10)>; /* SAI4_SD_A */
+					slew-rate = <0>;
+					drive-push-pull;
+					bias-disable;
+				};
+			};
+
+			sai4a_sleep_pins_a: sai4a-1 {
+				pins {
+					pinmux = <STM32_PINMUX('B', 5, ANALOG)>; /* SAI4_SD_A */
+				};
+			};
+
 			sdmmc1_b4_pins_a: sdmmc1-b4-0 {
 				pins {
 					pinmux = <STM32_PINMUX('C', 8, AF12)>, /* SDMMC1_D0 */
-- 
2.7.4
