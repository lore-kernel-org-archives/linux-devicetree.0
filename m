From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/3] dt: usb: jz4740: Add DT binding document for OHCI
Date: Tue, 27 Jan 2015 13:47:17 +0000
Message-ID: <1422366439-34641-2-git-send-email-Zubair.Kakakhel@imgtec.com>
References: <1422366439-34641-1-git-send-email-Zubair.Kakakhel@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1422366439-34641-1-git-send-email-Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>

Add the binding documentation for the JZ47xx OHCI controller.

Signed-off-by: Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>

---
The jz4740 is platform only at the moment.

But DT support is being added

See http://patchwork.linux-mips.org/bundle/paulburton/ci20-v3.20/

jz47xx is used because jz4780 will also use this driver
---
 .../bindings/usb/ingenic,jz47xx-ohci.txt           | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/ingenic,jz47xx-ohci.txt

diff --git a/Documentation/devicetree/bindings/usb/ingenic,jz47xx-ohci.txt b/Documentation/devicetree/bindings/usb/ingenic,jz47xx-ohci.txt
new file mode 100644
index 0000000..2fada8b
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/ingenic,jz47xx-ohci.txt
@@ -0,0 +1,28 @@
+Ingenic JZ47XX SoC OHCI controller binding
+
+The Ingenic JZ47XX SoC includes an OHCI compliant USB host controller
+interface for use with USB 1.1 devices.
+
+Required properties:
+ - compatible: Should be "ingenic,jz4740-ohci"
+ - reg: Should contain the address & size of the OHCI controller registers.
+ - interrupt-parent: Should be the phandle of the interrupt controller that
+   delivers interrupts to the OHCI block.
+ - interrupts: Should specify the interrupt provided by interrupt-parent.
+ - clocks: Should contain a single clock specifier for the SoC UHC clock.
+
+Example SoC include file for jz4780:
+
+/ {
+	ohci: jz4780-ohci@0x134a0000 {
+		compatible = "ingenic,jz4780-ohci";
+		reg = <0x134a0000 0x10000>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <5>;
+
+		clocks = <&cgu JZ4780_CLK_UHC>;
+		clock-names = "uhc";
+	};
+};
+
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
