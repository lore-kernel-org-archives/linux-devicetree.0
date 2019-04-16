From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: [PATCH 1/6] dt-bindings: usb: Convert USB HCD generic binding to YAML
Date: Tue, 16 Apr 2019 10:27:57 +0200
Message-ID: <d930537cfe3124de37b8ecf4eaa02b68ec94cb40.1555403233.git-series.maxime.ripard@bootlin.com>
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
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Maxime Ripard <maxime.ripard@bootlin.com>, linux-usb@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The USB HCD generic binding is used by many USB host bindings.

In order to allow the DT validation to happen on those, let's create a YAML
description for that generic binding that can be referenced later on.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 Documentation/devicetree/bindings/usb/usb-hcd.txt  |  9 +-----
 Documentation/devicetree/bindings/usb/usb-hcd.yaml | 25 +++++++++++++++-
 2 files changed, 25 insertions(+), 9 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/usb/usb-hcd.txt
 create mode 100644 Documentation/devicetree/bindings/usb/usb-hcd.yaml

diff --git a/Documentation/devicetree/bindings/usb/usb-hcd.txt b/Documentation/devicetree/bindings/usb/usb-hcd.txt
deleted file mode 100644
index 50529b838c9c..000000000000
--- a/Documentation/devicetree/bindings/usb/usb-hcd.txt
+++ /dev/null
@@ -1,9 +0,0 @@
-Generic USB HCD (Host Controller Device) Properties
-
-Optional properties:
-- phys: a list of all USB PHYs on this HCD
-
-Example:
-	&usb1 {
-		phys = <&usb2_phy1>, <&usb3_phy1>;
-	};
diff --git a/Documentation/devicetree/bindings/usb/usb-hcd.yaml b/Documentation/devicetree/bindings/usb/usb-hcd.yaml
new file mode 100644
index 000000000000..9c8c56d3a792
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/usb-hcd.yaml
@@ -0,0 +1,25 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/usb-hcd.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic USB Host Controller Device Tree Bindings
+
+maintainers:
+  - Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+
+properties:
+  $nodename:
+    pattern: "^usb(@.*)?"
+
+  phys:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      List of all the USB PHYs on this HCD
+
+examples:
+  - |
+    usb {
+        phys = <&usb2_phy1>, <&usb3_phy1>;
+    };

base-commit: f9221a7a1014d8a047b277a73289678646ddc110
-- 
git-series 0.9.1
