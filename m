From: Olivier Moysan <olivier.moysan@st.com>
Subject: [Linux-stm32][PATCH 4/4] ARM: dts: stm32: add i2s pins muxing on stm32mp157
Date: Thu, 25 Apr 2019 16:10:40 +0200
Message-ID: <1556201440-5540-5-git-send-email-olivier.moysan@st.com>
References: <1556201440-5540-1-git-send-email-olivier.moysan@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1556201440-5540-1-git-send-email-olivier.moysan@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-stm32@st-md-mailman.stormreply.com, alexandre.torgue@st.com, robh@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, olivier.moysan@st.com
List-Id: devicetree@vger.kernel.org

Add I2S pins muxing to stm32mp157.

Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
---
 arch/arm/boot/dts/stm32mp157-pinctrl.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
index 6ea9b9ff45e7..e29bf7a2c18a 100644
--- a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
@@ -276,6 +276,25 @@
 				};
 			};
 
+			i2s2_pins_a: i2s2-0 {
+				pins {
+					pinmux = <STM32_PINMUX('I', 3, AF5)>, /* I2S2_SDO */
+						 <STM32_PINMUX('B', 9, AF5)>, /* I2S2_WS */
+						 <STM32_PINMUX('A', 9, AF5)>; /* I2S2_CK */
+					slew-rate = <1>;
+					drive-push-pull;
+					bias-disable;
+				};
+			};
+
+			i2s2_pins_sleep_a: i2s2-1 {
+				pins {
+					pinmux = <STM32_PINMUX('I', 3, ANALOG)>, /* I2S2_SDO */
+						 <STM32_PINMUX('B', 9, ANALOG)>, /* I2S2_WS */
+						 <STM32_PINMUX('A', 9, ANALOG)>; /* I2S2_CK */
+				};
+			};
+
 			ltdc_pins_a: ltdc-a-0 {
 				pins {
 					pinmux = <STM32_PINMUX('G',  7, AF14)>, /* LCD_CLK */
-- 
2.7.4
