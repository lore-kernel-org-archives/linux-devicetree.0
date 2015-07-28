From: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Subject: [PATCH 1/2] devicetree: Add bindings documentation for Analog Devices AXI-DMAC
Date: Tue, 28 Jul 2015 11:38:05 +0200
Message-ID: <1438076286-21164-1-git-send-email-lars@metafoo.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add the devicetree descriptor for the Analog Devices AXI-DMAC DMA
controller. This is a soft peripheral used in FPGAs and the bindings
describe how it is connected to the system (clock, interrupt, memory map)
as well as the configuration options that were used when the peripheral was
instantiated.

Signed-off-by: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
---
 .../devicetree/bindings/dma/adi,axi-dmac.txt       | 54 ++++++++++++++++++++++
 include/dt-bindings/dma/axi-dmac.h                 | 48 +++++++++++++++++++
 2 files changed, 102 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/adi,axi-dmac.txt
 create mode 100644 include/dt-bindings/dma/axi-dmac.h

diff --git a/Documentation/devicetree/bindings/dma/adi,axi-dmac.txt b/Documentation/devicetree/bindings/dma/adi,axi-dmac.txt
new file mode 100644
index 0000000..67264dd
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/adi,axi-dmac.txt
@@ -0,0 +1,54 @@
+Analog Device AXI-DMAC DMA controller
+
+Required properties:
+ - compatible: Must be "adi,axi-dmac-1.00.a".
+ - reg: Specification for the controllers memory mapped register map.
+ - interrupts: Specification for the controllers interrupt.
+ - clocks: Phandle and specifier to the controllers AXI interface clock
+ - #dma-cells: Must be 1.
+
+Required subnodes:
+ - adi,channels: This subnode must contain a sub-node for each DMA channel. For
+   the channel sub-nodes the following bindings apply. They must match the
+   configuration options of the peripheral as it was instantiated.
+
+Required channel properties:
+ - reg: Which channel this node refers to.
+ - adi,length-width: Width of the DMA transfer length register.
+ - adi,source-bus-width,
+   adi,destination-bus-width: Width of the source or destination bus in bits.
+ - adi,source-bus-type,
+   adi,destination-bus-type: Type of the source or destination bus. Must be one
+   of the following:
+	0 (AXI_DMAC_TYPE_AXI_MM): Memory mapped AXI interface
+	1 (AXI_DMAC_TYPE_AXI_STREAM): Streaming AXI interface
+	2 (AXI_DMAC_TYPE_AXI_FIFO): FIFO interface
+
+Optional channel properties:
+ - adi,cyclic: Must be set if the channel supports hardware cyclic DMA
+   transfers.
+ - adi,2d: Must be set if the channel supports hardware 2D DMA transfers.
+
+DMA clients connected to the AXI-DMAC DMA controller must use the format
+described in the dma.txt file using a one-cell specifier. The value of the
+specifier refers to the DMA channel index.
+
+Example:
+
+dma: dma@7c420000 {
+	compatible = "adi,axi-dmac-1.00.a";
+	reg = <0x7c420000 0x10000>;
+	interrupts = <0 57 0>;
+	clocks = <&clkc 16>;
+	#dma-cells = <1>;
+
+	adi,channels {
+		dma-channel@0 {
+			reg = <0>;
+			adi,source-bus-width = <32>;
+			adi,source-bus-type = <ADI_AXI_DMAC_TYPE_MM_AXI>;
+			adi,destination-bus-width = <64>;
+			adi,destination-bus-type = <ADI_AXI_DMAC_TYPE_FIFO>;
+		};
+	};
+};
diff --git a/include/dt-bindings/dma/axi-dmac.h b/include/dt-bindings/dma/axi-dmac.h
new file mode 100644
index 0000000..ad9e6ec
--- /dev/null
+++ b/include/dt-bindings/dma/axi-dmac.h
@@ -0,0 +1,48 @@
+/*
+ * This file is dual-licensed: you can use it either under the terms
+ * of the GPL or the X11 license, at your option. Note that this dual
+ * licensing only applies to this file, and not this project as a
+ * whole.
+ *
+ *  a) This file is free software; you can redistribute it and/or
+ *     modify it under the terms of the GNU General Public License as
+ *     published by the Free Software Foundation; either version 2 of the
+ *     License, or (at your option) any later version.
+ *
+ *     This file is distributed in the hope that it will be useful,
+ *     but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *     GNU General Public License for more details.
+ *
+ * Or, alternatively,
+ *
+ *  b) Permission is hereby granted, free of charge, to any person
+ *     obtaining a copy of this software and associated documentation
+ *     files (the "Software"), to deal in the Software without
+ *     restriction, including without limitation the rights to use,
+ *     copy, modify, merge, publish, distribute, sublicense, and/or
+ *     sell copies of the Software, and to permit persons to whom the
+ *     Software is furnished to do so, subject to the following
+ *     conditions:
+ *
+ *     The above copyright notice and this permission notice shall be
+ *     included in all copies or substantial portions of the Software.
+ *
+ *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+ *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
+ *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+ *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
+ *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
+ *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ *     OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+#ifndef __DT_BINDINGS_DMA_AXI_DMAC_H__
+#define __DT_BINDINGS_DMA_AXI_DMAC_H__
+
+#define AXI_DMAC_BUS_TYPE_AXI_MM		0
+#define AXI_DMAC_BUS_TYPE_AXI_STREAM	1
+#define AXI_DMAC_BUS_TYPE_FIFO			2
+
+#endif
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
