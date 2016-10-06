From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH 5/9] drm/sun4i: Add compatible strings for
 A31/A31s display pipelines
Date: Fri,  7 Oct 2016 00:06:25 +0800
Message-ID: <20161006160629.11198-6-wens@csie.org>
References: <20161006160629.11198-1-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBC7N3G7QKGQEXOICRPQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20161006160629.11198-1-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

The A31's display pipeline has 2 frontends, 2 backends, and 2 TCONs. It
also has new display enhancement blocks, such as the DRC (Dynamic Range
Controller), the DEU (Display Enhancement Unit), and the CMU (Color
Management Unit). It supports HDMI, MIPI DSI, and 2 LCD/LVDS channels.

The A31s display pipeline is almost the same, just without MIPI DSI.
Only the TCON seems to be different, due to the missing mux for MIPI
DSI.

Add compatible strings for both of them.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt | 4 ++++
 drivers/gpu/drm/sun4i/sun4i_backend.c                         | 1 +
 drivers/gpu/drm/sun4i/sun4i_drv.c                             | 3 +++
 3 files changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
index 15fdca8909f2..b82c00449468 100644
--- a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
+++ b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
@@ -91,6 +91,7 @@ system.
 Required properties:
   - compatible: value must be one of:
     * allwinner,sun5i-a13-display-backend
+    * allwinner,sun6i-a31-display-backend
     * allwinner,sun8i-a33-display-backend
   - reg: base address and size of the memory-mapped region.
   - clocks: phandles to the clocks feeding the frontend and backend
@@ -121,6 +122,7 @@ deinterlacing and color space conversion.
 Required properties:
   - compatible: value must be one of:
     * allwinner,sun5i-a13-display-frontend
+    * allwinner,sun6i-a31-display-frontend
     * allwinner,sun8i-a33-display-frontend
   - reg: base address and size of the memory-mapped region.
   - interrupts: interrupt associated to this IP
@@ -146,6 +148,8 @@ extra node.
 Required properties:
   - compatible: value must be one of:
     * allwinner,sun5i-a13-display-engine
+    * allwinner,sun6i-a31-display-engine
+    * allwinner,sun6i-a31s-display-engine
     * allwinner,sun8i-a33-display-engine
 
   - allwinner,pipelines: list of phandle to the display engine
diff --git a/drivers/gpu/drm/sun4i/sun4i_backend.c b/drivers/gpu/drm/sun4i/sun4i_backend.c
index 32c0584e3c35..6e6c59a661b6 100644
--- a/drivers/gpu/drm/sun4i/sun4i_backend.c
+++ b/drivers/gpu/drm/sun4i/sun4i_backend.c
@@ -408,6 +408,7 @@ static int sun4i_backend_remove(struct platform_device *pdev)
 
 static const struct of_device_id sun4i_backend_of_table[] = {
 	{ .compatible = "allwinner,sun5i-a13-display-backend" },
+	{ .compatible = "allwinner,sun6i-a31-display-backend" },
 	{ .compatible = "allwinner,sun8i-a33-display-backend" },
 	{ }
 };
diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
index 35af3728c4ee..480a709cc324 100644
--- a/drivers/gpu/drm/sun4i/sun4i_drv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
@@ -200,6 +200,7 @@ static const struct component_master_ops sun4i_drv_master_ops = {
 static bool sun4i_drv_node_is_frontend(struct device_node *node)
 {
 	return of_device_is_compatible(node, "allwinner,sun5i-a13-display-frontend") ||
+		of_device_is_compatible(node, "allwinner,sun6i-a31-display-frontend") ||
 		of_device_is_compatible(node, "allwinner,sun8i-a33-display-frontend");
 }
 
@@ -323,6 +324,8 @@ static int sun4i_drv_remove(struct platform_device *pdev)
 
 static const struct of_device_id sun4i_drv_of_table[] = {
 	{ .compatible = "allwinner,sun5i-a13-display-engine" },
+	{ .compatible = "allwinner,sun6i-a31-display-engine" },
+	{ .compatible = "allwinner,sun6i-a31s-display-engine" },
 	{ .compatible = "allwinner,sun8i-a33-display-engine" },
 	{ }
 };
-- 
2.9.3
