From: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Subject: [PATCH 1/3] dt-bindings: mxsfb: Indentation cleanup
Date: Mon, 14 Nov 2016 11:10:34 +0100
Message-ID: <20161114101036.3505-1-marex@denx.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Clean up the ad-hoc indentation in the documentation, no functional change.

Signed-off-by: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
 Documentation/devicetree/bindings/display/mxsfb.txt | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mxsfb.txt b/Documentation/devicetree/bindings/display/mxsfb.txt
index 96ec517..a4431f2 100644
--- a/Documentation/devicetree/bindings/display/mxsfb.txt
+++ b/Documentation/devicetree/bindings/display/mxsfb.txt
@@ -1,20 +1,20 @@
 * Freescale MXS LCD Interface (LCDIF)
 
 Required properties:
-- compatible: Should be "fsl,<chip>-lcdif".  Supported chips include
-  imx23 and imx28.
-- reg: Address and length of the register set for lcdif
-- interrupts: Should contain lcdif interrupts
-- display : phandle to display node (see below for details)
+- compatible:	Should be "fsl,imx23-lcdif" for i.MX23.
+		Should be "fsl,imx28-lcdif" for i.MX28.
+- reg:		Address and length of the register set for lcdif
+- interrupts:	Should contain lcdif interrupts
+- display:	phandle to display node (see below for details)
 
 * display node
 
 Required properties:
-- bits-per-pixel : <16> for RGB565, <32> for RGB888/666.
-- bus-width : number of data lines.  Could be <8>, <16>, <18> or <24>.
+- bits-per-pixel:	<16> for RGB565, <32> for RGB888/666.
+- bus-width:		number of data lines.  Could be <8>, <16>, <18> or <24>.
 
 Required sub-node:
-- display-timings : Refer to binding doc display-timing.txt for details.
+- display-timings:	Refer to binding doc display-timing.txt for details.
 
 Examples:
 
-- 
2.10.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
