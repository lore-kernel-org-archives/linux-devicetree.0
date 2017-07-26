From: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Subject: [PATCH] drm: hdlcd: allow HDLCD to be used without interrupt
Date: Wed, 26 Jul 2017 11:05:39 +0100
Message-ID: <E1daJCF-0003pG-DI@rmk-PC.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Brian Starkey <brian.starkey-5wv7dgnIgG8@public.gmane.org>, Mali DP Maintainers <malidp-VeJGdqYn5oNWk0Htik3J/w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Some ARM platforms do not wire the HDLCD interrupt.  Allow hdlcd to
initialise without an interrupt present.

Signed-off-by: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
---
 Documentation/devicetree/bindings/display/arm,hdlcd.txt |  6 +++---
 drivers/gpu/drm/arm/hdlcd_drv.c                         | 13 ++++++++-----
 2 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/arm,hdlcd.txt b/Documentation/devicetree/bindings/display/arm,hdlcd.txt
index 78bc24296f3e..7f78b455c4b2 100644
--- a/Documentation/devicetree/bindings/display/arm,hdlcd.txt
+++ b/Documentation/devicetree/bindings/display/arm,hdlcd.txt
@@ -8,9 +8,6 @@ digital encoder (DVI or HDMI).
 Required properties:
   - compatible: "arm,hdlcd"
   - reg: Physical base address and length of the controller's registers.
-  - interrupts: One interrupt used by the display controller to notify the
-    interrupt controller when any of the interrupt sources programmed in
-    the interrupt mask register have activated.
   - clocks: A list of phandle + clock-specifier pairs, one for each
     entry in 'clock-names'.
   - clock-names: A list of clock names. For HDLCD it should contain:
@@ -22,6 +19,9 @@ digital encoder (DVI or HDMI).
     Documentation/devicetree/bindings/graph.txt.
 
 Optional properties:
+  - interrupts: One interrupt used by the display controller to notify the
+    interrupt controller when any of the interrupt sources programmed in
+    the interrupt mask register have activated.
   - memory-region: phandle to a node describing memory (see
     Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt) to be
     used for the framebuffer; if not present, the framebuffer may be located
diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_drv.c
index d3da87fbd85a..283c435fe90b 100644
--- a/drivers/gpu/drm/arm/hdlcd_drv.c
+++ b/drivers/gpu/drm/arm/hdlcd_drv.c
@@ -36,7 +36,7 @@ static int hdlcd_load(struct drm_device *drm, unsigned long flags)
 	struct platform_device *pdev = to_platform_device(drm->dev);
 	struct resource *res;
 	u32 version;
-	int ret;
+	int ret, irq;
 
 	hdlcd->clk = devm_clk_get(drm->dev, "pxlclk");
 	if (IS_ERR(hdlcd->clk))
@@ -82,10 +82,13 @@ static int hdlcd_load(struct drm_device *drm, unsigned long flags)
 		goto setup_fail;
 	}
 
-	ret = drm_irq_install(drm, platform_get_irq(pdev, 0));
-	if (ret < 0) {
-		DRM_ERROR("failed to install IRQ handler\n");
-		goto irq_fail;
+	irq = platform_get_irq(pdev, 0);
+	if (irq > 0) {
+		ret = drm_irq_install(drm, irq);
+		if (ret < 0) {
+			DRM_ERROR("failed to install IRQ handler\n");
+			goto irq_fail;
+		}
 	}
 
 	return 0;
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
