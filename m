From: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: [PATCH v4 5/5] drm: simpledrm: honour remove_conflicting_framebuffers()
Date: Mon, 22 Aug 2016 22:25:25 +0200
Message-ID: <1471897525-31118-6-git-send-email-noralf@tronnes.org>
References: <1471897525-31118-1-git-send-email-noralf@tronnes.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1471897525-31118-1-git-send-email-noralf@tronnes.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: robh@kernel.org, devicetree@vger.kernel.org, dh.herrmann@gmail.com, linux-kernel@vger.kernel.org, =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
List-Id: devicetree@vger.kernel.org

There is currently no non-fbdev mechanism in place to kick out
simpledrm when the real hw-driver is probed. As a stop gap until
that is in place, honour remove_conflicting_framebuffers() and
delete the simple-framebuffer platform device when it's called.

Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
---

Changes from version 3:
- drm_device.platformdev is deprecated, use to_platform_device(ddev->dev).
- fb_helper might have been released in sdrm_fbdev_fb_destroy(),
  so open code drm_fb_helper_release_fbi()
- Strengthen the test in sdrm_fbdev_event_notify() that we're the one.

Changes from version 2:
- Don't forget to free fb_info when kicked out.

 drivers/gpu/drm/simpledrm/Kconfig           |  5 +++
 drivers/gpu/drm/simpledrm/simpledrm.h       |  2 +
 drivers/gpu/drm/simpledrm/simpledrm_drv.c   |  3 ++
 drivers/gpu/drm/simpledrm/simpledrm_fbdev.c | 62 ++++++++++++++++++++++++++++-
 4 files changed, 70 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/simpledrm/Kconfig b/drivers/gpu/drm/simpledrm/Kconfig
index 3257590..4275d13 100644
--- a/drivers/gpu/drm/simpledrm/Kconfig
+++ b/drivers/gpu/drm/simpledrm/Kconfig
@@ -16,6 +16,11 @@ config DRM_SIMPLEDRM
 	  If fbdev support is enabled, this driver will also provide an fbdev
 	  compatibility layer that supports fbcon, mmap is not supported.

+	  WARNING
+	  fbdev must be enabled for simpledrm to disable itself when a real
+	  hw-driver is probed. It relies on remove_conflicting_framebuffers()
+	  to be called by the hw-driver.
+
 	  If unsure, say Y.

 	  To compile this driver as a module, choose M here: the
diff --git a/drivers/gpu/drm/simpledrm/simpledrm.h b/drivers/gpu/drm/simpledrm/simpledrm.h
index d4eb52c..3cca196 100644
--- a/drivers/gpu/drm/simpledrm/simpledrm.h
+++ b/drivers/gpu/drm/simpledrm/simpledrm.h
@@ -87,5 +87,7 @@ int sdrm_fb_init(struct drm_device *ddev, struct sdrm_framebuffer *fb,
 		 struct sdrm_gem_object *obj);
 void sdrm_fbdev_init(struct sdrm_device *sdrm);
 void sdrm_fbdev_cleanup(struct sdrm_device *sdrm);
+void sdrm_fbdev_kickout_init(void);
+void sdrm_fbdev_kickout_exit(void);

 #endif /* SDRM_DRV_H */
diff --git a/drivers/gpu/drm/simpledrm/simpledrm_drv.c b/drivers/gpu/drm/simpledrm/simpledrm_drv.c
index fe752c6..0750652 100644
--- a/drivers/gpu/drm/simpledrm/simpledrm_drv.c
+++ b/drivers/gpu/drm/simpledrm/simpledrm_drv.c
@@ -531,12 +531,15 @@ static int __init sdrm_init(void)
 		}
 	}

+	sdrm_fbdev_kickout_init();
+
 	return 0;
 }
 module_init(sdrm_init);

 static void __exit sdrm_exit(void)
 {
+	sdrm_fbdev_kickout_exit();
 	platform_driver_unregister(&sdrm_simplefb_driver);
 }
 module_exit(sdrm_exit);
diff --git a/drivers/gpu/drm/simpledrm/simpledrm_fbdev.c b/drivers/gpu/drm/simpledrm/simpledrm_fbdev.c
index c6596ad..7c6db2c 100644
--- a/drivers/gpu/drm/simpledrm/simpledrm_fbdev.c
+++ b/drivers/gpu/drm/simpledrm/simpledrm_fbdev.c
@@ -44,6 +44,20 @@ static int sdrm_fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
 	return -ENODEV;
 }

+/*
+ * Releasing has to be done outside the notifier callchain when we're
+ * kicked out, since do_unregister_framebuffer() calls put_fb_info()
+ * after the notifier has run.
+ * Open code drm_fb_helper_release_fbi() since fb_helper is freed at
+ * this point when kicked out.
+ */
+static void sdrm_fbdev_fb_destroy(struct fb_info *info)
+{
+	if (info->cmap.len)
+		fb_dealloc_cmap(&info->cmap);
+	framebuffer_release(info);
+}
+
 static struct fb_ops sdrm_fbdev_ops = {
 	.owner		= THIS_MODULE,
 	.fb_fillrect	= drm_fb_helper_sys_fillrect,
@@ -53,6 +67,7 @@ static struct fb_ops sdrm_fbdev_ops = {
 	.fb_set_par	= drm_fb_helper_set_par,
 	.fb_setcmap	= drm_fb_helper_setcmap,
 	.fb_mmap	= sdrm_fb_mmap,
+	.fb_destroy	= sdrm_fbdev_fb_destroy,
 };

 static int sdrm_fbdev_create(struct drm_fb_helper *helper,
@@ -110,6 +125,9 @@ static int sdrm_fbdev_create(struct drm_fb_helper *helper,
 	fbi->screen_base = obj->vmapping;
 	fbi->fix.smem_len = sdrm->fb_size;

+	fbi->apertures->ranges[0].base = sdrm->fb_base;
+	fbi->apertures->ranges[0].size = sdrm->fb_size;
+
 	return 0;

 err_fbi_release:
@@ -188,9 +206,13 @@ void sdrm_fbdev_cleanup(struct sdrm_device *sdrm)
 	sdrm->fb_helper = NULL;
 	fbdev = to_sdrm_fbdev(fb_helper);

-	drm_fb_helper_unregister_fbi(fb_helper);
+	/* it might have been kicked out */
+	if (registered_fb[fbdev->fb_helper.fbdev->node])
+		drm_fb_helper_unregister_fbi(fb_helper);
+
+	/* freeing fb_info is done in fb_ops.fb_destroy() */
+
 	cancel_work_sync(&fb_helper->dirty_work);
-	drm_fb_helper_release_fbi(fb_helper);

 	drm_framebuffer_unregister_private(fb_helper->fb);
 	drm_framebuffer_cleanup(fb_helper->fb);
@@ -199,3 +221,39 @@ void sdrm_fbdev_cleanup(struct sdrm_device *sdrm)
 	drm_fb_helper_fini(fb_helper);
 	kfree(fbdev);
 }
+
+static int sdrm_fbdev_event_notify(struct notifier_block *self,
+				   unsigned long action, void *data)
+{
+	struct sdrm_device *sdrm;
+	struct fb_event *event = data;
+	struct fb_info *info = event->info;
+	struct drm_fb_helper *fb_helper = info->par;
+
+	if (action != FB_EVENT_FB_UNREGISTERED)
+		return NOTIFY_DONE;
+
+	if (!fb_helper || !fb_helper->dev || fb_helper->fbdev != info)
+		return NOTIFY_DONE;
+
+	sdrm = fb_helper->dev->dev_private;
+
+	if (sdrm && sdrm->fb_helper == fb_helper)
+		platform_device_del(to_platform_device(fb_helper->dev->dev));
+
+	return NOTIFY_DONE;
+}
+
+static struct notifier_block sdrm_fbdev_event_notifier = {
+	.notifier_call  = sdrm_fbdev_event_notify,
+};
+
+void sdrm_fbdev_kickout_init(void)
+{
+	fb_register_client(&sdrm_fbdev_event_notifier);
+}
+
+void sdrm_fbdev_kickout_exit(void)
+{
+	fb_unregister_client(&sdrm_fbdev_event_notifier);
+}
--
2.8.2
