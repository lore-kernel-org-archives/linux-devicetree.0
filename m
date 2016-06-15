From: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Subject: Re: [PATCH v5 2/3] drm/arm: Add support for Mali Display Processors
Date: Wed, 15 Jun 2016 17:23:10 +0200
Message-ID: <20160615152309.GI1338@phenom.ffwll.local>
References: <1466002295-24813-1-git-send-email-Liviu.Dudau@arm.com>
 <1466002295-24813-3-git-send-email-Liviu.Dudau@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1466002295-24813-3-git-send-email-Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Brian Starkey <brian.starkey-5wv7dgnIgG8@public.gmane.org>, Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DRI devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Brown <David.Brown-5wv7dgnIgG8@public.gmane.org>, LAKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 15, 2016 at 03:51:34PM +0100, Liviu Dudau wrote:
> Add support for the new family of Display Processors from ARM Ltd.
> This commit adds basic support for Mali DP500, DP550 and DP650
> parts, with only the display engine being supported at the moment.
>=20
> Cc: David Brown <David.Brown-5wv7dgnIgG8@public.gmane.org>
> Cc: Brian Starkey <Brian.Starkey-5wv7dgnIgG8@public.gmane.org>
>=20
> Signed-off-by: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>

Small thing I noticed: drm_dev_register/connector_register_all should b=
e
the last step in your init code, and unregister the first. Atm it's
somewhere in the middle. But perfectly fine to do that as a follow-up.

Quickly scrolled through the driver, looks all nice.

Acked-by: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
> ---
>  drivers/gpu/drm/arm/Kconfig         |  16 +
>  drivers/gpu/drm/arm/Makefile        |   2 +
>  drivers/gpu/drm/arm/malidp_crtc.c   | 216 +++++++++++
>  drivers/gpu/drm/arm/malidp_drv.c    | 512 ++++++++++++++++++++++++++
>  drivers/gpu/drm/arm/malidp_drv.h    |  54 +++
>  drivers/gpu/drm/arm/malidp_hw.c     | 691 ++++++++++++++++++++++++++=
++++++++++
>  drivers/gpu/drm/arm/malidp_hw.h     | 241 +++++++++++++
>  drivers/gpu/drm/arm/malidp_planes.c | 298 ++++++++++++++++
>  drivers/gpu/drm/arm/malidp_regs.h   | 172 +++++++++
>  9 files changed, 2202 insertions(+)
>  create mode 100644 drivers/gpu/drm/arm/malidp_crtc.c
>  create mode 100644 drivers/gpu/drm/arm/malidp_drv.c
>  create mode 100644 drivers/gpu/drm/arm/malidp_drv.h
>  create mode 100644 drivers/gpu/drm/arm/malidp_hw.c
>  create mode 100644 drivers/gpu/drm/arm/malidp_hw.h
>  create mode 100644 drivers/gpu/drm/arm/malidp_planes.c
>  create mode 100644 drivers/gpu/drm/arm/malidp_regs.h
>=20
> diff --git a/drivers/gpu/drm/arm/Kconfig b/drivers/gpu/drm/arm/Kconfi=
g
> index eaed454..1b29065 100644
> --- a/drivers/gpu/drm/arm/Kconfig
> +++ b/drivers/gpu/drm/arm/Kconfig
> @@ -25,3 +25,19 @@ config DRM_HDLCD_SHOW_UNDERRUN
>  	  Enable this option to show in red colour the pixels that the
>  	  HDLCD device did not fetch from framebuffer due to underrun
>  	  conditions.
> +
> +config DRM_MALI_DISPLAY
> +	tristate "ARM Mali Display Processor"
> +	depends on DRM && OF && (ARM || ARM64)
> +	depends on COMMON_CLK
> +	select DRM_ARM
> +	select DRM_KMS_HELPER
> +	select DRM_KMS_CMA_HELPER
> +	select DRM_GEM_CMA_HELPER
> +	select VIDEOMODE_HELPERS
> +	help
> +	  Choose this option if you want to compile the ARM Mali Display
> +	  Processor driver. It supports the DP500, DP550 and DP650 variants
> +	  of the hardware.
> +
> +	  If compiled as a module it will be called mali-dp.
> diff --git a/drivers/gpu/drm/arm/Makefile b/drivers/gpu/drm/arm/Makef=
ile
> index 89dcb7b..bb8b158 100644
> --- a/drivers/gpu/drm/arm/Makefile
> +++ b/drivers/gpu/drm/arm/Makefile
> @@ -1,2 +1,4 @@
>  hdlcd-y :=3D hdlcd_drv.o hdlcd_crtc.o
>  obj-$(CONFIG_DRM_HDLCD)	+=3D hdlcd.o
> +mali-dp-y :=3D malidp_drv.o malidp_hw.o malidp_planes.o malidp_crtc.=
o
> +obj-$(CONFIG_DRM_MALI_DISPLAY)	+=3D mali-dp.o
> diff --git a/drivers/gpu/drm/arm/malidp_crtc.c b/drivers/gpu/drm/arm/=
malidp_crtc.c
> new file mode 100644
> index 0000000..08e6a71
> --- /dev/null
> +++ b/drivers/gpu/drm/arm/malidp_crtc.c
> @@ -0,0 +1,216 @@
> +/*
> + * (C) COPYRIGHT 2016 ARM Limited. All rights reserved.
> + * Author: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
> + *
> + * This program is free software and is provided to you under the te=
rms of the
> + * GNU General Public License version 2 as published by the Free Sof=
tware
> + * Foundation, and any use by you of this program is subject to the =
terms
> + * of such GNU licence.
> + *
> + * ARM Mali DP500/DP550/DP650 driver (crtc operations)
> + */
> +
> +#include <drm/drmP.h>
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_crtc.h>
> +#include <drm/drm_crtc_helper.h>
> +#include <linux/clk.h>
> +#include <video/videomode.h>
> +
> +#include "malidp_drv.h"
> +#include "malidp_hw.h"
> +
> +static bool malidp_crtc_mode_fixup(struct drm_crtc *crtc,
> +				   const struct drm_display_mode *mode,
> +				   struct drm_display_mode *adjusted_mode)
> +{
> +	struct malidp_drm *malidp =3D crtc_to_malidp_device(crtc);
> +	struct malidp_hw_device *hwdev =3D malidp->dev;
> +
> +	/*
> +	 * check that the hardware can drive the required clock rate,
> +	 * but skip the check if the clock is meant to be disabled (req_rat=
e =3D 0)
> +	 */
> +	long rate, req_rate =3D mode->crtc_clock * 1000;
> +
> +	if (req_rate) {
> +		rate =3D clk_round_rate(hwdev->mclk, req_rate);
> +		if (rate < req_rate) {
> +			DRM_DEBUG_DRIVER("mclk clock unable to reach %d kHz\n",
> +					 mode->crtc_clock);
> +			return false;
> +		}
> +
> +		rate =3D clk_round_rate(hwdev->pxlclk, req_rate);
> +		if (rate !=3D req_rate) {
> +			DRM_DEBUG_DRIVER("pxlclk doesn't support %ld Hz\n",
> +					 req_rate);
> +			return false;
> +		}
> +	}
> +
> +	return true;
> +}
> +
> +static void malidp_crtc_enable(struct drm_crtc *crtc)
> +{
> +	struct malidp_drm *malidp =3D crtc_to_malidp_device(crtc);
> +	struct malidp_hw_device *hwdev =3D malidp->dev;
> +	struct videomode vm;
> +
> +	drm_display_mode_to_videomode(&crtc->state->adjusted_mode, &vm);
> +
> +	clk_prepare_enable(hwdev->pxlclk);
> +
> +	/* mclk needs to be set to the same or higher rate than pxlclk */
> +	clk_set_rate(hwdev->mclk, crtc->state->adjusted_mode.crtc_clock * 1=
000);
> +	clk_set_rate(hwdev->pxlclk, crtc->state->adjusted_mode.crtc_clock *=
 1000);
> +
> +	hwdev->modeset(hwdev, &vm);
> +	hwdev->leave_config_mode(hwdev);
> +	drm_crtc_vblank_on(crtc);
> +}
> +
> +static void malidp_crtc_disable(struct drm_crtc *crtc)
> +{
> +	struct malidp_drm *malidp =3D crtc_to_malidp_device(crtc);
> +	struct malidp_hw_device *hwdev =3D malidp->dev;
> +
> +	drm_crtc_vblank_off(crtc);
> +	hwdev->enter_config_mode(hwdev);
> +	clk_disable_unprepare(hwdev->pxlclk);
> +}
> +
> +static int malidp_crtc_atomic_check(struct drm_crtc *crtc,
> +				    struct drm_crtc_state *state)
> +{
> +	struct malidp_drm *malidp =3D crtc_to_malidp_device(crtc);
> +	struct malidp_hw_device *hwdev =3D malidp->dev;
> +	struct drm_plane *plane;
> +	const struct drm_plane_state *pstate;
> +	u32 rot_mem_free, rot_mem_usable;
> +	int rotated_planes =3D 0;
> +
> +	/*
> +	 * check if there is enough rotation memory available for planes
> +	 * that need 90=B0 and 270=B0 rotation. Each plane has set its requ=
ired
> +	 * memory size in the ->plane_check() callback, here we only make
> +	 * sure that the sums are less that the total usable memory.
> +	 *
> +	 * The rotation memory allocation algorithm (for each plane):
> +	 *  a. If no more rotated planes exist, all remaining rotate
> +	 *     memory in the bank is available for use by the plane.
> +	 *  b. If other rotated planes exist, and plane's layer ID is
> +	 *     DE_VIDEO1, it can use all the memory from first bank if
> +	 *     secondary rotation memory bank is available, otherwise it ca=
n
> +	 *     use up to half the bank's memory.
> +	 *  c. If other rotated planes exist, and plane's layer ID is not
> +	 *     DE_VIDEO1, it can use half of the available memory
> +	 *
> +	 * Note: this algorithm assumes that the order in which the planes =
are
> +	 * checked always has DE_VIDEO1 plane first in the list if it is
> +	 * rotated. Because that is how we create the planes in the first
> +	 * place, under current DRM version things work, but if ever the or=
der
> +	 * in which drm_atomic_crtc_state_for_each_plane() iterates over pl=
anes
> +	 * changes, we need to pre-sort the planes before validation.
> +	 */
> +
> +	/* first count the number of rotated planes */
> +	drm_atomic_crtc_state_for_each_plane_state(plane, pstate, state) {
> +		if (pstate->rotation & MALIDP_ROTATED_MASK)
> +			rotated_planes++;
> +	}
> +
> +	rot_mem_free =3D hwdev->rotation_memory[0];
> +	/*
> +	 * if we have more than 1 plane using rotation memory, use the seco=
nd
> +	 * block of rotation memory as well
> +	 */
> +	if (rotated_planes > 1)
> +		rot_mem_free +=3D hwdev->rotation_memory[1];
> +
> +	/* now validate the rotation memory requirements */
> +	drm_atomic_crtc_state_for_each_plane_state(plane, pstate, state) {
> +		struct malidp_plane *mp =3D to_malidp_plane(plane);
> +		struct malidp_plane_state *ms =3D to_malidp_plane_state(pstate);
> +
> +		if (pstate->rotation & MALIDP_ROTATED_MASK) {
> +			/* process current plane */
> +			rotated_planes--;
> +
> +			if (!rotated_planes) {
> +				/* no more rotated planes, we can use what's left */
> +				rot_mem_usable =3D rot_mem_free;
> +			} else {
> +				if ((mp->layer->id !=3D DE_VIDEO1) ||
> +				    (hwdev->rotation_memory[1] =3D=3D 0))
> +					rot_mem_usable =3D rot_mem_free / 2;
> +				else
> +					rot_mem_usable =3D hwdev->rotation_memory[0];
> +			}
> +
> +			rot_mem_free -=3D rot_mem_usable;
> +
> +			if (ms->rotmem_size > rot_mem_usable)
> +				return -EINVAL;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct drm_crtc_helper_funcs malidp_crtc_helper_funcs =3D=
 {
> +	.mode_fixup =3D malidp_crtc_mode_fixup,
> +	.enable =3D malidp_crtc_enable,
> +	.disable =3D malidp_crtc_disable,
> +	.atomic_check =3D malidp_crtc_atomic_check,
> +};
> +
> +static const struct drm_crtc_funcs malidp_crtc_funcs =3D {
> +	.destroy =3D drm_crtc_cleanup,
> +	.set_config =3D drm_atomic_helper_set_config,
> +	.page_flip =3D drm_atomic_helper_page_flip,
> +	.reset =3D drm_atomic_helper_crtc_reset,
> +	.atomic_duplicate_state =3D drm_atomic_helper_crtc_duplicate_state,
> +	.atomic_destroy_state =3D drm_atomic_helper_crtc_destroy_state,
> +};
> +
> +int malidp_crtc_init(struct drm_device *drm)
> +{
> +	struct malidp_drm *malidp =3D drm->dev_private;
> +	struct drm_plane *primary =3D NULL, *plane;
> +	int ret;
> +
> +	ret =3D malidp_de_planes_init(drm);
> +	if (ret < 0) {
> +		DRM_ERROR("Failed to initialise planes\n");
> +		return ret;
> +	}
> +
> +	drm_for_each_plane(plane, drm) {
> +		if (plane->type =3D=3D DRM_PLANE_TYPE_PRIMARY) {
> +			primary =3D plane;
> +			break;
> +		}
> +	}
> +
> +	if (!primary) {
> +		DRM_ERROR("no primary plane found\n");
> +		ret =3D -EINVAL;
> +		goto crtc_cleanup_planes;
> +	}
> +
> +	ret =3D drm_crtc_init_with_planes(drm, &malidp->crtc, primary, NULL=
,
> +					&malidp_crtc_funcs, NULL);
> +
> +	if (!ret) {
> +		drm_crtc_helper_add(&malidp->crtc, &malidp_crtc_helper_funcs);
> +		return 0;
> +	}
> +
> +crtc_cleanup_planes:
> +	malidp_de_planes_destroy(drm);
> +
> +	return ret;
> +}
> diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/m=
alidp_drv.c
> new file mode 100644
> index 0000000..e5b44e9
> --- /dev/null
> +++ b/drivers/gpu/drm/arm/malidp_drv.c
> @@ -0,0 +1,512 @@
> +/*
> + * (C) COPYRIGHT 2016 ARM Limited. All rights reserved.
> + * Author: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
> + *
> + * This program is free software and is provided to you under the te=
rms of the
> + * GNU General Public License version 2 as published by the Free Sof=
tware
> + * Foundation, and any use by you of this program is subject to the =
terms
> + * of such GNU licence.
> + *
> + * ARM Mali DP500/DP550/DP650 KMS/DRM driver
> + */
> +
> +#include <linux/module.h>
> +#include <linux/clk.h>
> +#include <linux/component.h>
> +#include <linux/of_device.h>
> +#include <linux/of_graph.h>
> +#include <linux/of_reserved_mem.h>
> +
> +#include <drm/drmP.h>
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_crtc.h>
> +#include <drm/drm_crtc_helper.h>
> +#include <drm/drm_fb_helper.h>
> +#include <drm/drm_fb_cma_helper.h>
> +#include <drm/drm_gem_cma_helper.h>
> +#include <drm/drm_of.h>
> +
> +#include "malidp_drv.h"
> +#include "malidp_regs.h"
> +#include "malidp_hw.h"
> +
> +#define MALIDP_CONF_VALID_TIMEOUT	250
> +
> +/*
> + * set the "config valid" bit and wait until the hardware acts on it
> + */
> +static int malidp_set_and_wait_config_valid(struct drm_device *drm)
> +{
> +	struct malidp_drm *malidp =3D drm->dev_private;
> +	struct malidp_hw_device *hwdev =3D malidp->dev;
> +	int ret;
> +
> +	hwdev->set_config_valid(hwdev);
> +	/* don't wait for config_valid flag if we are in config mode */
> +	if (hwdev->in_config_mode(hwdev))
> +		return 0;
> +
> +	ret =3D wait_event_interruptible_timeout(malidp->wq,
> +			atomic_read(&malidp->config_valid) =3D=3D 1,
> +			msecs_to_jiffies(MALIDP_CONF_VALID_TIMEOUT));
> +
> +	return (ret > 0) ? 0 : -ETIMEDOUT;
> +}
> +
> +static void malidp_output_poll_changed(struct drm_device *drm)
> +{
> +	struct malidp_drm *malidp =3D drm->dev_private;
> +
> +	drm_fbdev_cma_hotplug_event(malidp->fbdev);
> +}
> +
> +static void malidp_atomic_commit_hw_done(struct drm_atomic_state *st=
ate)
> +{
> +	struct drm_pending_vblank_event *event;
> +	struct drm_device *drm =3D state->dev;
> +	struct malidp_drm *malidp =3D drm->dev_private;
> +	int ret =3D malidp_set_and_wait_config_valid(drm);
> +
> +	if (ret)
> +		DRM_DEBUG_DRIVER("timed out waiting for updated configuration\n");
> +
> +	event =3D malidp->crtc.state->event;
> +	if (event) {
> +		malidp->crtc.state->event =3D NULL;
> +
> +		spin_lock_irq(&drm->event_lock);
> +		if (drm_crtc_vblank_get(&malidp->crtc) =3D=3D 0)
> +			drm_crtc_arm_vblank_event(&malidp->crtc, event);
> +		else
> +			drm_crtc_send_vblank_event(&malidp->crtc, event);
> +		spin_unlock_irq(&drm->event_lock);
> +	}
> +	drm_atomic_helper_commit_hw_done(state);
> +}
> +
> +static void malidp_atomic_commit_tail(struct drm_atomic_state *state=
)
> +{
> +	struct drm_device *drm =3D state->dev;
> +
> +	drm_atomic_helper_commit_modeset_disables(drm, state);
> +	drm_atomic_helper_commit_modeset_enables(drm, state);
> +	drm_atomic_helper_commit_planes(drm, state, true);
> +
> +	malidp_atomic_commit_hw_done(state);
> +
> +	drm_atomic_helper_wait_for_vblanks(drm, state);
> +
> +	drm_atomic_helper_cleanup_planes(drm, state);
> +}
> +
> +static struct drm_mode_config_helper_funcs malidp_mode_config_helper=
s =3D {
> +	.atomic_commit_tail =3D malidp_atomic_commit_tail,
> +};
> +
> +static const struct drm_mode_config_funcs malidp_mode_config_funcs =3D=
 {
> +	.fb_create =3D drm_fb_cma_create,
> +	.output_poll_changed =3D malidp_output_poll_changed,
> +	.atomic_check =3D drm_atomic_helper_check,
> +	.atomic_commit =3D drm_atomic_helper_commit,
> +};
> +
> +static int malidp_enable_vblank(struct drm_device *drm, unsigned int=
 crtc)
> +{
> +	struct malidp_drm *malidp =3D drm->dev_private;
> +	struct malidp_hw_device *hwdev =3D malidp->dev;
> +
> +	malidp_hw_enable_irq(hwdev, MALIDP_DE_BLOCK,
> +			     hwdev->map.de_irq_map.vsync_irq);
> +	return 0;
> +}
> +
> +static void malidp_disable_vblank(struct drm_device *drm, unsigned i=
nt pipe)
> +{
> +	struct malidp_drm *malidp =3D drm->dev_private;
> +	struct malidp_hw_device *hwdev =3D malidp->dev;
> +
> +	malidp_hw_disable_irq(hwdev, MALIDP_DE_BLOCK,
> +			      hwdev->map.de_irq_map.vsync_irq);
> +}
> +
> +static int malidp_init(struct drm_device *drm)
> +{
> +	int ret;
> +	struct malidp_drm *malidp =3D drm->dev_private;
> +	struct malidp_hw_device *hwdev =3D malidp->dev;
> +
> +	drm_mode_config_init(drm);
> +
> +	drm->mode_config.min_width =3D hwdev->min_line_size;
> +	drm->mode_config.min_height =3D hwdev->min_line_size;
> +	drm->mode_config.max_width =3D hwdev->max_line_size;
> +	drm->mode_config.max_height =3D hwdev->max_line_size;
> +	drm->mode_config.funcs =3D &malidp_mode_config_funcs;
> +	drm->mode_config.helper_private =3D &malidp_mode_config_helpers;
> +
> +	ret =3D malidp_crtc_init(drm);
> +	if (ret) {
> +		drm_mode_config_cleanup(drm);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int malidp_irq_init(struct platform_device *pdev)
> +{
> +	int irq_de, irq_se, ret =3D 0;
> +	struct drm_device *drm =3D dev_get_drvdata(&pdev->dev);
> +
> +	/* fetch the interrupts from DT */
> +	irq_de =3D platform_get_irq_byname(pdev, "DE");
> +	if (irq_de < 0) {
> +		DRM_ERROR("no 'DE' IRQ specified!\n");
> +		return irq_de;
> +	}
> +	irq_se =3D platform_get_irq_byname(pdev, "SE");
> +	if (irq_se < 0) {
> +		DRM_ERROR("no 'SE' IRQ specified!\n");
> +		return irq_se;
> +	}
> +
> +	ret =3D malidp_de_irq_init(drm, irq_de);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D malidp_se_irq_init(drm, irq_se);
> +	if (ret) {
> +		malidp_de_irq_fini(drm);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void malidp_lastclose(struct drm_device *drm)
> +{
> +	struct malidp_drm *malidp =3D drm->dev_private;
> +
> +	drm_fbdev_cma_restore_mode(malidp->fbdev);
> +}
> +
> +static const struct file_operations fops =3D {
> +	.owner =3D THIS_MODULE,
> +	.open =3D drm_open,
> +	.release =3D drm_release,
> +	.unlocked_ioctl =3D drm_ioctl,
> +#ifdef CONFIG_COMPAT
> +	.compat_ioctl =3D drm_compat_ioctl,
> +#endif
> +	.poll =3D drm_poll,
> +	.read =3D drm_read,
> +	.llseek =3D noop_llseek,
> +	.mmap =3D drm_gem_cma_mmap,
> +};
> +
> +static struct drm_driver malidp_driver =3D {
> +	.driver_features =3D DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC |
> +			   DRIVER_PRIME,
> +	.lastclose =3D malidp_lastclose,
> +	.get_vblank_counter =3D drm_vblank_no_hw_counter,
> +	.enable_vblank =3D malidp_enable_vblank,
> +	.disable_vblank =3D malidp_disable_vblank,
> +	.gem_free_object_unlocked =3D drm_gem_cma_free_object,
> +	.gem_vm_ops =3D &drm_gem_cma_vm_ops,
> +	.dumb_create =3D drm_gem_cma_dumb_create,
> +	.dumb_map_offset =3D drm_gem_cma_dumb_map_offset,
> +	.dumb_destroy =3D drm_gem_dumb_destroy,
> +	.prime_handle_to_fd =3D drm_gem_prime_handle_to_fd,
> +	.prime_fd_to_handle =3D drm_gem_prime_fd_to_handle,
> +	.gem_prime_export =3D drm_gem_prime_export,
> +	.gem_prime_import =3D drm_gem_prime_import,
> +	.gem_prime_get_sg_table =3D drm_gem_cma_prime_get_sg_table,
> +	.gem_prime_import_sg_table =3D drm_gem_cma_prime_import_sg_table,
> +	.gem_prime_vmap =3D drm_gem_cma_prime_vmap,
> +	.gem_prime_vunmap =3D drm_gem_cma_prime_vunmap,
> +	.gem_prime_mmap =3D drm_gem_cma_prime_mmap,
> +	.fops =3D &fops,
> +	.name =3D "mali-dp",
> +	.desc =3D "ARM Mali Display Processor driver",
> +	.date =3D "20160106",
> +	.major =3D 1,
> +	.minor =3D 0,
> +};
> +
> +static const struct of_device_id  malidp_drm_of_match[] =3D {
> +	{
> +		.compatible =3D "arm,mali-dp500",
> +		.data =3D &malidp_device[MALIDP_500]
> +	},
> +	{
> +		.compatible =3D "arm,mali-dp550",
> +		.data =3D &malidp_device[MALIDP_550]
> +	},
> +	{
> +		.compatible =3D "arm,mali-dp650",
> +		.data =3D &malidp_device[MALIDP_650]
> +	},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, malidp_drm_of_match);
> +
> +#define MAX_OUTPUT_CHANNELS	3
> +
> +static int malidp_bind(struct device *dev)
> +{
> +	struct resource *res;
> +	struct drm_device *drm;
> +	struct malidp_drm *malidp;
> +	struct malidp_hw_device *hwdev;
> +	struct platform_device *pdev =3D to_platform_device(dev);
> +	/* number of lines for the R, G and B output */
> +	u8 output_width[MAX_OUTPUT_CHANNELS];
> +	int ret =3D 0, i;
> +	u32 version, out_depth =3D 0;
> +
> +	malidp =3D devm_kzalloc(dev, sizeof(*malidp), GFP_KERNEL);
> +	if (!malidp)
> +		return -ENOMEM;
> +
> +	hwdev =3D devm_kzalloc(dev, sizeof(*hwdev), GFP_KERNEL);
> +	if (!hwdev)
> +		return -ENOMEM;
> +
> +	/*
> +	 * copy the associated data from malidp_drm_of_match to avoid
> +	 * having to keep a reference to the OF node after binding
> +	 */
> +	memcpy(hwdev, of_device_get_match_data(dev), sizeof(*hwdev));
> +	malidp->dev =3D hwdev;
> +
> +	INIT_LIST_HEAD(&malidp->event_list);
> +
> +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	hwdev->regs =3D devm_ioremap_resource(dev, res);
> +	if (IS_ERR(hwdev->regs)) {
> +		DRM_ERROR("Failed to map control registers area\n");
> +		return PTR_ERR(hwdev->regs);
> +	}
> +
> +	hwdev->pclk =3D devm_clk_get(dev, "pclk");
> +	if (IS_ERR(hwdev->pclk))
> +		return PTR_ERR(hwdev->pclk);
> +
> +	hwdev->aclk =3D devm_clk_get(dev, "aclk");
> +	if (IS_ERR(hwdev->aclk))
> +		return PTR_ERR(hwdev->aclk);
> +
> +	hwdev->mclk =3D devm_clk_get(dev, "mclk");
> +	if (IS_ERR(hwdev->mclk))
> +		return PTR_ERR(hwdev->mclk);
> +
> +	hwdev->pxlclk =3D devm_clk_get(dev, "pxlclk");
> +	if (IS_ERR(hwdev->pxlclk))
> +		return PTR_ERR(hwdev->pxlclk);
> +
> +	/* Get the optional framebuffer memory resource */
> +	ret =3D of_reserved_mem_device_init(dev);
> +	if (ret && ret !=3D -ENODEV)
> +		return ret;
> +
> +	drm =3D drm_dev_alloc(&malidp_driver, dev);
> +	if (!drm) {
> +		ret =3D -ENOMEM;
> +		goto alloc_fail;
> +	}
> +
> +	/* Enable APB clock in order to get access to the registers */
> +	clk_prepare_enable(hwdev->pclk);
> +	/*
> +	 * Enable AXI clock and main clock so that prefetch can start once
> +	 * the registers are set
> +	 */
> +	clk_prepare_enable(hwdev->aclk);
> +	clk_prepare_enable(hwdev->mclk);
> +
> +	ret =3D hwdev->query_hw(hwdev);
> +	if (ret) {
> +		DRM_ERROR("Invalid HW configuration\n");
> +		goto query_hw_fail;
> +	}
> +
> +	version =3D malidp_hw_read(hwdev, hwdev->map.dc_base + MALIDP_DE_CO=
RE_ID);
> +	DRM_INFO("found ARM Mali-DP%3x version r%dp%d\n", version >> 16,
> +		 (version >> 12) & 0xf, (version >> 8) & 0xf);
> +
> +	/* set the number of lines used for output of RGB data */
> +	ret =3D of_property_read_u8_array(dev->of_node,
> +					"arm,malidp-output-port-lines",
> +					output_width, MAX_OUTPUT_CHANNELS);
> +	if (ret)
> +		goto query_hw_fail;
> +
> +	for (i =3D 0; i < MAX_OUTPUT_CHANNELS; i++)
> +		out_depth =3D (out_depth << 8) | (output_width[i] & 0xf);
> +	malidp_hw_write(hwdev, out_depth, hwdev->map.out_depth_base);
> +
> +	drm->dev_private =3D malidp;
> +	dev_set_drvdata(dev, drm);
> +	atomic_set(&malidp->config_valid, 0);
> +	init_waitqueue_head(&malidp->wq);
> +
> +	ret =3D malidp_init(drm);
> +	if (ret < 0)
> +		goto init_fail;
> +
> +	ret =3D drm_dev_register(drm, 0);
> +	if (ret)
> +		goto register_fail;
> +
> +	/* Set the CRTC's port so that the encoder component can find it */
> +	malidp->crtc.port =3D of_graph_get_next_endpoint(dev->of_node, NULL=
);
> +
> +	ret =3D component_bind_all(dev, drm);
> +	of_node_put(malidp->crtc.port);
> +
> +	if (ret) {
> +		DRM_ERROR("Failed to bind all components\n");
> +		goto bind_fail;
> +	}
> +
> +	ret =3D malidp_irq_init(pdev);
> +	if (ret < 0)
> +		goto irq_init_fail;
> +
> +	ret =3D drm_vblank_init(drm, drm->mode_config.num_crtc);
> +	if (ret < 0) {
> +		DRM_ERROR("failed to initialise vblank\n");
> +		goto vblank_fail;
> +	}
> +
> +	drm_mode_config_reset(drm);
> +
> +	malidp->fbdev =3D drm_fbdev_cma_init(drm, 32, drm->mode_config.num_=
crtc,
> +					   drm->mode_config.num_connector);
> +
> +	if (IS_ERR(malidp->fbdev)) {
> +		ret =3D PTR_ERR(malidp->fbdev);
> +		malidp->fbdev =3D NULL;
> +		goto fbdev_fail;
> +	}
> +
> +	drm_kms_helper_poll_init(drm);
> +	return 0;
> +
> +fbdev_fail:
> +	drm_vblank_cleanup(drm);
> +vblank_fail:
> +	malidp_se_irq_fini(drm);
> +	malidp_de_irq_fini(drm);
> +irq_init_fail:
> +	component_unbind_all(dev, drm);
> +bind_fail:
> +	drm_dev_unregister(drm);
> +register_fail:
> +	malidp_de_planes_destroy(drm);
> +	drm_mode_config_cleanup(drm);
> +init_fail:
> +	drm->dev_private =3D NULL;
> +	dev_set_drvdata(dev, NULL);
> +query_hw_fail:
> +	clk_disable_unprepare(hwdev->mclk);
> +	clk_disable_unprepare(hwdev->aclk);
> +	clk_disable_unprepare(hwdev->pclk);
> +	drm_dev_unref(drm);
> +alloc_fail:
> +	of_reserved_mem_device_release(dev);
> +
> +	return ret;
> +}
> +
> +static void malidp_unbind(struct device *dev)
> +{
> +	struct drm_device *drm =3D dev_get_drvdata(dev);
> +	struct malidp_drm *malidp =3D drm->dev_private;
> +	struct malidp_hw_device *hwdev =3D malidp->dev;
> +
> +	if (malidp->fbdev) {
> +		drm_fbdev_cma_fini(malidp->fbdev);
> +		malidp->fbdev =3D NULL;
> +	}
> +	drm_kms_helper_poll_fini(drm);
> +	malidp_se_irq_fini(drm);
> +	malidp_de_irq_fini(drm);
> +	drm_vblank_cleanup(drm);
> +	component_unbind_all(dev, drm);
> +	drm_dev_unregister(drm);
> +	malidp_de_planes_destroy(drm);
> +	drm_mode_config_cleanup(drm);
> +	drm->dev_private =3D NULL;
> +	dev_set_drvdata(dev, NULL);
> +	clk_disable_unprepare(hwdev->mclk);
> +	clk_disable_unprepare(hwdev->aclk);
> +	clk_disable_unprepare(hwdev->pclk);
> +	drm_dev_unref(drm);
> +	of_reserved_mem_device_release(dev);
> +}
> +
> +static const struct component_master_ops malidp_master_ops =3D {
> +	.bind =3D malidp_bind,
> +	.unbind =3D malidp_unbind,
> +};
> +
> +static int malidp_compare_dev(struct device *dev, void *data)
> +{
> +	struct device_node *np =3D data;
> +
> +	return dev->of_node =3D=3D np;
> +}
> +
> +static int malidp_platform_probe(struct platform_device *pdev)
> +{
> +	struct device_node *port, *ep;
> +	struct component_match *match =3D NULL;
> +
> +	if (!pdev->dev.of_node)
> +		return -ENODEV;
> +
> +	/* there is only one output port inside each device, find it */
> +	ep =3D of_graph_get_next_endpoint(pdev->dev.of_node, NULL);
> +	if (!ep)
> +		return -ENODEV;
> +
> +	if (!of_device_is_available(ep)) {
> +		of_node_put(ep);
> +		return -ENODEV;
> +	}
> +
> +	/* add the remote encoder port as component */
> +	port =3D of_graph_get_remote_port_parent(ep);
> +	of_node_put(ep);
> +	if (!port || !of_device_is_available(port)) {
> +		of_node_put(port);
> +		return -EAGAIN;
> +	}
> +
> +	component_match_add(&pdev->dev, &match, malidp_compare_dev, port);
> +	return component_master_add_with_match(&pdev->dev, &malidp_master_o=
ps,
> +					       match);
> +}
> +
> +static int malidp_platform_remove(struct platform_device *pdev)
> +{
> +	component_master_del(&pdev->dev, &malidp_master_ops);
> +	return 0;
> +}
> +
> +static struct platform_driver malidp_platform_driver =3D {
> +	.probe		=3D malidp_platform_probe,
> +	.remove		=3D malidp_platform_remove,
> +	.driver	=3D {
> +		.name =3D "mali-dp",
> +		.of_match_table	=3D malidp_drm_of_match,
> +	},
> +};
> +
> +module_platform_driver(malidp_platform_driver);
> +
> +MODULE_AUTHOR("Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>");
> +MODULE_DESCRIPTION("ARM Mali DP DRM driver");
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/gpu/drm/arm/malidp_drv.h b/drivers/gpu/drm/arm/m=
alidp_drv.h
> new file mode 100644
> index 0000000..95558fd
> --- /dev/null
> +++ b/drivers/gpu/drm/arm/malidp_drv.h
> @@ -0,0 +1,54 @@
> +/*
> + * (C) COPYRIGHT 2016 ARM Limited. All rights reserved.
> + * Author: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
> + *
> + * This program is free software and is provided to you under the te=
rms of the
> + * GNU General Public License version 2 as published by the Free Sof=
tware
> + * Foundation, and any use by you of this program is subject to the =
terms
> + * of such GNU licence.
> + *
> + * ARM Mali DP500/DP550/DP650 KMS/DRM driver structures
> + */
> +
> +#ifndef __MALIDP_DRV_H__
> +#define __MALIDP_DRV_H__
> +
> +#include <linux/mutex.h>
> +#include <linux/wait.h>
> +#include "malidp_hw.h"
> +
> +struct malidp_drm {
> +	struct malidp_hw_device *dev;
> +	struct drm_fbdev_cma *fbdev;
> +	struct list_head event_list;
> +	struct drm_crtc crtc;
> +	wait_queue_head_t wq;
> +	atomic_t config_valid;
> +};
> +
> +#define crtc_to_malidp_device(x) container_of(x, struct malidp_drm, =
crtc)
> +
> +struct malidp_plane {
> +	struct drm_plane base;
> +	struct malidp_hw_device *hwdev;
> +	const struct malidp_layer *layer;
> +};
> +
> +struct malidp_plane_state {
> +	struct drm_plane_state base;
> +
> +	/* size of the required rotation memory if plane is rotated */
> +	u32 rotmem_size;
> +};
> +
> +#define to_malidp_plane(x) container_of(x, struct malidp_plane, base=
)
> +#define to_malidp_plane_state(x) container_of(x, struct malidp_plane=
_state, base)
> +
> +int malidp_de_planes_init(struct drm_device *drm);
> +void malidp_de_planes_destroy(struct drm_device *drm);
> +int malidp_crtc_init(struct drm_device *drm);
> +
> +/* often used combination of rotational bits */
> +#define MALIDP_ROTATED_MASK	(BIT(DRM_ROTATE_90) | BIT(DRM_ROTATE_270=
))
> +
> +#endif  /* __MALIDP_DRV_H__ */
> diff --git a/drivers/gpu/drm/arm/malidp_hw.c b/drivers/gpu/drm/arm/ma=
lidp_hw.c
> new file mode 100644
> index 0000000..a6132f1
> --- /dev/null
> +++ b/drivers/gpu/drm/arm/malidp_hw.c
> @@ -0,0 +1,691 @@
> +/*
> + * (C) COPYRIGHT 2016 ARM Limited. All rights reserved.
> + * Author: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
> + *
> + * This program is free software and is provided to you under the te=
rms of the
> + * GNU General Public License version 2 as published by the Free Sof=
tware
> + * Foundation, and any use by you of this program is subject to the =
terms
> + * of such GNU licence.
> + *
> + * ARM Mali DP500/DP550/DP650 hardware manipulation routines. This i=
s where
> + * the difference between various versions of the hardware is being =
dealt with
> + * in an attempt to provide to the rest of the driver code a unified=
 view
> + */
> +
> +#include <linux/types.h>
> +#include <linux/io.h>
> +#include <drm/drmP.h>
> +#include <video/videomode.h>
> +#include <video/display_timing.h>
> +
> +#include "malidp_drv.h"
> +#include "malidp_hw.h"
> +
> +static const struct malidp_input_format malidp500_de_formats[] =3D {
> +	/*    fourcc,   layers supporting the format,     internal id  */
> +	{ DRM_FORMAT_ARGB2101010, DE_VIDEO1 | DE_GRAPHICS1 | DE_GRAPHICS2, =
 0 },
> +	{ DRM_FORMAT_ABGR2101010, DE_VIDEO1 | DE_GRAPHICS1 | DE_GRAPHICS2, =
 1 },
> +	{ DRM_FORMAT_ARGB8888, DE_VIDEO1 | DE_GRAPHICS1 | DE_GRAPHICS2,  2 =
},
> +	{ DRM_FORMAT_ABGR8888, DE_VIDEO1 | DE_GRAPHICS1 | DE_GRAPHICS2,  3 =
},
> +	{ DRM_FORMAT_XRGB8888, DE_VIDEO1 | DE_GRAPHICS1 | DE_GRAPHICS2,  4 =
},
> +	{ DRM_FORMAT_XBGR8888, DE_VIDEO1 | DE_GRAPHICS1 | DE_GRAPHICS2,  5 =
},
> +	{ DRM_FORMAT_RGB888, DE_VIDEO1 | DE_GRAPHICS1 | DE_GRAPHICS2,  6 },
> +	{ DRM_FORMAT_BGR888, DE_VIDEO1 | DE_GRAPHICS1 | DE_GRAPHICS2,  7 },
> +	{ DRM_FORMAT_RGBA5551, DE_VIDEO1 | DE_GRAPHICS1 | DE_GRAPHICS2,  8 =
},
> +	{ DRM_FORMAT_ABGR1555, DE_VIDEO1 | DE_GRAPHICS1 | DE_GRAPHICS2,  9 =
},
> +	{ DRM_FORMAT_RGB565, DE_VIDEO1 | DE_GRAPHICS1 | DE_GRAPHICS2, 10 },
> +	{ DRM_FORMAT_BGR565, DE_VIDEO1 | DE_GRAPHICS1 | DE_GRAPHICS2, 11 },
> +	{ DRM_FORMAT_UYVY, DE_VIDEO1, 12 },
> +	{ DRM_FORMAT_YUYV, DE_VIDEO1, 13 },
> +	{ DRM_FORMAT_NV12, DE_VIDEO1, 14 },
> +	{ DRM_FORMAT_YUV420, DE_VIDEO1, 15 },
> +};
> +
> +#define MALIDP_ID(__group, __format) \
> +	((((__group) & 0x7) << 3) | ((__format) & 0x7))
> +
> +#define MALIDP_COMMON_FORMATS \
> +	/*    fourcc,   layers supporting the format,      internal id   */=
 \
> +	{ DRM_FORMAT_ARGB2101010, DE_VIDEO1 | DE_GRAPHICS1 | DE_VIDEO2, MAL=
IDP_ID(0, 0) }, \
> +	{ DRM_FORMAT_ABGR2101010, DE_VIDEO1 | DE_GRAPHICS1 | DE_VIDEO2, MAL=
IDP_ID(0, 1) }, \
> +	{ DRM_FORMAT_RGBA1010102, DE_VIDEO1 | DE_GRAPHICS1 | DE_VIDEO2, MAL=
IDP_ID(0, 2) }, \
> +	{ DRM_FORMAT_BGRA1010102, DE_VIDEO1 | DE_GRAPHICS1 | DE_VIDEO2, MAL=
IDP_ID(0, 3) }, \
> +	{ DRM_FORMAT_ARGB8888, DE_VIDEO1 | DE_GRAPHICS1 | DE_VIDEO2 | DE_SM=
ART, MALIDP_ID(1, 0) }, \
> +	{ DRM_FORMAT_ABGR8888, DE_VIDEO1 | DE_GRAPHICS1 | DE_VIDEO2 | DE_SM=
ART, MALIDP_ID(1, 1) }, \
> +	{ DRM_FORMAT_RGBA8888, DE_VIDEO1 | DE_GRAPHICS1 | DE_VIDEO2 | DE_SM=
ART, MALIDP_ID(1, 2) }, \
> +	{ DRM_FORMAT_BGRA8888, DE_VIDEO1 | DE_GRAPHICS1 | DE_VIDEO2 | DE_SM=
ART, MALIDP_ID(1, 3) }, \
> +	{ DRM_FORMAT_XRGB8888, DE_VIDEO1 | DE_GRAPHICS1 | DE_VIDEO2 | DE_SM=
ART, MALIDP_ID(2, 0) }, \
> +	{ DRM_FORMAT_XBGR8888, DE_VIDEO1 | DE_GRAPHICS1 | DE_VIDEO2 | DE_SM=
ART, MALIDP_ID(2, 1) }, \
> +	{ DRM_FORMAT_RGBX8888, DE_VIDEO1 | DE_GRAPHICS1 | DE_VIDEO2 | DE_SM=
ART, MALIDP_ID(2, 2) }, \
> +	{ DRM_FORMAT_BGRX8888, DE_VIDEO1 | DE_GRAPHICS1 | DE_VIDEO2 | DE_SM=
ART, MALIDP_ID(2, 3) }, \
> +	{ DRM_FORMAT_RGB888, DE_VIDEO1 | DE_GRAPHICS1 | DE_VIDEO2, MALIDP_I=
D(3, 0) }, \
> +	{ DRM_FORMAT_BGR888, DE_VIDEO1 | DE_GRAPHICS1 | DE_VIDEO2, MALIDP_I=
D(3, 1) }, \
> +	{ DRM_FORMAT_RGBA5551, DE_VIDEO1 | DE_GRAPHICS1 | DE_VIDEO2, MALIDP=
_ID(4, 0) }, \
> +	{ DRM_FORMAT_ABGR1555, DE_VIDEO1 | DE_GRAPHICS1 | DE_VIDEO2, MALIDP=
_ID(4, 1) }, \
> +	{ DRM_FORMAT_RGB565, DE_VIDEO1 | DE_GRAPHICS1 | DE_VIDEO2, MALIDP_I=
D(4, 2) }, \
> +	{ DRM_FORMAT_BGR565, DE_VIDEO1 | DE_GRAPHICS1 | DE_VIDEO2, MALIDP_I=
D(4, 3) }, \
> +	{ DRM_FORMAT_YUYV, DE_VIDEO1 | DE_VIDEO2, MALIDP_ID(5, 2) },	\
> +	{ DRM_FORMAT_UYVY, DE_VIDEO1 | DE_VIDEO2, MALIDP_ID(5, 3) },	\
> +	{ DRM_FORMAT_NV12, DE_VIDEO1 | DE_VIDEO2, MALIDP_ID(5, 6) },	\
> +	{ DRM_FORMAT_YUV420, DE_VIDEO1 | DE_VIDEO2, MALIDP_ID(5, 7) }
> +
> +static const struct malidp_input_format malidp550_de_formats[] =3D {
> +	MALIDP_COMMON_FORMATS,
> +};
> +
> +static const struct malidp_layer malidp500_layers[] =3D {
> +	{ DE_VIDEO1, MALIDP500_DE_LV_BASE, MALIDP500_DE_LV_PTR_BASE },
> +	{ DE_GRAPHICS1, MALIDP500_DE_LG1_BASE, MALIDP500_DE_LG1_PTR_BASE },
> +	{ DE_GRAPHICS2, MALIDP500_DE_LG2_BASE, MALIDP500_DE_LG2_PTR_BASE },
> +};
> +
> +static const struct malidp_layer malidp550_layers[] =3D {
> +	{ DE_VIDEO1, MALIDP550_DE_LV1_BASE, MALIDP550_DE_LV1_PTR_BASE },
> +	{ DE_GRAPHICS1, MALIDP550_DE_LG_BASE, MALIDP550_DE_LG_PTR_BASE },
> +	{ DE_VIDEO2, MALIDP550_DE_LV2_BASE, MALIDP550_DE_LV2_PTR_BASE },
> +	{ DE_SMART, MALIDP550_DE_LS_BASE, MALIDP550_DE_LS_PTR_BASE },
> +};
> +
> +#define MALIDP_DE_DEFAULT_PREFETCH_START	5
> +
> +static int malidp500_query_hw(struct malidp_hw_device *hwdev)
> +{
> +	u32 conf =3D malidp_hw_read(hwdev, MALIDP500_CONFIG_ID);
> +	/* bit 4 of the CONFIG_ID register holds the line size multiplier *=
/
> +	u8 ln_size_mult =3D conf & 0x10 ? 2 : 1;
> +
> +	hwdev->min_line_size =3D 2;
> +	hwdev->max_line_size =3D SZ_2K * ln_size_mult;
> +	hwdev->rotation_memory[0] =3D SZ_1K * 64 * ln_size_mult;
> +	hwdev->rotation_memory[1] =3D 0; /* no second rotation memory bank =
*/
> +
> +	return 0;
> +}
> +
> +static void malidp500_enter_config_mode(struct malidp_hw_device *hwd=
ev)
> +{
> +	u32 status, count =3D 100;
> +
> +	malidp_hw_setbits(hwdev, MALIDP500_DC_CONFIG_REQ, MALIDP500_DC_CONT=
ROL);
> +	while (count) {
> +		status =3D malidp_hw_read(hwdev, hwdev->map.dc_base + MALIDP_REG_S=
TATUS);
> +		if ((status & MALIDP500_DC_CONFIG_REQ) =3D=3D MALIDP500_DC_CONFIG_=
REQ)
> +			break;
> +		/*
> +		 * entering config mode can take as long as the rendering
> +		 * of a full frame, hence the long sleep here
> +		 */
> +		usleep_range(1000, 10000);
> +		count--;
> +	}
> +	WARN(count =3D=3D 0, "timeout while entering config mode");
> +}
> +
> +static void malidp500_leave_config_mode(struct malidp_hw_device *hwd=
ev)
> +{
> +	u32 status, count =3D 100;
> +
> +	malidp_hw_clearbits(hwdev, MALIDP500_DC_CONFIG_REQ, MALIDP500_DC_CO=
NTROL);
> +	while (count) {
> +		status =3D malidp_hw_read(hwdev, hwdev->map.dc_base + MALIDP_REG_S=
TATUS);
> +		if ((status & MALIDP500_DC_CONFIG_REQ) =3D=3D 0)
> +			break;
> +		usleep_range(100, 1000);
> +		count--;
> +	}
> +	WARN(count =3D=3D 0, "timeout while leaving config mode");
> +}
> +
> +static bool malidp500_in_config_mode(struct malidp_hw_device *hwdev)
> +{
> +	u32 status;
> +
> +	status =3D malidp_hw_read(hwdev, hwdev->map.dc_base + MALIDP_REG_ST=
ATUS);
> +	if ((status & MALIDP500_DC_CONFIG_REQ) =3D=3D MALIDP500_DC_CONFIG_R=
EQ)
> +		return true;
> +
> +	return false;
> +}
> +
> +static void malidp500_set_config_valid(struct malidp_hw_device *hwde=
v)
> +{
> +	malidp_hw_setbits(hwdev, MALIDP_CFG_VALID, MALIDP500_CONFIG_VALID);
> +}
> +
> +static void malidp500_modeset(struct malidp_hw_device *hwdev, struct=
 videomode *mode)
> +{
> +	u32 val =3D 0;
> +
> +	malidp_hw_clearbits(hwdev, MALIDP500_DC_CLEAR_MASK, MALIDP500_DC_CO=
NTROL);
> +	if (mode->flags & DISPLAY_FLAGS_HSYNC_HIGH)
> +		val |=3D MALIDP500_HSYNCPOL;
> +	if (mode->flags & DISPLAY_FLAGS_VSYNC_HIGH)
> +		val |=3D MALIDP500_VSYNCPOL;
> +	val |=3D MALIDP_DE_DEFAULT_PREFETCH_START;
> +	malidp_hw_setbits(hwdev, val, MALIDP500_DC_CONTROL);
> +
> +	/*
> +	 * Mali-DP500 encodes the background color like this:
> +	 *    - red   @ MALIDP500_BGND_COLOR[12:0]
> +	 *    - green @ MALIDP500_BGND_COLOR[27:16]
> +	 *    - blue  @ (MALIDP500_BGND_COLOR + 4)[12:0]
> +	 */
> +	val =3D ((MALIDP_BGND_COLOR_G & 0xfff) << 16) |
> +	      (MALIDP_BGND_COLOR_R & 0xfff);
> +	malidp_hw_write(hwdev, val, MALIDP500_BGND_COLOR);
> +	malidp_hw_write(hwdev, MALIDP_BGND_COLOR_B, MALIDP500_BGND_COLOR + =
4);
> +
> +	val =3D MALIDP_DE_H_FRONTPORCH(mode->hfront_porch) |
> +		MALIDP_DE_H_BACKPORCH(mode->hback_porch);
> +	malidp_hw_write(hwdev, val, MALIDP500_TIMINGS_BASE + MALIDP_DE_H_TI=
MINGS);
> +
> +	val =3D MALIDP500_DE_V_FRONTPORCH(mode->vfront_porch) |
> +		MALIDP_DE_V_BACKPORCH(mode->vback_porch);
> +	malidp_hw_write(hwdev, val, MALIDP500_TIMINGS_BASE + MALIDP_DE_V_TI=
MINGS);
> +
> +	val =3D MALIDP_DE_H_SYNCWIDTH(mode->hsync_len) |
> +		MALIDP_DE_V_SYNCWIDTH(mode->vsync_len);
> +	malidp_hw_write(hwdev, val, MALIDP500_TIMINGS_BASE + MALIDP_DE_SYNC=
_WIDTH);
> +
> +	val =3D MALIDP_DE_H_ACTIVE(mode->hactive) | MALIDP_DE_V_ACTIVE(mode=
->vactive);
> +	malidp_hw_write(hwdev, val, MALIDP500_TIMINGS_BASE + MALIDP_DE_HV_A=
CTIVE);
> +
> +	if (mode->flags & DISPLAY_FLAGS_INTERLACED)
> +		malidp_hw_setbits(hwdev, MALIDP_DISP_FUNC_ILACED, MALIDP_DE_DISPLA=
Y_FUNC);
> +	else
> +		malidp_hw_clearbits(hwdev, MALIDP_DISP_FUNC_ILACED, MALIDP_DE_DISP=
LAY_FUNC);
> +}
> +
> +static int malidp500_rotmem_required(struct malidp_hw_device *hwdev,=
 u16 w, u16 h, u32 fmt)
> +{
> +	unsigned int depth;
> +	int bpp;
> +
> +	/* RGB888 or BGR888 can't be rotated */
> +	if ((fmt =3D=3D DRM_FORMAT_RGB888) || (fmt =3D=3D DRM_FORMAT_BGR888=
))
> +		return -EINVAL;
> +
> +	/*
> +	 * Each layer needs enough rotation memory to fit 8 lines
> +	 * worth of pixel data. Required size is then:
> +	 *    size =3D rotated_width * (bpp / 8) * 8;
> +	 */
> +	drm_fb_get_bpp_depth(fmt, &depth, &bpp);
> +
> +	return w * bpp;
> +}
> +
> +static int malidp550_query_hw(struct malidp_hw_device *hwdev)
> +{
> +	u32 conf =3D malidp_hw_read(hwdev, MALIDP550_CONFIG_ID);
> +	u8 ln_size =3D (conf >> 4) & 0x3, rsize;
> +
> +	hwdev->min_line_size =3D 2;
> +
> +	switch (ln_size) {
> +	case 0:
> +		hwdev->max_line_size =3D SZ_2K;
> +		/* two banks of 64KB for rotation memory */
> +		rsize =3D 64;
> +		break;
> +	case 1:
> +		hwdev->max_line_size =3D SZ_4K;
> +		/* two banks of 128KB for rotation memory */
> +		rsize =3D 128;
> +		break;
> +	case 2:
> +		hwdev->max_line_size =3D 1280;
> +		/* two banks of 40KB for rotation memory */
> +		rsize =3D 40;
> +		break;
> +	case 3:
> +		/* reserved value */
> +		hwdev->max_line_size =3D 0;
> +		return -EINVAL;
> +	}
> +
> +	hwdev->rotation_memory[0] =3D hwdev->rotation_memory[1] =3D rsize *=
 SZ_1K;
> +	return 0;
> +}
> +
> +static void malidp550_enter_config_mode(struct malidp_hw_device *hwd=
ev)
> +{
> +	u32 status, count =3D 100;
> +
> +	malidp_hw_setbits(hwdev, MALIDP550_DC_CONFIG_REQ, MALIDP550_DC_CONT=
ROL);
> +	while (count) {
> +		status =3D malidp_hw_read(hwdev, hwdev->map.dc_base + MALIDP_REG_S=
TATUS);
> +		if ((status & MALIDP550_DC_CONFIG_REQ) =3D=3D MALIDP550_DC_CONFIG_=
REQ)
> +			break;
> +		/*
> +		 * entering config mode can take as long as the rendering
> +		 * of a full frame, hence the long sleep here
> +		 */
> +		usleep_range(1000, 10000);
> +		count--;
> +	}
> +	WARN(count =3D=3D 0, "timeout while entering config mode");
> +}
> +
> +static void malidp550_leave_config_mode(struct malidp_hw_device *hwd=
ev)
> +{
> +	u32 status, count =3D 100;
> +
> +	malidp_hw_clearbits(hwdev, MALIDP550_DC_CONFIG_REQ, MALIDP550_DC_CO=
NTROL);
> +	while (count) {
> +		status =3D malidp_hw_read(hwdev, hwdev->map.dc_base + MALIDP_REG_S=
TATUS);
> +		if ((status & MALIDP550_DC_CONFIG_REQ) =3D=3D 0)
> +			break;
> +		usleep_range(100, 1000);
> +		count--;
> +	}
> +	WARN(count =3D=3D 0, "timeout while leaving config mode");
> +}
> +
> +static bool malidp550_in_config_mode(struct malidp_hw_device *hwdev)
> +{
> +	u32 status;
> +
> +	status =3D malidp_hw_read(hwdev, hwdev->map.dc_base + MALIDP_REG_ST=
ATUS);
> +	if ((status & MALIDP550_DC_CONFIG_REQ) =3D=3D MALIDP550_DC_CONFIG_R=
EQ)
> +		return true;
> +
> +	return false;
> +}
> +
> +static void malidp550_set_config_valid(struct malidp_hw_device *hwde=
v)
> +{
> +	malidp_hw_setbits(hwdev, MALIDP_CFG_VALID, MALIDP550_CONFIG_VALID);
> +}
> +
> +static void malidp550_modeset(struct malidp_hw_device *hwdev, struct=
 videomode *mode)
> +{
> +	u32 val =3D MALIDP_DE_DEFAULT_PREFETCH_START;
> +
> +	malidp_hw_write(hwdev, val, MALIDP550_DE_CONTROL);
> +	/*
> +	 * Mali-DP550 and Mali-DP650 encode the background color like this:
> +	 *   - red   @ MALIDP550_DE_BGND_COLOR[23:16]
> +	 *   - green @ MALIDP550_DE_BGND_COLOR[15:8]
> +	 *   - blue  @ MALIDP550_DE_BGND_COLOR[7:0]
> +	 *
> +	 * We need to truncate the least significant 4 bits from the defaul=
t
> +	 * MALIDP_BGND_COLOR_x values
> +	 */
> +	val =3D (((MALIDP_BGND_COLOR_R >> 4) & 0xff) << 16) |
> +	      (((MALIDP_BGND_COLOR_G >> 4) & 0xff) << 8) |
> +	      ((MALIDP_BGND_COLOR_B >> 4) & 0xff);
> +	malidp_hw_write(hwdev, val, MALIDP550_DE_BGND_COLOR);
> +
> +	val =3D MALIDP_DE_H_FRONTPORCH(mode->hfront_porch) |
> +		MALIDP_DE_H_BACKPORCH(mode->hback_porch);
> +	malidp_hw_write(hwdev, val, MALIDP550_TIMINGS_BASE + MALIDP_DE_H_TI=
MINGS);
> +
> +	val =3D MALIDP550_DE_V_FRONTPORCH(mode->vfront_porch) |
> +		MALIDP_DE_V_BACKPORCH(mode->vback_porch);
> +	malidp_hw_write(hwdev, val, MALIDP550_TIMINGS_BASE + MALIDP_DE_V_TI=
MINGS);
> +
> +	val =3D MALIDP_DE_H_SYNCWIDTH(mode->hsync_len) |
> +		MALIDP_DE_V_SYNCWIDTH(mode->vsync_len);
> +	if (mode->flags & DISPLAY_FLAGS_HSYNC_HIGH)
> +		val |=3D MALIDP550_HSYNCPOL;
> +	if (mode->flags & DISPLAY_FLAGS_VSYNC_HIGH)
> +		val |=3D MALIDP550_VSYNCPOL;
> +	malidp_hw_write(hwdev, val, MALIDP550_TIMINGS_BASE + MALIDP_DE_SYNC=
_WIDTH);
> +
> +	val =3D MALIDP_DE_H_ACTIVE(mode->hactive) | MALIDP_DE_V_ACTIVE(mode=
->vactive);
> +	malidp_hw_write(hwdev, val, MALIDP550_TIMINGS_BASE + MALIDP_DE_HV_A=
CTIVE);
> +
> +	if (mode->flags & DISPLAY_FLAGS_INTERLACED)
> +		malidp_hw_setbits(hwdev, MALIDP_DISP_FUNC_ILACED, MALIDP_DE_DISPLA=
Y_FUNC);
> +	else
> +		malidp_hw_clearbits(hwdev, MALIDP_DISP_FUNC_ILACED, MALIDP_DE_DISP=
LAY_FUNC);
> +}
> +
> +static int malidp550_rotmem_required(struct malidp_hw_device *hwdev,=
 u16 w, u16 h, u32 fmt)
> +{
> +	u32 bytes_per_col;
> +
> +	/* raw RGB888 or BGR888 can't be rotated */
> +	if ((fmt =3D=3D DRM_FORMAT_RGB888) || (fmt =3D=3D DRM_FORMAT_BGR888=
))
> +		return -EINVAL;
> +
> +	switch (fmt) {
> +	/* 8 lines at 4 bytes per pixel */
> +	case DRM_FORMAT_ARGB2101010:
> +	case DRM_FORMAT_ABGR2101010:
> +	case DRM_FORMAT_RGBA1010102:
> +	case DRM_FORMAT_BGRA1010102:
> +	case DRM_FORMAT_ARGB8888:
> +	case DRM_FORMAT_ABGR8888:
> +	case DRM_FORMAT_RGBA8888:
> +	case DRM_FORMAT_BGRA8888:
> +	case DRM_FORMAT_XRGB8888:
> +	case DRM_FORMAT_XBGR8888:
> +	case DRM_FORMAT_RGBX8888:
> +	case DRM_FORMAT_BGRX8888:
> +	case DRM_FORMAT_RGB888:
> +	case DRM_FORMAT_BGR888:
> +	/* 16 lines at 2 bytes per pixel */
> +	case DRM_FORMAT_RGBA5551:
> +	case DRM_FORMAT_ABGR1555:
> +	case DRM_FORMAT_RGB565:
> +	case DRM_FORMAT_BGR565:
> +	case DRM_FORMAT_UYVY:
> +	case DRM_FORMAT_YUYV:
> +		bytes_per_col =3D 32;
> +		break;
> +	/* 16 lines at 1.5 bytes per pixel */
> +	case DRM_FORMAT_NV12:
> +	case DRM_FORMAT_YUV420:
> +		bytes_per_col =3D 24;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return w * bytes_per_col;
> +}
> +
> +static int malidp650_query_hw(struct malidp_hw_device *hwdev)
> +{
> +	u32 conf =3D malidp_hw_read(hwdev, MALIDP550_CONFIG_ID);
> +	u8 ln_size =3D (conf >> 4) & 0x3, rsize;
> +
> +	hwdev->min_line_size =3D 4;
> +
> +	switch (ln_size) {
> +	case 0:
> +	case 2:
> +		/* reserved values */
> +		hwdev->max_line_size =3D 0;
> +		return -EINVAL;
> +	case 1:
> +		hwdev->max_line_size =3D SZ_4K;
> +		/* two banks of 128KB for rotation memory */
> +		rsize =3D 128;
> +		break;
> +	case 3:
> +		hwdev->max_line_size =3D 2560;
> +		/* two banks of 80KB for rotation memory */
> +		rsize =3D 80;
> +	}
> +
> +	hwdev->rotation_memory[0] =3D hwdev->rotation_memory[1] =3D rsize *=
 SZ_1K;
> +	return 0;
> +}
> +
> +const struct malidp_hw_device malidp_device[MALIDP_MAX_DEVICES] =3D =
{
> +	[MALIDP_500] =3D {
> +		.map =3D {
> +			.se_base =3D MALIDP500_SE_BASE,
> +			.dc_base =3D MALIDP500_DC_BASE,
> +			.out_depth_base =3D MALIDP500_OUTPUT_DEPTH,
> +			.features =3D 0,	/* no CLEARIRQ register */
> +			.n_layers =3D ARRAY_SIZE(malidp500_layers),
> +			.layers =3D malidp500_layers,
> +			.de_irq_map =3D {
> +				.irq_mask =3D MALIDP_DE_IRQ_UNDERRUN |
> +					    MALIDP500_DE_IRQ_AXI_ERR |
> +					    MALIDP500_DE_IRQ_VSYNC |
> +					    MALIDP500_DE_IRQ_GLOBAL,
> +				.vsync_irq =3D MALIDP500_DE_IRQ_VSYNC,
> +			},
> +			.se_irq_map =3D {
> +				.irq_mask =3D MALIDP500_SE_IRQ_CONF_MODE,
> +				.vsync_irq =3D 0,
> +			},
> +			.dc_irq_map =3D {
> +				.irq_mask =3D MALIDP500_DE_IRQ_CONF_VALID,
> +				.vsync_irq =3D MALIDP500_DE_IRQ_CONF_VALID,
> +			},
> +			.input_formats =3D malidp500_de_formats,
> +			.n_input_formats =3D ARRAY_SIZE(malidp500_de_formats),
> +		},
> +		.query_hw =3D malidp500_query_hw,
> +		.enter_config_mode =3D malidp500_enter_config_mode,
> +		.leave_config_mode =3D malidp500_leave_config_mode,
> +		.in_config_mode =3D malidp500_in_config_mode,
> +		.set_config_valid =3D malidp500_set_config_valid,
> +		.modeset =3D malidp500_modeset,
> +		.rotmem_required =3D malidp500_rotmem_required,
> +	},
> +	[MALIDP_550] =3D {
> +		.map =3D {
> +			.se_base =3D MALIDP550_SE_BASE,
> +			.dc_base =3D MALIDP550_DC_BASE,
> +			.out_depth_base =3D MALIDP550_DE_OUTPUT_DEPTH,
> +			.features =3D MALIDP_REGMAP_HAS_CLEARIRQ,
> +			.n_layers =3D ARRAY_SIZE(malidp550_layers),
> +			.layers =3D malidp550_layers,
> +			.de_irq_map =3D {
> +				.irq_mask =3D MALIDP_DE_IRQ_UNDERRUN |
> +					    MALIDP550_DE_IRQ_VSYNC,
> +				.vsync_irq =3D MALIDP550_DE_IRQ_VSYNC,
> +			},
> +			.se_irq_map =3D {
> +				.irq_mask =3D MALIDP550_SE_IRQ_EOW |
> +					    MALIDP550_SE_IRQ_AXI_ERR,
> +			},
> +			.dc_irq_map =3D {
> +				.irq_mask =3D MALIDP550_DC_IRQ_CONF_VALID,
> +				.vsync_irq =3D MALIDP550_DC_IRQ_CONF_VALID,
> +			},
> +			.input_formats =3D malidp550_de_formats,
> +			.n_input_formats =3D ARRAY_SIZE(malidp550_de_formats),
> +		},
> +		.query_hw =3D malidp550_query_hw,
> +		.enter_config_mode =3D malidp550_enter_config_mode,
> +		.leave_config_mode =3D malidp550_leave_config_mode,
> +		.in_config_mode =3D malidp550_in_config_mode,
> +		.set_config_valid =3D malidp550_set_config_valid,
> +		.modeset =3D malidp550_modeset,
> +		.rotmem_required =3D malidp550_rotmem_required,
> +	},
> +	[MALIDP_650] =3D {
> +		.map =3D {
> +			.se_base =3D MALIDP550_SE_BASE,
> +			.dc_base =3D MALIDP550_DC_BASE,
> +			.out_depth_base =3D MALIDP550_DE_OUTPUT_DEPTH,
> +			.features =3D MALIDP_REGMAP_HAS_CLEARIRQ,
> +			.n_layers =3D ARRAY_SIZE(malidp550_layers),
> +			.layers =3D malidp550_layers,
> +			.de_irq_map =3D {
> +				.irq_mask =3D MALIDP_DE_IRQ_UNDERRUN |
> +					    MALIDP650_DE_IRQ_DRIFT |
> +					    MALIDP550_DE_IRQ_VSYNC,
> +				.vsync_irq =3D MALIDP550_DE_IRQ_VSYNC,
> +			},
> +			.se_irq_map =3D {
> +				.irq_mask =3D MALIDP550_SE_IRQ_EOW |
> +					    MALIDP550_SE_IRQ_AXI_ERR,
> +			},
> +			.dc_irq_map =3D {
> +				.irq_mask =3D MALIDP550_DC_IRQ_CONF_VALID,
> +				.vsync_irq =3D MALIDP550_DC_IRQ_CONF_VALID,
> +			},
> +			.input_formats =3D malidp550_de_formats,
> +			.n_input_formats =3D ARRAY_SIZE(malidp550_de_formats),
> +		},
> +		.query_hw =3D malidp650_query_hw,
> +		.enter_config_mode =3D malidp550_enter_config_mode,
> +		.leave_config_mode =3D malidp550_leave_config_mode,
> +		.in_config_mode =3D malidp550_in_config_mode,
> +		.set_config_valid =3D malidp550_set_config_valid,
> +		.modeset =3D malidp550_modeset,
> +		.rotmem_required =3D malidp550_rotmem_required,
> +	},
> +};
> +
> +u8 malidp_hw_get_format_id(const struct malidp_hw_regmap *map,
> +			   u8 layer_id, u32 format)
> +{
> +	unsigned int i;
> +
> +	for (i =3D 0; i < map->n_input_formats; i++) {
> +		if (((map->input_formats[i].layer & layer_id) =3D=3D layer_id) &&
> +		    (map->input_formats[i].format =3D=3D format))
> +			return map->input_formats[i].id;
> +	}
> +
> +	return MALIDP_INVALID_FORMAT_ID;
> +}
> +
> +static void malidp_hw_clear_irq(struct malidp_hw_device *hwdev, u8 b=
lock, u32 irq)
> +{
> +	u32 base =3D malidp_get_block_base(hwdev, block);
> +
> +	if (hwdev->map.features & MALIDP_REGMAP_HAS_CLEARIRQ)
> +		malidp_hw_write(hwdev, irq, base + MALIDP_REG_CLEARIRQ);
> +	else
> +		malidp_hw_write(hwdev, irq, base + MALIDP_REG_STATUS);
> +}
> +
> +static irqreturn_t malidp_de_irq(int irq, void *arg)
> +{
> +	struct drm_device *drm =3D arg;
> +	struct malidp_drm *malidp =3D drm->dev_private;
> +	struct malidp_hw_device *hwdev;
> +	const struct malidp_irq_map *de;
> +	u32 status, mask, dc_status;
> +	irqreturn_t ret =3D IRQ_NONE;
> +
> +	if (!drm->dev_private)
> +		return IRQ_HANDLED;
> +
> +	hwdev =3D malidp->dev;
> +	de =3D &hwdev->map.de_irq_map;
> +
> +	/* first handle the config valid IRQ */
> +	dc_status =3D malidp_hw_read(hwdev, hwdev->map.dc_base + MALIDP_REG=
_STATUS);
> +	if (dc_status & hwdev->map.dc_irq_map.vsync_irq) {
> +		/* we have a page flip event */
> +		atomic_set(&malidp->config_valid, 1);
> +		malidp_hw_clear_irq(hwdev, MALIDP_DC_BLOCK, dc_status);
> +		ret =3D IRQ_WAKE_THREAD;
> +	}
> +
> +	status =3D malidp_hw_read(hwdev, MALIDP_REG_STATUS);
> +	if (!(status & de->irq_mask))
> +		return ret;
> +
> +	mask =3D malidp_hw_read(hwdev, MALIDP_REG_MASKIRQ);
> +	status &=3D mask;
> +	if (status & de->vsync_irq)
> +		drm_crtc_handle_vblank(&malidp->crtc);
> +
> +	malidp_hw_clear_irq(hwdev, MALIDP_DE_BLOCK, status);
> +
> +	return (ret =3D=3D IRQ_NONE) ? IRQ_HANDLED : ret;
> +}
> +
> +static irqreturn_t malidp_de_irq_thread_handler(int irq, void *arg)
> +{
> +	struct drm_device *drm =3D arg;
> +	struct malidp_drm *malidp =3D drm->dev_private;
> +
> +	wake_up(&malidp->wq);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +int malidp_de_irq_init(struct drm_device *drm, int irq)
> +{
> +	struct malidp_drm *malidp =3D drm->dev_private;
> +	struct malidp_hw_device *hwdev =3D malidp->dev;
> +	int ret;
> +
> +	/* ensure interrupts are disabled */
> +	malidp_hw_disable_irq(hwdev, MALIDP_DE_BLOCK, 0xffffffff);
> +	malidp_hw_clear_irq(hwdev, MALIDP_DE_BLOCK, 0xffffffff);
> +	malidp_hw_disable_irq(hwdev, MALIDP_DC_BLOCK, 0xffffffff);
> +	malidp_hw_clear_irq(hwdev, MALIDP_DC_BLOCK, 0xffffffff);
> +
> +	ret =3D devm_request_threaded_irq(drm->dev, irq, malidp_de_irq,
> +					malidp_de_irq_thread_handler,
> +					IRQF_SHARED, "malidp-de", drm);
> +	if (ret < 0) {
> +		DRM_ERROR("failed to install DE IRQ handler\n");
> +		return ret;
> +	}
> +
> +	/* first enable the DC block IRQs */
> +	malidp_hw_enable_irq(hwdev, MALIDP_DC_BLOCK,
> +			     hwdev->map.dc_irq_map.irq_mask);
> +
> +	/* now enable the DE block IRQs */
> +	malidp_hw_enable_irq(hwdev, MALIDP_DE_BLOCK,
> +			     hwdev->map.de_irq_map.irq_mask);
> +
> +	return 0;
> +}
> +
> +void malidp_de_irq_fini(struct drm_device *drm)
> +{
> +	struct malidp_drm *malidp =3D drm->dev_private;
> +	struct malidp_hw_device *hwdev =3D malidp->dev;
> +
> +	malidp_hw_disable_irq(hwdev, MALIDP_DE_BLOCK,
> +			      hwdev->map.de_irq_map.irq_mask);
> +	malidp_hw_disable_irq(hwdev, MALIDP_DC_BLOCK,
> +			      hwdev->map.dc_irq_map.irq_mask);
> +}
> +
> +static irqreturn_t malidp_se_irq(int irq, void *arg)
> +{
> +	struct drm_device *drm =3D arg;
> +	struct malidp_drm *malidp =3D drm->dev_private;
> +	struct malidp_hw_device *hwdev =3D malidp->dev;
> +	u32 status, mask;
> +
> +	status =3D malidp_hw_read(hwdev, hwdev->map.se_base + MALIDP_REG_ST=
ATUS);
> +	if (!(status & hwdev->map.se_irq_map.irq_mask))
> +		return IRQ_NONE;
> +
> +	mask =3D malidp_hw_read(hwdev, hwdev->map.se_base + MALIDP_REG_MASK=
IRQ);
> +	status =3D malidp_hw_read(hwdev, hwdev->map.se_base + MALIDP_REG_ST=
ATUS);
> +	status &=3D mask;
> +	/* ToDo: status decoding and firing up of VSYNC and page flip event=
s */
> +
> +	malidp_hw_clear_irq(hwdev, MALIDP_SE_BLOCK, status);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t malidp_se_irq_thread_handler(int irq, void *arg)
> +{
> +	return IRQ_HANDLED;
> +}
> +
> +int malidp_se_irq_init(struct drm_device *drm, int irq)
> +{
> +	struct malidp_drm *malidp =3D drm->dev_private;
> +	struct malidp_hw_device *hwdev =3D malidp->dev;
> +	int ret;
> +
> +	/* ensure interrupts are disabled */
> +	malidp_hw_disable_irq(hwdev, MALIDP_SE_BLOCK, 0xffffffff);
> +	malidp_hw_clear_irq(hwdev, MALIDP_SE_BLOCK, 0xffffffff);
> +
> +	ret =3D devm_request_threaded_irq(drm->dev, irq, malidp_se_irq,
> +					malidp_se_irq_thread_handler,
> +					IRQF_SHARED, "malidp-se", drm);
> +	if (ret < 0) {
> +		DRM_ERROR("failed to install SE IRQ handler\n");
> +		return ret;
> +	}
> +
> +	malidp_hw_enable_irq(hwdev, MALIDP_SE_BLOCK,
> +			     hwdev->map.se_irq_map.irq_mask);
> +
> +	return 0;
> +}
> +
> +void malidp_se_irq_fini(struct drm_device *drm)
> +{
> +	struct malidp_drm *malidp =3D drm->dev_private;
> +	struct malidp_hw_device *hwdev =3D malidp->dev;
> +
> +	malidp_hw_disable_irq(hwdev, MALIDP_SE_BLOCK,
> +			      hwdev->map.se_irq_map.irq_mask);
> +}
> diff --git a/drivers/gpu/drm/arm/malidp_hw.h b/drivers/gpu/drm/arm/ma=
lidp_hw.h
> new file mode 100644
> index 0000000..141743e
> --- /dev/null
> +++ b/drivers/gpu/drm/arm/malidp_hw.h
> @@ -0,0 +1,241 @@
> +/*
> + *
> + * (C) COPYRIGHT 2013-2016 ARM Limited. All rights reserved.
> + *
> + * This program is free software and is provided to you under the te=
rms of the
> + * GNU General Public License version 2 as published by the Free Sof=
tware
> + * Foundation, and any use by you of this program is subject to the =
terms
> + * of such GNU licence.
> + *
> + * ARM Mali DP hardware manipulation routines.
> + */
> +
> +#ifndef __MALIDP_HW_H__
> +#define __MALIDP_HW_H__
> +
> +#include <linux/bitops.h>
> +#include "malidp_regs.h"
> +
> +struct videomode;
> +struct clk;
> +
> +/* Mali DP IP blocks */
> +enum {
> +	MALIDP_DE_BLOCK =3D 0,
> +	MALIDP_SE_BLOCK,
> +	MALIDP_DC_BLOCK
> +};
> +
> +/* Mali DP layer IDs */
> +enum {
> +	DE_VIDEO1 =3D BIT(0),
> +	DE_GRAPHICS1 =3D BIT(1),
> +	DE_GRAPHICS2 =3D BIT(2), /* used only in DP500 */
> +	DE_VIDEO2 =3D BIT(3),
> +	DE_SMART =3D BIT(4),
> +};
> +
> +struct malidp_input_format {
> +	u32 format;		/* DRM fourcc */
> +	u8 layer;		/* bitmask of layers supporting it */
> +	u8 id;			/* used internally */
> +};
> +
> +#define MALIDP_INVALID_FORMAT_ID	0xff
> +
> +/*
> + * hide the differences between register maps
> + * by using a common structure to hold the
> + * base register offsets
> + */
> +
> +struct malidp_irq_map {
> +	u32 irq_mask;		/* mask of IRQs that can be enabled in the block */
> +	u32 vsync_irq;		/* IRQ bit used for signaling during VSYNC */
> +};
> +
> +struct malidp_layer {
> +	u16 id;			/* layer ID */
> +	u16 base;		/* address offset for the register bank */
> +	u16 ptr;		/* address offset for the pointer register */
> +};
> +
> +/* regmap features */
> +#define MALIDP_REGMAP_HAS_CLEARIRQ	(1 << 0)
> +
> +struct malidp_hw_regmap {
> +	/* address offset of the DE register bank */
> +	/* is always 0x0000 */
> +	/* address offset of the SE registers bank */
> +	const u16 se_base;
> +	/* address offset of the DC registers bank */
> +	const u16 dc_base;
> +
> +	/* address offset for the output depth register */
> +	const u16 out_depth_base;
> +
> +	/* bitmap with register map features */
> +	const u8 features;
> +
> +	/* list of supported layers */
> +	const u8 n_layers;
> +	const struct malidp_layer *layers;
> +
> +	const struct malidp_irq_map de_irq_map;
> +	const struct malidp_irq_map se_irq_map;
> +	const struct malidp_irq_map dc_irq_map;
> +
> +	/* list of supported input formats for each layer */
> +	const struct malidp_input_format *input_formats;
> +	const u8 n_input_formats;
> +};
> +
> +struct malidp_hw_device {
> +	const struct malidp_hw_regmap map;
> +	void __iomem *regs;
> +
> +	/* APB clock */
> +	struct clk *pclk;
> +	/* AXI clock */
> +	struct clk *aclk;
> +	/* main clock for display core */
> +	struct clk *mclk;
> +	/* pixel clock for display core */
> +	struct clk *pxlclk;
> +
> +	/*
> +	 * Validate the driver instance against the hardware bits
> +	 */
> +	int (*query_hw)(struct malidp_hw_device *hwdev);
> +
> +	/*
> +	 * Set the hardware into config mode, ready to accept mode changes
> +	 */
> +	void (*enter_config_mode)(struct malidp_hw_device *hwdev);
> +
> +	/*
> +	 * Tell hardware to exit configuration mode
> +	 */
> +	void (*leave_config_mode)(struct malidp_hw_device *hwdev);
> +
> +	/*
> +	 * Query if hardware is in configuration mode
> +	 */
> +	bool (*in_config_mode)(struct malidp_hw_device *hwdev);
> +
> +	/*
> +	 * Set configuration valid flag for hardware parameters that can
> +	 * be changed outside the configuration mode. Hardware will use
> +	 * the new settings when config valid is set after the end of the
> +	 * current buffer scanout
> +	 */
> +	void (*set_config_valid)(struct malidp_hw_device *hwdev);
> +
> +	/*
> +	 * Set a new mode in hardware. Requires the hardware to be in
> +	 * configuration mode before this function is called.
> +	 */
> +	void (*modeset)(struct malidp_hw_device *hwdev, struct videomode *m=
);
> +
> +	/*
> +	 * Calculate the required rotation memory given the active area
> +	 * and the buffer format.
> +	 */
> +	int (*rotmem_required)(struct malidp_hw_device *hwdev, u16 w, u16 h=
, u32 fmt);
> +
> +	u8 features;
> +
> +	u8 min_line_size;
> +	u16 max_line_size;
> +
> +	/* size of memory used for rotating layers, up to two banks availab=
le */
> +	u32 rotation_memory[2];
> +};
> +
> +/* Supported variants of the hardware */
> +enum {
> +	MALIDP_500 =3D 0,
> +	MALIDP_550,
> +	MALIDP_650,
> +	/* keep the next entry last */
> +	MALIDP_MAX_DEVICES
> +};
> +
> +extern const struct malidp_hw_device malidp_device[MALIDP_MAX_DEVICE=
S];
> +
> +static inline u32 malidp_hw_read(struct malidp_hw_device *hwdev, u32=
 reg)
> +{
> +	return readl(hwdev->regs + reg);
> +}
> +
> +static inline void malidp_hw_write(struct malidp_hw_device *hwdev,
> +				   u32 value, u32 reg)
> +{
> +	writel(value, hwdev->regs + reg);
> +}
> +
> +static inline void malidp_hw_setbits(struct malidp_hw_device *hwdev,
> +				     u32 mask, u32 reg)
> +{
> +	u32 data =3D malidp_hw_read(hwdev, reg);
> +
> +	data |=3D mask;
> +	malidp_hw_write(hwdev, data, reg);
> +}
> +
> +static inline void malidp_hw_clearbits(struct malidp_hw_device *hwde=
v,
> +				       u32 mask, u32 reg)
> +{
> +	u32 data =3D malidp_hw_read(hwdev, reg);
> +
> +	data &=3D ~mask;
> +	malidp_hw_write(hwdev, data, reg);
> +}
> +
> +static inline u32 malidp_get_block_base(struct malidp_hw_device *hwd=
ev,
> +					u8 block)
> +{
> +	switch (block) {
> +	case MALIDP_SE_BLOCK:
> +		return hwdev->map.se_base;
> +	case MALIDP_DC_BLOCK:
> +		return hwdev->map.dc_base;
> +	}
> +
> +	return 0;
> +}
> +
> +static inline void malidp_hw_disable_irq(struct malidp_hw_device *hw=
dev,
> +					 u8 block, u32 irq)
> +{
> +	u32 base =3D malidp_get_block_base(hwdev, block);
> +
> +	malidp_hw_clearbits(hwdev, irq, base + MALIDP_REG_MASKIRQ);
> +}
> +
> +static inline void malidp_hw_enable_irq(struct malidp_hw_device *hwd=
ev,
> +					u8 block, u32 irq)
> +{
> +	u32 base =3D malidp_get_block_base(hwdev, block);
> +
> +	malidp_hw_setbits(hwdev, irq, base + MALIDP_REG_MASKIRQ);
> +}
> +
> +int malidp_de_irq_init(struct drm_device *drm, int irq);
> +void malidp_de_irq_fini(struct drm_device *drm);
> +int malidp_se_irq_init(struct drm_device *drm, int irq);
> +void malidp_se_irq_fini(struct drm_device *drm);
> +
> +u8 malidp_hw_get_format_id(const struct malidp_hw_regmap *map,
> +			   u8 layer_id, u32 format);
> +
> +/*
> + * background color components are defined as 12bits values,
> + * they will be shifted right when stored on hardware that
> + * supports only 8bits per channel
> + */
> +#define MALIDP_BGND_COLOR_R		0x000
> +#define MALIDP_BGND_COLOR_G		0x000
> +#define MALIDP_BGND_COLOR_B		0x000
> +
> +#endif  /* __MALIDP_HW_H__ */
> diff --git a/drivers/gpu/drm/arm/malidp_planes.c b/drivers/gpu/drm/ar=
m/malidp_planes.c
> new file mode 100644
> index 0000000..725098d
> --- /dev/null
> +++ b/drivers/gpu/drm/arm/malidp_planes.c
> @@ -0,0 +1,298 @@
> +/*
> + * (C) COPYRIGHT 2016 ARM Limited. All rights reserved.
> + * Author: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
> + *
> + * This program is free software and is provided to you under the te=
rms of the
> + * GNU General Public License version 2 as published by the Free Sof=
tware
> + * Foundation, and any use by you of this program is subject to the =
terms
> + * of such GNU licence.
> + *
> + * ARM Mali DP plane manipulation routines.
> + */
> +
> +#include <drm/drmP.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_fb_cma_helper.h>
> +#include <drm/drm_gem_cma_helper.h>
> +#include <drm/drm_plane_helper.h>
> +
> +#include "malidp_hw.h"
> +#include "malidp_drv.h"
> +
> +/* Layer specific register offsets */
> +#define MALIDP_LAYER_FORMAT		0x000
> +#define MALIDP_LAYER_CONTROL		0x004
> +#define   LAYER_ENABLE			(1 << 0)
> +#define   LAYER_ROT_OFFSET		8
> +#define   LAYER_H_FLIP			(1 << 10)
> +#define   LAYER_V_FLIP			(1 << 11)
> +#define   LAYER_ROT_MASK		(0xf << 8)
> +#define MALIDP_LAYER_SIZE		0x00c
> +#define   LAYER_H_VAL(x)		(((x) & 0x1fff) << 0)
> +#define   LAYER_V_VAL(x)		(((x) & 0x1fff) << 16)
> +#define MALIDP_LAYER_COMP_SIZE		0x010
> +#define MALIDP_LAYER_OFFSET		0x014
> +#define MALIDP_LAYER_STRIDE		0x018
> +
> +static void malidp_de_plane_destroy(struct drm_plane *plane)
> +{
> +	struct malidp_plane *mp =3D to_malidp_plane(plane);
> +
> +	if (mp->base.fb)
> +		drm_framebuffer_unreference(mp->base.fb);
> +
> +	drm_plane_helper_disable(plane);
> +	drm_plane_cleanup(plane);
> +	devm_kfree(plane->dev->dev, mp);
> +}
> +
> +struct drm_plane_state *malidp_duplicate_plane_state(struct drm_plan=
e *plane)
> +{
> +	struct malidp_plane_state *state, *m_state;
> +
> +	if (!plane->state)
> +		return NULL;
> +
> +	state =3D kmalloc(sizeof(*state), GFP_KERNEL);
> +	if (state) {
> +		m_state =3D to_malidp_plane_state(plane->state);
> +		__drm_atomic_helper_plane_duplicate_state(plane, &state->base);
> +		state->rotmem_size =3D m_state->rotmem_size;
> +	}
> +
> +	return &state->base;
> +}
> +
> +void malidp_destroy_plane_state(struct drm_plane *plane,
> +				struct drm_plane_state *state)
> +{
> +	struct malidp_plane_state *m_state =3D to_malidp_plane_state(state)=
;
> +
> +	__drm_atomic_helper_plane_destroy_state(state);
> +	kfree(m_state);
> +}
> +
> +static const struct drm_plane_funcs malidp_de_plane_funcs =3D {
> +	.update_plane =3D drm_atomic_helper_update_plane,
> +	.disable_plane =3D drm_atomic_helper_disable_plane,
> +	.destroy =3D malidp_de_plane_destroy,
> +	.reset =3D drm_atomic_helper_plane_reset,
> +	.atomic_duplicate_state =3D malidp_duplicate_plane_state,
> +	.atomic_destroy_state =3D malidp_destroy_plane_state,
> +};
> +
> +static int malidp_de_plane_check(struct drm_plane *plane,
> +				 struct drm_plane_state *state)
> +{
> +	struct malidp_plane *mp =3D to_malidp_plane(plane);
> +	struct malidp_plane_state *ms =3D to_malidp_plane_state(state);
> +	u8 format_id;
> +	u32 src_w, src_h;
> +
> +	if (!state->crtc || !state->fb)
> +		return 0;
> +
> +	format_id =3D malidp_hw_get_format_id(&mp->hwdev->map, mp->layer->i=
d,
> +					    state->fb->pixel_format);
> +	if (format_id =3D=3D MALIDP_INVALID_FORMAT_ID)
> +		return -EINVAL;
> +
> +	src_w =3D state->src_w >> 16;
> +	src_h =3D state->src_h >> 16;
> +
> +	if ((state->crtc_w > mp->hwdev->max_line_size) ||
> +	    (state->crtc_h > mp->hwdev->max_line_size) ||
> +	    (state->crtc_w < mp->hwdev->min_line_size) ||
> +	    (state->crtc_h < mp->hwdev->min_line_size) ||
> +	    (state->crtc_w !=3D src_w) || (state->crtc_h !=3D src_h))
> +		return -EINVAL;
> +
> +	/* packed RGB888 / BGR888 can't be rotated or flipped */
> +	if (state->rotation !=3D BIT(DRM_ROTATE_0) &&
> +	    (state->fb->pixel_format =3D=3D DRM_FORMAT_RGB888 ||
> +	     state->fb->pixel_format =3D=3D DRM_FORMAT_BGR888))
> +		return -EINVAL;
> +
> +	ms->rotmem_size =3D 0;
> +	if (state->rotation & MALIDP_ROTATED_MASK) {
> +		int val;
> +
> +		val =3D mp->hwdev->rotmem_required(mp->hwdev, state->crtc_h,
> +						 state->crtc_w,
> +						 state->fb->pixel_format);
> +		if (val < 0)
> +			return val;
> +
> +		ms->rotmem_size =3D val;
> +	}
> +
> +	return 0;
> +}
> +
> +static void malidp_de_plane_update(struct drm_plane *plane,
> +				   struct drm_plane_state *old_state)
> +{
> +	struct drm_gem_cma_object *obj;
> +	struct malidp_plane *mp;
> +	const struct malidp_hw_regmap *map;
> +	u8 format_id;
> +	u16 ptr;
> +	u32 format, src_w, src_h, dest_w, dest_h, val =3D 0;
> +	int num_planes, i;
> +
> +	mp =3D to_malidp_plane(plane);
> +
> +	map =3D &mp->hwdev->map;
> +	format =3D plane->state->fb->pixel_format;
> +	format_id =3D malidp_hw_get_format_id(map, mp->layer->id, format);
> +	num_planes =3D drm_format_num_planes(format);
> +
> +	/* convert src values from Q16 fixed point to integer */
> +	src_w =3D plane->state->src_w >> 16;
> +	src_h =3D plane->state->src_h >> 16;
> +	if (plane->state->rotation & MALIDP_ROTATED_MASK) {
> +		dest_w =3D plane->state->crtc_h;
> +		dest_h =3D plane->state->crtc_w;
> +	} else {
> +		dest_w =3D plane->state->crtc_w;
> +		dest_h =3D plane->state->crtc_h;
> +	}
> +
> +	malidp_hw_write(mp->hwdev, format_id, mp->layer->base);
> +
> +	for (i =3D 0; i < num_planes; i++) {
> +		/* calculate the offset for the layer's plane registers */
> +		ptr =3D mp->layer->ptr + (i << 4);
> +
> +		obj =3D drm_fb_cma_get_gem_obj(plane->state->fb, i);
> +		malidp_hw_write(mp->hwdev, lower_32_bits(obj->paddr), ptr);
> +		malidp_hw_write(mp->hwdev, upper_32_bits(obj->paddr), ptr + 4);
> +		malidp_hw_write(mp->hwdev, plane->state->fb->pitches[i],
> +				mp->layer->base + MALIDP_LAYER_STRIDE);
> +	}
> +
> +	malidp_hw_write(mp->hwdev, LAYER_H_VAL(src_w) | LAYER_V_VAL(src_h),
> +			mp->layer->base + MALIDP_LAYER_SIZE);
> +
> +	malidp_hw_write(mp->hwdev, LAYER_H_VAL(dest_w) | LAYER_V_VAL(dest_h=
),
> +			mp->layer->base + MALIDP_LAYER_COMP_SIZE);
> +
> +	malidp_hw_write(mp->hwdev, LAYER_H_VAL(plane->state->crtc_x) |
> +			LAYER_V_VAL(plane->state->crtc_y),
> +			mp->layer->base + MALIDP_LAYER_OFFSET);
> +
> +	/* first clear the rotation bits in the register */
> +	malidp_hw_clearbits(mp->hwdev, LAYER_ROT_MASK,
> +			    mp->layer->base + MALIDP_LAYER_CONTROL);
> +
> +	/* setup the rotation and axis flip bits */
> +	if (plane->state->rotation & DRM_ROTATE_MASK)
> +		val =3D ilog2(plane->state->rotation & DRM_ROTATE_MASK) << LAYER_R=
OT_OFFSET;
> +	if (plane->state->rotation & BIT(DRM_REFLECT_X))
> +		val |=3D LAYER_V_FLIP;
> +	if (plane->state->rotation & BIT(DRM_REFLECT_Y))
> +		val |=3D LAYER_H_FLIP;
> +
> +	/* set the 'enable layer' bit */
> +	val |=3D LAYER_ENABLE;
> +
> +	malidp_hw_setbits(mp->hwdev, val,
> +			  mp->layer->base + MALIDP_LAYER_CONTROL);
> +}
> +
> +static void malidp_de_plane_disable(struct drm_plane *plane,
> +				    struct drm_plane_state *state)
> +{
> +	struct malidp_plane *mp =3D to_malidp_plane(plane);
> +
> +	malidp_hw_clearbits(mp->hwdev, LAYER_ENABLE,
> +			    mp->layer->base + MALIDP_LAYER_CONTROL);
> +}
> +
> +static const struct drm_plane_helper_funcs malidp_de_plane_helper_fu=
ncs =3D {
> +	.atomic_check =3D malidp_de_plane_check,
> +	.atomic_update =3D malidp_de_plane_update,
> +	.atomic_disable =3D malidp_de_plane_disable,
> +};
> +
> +int malidp_de_planes_init(struct drm_device *drm)
> +{
> +	struct malidp_drm *malidp =3D drm->dev_private;
> +	const struct malidp_hw_regmap *map =3D &malidp->dev->map;
> +	struct malidp_plane *plane =3D NULL;
> +	enum drm_plane_type plane_type;
> +	unsigned long crtcs =3D 1 << drm->mode_config.num_crtc;
> +	u32 *formats;
> +	int ret, i, j, n;
> +
> +	formats =3D kcalloc(map->n_input_formats, sizeof(*formats), GFP_KER=
NEL);
> +	if (!formats) {
> +		ret =3D -ENOMEM;
> +		goto cleanup;
> +	}
> +
> +	for (i =3D 0; i < map->n_layers; i++) {
> +		u8 id =3D map->layers[i].id;
> +
> +		plane =3D kzalloc(sizeof(*plane), GFP_KERNEL);
> +		if (!plane) {
> +			ret =3D -ENOMEM;
> +			goto cleanup;
> +		}
> +
> +		/* build the list of DRM supported formats based on the map */
> +		for (n =3D 0, j =3D 0;  j < map->n_input_formats; j++) {
> +			if ((map->input_formats[j].layer & id) =3D=3D id)
> +				formats[n++] =3D map->input_formats[j].format;
> +		}
> +
> +		plane_type =3D (i =3D=3D 0) ? DRM_PLANE_TYPE_PRIMARY :
> +					DRM_PLANE_TYPE_OVERLAY;
> +		ret =3D drm_universal_plane_init(drm, &plane->base, crtcs,
> +					       &malidp_de_plane_funcs, formats,
> +					       n, plane_type, NULL);
> +		if (ret < 0)
> +			goto cleanup;
> +
> +		if (!drm->mode_config.rotation_property) {
> +			unsigned long flags =3D BIT(DRM_ROTATE_0) |
> +					      BIT(DRM_ROTATE_90) |
> +					      BIT(DRM_ROTATE_180) |
> +					      BIT(DRM_ROTATE_270) |
> +					      BIT(DRM_REFLECT_X) |
> +					      BIT(DRM_REFLECT_Y);
> +			drm->mode_config.rotation_property =3D
> +				drm_mode_create_rotation_property(drm, flags);
> +		}
> +		/* SMART layer can't be rotated */
> +		if (drm->mode_config.rotation_property && (id !=3D DE_SMART))
> +			drm_object_attach_property(&plane->base.base,
> +						   drm->mode_config.rotation_property,
> +						   BIT(DRM_ROTATE_0));
> +
> +		drm_plane_helper_add(&plane->base,
> +				     &malidp_de_plane_helper_funcs);
> +		plane->hwdev =3D malidp->dev;
> +		plane->layer =3D &map->layers[i];
> +	}
> +
> +	kfree(formats);
> +
> +	return 0;
> +
> +cleanup:
> +	malidp_de_planes_destroy(drm);
> +	kfree(formats);
> +
> +	return ret;
> +}
> +
> +void malidp_de_planes_destroy(struct drm_device *drm)
> +{
> +	struct drm_plane *p, *pt;
> +
> +	list_for_each_entry_safe(p, pt, &drm->mode_config.plane_list, head)=
 {
> +		drm_plane_cleanup(p);
> +		kfree(p);
> +	}
> +}
> diff --git a/drivers/gpu/drm/arm/malidp_regs.h b/drivers/gpu/drm/arm/=
malidp_regs.h
> new file mode 100644
> index 0000000..73fecb3
> --- /dev/null
> +++ b/drivers/gpu/drm/arm/malidp_regs.h
> @@ -0,0 +1,172 @@
> +/*
> + * (C) COPYRIGHT 2016 ARM Limited. All rights reserved.
> + * Author: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
> + *
> + * This program is free software and is provided to you under the te=
rms of the
> + * GNU General Public License version 2 as published by the Free Sof=
tware
> + * Foundation, and any use by you of this program is subject to the =
terms
> + * of such GNU licence.
> + *
> + * ARM Mali DP500/DP550/DP650 registers definition.
> + */
> +
> +#ifndef __MALIDP_REGS_H__
> +#define __MALIDP_REGS_H__
> +
> +/*
> + * abbreviations used:
> + *    - DC - display core (general settings)
> + *    - DE - display engine
> + *    - SE - scaling engine
> + */
> +
> +/* interrupt bit masks */
> +#define MALIDP_DE_IRQ_UNDERRUN			(1 << 0)
> +
> +#define MALIDP500_DE_IRQ_AXI_ERR		(1 << 4)
> +#define MALIDP500_DE_IRQ_VSYNC			(1 << 5)
> +#define MALIDP500_DE_IRQ_PROG_LINE		(1 << 6)
> +#define MALIDP500_DE_IRQ_SATURATION		(1 << 7)
> +#define MALIDP500_DE_IRQ_CONF_VALID		(1 << 8)
> +#define MALIDP500_DE_IRQ_CONF_MODE		(1 << 11)
> +#define MALIDP500_DE_IRQ_CONF_ACTIVE		(1 << 17)
> +#define MALIDP500_DE_IRQ_PM_ACTIVE		(1 << 18)
> +#define MALIDP500_DE_IRQ_TESTMODE_ACTIVE	(1 << 19)
> +#define MALIDP500_DE_IRQ_FORCE_BLNK_ACTIVE	(1 << 24)
> +#define MALIDP500_DE_IRQ_AXI_BUSY		(1 << 28)
> +#define MALIDP500_DE_IRQ_GLOBAL			(1 << 31)
> +#define MALIDP500_SE_IRQ_CONF_MODE		(1 << 0)
> +#define MALIDP500_SE_IRQ_CONF_VALID		(1 << 4)
> +#define MALIDP500_SE_IRQ_INIT_BUSY		(1 << 5)
> +#define MALIDP500_SE_IRQ_AXI_ERROR		(1 << 8)
> +#define MALIDP500_SE_IRQ_OVERRUN		(1 << 9)
> +#define MALIDP500_SE_IRQ_PROG_LINE1		(1 << 12)
> +#define MALIDP500_SE_IRQ_PROG_LINE2		(1 << 13)
> +#define MALIDP500_SE_IRQ_CONF_ACTIVE		(1 << 17)
> +#define MALIDP500_SE_IRQ_PM_ACTIVE		(1 << 18)
> +#define MALIDP500_SE_IRQ_AXI_BUSY		(1 << 28)
> +#define MALIDP500_SE_IRQ_GLOBAL			(1 << 31)
> +
> +#define MALIDP550_DE_IRQ_SATURATION		(1 << 8)
> +#define MALIDP550_DE_IRQ_VSYNC			(1 << 12)
> +#define MALIDP550_DE_IRQ_PROG_LINE		(1 << 13)
> +#define MALIDP550_DE_IRQ_AXI_ERR		(1 << 16)
> +#define MALIDP550_SE_IRQ_EOW			(1 << 0)
> +#define MALIDP550_SE_IRQ_AXI_ERR		(1 << 16)
> +#define MALIDP550_DC_IRQ_CONF_VALID		(1 << 0)
> +#define MALIDP550_DC_IRQ_CONF_MODE		(1 << 4)
> +#define MALIDP550_DC_IRQ_CONF_ACTIVE		(1 << 16)
> +#define MALIDP550_DC_IRQ_DE			(1 << 20)
> +#define MALIDP550_DC_IRQ_SE			(1 << 24)
> +
> +#define MALIDP650_DE_IRQ_DRIFT			(1 << 4)
> +
> +/* bit masks that are common between products */
> +#define   MALIDP_CFG_VALID		(1 << 0)
> +#define   MALIDP_DISP_FUNC_ILACED	(1 << 8)
> +
> +/* register offsets for IRQ management */
> +#define MALIDP_REG_STATUS		0x00000
> +#define MALIDP_REG_SETIRQ		0x00004
> +#define MALIDP_REG_MASKIRQ		0x00008
> +#define MALIDP_REG_CLEARIRQ		0x0000c
> +
> +/* register offsets */
> +#define MALIDP_DE_CORE_ID		0x00018
> +#define MALIDP_DE_DISPLAY_FUNC		0x00020
> +
> +/* these offsets are relative to MALIDP5x0_TIMINGS_BASE */
> +#define MALIDP_DE_H_TIMINGS		0x0
> +#define MALIDP_DE_V_TIMINGS		0x4
> +#define MALIDP_DE_SYNC_WIDTH		0x8
> +#define MALIDP_DE_HV_ACTIVE		0xc
> +
> +/* macros to set values into registers */
> +#define MALIDP_DE_H_FRONTPORCH(x)	(((x) & 0xfff) << 0)
> +#define MALIDP_DE_H_BACKPORCH(x)	(((x) & 0x3ff) << 16)
> +#define MALIDP500_DE_V_FRONTPORCH(x)	(((x) & 0xff) << 0)
> +#define MALIDP550_DE_V_FRONTPORCH(x)	(((x) & 0xfff) << 0)
> +#define MALIDP_DE_V_BACKPORCH(x)	(((x) & 0xff) << 16)
> +#define MALIDP_DE_H_SYNCWIDTH(x)	(((x) & 0x3ff) << 0)
> +#define MALIDP_DE_V_SYNCWIDTH(x)	(((x) & 0xff) << 16)
> +#define MALIDP_DE_H_ACTIVE(x)		(((x) & 0x1fff) << 0)
> +#define MALIDP_DE_V_ACTIVE(x)		(((x) & 0x1fff) << 16)
> +
> +/* register offsets and bits specific to DP500 */
> +#define MALIDP500_DC_BASE		0x00000
> +#define MALIDP500_DC_CONTROL		0x0000c
> +#define   MALIDP500_DC_CONFIG_REQ	(1 << 17)
> +#define   MALIDP500_HSYNCPOL		(1 << 20)
> +#define   MALIDP500_VSYNCPOL		(1 << 21)
> +#define   MALIDP500_DC_CLEAR_MASK	0x300fff
> +#define MALIDP500_DE_LINE_COUNTER	0x00010
> +#define MALIDP500_DE_AXI_CONTROL	0x00014
> +#define MALIDP500_DE_SECURE_CTRL	0x0001c
> +#define MALIDP500_DE_CHROMA_KEY		0x00024
> +#define MALIDP500_TIMINGS_BASE		0x00028
> +
> +#define MALIDP500_CONFIG_3D		0x00038
> +#define MALIDP500_BGND_COLOR		0x0003c
> +#define MALIDP500_OUTPUT_DEPTH		0x00044
> +#define MALIDP500_YUV_RGB_COEF		0x00048
> +#define MALIDP500_COLOR_ADJ_COEF	0x00078
> +#define MALIDP500_COEF_TABLE_ADDR	0x000a8
> +#define MALIDP500_COEF_TABLE_DATA	0x000ac
> +#define MALIDP500_DE_LV_BASE		0x00100
> +#define MALIDP500_DE_LV_PTR_BASE	0x00124
> +#define MALIDP500_DE_LG1_BASE		0x00200
> +#define MALIDP500_DE_LG1_PTR_BASE	0x0021c
> +#define MALIDP500_DE_LG2_BASE		0x00300
> +#define MALIDP500_DE_LG2_PTR_BASE	0x0031c
> +#define MALIDP500_SE_BASE		0x00c00
> +#define MALIDP500_SE_PTR_BASE		0x00e0c
> +#define MALIDP500_DC_IRQ_BASE		0x00f00
> +#define MALIDP500_CONFIG_VALID		0x00f00
> +#define MALIDP500_CONFIG_ID		0x00fd4
> +
> +/* register offsets and bits specific to DP550/DP650 */
> +#define MALIDP550_DE_CONTROL		0x00010
> +#define MALIDP550_DE_LINE_COUNTER	0x00014
> +#define MALIDP550_DE_AXI_CONTROL	0x00018
> +#define MALIDP550_DE_QOS		0x0001c
> +#define MALIDP550_TIMINGS_BASE		0x00030
> +#define MALIDP550_HSYNCPOL		(1 << 12)
> +#define MALIDP550_VSYNCPOL		(1 << 28)
> +
> +#define MALIDP550_DE_DISP_SIDEBAND	0x00040
> +#define MALIDP550_DE_BGND_COLOR		0x00044
> +#define MALIDP550_DE_OUTPUT_DEPTH	0x0004c
> +#define MALIDP550_DE_COLOR_COEF		0x00050
> +#define MALIDP550_DE_COEF_TABLE_ADDR	0x00080
> +#define MALIDP550_DE_COEF_TABLE_DATA	0x00084
> +#define MALIDP550_DE_LV1_BASE		0x00100
> +#define MALIDP550_DE_LV1_PTR_BASE	0x00124
> +#define MALIDP550_DE_LV2_BASE		0x00200
> +#define MALIDP550_DE_LV2_PTR_BASE	0x00224
> +#define MALIDP550_DE_LG_BASE		0x00300
> +#define MALIDP550_DE_LG_PTR_BASE	0x0031c
> +#define MALIDP550_DE_LS_BASE		0x00400
> +#define MALIDP550_DE_LS_PTR_BASE	0x0042c
> +#define MALIDP550_DE_PERF_BASE		0x00500
> +#define MALIDP550_SE_BASE		0x08000
> +#define MALIDP550_DC_BASE		0x0c000
> +#define MALIDP550_DC_CONTROL		0x0c010
> +#define   MALIDP550_DC_CONFIG_REQ	(1 << 16)
> +#define MALIDP550_CONFIG_VALID		0x0c014
> +#define MALIDP550_CONFIG_ID		0x0ffd4
> +
> +/*
> + * Starting with DP550 the register map blocks has been standardised=
 to the
> + * following layout:
> + *
> + *   Offset            Block registers
> + *  0x00000            Display Engine
> + *  0x08000            Scaling Engine
> + *  0x0c000            Display Core
> + *  0x10000            Secure control
> + *
> + * The old DP500 IP mixes some DC with the DE registers, hence the n=
eed
> + * for a mapping structure.
> + */
> +
> +#endif /* __MALIDP_REGS_H__ */
> --=20
> 2.8.2
>=20

--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
