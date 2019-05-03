From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 2/3] ARM: dts: stm32mp157: Add missing pinctrl definitions
Date: Fri,  3 May 2019 11:01:22 +0530
Message-ID: <20190503053123.6828-3-manivannan.sadhasivam@linaro.org>
References: <20190503053123.6828-1-manivannan.sadhasivam@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190503053123.6828-1-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, robh+dt@kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, loic.pallardy@st.com, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: devicetree@vger.kernel.org

Add missing pinctrl definitions for STM32MP157 MPU.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm/boot/dts/stm32mp157-pinctrl.dtsi | 62 +++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
index 85c417d9983b..0b5bcf6a7c97 100644
--- a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
@@ -241,6 +241,23 @@
 				};
 			};
 
+			i2c1_pins_b: i2c1-2 {
+				pins {
+					pinmux = <STM32_PINMUX('F', 14, AF5)>, /* I2C1_SCL */
+						 <STM32_PINMUX('F', 15, AF5)>; /* I2C1_SDA */
+					bias-disable;
+					drive-open-drain;
+					slew-rate = <0>;
+				};
+			};
+
+			i2c1_pins_sleep_b: i2c1-3 {
+				pins {
+					pinmux = <STM32_PINMUX('F', 14, ANALOG)>, /* I2C1_SCL */
+						 <STM32_PINMUX('F', 15, ANALOG)>; /* I2C1_SDA */
+				};
+			};
+
 			i2c2_pins_a: i2c2-0 {
 				pins {
 					pinmux = <STM32_PINMUX('H', 4, AF4)>, /* I2C2_SCL */
@@ -258,6 +275,23 @@
 				};
 			};
 
+			i2c2_pins_b: i2c2-2 {
+				pins {
+					pinmux = <STM32_PINMUX('Z', 0, AF3)>, /* I2C2_SCL */
+						 <STM32_PINMUX('H', 5, AF4)>; /* I2C2_SDA */
+					bias-disable;
+					drive-open-drain;
+					slew-rate = <0>;
+				};
+			};
+
+			i2c2_pins_sleep_b: i2c2-3 {
+				pins {
+					pinmux = <STM32_PINMUX('Z', 0, ANALOG)>, /* I2C2_SCL */
+						 <STM32_PINMUX('H', 5, ANALOG)>; /* I2C2_SDA */
+				};
+			};
+
 			i2c5_pins_a: i2c5-0 {
 				pins {
 					pinmux = <STM32_PINMUX('A', 11, AF4)>, /* I2C5_SCL */
@@ -599,6 +633,34 @@
 					bias-disable;
 				};
 			};
+
+			uart4_pins_b: uart4-1 {
+				pins1 {
+					pinmux = <STM32_PINMUX('D', 1, AF8)>; /* UART4_TX */
+					bias-disable;
+					drive-push-pull;
+					slew-rate = <0>;
+				};
+				pins2 {
+					pinmux = <STM32_PINMUX('B', 2, AF8)>; /* UART4_RX */
+					bias-disable;
+				};
+			};
+
+			uart7_pins_a: uart7-0 {
+				pins1 {
+					pinmux = <STM32_PINMUX('E', 8, AF7)>; /* UART4_TX */
+					bias-disable;
+					drive-push-pull;
+					slew-rate = <0>;
+				};
+				pins2 {
+					pinmux = <STM32_PINMUX('E', 7, AF7)>, /* UART4_RX */
+						 <STM32_PINMUX('E', 10, AF7)>, /* UART4_CTS */
+						 <STM32_PINMUX('E', 9, AF7)>; /* UART4_RTS */
+					bias-disable;
+				};
+			};
 		};
 
 		pinctrl_z: pin-controller-z@54004000 {
-- 
2.17.1
