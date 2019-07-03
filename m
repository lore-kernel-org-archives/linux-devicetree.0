Return-Path: <SRS0=cIVi=VA=bootlin.com=maxime.ripard@kernel.org>
From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: [PATCH 4/7] dt-bindings: display: Fix simple-framebuffer example
Date: Wed,  3 Jul 2019 11:55:10 +0200
Message-Id: <20190703095513.12340-4-maxime.ripard@bootlin.com>
In-Reply-To: <20190703095513.12340-1-maxime.ripard@bootlin.com>
References: <20190703095513.12340-1-maxime.ripard@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: devicetree@vger.kernel.org, Maxime Ripard <maxime.ripard@bootlin.com>
List-ID: <devicetree@vger.kernel.org>

The simple-framebuffer binding has a compatible that isn't one of the valid
options. Since an Allwinner pipeline is being described, let's add the
matching compatible.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 .../devicetree/bindings/display/simple-framebuffer.yaml         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
index b052d76cf8b6..c8d73ef010b5 100644
--- a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
+++ b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
@@ -139,7 +139,7 @@ examples:
       #size-cells = <1>;
       stdout-path = "display0";
       framebuffer0: framebuffer@1d385000 {
-        compatible = "simple-framebuffer";
+        compatible = "allwinner,simple-framebuffer", "simple-framebuffer";
         reg = <0x1d385000 3840000>;
         width = <1600>;
         height = <1200>;
-- 
2.21.0
