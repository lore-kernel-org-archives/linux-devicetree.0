From: Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH v3 05/10] dt-bindings: add compatible string for Allwinner R40 pinctrl
Date: Sat, 27 May 2017 18:23:03 +0800
Message-ID: <20170527102308.1988-6-icenowy@aosc.io>
References: <20170527102308.1988-1-icenowy@aosc.io>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20170527102308.1988-1-icenowy@aosc.io>
Sender: linux-gpio-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, Icenowy Zheng <icenowy@aosc.io>
List-Id: devicetree@vger.kernel.org

Allwinner R40 has a pin controller like the ones in older Allwinner SoCs
(especially A20), and can use modified version of the A10/A20 pinctrl
driver.

Add a compatible string for it.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
Acked-by: Rob Herring <robh@kernel.org>
---
Changes in v3:
- Added Rob's ACK.

 Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt
index b53224473672..3ab9f7849a19 100644
--- a/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt
@@ -22,6 +22,7 @@ Required properties:
   "allwinner,sun8i-a83t-pinctrl"
   "allwinner,sun8i-h3-pinctrl"
   "allwinner,sun8i-h3-r-pinctrl"
+  "allwinner,sun8i-r40-pinctrl"
   "allwinner,sun50i-a64-pinctrl"
   "allwinner,sun50i-a64-r-pinctrl"
   "allwinner,sun50i-h5-pinctrl"
-- 
2.12.2

