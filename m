From: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
Subject: [PATCH 1/9] drm/fb-cma-helper: Add drm_fbdev_cma_set_suspend_unlocked()
Date: Sun, 22 Jan 2017 19:11:09 +0100
Message-ID: <20170122181117.8210-2-noralf@tronnes.org>
References: <20170122181117.8210-1-noralf@tronnes.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170122181117.8210-1-noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add a CMA version of drm_fb_helper_set_suspend_unlocked().

Cc: laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org
Signed-off-by: Noralf Trønnes <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
---
 drivers/gpu/drm/drm_fb_cma_helper.c | 18 ++++++++++++++++++
 include/drm/drm_fb_cma_helper.h     |  2 ++
 2 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/drm_fb_cma_helper.c b/drivers/gpu/drm/drm_fb_cma_helper.c
index 4364abf..0ef8b28 100644
--- a/drivers/gpu/drm/drm_fb_cma_helper.c
+++ b/drivers/gpu/drm/drm_fb_cma_helper.c
@@ -622,3 +622,21 @@ void drm_fbdev_cma_set_suspend(struct drm_fbdev_cma *fbdev_cma, int state)
 		drm_fb_helper_set_suspend(&fbdev_cma->fb_helper, state);
 }
 EXPORT_SYMBOL(drm_fbdev_cma_set_suspend);
+
+/**
+ * drm_fbdev_cma_set_suspend_unlocked - wrapper around
+ *                                      drm_fb_helper_set_suspend_unlocked
+ * @fbdev_cma: The drm_fbdev_cma struct, may be NULL
+ * @state: desired state, zero to resume, non-zero to suspend
+ *
+ * Calls drm_fb_helper_set_suspend, which is a wrapper around
+ * fb_set_suspend implemented by fbdev core.
+ */
+void drm_fbdev_cma_set_suspend_unlocked(struct drm_fbdev_cma *fbdev_cma,
+					int state)
+{
+	if (fbdev_cma)
+		drm_fb_helper_set_suspend_unlocked(&fbdev_cma->fb_helper,
+						   state);
+}
+EXPORT_SYMBOL(drm_fbdev_cma_set_suspend_unlocked);
diff --git a/include/drm/drm_fb_cma_helper.h b/include/drm/drm_fb_cma_helper.h
index 9f4e34e..8dd6e55 100644
--- a/include/drm/drm_fb_cma_helper.h
+++ b/include/drm/drm_fb_cma_helper.h
@@ -26,6 +26,8 @@ void drm_fbdev_cma_fini(struct drm_fbdev_cma *fbdev_cma);
 void drm_fbdev_cma_restore_mode(struct drm_fbdev_cma *fbdev_cma);
 void drm_fbdev_cma_hotplug_event(struct drm_fbdev_cma *fbdev_cma);
 void drm_fbdev_cma_set_suspend(struct drm_fbdev_cma *fbdev_cma, int state);
+void drm_fbdev_cma_set_suspend_unlocked(struct drm_fbdev_cma *fbdev_cma,
+					int state);
 
 void drm_fb_cma_destroy(struct drm_framebuffer *fb);
 int drm_fb_cma_create_handle(struct drm_framebuffer *fb,
-- 
2.10.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
