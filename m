Return-Path: <SRS0=gSIt=VA=vger.kernel.org=devicetree-owner@kernel.org>
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:55903 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726870AbfGCJzY (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 3 Jul 2019 05:55:24 -0400
From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: [PATCH 5/7] dt-bindings: simple-framebuffer: Add requirement for pipelines
Date: Wed,  3 Jul 2019 11:55:11 +0200
Message-Id: <20190703095513.12340-5-maxime.ripard@bootlin.com>
In-Reply-To: <20190703095513.12340-1-maxime.ripard@bootlin.com>
References: <20190703095513.12340-1-maxime.ripard@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: devicetree@vger.kernel.org, Maxime Ripard <maxime.ripard@bootlin.com>
List-ID: <devicetree@vger.kernel.org>

Both the allwinner and amlogic compatibles require that either the
allwinner,pipeline or the amlogic,pipeline property is set. This was
dropped during the conversion since we didn't have conditionals back then,
but we can express this properly now.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 .../bindings/display/simple-framebuffer.yaml  | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
index c8d73ef010b5..678776b6012a 100644
--- a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
+++ b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
@@ -126,6 +126,28 @@ required:
   # but usually they will be filled by the bootloader.
   - compatible
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: allwinner,simple-framebuffer
+
+    then:
+      required:
+        - allwinner,pipeline
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: amlogic,simple-framebuffer
+
+    then:
+      required:
+        - amlogic,pipeline
+
+
 additionalProperties: false
 
 examples:
@@ -140,6 +162,7 @@ examples:
       stdout-path = "display0";
       framebuffer0: framebuffer@1d385000 {
         compatible = "allwinner,simple-framebuffer", "simple-framebuffer";
+        allwinner,pipeline = "de_be0-lcd0";
         reg = <0x1d385000 3840000>;
         width = <1600>;
         height = <1200>;
-- 
2.21.0
