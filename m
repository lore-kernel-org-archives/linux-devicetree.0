From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: [PATCH 3/6] dt-bindings: usb: Convert the generic EHCI binding to YAML
Date: Tue, 16 Apr 2019 10:27:59 +0200
Message-ID: <727ef2282a2243ed5bd9eddb6c0f6d35371b792d.1555403233.git-series.maxime.ripard@bootlin.com>
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

The generic EHCI binding is used by many controllers that are using the
EHCI spec.

Convert that binding to a YAML description to enable the validation on all
the nodes using that binding.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 Documentation/devicetree/bindings/usb/generic-ehci.yaml | 95 ++++++++++-
 Documentation/devicetree/bindings/usb/usb-ehci.txt      | 46 +-----
 2 files changed, 95 insertions(+), 46 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/generic-ehci.yaml
 delete mode 100644 Documentation/devicetree/bindings/usb/usb-ehci.txt

diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
new file mode 100644
index 000000000000..d3b4f6415920
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
@@ -0,0 +1,95 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: USB EHCI Controller Device Tree Bindings
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
+      const: generic-ehci
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  resets:
+    minItems: 1
+    maxItems: 4
+
+  clocks:
+    minItems: 1
+    maxItems: 4
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
+  has-transaction-translator:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Set this flag if EHCI has a Transaction Translator built into
+      the root hub.
+
+  needs-reset-on-resume:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Set this flag to force EHCI reset after resume.
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
+    ehci@e0000300 {
+        compatible = "ibm,usb-ehci-440epx", "generic-ehci";
+        interrupt-parent = <&UIC0>;
+        interrupts = <0x1a 4>;
+        reg = <0 0xe0000300 90 0 0xe0000390 70>;
+        big-endian;
+    };
+
+  - |
+    ehci0: usb@1c14000 {
+        compatible = "allwinner,sun4i-a10-ehci", "generic-ehci";
+        reg = <0x01c14000 0x100>;
+        interrupts = <39>;
+        clocks = <&ahb_gates 1>;
+        phys = <&usbphy 1>;
+        phy-names = "usb";
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/usb/usb-ehci.txt b/Documentation/devicetree/bindings/usb/usb-ehci.txt
deleted file mode 100644
index 406252d14c6b..000000000000
--- a/Documentation/devicetree/bindings/usb/usb-ehci.txt
+++ /dev/null
@@ -1,46 +0,0 @@
-USB EHCI controllers
-
-Required properties:
-  - compatible : should be "generic-ehci".
-  - reg : should contain at least address and length of the standard EHCI
-    register set for the device. Optional platform-dependent registers
-    (debug-port or other) can be also specified here, but only after
-    definition of standard EHCI registers.
-  - interrupts : one EHCI interrupt should be described here.
-
-Optional properties:
- - big-endian-regs : boolean, set this for hcds with big-endian registers
- - big-endian-desc : boolean, set this for hcds with big-endian descriptors
- - big-endian : boolean, for hcds with big-endian-regs + big-endian-desc
- - needs-reset-on-resume : boolean, set this to force EHCI reset after resume
- - has-transaction-translator : boolean, set this if EHCI have a Transaction
-				Translator built into the root hub.
- - clocks : a list of phandle + clock specifier pairs. In case of Renesas
-	    R-Car Gen3 SoCs:
-	    - if a host only channel: first clock should be host.
-	    - if a USB DRD channel: first clock should be host and second one
-				    should be peripheral.
- - phys : see usb-hcd.txt in the current directory
- - resets : phandle + reset specifier pair
-
-additionally the properties from usb-hcd.txt (in the current directory) are
-supported.
-
-Example (Sequoia 440EPx):
-    ehci@e0000300 {
-	   compatible = "ibm,usb-ehci-440epx", "usb-ehci";
-	   interrupt-parent = <&UIC0>;
-	   interrupts = <1a 4>;
-	   reg = <0 e0000300 90 0 e0000390 70>;
-	   big-endian;
-   };
-
-Example (Allwinner sun4i A10 SoC):
-   ehci0: usb@1c14000 {
-	   compatible = "allwinner,sun4i-a10-ehci", "generic-ehci";
-	   reg = <0x01c14000 0x100>;
-	   interrupts = <39>;
-	   clocks = <&ahb_gates 1>;
-	   phys = <&usbphy 1>;
-	   phy-names = "usb";
-   };
-- 
git-series 0.9.1
