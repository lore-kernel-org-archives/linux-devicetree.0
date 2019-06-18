From: Rob Herring <robh@kernel.org>
Subject: [PATCH] dt-bindings: arm: Convert MOXA ART board/soc bindings to
 json-schema
Date: Tue, 18 Jun 2019 15:22:26 -0600
Message-ID: <20190618212229.32302-2-robh@kernel.org>
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
Cc: linux-arm-kernel@lists.infradead.org, Jonas Jensen <jonas.jensen@gmail.com>
List-Id: devicetree@vger.kernel.org

Convert MOXA ART SoC bindings to DT schema format using json-schema.

Cc: Jonas Jensen <jonas.jensen@gmail.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/arm/moxart.txt        | 12 ------------
 .../devicetree/bindings/arm/moxart.yaml       | 19 +++++++++++++++++++
 2 files changed, 19 insertions(+), 12 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/moxart.txt
 create mode 100644 Documentation/devicetree/bindings/arm/moxart.yaml

diff --git a/Documentation/devicetree/bindings/arm/moxart.txt b/Documentation/devicetree/bindings/arm/moxart.txt
deleted file mode 100644
index 11087edb0658..000000000000
--- a/Documentation/devicetree/bindings/arm/moxart.txt
+++ /dev/null
@@ -1,12 +0,0 @@
-MOXA ART device tree bindings
-
-Boards with the MOXA ART SoC shall have the following properties:
-
-Required root node property:
-
-compatible = "moxa,moxart";
-
-Boards:
-
-- UC-7112-LX: embedded computer
-  compatible = "moxa,moxart-uc-7112-lx", "moxa,moxart"
diff --git a/Documentation/devicetree/bindings/arm/moxart.yaml b/Documentation/devicetree/bindings/arm/moxart.yaml
new file mode 100644
index 000000000000..c068df59fad2
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/moxart.yaml
@@ -0,0 +1,19 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/moxart.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MOXA ART device tree bindings
+
+maintainers:
+  - Jonas Jensen <jonas.jensen@gmail.com>
+
+properties:
+  compatible:
+    description: UC-7112-LX embedded computer
+    items:
+      - const: moxa,moxart-uc-7112-lx
+      - const: moxa,moxart
+
+...
-- 
2.20.1
