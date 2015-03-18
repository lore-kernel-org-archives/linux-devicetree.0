From: Rameshwar Prasad Sahu <rsahu-qTEPVZfXA3Y@public.gmane.org>
Subject: [PATCH v8 3/3] Documentation: dma: Add documentation for the APM X-Gene SoC DMA device DTS binding
Date: Wed, 18 Mar 2015 19:17:36 +0530
Message-ID: <1426686456-15536-4-git-send-email-rsahu@apm.com>
References: <1426686456-15536-1-git-send-email-rsahu@apm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426686456-15536-1-git-send-email-rsahu-qTEPVZfXA3Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, patches-qTEPVZfXA3Y@public.gmane.org, Rameshwar Prasad Sahu <rsahu-qTEPVZfXA3Y@public.gmane.org>, Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds documentation for the APM X-Gene SoC DMA device DTS binding

Signed-off-by: Rameshwar Prasad Sahu <rsahu-qTEPVZfXA3Y@public.gmane.org>
Signed-off-by: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
---
 .../devicetree/bindings/dma/apm-xgene-dma.txt      | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/apm-xgene-dma.txt

diff --git a/Documentation/devicetree/bindings/dma/apm-xgene-dma.txt b/Documentation/devicetree/bindings/dma/apm-xgene-dma.txt
new file mode 100644
index 0000000..d305876
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/apm-xgene-dma.txt
@@ -0,0 +1,47 @@
+Applied Micro X-Gene SoC DMA nodes
+
+DMA nodes are defined to describe on-chip DMA interfaces in
+APM X-Gene SoC.
+
+Required properties for DMA interfaces:
+- compatible: Should be "apm,xgene-dma".
+- device_type: set to "dma".
+- reg: Address and length of the register set for the device.
+  It contains the information of registers in the following order:
+  1st - DMA control and status register address space.
+  2nd - Descriptor ring control and status register address space.
+  3rd - Descriptor ring command register address space.
+  4th - Soc efuse register address space.
+- interrupts: DMA has 5 interrupts sources. 1st interrupt is
+  DMA error reporting interrupt. 2nd, 3rd, 4th and 5th interrupts
+  are completion interrupts for each DMA channels.
+- clocks: Reference to the clock entry.
+
+Optional properties:
+- dma-coherent : Present if dma operations are coherent
+
+Example:
+	dmaclk: dmaclk@1f27c000 {
+		compatible = "apm,xgene-device-clock";
+		#clock-cells = <1>;
+		clocks = <&socplldiv2 0>;
+		reg = <0x0 0x1f27c000 0x0 0x1000>;
+		reg-names = "csr-reg";
+		clock-output-names = "dmaclk";
+	};
+
+	dma: dma@1f270000 {
+			compatible = "apm,xgene-storm-dma";
+			device_type = "dma";
+			reg = <0x0 0x1f270000 0x0 0x10000>,
+			      <0x0 0x1f200000 0x0 0x10000>,
+			      <0x0 0x1b008000 0x0 0x2000>,
+			      <0x0 0x1054a000 0x0 0x100>;
+			interrupts = <0x0 0x82 0x4>,
+				     <0x0 0xb8 0x4>,
+				     <0x0 0xb9 0x4>,
+				     <0x0 0xba 0x4>,
+				     <0x0 0xbb 0x4>;
+			dma-coherent;
+			clocks = <&dmaclk 0>;
+	};
--
1.8.2.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
