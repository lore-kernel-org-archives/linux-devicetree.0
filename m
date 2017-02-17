From: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH 9/9] drm/imx: use PRG/PRE when possible
Date: Fri, 17 Feb 2017 19:28:30 +0100
Message-ID: <20170217182830.32618-10-l.stach@pengutronix.de>
References: <20170217182830.32618-1-l.stach@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170217182830.32618-1-l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, patchwork-lst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Allow the planes to use the PRG/PRE units as linear prefetchers when
possible. This improves DRAM efficiency a bit and reduces the chance
for display underflow when the memory subsystem is under load.

This does not yet support scanning out tiled buffers directly, as this
needs more work, but it already wires up the basic interaction between
imx-drm, the IPUv3 driver and the PRG and PRE drivers.

Signed-off-by: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 drivers/gpu/drm/imx/imx-drm-core.c |   5 ++
 drivers/gpu/drm/imx/imx-drm.h      |   3 +
 drivers/gpu/drm/imx/ipuv3-plane.c  | 122 ++++++++++++++++++++++++++++++++++++-
 3 files changed, 127 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/imx/imx-drm-core.c b/drivers/gpu/drm/imx/imx-drm-core.c
index bef76cb0d05d..f3fd94046e3e 100644
--- a/drivers/gpu/drm/imx/imx-drm-core.c
+++ b/drivers/gpu/drm/imx/imx-drm-core.c
@@ -147,6 +147,11 @@ static int imx_drm_atomic_check(struct drm_device *dev,
 	if (ret)
 		return ret;
 
+	/* Assign PRG/PRE channels and check if all constrains are satisfied. */
+	ret = ipu_planes_assign_pre(dev, state);
+	if (ret)
+		return ret;
+
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/imx/imx-drm.h b/drivers/gpu/drm/imx/imx-drm.h
index 5a91cb16c8fa..485df472fd34 100644
--- a/drivers/gpu/drm/imx/imx-drm.h
+++ b/drivers/gpu/drm/imx/imx-drm.h
@@ -52,4 +52,7 @@ int imx_drm_encoder_parse_of(struct drm_device *drm,
 void imx_drm_connector_destroy(struct drm_connector *connector);
 void imx_drm_encoder_destroy(struct drm_encoder *encoder);
 
+int ipu_planes_assign_pre(struct drm_device *dev,
+			  struct drm_atomic_state *state);
+
 #endif /* _IMX_DRM_H_ */
diff --git a/drivers/gpu/drm/imx/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv3-plane.c
index 57130352db3b..6867cd7f2da3 100644
--- a/drivers/gpu/drm/imx/ipuv3-plane.c
+++ b/drivers/gpu/drm/imx/ipuv3-plane.c
@@ -23,6 +23,17 @@
 #include "video/imx-ipu-v3.h"
 #include "ipuv3-plane.h"
 
+struct ipu_plane_state {
+	struct drm_plane_state base;
+	bool use_pre;
+};
+
+static inline struct ipu_plane_state *
+to_ipu_plane_state(struct drm_plane_state *p)
+{
+	return container_of(p, struct ipu_plane_state, base);
+}
+
 static inline struct ipu_plane *to_ipu_plane(struct drm_plane *p)
 {
 	return container_of(p, struct ipu_plane, base);
@@ -225,6 +236,8 @@ static int ipu_disable_plane(struct drm_plane *plane)
 	ipu_dmfc_disable_channel(ipu_plane->dmfc);
 	if (ipu_plane->dp)
 		ipu_dp_disable(ipu_plane->ipu);
+	if (ipu_prg_present(ipu_plane->ipu))
+		ipu_prg_channel_disable(ipu_plane->ipu_ch);
 
 	return 0;
 }
@@ -239,13 +252,56 @@ static void ipu_plane_destroy(struct drm_plane *plane)
 	kfree(ipu_plane);
 }
 
+void ipu_plane_state_reset(struct drm_plane *plane)
+{
+	struct ipu_plane_state *ipu_state;
+
+	if (plane->state) {
+		ipu_state = to_ipu_plane_state(plane->state);
+		__drm_atomic_helper_plane_destroy_state(plane->state);
+		kfree(ipu_state);
+	}
+
+	ipu_state = kzalloc(sizeof(*ipu_state), GFP_KERNEL);
+
+	if (ipu_state) {
+		ipu_state->base.plane = plane;
+		ipu_state->base.rotation = DRM_ROTATE_0;
+	}
+
+	plane->state = &ipu_state->base;
+}
+
+struct drm_plane_state *ipu_plane_duplicate_state(struct drm_plane *plane)
+{
+	struct ipu_plane_state *state;
+
+	if (WARN_ON(!plane->state))
+		return NULL;
+
+	state = kmalloc(sizeof(*state), GFP_KERNEL);
+	if (state)
+		__drm_atomic_helper_plane_duplicate_state(plane, &state->base);
+
+	return &state->base;
+}
+
+void ipu_plane_destroy_state(struct drm_plane *plane,
+			     struct drm_plane_state *state)
+{
+	struct ipu_plane_state *ipu_state = to_ipu_plane_state(state);
+
+	__drm_atomic_helper_plane_destroy_state(state);
+	kfree(ipu_state);
+}
+
 static const struct drm_plane_funcs ipu_plane_funcs = {
 	.update_plane	= drm_atomic_helper_update_plane,
 	.disable_plane	= drm_atomic_helper_disable_plane,
 	.destroy	= ipu_plane_destroy,
-	.reset		= drm_atomic_helper_plane_reset,
-	.atomic_duplicate_state	= drm_atomic_helper_plane_duplicate_state,
-	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
+	.reset		= ipu_plane_state_reset,
+	.atomic_duplicate_state	= ipu_plane_duplicate_state,
+	.atomic_destroy_state	= ipu_plane_destroy_state,
 };
 
 static int ipu_plane_atomic_check(struct drm_plane *plane,
@@ -458,14 +514,30 @@ static void ipu_plane_atomic_disable(struct drm_plane *plane,
 	ipu_disable_plane(plane);
 }
 
+static int ipu_chan_assign_axi_id(int ipu_chan)
+{
+	switch (ipu_chan) {
+	case IPUV3_CHANNEL_MEM_BG_SYNC:
+		return 1;
+	case IPUV3_CHANNEL_MEM_FG_SYNC:
+		return 2;
+	case IPUV3_CHANNEL_MEM_DC_SYNC:
+		return 3;
+	default:
+		return 0;
+	}
+}
+
 static void ipu_plane_atomic_update(struct drm_plane *plane,
 				    struct drm_plane_state *old_state)
 {
 	struct ipu_plane *ipu_plane = to_ipu_plane(plane);
 	struct drm_plane_state *state = plane->state;
+	struct ipu_plane_state *ipu_state = to_ipu_plane_state(state);
 	struct drm_crtc_state *crtc_state = state->crtc->state;
 	struct drm_framebuffer *fb = state->fb;
 	struct drm_rect *dst = &state->dst;
+	unsigned int axi_id = ipu_chan_assign_axi_id(ipu_plane->dma);
 	unsigned long eba, ubo, vbo;
 	unsigned long alpha_eba = 0;
 	enum ipu_color_space ics;
@@ -476,7 +548,22 @@ static void ipu_plane_atomic_update(struct drm_plane *plane,
 
 	eba = drm_plane_state_to_eba(state, 0);
 
+	/*
+	 * Configure PRG channel and attached PRE, this changes the EBA to an
+	 * internal SRAM location.
+	 */
+	if (ipu_state->use_pre) {
+		ipu_prg_channel_configure(ipu_plane->ipu_ch, axi_id,
+					  drm_rect_width(&state->src) >> 16,
+					  drm_rect_height(&state->src) >> 16,
+					  state->fb->pitches[0],
+					  state->fb->pixel_format, &eba);
+	}
+
 	if (old_state->fb && !drm_atomic_crtc_needs_modeset(crtc_state)) {
+		/* nothing to do if PRE is used */
+		if (ipu_state->use_pre)
+			return;
 		active = ipu_idmac_get_current_buffer(ipu_plane->ipu_ch);
 		ipu_cpmem_set_buffer(ipu_plane->ipu_ch, !active, eba);
 		ipu_idmac_select_buffer(ipu_plane->ipu_ch, !active);
@@ -535,6 +622,7 @@ static void ipu_plane_atomic_update(struct drm_plane *plane,
 	ipu_cpmem_set_high_priority(ipu_plane->ipu_ch);
 	ipu_idmac_set_double_buffer(ipu_plane->ipu_ch, 1);
 	ipu_cpmem_set_stride(ipu_plane->ipu_ch, state->fb->pitches[0]);
+	ipu_cpmem_set_axi_id(ipu_plane->ipu_ch, axi_id);
 	switch (fb->pixel_format) {
 	case DRM_FORMAT_YUV420:
 	case DRM_FORMAT_YVU420:
@@ -610,6 +698,34 @@ static const struct drm_plane_helper_funcs ipu_plane_helper_funcs = {
 	.atomic_update = ipu_plane_atomic_update,
 };
 
+int ipu_planes_assign_pre(struct drm_device *dev,
+			  struct drm_atomic_state *state)
+{
+	struct drm_plane_state *plane_state;
+	struct drm_plane *plane;
+	int available_pres = ipu_prg_max_active_channels();
+	int i;
+
+	for_each_plane_in_state(state, plane, plane_state, i) {
+		struct ipu_plane_state *ipu_state =
+				to_ipu_plane_state(plane_state);
+		struct ipu_plane *ipu_plane = to_ipu_plane(plane);
+
+		if (ipu_prg_present(ipu_plane->ipu) && available_pres &&
+		    plane_state->fb &&
+		    ipu_prg_format_supported(ipu_plane->ipu,
+					     plane_state->fb->pixel_format,
+					     plane_state->fb->modifier)) {
+			ipu_state->use_pre = true;
+			available_pres--;
+		} else {
+			ipu_state->use_pre = false;
+		}
+	}
+
+	return 0;
+}
+
 struct ipu_plane *ipu_plane_init(struct drm_device *dev, struct ipu_soc *ipu,
 				 int dma, int dp, unsigned int possible_crtcs,
 				 enum drm_plane_type type)
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
