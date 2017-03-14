From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v3 1/9] gpu: ipu-v3: add DT binding for the Prefetch Resolve Engine
Date: Tue, 14 Mar 2017 11:38:40 +0100
Message-ID: <1489487928-26083-1-git-send-email-p.zabel@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, patchwork-lst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

The Prefetch Resolve Engine is a prefetch and tile resolve engine
which prefetches display data from DRAM to an internal SRAM region.
It has a single clock for configuration register access and the
functional units. A single shared interrupt is used for status and
error signaling.

The only external dependency is the SRAM region to use for the
prefetch double buffer.

Signed-off-by: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 .../bindings/display/imx/fsl-imx-drm.txt           | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt b/Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt
index 971c3eedb1c7b..70ae5335d1e30 100644
--- a/Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt
+++ b/Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt
@@ -53,6 +53,32 @@ ipu: ipu@18000000 {
 	};
 };
 
+Freescale i.MX PRE (Prefetch Resolve Engine)
+============================================
+
+Required properties:
+- compatible: should be "fsl,imx6qp-pre"
+- reg: should be register base and length as documented in the
+  datasheet
+- clocks : phandle to the PRE axi clock input, as described
+  in Documentation/devicetree/bindings/clock/clock-bindings.txt and
+  Documentation/devicetree/bindings/clock/imx6q-clock.txt.
+- clock-names: should be "axi"
+- interrupts: should contain the PRE interrupt
+- fsl,iram: phandle pointing to the mmio-sram device node, that should be
+  used for the PRE SRAM double buffer.
+
+example:
+
+pre@21c8000 {
+	compatible = "fsl,imx6qp-pre";
+	reg = <0x021c8000 0x1000>;
+	interrupts = <GIC_SPI 90 IRQ_TYPE_EDGE_RISING>;
+	clocks = <&clks IMX6QDL_CLK_PRE0>;
+	clock-names = "axi";
+	fsl,iram = <&ocram2>;
+};
+
 Parallel display support
 ========================
 
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
