Return-Path: <SRS0=r4+v=L3=linaro.org=linus.walleij@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: OF: Remove bad practice examples
Date: Thu, 13 Sep 2018 09:47:32 +0200
Message-Id: <20180913074732.5911-1-linus.walleij@linaro.org>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
List-ID: <devicetree@vger.kernel.org>

We remove the references to anything but two-cell GPIO specifiers
and just mention that controllers need to specify their bindings
and that we strongly recommend two-cell bindings.

Cc: devicetree@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 .../devicetree/bindings/gpio/gpio.txt         | 24 +++++++------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentation/devicetree/bindings/gpio/gpio.txt
index 3afaa396adf7..f0ba154b5723 100644
--- a/Documentation/devicetree/bindings/gpio/gpio.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio.txt
@@ -27,30 +27,24 @@ and bit-banged data signals:
 		gpio-controller;
 		#gpio-cells = <2>;
 	};
-	gpio2: gpio2 {
-		gpio-controller;
-		#gpio-cells = <1>;
-	};
 	[...]
 
-	enable-gpios = <&gpio2 2>;
 	data-gpios = <&gpio1 12 0>,
 		     <&gpio1 13 0>,
 		     <&gpio1 14 0>,
 		     <&gpio1 15 0>;
 
-Note that gpio-specifier length is controller dependent.  In the
-above example, &gpio1 uses 2 cells to specify a gpio, while &gpio2
-only uses one.
-
-gpio-specifier may encode: bank, pin position inside the bank,
-whether pin is open-drain and whether pin is logically inverted.
+In the above example, &gpio1 uses 2 cells to specify a gpio. The first cell is
+a local offset to the GPIO line and the second cell represent consumer flags,
+such as if the consumer desire the line to be active low (inverted) or open
+drain. This is the recommended practice.
 
-Exact meaning of each specifier cell is controller specific, and must
-be documented in the device tree binding for the device.
+The exact meaning of each specifier cell is controller specific, and must be
+documented in the device tree binding for the device, but it is strongly
+recommended to use the two-cell approach.
 
-Most controllers are however specifying a generic flag bitfield
-in the last cell, so for these, use the macros defined in
+Most controllers are specifying a generic flag bitfield in the last cell, so
+for these, use the macros defined in
 include/dt-bindings/gpio/gpio.h whenever possible:
 
 Example of a node using GPIOs:
-- 
2.17.1
