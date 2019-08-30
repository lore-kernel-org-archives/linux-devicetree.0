From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH v3 02/16] dt-bindings: arm: Convert Marvell MMP board/soc
 bindings to json-schema
Date: Sat, 31 Aug 2019 00:07:29 +0200
Message-ID: <20190830220743.439670-3-lkundrak@v3.sk>
References: <20190830220743.439670-1-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190830220743.439670-1-lkundrak@v3.sk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "To : Olof Johansson" <olof@lixom.net>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Russell King <linux@armlinux.org.uk>, Kishon Vijay Abraham I <kishon@ti.com>, Lubomir Rintel <lkundrak@v3.sk>, "Cc : Rob Herring" <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Convert Marvell MMP SoC bindings to DT schema format using json-schema.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>

---
Changes since v2:
- Add mrvl,pxa910
- s/MMP2 Brownstone Board/MMP2 based boards/

Changes since v1:
- Added this patch

 .../devicetree/bindings/arm/mrvl/mrvl.txt     | 14 --------
 .../devicetree/bindings/arm/mrvl/mrvl.yaml    | 32 +++++++++++++++++++
 2 files changed, 32 insertions(+), 14 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/mrvl/mrvl.txt
 create mode 100644 Documentation/devicetree/bindings/arm/mrvl/mrvl.yaml

diff --git a/Documentation/devicetree/bindings/arm/mrvl/mrvl.txt b/Documentation/devicetree/bindings/arm/mrvl/mrvl.txt
deleted file mode 100644
index 951687528efb0..0000000000000
--- a/Documentation/devicetree/bindings/arm/mrvl/mrvl.txt
+++ /dev/null
@@ -1,14 +0,0 @@
-Marvell Platforms Device Tree Bindings
-----------------------------------------------------
-
-PXA168 Aspenite Board
-Required root node properties:
-	- compatible = "mrvl,pxa168-aspenite", "mrvl,pxa168";
-
-PXA910 DKB Board
-Required root node properties:
-	- compatible = "mrvl,pxa910-dkb";
-
-MMP2 Brownstone Board
-Required root node properties:
-	- compatible = "mrvl,mmp2-brownstone", "mrvl,mmp2";
diff --git a/Documentation/devicetree/bindings/arm/mrvl/mrvl.yaml b/Documentation/devicetree/bindings/arm/mrvl/mrvl.yaml
new file mode 100644
index 0000000000000..ef59d6e35bb66
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/mrvl/mrvl.yaml
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/mrvl/mrvl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Marvell Platforms Device Tree Bindings
+
+maintainers:
+  - Lubomir Rintel <lkundrak@v3.sk>
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - description: PXA168 Aspenite Board
+        items:
+          - enum:
+              - mrvl,pxa168-aspenite
+          - const: mrvl,pxa168
+      - description: PXA910 DKB Board
+        items:
+          - enum:
+              - mrvl,pxa910-dkb
+          - const: mrvl,pxa910
+      - description: MMP2 based boards
+        items:
+          - enum:
+              - mrvl,mmp2-brownstone
+          - const: mrvl,mmp2
+...
-- 
2.21.0
