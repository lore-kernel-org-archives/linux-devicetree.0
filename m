From: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH 4/9] gpu: ipu-v3: add DT binding for the Prefetch Resolve Gasket
Date: Fri, 17 Feb 2017 19:28:25 +0100
Message-ID: <20170217182830.32618-5-l.stach@pengutronix.de>
References: <20170217182830.32618-1-l.stach@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170217182830.32618-1-l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, patchwork-lst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

This adds the the devicetree binding for the Prefetch Resolve Gasket,
as found on i.MX6 QuadPlus.
The PRG is fairly simple in that it only has a configuration register
range and two clocks, one for the AHB slave port and one for the AXI
ports and the functional units.

The PRE connections need to be described in the DT, as the PRE<->PRG
assignment is a mix between fixed and muxable connections.

Signed-off-by: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 .../bindings/display/imx/fsl-imx-drm.txt           | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt b/Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt
index 1bd777d7c37d..5e4b8b13b9f8 100644
--- a/Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt
+++ b/Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt
@@ -79,6 +79,31 @@ pre@021c8000 {
 	fsl,ocram = <&ocram2>;
 };
 
+Freescale i.MX PRG (Prefetch Resolve Gasket)
+============================================
+
+Required properties:
+- compatible: should be "fsl,imx6qp-prg"
+- reg: should be register base and length as documented in the
+  datasheet
+- clocks : phandles to the PRG ipg and axi clock inputs, as described
+  in Documentation/devicetree/bindings/clock/clock-bindings.txt and
+  Documentation/devicetree/bindings/clock/imx6q-clock.txt.
+- clock-names: should be "ipg" and "axi"
+- fsl,pres: phandles to the PRE units attached to this PRG, with the fixed
+  PRE as the first entry and the muxable PREs following.
+
+example:
+
+prg@021cc000 {
+	compatible = "fsl,imx6qp-prg";
+	reg = <0x021cc000 0x1000>;
+	clocks = <&clks IMX6QDL_CLK_PRG0_APB>,
+		 <&clks IMX6QDL_CLK_PRG0_AXI>;
+	clock-names = "ipg", "axi";
+	fsl,pres = <&pre1>, <&pre2>, <&pre3>;
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
