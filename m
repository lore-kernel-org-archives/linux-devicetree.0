Return-Path: <SRS0=Wv3U=KW=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH v3 2/5] dt-bindings: gpio: rcar: Add gpio-reserved-ranges support
Date: Tue,  7 Aug 2018 08:57:03 +0100
Message-Id: <1533628626-26503-3-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1533628626-26503-1-git-send-email-biju.das@bp.renesas.com>
References: <1533628626-26503-1-git-send-email-biju.das@bp.renesas.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Update the DT bindings documentation with the optional gpio-reserved-ranges
properties.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
V2 --> V3
  * Incorporated review comments.
---
 .../devicetree/bindings/gpio/renesas,gpio-rcar.txt | 61 +++++++++++++---------
 1 file changed, 35 insertions(+), 26 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt b/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt
index 378f132..f8c81e4 100644
--- a/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt
+++ b/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt
@@ -38,7 +38,7 @@ Required Properties:
   - #gpio-cells: Should be 2. The first cell is the GPIO number and the second
     cell specifies GPIO flags, as defined in <dt-bindings/gpio/gpio.h>. Only the
     GPIO_ACTIVE_HIGH and GPIO_ACTIVE_LOW flags are supported.
-  - gpio-ranges: Range of pins managed by the GPIO controller.
+  - gpio-ranges: See gpio.txt.
 
 Optional properties:
 
@@ -46,35 +46,44 @@ Optional properties:
     mandatory if the hardware implements a controllable functional clock for
     the GPIO instance.
 
-Please refer to gpio.txt in this directory for details of gpio-ranges property
-and the common GPIO bindings used by client devices.
+  - gpio-reserved-ranges: See gpio.txt.
+
+Please refer to gpio.txt in this directory for the common GPIO bindings used by
+client devices.
 
 The GPIO controller also acts as an interrupt controller. It uses the default
 two cells specifier as described in Documentation/devicetree/bindings/
 interrupt-controller/interrupts.txt.
 
-Example: R8A7779 (R-Car H1) GPIO controller nodes
+Example: R8A77470 (RZ/G1C) GPIO controller nodes
 
-	gpio0: gpio@ffc40000 {
-		compatible = "renesas,gpio-r8a7779", "renesas,rcar-gen1-gpio";
-		reg = <0xffc40000 0x2c>;
-		interrupt-parent = <&gic>;
-		interrupts = <0 141 0x4>;
-		#gpio-cells = <2>;
-		gpio-controller;
-		gpio-ranges = <&pfc 0 0 32>;
-		interrupt-controller;
-		#interrupt-cells = <2>;
-	};
+       gpio0: gpio@e6050000 {
+                compatible = "renesas,gpio-r8a77470",
+                             "renesas,rcar-gen2-gpio";
+                reg = <0 0xe6050000 0 0x50>;
+                interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
+                #gpio-cells = <2>;
+                gpio-controller;
+                gpio-ranges = <&pfc 0 0 23>;
+                #interrupt-cells = <2>;
+                interrupt-controller;
+                clocks = <&cpg CPG_MOD 912>;
+                power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
+                resets = <&cpg 912>;
+        };
 	...
-	gpio6: gpio@ffc46000 {
-		compatible = "renesas,gpio-r8a7779", "renesas,rcar-gen1-gpio";
-		reg = <0xffc46000 0x2c>;
-		interrupt-parent = <&gic>;
-		interrupts = <0 147 0x4>;
-		#gpio-cells = <2>;
-		gpio-controller;
-		gpio-ranges = <&pfc 0 192 9>;
-		interrupt-controller;
-		#interrupt-cells = <2>;
-	};
+       gpio3: gpio@e6053000 {
+                compatible = "renesas,gpio-r8a77470",
+                             "renesas,rcar-gen2-gpio";
+                reg = <0 0xe6053000 0 0x50>;
+                interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+                #gpio-cells = <2>;
+                gpio-controller;
+                gpio-ranges = <&pfc 0 96 30>;
+                gpio-reserved-ranges = <17 10>;
+                #interrupt-cells = <2>;
+                interrupt-controller;
+                clocks = <&cpg CPG_MOD 909>;
+                power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
+                resets = <&cpg 909>;
+        };
-- 
2.7.4
