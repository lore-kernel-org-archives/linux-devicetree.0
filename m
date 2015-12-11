From: "Andrew F. Davis" <afd@ti.com>
Subject: [PATCH 1/2] dt-bindings: GPIO: Add generic serializer binding
Date: Fri, 11 Dec 2015 13:46:23 -0600
Message-ID: <1449863184-29668-2-git-send-email-afd@ti.com>
References: <1449863184-29668-1-git-send-email-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1449863184-29668-1-git-send-email-afd@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, "Andrew F. Davis" <afd@ti.com>
List-Id: devicetree@vger.kernel.org

Add binding for generic parallel-in/serial-out shift register devices
used as GPIO.

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 .../devicetree/bindings/gpio/gpio-pisosr.txt       | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-pisosr.txt

diff --git a/Documentation/devicetree/bindings/gpio/gpio-pisosr.txt b/Documentation/devicetree/bindings/gpio/gpio-pisosr.txt
new file mode 100644
index 0000000..e69e8ec
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-pisosr.txt
@@ -0,0 +1,34 @@
+Generic Parallel-in/Serial-out Shift Register GPIO Driver
+
+This binding describes generic parallel-in/serial-out shift register
+devices that can be used for GPI (General Purpose Input). This includes
+SN74165 serial-out shift registers and the SN65HVS88x series of
+industrial serializers.
+
+Required properties:
+ - compatible		: Should be "pisosr-gpio".
+ - gpio-controller	: Marks the device node as a GPIO controller.
+ - #gpio-cells		: Should be two. For consumer use see gpio.txt.
+
+Optional properties:
+ - ngpios		: Number of GPIO lines, default is 8.
+ - load-gpios		: GPIO pin specifier attached to load enable, this
+			  pin is pulsed before reading from the device to
+			  load input pin values into the the device.
+
+For other required and optional properties of SPI slave
+nodes please refer to ../spi/spi-bus.txt.
+
+Example:
+
+	sn65hvs882@0 {
+		compatible = "pisosr-gpio";
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		load-gpios = <&gpio2 23 GPIO_ACTIVE_LOW>;
+
+		reg = <0>;
+		spi-max-frequency = <1000000>;
+		spi-cpol;
+	};
-- 
2.6.4
