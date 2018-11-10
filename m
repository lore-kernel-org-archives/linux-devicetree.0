Return-Path: <SRS0=Zmu6=NV=gmail.com=chunkeey@kernel.org>
From: Christian Lamparter <chunkeey@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: dmaengine: dw-dmac: add protection control property
Date: Sat, 10 Nov 2018 17:28:30 +0100
Message-Id: <a8cd42ce348ed6a21580815f25ab1590aaa6acf3.1541866004.git.chunkeey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: dmaengine@vger.kernel.org, devicetree@vger.kernel.org
Cc: Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vkoul@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Viresh Kumar <vireshk@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

This patch for the DesignWare AHB Central
Direct Memory Access Controller adds the dma
protection control property:
	"snps,dma-protection-control"

as well as the properties specific values defines into
a new include file: include/dt-bindings/dma/dw-dmac.h

Note: The protection control signals are one-to-one
mapped to the AHB HPROT[1:3] signals for this controller.
The HPROT0 (Data Access) is always hardwired to 1.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
---
I've included the "Reviewed-by" from the v1 in this patch for now.
But if a new issue comes up regarding the updates, please let me know.
---
 Documentation/devicetree/bindings/dma/snps-dma.txt |  4 ++++
 MAINTAINERS                                        |  4 +++-
 include/dt-bindings/dma/dw-dmac.h                  | 14 ++++++++++++++
 3 files changed, 21 insertions(+), 1 deletion(-)
 create mode 100644 include/dt-bindings/dma/dw-dmac.h

diff --git a/Documentation/devicetree/bindings/dma/snps-dma.txt b/Documentation/devicetree/bindings/dma/snps-dma.txt
index 39e2b26be344..db757df7057d 100644
--- a/Documentation/devicetree/bindings/dma/snps-dma.txt
+++ b/Documentation/devicetree/bindings/dma/snps-dma.txt
@@ -27,6 +27,10 @@ Optional properties:
   general purpose DMA channel allocator. False if not passed.
 - multi-block: Multi block transfers supported by hardware. Array property with
   one cell per channel. 0: not supported, 1 (default): supported.
+- snps,dma-protection-control: AHB HPROT[3:1] protection setting.
+  The default value is 0 (for non-cacheable, non-buffered,
+  unprivileged data access).
+  Refer to include/dt-bindings/dma/dw-dmac.h for possible values.
 
 Example:
 
diff --git a/MAINTAINERS b/MAINTAINERS
index dacba23b80b4..c35998e20e9d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14107,9 +14107,11 @@ SYNOPSYS DESIGNWARE DMAC DRIVER
 M:	Viresh Kumar <vireshk@kernel.org>
 R:	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
 S:	Maintained
+F:	Documentation/devicetree/bindings/dma/snps-dma.txt
+F:	drivers/dma/dw/
+F:	include/dt-bindings/dma/dw-dmac.h
 F:	include/linux/dma/dw.h
 F:	include/linux/platform_data/dma-dw.h
-F:	drivers/dma/dw/
 
 SYNOPSYS DESIGNWARE ENTERPRISE ETHERNET DRIVER
 M:	Jose Abreu <Jose.Abreu@synopsys.com>
diff --git a/include/dt-bindings/dma/dw-dmac.h b/include/dt-bindings/dma/dw-dmac.h
new file mode 100644
index 000000000000..d1ca705c95b3
--- /dev/null
+++ b/include/dt-bindings/dma/dw-dmac.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
+
+#ifndef __DT_BINDINGS_DMA_DW_DMAC_H__
+#define __DT_BINDINGS_DMA_DW_DMAC_H__
+
+/*
+ * Protection Control bits provide protection against illegal transactions.
+ * The protection bits[0:2] are one-to-one mapped to AHB HPROT[3:1] signals.
+ */
+#define DW_DMAC_HPROT1_PRIVILEGED_MODE	(1 << 0)	/* Privileged Mode */
+#define DW_DMAC_HPROT2_BUFFERABLE	(1 << 1)	/* DMA is bufferable */
+#define DW_DMAC_HPROT3_CACHEABLE	(1 << 2)	/* DMA is cacheable */
+
+#endif /* __DT_BINDINGS_DMA_DW_DMAC_H__ */
-- 
2.19.1
