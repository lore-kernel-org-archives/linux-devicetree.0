From: Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v5 10/37] devicetree: document Ingenic SoC interrupt controller binding
Date: Sun, 24 May 2015 16:11:20 +0100
Message-ID: <1432480307-23789-11-git-send-email-paul.burton@imgtec.com>
References: <1432480307-23789-1-git-send-email-paul.burton@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432480307-23789-1-git-send-email-paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
Cc: Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add binding documentation for Ingenic SoC interrupt controllers.

Signed-off-by: Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---

Changes in v5:
- List all supported compatible strings in the binding document.

Changes in v4:
  - s/intc/interrupt-controller/ in example.

Changes in v3:
- Merge documentation for various Ingenic SoCs, which only differ by
  their compatible strings.

Changes in v2: None

 .../bindings/interrupt-controller/ingenic,intc.txt | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.txt b/Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.txt
new file mode 100644
index 0000000..5f89fb6
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.txt
@@ -0,0 +1,28 @@
+Ingenic SoC Interrupt Controller
+
+Required properties:
+
+- compatible : should be "ingenic,<socname>-intc". Valid strings are:
+    ingenic,jz4740-intc
+    ingenic,jz4770-intc
+    ingenic,jz4775-intc
+    ingenic,jz4780-intc
+- reg : Specifies base physical address and size of the registers.
+- interrupt-controller : Identifies the node as an interrupt controller
+- #interrupt-cells : Specifies the number of cells needed to encode an
+  interrupt source. The value shall be 1.
+- interrupt-parent : phandle of the CPU interrupt controller.
+- interrupts : Specifies the CPU interrupt the controller is connected to.
+
+Example:
+
+intc: interrupt-controller@10001000 {
+	compatible = "ingenic,jz4740-intc";
+	reg = <0x10001000 0x14>;
+
+	interrupt-controller;
+	#interrupt-cells = <1>;
+
+	interrupt-parent = <&cpuintc>;
+	interrupts = <2>;
+};
-- 
2.4.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
