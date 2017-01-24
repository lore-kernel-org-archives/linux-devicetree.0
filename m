From: Cyril Bur <cyrilbur-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 2/2] Documentation: dt: misc: Add Aspeed ast2400/2500 LPC Control bindings
Date: Tue, 24 Jan 2017 15:05:33 +1100
Message-ID: <20170124040533.9144-2-cyrilbur@gmail.com>
References: <20170124040533.9144-1-cyrilbur@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170124040533.9144-1-cyrilbur-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, andrew-zrmu5oMJ5Fs@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Cyril Bur <cyrilbur-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
V2:
	s/ASpeed/Aspeed/
	Removed incorrect compatible property from the example
	Dropped: "This does not have to be the case, provided the reg
	  property can give the full address of the mbox registers."
	  from the "Device Node" section

 .../devicetree/bindings/misc/aspeed-lpc-ctrl.txt   | 76 ++++++++++++++++++++++
 1 file changed, 76 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/aspeed-lpc-ctrl.txt

diff --git a/Documentation/devicetree/bindings/misc/aspeed-lpc-ctrl.txt b/Documentation/devicetree/bindings/misc/aspeed-lpc-ctrl.txt
new file mode 100644
index 000000000000..bb5cdd7fb583
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/aspeed-lpc-ctrl.txt
@@ -0,0 +1,76 @@
+Aspeed LPC Control
+==================
+This binding defines the LPC control for Aspeed SoCs. Partitions of
+the LPC bus can be access by other processors on the system, address
+ranges on the bus can map accesses from another processor to regions
+of the Aspeed SoC memory space.
+
+Reserved Memory:
+================
+The driver provides functionality to map the LPC bus to a region of
+Aspeed ram. A phandle to a reserved memory node must be provided so
+that the driver can safely use this region.
+
+Flash:
+======
+The driver provides functionality to unmap the LPC bus from Aspeed
+RAM, historically the default mapping has been to the SPI flash
+controller on the Aspeed SoC, a phandle to this node should be
+supplied.
+
+Device Node:
+============
+
+As LPC bus configuration registers are at the start of the LPC bus
+memory space, it makes most sense for the device to be within the LPC
+host node. See Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
+for more information.
+
+Required properties:
+--------------------
+
+- compatible:		"aspeed,ast2400-lpc-ctrl" for Aspeed ast2400 SoCs
+					"aspeed,ast2500-lpc-ctrl" for Aspeed ast2500 SoCs
+
+- reg:				Location and size of the configuration registers
+					for the LPC bus. Note that if the device node is
+					within the LPC host node then base is relative to
+					that.
+
+- memory-region:	phandle of the reserved memory region
+- flash:			phandle of the SPI flash controller
+
+Example:
+--------
+
+reserved-memory {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	ranges;
+
+	...
+
+	flash_memory: region@54000000 {
+		no-map;
+		reg = <0x54000000 0x04000000>; /* 64M */
+	};
+};
+
+host_pnor: spi@1e630000 {
+	reg = < 0x1e630000 0x18
+			0x30000000 0x02000000 >;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	compatible = "aspeed,ast2400-smc";
+
+	...
+
+};
+
+lpc-ctrl@0 {
+	compatible = "aspeed,ast2400-lpc-ctrl";
+	memory-region = <&flash_memory>;
+	flash = <&host_pnor>;
+	reg = <0x0 0x80>;
+};
+
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
