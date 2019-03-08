From: Ludovic Barre <ludovic.Barre@st.com>
Subject: [PATCH  1/2] ARM: dts: stm32: add pinctrl sleep config for qspi on stm32mp157c-ev1
Date: Fri, 8 Mar 2019 16:10:22 +0100
Message-ID: <1552057823-10876-2-git-send-email-ludovic.Barre@st.com>
References: <1552057823-10876-1-git-send-email-ludovic.Barre@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1552057823-10876-1-git-send-email-ludovic.Barre@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, Ludovic Barre <ludovic.barre@st.com>
List-Id: devicetree@vger.kernel.org

From: Ludovic Barre <ludovic.barre@st.com>

This patch adds pinctrl sleep config for qspi on stm32mp157c-ev1

Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
---
 arch/arm/boot/dts/stm32mp157-pinctrl.dtsi | 26 ++++++++++++++++++++++++++
 arch/arm/boot/dts/stm32mp157c-ev1.dts     |  3 ++-
 2 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
index 9ec4694..5520f65 100644
--- a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
@@ -289,6 +289,12 @@
 				};
 			};
 
+			qspi_clk_sleep_pins_a: qspi-clk-sleep-0 {
+				pins {
+					pinmux = <STM32_PINMUX('F', 10, ANALOG)>; /* QSPI_CLK */
+				};
+			};
+
 			qspi_bk1_pins_a: qspi-bk1-0 {
 				pins1 {
 					pinmux = <STM32_PINMUX('F', 8, AF10)>, /* QSPI_BK1_IO0 */
@@ -307,6 +313,16 @@
 				};
 			};
 
+			qspi_bk1_sleep_pins_a: qspi-bk1-sleep-0 {
+				pins {
+					pinmux = <STM32_PINMUX('F', 8, ANALOG)>, /* QSPI_BK1_IO0 */
+						 <STM32_PINMUX('F', 9, ANALOG)>, /* QSPI_BK1_IO1 */
+						 <STM32_PINMUX('F', 7, ANALOG)>, /* QSPI_BK1_IO2 */
+						 <STM32_PINMUX('F', 6, ANALOG)>, /* QSPI_BK1_IO3 */
+						 <STM32_PINMUX('B', 6, ANALOG)>; /* QSPI_BK1_NCS */
+				};
+			};
+
 			qspi_bk2_pins_a: qspi-bk2-0 {
 				pins1 {
 					pinmux = <STM32_PINMUX('H', 2, AF9)>, /* QSPI_BK2_IO0 */
@@ -325,6 +341,16 @@
 				};
 			};
 
+			qspi_bk2_sleep_pins_a: qspi-bk2-sleep-0 {
+				pins {
+					pinmux = <STM32_PINMUX('H', 2, ANALOG)>, /* QSPI_BK2_IO0 */
+						 <STM32_PINMUX('H', 3, ANALOG)>, /* QSPI_BK2_IO1 */
+						 <STM32_PINMUX('G', 10, ANALOG)>, /* QSPI_BK2_IO2 */
+						 <STM32_PINMUX('G', 7, ANALOG)>, /* QSPI_BK2_IO3 */
+						 <STM32_PINMUX('C', 0, ANALOG)>; /* QSPI_BK2_NCS */
+				};
+			};
+
 			uart4_pins_a: uart4-0 {
 				pins1 {
 					pinmux = <STM32_PINMUX('G', 11, AF6)>; /* UART4_TX */
diff --git a/arch/arm/boot/dts/stm32mp157c-ev1.dts b/arch/arm/boot/dts/stm32mp157c-ev1.dts
index b6aca40..7fef155 100644
--- a/arch/arm/boot/dts/stm32mp157c-ev1.dts
+++ b/arch/arm/boot/dts/stm32mp157c-ev1.dts
@@ -131,8 +131,9 @@
 };
 
 &qspi {
-	pinctrl-names = "default";
+	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&qspi_clk_pins_a &qspi_bk1_pins_a &qspi_bk2_pins_a>;
+	pinctrl-1 = <&qspi_clk_sleep_pins_a &qspi_bk1_sleep_pins_a &qspi_bk2_sleep_pins_a>;
 	reg = <0x58003000 0x1000>, <0x70000000 0x4000000>;
 	#address-cells = <1>;
 	#size-cells = <0>;
-- 
2.7.4
