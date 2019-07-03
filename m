Return-Path: <SRS0=cIVi=VA=bootlin.com=maxime.ripard@kernel.org>
From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: [PATCH] dt-bindings: nvmem: SID: Fix the examples node names
Date: Wed,  3 Jul 2019 11:54:21 +0200
Message-Id: <20190703095421.11798-1-maxime.ripard@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: devicetree@vger.kernel.org, Maxime Ripard <maxime.ripard@bootlin.com>
List-ID: <devicetree@vger.kernel.org>

Now that the examples are validated, the examples in the SID binding
generates an error since the node names aren't one of the valid ones.

Let's switch for one that is ok.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 .../devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml b/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml
index c9efd6e2c134..1084e9d2917d 100644
--- a/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml
+++ b/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml
@@ -37,13 +37,13 @@ required:
 
 examples:
   - |
-    sid@1c23800 {
+    efuse@1c23800 {
         compatible = "allwinner,sun4i-a10-sid";
         reg = <0x01c23800 0x10>;
     };
 
   - |
-    sid@1c23800 {
+    efuse@1c23800 {
         compatible = "allwinner,sun7i-a20-sid";
         reg = <0x01c23800 0x200>;
     };
-- 
2.21.0
