From: Hongwei Zhang <hongweiz@ami.com>
Subject: [PATCH 2/3 v2] dt-bindings: gpio: aspeed: Add SGPIO support
Date: Fri, 12 Jul 2019 16:14:00 -0400
Message-ID: <1562962440-15908-1-git-send-email-hongweiz@ami.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org
Cc: Hongwei Zhang <hongweiz@ami.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add bindings to support SGPIO on AST2400 or AST2500.

Signed-off-by: Hongwei Zhang <hongweiz@ami.com>
---
 .../devicetree/bindings/gpio/sgpio-aspeed.txt      | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100755 Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt

diff --git a/Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt b/Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt
new file mode 100755
index 0000000..3ae2b79
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt
@@ -0,0 +1,43 @@
+Aspeed SGPIO controller Device Tree Bindings
+-------------------------------------------
+
+Required properties:
+- compatible		: Either "aspeed,ast2400-sgpio" or "aspeed,ast2500-sgpio"
+
+- #gpio-cells 		: Should be two
+			  - First cell is the GPIO line number
+			  - Second cell is used to specify optional
+			    parameters (unused)
+
+- reg			: Address and length of the register set for the device
+- gpio-controller	: Marks the device node as a GPIO controller.
+- interrupts		: Interrupt specifier (see interrupt bindings for
+			  details)
+
+- interrupt-controller	: Mark the GPIO controller as an interrupt-controller
+
+- nr-gpios		: number of GPIO pins to serialise. (should be multiple of 8, up to 80 pins)
+			  if not specified, defaults to 80.
+
+- clocks               : A phandle to the APB clock for SGPM clock division
+
+- bus-frequency	: SGPM CLK frequency, if not specified defaults to 1 MHz
+
+
+The sgpio and interrupt properties are further described in their respective bindings documentation:
+
+- Documentation/devicetree/bindings/sgpio/gpio.txt
+- Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
+
+  Example:
+	sgpio@1e780200 {
+		#gpio-cells = <2>;
+		compatible = "aspeed,ast2500-sgpio";
+		gpio-controller;
+		interrupts = <40>;
+		reg = <0x1e780200 0x0100>;
+		clocks = <&syscon ASPEED_CLK_APB>;
+		interrupt-controller;
+		nr-gpios = <80>;
+		bus-frequency = <1000000>;
+	};
-- 
2.7.4
