From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [PATCH 1/2] dt: Document general interrupt controller bindings
Date: Wed, 19 Sep 2012 10:57:35 +0200
Message-ID: <1348045056-29769-1-git-send-email-thierry.reding@avionic-design.de>
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Linus Walleij <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

In order to use a device as interrupt controller, it needs to be marked
with the DT interrupt-controller property. This commit adds rudimentary
documentation about the required standard properties and describes the
most commonly used interrupt specifiers.

Cc: Linus Walleij <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
---
This patch is for Rob's tree as it documents the general bindings.

 .../bindings/interrupt-controller/interrupts.txt   | 94 ++++++++++++++++++++++
 1 file changed, 94 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/interrupts.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/interrupts.txt b/Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
new file mode 100644
index 0000000..6cafe3a
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
@@ -0,0 +1,94 @@
+Specifying interrupt information for devices
+============================================
+
+1) Interrupt user nodes
+-----------------------
+
+A device that generates interrupts can specify the interrupt controller to
+which the interrupts are routed by passing the controller's phandle in the
+"interrupt-parent" property.
+
+The "interrupts" property is a list of specifiers that describe each of the
+interrupts. See section 2 below for details.
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
+	gpio: gpio {
+		compatible = "nvidia,tegra20-gpio";
+		reg = <0x6000d000 0x1000>;
+		interrupts = <0 32 0x04
+			      0 33 0x04
+			      0 34 0x04
+			      0 35 0x04
+			      0 55 0x04
+			      0 87 0x04
+			      0 89 0x04>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+	};
+
+	i2c@7000c000 {
+		status = "okay";
+		clock-frequency = <400000>;
+
+		wm8903: wm8903@1a {
+			compatible = "wlf,wm8903";
+			reg = <0x1a>;
+			interrupt-parent = <&gpio>;
+			interrupts = <187 0x04>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			micdet-cfg = <0>;
+			micdet-delay = <100>;
+			gpio-cfg = <0xffffffff 0xffffffff 0 0xffffffff 0xffffffff>;
+		};
+	};
-- 
1.7.12
