From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH] rcar-du: add R8A7792 support
Date: Thu, 04 Aug 2016 15:01:02 -0700 (PDT)
Message-ID: <1934824.sESTIjSbbp@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add support for the R8A7792 DU; it has 2 DPAD (RGB) outputs.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>

---
This patch is against the 'drm/next/du' branch of Laurent Pinchart's 'media.git'
repo...

 Documentation/devicetree/bindings/display/renesas,du.txt |    4 ++
 drivers/gpu/drm/rcar-du/rcar_du_drv.c                    |   22 +++++++++++++++
 2 files changed, 25 insertions(+), 1 deletion(-)

Index: media/Documentation/devicetree/bindings/display/renesas,du.txt
===================================================================
--- media.orig/Documentation/devicetree/bindings/display/renesas,du.txt
+++ media/Documentation/devicetree/bindings/display/renesas,du.txt
@@ -6,6 +6,7 @@ Required Properties:
     - "renesas,du-r8a7779" for R8A7779 (R-Car H1) compatible DU
     - "renesas,du-r8a7790" for R8A7790 (R-Car H2) compatible DU
     - "renesas,du-r8a7791" for R8A7791 (R-Car M2-W) compatible DU
+    - "renesas,du-r8a7792" for R8A7792 (R-Car V2H) compatible DU
     - "renesas,du-r8a7793" for R8A7793 (R-Car M2-N) compatible DU
     - "renesas,du-r8a7794" for R8A7794 (R-Car E2) compatible DU
     - "renesas,du-r8a7795" for R8A7795 (R-Car H3) compatible DU
@@ -25,7 +26,7 @@ Required Properties:
   - clock-names: Name of the clocks. This property is model-dependent.
     - R8A7779 uses a single functional clock. The clock doesn't need to be
       named.
-    - R8A779[01345] use one functional clock per channel and one clock per LVDS
+    - R8A779[012345] use one functional clock per channel and one clock per LVDS
       encoder (if available). The functional clocks must be named "du.x" with
       "x" being the channel numerical index. The LVDS clocks must be named
       "lvds.x" with "x" being the LVDS encoder numerical index.
@@ -47,6 +48,7 @@ corresponding to each DU output.
  R8A7779 (H1)	DPAD 0		DPAD 1		-		-
  R8A7790 (H2)	DPAD		LVDS 0		LVDS 1		-
  R8A7791 (M2-W)	DPAD		LVDS 0		-		-
+ R8A7792 (V2H)	DPAD 0		DPAD 1		-		-
  R8A7793 (M2-N)	DPAD		LVDS 0		-		-
  R8A7794 (E2)	DPAD 0		DPAD 1		-		-
  R8A7795 (H3)	DPAD		HDMI 0		HDMI 1		LVDS
Index: media/drivers/gpu/drm/rcar-du/rcar_du_drv.c
===================================================================
--- media.orig/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ media/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -110,6 +110,27 @@ static const struct rcar_du_device_info
 	.num_lvds = 1,
 };
 
+static const struct rcar_du_device_info rcar_du_r8a7792_info = {
+	.gen = 2,
+	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
+		  | RCAR_DU_FEATURE_EXT_CTRL_REGS,
+	.num_crtcs = 2,
+	.routes = {
+		/* R8A7792 has two RGB outputs. */
+		[RCAR_DU_OUTPUT_DPAD0] = {
+			.possible_crtcs = BIT(0),
+			.encoder_type = DRM_MODE_ENCODER_NONE,
+			.port = 0,
+		},
+		[RCAR_DU_OUTPUT_DPAD1] = {
+			.possible_crtcs = BIT(1),
+			.encoder_type = DRM_MODE_ENCODER_NONE,
+			.port = 1,
+		},
+	},
+	.num_lvds = 0,
+};
+
 static const struct rcar_du_device_info rcar_du_r8a7794_info = {
 	.gen = 2,
 	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
@@ -161,6 +182,7 @@ static const struct of_device_id rcar_du
 	{ .compatible = "renesas,du-r8a7779", .data = &rcar_du_r8a7779_info },
 	{ .compatible = "renesas,du-r8a7790", .data = &rcar_du_r8a7790_info },
 	{ .compatible = "renesas,du-r8a7791", .data = &rcar_du_r8a7791_info },
+	{ .compatible = "renesas,du-r8a7792", .data = &rcar_du_r8a7792_info },
 	{ .compatible = "renesas,du-r8a7793", .data = &rcar_du_r8a7791_info },
 	{ .compatible = "renesas,du-r8a7794", .data = &rcar_du_r8a7794_info },
 	{ .compatible = "renesas,du-r8a7795", .data = &rcar_du_r8a7795_info },

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
