From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: [PATCH 2/6] dt-bindings: usb: Convert the generic OHCI binding to YAML
Date: Tue, 16 Apr 2019 10:27:58 +0200
Message-ID: <d4f50759de223b4f7d57779d3df21a4408a935af.1555403233.git-series.maxime.ripard@bootlin.com>
References: <d930537cfe3124de37b8ecf4eaa02b68ec94cb40.1555403233.git-series.maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <d930537cfe3124de37b8ecf4eaa02b68ec94cb40.1555403233.git-series.maxime.ripard@bootlin.com>
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

The generic OHCI binding is used by many controllers that are using the
OHCI spec.

Convert that binding to a YAML description to enable the validation on all
the nodes using that binding.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 Documentation/devicetree/bindings/usb/generic-ohci.yaml | 89 ++++++++++-
 Documentation/devicetree/bindings/usb/usb-ohci.txt      | 35 +----
 2 files changed, 89 insertions(+), 35 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/generic-ohci.yaml
 delete mode 100644 Documentation/devicetree/bindings/usb/usb-ohci.txt

diff --git a/Documentation/devicetree/bindings/usb/generic-ohci.yaml b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
new file mode 100644
index 000000000000..da5a14becbe5
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
@@ -0,0 +1,89 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/generic-ohci.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: USB OHCI Controller Device Tree Bindings
+
+allOf:
+  - $ref: "usb-hcd.yaml"
+
+maintainers:
+  - Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+
+properties:
+  compatible:
+    contains:
+      const: generic-ohci
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  resets:
+    minItems: 1
+    maxItems: 2
+
+  clocks:
+    minItems: 1
+    maxItems: 3
+    description: |
+      In case the Renesas R-Car Gen3 SoCs:
+        - if a host only channel: first clock should be host.
+        - if a USB DRD channel: first clock should be host and second
+          one should be peripheral
+
+  big-endian:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Set this flag for HCDs with big endian descriptors and big
+      endian registers.
+
+  big-endian-desc:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Set this flag for HCDs with big endian descriptors.
+
+  big-endian-regs:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Set this flag for HCDs with big endian registers.
+
+  remote-wakeup-connected:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Remote wakeup is wired on the platform.
+
+  no-big-frame-no:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Set if frame_no lives in bits [15:0] of HCCA
+
+  num-ports:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Overrides the detected port count
+
+  phys: true
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
+      ohci0: usb@1c14400 {
+          compatible = "allwinner,sun4i-a10-ohci", "generic-ohci";
+          reg = <0x01c14400 0x100>;
+          interrupts = <64>;
+          clocks = <&usb_clk 6>, <&ahb_gates 2>;
+          phys = <&usbphy 1>;
+      };
+
+...
diff --git a/Documentation/devicetree/bindings/usb/usb-ohci.txt b/Documentation/devicetree/bindings/usb/usb-ohci.txt
deleted file mode 100644
index aaaa5255c972..000000000000
--- a/Documentation/devicetree/bindings/usb/usb-ohci.txt
+++ /dev/null
@@ -1,35 +0,0 @@
-USB OHCI controllers
-
-Required properties:
-- compatible : "generic-ohci"
-- reg : ohci controller register range (address and length)
-- interrupts : ohci controller interrupt
-
-Optional properties:
-- big-endian-regs : boolean, set this for hcds with big-endian registers
-- big-endian-desc : boolean, set this for hcds with big-endian descriptors
-- big-endian : boolean, for hcds with big-endian-regs + big-endian-desc
-- no-big-frame-no : boolean, set if frame_no lives in bits [15:0] of HCCA
-- remote-wakeup-connected: remote wakeup is wired on the platform
-- num-ports : u32, to override the detected port count
-- clocks : a list of phandle + clock specifier pairs. In case of Renesas
-	   R-Car Gen3 SoCs:
-	   - if a host only channel: first clock should be host.
-	   - if a USB DRD channel: first clock should be host and second one
-				   should be peripheral.
-- phys : see usb-hcd.txt in the current directory
-- resets : a list of phandle + reset specifier pairs
-
-additionally the properties from usb-hcd.txt (in the current directory) are
-supported.
-
-Example:
-
-	ohci0: usb@1c14400 {
-		compatible = "allwinner,sun4i-a10-ohci", "generic-ohci";
-		reg = <0x01c14400 0x100>;
-		interrupts = <64>;
-		clocks = <&usb_clk 6>, <&ahb_gates 2>;
-		phys = <&usbphy 1>;
-		phy-names = "usb";
-	};
-- 
git-series 0.9.1
