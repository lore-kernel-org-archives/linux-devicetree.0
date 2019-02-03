From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 15/17 v1] ARM: ixp4xx: Add DT bindings
Date: Sun,  3 Feb 2019 22:42:03 +0100
Message-ID: <20190203214205.13594-16-linus.walleij@linaro.org>
References: <20190203214205.13594-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190203214205.13594-1-linus.walleij@linaro.org>
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
Cc: Olof Johansson <olof@lixom.net>, devicetree@vger.kernel.org, Tim Harvey <tharvey@gateworks.com>, Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

This adds initial device tree bindings for the IXP4xx machines.
This time I tried something wild and crazy and try to make proper
JSON-style YAML bindings for the top level.

Cc: devicetree@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
I have no clear idea on how to auto-test this schema for validity,
since it is a bit of a new thing I hope to figure it out as
we go.
---
 .../devicetree/bindings/arm/intel-ixp4xx.yaml | 22 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 23 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/intel-ixp4xx.yaml

diff --git a/Documentation/devicetree/bindings/arm/intel-ixp4xx.yaml b/Documentation/devicetree/bindings/arm/intel-ixp4xx.yaml
new file mode 100644
index 000000000000..da5f6ffe6f2d
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
+              - gateworks,gw2358-4
+          - const: intel,ixp43x
diff --git a/MAINTAINERS b/MAINTAINERS
index 57d098b85523..c4ca249a2075 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1650,6 +1650,7 @@ M:	Imre Kaloz <kaloz@openwrt.org>
 M:	Krzysztof Halasa <khalasa@piap.pl>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
+F:	Documentation/devicetree/bindings/arm/intel-ixp4xx.yaml
 F:	Documentation/devicetree/bindings/gpio/intel,ixp4xx-gpio.txt
 F:	Documentation/devicetree/bindings/interrupt-controller/intel,ixp4xx-interrupt.txt
 F:	Documentation/devicetree/bindings/timer/intel,ixp4xx-timer.txt
-- 
2.20.1
