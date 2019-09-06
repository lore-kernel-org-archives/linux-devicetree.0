From: Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH] dt-bindings: arm: renesas: Convert 'renesas,
 prr' to json-schema
Date: Fri,  6 Sep 2019 13:14:35 +0200
Message-ID: <20190906111435.5706-1-horms+renesas@verge.net.au>
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
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Simon Horman <horms+renesas@verge.net.au>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Convert Renesas Product Register bindings documentation to json-schema.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
Based on v5.3-rc1
Tested using:
  make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/arm/renesas,prr.yaml
---
 .../devicetree/bindings/arm/renesas,prr.txt        | 20 ------------
 .../devicetree/bindings/arm/renesas,prr.yaml       | 36 ++++++++++++++++++++++
 2 files changed, 36 insertions(+), 20 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/renesas,prr.txt
 create mode 100644 Documentation/devicetree/bindings/arm/renesas,prr.yaml

diff --git a/Documentation/devicetree/bindings/arm/renesas,prr.txt b/Documentation/devicetree/bindings/arm/renesas,prr.txt
deleted file mode 100644
index 08e482e953ca..000000000000
--- a/Documentation/devicetree/bindings/arm/renesas,prr.txt
+++ /dev/null
@@ -1,20 +0,0 @@
-Renesas Product Register
-
-Most Renesas ARM SoCs have a Product Register or Boundary Scan ID Register that
-allows to retrieve SoC product and revision information.  If present, a device
-node for this register should be added.
-
-Required properties:
-  - compatible: Must be one of:
-    "renesas,prr"
-    "renesas,bsid"
-  - reg: Base address and length of the register block.
-
-
-Examples
---------
-
-	prr: chipid@ff000044 {
-		compatible = "renesas,prr";
-		reg = <0 0xff000044 0 4>;
-	};
diff --git a/Documentation/devicetree/bindings/arm/renesas,prr.yaml b/Documentation/devicetree/bindings/arm/renesas,prr.yaml
new file mode 100644
index 000000000000..9df003041456
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/renesas,prr.yaml
@@ -0,0 +1,36 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/renesas,prr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas Product Register
+
+maintainers:
+  - Geert Uytterhoeven <geert+renesas@glider.be>
+  - Magnus Damm <magnus.damm@gmail.com>
+
+description: |
+  Most Renesas ARM SoCs have a Product Register or Boundary Scan ID
+  Register that allows to retrieve SoC product and revision information.
+  If present, a device node for this register should be added.
+
+properties:
+  compatible:
+    oneOf:
+        - const: "renesas,prr"
+        - const: "renesas,bsid"
+  reg:
+    items:
+      - description: Base address and length of the register block.
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    prr: chipid@ff000044 {
+        compatible = "renesas,prr";
+        reg = <0 0xff000044 0 4>;
+    };
-- 
2.11.0
