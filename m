From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: [PATCH v2 1/5] dt-bindings: media: Add Allwinner A10 CSI binding
Date: Mon, 28 Jan 2019 15:52:32 +0100
Message-ID: <f6b6adf84c58e0de605d0a23dd559fee011f380c.1548687041.git-series.maxime.ripard@bootlin.com>
References: <cover.ba7411f0c7155d0292b38d3dec698e26b5cc813b.1548687041.git-series.maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.ba7411f0c7155d0292b38d3dec698e26b5cc813b.1548687041.git-series.maxime.ripard@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans Verkuil <hans.verkuil@cisco.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>, Chen-Yu Tsai <wens@csie.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Maxime Ripard <maxime.ripard@bootlin.com>
List-Id: devicetree@vger.kernel.org

The Allwinner A10 CMOS Sensor Interface is a camera capture interface also
used in later (A10s, A13, A20, R8 and GR8) SoCs.

On some SoCs, like the A10, there's multiple instances of that controller,
with one instance supporting more channels and having an ISP.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml | 73 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 73 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml

diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
new file mode 100644
index 000000000000..f550fefa074f
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0+ OR X11)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/allwinner,sun4i-a10-csi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner A10 CMOS Sensor Interface (CSI) Device Tree Bindings
+
+maintainers:
+  - Chen-Yu Tsai <wens@csie.org>
+  - Maxime Ripard <maxime.ripard@bootlin.com>
+
+properties:
+  compatible:
+    oneOf:
+      - description: Allwinner A10 CSI0 Controller
+        items:
+        - const: allwinner,sun4i-a10-csi0
+
+      - description: Allwinner A20 CSI0 Controller
+        items:
+        - const: allwinner,sun7i-a20-csi0
+        - const: allwinner,sun4i-a10-csi0
+
+  reg:
+    description: The base address and size of the memory-mapped region
+    maxItems: 1
+
+  interrupts:
+    description: The interrupt associated to this IP
+    maxItems: 1
+
+  clocks:
+    minItems: 4
+    maxItems: 4
+    items:
+      - description: The CSI interface clock
+      - description: The CSI module clock
+      - description: The CSI ISP clock
+      - description: The CSI DRAM clock
+
+  clock-names:
+    minItems: 4
+    maxItems: 4
+    items:
+      - const: bus
+      - const: mod
+      - const: isp
+      - const: ram
+
+  resets:
+    description: The reset line driver this IP
+    maxItems: 1
+
+  pinctrl-0: true
+
+  pinctrl-names:
+    description:
+      When present, must have one state named "default" that sets up
+      pins for ordinary operations.
+    minItems: 1
+    maxItems: 1
+    items:
+      - const: default
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+# The media OF-graph binding hasn't been described yet
+# additionalProperties: false
-- 
git-series 0.9.1
