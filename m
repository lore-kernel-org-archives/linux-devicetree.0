From: Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: [PATCH 2/3] ARM: dts: stm32: add ADC pins used on stm32mp157a-dk1
Date: Fri, 13 Sep 2019 16:34:39 +0200
Message-ID: <1568385280-2633-3-git-send-email-fabrice.gasnier@st.com>
References: <1568385280-2633-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1568385280-2633-1-git-send-email-fabrice.gasnier@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: alexandre.torgue@st.com
Cc: robh+dt@kernel.org, mcoquelin.stm32@gmail.com, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, fabrice.gasnier@st.com
List-Id: devicetree@vger.kernel.org

Define pins that can be used for ADC on stm32mp157a-dk1 board:
- AIN connector has ADC input pins
- USB Type-C CC1 & CC2 pins (e.g. in18, in19)

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
---
 arch/arm/boot/dts/stm32mp157-pinctrl.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
index e4a0d51..eeb60d0 100644
--- a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
@@ -137,6 +137,22 @@
 				status = "disabled";
 			};
 
+			adc12_ain_pins_a: adc12-ain-0 {
+				pins {
+					pinmux = <STM32_PINMUX('C', 3, ANALOG)>, /* ADC1 in13 */
+						 <STM32_PINMUX('F', 12, ANALOG)>, /* ADC1 in6 */
+						 <STM32_PINMUX('F', 13, ANALOG)>, /* ADC2 in2 */
+						 <STM32_PINMUX('F', 14, ANALOG)>; /* ADC2 in6 */
+				};
+			};
+
+			adc12_usb_cc_pins_a: adc12-usb-cc-pins-0 {
+				pins {
+					pinmux = <STM32_PINMUX('A', 4, ANALOG)>, /* ADC12 in18 */
+						 <STM32_PINMUX('A', 5, ANALOG)>; /* ADC12 in19 */
+				};
+			};
+
 			cec_pins_a: cec-0 {
 				pins {
 					pinmux = <STM32_PINMUX('A', 15, AF4)>;
-- 
2.7.4
