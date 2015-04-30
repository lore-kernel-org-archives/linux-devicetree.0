From: Aaro Koskinen <aaro.koskinen-X3B1VOXEql0@public.gmane.org>
Subject: [PATCH] Documentation/devicetree: document OCTEON USB bindings
Date: Thu, 30 Apr 2015 22:44:00 +0300
Message-ID: <1430423040-2088-1-git-send-email-aaro.koskinen@iki.fi>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: David Daney <ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Aaro Koskinen <aaro.koskinen-X3B1VOXEql0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Document device-tree bindings for the USB controller on older
OCTEON SOCs (OCTEON, OCTEON+).

Signed-off-by: Aaro Koskinen <aaro.koskinen-X3B1VOXEql0@public.gmane.org>
---
 .../devicetree/bindings/usb/octeon-usb.txt         | 58 ++++++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/octeon-usb.txt

diff --git a/Documentation/devicetree/bindings/usb/octeon-usb.txt b/Documentation/devicetree/bindings/usb/octeon-usb.txt
new file mode 100644
index 0000000..fd121c4
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/octeon-usb.txt
@@ -0,0 +1,58 @@
+OCTEON/OCTEON+ USB BLOCK
+
+1) Main node
+
+   Required properties:
+
+   - compatible: must be "cavium,octeon-5750-usbn"
+
+   - reg: specifies the physical base address of the USBN block and
+     the length of the memory mapped region.
+
+   - #address-cells: specifies the number of cells needed to encode an
+     address. The value must be 2.
+
+   - #size-cells: specifies the number of cells used to represent the size
+     of an address. The value must be 2.
+
+   - ranges: specifies the translation between child address space and parent
+     address space.
+
+   - refclk-frequency: speed of the USB reference clock. Allowed values are
+     12000000, 24000000 or 48000000.
+
+   - refclk-type: type of the USB reference clock. Allowed values are
+     "crystal" or "external".
+
+2) Child node
+
+   The main node must have one child node which describes the built-in
+   USB controller.
+
+   Required properties:
+
+   - compatible: must be "cavium,octeon-5750-usbc"
+
+   - reg: specifies the physical base address of the USBC block and
+     the length of the memory mapped region.
+
+   - interrupts: specifies the interrupt number for the USB controller.
+
+3) Example:
+
+	usbn: usbn@1180068000000 {
+		compatible = "cavium,octeon-5750-usbn";
+		reg = <0x11800 0x68000000 0x0 0x1000>;
+		ranges; /* Direct mapping */
+		#address-cells = <2>;
+		#size-cells = <2>;
+		refclk-frequency = <12000000>;
+		refclk-type = "crystal";
+
+		usbc@16f0010000000 {
+			compatible = "cavium,octeon-5750-usbc";
+			reg = <0x16f00 0x10000000 0x0 0x80000>;
+			interrupts = <0 56>;
+		};
+	};
+
-- 
2.3.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
