From: Rob Herring <robh@kernel.org>
Subject: [PATCH] dt-bindings: arm: Convert Conexant Digicolor board/soc
 bindings to json-schema
Date: Tue, 18 Jun 2019 15:22:29 -0600
Message-ID: <20190618212229.32302-5-robh@kernel.org>
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
Cc: Baruch Siach <baruch@tkos.co.il>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Convert Conexant Digicolor SoC bindings to DT schema format using json-schema.

Cc: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/arm/digicolor.txt        |  6 ------
 .../devicetree/bindings/arm/digicolor.yaml       | 16 ++++++++++++++++
 2 files changed, 16 insertions(+), 6 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/digicolor.txt
 create mode 100644 Documentation/devicetree/bindings/arm/digicolor.yaml

diff --git a/Documentation/devicetree/bindings/arm/digicolor.txt b/Documentation/devicetree/bindings/arm/digicolor.txt
deleted file mode 100644
index 658553f40b23..000000000000
--- a/Documentation/devicetree/bindings/arm/digicolor.txt
+++ /dev/null
@@ -1,6 +0,0 @@
-Conexant Digicolor Platforms Device Tree Bindings
-
-Each device tree must specify which Conexant Digicolor SoC it uses.
-Must be the following compatible string:
-
-  cnxt,cx92755
diff --git a/Documentation/devicetree/bindings/arm/digicolor.yaml b/Documentation/devicetree/bindings/arm/digicolor.yaml
new file mode 100644
index 000000000000..d9c80b827e9b
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/digicolor.yaml
@@ -0,0 +1,16 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/digicolor.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Conexant Digicolor Platforms Device Tree Bindings
+
+maintainers:
+  - Baruch Siach <baruch@tkos.co.il>
+
+properties:
+  compatible:
+    const: cnxt,cx92755
+
+...
-- 
2.20.1
