From: Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3 33/37] devicetree: document Ingenic SoC UART binding
Date: Tue, 21 Apr 2015 15:47:00 +0100
Message-ID: <1429627624-30525-34-git-send-email-paul.burton@imgtec.com>
References: <1429627624-30525-1-git-send-email-paul.burton@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1429627624-30525-1-git-send-email-paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
Cc: Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add binding documentation for the UARTs found in Ingenic SoCs.

Signed-off-by: Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
Changes in v3:
  - Merge binding documentation for Ingenic SoCs whose bindings differ
    only by their compatible strings.

Changes in v2:
  - None.
---
 .../devicetree/bindings/serial/ingenic,uart.txt    | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/serial/ingenic,uart.txt

diff --git a/Documentation/devicetree/bindings/serial/ingenic,uart.txt b/Documentation/devicetree/bindings/serial/ingenic,uart.txt
new file mode 100644
index 0000000..c2d3b3a
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/ingenic,uart.txt
@@ -0,0 +1,22 @@
+* Ingenic SoC UART
+
+Required properties:
+- compatible : "ingenic,jz4740-uart" or "ingenic,jz4780-uart"
+- reg : offset and length of the register set for the device.
+- interrupts : should contain uart interrupt.
+- clocks : phandles to the module & baud clocks.
+- clock-names: tuple listing input clock names.
+	Required elements: "baud", "module"
+
+Example:
+
+uart0: serial@10030000 {
+	compatible = "ingenic,jz4740-uart";
+	reg = <0x10030000 0x100>;
+
+	interrupt-parent = <&intc>;
+	interrupts = <9>;
+
+	clocks = <&ext>, <&cgu JZ4740_CLK_UART0>;
+	clock-names = "baud", "module";
+};
-- 
2.3.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
