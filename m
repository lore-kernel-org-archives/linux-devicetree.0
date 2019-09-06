Return-Path: <SRS0=11Aw=XB=vergenet.net=horms@kernel.org>
From: Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH] dt-bindings: Correct spelling in example schema
Date: Fri,  6 Sep 2019 13:16:24 +0200
Message-Id: <20190906111624.6820-1-horms+renesas@verge.net.au>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Simon Horman <horms+renesas@verge.net.au>
List-ID: <devicetree@vger.kernel.org>

Correct spelling of "identifier".

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
Based on v5.3-rc1
---
 Documentation/devicetree/bindings/example-schema.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/example-schema.yaml b/Documentation/devicetree/bindings/example-schema.yaml
index 9175d67f355d..c43819c2783a 100644
--- a/Documentation/devicetree/bindings/example-schema.yaml
+++ b/Documentation/devicetree/bindings/example-schema.yaml
@@ -5,7 +5,7 @@
 # All the top-level keys are standard json-schema keywords except for
 # 'maintainers' and 'select'
 
-# $id is a unique idenifier based on the filename. There may or may not be a
+# $id is a unique identifier based on the filename. There may or may not be a
 # file present at the URL.
 $id: "http://devicetree.org/schemas/example-schema.yaml#"
 # $schema is the meta-schema this schema should be validated with.
-- 
2.11.0
