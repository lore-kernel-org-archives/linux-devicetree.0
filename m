From: Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH v3 2/2] dmaengine: add device tree binding documentation for
 the nbpfaxi driver
Date: Sat, 10 May 2014 18:11:06 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.1405101809380.30489@axis700.grange>
References: <Pine.LNX.4.64.1405101757070.30489@axis700.grange>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <Pine.LNX.4.64.1405101757070.30489-0199iw4Nj15frtckUFj5Ag@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "Shevchenko, Andriy" <andriy.shevchenko-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Phil Edworthy <phil.edworthy-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The nbpfaxi dmaengine driver doesn't define any new bindings, it only
uses standard dmaengine bindings and defines 3 flags for the 3rd parameter
of the "dmas" property.

Signed-off-by: Guennadi Liakhovetski <g.liakhovetski+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---

v3: split out from v2, no changes otherwise

 Documentation/devicetree/bindings/dma/nbpfaxi.txt | 61 +++++++++++++++++++++++
 include/dt-bindings/dma/nbpfaxi.h                 | 20 ++++++++
 2 files changed, 81 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/nbpfaxi.txt
 create mode 100644 include/dt-bindings/dma/nbpfaxi.h

diff --git a/Documentation/devicetree/bindings/dma/nbpfaxi.txt b/Documentation/devicetree/bindings/dma/nbpfaxi.txt
new file mode 100644
index 0000000..d5e2522
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/nbpfaxi.txt
@@ -0,0 +1,61 @@
+* Renesas "Type-AXI" NBPFAXI* DMA controllers
+
+* DMA controller
+
+Required properties
+
+- compatible:	must be one of
+		"renesas,nbpfaxi64dmac1b4"
+		"renesas,nbpfaxi64dmac1b8"
+		"renesas,nbpfaxi64dmac1b16"
+		"renesas,nbpfaxi64dmac4b4"
+		"renesas,nbpfaxi64dmac4b8"
+		"renesas,nbpfaxi64dmac4b16"
+		"renesas,nbpfaxi64dmac8b4"
+		"renesas,nbpfaxi64dmac8b8"
+		"renesas,nbpfaxi64dmac8b16"
+- #dma-cells:	must be 2: the first integer is a terminal number, to which this
+		slave is connected, the second one is flags. Flags is a bitmask
+		with the following bits defined:
+
+#define NBPF_SLAVE_RQ_HIGH	1
+#define NBPF_SLAVE_RQ_LOW	2
+#define NBPF_SLAVE_RQ_LEVEL	4
+
+Optional properties:
+
+You can use dma-channels and dma-requests as described in dma.txt, although they
+won't be used, this information is derived from the compatibility string.
+
+Example:
+
+	dma: dma-controller@48000000 {
+		compatible = "renesas,nbpfaxi64dmac8b4";
+		reg = <0x48000000 0x400>;
+		interrupts = <0 12 0x4
+			      0 13 0x4
+			      0 14 0x4
+			      0 15 0x4
+			      0 16 0x4
+			      0 17 0x4
+			      0 18 0x4
+			      0 19 0x4>;
+		#dma-cells = <2>;
+		dma-channels = <8>;
+		dma-requests = <8>;
+	};
+
+* DMA client
+
+Required properties:
+
+dmas and dma-names are required, as described in dma.txt.
+
+Example:
+
+#include <dt-bindings/dma/nbpfaxi.h>
+
+...
+		dmas = <&dma 0 (NBPF_SLAVE_RQ_HIGH | NBPF_SLAVE_RQ_LEVEL)
+			&dma 1 (NBPF_SLAVE_RQ_HIGH | NBPF_SLAVE_RQ_LEVEL)>;
+		dma-names = "rx", "tx";
diff --git a/include/dt-bindings/dma/nbpfaxi.h b/include/dt-bindings/dma/nbpfaxi.h
new file mode 100644
index 0000000..c1a5b9e
--- /dev/null
+++ b/include/dt-bindings/dma/nbpfaxi.h
@@ -0,0 +1,20 @@
+/*
+ * Copyright (C) 2013-2014 Renesas Electronics Europe Ltd.
+ * Author: Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of version 2 of the GNU General Public License as
+ * published by the Free Software Foundation.
+ */
+
+#ifndef DT_BINDINGS_NBPFAXI_H
+#define DT_BINDINGS_NBPFAXI_H
+
+/**
+ * Use "#dma-cells = <2>;" with the second integer defining slave DMA flags:
+ */
+#define NBPF_SLAVE_RQ_HIGH	1
+#define NBPF_SLAVE_RQ_LOW	2
+#define NBPF_SLAVE_RQ_LEVEL	4
+
+#endif
-- 
2.0.0.rc0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
