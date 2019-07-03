Return-Path: <SRS0=cIVi=VA=bootlin.com=maxime.ripard@kernel.org>
From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: [PATCH 1/7] dt-bindings: net: mdio: Add a nodename pattern
Date: Wed,  3 Jul 2019 11:55:07 +0200
Message-Id: <20190703095513.12340-1-maxime.ripard@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: devicetree@vger.kernel.org, Maxime Ripard <maxime.ripard@bootlin.com>
List-ID: <devicetree@vger.kernel.org>

The node name of an MDIO controller should be MDIO. Let's add a rule for
this.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 Documentation/devicetree/bindings/net/mdio.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/mdio.yaml b/Documentation/devicetree/bindings/net/mdio.yaml
index b8fa8251c4bc..12069d0b25c6 100644
--- a/Documentation/devicetree/bindings/net/mdio.yaml
+++ b/Documentation/devicetree/bindings/net/mdio.yaml
@@ -18,6 +18,9 @@ description:
   a device specific binding document.
 
 properties:
+  $nodename:
+    pattern: "^mdio(@.*)?"
+
   reset-gpios:
     maxItems: 1
     description:
-- 
2.21.0
