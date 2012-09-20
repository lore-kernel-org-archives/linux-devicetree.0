From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [PATCH v2] dt: Document general interrupt controller bindings
Date: Thu, 20 Sep 2012 14:16:50 +0200
Message-ID: <1348143410-32656-1-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Linus Walleij <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

In order to use a device as interrupt controller, it needs to be marked
with the DT interrupt-controller property. This commit adds rudimentary
documentation about the required standard properties and describes the
most commonly used interrupt specifiers.

Cc: Linus Walleij <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
---
Changes in v2:
- update interrupt client description as per Stephen's suggestions
- use an example for the two cell specifier where both the client and
  the parent use two cell specifiers, as suggested by Rob, to reduce
  the possibility for confusion

 .../bindings/interrupt-controller/interrupts.txt   | 95 ++++++++++++++++++++++
 1 file changed, 95 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/interrupts.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/interrupts.txt b/Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
new file mode 100644
index 0000000..72a06c0
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
@@ -0,0 +1,95 @@
+Specifying interrupt information for devices
+============================================
+
+1) Interrupt client nodes
+-------------------------
+
+Nodes that describe devices which generate interrupts must contain an
+"interrupts" property. This property must contain a list of interrupt
+specifiers, one per output interrupt. The format of the interrupt specifier is
+determined by the interrupt controller to which the interrupts are routed; see
+section 2 below for details.
+
+The "interrupt-parent" property is used to specify the controller to which
+interrupts are routed and contains a single phandle referring to the interrupt
+controller node. This property is inherited, so it may be specified in an
+interrupt client node or in any of its parent nodes.
+
+2) Interrupt controller nodes
+-----------------------------
+
+A device is marked as an interrupt controller with the "interrupt-controller"
+property. This is a empty, boolean property. An additional "#interrupt-cells"
+property defines the number of cells needed to specify a single interrupt.
+
+It is the responsibility of the interrupt controller's binding to define the
+length and format of the interrupt specifier. The following two variants are
+commonly used:
+
+  a) one cell
+  -----------
+  The #interrupt-cells property is set to 1 and the single cell defines the
+  index of the interrupt within the controller.
+
+  Example:
+
+	vic: intc@10140000 {
+		compatible = "arm,versatile-vic";
+		interrupt-controller;
+		#interrupt-cells = <1>;
+		reg = <0x10140000 0x1000>;
+	};
+
+	sic: intc@10003000 {
+		compatible = "arm,versatile-sic";
+		interrupt-controller;
+		#interrupt-cells = <1>;
+		reg = <0x10003000 0x1000>;
+		interrupt-parent = <&vic>;
+		interrupts = <31>; /* Cascaded to vic */
+	};
+
+  b) two cells
+  ------------
+  The #interrupt-cells property is set to 2 and the first cell defines the
+  index of the interrupt within the controller, while the second cell is used
+  to specify any of the following flags:
+    - bits[3:0] trigger type and level flags
+        1 = low-to-high edge triggered
+        2 = high-to-low edge triggered
+        4 = active high level-sensitive
+        8 = active low level-sensitive
+
+  Example:
+
+	i2c@7000c000 {
+		gpioext: gpio-adnp@41 {
+			compatible = "ad,gpio-adnp";
+			reg = <0x41>;
+
+			interrupt-parent = <&gpio>;
+			interrupts = <160 1>;
+
+			gpio-controller;
+			#gpio-cells = <1>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+
+			nr-gpios = <64>;
+		};
+
+		sx8634@2b {
+			compatible = "smtc,sx8634";
+			reg = <0x2b>;
+
+			interrupt-parent = <&gpioext>;
+			interrupts = <3 0x8>;
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			threshold = <0x40>;
+			sensitivity = <7>;
+		};
+	};
-- 
1.7.12
