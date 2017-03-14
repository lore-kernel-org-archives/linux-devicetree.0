From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v3 3/9] gpu: ipu-v3: add DT binding for the Prefetch Resolve Gasket
Date: Tue, 14 Mar 2017 11:38:42 +0100
Message-ID: <1489487928-26083-3-git-send-email-p.zabel@pengutronix.de>
References: <1489487928-26083-1-git-send-email-p.zabel@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1489487928-26083-1-git-send-email-p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, patchwork-lst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

This adds the the devicetree binding for the Prefetch Resolve Gasket,
as found on i.MX6 QuadPlus.
The PRG is fairly simple in that it only has a configuration register
range and two clocks, one for the AHB slave port and one for the AXI
ports and the functional units.

The PRE connections need to be described in the DT, as the PRE<->PRG
assignment is a mix between fixed and muxable connections.

Signed-off-by: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 .../bindings/display/imx/fsl-imx-drm.txt           | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt b/Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt
index 70ae5335d1e30..62eb637630b5a 100644
--- a/Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt
+++ b/Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt
@@ -79,6 +79,31 @@ pre@21c8000 {
 	fsl,iram = <&ocram2>;
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
+prg@21cc000 {
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
