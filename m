From: Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 31/36] devicetree: document ingenic,jz4780-intc binding
Date: Sun, 18 Jan 2015 14:42:25 -0800
Message-ID: <1421620945-25502-1-git-send-email-paul.burton@imgtec.com>
References: <1421620067-23933-1-git-send-email-paul.burton@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1421620067-23933-1-git-send-email-paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
Cc: Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add binding documentation for the Ingenic jz4780 interrupt controller.

Signed-off-by: Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
 .../interrupt-controller/ingenic,jz4780-intc.txt   | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/ingenic,jz4780-intc.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/ingenic,jz4780-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/ingenic,jz4780-intc.txt
new file mode 100644
index 0000000..c6164d9
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/ingenic,jz4780-intc.txt
@@ -0,0 +1,24 @@
+Ingenic jz4780 SoC Interrupt Controller
+
+Required properties:
+
+- compatible : should be "ingenic,jz4780-intc"
+- reg : Specifies base physical address and size of the registers.
+- interrupt-controller : Identifies the node as an interrupt controller
+- #interrupt-cells : Specifies the number of cells needed to encode an
+  interrupt source. The value shall be 1.
+- interrupt-parent: phandle of the CPU interrupt controller.
+- interrupts - Specifies the CPU interrupt the controller is connected to.
+
+Example:
+
+intc: intc@10001000 {
+	compatible = "ingenic,jz4780-intc";
+	reg = <0x10001000 0x50>;
+
+	interrupt-controller;
+	#interrupt-cells = <1>;
+
+	interrupt-parent = <&cpuintc>;
+	interrupts = <2>;
+};
-- 
2.2.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
