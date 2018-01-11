From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 3/3] drm: rcar-du: add R8A77970 support
Date: Thu, 11 Jan 2018 19:54:35 +0300
Message-ID: <20180111170103.676775968@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline; filename=drm-rcar-du-add-R8A77970-support.patch
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add support for the R-Car  V3M  (R8A77970) SoC to the DU driver (this SoC
has only  1 display port). Note that there are some differences  with the
other R-Car gen3 SoCs in the LVDS encoder part, e.g. LVDPLLCR has the same
layout  as  on the R-Car gen2 SoCs...

Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>

---
 Documentation/devicetree/bindings/display/renesas,du.txt |    1 
 drivers/gpu/drm/rcar-du/rcar_du_drv.c                    |   23 +++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_drv.h                    |    1 
 drivers/gpu/drm/rcar-du/rcar_du_group.c                  |   10 +++---
 drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c                |   20 +++++++++----
 5 files changed, 45 insertions(+), 10 deletions(-)

Index: linux/Documentation/devicetree/bindings/display/renesas,du.txt
===================================================================
--- linux.orig/Documentation/devicetree/bindings/display/renesas,du.txt
+++ linux/Documentation/devicetree/bindings/display/renesas,du.txt
@@ -13,6 +13,7 @@ Required Properties:
     - "renesas,du-r8a7794" for R8A7794 (R-Car E2) compatible DU
     - "renesas,du-r8a7795" for R8A7795 (R-Car H3) compatible DU
     - "renesas,du-r8a7796" for R8A7796 (R-Car M3-W) compatible DU
+    - "renesas,du-r8a77970" for R8A77970 (R-Car V3M) compatible DU
 
   - reg: A list of base address and length of each memory resource, one for
     each entry in the reg-names property.
Index: linux/drivers/gpu/drm/rcar-du/rcar_du_drv.c
===================================================================
--- linux.orig/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ linux/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -258,6 +258,28 @@ static const struct rcar_du_device_info
 	.dpll_ch =  BIT(1),
 };
 
+static const struct rcar_du_device_info rcar_du_r8a77970_info = {
+	.gen = 3,
+	.model = R8A77970,
+	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
+		  | RCAR_DU_FEATURE_EXT_CTRL_REGS
+		  | RCAR_DU_FEATURE_VSP1_SOURCE,
+	.num_crtcs = 1,
+	.routes = {
+		/* R8A77970 has one RGB output and one LVDS output. */
+		[RCAR_DU_OUTPUT_DPAD0] = {
+			.possible_crtcs = BIT(0),
+			.port = 1,
+		},
+		[RCAR_DU_OUTPUT_LVDS0] = {
+			.possible_crtcs = BIT(0),
+			.port = 0,
+		},
+	},
+	.num_lvds = 1,
+	.dpll_ch  = BIT(1),
+};
+
 static const struct of_device_id rcar_du_of_table[] = {
 	{ .compatible = "renesas,du-r8a7743", .data = &rzg1_du_r8a7743_info },
 	{ .compatible = "renesas,du-r8a7745", .data = &rzg1_du_r8a7745_info },
@@ -269,6 +291,7 @@ static const struct of_device_id rcar_du
 	{ .compatible = "renesas,du-r8a7794", .data = &rcar_du_r8a7794_info },
 	{ .compatible = "renesas,du-r8a7795", .data = &rcar_du_r8a7795_info },
 	{ .compatible = "renesas,du-r8a7796", .data = &rcar_du_r8a7796_info },
+	{ .compatible = "renesas,du-r8a77970", .data = &rcar_du_r8a77970_info },
 	{ }
 };
 
Index: linux/drivers/gpu/drm/rcar-du/rcar_du_drv.h
===================================================================
--- linux.orig/drivers/gpu/drm/rcar-du/rcar_du_drv.h
+++ linux/drivers/gpu/drm/rcar-du/rcar_du_drv.h
@@ -59,6 +59,7 @@ enum rcar_du_model {
 	R8A7794,
 	R8A7795,
 	R8A7796,
+	R8A77970,
 };
 
 /*
Index: linux/drivers/gpu/drm/rcar-du/rcar_du_group.c
===================================================================
--- linux.orig/drivers/gpu/drm/rcar-du/rcar_du_group.c
+++ linux/drivers/gpu/drm/rcar-du/rcar_du_group.c
@@ -133,10 +133,12 @@ static void rcar_du_group_setup(struct r
 	rcar_du_group_write(rgrp, DORCR, DORCR_PG1D_DS1 | DORCR_DPRS);
 
 	/* Apply planes to CRTCs association. */
-	mutex_lock(&rgrp->lock);
-	rcar_du_group_write(rgrp, DPTSR, (rgrp->dptsr_planes << 16) |
-			    rgrp->dptsr_planes);
-	mutex_unlock(&rgrp->lock);
+	if (rcdu->info->num_crtcs > 1) {
+		mutex_lock(&rgrp->lock);
+		rcar_du_group_write(rgrp, DPTSR, (rgrp->dptsr_planes << 16) |
+				    rgrp->dptsr_planes);
+		mutex_unlock(&rgrp->lock);
+	}
 }
 
 /*
Index: linux/drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c
===================================================================
--- linux.orig/drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c
+++ linux/drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c
@@ -71,8 +71,10 @@ static int rcar_du_lvdsenc_start(struct
 				 struct rcar_du_crtc *rcrtc)
 {
 	u32 lvdhcr, lvdpllcr, lvdcr0 = lvds->mode << LVDCR0_LVMD_SHIFT;
+	const struct rcar_du_device_info *info = lvds->dev->info;
 	const struct drm_display_mode *mode = &rcrtc->crtc.mode;
-	unsigned int gen = lvds->dev->info->gen;
+	unsigned int gen = info->gen;
+	enum rcar_du_model model = info->model;
 	unsigned int freq = mode->clock;
 	int ret;
 
@@ -104,7 +106,7 @@ static int rcar_du_lvdsenc_start(struct
 	rcar_lvds_write(lvds, LVDCHCR, lvdhcr);
 
 	/* PLL clock configuration */
-	if (gen < 3)
+	if (gen < 3 || model == R8A77970)
 		lvdpllcr = rcar_lvds_gen2_lvdpllcr(freq);
 	else
 		lvdpllcr = rcar_lvds_gen3_lvdpllcr(freq);
@@ -136,6 +138,12 @@ static int rcar_du_lvdsenc_start(struct
 		rcar_lvds_write(lvds, LVDCR0, lvdcr0);
 	}
 
+	/* Turn on the LVDS PHY on R-Car V3M. */
+	if (model == R8A77970) {
+		lvdcr0 |= LVDCR0_LVEN;
+		rcar_lvds_write(lvds, LVDCR0, lvdcr0);
+	}
+
 	/* Wait for the startup delay. */
 	usleep_range(100, 150);
 
@@ -177,14 +185,14 @@ int rcar_du_lvdsenc_enable(struct rcar_d
 void rcar_du_lvdsenc_atomic_check(struct rcar_du_lvdsenc *lvds,
 				  struct drm_display_mode *mode)
 {
-	struct rcar_du_device *rcdu = lvds->dev;
+	const struct rcar_du_device_info *info = lvds->dev->info;
 
 	/*
 	 * The internal LVDS encoder has a restricted clock frequency operating
-	 * range (30MHz to 150MHz on Gen2, 25.175MHz to 148.5MHz on Gen3). Clamp
-	 * the clock accordingly.
+	 * range (30MHz to 150MHz on Gen2 and R-Car V3M, 25.175MHz to 148.5MHz
+	 * on Gen3). Clamp the clock accordingly.
 	 */
-	if (rcdu->info->gen < 3)
+	if (info->gen < 3 || info->model == R8A77970)
 		mode->clock = clamp(mode->clock, 30000, 150000);
 	else
 		mode->clock = clamp(mode->clock, 25175, 148500);

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
