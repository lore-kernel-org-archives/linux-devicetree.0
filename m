From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 3/3] drm: rcar-du: lvds: add R8A77970 support
Date: Fri, 19 Jan 2018 21:29:21 +0300
Message-ID: <20180119183557.226328412__16104.8356364065$1516386874$gmane$org@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline; filename=drm-rcar-du-lvds-add-R8A77970-support.patch
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add support for the R-Car V3M (R8A77970) SoC to the LVDS encoder driver.
Note that there are some differences with the other R-Car gen3 SoCs, e.g.
LVDPLLCR has the same layout as in the R-Car gen2 SoCs...

Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>

---
 drivers/gpu/drm/rcar-du/rcar_lvds.c |   21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

Index: linux/drivers/gpu/drm/rcar-du/rcar_lvds.c
===================================================================
--- linux.orig/drivers/gpu/drm/rcar-du/rcar_lvds.c
+++ linux/drivers/gpu/drm/rcar-du/rcar_lvds.c
@@ -32,6 +32,10 @@ enum rcar_lvds_mode {
 };
 
 #define RCAR_LVDS_QUIRK_LANES	(1 << 0)	/* LVDS lanes 1 and 3 inverted */
+#define RCAR_LVDS_QUIRK_GEN2_PLLCR (1 << 1)	/* LVDPLLCR has gen2-like */
+						/* layout on R8A77970 */
+#define RCAR_LVDS_QUIRK_PHY	(1 << 2)	/* LVDS has PHY on R8A77970 */
+						/* and  R8A7799{0|5} */
 
 struct rcar_lvds_device_info {
 	unsigned int gen;
@@ -162,6 +166,7 @@ static void rcar_lvds_enable(struct drm_
 	 */
 	struct drm_crtc *crtc = lvds->bridge.encoder->crtc;
 	const struct drm_display_mode *mode = &lvds->display_mode;
+	unsigned int quirks = lvds->info->quirks;
 	unsigned int gen = lvds->info->gen;
 	u32 lvdcr0 = lvds->mode << LVDCR0_LVMD_SHIFT;
 	u32 lvdpllcr;
@@ -186,7 +191,7 @@ static void rcar_lvds_enable(struct drm_
 			LVDCTRCR_CTR2SEL_DISP | LVDCTRCR_CTR1SEL_VSYNC |
 			LVDCTRCR_CTR0SEL_HSYNC);
 
-	if (lvds->info->quirks & RCAR_LVDS_QUIRK_LANES)
+	if (quirks & RCAR_LVDS_QUIRK_LANES)
 		lvdhcr = LVDCHCR_CHSEL_CH(0, 0) | LVDCHCR_CHSEL_CH(1, 3)
 		       | LVDCHCR_CHSEL_CH(2, 2) | LVDCHCR_CHSEL_CH(3, 1);
 	else
@@ -195,7 +200,7 @@ static void rcar_lvds_enable(struct drm_
 	rcar_lvds_write(lvds, LVDCHCR, lvdhcr);
 
 	/* PLL clock configuration */
-	if (gen < 3)
+	if (gen < 3 || quirks & RCAR_LVDS_QUIRK_GEN2_PLLCR)
 		lvdpllcr = rcar_lvds_lvdpllcr_gen2(mode->clock);
 	else
 		lvdpllcr = rcar_lvds_lvdpllcr_gen3(mode->clock);
@@ -227,6 +232,12 @@ static void rcar_lvds_enable(struct drm_
 		rcar_lvds_write(lvds, LVDCR0, lvdcr0);
 	}
 
+	if (quirks & RCAR_LVDS_QUIRK_PHY) {
+		/* Turn on the LVDS PHY. */
+		lvdcr0 |= LVDCR0_LVEN;
+		rcar_lvds_write(lvds, LVDCR0, lvdcr0);
+	}
+
 	/* Wait for the startup delay. */
 	usleep_range(100, 150);
 
@@ -499,6 +510,11 @@ static const struct rcar_lvds_device_inf
 	.gen = 3,
 };
 
+static const struct rcar_lvds_device_info rcar_lvds_r8a77970_info = {
+	.gen = 3,
+	.quirks = RCAR_LVDS_QUIRK_GEN2_PLLCR | RCAR_LVDS_QUIRK_PHY,
+};
+
 static const struct of_device_id rcar_lvds_of_table[] = {
 	{ .compatible = "renesas,r8a7743-lvds", .data = &rcar_lvds_gen2_info },
 	{ .compatible = "renesas,r8a7790-lvds", .data = &rcar_lvds_r8a7790_info },
@@ -506,6 +522,7 @@ static const struct of_device_id rcar_lv
 	{ .compatible = "renesas,r8a7793-lvds", .data = &rcar_lvds_gen2_info },
 	{ .compatible = "renesas,r8a7795-lvds", .data = &rcar_lvds_gen3_info },
 	{ .compatible = "renesas,r8a7796-lvds", .data = &rcar_lvds_gen3_info },
+	{ .compatible = "renesas,r8a77970-lvds", .data = &rcar_lvds_r8a77970_info },
 	{ }
 };
 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
