From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v2 2/2] dt-bindings: pinctrl: add support for RZ/A1M and RZ/A1L
Date: Wed,  4 Oct 2017 11:31:11 -0500
Message-ID: <20171004163111.54600-3-chris.brandt@renesas.com>
References: <20171004163111.54600-1-chris.brandt@renesas.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20171004163111.54600-1-chris.brandt@renesas.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Simon Horman <horms+renesas@verge.net.au>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Chris Brandt <chris.brandt@renesas.com>
List-Id: devicetree@vger.kernel.org

Describe how to specify RZ/A1M and RZ/A1L devices.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
v2:
 * Added description for RZ/A1M
---
 Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt
index 43e21474528a..f2fc86f8dbab 100644
--- a/Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt
@@ -13,7 +13,9 @@ Pin controller node
 
 Required properties:
   - compatible
-    this shall be "renesas,r7s72100-ports".
+    this shall be "renesas,r7s72100-ports" for RZ/A1H, "renesas,r7s72101-ports"
+    with a fallback of "renesas,r7s72100-ports" for RZ/A1M (as A1M is compatible
+    with A1H), or "renesas,r7s72102-ports" for RZ/A1L
 
   - reg
     address base and length of the memory area where the pin controller
-- 
2.14.1


