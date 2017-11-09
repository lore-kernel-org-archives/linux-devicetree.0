From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] gpio: rcar: Add r8a77995 (R-Car D3) support
Date: Thu,  9 Nov 2017 11:39:20 +0100
Message-ID: <1510223960-14139-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

This patch adds binding for r8a77995 (R-Car D3). This SoC can use
"renesas,rcar-gen3-gpio" fallback compatibility. So, this patch
doesn't modify the gpio-rcar driver.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Acked-by: Simon Horman <horms+renesas@verge.net.au>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Linus: it seems this one fell through the cracks, as the later
f76a2d9d7f9524c5 ("gpio-rcar: document R8A77970 bindings") did get
applied.

Thx!

v2:
  - Add Acked-by, rebased.
---
 Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt b/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt
index 41137a1cc099b7e7..a7ac460ad6572526 100644
--- a/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt
+++ b/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt
@@ -15,6 +15,7 @@ Required Properties:
     - "renesas,gpio-r8a7795": for R8A7795 (R-Car H3) compatible GPIO controller.
     - "renesas,gpio-r8a7796": for R8A7796 (R-Car M3-W) compatible GPIO controller.
     - "renesas,gpio-r8a77970": for R8A77970 (R-Car V3M) compatible GPIO controller.
+    - "renesas,gpio-r8a77995": for R8A77995 (R-Car D3) compatible GPIO controller.
     - "renesas,rcar-gen1-gpio": for a generic R-Car Gen1 GPIO controller.
     - "renesas,rcar-gen2-gpio": for a generic R-Car Gen2 or RZ/G1 GPIO controller.
     - "renesas,rcar-gen3-gpio": for a generic R-Car Gen3 GPIO controller.
-- 
2.7.4

