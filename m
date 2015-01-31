From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 01/11] drm/encoder: allow encoders to remember their of_node
Date: Sat, 31 Jan 2015 17:32:54 +0100
Message-ID: <1422721984-27782-2-git-send-email-heiko@sntech.de>
References: <1422721984-27782-1-git-send-email-heiko@sntech.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1422721984-27782-1-git-send-email-heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: airlied-cv59FeDIM0c@public.gmane.org, mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org
Cc: robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add an of_node field to struct drm_encoder to let encoders optionally
remember from which devicetree node they originated.

Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
---
 include/drm/drm_crtc.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index cc369f3..0448732 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -527,6 +527,7 @@ struct drm_encoder_funcs {
 /**
  * struct drm_encoder - central DRM encoder structure
  * @dev: parent DRM device
+ * @of_node: device node pointer to the bridge
  * @head: list management
  * @base: base KMS object
  * @name: encoder name
@@ -543,6 +544,9 @@ struct drm_encoder_funcs {
  */
 struct drm_encoder {
 	struct drm_device *dev;
+#ifdef CONFIG_OF
+	struct device_node *of_node;
+#endif
 	struct list_head head;
 
 	struct drm_mode_object base;
-- 
2.1.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
