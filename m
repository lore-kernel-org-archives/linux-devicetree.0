From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] regulator: fixed: Use more standard GPIO binding
Date: Thu,  4 Oct 2018 11:06:54 +0200
Message-ID: <20181004090654.32233-1-linus.walleij@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org, Leonard Crestez <leonard.crestez@nxp.com>
List-Id: devicetree@vger.kernel.org

The fixed regulator uses "gpio" (singularis) for the GPIO line
but the standard GPIO bindings recommend "gpios" (pluralis).

We have augmented the Linux kernel to handle both, so recommend
the best practice and deprecate the singularis variant.

Cc: devicetree@vger.kernel.org
Cc: Leonard Crestez <leonard.crestez@nxp.com>
Suggested-by: Leonard Crestez <leonard.crestez@nxp.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 .../devicetree/bindings/regulator/fixed-regulator.txt     | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/fixed-regulator.txt b/Documentation/devicetree/bindings/regulator/fixed-regulator.txt
index 0c2a6c8a1536..a0d7f15ef5ca 100644
--- a/Documentation/devicetree/bindings/regulator/fixed-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/fixed-regulator.txt
@@ -5,7 +5,7 @@ Required properties:
 - regulator-name: Defined in regulator.txt as optional, but required here.
 
 Optional properties:
-- gpio: gpio to use for enable control
+- gpios: gpio to use for enable control
 - startup-delay-us: startup time in microseconds
 - enable-active-high: Polarity of GPIO is Active high
 If this property is missing, the default assumed is Active low.
@@ -13,6 +13,10 @@ If this property is missing, the default assumed is Active low.
   If this property is missing then default assumption is false.
 -vin-supply: Input supply name.
 
+Deprecated properties:
+- gpio: singularis variant of "gpios" is allowed in accordance with the
+  GPIO bindings specification, but not recommended.
+
 Any property defined as part of the core regulator
 binding, defined in regulator.txt, can also be used.
 However a fixed voltage regulator is expected to have the
@@ -26,7 +30,7 @@ Example:
 		regulator-name = "fixed-supply";
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
-		gpio = <&gpio1 16 0>;
+		gpios = <&gpio1 16 0>;
 		startup-delay-us = <70000>;
 		enable-active-high;
 		regulator-boot-on;
-- 
2.17.1
