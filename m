From: Rob Herring <robh@kernel.org>
Subject: [PATCH 1/2] dt-bindings: vendor-prefixes: Also allow node names starting with '_'
Date: Thu, 13 Jun 2019 08:42:09 -0600
Message-ID: <20190613144210.22181-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Maxime Ripard <maxime.ripard@bootlin.com>
List-Id: devicetree@vger.kernel.org

Generated nodes for overlays begin with '_'. The binding examples are
built as overlays in order to allow unresolved phandles, so we need to
allow the generated node names.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index e68c839e9f51..a777168432d0 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1028,7 +1028,7 @@ patternProperties:
 
   # Normal property name match without a comma
   # These should catch all node/property names without a prefix
-  "^[a-zA-Z0-9#][a-zA-Z0-9+\\-._@]{0,63}$": true
+  "^[a-zA-Z0-9#_][a-zA-Z0-9+\\-._@]{0,63}$": true
   "^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*$": true
   "^#.*": true
 
-- 
2.20.1
