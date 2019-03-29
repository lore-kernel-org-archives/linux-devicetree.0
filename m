From: Olivier Moysan <olivier.moysan@st.com>
Subject: [PATCH 2/2] ARM: dts: stm32: add spdfirx pins to stm32mp157c
Date: Fri, 29 Mar 2019 11:12:45 +0100
Message-ID: <1553854365-19866-3-git-send-email-olivier.moysan@st.com>
References: <1553854365-19866-1-git-send-email-olivier.moysan@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1553854365-19866-1-git-send-email-olivier.moysan@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-stm32@st-md-mailman.stormreply.com, alexandre.torgue@st.com, robh@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, olivier.moysan@st.com
List-Id: devicetree@vger.kernel.org

This patch adds spdifrx support on stm32mp157c eval board.

Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
---
 arch/arm/boot/dts/stm32mp157-pinctrl.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
index 9104896e6066..54c133094a8f 100644
--- a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
@@ -393,6 +393,19 @@
 				};
 			};
 
+			spdifrx_pins_a: spdifrx-0 {
+				pins {
+					pinmux = <STM32_PINMUX('G', 12, AF8)>; /* SPDIF_IN1 */
+					bias-disable;
+				};
+			};
+
+			spdifrx_sleep_pins_a: spdifrx-1 {
+				pins {
+					pinmux = <STM32_PINMUX('G', 12, ANALOG)>; /* SPDIF_IN1 */
+				};
+			};
+
 			uart4_pins_a: uart4-0 {
 				pins1 {
 					pinmux = <STM32_PINMUX('G', 11, AF6)>; /* UART4_TX */
-- 
2.7.4
