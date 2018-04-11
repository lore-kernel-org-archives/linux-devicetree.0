From: Amelie Delaunay <amelie.delaunay@st.com>
Subject: [PATCH 1/5] dt-bindings: pinctrl: document the STMFX pinctrl bindings
Date: Wed, 11 Apr 2018 11:47:01 +0200
Message-ID: <1523440025-18077-2-git-send-email-amelie.delaunay@st.com>
References: <1523440025-18077-1-git-send-email-amelie.delaunay@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1523440025-18077-1-git-send-email-amelie.delaunay@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Alexandre Torgue <alexandre.torgue@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: devicetree@vger.kernel.org, Amelie Delaunay <amelie.delaunay@st.com>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch adds documentation of device tree bindings for the
STMicroelectronics Multi-Function eXpander (STMFX) GPIO expander.

Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
---
 .../devicetree/bindings/pinctrl/pinctrl-stmfx.txt  | 118 +++++++++++++++++++++
 1 file changed, 118 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-stmfx.txt

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-stmfx.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-stmfx.txt
new file mode 100644
index 0000000..4d8941de
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-stmfx.txt
@@ -0,0 +1,118 @@
+STMicroelectronics Multi-Function eXpander (STMFX) GPIO expander bindings
+
+ST Multi-Function eXpander (STMFX) is a slave controller using I2C for
+communication with the main MCU. It offers up to 24 GPIOs expansion.
+
+Required properties:
+- compatible: should be "st,stmfx-0300".
+- reg: I2C slave address of the device.
+- interrupt-parent: phandle of the STMFX parent interrupt controller.
+- interrutps: interrupt specifier triggered by MFX_IRQ_OUT signal.
+
+Optional property:
+- drive-open-drain: configure MFX_IRQ_OUT as open drain.
+- vdd-supply: phandle of the regulator supplying STMFX.
+
+Required properties for gpio controller sub-node:
+- #gpio-cells: should be <2>, the first cell is the GPIO number and the second
+  cell is the gpio flags in accordance with <dt-bindings/gpio/gpio.h>.
+- gpio-controller: marks the device as a GPIO controller.
+Please refer to ../gpio/gpio.txt.
+
+Optional properties for gpio controller sub-node:
+- #interrupt-cells: should be <2>, the first cell is the GPIO number and the
+  second cell is the interrupt flags in accordance with
+  <dt-bindings/interrupt-controller/irq.h>.
+- interrupt-controller: marks the device as an interrupt controller.
+
+Please refer to pinctrl-bindings.txt for pin configuration.
+
+Required properties for pin configuration sub-nodes:
+- pins: list of pins to which the configuration applies.
+
+Optional properties for pin configuration sub-nodes (pinconf-generic ones):
+- bias-disable: disable any bias on the pin.
+- bias-pull-up: the pin will be pulled up.
+- bias-pull-pin-default: use the pin-default pull state.
+- bias-pull-down: the pin will be pulled down.
+- drive-open-drain: the pin will be driven with open drain.
+- drive-push-pull: the pin will be driven actively high and low.
+- output-high: the pin will be configured as an output driving high level.
+- output-low: the pin will be configured as an output driving low level.
+
+Note that STMFX pins[15:0] are called "gpio[15:0]", and STMFX pins[23:16] are
+called "agpio[7:0]". Example, to refer to pin 18 of STMFX, use "agpio2".
+
+Example:
+
+	stmfxpinctrl: stmfx@42 {
+		compatible = "st,stmfx-0300";
+		reg = <0x42>;
+		interrupt-parent = <&gpioi>;
+		interrupts = <8 IRQ_TYPE_EDGE_RISING>;
+		vdd-supply = <&v3v3>;
+		status = "okay";
+
+		stmfxgpio: gpio {
+			#gpio-cells = <2>;
+			#interrupt-cells = <2>;
+			gpio-controller;
+			interrupt-controller;
+			status = "okay";
+		};
+
+		joystick_pins: joystick@0 {
+			pins = "gpio0", "gpio1", "gpio2", "gpio3", "gpio4";
+			drive-push-pull;
+			bias-pull-down;
+		};
+	};
+
+	joystick {
+		compatible = "gpio-keys";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		pinctrl-0 = <&joystick_pins>;
+		pinctrl-names = "default";
+		button@0 {
+			label = "JoySel";
+			linux,code = <KEY_ENTER>;
+			interrupt-parent = <&stmfxgpio>;
+			interrupts = <0 IRQ_TYPE_EDGE_RISING>;
+		};
+		button@1 {
+			label = "JoyDown";
+			linux,code = <KEY_DOWN>;
+			interrupt-parent = <&stmfxgpio>;
+			interrupts = <1 IRQ_TYPE_EDGE_RISING>;
+		};
+		button@2 {
+			label = "JoyLeft";
+			linux,code = <KEY_LEFT>;
+			interrupt-parent = <&stmfxgpio>;
+			interrupts = <2 IRQ_TYPE_EDGE_RISING>;
+		};
+		button@3 {
+			label = "JoyRight";
+			linux,code = <KEY_RIGHT>;
+			interrupt-parent = <&stmfxgpio>;
+			interrupts = <3 IRQ_TYPE_EDGE_RISING>;
+		};
+		button@4 {
+			label = "JoyUp";
+			linux,code = <KEY_UP>;
+			interrupt-parent = <&stmfxgpio>;
+			interrupts = <4 IRQ_TYPE_EDGE_RISING>;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		orange {
+			gpios = <&stmfxgpio 17 1>;
+		};
+
+		blue {
+			gpios = <&stmfxgpio 19 1>;
+		};
+	}
-- 
2.7.4
