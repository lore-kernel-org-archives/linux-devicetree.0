From: Rob Herring <robh@kernel.org>
Subject: [PATCH] dt-bindings: arm: fsl: Add missing schemas for i.MX1/31/35
Date: Mon, 17 Jun 2019 16:42:44 -0600
Message-ID: <20190617224244.30818-1-robh@kernel.org>
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
Cc: Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The SoC/board bindings for i.MX1/31/35 are undocumented. Add the missing
bindings to the schema.

Cc: Shawn Guo <shawnguo@kernel.org>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/arm/fsl.yaml          | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 0a6b4eba2bb2..e73cc11acdfb 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -15,6 +15,13 @@ properties:
     const: '/'
   compatible:
     oneOf:
+      - description: i.MX1 based Boards
+        items:
+          - enum:
+              - armadeus,imx1-apf9328
+              - fsl,imx1ads
+          - const: fsl,imx1
+
       - description: i.MX23 based Boards
         items:
           - enum:
@@ -51,6 +58,25 @@ properties:
           - const: i2se,duckbill-2
           - const: fsl,imx28
 
+      - description: i.MX31 based Boards
+        items:
+          - enum:
+              - buglabs,imx31-bug
+              - logicpd,imx31-lite
+          - const: fsl,imx31
+
+      - description: i.MX35 based Boards
+        items:
+          - enum:
+              - fsl,imx35-pdk
+          - const: fsl,imx35
+
+      - description: i.MX35 Eukrea CPUIMX35 Board
+        items:
+          - const: eukrea,mbimxsd35-baseboard
+          - const: eukrea,cpuimx35
+          - const: fsl,imx35
+
       - description: i.MX50 based Boards
         items:
           - enum:
-- 
2.20.1
