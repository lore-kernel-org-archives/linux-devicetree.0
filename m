From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 16/21] dt-bindings: marvell: Convert the SoC compatibles
 description to YAML
Date: Fri,  4 Oct 2019 16:27:33 +0200
Message-ID: <20191004142738.7370-17-miquel.raynal@bootlin.com>
References: <20191004142738.7370-1-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20191004142738.7370-1-miquel.raynal@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, Yan Markman <ymarkman@marvell.com>, Antoine Tenart <antoine.tenart@bootlin.com>, Grzegorz Jaszczyk <jaz@semihalf.com>, Gregory Clement <gregory.clement@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Stefan Chulski <stefanc@marvell.com>, Marcin Wojtas <mw@semihalf.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Convert the file detailing Marvell EBU compatibles to json-schema.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 .../bindings/arm/marvell/armada-7k-8k.txt     | 24 -----------
 .../bindings/arm/marvell/armada-7k-8k.yaml    | 40 +++++++++++++++++++
 2 files changed, 40 insertions(+), 24 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.txt
 create mode 100644 Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml

diff --git a/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.txt b/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.txt
deleted file mode 100644
index df98a9c82a8c..000000000000
--- a/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.txt
+++ /dev/null
@@ -1,24 +0,0 @@
-Marvell Armada 7K/8K Platforms Device Tree Bindings
----------------------------------------------------
-
-Boards using a SoC of the Marvell Armada 7K or 8K families must carry
-the following root node property:
-
- - compatible, with one of the following values:
-
-   - "marvell,armada7020", "marvell,armada-ap806-dual", "marvell,armada-ap806"
-      when the SoC being used is the Armada 7020
-
-   - "marvell,armada7040", "marvell,armada-ap806-quad", "marvell,armada-ap806"
-      when the SoC being used is the Armada 7040
-
-   - "marvell,armada8020", "marvell,armada-ap806-dual", "marvell,armada-ap806"
-      when the SoC being used is the Armada 8020
-
-   - "marvell,armada8040", "marvell,armada-ap806-quad", "marvell,armada-ap806"
-      when the SoC being used is the Armada 8040
-
-Example:
-
-compatible = "marvell,armada7040-db", "marvell,armada7040",
-             "marvell,armada-ap806-quad", "marvell,armada-ap806";
diff --git a/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml b/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml
new file mode 100644
index 000000000000..294595e00028
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0+ OR X11)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/marvell/armada-7k-8k.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Marvell Armada 7K/8K Platforms Device Tree Bindings
+
+maintainers:
+  - Gregory CLEMENT <gregory.clement@bootlin.com>
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+
+      - description: Armada 7020 SoC
+        items:
+          - const: marvell,armada7020
+          - const: marvell,armada-ap806-dual
+          - const: marvell,armada-ap806
+
+      - description: Armada 7040 SoC
+        items:
+          - const: marvell,armada7040
+          - const: marvell,armada-ap806-quad
+          - const: marvell,armada-ap806
+
+      - description: Armada 8020 SoC
+        items:
+          - const: marvell,armada8020
+          - const: marvell,armada-ap806-dual
+          - const: marvell,armada-ap806
+
+      - description: Armada 8040 SoC
+        items:
+          - const: marvell,armada8040
+          - const: marvell,armada-ap806-quad
+          - const: marvell,armada-ap806
-- 
2.20.1
