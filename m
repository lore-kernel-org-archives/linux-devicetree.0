From: Max Filippov <jcmvbkbc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1] irqchip: xtensa-pic: xtensa-mx: document DT bindings
Date: Tue,  7 Oct 2014 00:52:01 +0400
Message-ID: <1412628721-4394-1-git-send-email-jcmvbkbc@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-xtensa-PjhNF2WwrV/0Sa2dR60CXw@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chris Zankel <chris-YvXeqwSYzG2sTnJN9+BGXg@public.gmane.org>, Marc Gauthier <marc-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Max Filippov <jcmvbkbc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Max Filippov <jcmvbkbc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 .../interrupt-controller/cdns,xtensa-mx.txt        | 18 ++++++++++++++++
 .../interrupt-controller/cdns,xtensa-pic.txt       | 25 ++++++++++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/cdns,xtensa-mx.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/cdns,xtensa-pic.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/cdns,xtensa-mx.txt b/Documentation/devicetree/bindings/interrupt-controller/cdns,xtensa-mx.txt
new file mode 100644
index 0000000..d4de980
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/cdns,xtensa-mx.txt
@@ -0,0 +1,18 @@
+* Xtensa Interrupt Distributor and Programmable Interrupt Controller (MX)
+
+Required properties:
+- compatible: Should be "cdns,xtensa-mx".
+
+Remaining properties have exact same meaning as in Xtensa PIC
+(see cdns,xtensa-pic.txt).
+
+Examples:
+	pic: pic {
+		compatible = "cdns,xtensa-mx";
+		/* one cell: internal irq number,
+		 * two cells: second cell == 0: internal irq number
+		 *            second cell == 1: external irq number
+		 */
+		#interrupt-cells = <2>;
+		interrupt-controller;
+	};
diff --git a/Documentation/devicetree/bindings/interrupt-controller/cdns,xtensa-pic.txt b/Documentation/devicetree/bindings/interrupt-controller/cdns,xtensa-pic.txt
new file mode 100644
index 0000000..026ef4c
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/cdns,xtensa-pic.txt
@@ -0,0 +1,25 @@
+* Xtensa built-in Programmable Interrupt Controller (PIC)
+
+Required properties:
+- compatible: Should be "cdns,xtensa-pic".
+- interrupt-controller: Identifies the node as an interrupt controller.
+- #interrupt-cells: The number of cells to define the interrupts.
+  It may be either 1 or 2.
+  When it's 1, the first cell is the internal IRQ number.
+  When it's 2, the first cell is the IRQ number, and the second cell
+  specifies whether it's internal (0) or external (1).
+  Periferals are usually connected to a fixed external IRQ, but for different
+  core variants it may be mapped to different internal IRQ.
+  IRQ sensitivity and priority are fixed for each core variant and may not be
+  changed at runtime.
+
+Examples:
+	pic: pic {
+		compatible = "cdns,xtensa-pic";
+		/* one cell: internal irq number,
+		 * two cells: second cell == 0: internal irq number
+		 *            second cell == 1: external irq number
+		 */
+		#interrupt-cells = <2>;
+		interrupt-controller;
+	};
-- 
1.8.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
