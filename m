From: Rob Herring <robh@kernel.org>
Subject: [PATCH] dt-bindings: pinctrl: aspeed: Fix 'compatible' schema errors
Date: Mon, 15 Jul 2019 16:37:25 -0600
Message-ID: <20190715223725.12924-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Andrew Jeffery <andrew@aj.id.au>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, Joel Stanley <joel@jms.id.au>, linux-aspeed@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

The Aspeed pinctl schema have errors in the 'compatible' schema:

Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml: \
properties:compatible:enum: ['aspeed', 'ast2400-pinctrl', 'aspeed', 'g4-pinctrl'] has non-unique elements
Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml: \
properties:compatible:enum: ['aspeed', 'ast2500-pinctrl', 'aspeed', 'g5-pinctrl'] has non-unique elements

Flow style sequences have to be quoted if the vales contain ','. Fix
this by using the more common one line per entry formatting.

Fixes: 0a617de16730 ("dt-bindings: pinctrl: aspeed: Convert AST2500 bindings to json-schema")
Fixes: 07457937bb5c ("dt-bindings: pinctrl: aspeed: Convert AST2400 bindings to json-schema")
Cc: Andrew Jeffery <andrew@aj.id.au>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Joel Stanley <joel@jms.id.au>
Cc: linux-aspeed@lists.ozlabs.org
Cc: linux-gpio@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml   | 4 +++-
 .../devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml   | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml
index 61a110a7db8a..125599a2dc5e 100644
--- a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml
@@ -22,7 +22,9 @@ description: |+
 
 properties:
   compatible:
-    enum: [ aspeed,ast2400-pinctrl, aspeed,g4-pinctrl ]
+    enum:
+      - aspeed,ast2400-pinctrl
+      - aspeed,g4-pinctrl
 
 patternProperties:
   '^.*$':
diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml
index cf561bd55128..a464cfa0cba3 100644
--- a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml
@@ -22,7 +22,9 @@ description: |+
 
 properties:
   compatible:
-    enum: [ aspeed,ast2500-pinctrl, aspeed,g5-pinctrl ]
+    enum:
+      - aspeed,ast2500-pinctrl
+      - aspeed,g5-pinctrl
   aspeed,external-nodes:
     minItems: 2
     maxItems: 2
-- 
2.20.1
