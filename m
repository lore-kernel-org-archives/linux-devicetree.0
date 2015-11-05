From: Moritz Fischer <moritz.fischer@ettus.com>
Subject: [RFC 1/3] Documentation: dt: Add devicetree bindings for NI USRP E3xx pinconf
Date: Thu,  5 Nov 2015 15:41:21 -0800
Message-ID: <1446766883-25703-2-git-send-email-moritz.fischer@ettus.com>
References: <1446766883-25703-1-git-send-email-moritz.fischer@ettus.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1446766883-25703-1-git-send-email-moritz.fischer@ettus.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, Moritz Fischer <moritz.fischer@ettus.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
---
 .../devicetree/bindings/pinctrl/pinctrl-e3xx.txt   | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-e3xx.txt

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-e3xx.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-e3xx.txt
new file mode 100644
index 0000000..2bfbd21
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-e3xx.txt
@@ -0,0 +1,27 @@
+USRP E3xx Pincontrol bindings
+
+The pins of the NI Ettus Research USRP E3xx idle image can be configured for different
+daughterboard configurations. This pinmux is implemented in an FPGA as soft core.
+
+Required properties:
+- compatible: Must be one of the following:
+  - "ettus,pinctrl-e3xx-1.0"
+- clocks: The clock driving the pinmux
+
+Example:
+
+	e3xx_pinctrl: e3xx-pinctrl@40200a00 {
+		compatible = "ettus,e3xx-pinctrl-1.0";
+		reg = <0x40200a00 0x1000>;
+		clocks = <&clkc 15>;
+
+		foo_state: pinconf {
+			conf {
+				pins = E31X_LED_RX1_RX;
+				output-low;
+			};
+		};
+	};
+
+Note: Constants that facilitate creation of devicetree files are available in
+      include/dt-bindings/pinctrl/pinctrl-e3xx.h
-- 
2.4.3
