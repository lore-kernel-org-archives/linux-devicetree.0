From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: [PATCH v2 03/11] dt-bindings: rtc: Convert Allwinner A10 RTC to a
 schema
Date: Tue, 28 May 2019 22:30:33 +0200
Message-ID: <c9598ec7e668303e62c5e533f98096ca22d847aa.1559075389.git-series.maxime.ripard@bootlin.com>
References: <434446bc5541d7dfe5823874355c7db8c7e213fa.1559075389.git-series.maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <434446bc5541d7dfe5823874355c7db8c7e213fa.1559075389.git-series.maxime.ripard@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@bootlin.com>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The older Allwinner SoCs have an embedded RTC supported in Linux, with a
matching Device Tree binding.

Now that we have the DT validation in place, let's convert the device tree
bindings for that controller over to a YAML schemas.

Acked-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 Documentation/devicetree/bindings/rtc/allwinner,sun4i-a10-rtc.yaml | 43 +++++++++++++++++++++++++++++++++++++++++++
 Documentation/devicetree/bindings/rtc/sunxi-rtc.txt                | 17 -----------------
 2 files changed, 43 insertions(+), 17 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/rtc/allwinner,sun4i-a10-rtc.yaml
 delete mode 100644 Documentation/devicetree/bindings/rtc/sunxi-rtc.txt

diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun4i-a10-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun4i-a10-rtc.yaml
new file mode 100644
index 000000000000..46d69c32b89b
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/allwinner,sun4i-a10-rtc.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/allwinner,sun4i-a10-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner A10 RTC Device Tree Bindings
+
+allOf:
+  - $ref: "rtc.yaml#"
+
+maintainers:
+  - Chen-Yu Tsai <wens@csie.org>
+  - Maxime Ripard <maxime.ripard@bootlin.com>
+
+properties:
+  compatible:
+    enum:
+      - allwinner,sun4i-a10-rtc
+      - allwinner,sun7i-a20-rtc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    rtc: rtc@1c20d00 {
+        compatible = "allwinner,sun4i-a10-rtc";
+        reg = <0x01c20d00 0x20>;
+        interrupts = <24>;
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/rtc/sunxi-rtc.txt b/Documentation/devicetree/bindings/rtc/sunxi-rtc.txt
deleted file mode 100644
index 4a8d79c1cf08..000000000000
--- a/Documentation/devicetree/bindings/rtc/sunxi-rtc.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-* sun4i/sun7i Real Time Clock
-
-RTC controller for the Allwinner A10/A20
-
-Required properties:
-- compatible : Should be "allwinner,sun4i-a10-rtc" or "allwinner,sun7i-a20-rtc"
-- reg: physical base address of the controller and length of memory mapped
-  region.
-- interrupts: IRQ line for the RTC.
-
-Example:
-
-rtc: rtc@1c20d00 {
-	compatible = "allwinner,sun4i-a10-rtc";
-	reg = <0x01c20d00 0x20>;
-	interrupts = <24>;
-};
-- 
git-series 0.9.1
