From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: [PATCH v4 3/3] drm/vc4: Add specific compatible strings for Cygnus.
Date: Fri, 28 Apr 2017 15:42:23 -0700
Message-ID: <20170428224223.21904-3-eric@anholt.net>
References: <20170428224223.21904-1-eric@anholt.net>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170428224223.21904-1-eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Cygnus has V3D 2.6 instead of 2.1, and doesn't use the VC4 display
modules.  The V3D can be uniquely identified by the IDENT[01]
registers, and there's nothing to key off of for the display change
other than the lack of DT nodes for the display components, but it's
convention to have new compatible strings anyway.

Signed-off-by: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 Documentation/devicetree/bindings/display/brcm,bcm-vc4.txt | 4 ++--
 drivers/gpu/drm/vc4/vc4_drv.c                              | 1 +
 drivers/gpu/drm/vc4/vc4_v3d.c                              | 1 +
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/brcm,bcm-vc4.txt b/Documentation/devicetree/bindings/display/brcm,bcm-vc4.txt
index bc1756f4f791..284e2b14cfbe 100644
--- a/Documentation/devicetree/bindings/display/brcm,bcm-vc4.txt
+++ b/Documentation/devicetree/bindings/display/brcm,bcm-vc4.txt
@@ -5,7 +5,7 @@ with HDMI output and the HVS (Hardware Video Scaler) for compositing
 display planes.
 
 Required properties for VC4:
-- compatible:	Should be "brcm,bcm2835-vc4"
+- compatible:	Should be "brcm,bcm2835-vc4" or "brcm,cygnus-vc4"
 
 Required properties for Pixel Valve:
 - compatible:	Should be one of "brcm,bcm2835-pixelvalve0",
@@ -54,7 +54,7 @@ Required properties for VEC:
 		  See bindings/interrupt-controller/brcm,bcm2835-armctrl-ic.txt
 
 Required properties for V3D:
-- compatible:	Should be "brcm,bcm2835-v3d"
+- compatible:	Should be "brcm,bcm2835-v3d" or "brcm,cygnus-v3d"
 - reg:		Physical base address and length of the V3D's registers
 - interrupts:	The interrupt number
 		  See bindings/interrupt-controller/brcm,bcm2835-armctrl-ic.txt
diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index 92fb9a41fe7c..754ce76d4b98 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -335,6 +335,7 @@ static int vc4_platform_drm_remove(struct platform_device *pdev)
 
 static const struct of_device_id vc4_of_match[] = {
 	{ .compatible = "brcm,bcm2835-vc4", },
+	{ .compatible = "brcm,cygnus-vc4", },
 	{},
 };
 MODULE_DEVICE_TABLE(of, vc4_of_match);
diff --git a/drivers/gpu/drm/vc4/vc4_v3d.c b/drivers/gpu/drm/vc4/vc4_v3d.c
index 7500820e5cd5..c53afec34586 100644
--- a/drivers/gpu/drm/vc4/vc4_v3d.c
+++ b/drivers/gpu/drm/vc4/vc4_v3d.c
@@ -450,6 +450,7 @@ static int vc4_v3d_dev_remove(struct platform_device *pdev)
 
 static const struct of_device_id vc4_v3d_dt_match[] = {
 	{ .compatible = "brcm,bcm2835-v3d" },
+	{ .compatible = "brcm,cygnus-v3d" },
 	{ .compatible = "brcm,vc4-v3d" },
 	{}
 };
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
