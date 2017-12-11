From: Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH 5/5] ARM: dts: stm32: use dedicated files for pinctrl on stm32f7 family
Date: Mon, 11 Dec 2017 09:54:35 +0100
Message-ID: <1512982475-32661-6-git-send-email-alexandre.torgue@st.com>
References: <1512982475-32661-2-git-send-email-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1512982475-32661-2-git-send-email-alexandre.torgue-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Currently, same stm32f746-pinctrl driver is used for stm32f746 and
stm32f769 MCU. As pin map is different between those 2 MCUs,
a stm32f769-pinctrl driver has been recently added.
This patch
 -allows to use stm32f769-pinctrl driver for stm32f769 boards
 -reworks stm32 devicetree files to fit with stm32f746 / stm32f769

Signed-off-by: Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>

diff --git a/arch/arm/boot/dts/stm32746g-eval.dts b/arch/arm/boot/dts/stm32746g-eval.dts
index 2d4e717..b2d4b8c 100644
--- a/arch/arm/boot/dts/stm32746g-eval.dts
+++ b/arch/arm/boot/dts/stm32746g-eval.dts
@@ -42,6 +42,7 @@
 
 /dts-v1/;
 #include "stm32f746.dtsi"
+#include "stm32f746-pinctrl.dtsi"
 #include <dt-bindings/input/input.h>
 
 / {
diff --git a/arch/arm/boot/dts/stm32f7-pinctrl.dtsi b/arch/arm/boot/dts/stm32f7-pinctrl.dtsi
new file mode 100644
index 0000000..4c66fa40
--- /dev/null
+++ b/arch/arm/boot/dts/stm32f7-pinctrl.dtsi
@@ -0,0 +1,227 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause) */
+/*
+ * Copyright (C) STMicroelectronics 2017 - All Rights Reserved
+ * Author: Alexandre Torgue  <alexandre.torgue-qxv4g6HH51o@public.gmane.org> for STMicroelectronics.
+ */
+
+#include <dt-bindings/pinctrl/stm32-pinfunc.h>
+#include <dt-bindings/mfd/stm32f7-rcc.h>
+
+/ {
+	soc {
+		pinctrl: pin-controller {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0x40020000 0x3000>;
+			interrupt-parent = <&exti>;
+			st,syscfg = <&syscfg 0x8>;
+			pins-are-numbered;
+
+			gpioa: gpio@40020000 {
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				reg = <0x0 0x400>;
+				clocks = <&rcc 0 STM32F7_AHB1_CLOCK(GPIOA)>;
+				st,bank-name = "GPIOA";
+			};
+
+			gpiob: gpio@40020400 {
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				reg = <0x400 0x400>;
+				clocks = <&rcc 0 STM32F7_AHB1_CLOCK(GPIOB)>;
+				st,bank-name = "GPIOB";
+			};
+
+			gpioc: gpio@40020800 {
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				reg = <0x800 0x400>;
+				clocks = <&rcc 0 STM32F7_AHB1_CLOCK(GPIOC)>;
+				st,bank-name = "GPIOC";
+			};
+
+			gpiod: gpio@40020c00 {
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				reg = <0xc00 0x400>;
+				clocks = <&rcc 0 STM32F7_AHB1_CLOCK(GPIOD)>;
+				st,bank-name = "GPIOD";
+			};
+
+			gpioe: gpio@40021000 {
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				reg = <0x1000 0x400>;
+				clocks = <&rcc 0 STM32F7_AHB1_CLOCK(GPIOE)>;
+				st,bank-name = "GPIOE";
+			};
+
+			gpiof: gpio@40021400 {
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				reg = <0x1400 0x400>;
+				clocks = <&rcc 0 STM32F7_AHB1_CLOCK(GPIOF)>;
+				st,bank-name = "GPIOF";
+			};
+
+			gpiog: gpio@40021800 {
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				reg = <0x1800 0x400>;
+				clocks = <&rcc 0 STM32F7_AHB1_CLOCK(GPIOG)>;
+				st,bank-name = "GPIOG";
+			};
+
+			gpioh: gpio@40021c00 {
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				reg = <0x1c00 0x400>;
+				clocks = <&rcc 0 STM32F7_AHB1_CLOCK(GPIOH)>;
+				st,bank-name = "GPIOH";
+			};
+
+			gpioi: gpio@40022000 {
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				reg = <0x2000 0x400>;
+				clocks = <&rcc 0 STM32F7_AHB1_CLOCK(GPIOI)>;
+				st,bank-name = "GPIOI";
+			};
+
+			gpioj: gpio@40022400 {
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				reg = <0x2400 0x400>;
+				clocks = <&rcc 0 STM32F7_AHB1_CLOCK(GPIOJ)>;
+				st,bank-name = "GPIOJ";
+			};
+
+			gpiok: gpio@40022800 {
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				reg = <0x2800 0x400>;
+				clocks = <&rcc 0 STM32F7_AHB1_CLOCK(GPIOK)>;
+				st,bank-name = "GPIOK";
+			};
+
+			cec_pins_a: cec@0 {
+				pins {
+					pinmux = <STM32_PINMUX('A', 15, AF4)>; /* HDMI CEC */
+					slew-rate = <0>;
+					drive-open-drain;
+					bias-disable;
+				};
+			};
+
+			usart1_pins_a: usart1@0 {
+				pins1 {
+					pinmux = <STM32_PINMUX('A', 9, AF7)>; /* USART1_TX */
+					bias-disable;
+					drive-push-pull;
+					slew-rate = <0>;
+				};
+				pins2 {
+					pinmux = <STM32_PINMUX('A', 10, AF7)>; /* USART1_RX */
+					bias-disable;
+				};
+			};
+
+			usart1_pins_b: usart1@1 {
+				pins1 {
+					pinmux = <STM32_PINMUX('A', 9, AF7)>; /* USART1_TX */
+					bias-disable;
+					drive-push-pull;
+					slew-rate = <0>;
+				};
+				pins2 {
+					pinmux = <STM32_PINMUX('B', 7, AF7)>; /* USART1_RX */
+					bias-disable;
+				};
+			};
+
+			i2c1_pins_b: i2c1@0 {
+				pins {
+					pinmux = <STM32_PINMUX('B', 9, AF4)>, /* I2C1 SDA */
+						 <STM32_PINMUX('B', 8, AF4)>; /* I2C1 SCL */
+					bias-disable;
+					drive-open-drain;
+					slew-rate = <0>;
+				};
+			};
+
+			usbotg_hs_pins_a: usbotg-hs@0 {
+				pins {
+					pinmux = <STM32_PINMUX('H', 4, AF10)>, /* OTG_HS_ULPI_NXT */
+						 <STM32_PINMUX('I', 11, AF10)>, /* OTG_HS_ULPI_DIR */
+						 <STM32_PINMUX('C', 0, AF10)>, /* OTG_HS_ULPI_STP */
+						 <STM32_PINMUX('A', 5, AF10)>, /* OTG_HS_ULPI_CK */
+						 <STM32_PINMUX('A', 3, AF10)>, /* OTG_HS_ULPI_D0 */
+						 <STM32_PINMUX('B', 0, AF10)>, /* OTG_HS_ULPI_D1 */
+						 <STM32_PINMUX('B', 1, AF10)>, /* OTG_HS_ULPI_D2 */
+						 <STM32_PINMUX('B', 10, AF10)>, /* OTG_HS_ULPI_D3 */
+						 <STM32_PINMUX('B', 11, AF10)>, /* OTG_HS_ULPI_D4 */
+						 <STM32_PINMUX('B', 12, AF10)>, /* OTG_HS_ULPI_D5 */
+						 <STM32_PINMUX('B', 13, AF10)>, /* OTG_HS_ULPI_D6 */
+						 <STM32_PINMUX('B', 5, AF10)>; /* OTG_HS_ULPI_D7 */
+					bias-disable;
+					drive-push-pull;
+					slew-rate = <2>;
+				};
+			};
+
+			usbotg_hs_pins_b: usbotg-hs@1 {
+				pins {
+					pinmux = <STM32_PINMUX('H', 4, AF10)>, /* OTG_HS_ULPI_NXT */
+						 <STM32_PINMUX('C', 2, AF10)>, /* OTG_HS_ULPI_DIR */
+						 <STM32_PINMUX('C', 0, AF10)>, /* OTG_HS_ULPI_STP */
+						 <STM32_PINMUX('A', 5, AF10)>, /* OTG_HS_ULPI_CK */
+						 <STM32_PINMUX('A', 3, AF10)>, /* OTG_HS_ULPI_D0 */
+						 <STM32_PINMUX('B', 0, AF10)>, /* OTG_HS_ULPI_D1 */
+						 <STM32_PINMUX('B', 1, AF10)>, /* OTG_HS_ULPI_D2 */
+						 <STM32_PINMUX('B', 10, AF10)>, /* OTG_HS_ULPI_D3 */
+						 <STM32_PINMUX('B', 11, AF10)>, /* OTG_HS_ULPI_D4 */
+						 <STM32_PINMUX('B', 12, AF10)>, /* OTG_HS_ULPI_D5 */
+						 <STM32_PINMUX('B', 13, AF10)>, /* OTG_HS_ULPI_D6 */
+						 <STM32_PINMUX('B', 5, AF10)>; /* OTG_HS_ULPI_D7 */
+					bias-disable;
+					drive-push-pull;
+					slew-rate = <2>;
+				};
+			};
+
+			usbotg_fs_pins_a: usbotg-fs@0 {
+				pins {
+					pinmux = <STM32_PINMUX('A', 10, AF10)>, /* OTG_FS_ID */
+						 <STM32_PINMUX('A', 11, AF10)>, /* OTG_FS_DM */
+						 <STM32_PINMUX('A', 12, AF10)>; /* OTG_FS_DP */
+					bias-disable;
+					drive-push-pull;
+					slew-rate = <2>;
+				};
+			};
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/stm32f746-disco.dts b/arch/arm/boot/dts/stm32f746-disco.dts
index 4d85dba..623b6f2 100644
--- a/arch/arm/boot/dts/stm32f746-disco.dts
+++ b/arch/arm/boot/dts/stm32f746-disco.dts
@@ -42,6 +42,7 @@
 
 /dts-v1/;
 #include "stm32f746.dtsi"
+#include "stm32f746-pinctrl.dtsi"
 #include <dt-bindings/input/input.h>
 
 / {
diff --git a/arch/arm/boot/dts/stm32f746-pinctrl.dtsi b/arch/arm/boot/dts/stm32f746-pinctrl.dtsi
new file mode 100644
index 0000000..f0e6309
--- /dev/null
+++ b/arch/arm/boot/dts/stm32f746-pinctrl.dtsi
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause) */
+/*
+ * Copyright (C) STMicroelectronics 2017 - All Rights Reserved
+ * Author: Alexandre Torgue  <alexandre.torgue-qxv4g6HH51o@public.gmane.org> for STMicroelectronics.
+ */
+
+#include "stm32f7-pinctrl.dtsi"
+
+&pinctrl{
+	compatible = "st,stm32f746-pinctrl";
+};
diff --git a/arch/arm/boot/dts/stm32f746.dtsi b/arch/arm/boot/dts/stm32f746.dtsi
index 5f66d15..8fe96d6 100644
--- a/arch/arm/boot/dts/stm32f746.dtsi
+++ b/arch/arm/boot/dts/stm32f746.dtsi
@@ -42,7 +42,6 @@
 
 #include "skeleton.dtsi"
 #include "armv7-m.dtsi"
-#include <dt-bindings/pinctrl/stm32-pinfunc.h>
 #include <dt-bindings/clock/stm32fx-clock.h>
 #include <dt-bindings/mfd/stm32f7-rcc.h>
 
@@ -498,222 +497,6 @@
 			reg = <0x40007000 0x400>;
 		};
 
-		pin-controller {
-			#address-cells = <1>;
-			#size-cells = <1>;
-			compatible = "st,stm32f746-pinctrl";
-			ranges = <0 0x40020000 0x3000>;
-			interrupt-parent = <&exti>;
-			st,syscfg = <&syscfg 0x8>;
-			pins-are-numbered;
-
-			gpioa: gpio@40020000 {
-				gpio-controller;
-				#gpio-cells = <2>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-				reg = <0x0 0x400>;
-				clocks = <&rcc 0 STM32F7_AHB1_CLOCK(GPIOA)>;
-				st,bank-name = "GPIOA";
-			};
-
-			gpiob: gpio@40020400 {
-				gpio-controller;
-				#gpio-cells = <2>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-				reg = <0x400 0x400>;
-				clocks = <&rcc 0 STM32F7_AHB1_CLOCK(GPIOB)>;
-				st,bank-name = "GPIOB";
-			};
-
-			gpioc: gpio@40020800 {
-				gpio-controller;
-				#gpio-cells = <2>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-				reg = <0x800 0x400>;
-				clocks = <&rcc 0 STM32F7_AHB1_CLOCK(GPIOC)>;
-				st,bank-name = "GPIOC";
-			};
-
-			gpiod: gpio@40020c00 {
-				gpio-controller;
-				#gpio-cells = <2>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-				reg = <0xc00 0x400>;
-				clocks = <&rcc 0 STM32F7_AHB1_CLOCK(GPIOD)>;
-				st,bank-name = "GPIOD";
-			};
-
-			gpioe: gpio@40021000 {
-				gpio-controller;
-				#gpio-cells = <2>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-				reg = <0x1000 0x400>;
-				clocks = <&rcc 0 STM32F7_AHB1_CLOCK(GPIOE)>;
-				st,bank-name = "GPIOE";
-			};
-
-			gpiof: gpio@40021400 {
-				gpio-controller;
-				#gpio-cells = <2>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-				reg = <0x1400 0x400>;
-				clocks = <&rcc 0 STM32F7_AHB1_CLOCK(GPIOF)>;
-				st,bank-name = "GPIOF";
-			};
-
-			gpiog: gpio@40021800 {
-				gpio-controller;
-				#gpio-cells = <2>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-				reg = <0x1800 0x400>;
-				clocks = <&rcc 0 STM32F7_AHB1_CLOCK(GPIOG)>;
-				st,bank-name = "GPIOG";
-			};
-
-			gpioh: gpio@40021c00 {
-				gpio-controller;
-				#gpio-cells = <2>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-				reg = <0x1c00 0x400>;
-				clocks = <&rcc 0 STM32F7_AHB1_CLOCK(GPIOH)>;
-				st,bank-name = "GPIOH";
-			};
-
-			gpioi: gpio@40022000 {
-				gpio-controller;
-				#gpio-cells = <2>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-				reg = <0x2000 0x400>;
-				clocks = <&rcc 0 STM32F7_AHB1_CLOCK(GPIOI)>;
-				st,bank-name = "GPIOI";
-			};
-
-			gpioj: gpio@40022400 {
-				gpio-controller;
-				#gpio-cells = <2>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-				reg = <0x2400 0x400>;
-				clocks = <&rcc 0 STM32F7_AHB1_CLOCK(GPIOJ)>;
-				st,bank-name = "GPIOJ";
-			};
-
-			gpiok: gpio@40022800 {
-				gpio-controller;
-				#gpio-cells = <2>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-				reg = <0x2800 0x400>;
-				clocks = <&rcc 0 STM32F7_AHB1_CLOCK(GPIOK)>;
-				st,bank-name = "GPIOK";
-			};
-
-			cec_pins_a: cec@0 {
-				pins {
-					pinmux = <STM32_PINMUX('A', 15, AF4)>; /* HDMI CEC */
-					slew-rate = <0>;
-					drive-open-drain;
-					bias-disable;
-				};
-			};
-
-			usart1_pins_a: usart1@0 {
-				pins1 {
-					pinmux = <STM32_PINMUX('A', 9, AF7)>; /* USART1_TX */
-					bias-disable;
-					drive-push-pull;
-					slew-rate = <0>;
-				};
-				pins2 {
-					pinmux = <STM32_PINMUX('A', 10, AF7)>; /* USART1_RX */
-					bias-disable;
-				};
-			};
-
-			usart1_pins_b: usart1@1 {
-				pins1 {
-					pinmux = <STM32_PINMUX('A', 9, AF7)>; /* USART1_TX */
-					bias-disable;
-					drive-push-pull;
-					slew-rate = <0>;
-				};
-				pins2 {
-					pinmux = <STM32_PINMUX('B', 7, AF7)>; /* USART1_RX */
-					bias-disable;
-				};
-			};
-
-			i2c1_pins_b: i2c1@0 {
-				pins {
-					pinmux = <STM32_PINMUX('B', 9, AF4)>, /* I2C1 SDA */
-						 <STM32_PINMUX('B', 8, AF4)>; /* I2C1 SCL */
-					bias-disable;
-					drive-open-drain;
-					slew-rate = <0>;
-				};
-			};
-
-			usbotg_hs_pins_a: usbotg-hs@0 {
-				pins {
-					pinmux = <STM32_PINMUX('H', 4, AF10)>, /* OTG_HS_ULPI_NXT */
-						 <STM32_PINMUX('I', 11, AF10)>, /* OTG_HS_ULPI_DIR */
-						 <STM32_PINMUX('C', 0, AF10)>, /* OTG_HS_ULPI_STP */
-						 <STM32_PINMUX('A', 5, AF10)>, /* OTG_HS_ULPI_CK */
-						 <STM32_PINMUX('A', 3, AF10)>, /* OTG_HS_ULPI_D0 */
-						 <STM32_PINMUX('B', 0, AF10)>, /* OTG_HS_ULPI_D1 */
-						 <STM32_PINMUX('B', 1, AF10)>, /* OTG_HS_ULPI_D2 */
-						 <STM32_PINMUX('B', 10, AF10)>, /* OTG_HS_ULPI_D3 */
-						 <STM32_PINMUX('B', 11, AF10)>, /* OTG_HS_ULPI_D4 */
-						 <STM32_PINMUX('B', 12, AF10)>, /* OTG_HS_ULPI_D5 */
-						 <STM32_PINMUX('B', 13, AF10)>, /* OTG_HS_ULPI_D6 */
-						 <STM32_PINMUX('B', 5, AF10)>; /* OTG_HS_ULPI_D7 */
-					bias-disable;
-					drive-push-pull;
-					slew-rate = <2>;
-				};
-			};
-
-			usbotg_hs_pins_b: usbotg-hs@1 {
-				pins {
-					pinmux = <STM32_PINMUX('H', 4, AF10)>, /* OTG_HS_ULPI_NXT */
-						 <STM32_PINMUX('C', 2, AF10)>, /* OTG_HS_ULPI_DIR */
-						 <STM32_PINMUX('C', 0, AF10)>, /* OTG_HS_ULPI_STP */
-						 <STM32_PINMUX('A', 5, AF10)>, /* OTG_HS_ULPI_CK */
-						 <STM32_PINMUX('A', 3, AF10)>, /* OTG_HS_ULPI_D0 */
-						 <STM32_PINMUX('B', 0, AF10)>, /* OTG_HS_ULPI_D1 */
-						 <STM32_PINMUX('B', 1, AF10)>, /* OTG_HS_ULPI_D2 */
-						 <STM32_PINMUX('B', 10, AF10)>, /* OTG_HS_ULPI_D3 */
-						 <STM32_PINMUX('B', 11, AF10)>, /* OTG_HS_ULPI_D4 */
-						 <STM32_PINMUX('B', 12, AF10)>, /* OTG_HS_ULPI_D5 */
-						 <STM32_PINMUX('B', 13, AF10)>, /* OTG_HS_ULPI_D6 */
-						 <STM32_PINMUX('B', 5, AF10)>; /* OTG_HS_ULPI_D7 */
-					bias-disable;
-					drive-push-pull;
-					slew-rate = <2>;
-				};
-			};
-
-			usbotg_fs_pins_a: usbotg-fs@0 {
-				pins {
-					pinmux = <STM32_PINMUX('A', 10, AF10)>, /* OTG_FS_ID */
-						 <STM32_PINMUX('A', 11, AF10)>, /* OTG_FS_DM */
-						 <STM32_PINMUX('A', 12, AF10)>; /* OTG_FS_DP */
-					bias-disable;
-					drive-push-pull;
-					slew-rate = <2>;
-				};
-			};
-		};
-
 		crc: crc@40023000 {
 			compatible = "st,stm32f7-crc";
 			reg = <0x40023000 0x400>;
diff --git a/arch/arm/boot/dts/stm32f769-disco.dts b/arch/arm/boot/dts/stm32f769-disco.dts
index 4463ca1..9dba286 100644
--- a/arch/arm/boot/dts/stm32f769-disco.dts
+++ b/arch/arm/boot/dts/stm32f769-disco.dts
@@ -42,11 +42,12 @@
 
 /dts-v1/;
 #include "stm32f746.dtsi"
+#include "stm32f769-pinctrl.dtsi"
 #include <dt-bindings/input/input.h>
 
 / {
 	model = "STMicroelectronics STM32F769-DISCO board";
-	compatible = "st,stm32f769-disco", "st,stm32f7";
+	compatible = "st,stm32f769-disco", "st,stm32f769";
 
 	chosen {
 		bootargs = "root=/dev/ram";
diff --git a/arch/arm/boot/dts/stm32f769-pinctrl.dtsi b/arch/arm/boot/dts/stm32f769-pinctrl.dtsi
new file mode 100644
index 0000000..787da27
--- /dev/null
+++ b/arch/arm/boot/dts/stm32f769-pinctrl.dtsi
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause) */
+/*
+ * Copyright (C) STMicroelectronics 2017 - All Rights Reserved
+ * Author: Alexandre Torgue  <alexandre.torgue-qxv4g6HH51o@public.gmane.org> for STMicroelectronics.
+ */
+
+#include "stm32f7-pinctrl.dtsi"
+
+&pinctrl{
+	compatible = "st,stm32f769-pinctrl";
+};
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
