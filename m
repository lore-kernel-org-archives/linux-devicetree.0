From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH v2 02/20] dt-bindings: arm: Convert Marvell MMP board/soc bindings to json-schema
Date: Thu, 22 Aug 2019 11:26:25 +0200
Message-ID: <20190822092643.593488-3-lkundrak@v3.sk>
References: <20190822092643.593488-1-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190822092643.593488-1-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Russell King <linux@armlinux.org.uk>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>
List-Id: devicetree@vger.kernel.org

Convert Marvell MMP SoC bindings to DT schema format using json-schema.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>

---
Changes since v1:
- Added this patch

 .../devicetree/bindings/arm/mrvl/mrvl.txt     | 14 ---------
 .../devicetree/bindings/arm/mrvl/mrvl.yaml    | 31 +++++++++++++++++++
 2 files changed, 31 insertions(+), 14 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/mrvl/mrvl.txt
 create mode 100644 Documentation/devicetree/bindings/arm/mrvl/mrvl.yaml

diff --git a/Documentation/devicetree/bindings/arm/mrvl/mrvl.txt b/Docume=
ntation/devicetree/bindings/arm/mrvl/mrvl.txt
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
-	- compatible =3D "mrvl,pxa168-aspenite", "mrvl,pxa168";
-
-PXA910 DKB Board
-Required root node properties:
-	- compatible =3D "mrvl,pxa910-dkb";
-
-MMP2 Brownstone Board
-Required root node properties:
-	- compatible =3D "mrvl,mmp2-brownstone", "mrvl,mmp2";
diff --git a/Documentation/devicetree/bindings/arm/mrvl/mrvl.yaml b/Docum=
entation/devicetree/bindings/arm/mrvl/mrvl.yaml
new file mode 100644
index 0000000000000..dc9de506ac6e3
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/mrvl/mrvl.yaml
@@ -0,0 +1,31 @@
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
+      - description: MMP2 Brownstone Board
+        items:
+          - enum:
+              - mrvl,mmp2-brownstone
+          - const: mrvl,mmp2
+...
--=20
2.21.0
