From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v3 5/9] gpu: ipu-v3: document valid IPUv3 compatibles and extend for i.MX6 QuadPlus
Date: Tue, 14 Mar 2017 11:38:44 +0100
Message-ID: <1489487928-26083-5-git-send-email-p.zabel@pengutronix.de>
References: <1489487928-26083-1-git-send-email-p.zabel@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1489487928-26083-1-git-send-email-p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, patchwork-lst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

Document the valid compatible strings for the IPUv3.

On i.MX6 QuadPlus the IPU needs to know which PRG has to be
used for this IPU instance. Add a "fsl,prg" property containing
a phandle pointing to the correct PRG device.

Signed-off-by: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt b/Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt
index 62eb637630b5a..fa01db7eb66c5 100644
--- a/Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt
+++ b/Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt
@@ -21,13 +21,19 @@ Freescale i.MX IPUv3
 ====================
 
 Required properties:
-- compatible: Should be "fsl,<chip>-ipu"
+- compatible: Should be "fsl,<chip>-ipu" where <chip> is one of
+  - imx51
+  - imx53
+  - imx6q
+  - imx6qp
 - reg: should be register base and length as documented in the
   datasheet
 - interrupts: Should contain sync interrupt and error interrupt,
   in this order.
 - resets: phandle pointing to the system reset controller and
           reset line index, see reset/fsl,imx-src.txt for details
+Additional required properties for fsl,imx6qp-ipu:
+- fsl,prg: phandle to prg node associated with this IPU instance
 Optional properties:
 - port@[0-3]: Port nodes with endpoint definitions as defined in
   Documentation/devicetree/bindings/media/video-interfaces.txt.
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
