From: Rob Herring <robh@kernel.org>
Subject: [PATCH] dt-bindings: arm: Convert NXP LPC32xx board/soc bindings to
 json-schema
Date: Tue, 18 Jun 2019 15:22:27 -0600
Message-ID: <20190618212229.32302-3-robh@kernel.org>
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
Cc: Roland Stigge <stigge@antcom.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Convert NXP LPC32xx SoC bindings to DT schema format using json-schema.

Cc: Roland Stigge <stigge@antcom.de>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/arm/nxp/lpc32xx.txt   |  8 ------
 .../devicetree/bindings/arm/nxp/lpc32xx.yaml  | 25 +++++++++++++++++++
 2 files changed, 25 insertions(+), 8 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/nxp/lpc32xx.txt
 create mode 100644 Documentation/devicetree/bindings/arm/nxp/lpc32xx.yaml

diff --git a/Documentation/devicetree/bindings/arm/nxp/lpc32xx.txt b/Documentation/devicetree/bindings/arm/nxp/lpc32xx.txt
deleted file mode 100644
index 56ec8ddc4a3b..000000000000
--- a/Documentation/devicetree/bindings/arm/nxp/lpc32xx.txt
+++ /dev/null
@@ -1,8 +0,0 @@
-NXP LPC32xx Platforms Device Tree Bindings
-------------------------------------------
-
-Boards with the NXP LPC32xx SoC shall have the following properties:
-
-Required root node property:
-
-compatible: must be "nxp,lpc3220", "nxp,lpc3230", "nxp,lpc3240" or "nxp,lpc3250"
diff --git a/Documentation/devicetree/bindings/arm/nxp/lpc32xx.yaml b/Documentation/devicetree/bindings/arm/nxp/lpc32xx.yaml
new file mode 100644
index 000000000000..07f39d3eee7e
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/nxp/lpc32xx.yaml
@@ -0,0 +1,25 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/nxp/lpc32xx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP LPC32xx Platforms Device Tree Bindings
+
+maintainers:
+  - Roland Stigge <stigge@antcom.de>
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - nxp,lpc3220
+          - nxp,lpc3230
+          - nxp,lpc3240
+      - items:
+        - enum:
+            - ea,ea3250
+            - phytec,phy3250
+        - const: nxp,lpc3250
+
+...
-- 
2.20.1
