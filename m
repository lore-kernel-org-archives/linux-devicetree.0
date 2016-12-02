From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [RESEND PATCH v2 2/7] drm: Turn DRM_MODE_SUBCONNECTOR_xx definitions into an enum
Date: Fri,  2 Dec 2016 14:48:08 +0100
Message-ID: <1480686493-4813-3-git-send-email-boris.brezillon@free-electrons.com>
References: <1480686493-4813-1-git-send-email-boris.brezillon@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1480686493-4813-1-git-send-email-boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

List of values like the DRM_MODE_SUBCONNECTOR_xx ones are better
represented with enums.

Turn the DRM_MODE_SUBCONNECTOR_xx macros into an enum.

Signed-off-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Suggested-by: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
Reviewed-by: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
---
 include/uapi/drm/drm_mode.h | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index df0e3504c349..970bfc0d7107 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -220,14 +220,16 @@ struct drm_mode_get_encoder {
 
 /* This is for connectors with multiple signal types. */
 /* Try to match DRM_MODE_CONNECTOR_X as closely as possible. */
-#define DRM_MODE_SUBCONNECTOR_Automatic	0
-#define DRM_MODE_SUBCONNECTOR_Unknown	0
-#define DRM_MODE_SUBCONNECTOR_DVID	3
-#define DRM_MODE_SUBCONNECTOR_DVIA	4
-#define DRM_MODE_SUBCONNECTOR_Composite	5
-#define DRM_MODE_SUBCONNECTOR_SVIDEO	6
-#define DRM_MODE_SUBCONNECTOR_Component	8
-#define DRM_MODE_SUBCONNECTOR_SCART	9
+enum drm_mode_subconnector {
+	DRM_MODE_SUBCONNECTOR_Automatic = 0,
+	DRM_MODE_SUBCONNECTOR_Unknown = 0,
+	DRM_MODE_SUBCONNECTOR_DVID = 3,
+	DRM_MODE_SUBCONNECTOR_DVIA = 4,
+	DRM_MODE_SUBCONNECTOR_Composite = 5,
+	DRM_MODE_SUBCONNECTOR_SVIDEO = 6,
+	DRM_MODE_SUBCONNECTOR_Component = 8,
+	DRM_MODE_SUBCONNECTOR_SCART = 9,
+};
 
 #define DRM_MODE_CONNECTOR_Unknown	0
 #define DRM_MODE_CONNECTOR_VGA		1
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
