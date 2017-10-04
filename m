From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v3 2/2] dt-bindings: pinctrl: add support for RZ/A1M and RZ/A1L
Date: Wed,  4 Oct 2017 16:07:24 -0500
Message-ID: <20171004210724.59797-3-chris.brandt@renesas.com>
References: <20171004210724.59797-1-chris.brandt@renesas.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20171004210724.59797-1-chris.brandt@renesas.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Simon Horman <horms+renesas@verge.net.au>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Chris Brandt <chris.brandt@renesas.com>
List-Id: devicetree@vger.kernel.org

Describe how to specify RZ/A1M and RZ/A1L devices.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3:
 * Reworded
 * Added Reviewed-by
v2:
 * Added description for RZ/A1M
---
 Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt
index 43e21474528a..fd3696eb36bf 100644
--- a/Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt
@@ -12,8 +12,10 @@ Pin controller node
 -------------------
 
 Required properties:
-  - compatible
-    this shall be "renesas,r7s72100-ports".
+  - compatible: should be:
+    - "renesas,r7s72100-ports": for RZ/A1H
+    - "renesas,r7s72101-ports", "renesas,r7s72100-ports": for RZ/A1M
+    - "renesas,r7s72102-ports": for RZ/A1L
 
   - reg
     address base and length of the memory area where the pin controller
-- 
2.14.1


