From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Subject: [PATCH linux v3 1/1] Documentation: dt-bindings: Document bindings for ASPEED AST2400/AST2500 PWM and Fan tach controller device driver
Date: Mon, 13 Feb 2017 22:19:35 -0800
Message-ID: <20170214061935.17827-2-jaghu@google.com>
References: <20170214061935.17827-1-jaghu@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170214061935.17827-1-jaghu@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: joel@jms.id.au, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
List-Id: devicetree@vger.kernel.org

This binding provides interface for adding values related to ASPEED
AST2400/2500 PWM and Fan tach controller support.
The PWM controller can support upto 8 PWM output ports.
The Fan tach controller can support upto 16 tachometer inputs.

Signed-off-by: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
---
v3:
 Made the structure more common

 .../devicetree/bindings/hwmon/aspeed-pwm-tacho.txt | 73 ++++++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt

diff --git a/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt b/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
new file mode 100644
index 000000000000..c2de3709e554
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
@@ -0,0 +1,73 @@
+ASPEED AST2400/AST2500 PWM and Fan Tacho controller device driver
+
+The ASPEED PWM controller can support upto 8 PWM outputs. The ASPEED Fan Tacho
+controller can support upto 16 Fan tachometer inputs.
+
+There can be upto 8 fans supported. Each fan can have one PWM output and
+one/two Fan tach inputs.
+
+Required properties for pwm-tacho node:
+- #address-cells : should be 1.
+
+- #size-cells : should be 1.
+
+- reg : address and length of the register set for the device.
+
+- pinctrl-names : a pinctrl state named "default" must be defined.
+
+- pinctrl-0 : phandle referencing pin configuration of the PWM ports.
+
+- compatible : should be "aspeed,aspeed2400-pwm-tacho" for AST2400 or
+	       "aspeed,aspeed2500-pwm-tacho" for AST2500.
+
+- clocks : a fixed clock providing input clock frequency(PWM
+	   and Fan Tach clock)
+
+fan subnode format:
+========================
+Under fan subnode there can upto 8 child nodes, with each child node
+representing a fan. If there are 8 fans each fan can have one PWM port and
+one/two Fan tach inputs.
+
+Required properties for each child node(starting from PWM A through PWM H):
+- pwm-port : should specify PWM source port.
+	     integer value in the range 0 to 7 with 0 indicating PWM port
+	     A and 7 indicating PWM port H.
+
+- fan-ctrl-gpios : should specify the tachometer input GPIO pin on the hardware.
+		   Fan Tachometer function can only work when GPIO is in
+		   ”input mode”.
+
+- fan-tach-ch : should specify the Fan tach input channel.
+	        integer value in the range 0 through 15, with 0 indicating
+		Fan tach channel 0 and 15 indicating Fan tach channel 15.
+
+Examples:
+
+pwm-tacho-fixed-clk: fixedclk {
+	compatible = "fixed-clock";
+	#clock-cells = <0>;
+	clock-frequency = <24000000>;
+}
+
+pwm-tacho: pwm-tacho-controller@1e786000 {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	reg = <0x1E786000 0x1000>;
+	compatible = "aspeed,aspeed2500-pwm-tacho";
+	clocks = <&pwm-tacho-fixed-clk>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm0_default &pinctrl_pwm1_default>;
+
+	fan0 {
+		pwm-port = /bits/ 8 <0x00>;
+		fan-ctrl-gpios = <&gpio ASPEED_GPIO(O, 0) GPIO_ACTIVE_HIGH>;
+		fan-tach-ch = /bits/ 8 <0x00>;
+	};
+
+	fan1 {
+		pwm-port = /bits/ 8 <0x01>;
+		fan-ctrl-gpios = <&gpio ASPEED_GPIO(O, 1) GPIO_ACTIVE_HIGH>;
+		fan-tach-ch = /bits/ 8 <0x01>;
+	};
+};
--
2.11.0.483.g087da7b7c-goog
