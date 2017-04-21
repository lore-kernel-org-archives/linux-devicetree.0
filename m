From: Martin Kaiser <martin-XxZfDwE/svGeZLLa646FqQ@public.gmane.org>
Subject: [PATCH 2/2] dt-bindings: display: imx: entry for AUS mode
Date: Fri, 21 Apr 2017 12:29:09 +0200
Message-ID: <1492770549-7347-2-git-send-email-martin@kaiser.cx>
References: <1488193030-13064-1-git-send-email-martin@kaiser.cx>
 <1492770549-7347-1-git-send-email-martin@kaiser.cx>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1492770549-7347-1-git-send-email-martin-XxZfDwE/svGeZLLa646FqQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Martin Kaiser <martin-XxZfDwE/svGeZLLa646FqQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Allow setting AUS mode for a display from the device tree. Use an
optional boolean property. AUS mode can be set only on imx21 and
compatible chipsets.

Signed-off-by: Martin Kaiser <martin-XxZfDwE/svGeZLLa646FqQ@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
v4:
   rename the DT property to fsl,aus-mode

v3:
   use a boolean DT property instead of the register value
   separate patches for DT binding and code changes

v2:
   re-sending DT bindings and code changes as one patch

 Documentation/devicetree/bindings/display/imx/fsl,imx-fb.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx-fb.txt b/Documentation/devicetree/bindings/display/imx/fsl,imx-fb.txt
index 7a5c0e2..e5a8b36 100644
--- a/Documentation/devicetree/bindings/display/imx/fsl,imx-fb.txt
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx-fb.txt
@@ -13,6 +13,8 @@ Required nodes:
 	Additional, the display node has to define properties:
 	- bits-per-pixel: Bits per pixel
 	- fsl,pcr: LCDC PCR value
+	A display node may optionally define
+	- fsl,aus-mode: boolean to enable AUS mode (only for imx21)
 
 Optional properties:
 - lcd-supply: Regulator for LCD supply voltage.
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
