From: Rob Herring <robh@kernel.org>
Subject: [PATCH] dt-bindings: pinctrl: aspeed: Fix AST2500 example errors
Date: Mon, 15 Jul 2019 16:48:41 -0600
Message-ID: <20190715224841.6771-1-robh@kernel.org>
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

The schema examples are now validated against the schema itself. The
AST2500 pinctrl schema has a couple of errors:

Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.example.dt.yaml: \
example-0: $nodename:0: 'example-0' does not match '^(bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'
Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.example.dt.yaml: \
pinctrl: aspeed,external-nodes: [[1, 2]] is too short

Fixes: 0a617de16730 ("dt-bindings: pinctrl: aspeed: Convert AST2500 bindings to json-schema")
Cc: Andrew Jeffery <andrew@aj.id.au>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Joel Stanley <joel@jms.id.au>
Cc: linux-aspeed@lists.ozlabs.org
Cc: linux-gpio@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml  | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml
index a464cfa0cba3..3e6d85318577 100644
--- a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml
@@ -76,9 +76,6 @@ required:
 
 examples:
   - |
-    compatible = "simple-bus";
-    ranges;
-
     apb {
         compatible = "simple-bus";
         #address-cells = <1>;
@@ -91,7 +88,7 @@ examples:
 
             pinctrl: pinctrl {
                 compatible = "aspeed,g5-pinctrl";
-                aspeed,external-nodes = <&gfx &lhc>;
+                aspeed,external-nodes = <&gfx>, <&lhc>;
 
                 pinctrl_i2c3_default: i2c3_default {
                     function = "I2C3";
-- 
2.20.1
