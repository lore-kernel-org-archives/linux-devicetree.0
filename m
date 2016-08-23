From: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Subject: Re: [PATCH v4 4/5] drm: simpledrm: add fbdev fallback support
Date: Tue, 23 Aug 2016 08:10:37 +0200
Message-ID: <20160823061037.GM24290@phenom.ffwll.local>
References: <1471897525-31118-1-git-send-email-noralf@tronnes.org>
 <1471897525-31118-5-git-send-email-noralf@tronnes.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1471897525-31118-5-git-send-email-noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Aug 22, 2016 at 10:25:24PM +0200, Noralf Trønnes wrote:
> Create a simple fbdev device during SimpleDRM setup so legacy user-space
> and fbcon can use it.
> 
> Original work by David Herrmann.
> 
> Cc: dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
> Signed-off-by: Noralf Trønnes <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
> ---
> 
> Changes from version 3:
> - Remove #ifdef CONFIG_DRM_FBDEV_EMULATION
> - Use drm_fb_helper_set_suspend_lock()
> - Don't access the native framebuffer directly, but do blitting here as well.
> - Use the drm_fb_helper_sys_*() functions instead of the cfb versions.
> - Remove FBINFO_CAN_FORCE_OUTPUT flag which doesn't work now.
> - Pass struct drm_fb_helper around instead of struct sdrm_fbdev.
> 
> Changes from version 2:
> - Switch to using drm_fb_helper in preparation for future panic handling
>   which needs an enabled pipeline.
> 
> Changes from version 1:
>   No changes
> 
> Changes from previous version:
> - Remove the DRM_SIMPLEDRM_FBDEV kconfig option and use DRM_FBDEV_EMULATION
> - Suspend fbcon/fbdev when the pipeline is enabled, resume in lastclose
> - Add FBINFO_CAN_FORCE_OUTPUT flag so we get oops'es on the console
> 
>  drivers/gpu/drm/simpledrm/Kconfig           |   3 +
>  drivers/gpu/drm/simpledrm/Makefile          |   2 +-
>  drivers/gpu/drm/simpledrm/simpledrm.h       |   5 +
>  drivers/gpu/drm/simpledrm/simpledrm_drv.c   |   4 +
>  drivers/gpu/drm/simpledrm/simpledrm_fbdev.c | 201 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/simpledrm/simpledrm_kms.c   |  14 ++
>  6 files changed, 228 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/simpledrm/simpledrm_fbdev.c
> 
> diff --git a/drivers/gpu/drm/simpledrm/Kconfig b/drivers/gpu/drm/simpledrm/Kconfig
> index f45b25d..3257590 100644
> --- a/drivers/gpu/drm/simpledrm/Kconfig
> +++ b/drivers/gpu/drm/simpledrm/Kconfig
> @@ -13,6 +13,9 @@ config DRM_SIMPLEDRM
>  	  SimpleDRM supports "simple-framebuffer" DeviceTree objects and
>  	  compatible platform framebuffers.
> 
> +	  If fbdev support is enabled, this driver will also provide an fbdev
> +	  compatibility layer that supports fbcon, mmap is not supported.
> +
>  	  If unsure, say Y.
> 
>  	  To compile this driver as a module, choose M here: the
> diff --git a/drivers/gpu/drm/simpledrm/Makefile b/drivers/gpu/drm/simpledrm/Makefile
> index f6a62dc..5474f7f 100644
> --- a/drivers/gpu/drm/simpledrm/Makefile
> +++ b/drivers/gpu/drm/simpledrm/Makefile
> @@ -1,4 +1,4 @@
>  simpledrm-y :=	simpledrm_drv.o simpledrm_kms.o simpledrm_gem.o \
> -		simpledrm_damage.o
> +		simpledrm_damage.o simpledrm_fbdev.o
> 
>  obj-$(CONFIG_DRM_SIMPLEDRM) := simpledrm.o
> diff --git a/drivers/gpu/drm/simpledrm/simpledrm.h b/drivers/gpu/drm/simpledrm/simpledrm.h
> index 0739581..d4eb52c 100644
> --- a/drivers/gpu/drm/simpledrm/simpledrm.h
> +++ b/drivers/gpu/drm/simpledrm/simpledrm.h
> @@ -16,6 +16,7 @@
>  #include <drm/drm_simple_kms_helper.h>
> 
>  struct simplefb_format;
> +struct drm_fb_helper;
>  struct regulator;
>  struct clk;
> 
> @@ -23,6 +24,7 @@ struct sdrm_device {
>  	struct drm_device *ddev;
>  	struct drm_simple_display_pipe pipe;
>  	struct drm_connector conn;
> +	struct drm_fb_helper *fb_helper;
> 
>  	/* framebuffer information */
>  	const struct simplefb_format *fb_sformat;
> @@ -42,6 +44,7 @@ struct sdrm_device {
>  	struct regulator **regulators;
>  };
> 
> +void sdrm_lastclose(struct drm_device *ddev);
>  int sdrm_drm_modeset_init(struct sdrm_device *sdrm);
> 
>  int sdrm_dirty(struct drm_framebuffer *fb,
> @@ -82,5 +85,7 @@ struct sdrm_framebuffer {
>  int sdrm_fb_init(struct drm_device *ddev, struct sdrm_framebuffer *fb,
>  		 const struct drm_mode_fb_cmd2 *mode_cmd,
>  		 struct sdrm_gem_object *obj);
> +void sdrm_fbdev_init(struct sdrm_device *sdrm);
> +void sdrm_fbdev_cleanup(struct sdrm_device *sdrm);
> 
>  #endif /* SDRM_DRV_H */
> diff --git a/drivers/gpu/drm/simpledrm/simpledrm_drv.c b/drivers/gpu/drm/simpledrm/simpledrm_drv.c
> index 17c1b55..fe752c6 100644
> --- a/drivers/gpu/drm/simpledrm/simpledrm_drv.c
> +++ b/drivers/gpu/drm/simpledrm/simpledrm_drv.c
> @@ -47,6 +47,7 @@ static const struct vm_operations_struct sdrm_gem_vm_ops = {
>  static struct drm_driver sdrm_drm_driver = {
>  	.driver_features = DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
>  	.fops = &sdrm_drm_fops,
> +	.lastclose = sdrm_lastclose,
> 
>  	.gem_free_object = sdrm_gem_free_object,
>  	.gem_vm_ops = &sdrm_gem_vm_ops,
> @@ -451,6 +452,8 @@ static int sdrm_simplefb_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err_regulators;
> 
> +	sdrm_fbdev_init(sdrm);
> +
>  	DRM_INFO("Initialized %s on minor %d\n", ddev->driver->name,
>  		 ddev->primary->index);
> 
> @@ -476,6 +479,7 @@ static int sdrm_simplefb_remove(struct platform_device *pdev)
>  	struct drm_device *ddev = platform_get_drvdata(pdev);
>  	struct sdrm_device *sdrm = ddev->dev_private;
> 
> +	sdrm_fbdev_cleanup(sdrm);
>  	drm_dev_unregister(ddev);
>  	drm_mode_config_cleanup(ddev);
> 
> diff --git a/drivers/gpu/drm/simpledrm/simpledrm_fbdev.c b/drivers/gpu/drm/simpledrm/simpledrm_fbdev.c
> new file mode 100644
> index 0000000..c6596ad
> --- /dev/null
> +++ b/drivers/gpu/drm/simpledrm/simpledrm_fbdev.c
> @@ -0,0 +1,201 @@
> +/*
> + * SimpleDRM firmware framebuffer driver
> + * Copyright (c) 2012-2014 David Herrmann <dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms of the GNU General Public License as published by the Free
> + * Software Foundation; either version 2 of the License, or (at your option)
> + * any later version.
> + */
> +
> +#include <drm/drmP.h>
> +#include <drm/drm_crtc_helper.h>
> +#include <drm/drm_fb_helper.h>
> +#include <linux/fb.h>
> +#include <linux/platform_device.h>
> +
> +#include "simpledrm.h"
> +
> +struct sdrm_fbdev {
> +	struct drm_fb_helper fb_helper;
> +	struct sdrm_framebuffer fb;
> +};
> +
> +static inline struct sdrm_fbdev *to_sdrm_fbdev(struct drm_fb_helper *helper)
> +{
> +	return container_of(helper, struct sdrm_fbdev, fb_helper);
> +}
> +
> +/*
> + * simpledrm uses the same gem code as udl and work on that driver has shown
> + * that it doens't work well with fb_deferred_io. So mmap is not supported.
> + *
> + * This is documented in commit 677d23b70bf9:
> + *
> + * drm/udl: disable fb_defio by default
> + * There seems to be a bad interaction between gem/shmem and defio on top,
> + * I get list corruption on the page lru in the shmem code.
> + *
> + * Turn it off for now until we get some more digging done.
> + *
> + */
> +static int sdrm_fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
> +{
> +	return -ENODEV;
> +}
> +
> +static struct fb_ops sdrm_fbdev_ops = {
> +	.owner		= THIS_MODULE,
> +	.fb_fillrect	= drm_fb_helper_sys_fillrect,
> +	.fb_copyarea	= drm_fb_helper_sys_copyarea,
> +	.fb_imageblit	= drm_fb_helper_sys_imageblit,
> +	.fb_check_var	= drm_fb_helper_check_var,
> +	.fb_set_par	= drm_fb_helper_set_par,
> +	.fb_setcmap	= drm_fb_helper_setcmap,
> +	.fb_mmap	= sdrm_fb_mmap,
> +};
> +
> +static int sdrm_fbdev_create(struct drm_fb_helper *helper,
> +			     struct drm_fb_helper_surface_size *sizes)
> +{
> +	struct sdrm_fbdev *fbdev = to_sdrm_fbdev(helper);
> +	struct drm_device *ddev = helper->dev;
> +	struct sdrm_device *sdrm = ddev->dev_private;
> +	struct drm_mode_fb_cmd2 mode_cmd = {
> +		.width = sdrm->fb_width,
> +		.height = sdrm->fb_height,
> +		.pitches[0] = sdrm->fb_stride,
> +		.pixel_format = sdrm->fb_format,
> +	};
> +	struct sdrm_gem_object *obj;
> +	struct drm_framebuffer *fb;
> +	struct fb_info *fbi;
> +	size_t size;
> +	int ret;
> +
> +	size = PAGE_ALIGN(sdrm->fb_size);
> +	obj = sdrm_gem_alloc_object(ddev, size);
> +	if (!obj)
> +		return -ENOMEM;
> +
> +	ret = sdrm_gem_vmap(obj);
> +	if (ret) {
> +		DRM_ERROR("failed to vmap fb\n");
> +		goto err_gem_free;
> +	}
> +
> +	fbi = drm_fb_helper_alloc_fbi(helper);
> +	if (IS_ERR(fbi)) {
> +		ret = PTR_ERR(fbi);
> +		goto err_gem_free;
> +	}
> +
> +	ret = sdrm_fb_init(ddev, &fbdev->fb, &mode_cmd, obj);
> +	if (ret) {
> +		dev_err(ddev->dev, "Failed to init framebuffer: %d\n", ret);
> +		goto err_fbi_release;
> +	}
> +
> +	fb = &fbdev->fb.base;
> +	helper->fb = fb;
> +	fbi->par = helper;
> +
> +	fbi->flags = FBINFO_DEFAULT | FBINFO_MISC_FIRMWARE;
> +	fbi->fbops = &sdrm_fbdev_ops;
> +
> +	drm_fb_helper_fill_fix(fbi, fb->pitches[0], fb->depth);
> +	drm_fb_helper_fill_var(fbi, helper, fb->width, fb->height);
> +
> +	strncpy(fbi->fix.id, "simpledrmfb", 15);
> +	fbi->screen_base = obj->vmapping;
> +	fbi->fix.smem_len = sdrm->fb_size;
> +
> +	return 0;
> +
> +err_fbi_release:
> +	drm_fb_helper_release_fbi(helper);
> +
> +err_gem_free:
> +	drm_gem_object_unreference_unlocked(&obj->base);
> +
> +	return ret;
> +}
> +
> +static const struct drm_fb_helper_funcs sdrm_fb_helper_funcs = {
> +	.fb_probe = sdrm_fbdev_create,
> +};
> +
> +void sdrm_fbdev_init(struct sdrm_device *sdrm)
> +{
> +	struct drm_device *ddev = sdrm->ddev;
> +	struct drm_fb_helper *fb_helper;
> +	struct sdrm_fbdev *fbdev;
> +	int ret;
> +
> +	fbdev = kzalloc(sizeof(*fbdev), GFP_KERNEL);
> +	if (!fbdev) {
> +		dev_err(ddev->dev, "Failed to allocate drm fbdev.\n");
> +		return;
> +	}
> +
> +	fb_helper = &fbdev->fb_helper;
> +
> +	drm_fb_helper_prepare(ddev, fb_helper, &sdrm_fb_helper_funcs);
> +
> +	ret = drm_fb_helper_init(ddev, fb_helper, 1, 1);
> +	if (ret < 0) {
> +		dev_err(ddev->dev, "Failed to initialize drm fb helper.\n");
> +		goto err_free;
> +	}
> +
> +	ret = drm_fb_helper_single_add_all_connectors(fb_helper);
> +	if (ret < 0) {
> +		dev_err(ddev->dev, "Failed to add connectors.\n");
> +		goto err_drm_fb_helper_fini;
> +	}
> +
> +	ret = drm_fb_helper_initial_config(fb_helper,
> +					   ddev->mode_config.preferred_depth);
> +	if (ret < 0) {
> +		dev_err(ddev->dev, "Failed to set initial hw configuration.\n");
> +		goto err_drm_fb_helper_fini;
> +	}
> +
> +	if (!fb_helper->fbdev) {
> +		/* fbdev emulation is disabled */
> +		kfree(fbdev);
> +		return;
> +	}
> +
> +	sdrm->fb_helper = fb_helper;
> +
> +	return;
> +
> +err_drm_fb_helper_fini:
> +	drm_fb_helper_fini(fb_helper);
> +err_free:
> +	kfree(fbdev);
> +}
> +
> +void sdrm_fbdev_cleanup(struct sdrm_device *sdrm)
> +{
> +	struct drm_fb_helper *fb_helper = sdrm->fb_helper;
> +	struct sdrm_fbdev *fbdev;
> +
> +	if (!fb_helper)
> +		return;
> +
> +	sdrm->fb_helper = NULL;
> +	fbdev = to_sdrm_fbdev(fb_helper);
> +
> +	drm_fb_helper_unregister_fbi(fb_helper);
> +	cancel_work_sync(&fb_helper->dirty_work);
> +	drm_fb_helper_release_fbi(fb_helper);
> +
> +	drm_framebuffer_unregister_private(fb_helper->fb);
> +	drm_framebuffer_cleanup(fb_helper->fb);
> +	drm_gem_object_unreference_unlocked(&fbdev->fb.obj->base);
> +
> +	drm_fb_helper_fini(fb_helper);
> +	kfree(fbdev);
> +}
> diff --git a/drivers/gpu/drm/simpledrm/simpledrm_kms.c b/drivers/gpu/drm/simpledrm/simpledrm_kms.c
> index e6dc3df..8b98a08 100644
> --- a/drivers/gpu/drm/simpledrm/simpledrm_kms.c
> +++ b/drivers/gpu/drm/simpledrm/simpledrm_kms.c
> @@ -12,6 +12,7 @@
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_crtc_helper.h>
> +#include <drm/drm_fb_helper.h>
>  #include <drm/drm_gem.h>
>  #include <drm/drm_simple_kms_helper.h>
>  #include <linux/slab.h>
> @@ -24,6 +25,16 @@ static const uint32_t sdrm_formats[] = {
>  	DRM_FORMAT_XRGB8888,
>  };
> 
> +void sdrm_lastclose(struct drm_device *ddev)
> +{
> +	struct sdrm_device *sdrm = ddev->dev_private;
> +
> +	if (sdrm->fb_helper) {
> +		drm_fb_helper_restore_fbdev_mode_unlocked(sdrm->fb_helper);
> +		drm_fb_helper_set_suspend_lock(sdrm->fb_helper, 0);

David's original fbdev support needed the set_suspend here because without
it fbcon would have trampled all over native kms clients. But with the new
implementation using the fb emulation helpers and dirty callbacks we don't
need that any more I think. I think for consistency with other drivers
it'd be good to remove this flag.

Otherwise this looks good now I think.
-Daniel

> +	}
> +}
> +
>  static int sdrm_conn_get_modes(struct drm_connector *conn)
>  {
>  	struct sdrm_device *sdrm = conn->dev->dev_private;
> @@ -92,6 +103,9 @@ void sdrm_display_pipe_update(struct drm_simple_display_pipe *pipe,
> 
>  	sdrm_crtc_send_vblank_event(&pipe->crtc);
> 
> +	if (sdrm->fb_helper && fb && fb != sdrm->fb_helper->fb)
> +		drm_fb_helper_set_suspend_lock(sdrm->fb_helper, 1);
> +
>  	if (fb) {
>  		pipe->plane.fb = fb;
>  		sdrm_dirty_all_locked(sdrm);
> --
> 2.8.2
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
