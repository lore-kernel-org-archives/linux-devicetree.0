From: Valentin Sitdikov <valentin_sitdikov@mentor.com>
Subject: [PATCH 1/2] dt-bindings: mfd: Add DT bindings documentation for the max7360 mfd driver
Date: Tue, 13 Jun 2017 15:20:50 +0300
Message-ID: <20170613122051.6061-2-valentin_sitdikov@mentor.com>
References: <20170613122051.6061-1-valentin_sitdikov@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170613122051.6061-1-valentin_sitdikov@mentor.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Valentin Sitdikov <valentin_sitdikov@mentor.com>, Andrei Dranitca <Andrei_Dranitca@mentor.com>
List-Id: devicetree@vger.kernel.org

This patch adds documentation for the max7360 bindings.
The max7360 is Multi-functional Device containing gpio,
keypad, pwm and rotary encoder submodules.

Signed-off-by: Andrei Dranitca <Andrei_Dranitca@mentor.com>
Signed-off-by: Valentin Sitdikov <valentin_sitdikov@mentor.com>
---
 Documentation/devicetree/bindings/mfd/max7360.txt | 74 +++++++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/max7360.txt

diff --git a/Documentation/devicetree/bindings/mfd/max7360.txt b/Documentation/devicetree/bindings/mfd/max7360.txt
new file mode 100644
index 0000000..c2ceaf9
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/max7360.txt
@@ -0,0 +1,74 @@
+* Maxim MAX7360 Multi-function Device
+
+The Maxim MAX7360 is a Multi-function Device which includes
+64 key switches, 8 LED drivers/GPIOs, PWM intensity control,
+and rotary switch control.
+
+Required properties:
+- compatible:	Should be the following: "maxim,max7360".
+- reg:		Specifies the I2C slave address of the max7360 block.
+		  It can be 0x38, 0x3a, 0x3c or 0x3e IIUC.
+
+Optional properties:
+- interrupt-parent:	Specifies the phandle of the interrupt controller to
+			  which the interrupts from MAX7360 are routed to.
+- interrupts:		List of IRQ lines specifiers.
+- interrupt-names:	List of "inti" and "intk".
+- interrupt-controller:	Identifies the device as an interrupt controller.
+- #interrupt-cells :	Number of cells to encode an interrupt source,
+			  shall be 1.
+
+Examples:
+
+Without subnodes:
+	max7360@38 {
+		compatible = "maxim,max7360";
+		reg = <0x38>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <23 IRQ_TYPE_LEVEL_LOW>, <23 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-names = "inti", "intk";
+		interrupt-controller;
+		#interrupt-cells = <0x1>;
+	};
+
+With subnodes:
+	max7360@38 {
+		compatible = "maxim,max7360";
+		reg = <0x38>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <23 IRQ_TYPE_LEVEL_LOW>, <23 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-names = "inti", "intk";
+		interrupt-controller;
+		#interrupt-cells = <0x1>;
+
+		gpio {
+			compatible = "maxim,max7360-gpio";
+			gpio-controller;
+			#gpio-cells = <0x2>;
+			interrupt-controller;
+			#interrupt-cells = <0x2>;
+			interrupts = <0>;
+		};
+
+		keypad {
+			compatible = "maxim,max7360-keypad";
+			maxim,debounce_reg = /bits/ 8 <0xef>;
+			maxim,ports_reg = /bits/ 8 <0xae>;
+			linux,keymap = < MATRIX_KEY(0, 0, KEY_F5)
+					 MATRIX_KEY(1, 0, KEY_F4) >;
+			keypad,num-rows = <2>;
+			keypad,num-columns = <1>;
+			interrupts = <1>;
+		};
+
+		pwm {
+			compatible = "maxim,max7360-pwm";
+			#pwm-cells = <0x2>;
+		};
+
+		rotary-encoder {
+			compatible = "maxim,max7360-rotary";
+			interrupts = <2>;
+		};
+
+	};
-- 
2.9.3
