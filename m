From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 15/30 v2] ARM: ixp4xx: Add DT bindings
Date: Thu, 21 Feb 2019 16:44:43 +0100
Message-ID: <20190221154458.23763-16-linus.walleij@linaro.org>
References: <20190221154458.23763-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190221154458.23763-1-linus.walleij@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, Imre Kaloz <kaloz@openwrt.org>, Krzysztof Halasa <khalasa@piap.pl>
Cc: devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org

This adds initial device tree bindings for the IXP4xx machines.
This time I tried something wild and crazy and try to make proper
JSON-style YAML bindings for the top level.

Cc: devicetree@vger.kernel.org
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Fix up the GW2358 compatible string.
---
 .../devicetree/bindings/arm/intel-ixp4xx.yaml | 22 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 23 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/intel-ixp4xx.yaml

diff --git a/Documentation/devicetree/bindings/arm/intel-ixp4xx.yaml b/Documentation/devicetree/bindings/arm/intel-ixp4xx.yaml
new file mode 100644
index 000000000000..f4f7451e5e8a
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/intel-ixp4xx.yaml
@@ -0,0 +1,22 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/intel-ixp4xx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Intel IXP4xx Device Tree Bindings
+
+maintainers:
+  - Linus Walleij <linus.walleij@linaro.org>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - linksys,nslu2
+          - const: intel,ixp42x
+      - items:
+          - enum:
+              - gateworks,gw2358
+          - const: intel,ixp43x
diff --git a/MAINTAINERS b/MAINTAINERS
index b44ee076d57c..20d02e1e60a8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1650,6 +1650,7 @@ M:	Imre Kaloz <kaloz@openwrt.org>
 M:	Krzysztof Halasa <khalasa@piap.pl>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
+F:	Documentation/devicetree/bindings/arm/intel-ixp4xx.yaml
 F:	Documentation/devicetree/bindings/gpio/intel,ixp4xx-gpio.txt
 F:	Documentation/devicetree/bindings/interrupt-controller/intel,ixp4xx-interrupt.yaml
 F:	Documentation/devicetree/bindings/timer/intel,ixp4xx-timer.yaml
-- 
2.20.1
