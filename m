From: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v2 2/3] dt-bindings: imx-gpc: add i.MX6 QuadPlus compatible
Date: Wed,  5 Apr 2017 15:19:08 +0200
Message-ID: <20170405131909.16880-2-l.stach@pengutronix.de>
References: <20170405131909.16880-1-l.stach@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170405131909.16880-1-l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Dong Aisheng <dongas86-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, patchwork-lst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

While the GPC on i.MX6QP is mostly comptible to the i.MX6Q one,
the QuadPlus requires special workarounds for hardware erratum
ERR009619.

Signed-off-by: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 Documentation/devicetree/bindings/power/fsl,imx-gpc.txt | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/power/fsl,imx-gpc.txt b/Documentation/devicetree/bindings/power/fsl,imx-gpc.txt
index 416e12c6755a..181d2cc6f054 100644
--- a/Documentation/devicetree/bindings/power/fsl,imx-gpc.txt
+++ b/Documentation/devicetree/bindings/power/fsl,imx-gpc.txt
@@ -5,7 +5,10 @@ The i.MX6 General Power Control (GPC) block contains DVFS load tracking
 counters and Power Gating Control (PGC).
 
 Required properties:
-- compatible: Should be "fsl,imx6q-gpc" or "fsl,imx6sl-gpc"
+- compatible: Should be one of the following:
+  - fsl,imx6q-gpc
+  - fsl,imx6qp-gpc
+  - fsl,imx6sl-gpc
 - reg: should be register base and length as documented in the
   datasheet
 - interrupts: Should contain one interrupt specifier for the GPC interrupt
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
