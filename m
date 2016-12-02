From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [RESEND PATCH v2 1/7] drm/vc4: Fix ->clock_select setting for the VEC encoder
Date: Fri,  2 Dec 2016 14:48:07 +0100
Message-ID: <1480686493-4813-2-git-send-email-boris.brezillon@free-electrons.com>
References: <1480686493-4813-1-git-send-email-boris.brezillon@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1480686493-4813-1-git-send-email-boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

PV_CONTROL_CLK_SELECT_VEC is actually 2 and not 0. Fix the definition and
rework the vc4_set_crtc_possible_masks() to cover the full range of the
PV_CONTROL_CLK_SELECT field.

Signed-off-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 38 +++++++++++++++++++++++---------------
 drivers/gpu/drm/vc4/vc4_drv.h  |  1 +
 drivers/gpu/drm/vc4/vc4_regs.h |  3 ++-
 3 files changed, 26 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 7f08d681a74b..c317e9103f9b 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -83,8 +83,7 @@ struct vc4_crtc_data {
 	/* Which channel of the HVS this pixelvalve sources from. */
 	int hvs_channel;
 
-	enum vc4_encoder_type encoder0_type;
-	enum vc4_encoder_type encoder1_type;
+	enum vc4_encoder_type encoder_types[4];
 };
 
 #define CRTC_WRITE(offset, val) writel(val, vc4_crtc->regs + (offset))
@@ -859,20 +858,26 @@ static const struct drm_crtc_helper_funcs vc4_crtc_helper_funcs = {
 
 static const struct vc4_crtc_data pv0_data = {
 	.hvs_channel = 0,
-	.encoder0_type = VC4_ENCODER_TYPE_DSI0,
-	.encoder1_type = VC4_ENCODER_TYPE_DPI,
+	.encoder_types = {
+		[PV_CONTROL_CLK_SELECT_DSI] = VC4_ENCODER_TYPE_DSI0,
+		[PV_CONTROL_CLK_SELECT_DPI_SMI_HDMI] = VC4_ENCODER_TYPE_DPI,
+	},
 };
 
 static const struct vc4_crtc_data pv1_data = {
 	.hvs_channel = 2,
-	.encoder0_type = VC4_ENCODER_TYPE_DSI1,
-	.encoder1_type = VC4_ENCODER_TYPE_SMI,
+	.encoder_types = {
+		[PV_CONTROL_CLK_SELECT_DSI] = VC4_ENCODER_TYPE_DSI1,
+		[PV_CONTROL_CLK_SELECT_DPI_SMI_HDMI] = VC4_ENCODER_TYPE_SMI,
+	},
 };
 
 static const struct vc4_crtc_data pv2_data = {
 	.hvs_channel = 1,
-	.encoder0_type = VC4_ENCODER_TYPE_VEC,
-	.encoder1_type = VC4_ENCODER_TYPE_HDMI,
+	.encoder_types = {
+		[PV_CONTROL_CLK_SELECT_DPI_SMI_HDMI] = VC4_ENCODER_TYPE_HDMI,
+		[PV_CONTROL_CLK_SELECT_VEC] = VC4_ENCODER_TYPE_VEC,
+	},
 };
 
 static const struct of_device_id vc4_crtc_dt_match[] = {
@@ -886,17 +891,20 @@ static void vc4_set_crtc_possible_masks(struct drm_device *drm,
 					struct drm_crtc *crtc)
 {
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
+	const struct vc4_crtc_data *crtc_data = vc4_crtc->data;
+	const enum vc4_encoder_type *encoder_types = crtc_data->encoder_types;
 	struct drm_encoder *encoder;
 
 	drm_for_each_encoder(encoder, drm) {
 		struct vc4_encoder *vc4_encoder = to_vc4_encoder(encoder);
-
-		if (vc4_encoder->type == vc4_crtc->data->encoder0_type) {
-			vc4_encoder->clock_select = 0;
-			encoder->possible_crtcs |= drm_crtc_mask(crtc);
-		} else if (vc4_encoder->type == vc4_crtc->data->encoder1_type) {
-			vc4_encoder->clock_select = 1;
-			encoder->possible_crtcs |= drm_crtc_mask(crtc);
+		int i;
+
+		for (i = 0; i < ARRAY_SIZE(crtc_data->encoder_types); i++) {
+			if (vc4_encoder->type == encoder_types[i]) {
+				vc4_encoder->clock_select = i;
+				encoder->possible_crtcs |= drm_crtc_mask(crtc);
+				break;
+			}
 		}
 	}
 }
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 7c1e4d97486f..946d48c33668 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -194,6 +194,7 @@ to_vc4_plane(struct drm_plane *plane)
 }
 
 enum vc4_encoder_type {
+	VC4_ENCODER_TYPE_NONE,
 	VC4_ENCODER_TYPE_HDMI,
 	VC4_ENCODER_TYPE_VEC,
 	VC4_ENCODER_TYPE_DSI0,
diff --git a/drivers/gpu/drm/vc4/vc4_regs.h b/drivers/gpu/drm/vc4/vc4_regs.h
index 1aa44c2db556..39f6886b2410 100644
--- a/drivers/gpu/drm/vc4/vc4_regs.h
+++ b/drivers/gpu/drm/vc4/vc4_regs.h
@@ -177,8 +177,9 @@
 # define PV_CONTROL_WAIT_HSTART			BIT(12)
 # define PV_CONTROL_PIXEL_REP_MASK		VC4_MASK(5, 4)
 # define PV_CONTROL_PIXEL_REP_SHIFT		4
-# define PV_CONTROL_CLK_SELECT_DSI_VEC		0
+# define PV_CONTROL_CLK_SELECT_DSI		0
 # define PV_CONTROL_CLK_SELECT_DPI_SMI_HDMI	1
+# define PV_CONTROL_CLK_SELECT_VEC		2
 # define PV_CONTROL_CLK_SELECT_MASK		VC4_MASK(3, 2)
 # define PV_CONTROL_CLK_SELECT_SHIFT		2
 # define PV_CONTROL_FIFO_CLR			BIT(1)
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
