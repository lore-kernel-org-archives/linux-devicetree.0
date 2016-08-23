From: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Subject: Re: [PATCH v4 2/5] drm/fb-helper: Add
 drm_fb_helper_set_suspend_lock()
Date: Tue, 23 Aug 2016 08:07:11 +0200
Message-ID: <20160823060711.GL24290@phenom.ffwll.local>
References: <1471897525-31118-1-git-send-email-noralf@tronnes.org>
 <1471897525-31118-3-git-send-email-noralf@tronnes.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1471897525-31118-3-git-send-email-noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Aug 22, 2016 at 10:25:22PM +0200, Noralf Trønnes wrote:
> This adds a function that also takes the console lock before calling
> fb_set_suspend() in contrast to drm_fb_helper_set_suspend() which is
> a plain wrapper around fb_set_suspend().
> Resume is run asynchronously using a worker if the console lock is
> already taken. This is modelled after the i915 driver.
> 
> Signed-off-by: Noralf Trønnes <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
> ---
>  drivers/gpu/drm/drm_fb_helper.c | 57 +++++++++++++++++++++++++++++++++++++++++
>  include/drm/drm_fb_helper.h     |  9 +++++++
>  2 files changed, 66 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index ce54e98..897e6f4 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -29,6 +29,7 @@
>   */
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>  
> +#include <linux/console.h>
>  #include <linux/kernel.h>
>  #include <linux/sysrq.h>
>  #include <linux/slab.h>
> @@ -618,6 +619,16 @@ static void drm_fb_helper_crtc_free(struct drm_fb_helper *helper)
>  	kfree(helper->crtc_info);
>  }
>  
> +static void drm_fb_helper_resume_worker(struct work_struct *work)
> +{
> +	struct drm_fb_helper *helper = container_of(work, struct drm_fb_helper,
> +						    resume_work);
> +
> +	console_lock();
> +	fb_set_suspend(helper->fbdev, 0);
> +	console_unlock();
> +}
> +
>  static void drm_fb_helper_dirty_work(struct work_struct *work)
>  {
>  	struct drm_fb_helper *helper = container_of(work, struct drm_fb_helper,
> @@ -649,6 +660,7 @@ void drm_fb_helper_prepare(struct drm_device *dev, struct drm_fb_helper *helper,
>  {
>  	INIT_LIST_HEAD(&helper->kernel_fb_list);
>  	spin_lock_init(&helper->dirty_lock);
> +	INIT_WORK(&helper->resume_work, drm_fb_helper_resume_worker);
>  	INIT_WORK(&helper->dirty_work, drm_fb_helper_dirty_work);
>  	helper->dirty_clip.x1 = helper->dirty_clip.y1 = ~0;
>  	helper->funcs = funcs;
> @@ -1035,6 +1047,51 @@ void drm_fb_helper_set_suspend(struct drm_fb_helper *fb_helper, int state)
>  }
>  EXPORT_SYMBOL(drm_fb_helper_set_suspend);
>  
> +/**
> + * drm_fb_helper_set_suspend_lock - wrapper around fb_set_suspend that also
> + *                                  takes the console lock
> + * @fb_helper: driver-allocated fbdev helper
> + * @state: desired state, zero to resume, non-zero to suspend
> + *
> + * A wrapper around fb_set_suspend() that takes the console lock. If the lock
> + * isn't available on resume, a worker is tasked with waiting for the lock
> + * to become available. The console lock can be pretty contented on resume
> + * due to all the printk activity.
> + *
> + * This function can be called multiple times with the same state since
> + * &fb_info->state is checked to see if fbdev is running or not before locking.
> + *
> + * Use drm_fb_helper_set_suspend() if you need to take the lock yourself.
> + */
> +void drm_fb_helper_set_suspend_lock(struct drm_fb_helper *fb_helper, int state)

We generally call the functions which take the locks themselves _unlocked
(or the version that requires locks to be held _locked). Other nit: I
think added a sentence to the kerneldoc of drm_fb_helper_set_suspend to
instead use this one (since it avoids lock contention on resume) would be
good.

Otherwise looks great.

And if you're bored, following up with a bunch of patches to roll this out
to drivers would be awesome ;-)

> +{
> +	if (!fb_helper || !fb_helper->fbdev)
> +		return;
> +
> +	/* make sure there's no pending/ongoing resume */
> +	flush_work(&fb_helper->resume_work);
> +
> +	if (state) { /* suspend */

Hm, one more nit: rename state to suspend and you both make the
declaration more self-explanatory, and can drop these 2 comments here.

Thanks, Daniel

> +		if (fb_helper->fbdev->state != FBINFO_STATE_RUNNING)
> +			return;
> +
> +		console_lock();
> +
> +	} else { /* resume */
> +		if (fb_helper->fbdev->state == FBINFO_STATE_RUNNING)
> +			return;
> +
> +		if (!console_trylock()) {
> +			schedule_work(&fb_helper->resume_work);
> +			return;
> +		}
> +	}
> +
> +	fb_set_suspend(fb_helper->fbdev, state);
> +	console_unlock();
> +}
> +EXPORT_SYMBOL(drm_fb_helper_set_suspend_lock);
> +
>  static int setcolreg(struct drm_crtc *crtc, u16 red, u16 green,
>  		     u16 blue, u16 regno, struct fb_info *info)
>  {
> diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
> index db8d478..db7e861 100644
> --- a/include/drm/drm_fb_helper.h
> +++ b/include/drm/drm_fb_helper.h
> @@ -176,6 +176,7 @@ struct drm_fb_helper_connector {
>   *              the screen buffer
>   * @dirty_lock: spinlock protecting @dirty_clip
>   * @dirty_work: worker used to flush the framebuffer
> + * @resume_work: worker used during resume if the console lock is already taken
>   *
>   * This is the main structure used by the fbdev helpers. Drivers supporting
>   * fbdev emulation should embedded this into their overall driver structure.
> @@ -196,6 +197,7 @@ struct drm_fb_helper {
>  	struct drm_clip_rect dirty_clip;
>  	spinlock_t dirty_lock;
>  	struct work_struct dirty_work;
> +	struct work_struct resume_work;
>  
>  	/**
>  	 * @kernel_fb_list:
> @@ -264,6 +266,8 @@ void drm_fb_helper_cfb_imageblit(struct fb_info *info,
>  				 const struct fb_image *image);
>  
>  void drm_fb_helper_set_suspend(struct drm_fb_helper *fb_helper, int state);
> +void drm_fb_helper_set_suspend_lock(struct drm_fb_helper *fb_helper,
> +				    int state);
>  
>  int drm_fb_helper_setcmap(struct fb_cmap *cmap, struct fb_info *info);
>  
> @@ -421,6 +425,11 @@ static inline void drm_fb_helper_set_suspend(struct drm_fb_helper *fb_helper,
>  {
>  }
>  
> +static inline void
> +drm_fb_helper_set_suspend_lock(struct drm_fb_helper *fb_helper, int state)
> +{
> +}
> +
>  static inline int drm_fb_helper_hotplug_event(struct drm_fb_helper *fb_helper)
>  {
>  	return 0;
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
