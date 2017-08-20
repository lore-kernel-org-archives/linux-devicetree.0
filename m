From: Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH 1/2] dt-bindings: add compatible string for Allwinner V3s SoC
Date: Sun, 20 Aug 2017 13:29:56 +0800
Message-ID: <20170820052957.34597-1-icenowy@aosc.io>
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-sunxi@googlegroups.com, Icenowy Zheng <icenowy@aosc.io>
List-Id: devicetree@vger.kernel.org

The compatible string for Allwinner V3s SoC used to be missing.

Add it to the binding document.

Fixes: b074fede01c0 ("arm: sunxi: add support for V3s SoC")
Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
 Documentation/devicetree/bindings/arm/sunxi.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.txt b/Documentation/devicetree/bindings/arm/sunxi.txt
index d2c46449b4eb..f35c6ada5a65 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.txt
+++ b/Documentation/devicetree/bindings/arm/sunxi.txt
@@ -14,6 +14,7 @@ using one of the following compatible strings:
   allwinner,sun8i-a83t
   allwinner,sun8i-h2-plus
   allwinner,sun8i-h3
+  allwinner,sun8i-v3s
   allwinner,sun9i-a80
   allwinner,sun50i-a64
   nextthing,gr8
-- 
2.13.0

