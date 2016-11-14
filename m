From: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Subject: [PATCH V2 2/3] dt-bindings: mxsfb: Add new bindings for the MXSFB driver
Date: Mon, 14 Nov 2016 11:10:35 +0100
Message-ID: <20161114101036.3505-2-marex@denx.de>
References: <20161114101036.3505-1-marex@denx.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161114101036.3505-1-marex-ynQEQJNshbs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add new DT bindings for new MXSFB driver that is using the
OF graph to parse the video output structure instead of
hard-coding the display properties into the MXSFB node.
The old MXSFB fbdev driver bindings are preserved in the
same file in the "Old bindings" section.

Signed-off-by: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
--
V2: - Merge the new bindings into mxsfb.txt file instead of keeping
      them in separate mxsfb-drm.txt file.
    - Add dedicated compatible for i.MX6SX
    - Drop all references to DRM/KMS
    - Repair the required bits in clock node
---
 .../devicetree/bindings/display/mxsfb.txt          | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mxsfb.txt b/Documentation/devicetree/bindings/display/mxsfb.txt
index a4431f2..6e92593 100644
--- a/Documentation/devicetree/bindings/display/mxsfb.txt
+++ b/Documentation/devicetree/bindings/display/mxsfb.txt
@@ -1,5 +1,42 @@
 * Freescale MXS LCD Interface (LCDIF)
 
+New bindings:
+=============
+Required properties:
+- compatible:	Should be "fsl,imx23-lcdif" for i.MX23.
+		Should be "fsl,imx28-lcdif" for i.MX28.
+		Should be "fsl,imx6sx-lcdif" for i.MX6SX.
+- reg:		Address and length of the register set for lcdif
+- interrupts:	Should contain lcdif interrupts
+- clocks:	A list of phandle + clock-specifier pairs, one for each
+		entry in 'clock-names'.
+- clock-names:	A list of clock names. For MXSFB it should contain:
+    - "pix" for the MXSFB block clock
+    - (MX6SX-only) "axi", "disp_axi" for the bus interface clock
+
+Required sub-nodes:
+  - port: The connection to an encoder chip.
+
+Example:
+
+	lcdif1: lcdif@02220000 {
+		compatible = "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";
+		reg = <0x02220000 0x4000>;
+		interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&clks IMX6SX_CLK_LCDIF1_PIX>,
+			 <&clks IMX6SX_CLK_LCDIF_APB>,
+			 <&clks IMX6SX_CLK_DISPLAY_AXI>;
+		clock-names = "pix", "axi", "disp_axi";
+
+		port {
+			parallel_out: endpoint {
+				remote-endpoint = <&panel_in_parallel>;
+			};
+		};
+	};
+
+Old bindings:
+=============
 Required properties:
 - compatible:	Should be "fsl,imx23-lcdif" for i.MX23.
 		Should be "fsl,imx28-lcdif" for i.MX28.
-- 
2.10.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
