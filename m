From: Rob Herring <robh@kernel.org>
Subject: [PATCH] dt-bindings: arm: Convert Axxia board/soc bindings to
 json-schema
Date: Tue, 18 Jun 2019 15:22:25 -0600
Message-ID: <20190618212229.32302-1-robh@kernel.org>
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
To: devicetree@vger.kernel.org
Cc: Anders Berg <anders.berg@lsi.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Convert Axxia SoC bindings to DT schema format using json-schema.

Cc: Anders Berg <anders.berg@lsi.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/arm/axxia.txt         | 12 ------------
 .../devicetree/bindings/arm/axxia.yaml        | 19 +++++++++++++++++++
 2 files changed, 19 insertions(+), 12 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/axxia.txt
 create mode 100644 Documentation/devicetree/bindings/arm/axxia.yaml

diff --git a/Documentation/devicetree/bindings/arm/axxia.txt b/Documentation/devicetree/bindings/arm/axxia.txt
deleted file mode 100644
index 7b4ef9c07696..000000000000
--- a/Documentation/devicetree/bindings/arm/axxia.txt
+++ /dev/null
@@ -1,12 +0,0 @@
-Axxia AXM55xx device tree bindings
-
-Boards using the AXM55xx SoC need to have the following properties:
-
-Required root node property:
-
-  - compatible = "lsi,axm5516"
-
-Boards:
-
-  LSI AXM5516 Validation board (Amarillo)
-	compatible = "lsi,axm5516-amarillo", "lsi,axm5516"
diff --git a/Documentation/devicetree/bindings/arm/axxia.yaml b/Documentation/devicetree/bindings/arm/axxia.yaml
new file mode 100644
index 000000000000..98780a569f22
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/axxia.yaml
@@ -0,0 +1,19 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/axxia.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Axxia AXM55xx device tree bindings
+
+maintainers:
+  - Anders Berg <anders.berg@lsi.com>
+
+properties:
+  compatible:
+    description: LSI AXM5516 Validation board (Amarillo)
+    items:
+      - const: lsi,axm5516-amarillo
+      - const: lsi,axm5516
+
+...
-- 
2.20.1
