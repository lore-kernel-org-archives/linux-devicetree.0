From: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: [PATCH v1 1/1] gpio: of: provide option generic property for initial line states
Date: Fri,  9 Jun 2017 16:16:22 +0200
Message-ID: <20170609141622.21502-1-o.rempel@pengutronix.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: kernel@pengutronix.de, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, barebox@lists.infradead.org
Cc: Oleksij Rempel <o.rempel@pengutronix.de>
List-Id: devicetree@vger.kernel.org

This property is needed for barebox or may be other bootloaders
to set proper gpio configuration as early as possible.

This example is mainly based on "lines-initial-states" property
from this binding documentation:
Documentation/devicetree/bindings/gpio/gpio-pcf857x.txt

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 Documentation/devicetree/bindings/gpio/gpio.txt | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentation/devicetree/bindings/gpio/gpio.txt
index 84ede036f73d..60f8e8d8ab32 100644
--- a/Documentation/devicetree/bindings/gpio/gpio.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio.txt
@@ -181,6 +181,26 @@ gpio-controller@00000000 {
 		"poweroff", "reset";
 }
 
+Optionally, a GPIO controller may have a "gpio-lines-initial-states" property.
+This is an array of values that specifies the initial state of each line. When
+a value is set to one, the corresponding line will be initialized to the input
+(pulled-up) state. When the values is set to two, the line will be initialized
+the low-level output state. If values is set to zero the line will be
+initialized to the input state.
+If the property is not specified no specific configuration will be set. Driver
+should reuse HW configuration provided by bootloader or other system.
+
+Example:
+
+gpio-controller@00000000 {
+	compatible = "foo";
+	reg = <0x00000000 0x1000>;
+	gpio-controller;
+	#gpio-cells = <2>;
+	ngpios = <9>;
+	gpio-lines-initial-states = <0>, <1>, <2>, <0>, <0>, <2>, <2>, <1>, <1>;
+}
+
 The GPIO chip may contain GPIO hog definitions. GPIO hogging is a mechanism
 providing automatic GPIO request and configuration as part of the
 gpio-controller's driver probe function.
-- 
2.11.0

