From: Amelie Delaunay <amelie.delaunay@st.com>
Subject: [PATCH v4 9/9] ARM: dts: stm32: add joystick support on stm32mp157c-ev1
Date: Wed, 27 Feb 2019 10:34:54 +0100
Message-ID: <1551260094-32570-10-git-send-email-amelie.delaunay@st.com>
References: <1551260094-32570-1-git-send-email-amelie.delaunay@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1551260094-32570-1-git-send-email-amelie.delaunay@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexandre Torgue <alexandre.torgue@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, Amelie Delaunay <amelie.delaunay@st.com>
List-Id: devicetree@vger.kernel.org

The joystick (B1) on stm32mp157c-ev1 uses gpios on STMFX gpio expander.
These gpios need a pin configuration (push-pull and bias-pull-down),
described under stmfx_pinctrl node.

Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
---
 arch/arm/boot/dts/stm32mp157c-ev1.dts | 44 +++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp157c-ev1.dts b/arch/arm/boot/dts/stm32mp157c-ev1.dts
index 3a6f033..6d6b692 100644
--- a/arch/arm/boot/dts/stm32mp157c-ev1.dts
+++ b/arch/arm/boot/dts/stm32mp157c-ev1.dts
@@ -7,6 +7,7 @@
 
 #include "stm32mp157c-ed1.dts"
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
 
 / {
 	model = "STMicroelectronics STM32MP157C eval daughter on eval mother";
@@ -21,6 +22,43 @@
 		ethernet0 = &ethernet0;
 	};
 
+	joystick {
+		compatible = "gpio-keys";
+		#size-cells = <0>;
+		pinctrl-0 = <&joystick_pins>;
+		pinctrl-names = "default";
+		button-0 {
+			label = "JoySel";
+			linux,code = <KEY_ENTER>;
+			interrupt-parent = <&stmfx_pinctrl>;
+			interrupts = <0 IRQ_TYPE_EDGE_RISING>;
+		};
+		button-1 {
+			label = "JoyDown";
+			linux,code = <KEY_DOWN>;
+			interrupt-parent = <&stmfx_pinctrl>;
+			interrupts = <1 IRQ_TYPE_EDGE_RISING>;
+		};
+		button-2 {
+			label = "JoyLeft";
+			linux,code = <KEY_LEFT>;
+			interrupt-parent = <&stmfx_pinctrl>;
+			interrupts = <2 IRQ_TYPE_EDGE_RISING>;
+		};
+		button-3 {
+			label = "JoyRight";
+			linux,code = <KEY_RIGHT>;
+			interrupt-parent = <&stmfx_pinctrl>;
+			interrupts = <3 IRQ_TYPE_EDGE_RISING>;
+		};
+		button-4 {
+			label = "JoyUp";
+			linux,code = <KEY_UP>;
+			interrupt-parent = <&stmfx_pinctrl>;
+			interrupts = <4 IRQ_TYPE_EDGE_RISING>;
+		};
+	};
+
 	panel_backlight: panel-backlight {
 		compatible = "gpio-backlight";
 		gpios = <&gpiod 13 GPIO_ACTIVE_LOW>;
@@ -113,6 +151,12 @@
 			interrupt-controller;
 			#interrupt-cells = <2>;
 			gpio-ranges = <&stmfx_pinctrl 0 0 24>;
+
+			joystick_pins: joystick {
+				pins = "gpio0", "gpio1", "gpio2", "gpio3", "gpio4";
+				drive-push-pull;
+				bias-pull-down;
+			};
 		};
 	};
 };
-- 
2.7.4
