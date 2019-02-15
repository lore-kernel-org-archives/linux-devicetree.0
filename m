From: Baolin Wang <baolin.wang@linaro.org>
Subject: [PATCH v2 1/2] dt-bindings: gpio: sprd: Use SoC compatible string instead of wildcard string
Date: Fri, 15 Feb 2019 12:55:18 +0800
Message-ID: <3818909a5d6f956ef30ff25cfc42f7550d062086.1550201284.git.baolin.wang@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, linus.walleij@linaro.org, bgolaszewski@baylibre.com
Cc: orsonzhai@gmail.com, zhang.lyra@gmail.com, baolin.wang@linaro.org, broonie@kernel.org, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Use SoC compatible string instead of wildcard string.

Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
---
Changes from v1:
 - Add 'sprd' to indicate the module in subject line.
---
 .../devicetree/bindings/gpio/gpio-eic-sprd.txt     |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-eic-sprd.txt b/Documentation/devicetree/bindings/gpio/gpio-eic-sprd.txt
index 93d98d0..54040a2 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-eic-sprd.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-eic-sprd.txt
@@ -33,7 +33,7 @@ Required properties:
   "sprd,sc9860-eic-latch",
   "sprd,sc9860-eic-async",
   "sprd,sc9860-eic-sync",
-  "sprd,sc27xx-eic".
+  "sprd,sc2731-eic".
 - reg: Define the base and range of the I/O address space containing
   the GPIO controller registers.
 - gpio-controller: Marks the device node as a GPIO controller.
@@ -86,7 +86,7 @@ Example:
 	};
 
 	pmic_eic: gpio@300 {
-		compatible = "sprd,sc27xx-eic";
+		compatible = "sprd,sc2731-eic";
 		reg = <0x300>;
 		interrupt-parent = <&sc2731_pmic>;
 		interrupts = <5 IRQ_TYPE_LEVEL_HIGH>;
-- 
1.7.9.5
