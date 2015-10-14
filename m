From: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: [PATCH 3/7] Documentation: dt-bindings: Document STM32 pinctrl driver
 DT bindings
Date: Wed, 14 Oct 2015 22:07:23 +0200
Message-ID: <1444853247-31114-4-git-send-email-mcoquelin.stm32@gmail.com>
References: <1444853247-31114-1-git-send-email-mcoquelin.stm32@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1444853247-31114-1-git-send-email-mcoquelin.stm32@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org
Cc: devicetree@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>, bruherrera@gmail.com, linux-kernel@vger.kernel.org, afaerber@suse.de, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Maxime Coquelin <mcoquelin.stm32@gmail.com>
---
 .../bindings/pinctrl/st,stm32-pinctrl.txt          | 113 +++++++++++++++++++++
 1 file changed, 113 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.txt

diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.txt
new file mode 100644
index 0000000..fe6df6b
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.txt
@@ -0,0 +1,113 @@
+* STM32 GPIO and Pin Mux/Config controller
+
+STMicroelectronics's STM32 MCUs intregrate a GPIO and Pin mux/config hardware
+controller. It controls the input/output settings on the available pins and
+also provides ability to multiplex and configure the output of various on-chip
+controllers onto these pads.
+
+Pin controller node:
+Required properies:
+ - compatible: value should be one of the following:
+   (a) "st,stm32f429-pinctrl"
+ - #address-cells: The value of this property must be 1
+ - #size-cells	: The value of this property must be 1
+ - ranges	: defines mapping between pin controller node (parent) to
+   gpio-bank node (children).
+ - pins-are-numbered: Specify the subnodes are using numbered pinmux to
+   specify pins.
+
+GPIO controller/bank node:
+Required properties:
+ - gpio-controller : Indicates this device is a GPIO controller
+ - #gpio-cells	  : Should be two.
+			The first cell is the pin number
+			The second one is the polarity:
+				- 0 for active high
+				- 1 for active low
+ - reg		  : The gpio address range, relative to the pinctrl range
+ - clocks	  : clock that drives this bank
+ - st,bank-name	  : Should be a name string for this bank as specified in
+   the datasheet
+
+Optional properties:
+ - reset:	  : Reference to the reset controller
+
+Example:
+#include <dt-bindings/pinctrl/stm32f429-pinfunc.h>
+...
+
+	pin-controller {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "st,stm32f429-pinctrl";
+		ranges = <0 0x40020000 0x3000>;
+		pins-are-numbered;
+
+		gpioa: gpio@40020000 {
+			gpio-controller;
+			#gpio-cells = <2>;
+			reg = <0x0 0x400>;
+			resets = <&reset_ahb1 0>;
+			st,bank-name = "GPIOA";
+		};
+		...
+		pin-functions nodes follow...
+	};
+
+Contents of function subnode node:
+----------------------------------
+Subnode format
+A pinctrl node should contain at least one subnode representing the
+pinctrl group available on the machine. Each subnode will list the
+pins it needs, and how they should be configured, with regard to muxer
+configuration, pullups, drive, output high/low and output speed.
+
+    node {
+	pinmux = <PIN_NUMBER_PINMUX>;
+	GENERIC_PINCONFIG;
+    };
+
+Required properties:
+- pinmux: integer array, represents gpio pin number and mux setting.
+    Supported pin number and mux varies for different SoCs, and are defined
+    as macros in dt-bindings/pinctrl/<soc>-pinfunc.h directly.
+
+Optional properties:
+- GENERIC_PINCONFIG: is the generic pinconfig options to use.
+  Available options are:
+   - bias-disable,
+   - bias-pull-down,
+   - bias-pull-up,
+   - drive-push-pull,
+   - drive-open-drain,
+   - output-low
+   - output-high
+   - slew-rate = <x>, with x being:
+       < 0 > : Low speed
+       < 1 > : Medium speed
+       < 2 > : Fast speed
+       < 3 > : High speed
+
+Example:
+
+pin-controller {
+...
+	usart1_pins_a: usart1@0 {
+		pins1 {
+			pinmux = <STM32F429_PA9_FUNC_USART1_TX>;
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins2 {
+			pinmux = <STM32F429_PA10_FUNC_USART1_RX>;
+			bias-disable;
+		};
+	};
+};
+
+&usart1 {
+	pinctrl-0 = <&usart1_pins_a>;
+	pinctrl-names = "default";
+	status = "okay";
+};
-- 
1.9.1
