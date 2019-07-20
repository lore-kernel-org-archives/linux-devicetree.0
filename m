From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: [PATCH v3 1/3] dt-bindings: dma: Add YAML schemas for the generic DMA
 bindings
Date: Sat, 20 Jul 2019 11:26:05 +0200
Message-ID: <20190720092607.31095-1-maxime.ripard@bootlin.com>
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
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Vinod Koul <vkoul@kernel.org>
Cc: devicetree@vger.kernel.org, Maxime Ripard <maxime.ripard@bootlin.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Chen-Yu Tsai <wens@csie.org>, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The DMA controllers and consumers have a bunch of generic properties that
are needed in a device tree. Add a YAML schemas for those.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>

---

Changes from v2:
  - Added a select statement.

Changes from v1:
  - Dropped the dma consumer schemas
  - Fixed the node name of the examples
  - Enhanced a bit the description for dma-requests in case of a router
  - Split the bindings in two to handle the router and controller case
    separately
  - Made #dma-cells required
---
 .../devicetree/bindings/dma/dma-common.yaml   |  45 +++++++
 .../bindings/dma/dma-controller.yaml          |  35 ++++++
 .../devicetree/bindings/dma/dma-router.yaml   |  50 ++++++++
 Documentation/devicetree/bindings/dma/dma.txt | 114 +-----------------
 4 files changed, 131 insertions(+), 113 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/dma/dma-common.yaml
 create mode 100644 Documentation/devicetree/bindings/dma/dma-controller.yaml
 create mode 100644 Documentation/devicetree/bindings/dma/dma-router.yaml

diff --git a/Documentation/devicetree/bindings/dma/dma-common.yaml b/Documentation/devicetree/bindings/dma/dma-common.yaml
new file mode 100644
index 000000000000..0141af047820
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/dma-common.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/dma-common.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: DMA Engine Generic Binding
+
+maintainers:
+  - Vinod Koul <vkoul@kernel.org>
+
+description:
+  Generic binding to provide a way for a driver using DMA Engine to
+  retrieve the DMA request or channel information that goes from a
+  hardware device to a DMA controller.
+
+select: false
+
+properties:
+  "#dma-cells":
+    minimum: 1
+    # Should be enough
+    maximum: 255
+    description:
+      Used to provide DMA controller specific information.
+
+  dma-channel-masks:
+    $ref: /schemas/types.yaml#definitions/uint32
+    description:
+      Bitmask of available DMA channels in ascending order that are
+      not reserved by firmware and are available to the
+      kernel. i.e. first channel corresponds to LSB.
+
+  dma-channels:
+    $ref: /schemas/types.yaml#definitions/uint32
+    description:
+      Number of DMA channels supported by the controller.
+
+  dma-requests:
+    $ref: /schemas/types.yaml#definitions/uint32
+    description:
+      Number of DMA request signals supported by the controller.
+
+required:
+  - "#dma-cells"
diff --git a/Documentation/devicetree/bindings/dma/dma-controller.yaml b/Documentation/devicetree/bindings/dma/dma-controller.yaml
new file mode 100644
index 000000000000..c39f6de76670
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/dma-controller.yaml
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/dma-controller.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: DMA Controller Generic Binding
+
+maintainers:
+  - Vinod Koul <vkoul@kernel.org>
+
+allOf:
+  - $ref: "dma-common.yaml#"
+
+# Everything else is described in the common file
+properties:
+  $nodename:
+    pattern: "^dma-controller(@.*)?$"
+
+examples:
+  - |
+    dma: dma-controller@48000000 {
+        compatible = "ti,omap-sdma";
+        reg = <0x48000000 0x1000>;
+        interrupts = <0 12 0x4
+                      0 13 0x4
+                      0 14 0x4
+                      0 15 0x4>;
+        #dma-cells = <1>;
+        dma-channels = <32>;
+        dma-requests = <127>;
+        dma-channel-mask = <0xfffe>;
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/dma/dma-router.yaml b/Documentation/devicetree/bindings/dma/dma-router.yaml
new file mode 100644
index 000000000000..5b5f07393135
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/dma-router.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/dma-router.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: DMA Router Generic Binding
+
+maintainers:
+  - Vinod Koul <vkoul@kernel.org>
+
+allOf:
+  - $ref: "dma-common.yaml#"
+
+description:
+  DMA routers are transparent IP blocks used to route DMA request
+  lines from devices to the DMA controller. Some SoCs (like TI DRA7x)
+  have more peripherals integrated with DMA requests than what the DMA
+  controller can handle directly.
+
+properties:
+  $nodename:
+    pattern: "^dma-router(@.*)?$"
+
+  dma-masters:
+    $ref: /schemas/types.yaml#definitions/phandle-array
+    description:
+      Array of phandles to the DMA controllers the router can direct
+      the signal to.
+
+  dma-requests:
+    description:
+      Number of incoming request lines the router can handle.
+
+required:
+  - "#dma-cells"
+  - dma-masters
+
+examples:
+  - |
+    sdma_xbar: dma-router@4a002b78 {
+        compatible = "ti,dra7-dma-crossbar";
+        reg = <0x4a002b78 0xfc>;
+        #dma-cells = <1>;
+        dma-requests = <205>;
+        ti,dma-safe-map = <0>;
+        dma-masters = <&sdma>;
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/dma/dma.txt b/Documentation/devicetree/bindings/dma/dma.txt
index eeb4e4d1771e..90a67a016a48 100644
--- a/Documentation/devicetree/bindings/dma/dma.txt
+++ b/Documentation/devicetree/bindings/dma/dma.txt
@@ -1,113 +1 @@
-* Generic DMA Controller and DMA request bindings
-
-Generic binding to provide a way for a driver using DMA Engine to retrieve the
-DMA request or channel information that goes from a hardware device to a DMA
-controller.
-
-
-* DMA controller
-
-Required property:
-- #dma-cells: 		Must be at least 1. Used to provide DMA controller
-			specific information. See DMA client binding below for
-			more details.
-
-Optional properties:
-- dma-channels: 	Number of DMA channels supported by the controller.
-- dma-requests: 	Number of DMA request signals supported by the
-			controller.
-- dma-channel-mask:	Bitmask of available DMA channels in ascending order
-			that are not reserved by firmware and are available to
-			the kernel. i.e. first channel corresponds to LSB.
-
-Example:
-
-	dma: dma@48000000 {
-		compatible = "ti,omap-sdma";
-		reg = <0x48000000 0x1000>;
-		interrupts = <0 12 0x4
-			      0 13 0x4
-			      0 14 0x4
-			      0 15 0x4>;
-		#dma-cells = <1>;
-		dma-channels = <32>;
-		dma-requests = <127>;
-		dma-channel-mask = <0xfffe>
-	};
-
-* DMA router
-
-DMA routers are transparent IP blocks used to route DMA request lines from
-devices to the DMA controller. Some SoCs (like TI DRA7x) have more peripherals
-integrated with DMA requests than what the DMA controller can handle directly.
-
-Required property:
-- dma-masters:		phandle of the DMA controller or list of phandles for
-			the DMA controllers the router can direct the signal to.
-- #dma-cells: 		Must be at least 1. Used to provide DMA router specific
-			information. See DMA client binding below for more
-			details.
-
-Optional properties:
-- dma-requests: 	Number of incoming request lines the router can handle.
-- In the node pointed by the dma-masters:
-	- dma-requests:	The router driver might need to look for this in order
-			to configure the routing.
-
-Example:
-	sdma_xbar: dma-router@4a002b78 {
-		compatible = "ti,dra7-dma-crossbar";
-		reg = <0x4a002b78 0xfc>;
-		#dma-cells = <1>;
-		dma-requests = <205>;
-		ti,dma-safe-map = <0>;
-		dma-masters = <&sdma>;
-	};
-
-* DMA client
-
-Client drivers should specify the DMA property using a phandle to the controller
-followed by DMA controller specific data.
-
-Required property:
-- dmas:			List of one or more DMA specifiers, each consisting of
-			- A phandle pointing to DMA controller node
-			- A number of integer cells, as determined by the
-			  #dma-cells property in the node referenced by phandle
-			  containing DMA controller specific information. This
-			  typically contains a DMA request line number or a
-			  channel number, but can contain any data that is
-			  required for configuring a channel.
-- dma-names: 		Contains one identifier string for each DMA specifier in
-			the dmas property. The specific strings that can be used
-			are defined in the binding of the DMA client device.
-			Multiple DMA specifiers can be used to represent
-			alternatives and in this case the dma-names for those
-			DMA specifiers must be identical (see examples).
-
-Examples:
-
-1. A device with one DMA read channel, one DMA write channel:
-
-	i2c1: i2c@1 {
-		...
-		dmas = <&dma 2		/* read channel */
-			&dma 3>;	/* write channel */
-		dma-names = "rx", "tx";
-		...
-	};
-
-2. A single read-write channel with three alternative DMA controllers:
-
-	dmas = <&dma1 5
-		&dma2 7
-		&dma3 2>;
-	dma-names = "rx-tx", "rx-tx", "rx-tx";
-
-3. A device with three channels, one of which has two alternatives:
-
-	dmas = <&dma1 2			/* read channel */
-		&dma1 3			/* write channel */
-		&dma2 0			/* error read */
-		&dma3 0>;		/* alternative error read */
-	dma-names = "rx", "tx", "error", "error";
+This file has been moved to dma-controller.yaml.
-- 
2.21.0
