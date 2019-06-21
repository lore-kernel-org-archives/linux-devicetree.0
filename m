From: Christophe Kerello <christophe.kerello@st.com>
Subject: [PATCH 2/4] ARM: dts: stm32: add FMC2 NAND controller pins muxing on stm32mp157c-ev1
Date: Fri, 21 Jun 2019 16:49:48 +0200
Message-ID: <1561128590-14621-3-git-send-email-christophe.kerello@st.com>
References: <1561128590-14621-1-git-send-email-christophe.kerello@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1561128590-14621-1-git-send-email-christophe.kerello@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, alexandre.torgue@st.com, linux@armlinux.org.uk, olof@lixom.net, arnd@arndb.de
Cc: mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Christophe Kerello <christophe.kerello@st.com>
List-Id: devicetree@vger.kernel.org

This patch adds FMC2 NAND controller pins muxing used on stm32mp157c-ev1.

Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
---
 arch/arm/boot/dts/stm32mp157-pinctrl.dtsi | 44 +++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
index df64701..c4f2b23 100644
--- a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
@@ -276,6 +276,50 @@
 				};
 			};
 
+			fmc_pins_a: fmc-0 {
+				pins1 {
+					pinmux = <STM32_PINMUX('D', 4, AF12)>, /* FMC_NOE */
+						 <STM32_PINMUX('D', 5, AF12)>, /* FMC_NWE */
+						 <STM32_PINMUX('D', 11, AF12)>, /* FMC_A16_FMC_CLE */
+						 <STM32_PINMUX('D', 12, AF12)>, /* FMC_A17_FMC_ALE */
+						 <STM32_PINMUX('D', 14, AF12)>, /* FMC_D0 */
+						 <STM32_PINMUX('D', 15, AF12)>, /* FMC_D1 */
+						 <STM32_PINMUX('D', 0, AF12)>, /* FMC_D2 */
+						 <STM32_PINMUX('D', 1, AF12)>, /* FMC_D3 */
+						 <STM32_PINMUX('E', 7, AF12)>, /* FMC_D4 */
+						 <STM32_PINMUX('E', 8, AF12)>, /* FMC_D5 */
+						 <STM32_PINMUX('E', 9, AF12)>, /* FMC_D6 */
+						 <STM32_PINMUX('E', 10, AF12)>, /* FMC_D7 */
+						 <STM32_PINMUX('G', 9, AF12)>; /* FMC_NE2_FMC_NCE */
+					bias-disable;
+					drive-push-pull;
+					slew-rate = <1>;
+				};
+				pins2 {
+					pinmux = <STM32_PINMUX('D', 6, AF12)>; /* FMC_NWAIT */
+					bias-pull-up;
+				};
+			};
+
+			fmc_sleep_pins_a: fmc-sleep-0 {
+				pins {
+					pinmux = <STM32_PINMUX('D', 4, ANALOG)>, /* FMC_NOE */
+						 <STM32_PINMUX('D', 5, ANALOG)>, /* FMC_NWE */
+						 <STM32_PINMUX('D', 11, ANALOG)>, /* FMC_A16_FMC_CLE */
+						 <STM32_PINMUX('D', 12, ANALOG)>, /* FMC_A17_FMC_ALE */
+						 <STM32_PINMUX('D', 14, ANALOG)>, /* FMC_D0 */
+						 <STM32_PINMUX('D', 15, ANALOG)>, /* FMC_D1 */
+						 <STM32_PINMUX('D', 0, ANALOG)>, /* FMC_D2 */
+						 <STM32_PINMUX('D', 1, ANALOG)>, /* FMC_D3 */
+						 <STM32_PINMUX('E', 7, ANALOG)>, /* FMC_D4 */
+						 <STM32_PINMUX('E', 8, ANALOG)>, /* FMC_D5 */
+						 <STM32_PINMUX('E', 9, ANALOG)>, /* FMC_D6 */
+						 <STM32_PINMUX('E', 10, ANALOG)>, /* FMC_D7 */
+						 <STM32_PINMUX('D', 6, ANALOG)>, /* FMC_NWAIT */
+						 <STM32_PINMUX('G', 9, ANALOG)>; /* FMC_NE2_FMC_NCE */
+				};
+			};
+
 			i2c1_pins_a: i2c1-0 {
 				pins {
 					pinmux = <STM32_PINMUX('D', 12, AF5)>, /* I2C1_SCL */
-- 
1.9.1
