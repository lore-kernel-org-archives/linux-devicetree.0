From: Thierry Reding <thierry.reding@avionic-design.de>
Subject: [PATCH] gpio: Describe interrupt-controller binding
Date: Tue, 18 Sep 2012 10:35:33 +0200
Message-ID: <1347957333-16431-1-git-send-email-thierry.reding@avionic-design.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@stericsson.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

In order to use GPIO controllers as interrupt controllers, they need to
be marked with the DT interrupt-controller property. This commit adds
some documentation about this to the general GPIO binding document.

Cc: Linus Walleij <linus.walleij@stericsson.com>
Cc: Grant Likely <grant.likely@secretlab.ca>
Cc: Rob Herring <rob.herring@calxeda.com>
Cc: devicetree-discuss@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Thierry Reding <thierry.reding@avionic-design.de>
---
 Documentation/devicetree/bindings/gpio/gpio.txt | 33 +++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentation/devicetree/bindings/gpio/gpio.txt
index 4e16ba4..8d125b0 100644
--- a/Documentation/devicetree/bindings/gpio/gpio.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio.txt
@@ -75,4 +75,37 @@ Example of two SOC GPIO banks defined as gpio-controller nodes:
 		gpio-controller;
 	};
 
+If the GPIO controller supports the generation of interrupts, it should
+also contain an empty "interrupt-controller" property as well as an
+"#interrupt-cells" property. This is required in order for other nodes
+to use the GPIO controller as their interrupt parent.
 
+If #interrupt-cells is 1, the single cell is used to specify the number
+of the GPIO that is to be used as an interrupt.
+
+If #interrupt-cells is 2, the first cell is used to specify the number
+of the GPIO that is to be used as an interrupt, whereas the second cell
+is used to specify any of the following flags:
+  - bits[3:0] trigger type and level flags
+      1 = low-to-high edge triggered
+      2 = high-to-low edge triggered
+      4 = active high level-sensitive
+      8 = active low level-sensitive
+
+Example:
+
+	gpioext: gpio-controller@41 {
+		compatible = "ad,gpio-adnp";
+		reg = <0x41>;
+
+		interrupt-parent = <&gpio>;
+		interrupts = <160 1>;
+
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
+		nr-gpios = <64>;
+	};
-- 
1.7.12
