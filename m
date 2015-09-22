From: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Subject: Re: [RFC v2 2/4] drm/mediatek: Add DRM Driver for Mediatek SoC
 MT8173.
Date: Tue, 22 Sep 2015 11:38:42 +0200
Message-ID: <20150922093842.GE3383@phenom.ffwll.local>
References: <1442592722-29004-1-git-send-email-p.zabel@pengutronix.de>
 <1442592722-29004-3-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1442592722-29004-3-git-send-email-p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>, YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Jitao Shi <jitao.shi-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Cawa Cheng <cawa.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 18, 2015 at 06:12:00PM +0200, Philipp Zabel wrote:
> From: CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> 
> This patch adds an initial DRM driver for the Mediatek MT8173 DISP
> subsystem. It currently supports two fixed output streams from the
> OVL0/OVL1 sources to the DSI0/DPI0 sinks, respectively.
> 
> Signed-off-by: CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> Signed-off-by: YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

Bunch of comments related to atomic below. I didn't look at anything else
really.

> ---
>  drivers/gpu/drm/Kconfig                     |   2 +
>  drivers/gpu/drm/Makefile                    |   1 +
>  drivers/gpu/drm/mediatek/Kconfig            |  16 +
>  drivers/gpu/drm/mediatek/Makefile           |  10 +
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c     | 515 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.h     |  84 +++++
>  drivers/gpu/drm/mediatek/mtk_drm_ddp.c      | 231 +++++++++++++
>  drivers/gpu/drm/mediatek/mtk_drm_ddp.h      |  39 +++
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 378 ++++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  61 ++++
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c      | 471 +++++++++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h      |  46 +++
>  drivers/gpu/drm/mediatek/mtk_drm_fb.c       | 151 ++++++++
>  drivers/gpu/drm/mediatek/mtk_drm_fb.h       |  29 ++
>  drivers/gpu/drm/mediatek/mtk_drm_gem.c      | 207 +++++++++++
>  drivers/gpu/drm/mediatek/mtk_drm_gem.h      |  56 +++
>  drivers/gpu/drm/mediatek/mtk_drm_plane.c    | 193 +++++++++++
>  drivers/gpu/drm/mediatek/mtk_drm_plane.h    |  38 ++
>  18 files changed, 2528 insertions(+)
>  create mode 100644 drivers/gpu/drm/mediatek/Kconfig
>  create mode 100644 drivers/gpu/drm/mediatek/Makefile
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_drm_crtc.c
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_drm_crtc.h
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_drm_ddp.c
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_drm_ddp.h
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_drm_drv.c
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_drm_drv.h
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_drm_fb.c
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_drm_fb.h
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_drm_gem.c
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_drm_gem.h
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_drm_plane.c
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_drm_plane.h
> 
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 1a0a8df..9e9987b 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -264,3 +264,5 @@ source "drivers/gpu/drm/sti/Kconfig"
>  source "drivers/gpu/drm/amd/amdkfd/Kconfig"
>  
>  source "drivers/gpu/drm/imx/Kconfig"
> +
> +source "drivers/gpu/drm/mediatek/Kconfig"
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 45e7719..af6b592 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -67,6 +67,7 @@ obj-$(CONFIG_DRM_MSM) += msm/
>  obj-$(CONFIG_DRM_TEGRA) += tegra/
>  obj-$(CONFIG_DRM_STI) += sti/
>  obj-$(CONFIG_DRM_IMX) += imx/
> +obj-$(CONFIG_DRM_MEDIATEK) += mediatek/
>  obj-y			+= i2c/
>  obj-y			+= panel/
>  obj-y			+= bridge/
> diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediatek/Kconfig
> new file mode 100644
> index 0000000..5343cf1
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/Kconfig
> @@ -0,0 +1,16 @@
> +config DRM_MEDIATEK
> +	tristate "DRM Support for Mediatek SoCs"
> +	depends on DRM
> +	depends on ARCH_MEDIATEK || (ARM && COMPILE_TEST)
> +	select MTK_SMI
> +	select DRM_PANEL
> +	select DRM_MIPI_DSI
> +	select DRM_PANEL_SIMPLE
> +	select DRM_KMS_HELPER
> +	select IOMMU_DMA
> +	help
> +	  Choose this option if you have a Mediatek SoCs.
> +	  The module will be called mediatek-drm
> +	  This driver provides kernel mode setting and
> +	  buffer management to userspace.
> +
> diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
> new file mode 100644
> index 0000000..d801572
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/Makefile
> @@ -0,0 +1,10 @@
> +mediatek-drm-y := mtk_drm_drv.o \
> +                  mtk_drm_crtc.o \
> +                  mtk_drm_ddp.o \
> +                  mtk_drm_ddp_comp.o \
> +                  mtk_drm_fb.o \
> +                  mtk_drm_gem.o \
> +                  mtk_drm_plane.o
> +
> +obj-$(CONFIG_DRM_MEDIATEK) += mediatek-drm.o
> +
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> new file mode 100644
> index 0000000..c06b7d4
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -0,0 +1,515 @@
> +/*
> + * Copyright (c) 2015 MediaTek Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <drm/drmP.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_crtc_helper.h>
> +#include <drm/drm_plane_helper.h>
> +#include <linux/clk.h>
> +#include <linux/component.h>
> +#include <linux/dma-buf.h>
> +#include <linux/of_device.h>
> +#include <linux/of_irq.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/reservation.h>
> +
> +#include "mtk_drm_drv.h"
> +#include "mtk_drm_crtc.h"
> +#include "mtk_drm_ddp.h"
> +#include "mtk_drm_ddp_comp.h"
> +#include "mtk_drm_gem.h"
> +#include "mtk_drm_plane.h"
> +
> +void mtk_drm_crtc_finish_page_flip(struct mtk_drm_crtc *mtk_crtc)
> +{
> +	struct drm_device *dev = mtk_crtc->base.dev;
> +
> +	drm_send_vblank_event(dev, mtk_crtc->event->pipe, mtk_crtc->event);
> +	drm_crtc_vblank_put(&mtk_crtc->base);
> +	mtk_crtc->event = NULL;
> +}
> +
> +static void mtk_drm_crtc_destroy(struct drm_crtc *crtc)
> +{
> +	drm_crtc_cleanup(crtc);
> +}
> +
> +static bool mtk_drm_crtc_mode_fixup(struct drm_crtc *crtc,
> +		const struct drm_display_mode *mode,
> +		struct drm_display_mode *adjusted_mode)
> +{
> +	/* drm framework doesn't check NULL */
> +	return true;
> +}
> +
> +static void mtk_drm_crtc_mode_set_nofb(struct drm_crtc *crtc)
> +{
> +	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
> +	struct mtk_crtc_ddp_context *ctx = mtk_crtc->ctx;
> +
> +	if (WARN_ON(!crtc->state))
> +		return;
> +
> +	ctx->pending_width = crtc->mode.hdisplay;
> +	ctx->pending_height = crtc->mode.vdisplay;
> +	ctx->pending_config = true;
> +}
> +
> +int mtk_drm_crtc_enable_vblank(struct drm_device *drm, int pipe)
> +{
> +	struct mtk_drm_private *priv = drm->dev_private;
> +	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(priv->crtc[pipe]);
> +	struct mtk_crtc_ddp_context *ctx = mtk_crtc->ctx;
> +	struct mtk_ddp_comp *ovl = &ctx->ddp_comp[0];
> +
> +	if (ovl->funcs->comp_enable_vblank)
> +		ovl->funcs->comp_enable_vblank(ovl->regs);
> +
> +	return 0;
> +}
> +
> +void mtk_drm_crtc_disable_vblank(struct drm_device *drm, int pipe)
> +{
> +	struct mtk_drm_private *priv = drm->dev_private;
> +	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(priv->crtc[pipe]);
> +	struct mtk_crtc_ddp_context *ctx = mtk_crtc->ctx;
> +	struct mtk_ddp_comp *ovl = &ctx->ddp_comp[0];
> +
> +	if (ovl->funcs->comp_disable_vblank)
> +		ovl->funcs->comp_disable_vblank(ovl->regs);
> +}
> +
> +static void mtk_crtc_ddp_power_on(struct mtk_crtc_ddp_context *ctx)
> +{
> +	int ret;
> +	int i;
> +
> +	DRM_INFO("mtk_crtc_ddp_power_on\n");
> +	for (i = 0; i < ctx->ddp_comp_nr; i++) {
> +		ret = clk_enable(ctx->ddp_comp[i].clk);
> +		if (ret)
> +			DRM_ERROR("clk_enable(ctx->ddp_comp_clk[%d])\n", i);
> +	}
> +}
> +
> +static void mtk_crtc_ddp_power_off(struct mtk_crtc_ddp_context *ctx)
> +{
> +	int i;
> +
> +	DRM_INFO("mtk_crtc_ddp_power_off\n");
> +	for (i = 0; i < ctx->ddp_comp_nr; i++)
> +		clk_disable(ctx->ddp_comp[i].clk);
> +}
> +
> +static void mtk_crtc_ddp_hw_init(struct mtk_drm_crtc *crtc)
> +{
> +	struct mtk_crtc_ddp_context *ctx = crtc->ctx;
> +	unsigned int width, height;
> +	int i;
> +
> +	if (ctx->crtc->base.state) {
> +		width = crtc->base.state->adjusted_mode.hdisplay;
> +		height = crtc->base.state->adjusted_mode.vdisplay;
> +	} else {
> +		width = 1920;
> +		height = 1080;
> +	}
> +
> +	DRM_INFO("mtk_crtc_ddp_hw_init\n");
> +	mtk_ddp_clock_on(ctx->mutex_dev);
> +	mtk_crtc_ddp_power_on(ctx);
> +
> +	DRM_INFO("mediatek_ddp_ddp_path_setup\n");
> +	for (i = 0; i < (ctx->ddp_comp_nr - 1); i++) {
> +		mtk_ddp_add_comp_to_path(ctx->config_regs, ctx->pipe,
> +					 ctx->ddp_comp[i].funcs->comp_type,
> +					 ctx->ddp_comp[i+1].funcs->comp_type);
> +		mtk_ddp_add_comp_to_mutex(ctx->mutex_dev, ctx->pipe,
> +					  ctx->ddp_comp[i].funcs->comp_type,
> +					  ctx->ddp_comp[i+1].funcs->comp_type);
> +	}
> +
> +	DRM_INFO("ddp_disp_path_power_on %dx%d\n", width, height);
> +	for (i = 0; i < ctx->ddp_comp_nr; i++) {
> +		struct mtk_ddp_comp *comp = &ctx->ddp_comp[i];
> +
> +		if (comp->funcs->comp_config)
> +			comp->funcs->comp_config(comp->regs, width, height);
> +
> +		if (comp->funcs->comp_power_on)
> +			comp->funcs->comp_power_on(comp->regs);
> +	}
> +}
> +
> +static void mtk_crtc_ddp_hw_fini(struct mtk_drm_crtc *crtc)
> +{
> +	struct mtk_crtc_ddp_context *ctx = crtc->ctx;
> +
> +	DRM_INFO("mtk_crtc_ddp_hw_fini\n");
> +	mtk_crtc_ddp_power_off(ctx);
> +	mtk_ddp_clock_off(ctx->mutex_dev);
> +}
> +
> +static void mtk_drm_crtc_enable(struct drm_crtc *crtc)
> +{
> +	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
> +
> +	if (mtk_crtc->enabled)
> +		return;
> +
> +	mtk_crtc_ddp_hw_init(mtk_crtc);
> +
> +	drm_crtc_vblank_on(crtc);
> +	WARN_ON(drm_crtc_vblank_get(crtc) != 0);
> +
> +	mtk_crtc->enabled = true;
> +}
> +
> +static void mtk_drm_crtc_disable(struct drm_crtc *crtc)
> +{
> +	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
> +
> +	DRM_INFO("mtk_drm_crtc_disable %d\n", crtc->base.id);
> +	if (!mtk_crtc->enabled)
> +		return;
> +
> +	drm_crtc_vblank_put(crtc);
> +	drm_crtc_vblank_off(crtc);
> +
> +	mtk_crtc_ddp_hw_fini(mtk_crtc);
> +
> +	mtk_crtc->enabled = false;
> +}
> +
> +static void mtk_drm_crtc_atomic_begin(struct drm_crtc *crtc,
> +				      struct drm_crtc_state *old_crtc_state)
> +{
> +	struct drm_crtc_state *state = crtc->state;
> +	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
> +
> +	if (state->event) {
> +		state->event->pipe = drm_crtc_index(crtc);
> +		WARN_ON(drm_crtc_vblank_get(crtc) != 0);
> +		mtk_crtc->event = state->event;
> +		state->event = NULL;
> +	}
> +}
> +
> +void mtk_drm_crtc_commit(struct mtk_drm_crtc *crtc)
> +{
> +	struct mtk_crtc_ddp_context *ctx = crtc->ctx;
> +	unsigned int i;
> +
> +	for (i = 0; i < OVL_LAYER_NR; i++)
> +		if (ctx->pending_ovl_dirty[i]) {
> +			ctx->pending_ovl_config[i] = true;
> +			ctx->pending_ovl_dirty[i] = false;
> +		}
> +}
> +
> +static void mtk_drm_crtc_atomic_flush(struct drm_crtc *crtc,
> +				      struct drm_crtc_state *old_crtc_state)
> +{
> +	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
> +
> +	mtk_drm_crtc_commit(mtk_crtc);
> +}
> +
> +static const struct drm_crtc_funcs mtk_crtc_funcs = {
> +	.set_config		= drm_atomic_helper_set_config,
> +	.page_flip		= drm_atomic_helper_page_flip,
> +	.destroy		= mtk_drm_crtc_destroy,
> +	.reset			= drm_atomic_helper_crtc_reset,
> +	.atomic_duplicate_state	= drm_atomic_helper_crtc_duplicate_state,
> +	.atomic_destroy_state	= drm_atomic_helper_crtc_destroy_state,
> +};
> +
> +static const struct drm_crtc_helper_funcs mtk_crtc_helper_funcs = {
> +	.mode_fixup	= mtk_drm_crtc_mode_fixup,
> +	.mode_set_nofb	= mtk_drm_crtc_mode_set_nofb,
> +	.enable		= mtk_drm_crtc_enable,
> +	.disable	= mtk_drm_crtc_disable,
> +	.atomic_begin	= mtk_drm_crtc_atomic_begin,
> +	.atomic_flush	= mtk_drm_crtc_atomic_flush,
> +};
> +
> +struct mtk_drm_crtc *mtk_drm_crtc_create(struct drm_device *drm,
> +		struct drm_plane *primary, struct drm_plane *cursor, int pipe,
> +		void *ctx)
> +{
> +	struct mtk_drm_private *priv = drm->dev_private;
> +	struct mtk_drm_crtc *mtk_crtc;
> +	int ret;
> +
> +	mtk_crtc = devm_kzalloc(drm->dev, sizeof(*mtk_crtc), GFP_KERNEL);
> +	if (!mtk_crtc)
> +		return ERR_PTR(-ENOMEM);
> +
> +	mtk_crtc->pipe = pipe;
> +	mtk_crtc->ctx = ctx;
> +	mtk_crtc->enabled = false;
> +
> +	priv->crtc[pipe] = &mtk_crtc->base;
> +
> +	ret = drm_crtc_init_with_planes(drm, &mtk_crtc->base, primary, cursor,
> +			&mtk_crtc_funcs);
> +	if (ret)
> +		goto err_cleanup_crtc;
> +
> +	drm_crtc_helper_add(&mtk_crtc->base, &mtk_crtc_helper_funcs);
> +
> +	return mtk_crtc;
> +
> +err_cleanup_crtc:
> +	drm_crtc_cleanup(&mtk_crtc->base);
> +	return ERR_PTR(ret);
> +}
> +
> +void mtk_drm_crtc_plane_config(struct mtk_drm_crtc *crtc, unsigned int idx,
> +				  bool enable, dma_addr_t addr)
> +{
> +	struct mtk_crtc_ddp_context *ctx = crtc->ctx;
> +	struct drm_plane *plane = &ctx->planes[idx].base;
> +	unsigned int pitch, format;
> +	int x, y;
> +
> +	if (!plane->fb || !plane->state)
> +		return;
> +
> +	if (plane->fb) {
> +		pitch = plane->fb->pitches[0];
> +		format = plane->fb->pixel_format;
> +	}
> +
> +	if (plane->state) {
> +		x = plane->state->crtc_x;
> +		y = plane->state->crtc_y;
> +
> +		if (x < 0) {
> +			addr -= x * 4;
> +			x = 0;
> +		}
> +
> +		if (y < 0) {
> +			addr -= y * pitch;
> +			y = 0;
> +		}
> +	}
> +
> +	ctx->pending_ovl_enable[idx] = enable;
> +	ctx->pending_ovl_addr[idx] = addr;
> +	ctx->pending_ovl_pitch[idx] = pitch;
> +	ctx->pending_ovl_format[idx] = format;
> +	ctx->pending_ovl_x[idx] = x;
> +	ctx->pending_ovl_y[idx] = y;
> +	ctx->pending_ovl_size[idx] = ctx->planes[idx].disp_size;
> +	ctx->pending_ovl_dirty[idx] = true;
> +}
> +
> +static void mtk_crtc_ddp_irq(struct mtk_crtc_ddp_context *ctx)
> +{
> +	struct drm_device *dev = ctx->drm_dev;
> +	struct mtk_drm_crtc *mtk_crtc = ctx->crtc;
> +	struct mtk_ddp_comp *ovl = &ctx->ddp_comp[0];
> +	unsigned int i;
> +	unsigned long flags;
> +
> +	if (ctx->pending_config) {
> +		ctx->pending_config = false;
> +
> +		for (i = 0; i < OVL_LAYER_NR; i++)
> +			ovl->funcs->comp_layer_off(ovl->regs, i);
> +		ovl->funcs->comp_config(ovl->regs, ctx->pending_width,
> +						   ctx->pending_height);
> +	}
> +
> +	for (i = 0; i < OVL_LAYER_NR; i++) {
> +		if (ctx->pending_ovl_config[i]) {
> +			if (!ctx->pending_ovl_enable[i])
> +				ovl->funcs->comp_layer_off(ovl->regs, i);
> +
> +			ovl->funcs->comp_layer_config(ovl->regs, i,
> +					ctx->pending_ovl_addr[i],
> +					ctx->pending_ovl_pitch[i],
> +					ctx->pending_ovl_format[i],
> +					ctx->pending_ovl_x[i],
> +					ctx->pending_ovl_y[i],
> +					ctx->pending_ovl_size[i]);
> +
> +			if (ctx->pending_ovl_enable[i])
> +				ovl->funcs->comp_layer_on(ovl->regs, i);
> +		}
> +
> +		ctx->pending_ovl_config[i] = false;
> +	}
> +
> +	drm_handle_vblank(ctx->drm_dev, ctx->pipe);
> +}
> +
> +static irqreturn_t mtk_crtc_ddp_irq_handler(int irq, void *dev_id)
> +{
> +	struct mtk_crtc_ddp_context *ctx = dev_id;
> +	struct mtk_ddp_comp *ovl = &ctx->ddp_comp[0];
> +
> +	if (ovl->funcs->comp_clear_vblank)
> +		ovl->funcs->comp_clear_vblank(ovl->regs);
> +
> +	if (ctx->pipe >= 0 && ctx->drm_dev)
> +		mtk_crtc_ddp_irq(ctx);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int mtk_crtc_ddp_bind(struct device *dev, struct device *master,
> +		void *data)
> +{
> +	struct mtk_crtc_ddp_context *ctx = dev_get_drvdata(dev);
> +	struct drm_device *drm_dev = data;
> +	struct mtk_drm_private *priv = drm_dev->dev_private;
> +	struct device_node *node;
> +	enum drm_plane_type type;
> +	unsigned int zpos;
> +	int ret;
> +	int i;
> +
> +	ctx->drm_dev = drm_dev;
> +	ctx->pipe = priv->pipe++;
> +	ctx->config_regs = priv->config_regs;
> +	ctx->mutex_dev = priv->mutex_dev;
> +	ctx->ddp_comp_nr = priv->path_len[ctx->pipe];
> +	ctx->ddp_comp =	devm_kmalloc_array(dev, ctx->ddp_comp_nr,
> +					   sizeof(*ctx->ddp_comp), GFP_KERNEL);
> +
> +	for (i = 0; i < ctx->ddp_comp_nr; i++) {
> +		struct mtk_ddp_comp *comp = &ctx->ddp_comp[i];
> +
> +		ret = mtk_ddp_comp_init(master, comp, priv->path[ctx->pipe][i]);
> +		if (ret) {
> +			dev_err(dev, "Failed to initialize component %i\n", i);
> +			goto unprepare;
> +		}
> +
> +		if (comp->clk) {
> +			ret = clk_prepare(comp->clk);
> +			if (ret) {
> +				dev_err(dev, "Failed to prepare clock %d\n", i);
> +				ret = -EINVAL;
> +				goto unprepare;
> +			}
> +		}
> +	}
> +
> +	for (zpos = 0; zpos < OVL_LAYER_NR; zpos++) {
> +		type = (zpos == 0) ? DRM_PLANE_TYPE_PRIMARY :
> +				(zpos == 1) ? DRM_PLANE_TYPE_CURSOR :
> +						DRM_PLANE_TYPE_OVERLAY;
> +		ret = mtk_plane_init(drm_dev, &ctx->planes[zpos],
> +				1 << ctx->pipe, type, zpos, OVL_LAYER_NR);
> +		if (ret)
> +			goto unprepare;
> +	}
> +
> +	ctx->crtc = mtk_drm_crtc_create(drm_dev, &ctx->planes[0].base,
> +			&ctx->planes[1].base, ctx->pipe, ctx);
> +
> +	if (IS_ERR(ctx->crtc)) {
> +		ret = PTR_ERR(ctx->crtc);
> +		goto unprepare;
> +	}
> +
> +	mtk_crtc_ddp_hw_init(ctx->crtc);
> +	ctx->ddp_comp[0].funcs->comp_layer_off(ctx->ddp_comp[0].regs, 0);
> +
> +	return 0;
> +
> +unprepare:
> +	while (--i >= 0)
> +		clk_unprepare(ctx->ddp_comp[i].clk);
> +	of_node_put(node);
> +
> +	return ret;
> +}
> +
> +static void mtk_crtc_ddp_unbind(struct device *dev, struct device *master,
> +		void *data)
> +{
> +	struct mtk_crtc_ddp_context *ctx = dev_get_drvdata(dev);
> +	int i;
> +
> +	mtk_crtc_ddp_hw_fini(ctx->crtc);
> +
> +	for (i = 0; i < ctx->ddp_comp_nr; i++)
> +		clk_unprepare(ctx->ddp_comp[i].clk);
> +}
> +
> +static const struct component_ops mtk_crtc_ddp_component_ops = {
> +	.bind	= mtk_crtc_ddp_bind,
> +	.unbind = mtk_crtc_ddp_unbind,
> +};
> +
> +static int mtk_crtc_ddp_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct mtk_crtc_ddp_context *ctx;
> +	int irq;
> +	int ret;
> +
> +	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return irq;
> +
> +	ret = devm_request_irq(dev, irq, mtk_crtc_ddp_irq_handler,
> +			       IRQF_TRIGGER_NONE, dev_name(dev), ctx);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to request irq %d: %d\n", irq, ret);
> +		return -ENXIO;
> +	}
> +
> +	platform_set_drvdata(pdev, ctx);
> +
> +	ret = component_add(dev, &mtk_crtc_ddp_component_ops);
> +	if (ret)
> +		dev_err(dev, "Failed to add component: %d\n", ret);
> +
> +	return ret;
> +}
> +
> +static int mtk_crtc_ddp_remove(struct platform_device *pdev)
> +{
> +	component_del(&pdev->dev, &mtk_crtc_ddp_component_ops);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id mtk_crtc_ddp_driver_dt_match[] = {
> +	{ .compatible = "mediatek,mt8173-disp-ovl", },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, mtk_crtc_ddp_driver_dt_match);
> +
> +struct platform_driver mtk_crtc_ddp_driver = {
> +	.probe		= mtk_crtc_ddp_probe,
> +	.remove		= mtk_crtc_ddp_remove,
> +	.driver		= {
> +		.name	= "mediatek-crtc-ddp",
> +		.owner	= THIS_MODULE,
> +		.of_match_table = mtk_crtc_ddp_driver_dt_match,
> +	},
> +};
> +
> +module_platform_driver(mtk_crtc_ddp_driver);
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h b/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
> new file mode 100644
> index 0000000..6313f92
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
> @@ -0,0 +1,84 @@
> +/*
> + * Copyright (c) 2015 MediaTek Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#ifndef MTK_DRM_CRTC_H
> +#define MTK_DRM_CRTC_H
> +
> +#include "mtk_drm_plane.h"
> +
> +#define OVL_LAYER_NR	4
> +
> +struct mtk_crtc_ddp_context;
> +
> +/*
> + * MediaTek specific crtc structure.
> + *
> + * @base: crtc object.
> + * @pipe: a crtc index created at load() with a new crtc object creation
> + *	and the crtc object would be set to private->crtc array
> + *	to get a crtc object corresponding to this pipe from private->crtc
> + *	array when irq interrupt occurred. the reason of using this pipe is that
> + *	drm framework doesn't support multiple irq yet.
> + *	we can refer to the crtc to current hardware interrupt occurred through
> + *	this pipe value.
> + * @enabled: crtc enabled
> + * @ctx: mtk crtc context object
> + * @event: drm pending vblank event
> + * @pending_needs_vblank: Need to send event in vblank.
> + */
> +struct mtk_drm_crtc {
> +	struct drm_crtc				base;
> +	unsigned int				pipe;
> +	bool					enabled;
> +	struct mtk_crtc_ddp_context		*ctx;
> +
> +	struct drm_pending_vblank_event		*event;
> +	bool					pending_needs_vblank;
> +};
> +
> +struct mtk_crtc_ddp_context {
> +	struct device			*dev;
> +	struct drm_device		*drm_dev;
> +	struct mtk_drm_crtc		*crtc;
> +	struct mtk_drm_plane		planes[OVL_LAYER_NR];
> +	int				pipe;
> +
> +	void __iomem			*config_regs;
> +	struct device			*mutex_dev;
> +	u32				ddp_comp_nr;
> +	struct mtk_ddp_comp		*ddp_comp;
> +
> +	bool				pending_config;
> +	unsigned int			pending_width;
> +	unsigned int			pending_height;
> +
> +	bool				pending_ovl_config[OVL_LAYER_NR];
> +	bool				pending_ovl_enable[OVL_LAYER_NR];
> +	unsigned int			pending_ovl_addr[OVL_LAYER_NR];
> +	unsigned int			pending_ovl_pitch[OVL_LAYER_NR];
> +	unsigned int			pending_ovl_format[OVL_LAYER_NR];
> +	int				pending_ovl_x[OVL_LAYER_NR];
> +	int				pending_ovl_y[OVL_LAYER_NR];
> +	unsigned int			pending_ovl_size[OVL_LAYER_NR];
> +	bool				pending_ovl_dirty[OVL_LAYER_NR];
> +};
> +
> +#define to_mtk_crtc(x) container_of(x, struct mtk_drm_crtc, base)
> +
> +int mtk_drm_crtc_enable_vblank(struct drm_device *drm, int pipe);
> +void mtk_drm_crtc_disable_vblank(struct drm_device *drm, int pipe);
> +void mtk_drm_crtc_plane_config(struct mtk_drm_crtc *crtc, unsigned int idx,
> +				  bool enable, dma_addr_t addr);
> +void mtk_drm_crtc_commit(struct mtk_drm_crtc *crtc);
> +
> +#endif /* MTK_DRM_CRTC_H */
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> new file mode 100644
> index 0000000..56da52a
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> @@ -0,0 +1,231 @@
> +/*
> + * Copyright (c) 2015 MediaTek Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <drm/drmP.h>
> +#include <linux/clk.h>
> +#include <linux/component.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +
> +#include "mtk_drm_crtc.h"
> +#include "mtk_drm_ddp.h"
> +#include "mtk_drm_ddp_comp.h"
> +
> +#define DISP_REG_CONFIG_DISP_OVL0_MOUT_EN	0x040
> +#define DISP_REG_CONFIG_DISP_OVL1_MOUT_EN	0x044
> +#define DISP_REG_CONFIG_DISP_OD_MOUT_EN		0x048
> +#define DISP_REG_CONFIG_DISP_GAMMA_MOUT_EN	0x04c
> +#define DISP_REG_CONFIG_DISP_UFOE_MOUT_EN	0x050
> +#define DISP_REG_CONFIG_DISP_COLOR0_SEL_IN	0x084
> +#define DISP_REG_CONFIG_DISP_COLOR1_SEL_IN	0x088
> +#define DISP_REG_CONFIG_DPI_SEL_IN		0x0ac
> +#define DISP_REG_CONFIG_DISP_RDMA1_MOUT_EN	0x0c8
> +#define DISP_REG_CONFIG_MMSYS_CG_CON0		0x100
> +
> +#define DISP_REG_MUTEX_EN(n)	(0x20 + 0x20 * n)
> +#define DISP_REG_MUTEX_RST(n)	(0x28 + 0x20 * n)
> +#define DISP_REG_MUTEX_MOD(n)	(0x2c + 0x20 * n)
> +#define DISP_REG_MUTEX_SOF(n)	(0x30 + 0x20 * n)
> +
> +#define MUTEX_MOD_OVL0		11
> +#define MUTEX_MOD_OVL1		12
> +#define MUTEX_MOD_RDMA0		13
> +#define MUTEX_MOD_RDMA1		14
> +#define MUTEX_MOD_COLOR0	18
> +#define MUTEX_MOD_COLOR1	19
> +#define MUTEX_MOD_AAL		20
> +#define MUTEX_MOD_GAMMA		21
> +#define MUTEX_MOD_UFOE		22
> +#define MUTEX_MOD_PWM0		23
> +#define MUTEX_MOD_OD		25
> +
> +#define MUTEX_SOF_DSI0		1
> +#define MUTEX_SOF_DPI0		3
> +
> +#define OVL0_MOUT_EN_COLOR0	0x1
> +#define OD_MOUT_EN_RDMA0	0x1
> +#define UFOE_MOUT_EN_DSI0	0x1
> +#define COLOR0_SEL_IN_OVL0	0x1
> +#define OVL1_MOUT_EN_COLOR1	0x1
> +#define GAMMA_MOUT_EN_RDMA1	0x1
> +#define RDMA1_MOUT_DPI0		0x2
> +#define DPI0_SEL_IN_RDMA1	0x1
> +#define COLOR1_SEL_IN_OVL1	0x1
> +
> +static const unsigned int mutex_mod[DDP_COMPONENT_TYPE_MAX] = {
> +	[DDP_COMPONENT_AAL] = MUTEX_MOD_AAL,
> +	[DDP_COMPONENT_COLOR0] = MUTEX_MOD_COLOR0,
> +	[DDP_COMPONENT_COLOR1] = MUTEX_MOD_COLOR1,
> +	[DDP_COMPONENT_GAMMA] = MUTEX_MOD_GAMMA,
> +	[DDP_COMPONENT_OD] = MUTEX_MOD_OD,
> +	[DDP_COMPONENT_OVL0] = MUTEX_MOD_OVL0,
> +	[DDP_COMPONENT_OVL1] = MUTEX_MOD_OVL1,
> +	[DDP_COMPONENT_PWM0] = MUTEX_MOD_PWM0,
> +	[DDP_COMPONENT_RDMA0] = MUTEX_MOD_RDMA0,
> +	[DDP_COMPONENT_RDMA1] = MUTEX_MOD_RDMA1,
> +	[DDP_COMPONENT_UFOE] = MUTEX_MOD_UFOE,
> +};
> +
> +void mtk_ddp_add_comp_to_path(void __iomem *config_regs, unsigned int pipe,
> +			      enum mtk_ddp_comp_type cur,
> +			      enum mtk_ddp_comp_type next)
> +{
> +	unsigned int addr, value;
> +
> +	if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_COLOR0) {
> +		addr = DISP_REG_CONFIG_DISP_OVL0_MOUT_EN;
> +		value = OVL0_MOUT_EN_COLOR0;
> +	} else if (cur == DDP_COMPONENT_OD && next == DDP_COMPONENT_RDMA0) {
> +		addr = DISP_REG_CONFIG_DISP_OD_MOUT_EN;
> +		value = OD_MOUT_EN_RDMA0;
> +	} else if (cur == DDP_COMPONENT_UFOE && next == DDP_COMPONENT_DSI0) {
> +		addr = DISP_REG_CONFIG_DISP_UFOE_MOUT_EN;
> +		value = UFOE_MOUT_EN_DSI0;
> +	} else if (cur == DDP_COMPONENT_OVL1 && next == DDP_COMPONENT_COLOR1) {
> +		addr = DISP_REG_CONFIG_DISP_OVL1_MOUT_EN;
> +		value = OVL1_MOUT_EN_COLOR1;
> +	} else if (cur == DDP_COMPONENT_GAMMA && next == DDP_COMPONENT_RDMA1) {
> +		addr = DISP_REG_CONFIG_DISP_GAMMA_MOUT_EN;
> +		value = GAMMA_MOUT_EN_RDMA1;
> +	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI0) {
> +		addr = DISP_REG_CONFIG_DISP_RDMA1_MOUT_EN;
> +		value = RDMA1_MOUT_DPI0;
> +	} else {
> +		value = 0;
> +	}
> +	if (value) {
> +		unsigned int reg = readl(config_regs + addr) | value;
> +
> +		writel(reg, config_regs + addr);
> +	}
> +
> +	if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_COLOR0) {
> +		addr = DISP_REG_CONFIG_DISP_COLOR0_SEL_IN;
> +		value = COLOR0_SEL_IN_OVL0;
> +	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI0) {
> +		addr = DISP_REG_CONFIG_DPI_SEL_IN;
> +		value = DPI0_SEL_IN_RDMA1;
> +	} else if (cur == DDP_COMPONENT_OVL1 && next == DDP_COMPONENT_COLOR1) {
> +		addr = DISP_REG_CONFIG_DISP_COLOR1_SEL_IN;
> +		value = COLOR1_SEL_IN_OVL1;
> +	} else {
> +		value = 0;
> +	}
> +	if (value) {
> +		unsigned int reg = readl(config_regs + addr) | value;
> +
> +		writel(reg, config_regs + addr);
> +	}
> +}
> +
> +void mtk_ddp_add_comp_to_mutex(struct device *dev, unsigned int pipe,
> +			       enum mtk_ddp_comp_type cur,
> +			       enum mtk_ddp_comp_type next)
> +{
> +	struct mtk_ddp *ddp = dev_get_drvdata(dev);
> +	unsigned int reg;
> +
> +	reg = readl(ddp->mutex_regs + DISP_REG_MUTEX_MOD(pipe));
> +	reg |= BIT(mutex_mod[cur]) | BIT(mutex_mod[next]);
> +	writel(reg, ddp->mutex_regs + DISP_REG_MUTEX_MOD(pipe));
> +
> +	if (next == DDP_COMPONENT_DPI0)
> +		reg = MUTEX_SOF_DPI0;
> +	else
> +		reg = MUTEX_SOF_DSI0;
> +
> +	writel(reg, ddp->mutex_regs + DISP_REG_MUTEX_SOF(pipe));
> +	writel(1, ddp->mutex_regs + DISP_REG_MUTEX_EN(pipe));
> +}
> +
> +void mtk_ddp_clock_on(struct device *dev)
> +{
> +	struct mtk_ddp *ddp = dev_get_drvdata(dev);
> +	int ret;
> +
> +	/* disp_mtcmos */
> +	ret = pm_runtime_get_sync(dev);
> +	if (ret < 0)
> +		DRM_ERROR("failed to get_sync(%d)\n", ret);
> +
> +	ret = clk_prepare_enable(ddp->mutex_disp_clk);
> +	if (ret != 0)
> +		DRM_ERROR("clk_prepare_enable(mutex_disp_clk) error!\n");
> +}
> +
> +void mtk_ddp_clock_off(struct device *dev)
> +{
> +	struct mtk_ddp *ddp = dev_get_drvdata(dev);
> +
> +	clk_disable_unprepare(ddp->mutex_disp_clk);
> +
> +	/* disp_mtcmos */
> +	pm_runtime_put_sync(dev);
> +}
> +
> +static int mtk_ddp_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct mtk_ddp *ddp;
> +	struct resource *regs;
> +
> +	ddp = devm_kzalloc(dev, sizeof(*ddp), GFP_KERNEL);
> +	if (!ddp)
> +		return -ENOMEM;
> +
> +	ddp->mutex_disp_clk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(ddp->mutex_disp_clk)) {
> +		dev_err(dev, "Failed to get clock\n");
> +		return PTR_ERR(ddp->mutex_disp_clk);
> +	}
> +
> +	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	ddp->mutex_regs = devm_ioremap_resource(dev, regs);
> +	if (IS_ERR(ddp->mutex_regs)) {
> +		dev_err(dev, "Failed to map mutex registers\n");
> +		return PTR_ERR(ddp->mutex_regs);
> +	}
> +
> +	platform_set_drvdata(pdev, ddp);
> +
> +	pm_runtime_enable(dev);
> +
> +	return 0;
> +}
> +
> +static int mtk_ddp_remove(struct platform_device *pdev)
> +{
> +	pm_runtime_disable(&pdev->dev);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id ddp_driver_dt_match[] = {
> +	{ .compatible = "mediatek,mt8173-disp-mutex" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, ddp_driver_dt_match);
> +
> +struct platform_driver mtk_ddp_driver = {
> +	.probe		= mtk_ddp_probe,
> +	.remove		= mtk_ddp_remove,
> +	.driver		= {
> +		.name	= "mediatek-ddp",
> +		.owner	= THIS_MODULE,
> +		.of_match_table = ddp_driver_dt_match,
> +	},
> +};
> +
> +module_platform_driver(mtk_ddp_driver);
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp.h
> new file mode 100644
> index 0000000..09c54b0
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp.h
> @@ -0,0 +1,39 @@
> +/*
> + * Copyright (c) 2015 MediaTek Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#ifndef MTK_DRM_DDP_H
> +#define MTK_DRM_DDP_H
> +
> +#include "mtk_drm_ddp_comp.h"
> +
> +struct regmap;
> +struct device;
> +
> +struct mtk_ddp {
> +	struct device			*dev;
> +	struct drm_device		*drm_dev;
> +
> +	struct clk			*mutex_disp_clk;
> +	void __iomem			*mutex_regs;
> +};
> +
> +void mtk_ddp_add_comp_to_path(void __iomem *config_regs, unsigned int pipe,
> +			      enum mtk_ddp_comp_type cur,
> +			      enum mtk_ddp_comp_type next);
> +void mtk_ddp_add_comp_to_mutex(struct device *dev, unsigned int pipe,
> +			       enum mtk_ddp_comp_type cur,
> +			       enum mtk_ddp_comp_type next);
> +void mtk_ddp_clock_on(struct device *dev);
> +void mtk_ddp_clock_off(struct device *dev);
> +
> +#endif /* MTK_DRM_DDP_H */
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> new file mode 100644
> index 0000000..2473f96
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -0,0 +1,378 @@
> +/*
> + * Copyright (c) 2015 MediaTek Inc.
> + * Authors:
> + *	YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> + *	CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/of_address.h>
> +#include <linux/of_irq.h>
> +#include <drm/drmP.h>
> +#include "mtk_drm_ddp_comp.h"
> +
> +#define DISP_REG_OVL_INTEN			0x0004
> +#define DISP_REG_OVL_INTSTA			0x0008
> +#define DISP_REG_OVL_EN				0x000c
> +#define DISP_REG_OVL_RST			0x0014
> +#define DISP_REG_OVL_ROI_SIZE			0x0020
> +#define DISP_REG_OVL_ROI_BGCLR			0x0028
> +#define DISP_REG_OVL_SRC_CON			0x002c
> +#define DISP_REG_OVL_CON(n)			(0x0030 + 0x20 * n)
> +#define DISP_REG_OVL_SRC_SIZE(n)		(0x0038 + 0x20 * n)
> +#define DISP_REG_OVL_OFFSET(n)			(0x003c + 0x20 * n)
> +#define DISP_REG_OVL_PITCH(n)			(0x0044 + 0x20 * n)
> +#define DISP_REG_OVL_RDMA_CTRL(n)		(0x00c0 + 0x20 * n)
> +#define DISP_REG_OVL_RDMA_GMC(n)		(0x00c8 + 0x20 * n)
> +#define DISP_REG_OVL_ADDR(n)			(0x0f40 + 0x20 * n)
> +
> +#define DISP_REG_RDMA_INT_ENABLE		0x0000
> +#define DISP_REG_RDMA_INT_STATUS		0x0004
> +#define DISP_REG_RDMA_GLOBAL_CON		0x0010
> +#define DISP_REG_RDMA_SIZE_CON_0		0x0014
> +#define DISP_REG_RDMA_SIZE_CON_1		0x0018
> +#define DISP_REG_RDMA_FIFO_CON			0x0040
> +
> +#define DISP_OD_EN				0x0000
> +#define DISP_OD_INTEN				0x0008
> +#define DISP_OD_INTSTA				0x000c
> +#define DISP_OD_CFG				0x0020
> +#define DISP_OD_SIZE				0x0030
> +
> +#define DISP_REG_UFO_START			0x0000
> +
> +#define DISP_COLOR_CFG_MAIN			0x0400
> +#define DISP_COLOR_START			0x0c00
> +
> +enum OVL_INPUT_FORMAT {
> +	OVL_INFMT_RGB565 = 0,
> +	OVL_INFMT_RGB888 = 1,
> +	OVL_INFMT_RGBA8888 = 2,
> +	OVL_INFMT_ARGB8888 = 3,
> +};
> +
> +#define	OVL_RDMA_MEM_GMC	0x40402020
> +#define	OVL_AEN			BIT(8)
> +#define	OVL_ALPHA		0xff
> +
> +#define	OD_RELAY_MODE		BIT(0)
> +
> +#define	UFO_BYPASS		BIT(2)
> +
> +#define	COLOR_BYPASS_ALL	BIT(7)
> +#define	COLOR_SEQ_SEL		BIT(13)
> +
> +static void mtk_color_start(void __iomem *color_base)
> +{
> +	writel(COLOR_BYPASS_ALL | COLOR_SEQ_SEL,
> +		color_base + DISP_COLOR_CFG_MAIN);
> +	writel(0x1, color_base + DISP_COLOR_START);
> +}
> +
> +static void mtk_od_config(void __iomem *od_base, unsigned int w, unsigned int h)
> +{
> +	writel(w << 16 | h, od_base + DISP_OD_SIZE);
> +}
> +
> +static void mtk_od_start(void __iomem *od_base)
> +{
> +	writel(OD_RELAY_MODE, od_base + DISP_OD_CFG);
> +	writel(1, od_base + DISP_OD_EN);
> +}
> +
> +static void mtk_ovl_enable_vblank(void __iomem *disp_base)
> +{
> +	writel(0x2, disp_base + DISP_REG_OVL_INTEN);
> +}
> +
> +static void mtk_ovl_disable_vblank(void __iomem *disp_base)
> +{
> +	writel(0x0, disp_base + DISP_REG_OVL_INTEN);
> +}
> +
> +static void mtk_ovl_clear_vblank(void __iomem *disp_base)
> +{
> +	writel(0x0, disp_base + DISP_REG_OVL_INTSTA);
> +}
> +
> +static void mtk_ovl_start(void __iomem *ovl_base)
> +{
> +	writel(0x1, ovl_base + DISP_REG_OVL_EN);
> +}
> +
> +static void mtk_ovl_config(void __iomem *ovl_base,
> +		unsigned int w, unsigned int h)
> +{
> +	if (w != 0 && h != 0)
> +		writel(h << 16 | w, ovl_base + DISP_REG_OVL_ROI_SIZE);
> +	writel(0x0, ovl_base + DISP_REG_OVL_ROI_BGCLR);
> +
> +	writel(0x1, ovl_base + DISP_REG_OVL_RST);
> +	writel(0x0, ovl_base + DISP_REG_OVL_RST);
> +}
> +
> +static bool has_rb_swapped(unsigned int fmt)
> +{
> +	switch (fmt) {
> +	case DRM_FORMAT_BGR888:
> +	case DRM_FORMAT_BGR565:
> +	case DRM_FORMAT_ABGR8888:
> +	case DRM_FORMAT_XBGR8888:
> +	case DRM_FORMAT_BGRA8888:
> +	case DRM_FORMAT_BGRX8888:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +static unsigned int ovl_fmt_convert(unsigned int fmt)
> +{
> +	switch (fmt) {
> +	case DRM_FORMAT_RGB888:
> +	case DRM_FORMAT_BGR888:
> +		return OVL_INFMT_RGB888;
> +	case DRM_FORMAT_RGB565:
> +	case DRM_FORMAT_BGR565:
> +		return OVL_INFMT_RGB565;
> +	case DRM_FORMAT_RGBX8888:
> +	case DRM_FORMAT_RGBA8888:
> +	case DRM_FORMAT_BGRX8888:
> +	case DRM_FORMAT_BGRA8888:
> +		return OVL_INFMT_ARGB8888;
> +	case DRM_FORMAT_XRGB8888:
> +	case DRM_FORMAT_ARGB8888:
> +	case DRM_FORMAT_XBGR8888:
> +	case DRM_FORMAT_ABGR8888:
> +		return OVL_INFMT_RGBA8888;
> +	default:
> +		DRM_ERROR("unsupport format[%08x]\n", fmt);
> +		return -EINVAL;
> +	}
> +}
> +
> +static void mtk_ovl_layer_on(void __iomem *ovl_base, unsigned int idx)
> +{
> +	unsigned int reg;
> +
> +	writel(0x1, ovl_base + DISP_REG_OVL_RDMA_CTRL(idx));
> +	writel(OVL_RDMA_MEM_GMC, ovl_base + DISP_REG_OVL_RDMA_GMC(idx));
> +
> +	reg = readl(ovl_base + DISP_REG_OVL_SRC_CON);
> +	reg = reg | (1 << idx);
> +	writel(reg, ovl_base + DISP_REG_OVL_SRC_CON);
> +}
> +
> +static void mtk_ovl_layer_off(void __iomem *ovl_base, unsigned int idx)
> +{
> +	unsigned int reg;
> +
> +	reg = readl(ovl_base + DISP_REG_OVL_SRC_CON);
> +	reg = reg & ~(1 << idx);
> +	writel(reg, ovl_base + DISP_REG_OVL_SRC_CON);
> +
> +	writel(0x0, ovl_base + DISP_REG_OVL_RDMA_CTRL(idx));
> +}
> +
> +static void mtk_ovl_layer_config(void __iomem *ovl_base, unsigned int idx,
> +		unsigned int addr, unsigned int pitch, unsigned int fmt,
> +		int x, int y, unsigned int size)
> +{
> +	unsigned int reg;
> +
> +	reg = has_rb_swapped(fmt) << 24 | ovl_fmt_convert(fmt) << 12;
> +	if (idx != 0)
> +		reg |= OVL_AEN | OVL_ALPHA;
> +
> +	writel(reg, ovl_base + DISP_REG_OVL_CON(idx));
> +	writel(pitch & 0xFFFF, ovl_base + DISP_REG_OVL_PITCH(idx));
> +	writel(size, ovl_base + DISP_REG_OVL_SRC_SIZE(idx));
> +	writel(y << 16 | x, ovl_base + DISP_REG_OVL_OFFSET(idx));
> +	writel(addr, ovl_base + DISP_REG_OVL_ADDR(idx));
> +}
> +
> +static void mtk_rdma_start(void __iomem *rdma_base)
> +{
> +	unsigned int reg;
> +
> +	writel(0x4, rdma_base + DISP_REG_RDMA_INT_ENABLE);
> +	reg = readl(rdma_base + DISP_REG_RDMA_GLOBAL_CON);
> +	reg |= 1;
> +	writel(reg, rdma_base + DISP_REG_RDMA_GLOBAL_CON);
> +}
> +
> +static void mtk_rdma_config(void __iomem *rdma_base,
> +		unsigned width, unsigned height)
> +{
> +	unsigned int reg;
> +
> +	reg = readl(rdma_base + DISP_REG_RDMA_SIZE_CON_0);
> +	reg = (reg & ~(0xFFF)) | (width & 0xFFF);
> +	writel(reg, rdma_base + DISP_REG_RDMA_SIZE_CON_0);
> +
> +	reg = readl(rdma_base + DISP_REG_RDMA_SIZE_CON_1);
> +	reg = (reg & ~(0xFFFFF)) | (height & 0xFFFFF);
> +	writel(reg, rdma_base + DISP_REG_RDMA_SIZE_CON_1);
> +
> +	writel(0x80F00008, rdma_base + DISP_REG_RDMA_FIFO_CON);
> +}
> +
> +static void mtk_ufoe_start(void __iomem *ufoe_base)
> +{
> +	writel(UFO_BYPASS, ufoe_base + DISP_REG_UFO_START);
> +}
> +
> +static const struct mtk_ddp_comp_funcs ddp_aal = {
> +	.comp_type = DDP_COMPONENT_AAL,
> +};
> +
> +static const struct mtk_ddp_comp_funcs ddp_color0 = {
> +	.comp_type = DDP_COMPONENT_COLOR0,
> +	.comp_power_on = mtk_color_start,
> +};
> +
> +static const struct mtk_ddp_comp_funcs ddp_color1 = {
> +	.comp_type = DDP_COMPONENT_COLOR1,
> +	.comp_power_on = mtk_color_start,
> +};
> +
> +static const struct mtk_ddp_comp_funcs ddp_dpi0 = {
> +	.comp_type = DDP_COMPONENT_DPI0,
> +};
> +
> +static const struct mtk_ddp_comp_funcs ddp_dsi0 = {
> +	.comp_type = DDP_COMPONENT_DSI0,
> +};
> +
> +static const struct mtk_ddp_comp_funcs ddp_gamma = {
> +	.comp_type = DDP_COMPONENT_GAMMA,
> +};
> +
> +static const struct mtk_ddp_comp_funcs ddp_od = {
> +	.comp_type = DDP_COMPONENT_OD,
> +	.comp_config = mtk_od_config,
> +	.comp_power_on = mtk_od_start,
> +};
> +
> +static const struct mtk_ddp_comp_funcs ddp_ovl0 = {
> +	.comp_type = DDP_COMPONENT_OVL0,
> +	.comp_config = mtk_ovl_config,
> +	.comp_power_on = mtk_ovl_start,
> +	.comp_enable_vblank = mtk_ovl_enable_vblank,
> +	.comp_disable_vblank = mtk_ovl_disable_vblank,
> +	.comp_clear_vblank = mtk_ovl_clear_vblank,
> +	.comp_layer_on = mtk_ovl_layer_on,
> +	.comp_layer_off = mtk_ovl_layer_off,
> +	.comp_layer_config = mtk_ovl_layer_config,
> +};
> +
> +static const struct mtk_ddp_comp_funcs ddp_ovl1 = {
> +	.comp_type = DDP_COMPONENT_OVL1,
> +	.comp_config = mtk_ovl_config,
> +	.comp_power_on = mtk_ovl_start,
> +	.comp_enable_vblank = mtk_ovl_enable_vblank,
> +	.comp_disable_vblank = mtk_ovl_disable_vblank,
> +	.comp_clear_vblank = mtk_ovl_clear_vblank,
> +	.comp_layer_on = mtk_ovl_layer_on,
> +	.comp_layer_off = mtk_ovl_layer_off,
> +	.comp_layer_config = mtk_ovl_layer_config,
> +};
> +
> +static const struct mtk_ddp_comp_funcs ddp_pwm0 = {
> +	.comp_type = DDP_COMPONENT_PWM0,
> +};
> +
> +static const struct mtk_ddp_comp_funcs ddp_rdma0 = {
> +	.comp_type = DDP_COMPONENT_RDMA0,
> +	.comp_config = mtk_rdma_config,
> +	.comp_power_on = mtk_rdma_start,
> +};
> +
> +static const struct mtk_ddp_comp_funcs ddp_rdma1 = {
> +	.comp_type = DDP_COMPONENT_RDMA1,
> +	.comp_config = mtk_rdma_config,
> +	.comp_power_on = mtk_rdma_start,
> +};
> +
> +static const struct mtk_ddp_comp_funcs ddp_ufoe = {
> +	.comp_type = DDP_COMPONENT_UFOE,
> +	.comp_power_on = mtk_ufoe_start,
> +};
> +
> +struct mtk_ddp_comp_match {
> +	const char *name;
> +	const struct mtk_ddp_comp_funcs *funcs;
> +};
> +
> +static struct mtk_ddp_comp_match mtk_ddp_matches[DDP_COMPONENT_TYPE_MAX] = {
> +	[DDP_COMPONENT_AAL]	= { "aal", &ddp_aal },
> +	[DDP_COMPONENT_COLOR0]	= { "color0", &ddp_color0 },
> +	[DDP_COMPONENT_COLOR1]	= { "color1", &ddp_color1 },
> +	[DDP_COMPONENT_DPI0]	= { "dpi0", &ddp_dpi0 },
> +	[DDP_COMPONENT_DSI0]	= { "dsi0", &ddp_dsi0 },
> +	[DDP_COMPONENT_GAMMA]	= { "gamma", &ddp_gamma },
> +	[DDP_COMPONENT_OD]	= { "od", &ddp_od },
> +	[DDP_COMPONENT_OVL0]	= { "ovl0", &ddp_ovl0 },
> +	[DDP_COMPONENT_OVL1]	= { "ovl1", &ddp_ovl1 },
> +	[DDP_COMPONENT_PWM0]	= { "pwm0", &ddp_pwm0 },
> +	[DDP_COMPONENT_RDMA0]	= { "rdma0", &ddp_rdma0 },
> +	[DDP_COMPONENT_RDMA1]	= { "rdma1", &ddp_rdma1 },
> +	[DDP_COMPONENT_UFOE]	= { "ufoe", &ddp_ufoe },
> +};
> +
> +enum mtk_ddp_comp_type mtk_ddp_comp_get_type(const char *comp_name)
> +{
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(mtk_ddp_matches); i++) {
> +		if (strcasecmp(comp_name, mtk_ddp_matches[i].name) == 0)
> +			return i;
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +int mtk_ddp_comp_init(struct device *dev, struct mtk_ddp_comp *comp,
> +		      enum mtk_ddp_comp_type comp_type)
> +{
> +	struct device_node *node;
> +	int index;
> +
> +	if (comp_type < 0 || comp_type >= DDP_COMPONENT_TYPE_MAX)
> +		return -EINVAL;
> +
> +	comp->funcs = mtk_ddp_matches[comp_type].funcs;
> +
> +	if (comp_type == DDP_COMPONENT_DPI0 ||
> +	    comp_type == DDP_COMPONENT_DSI0 ||
> +	    comp_type == DDP_COMPONENT_PWM0)
> +		return 0;
> +
> +	index = of_property_match_string(dev->of_node, "component-names",
> +					 mtk_ddp_matches[comp_type].name);
> +	if (index < 0)
> +		return 0;
> +
> +	node = of_parse_phandle(dev->of_node, "components", index);
> +	if (!node)
> +		return 0;
> +
> +	comp->regs = of_iomap(node, 0);
> +	comp->irq = of_irq_get(node, 0);
> +	comp->clk = of_clk_get(node, 0);
> +	if (IS_ERR(comp->clk))
> +		comp->clk = NULL;
> +
> +	of_node_put(node);
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> new file mode 100644
> index 0000000..9ebb969
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> @@ -0,0 +1,61 @@
> +/*
> + * Copyright (c) 2015 MediaTek Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#ifndef MTK_DRM_DDP_COMP_H
> +#define MTK_DRM_DDP_COMP_H
> +
> +enum mtk_ddp_comp_type {
> +	DDP_COMPONENT_AAL,
> +	DDP_COMPONENT_COLOR0,
> +	DDP_COMPONENT_COLOR1,
> +	DDP_COMPONENT_DPI0,
> +	DDP_COMPONENT_DSI0,
> +	DDP_COMPONENT_GAMMA,
> +	DDP_COMPONENT_OD,
> +	DDP_COMPONENT_OVL0,
> +	DDP_COMPONENT_OVL1,
> +	DDP_COMPONENT_PWM0,
> +	DDP_COMPONENT_RDMA0,
> +	DDP_COMPONENT_RDMA1,
> +	DDP_COMPONENT_UFOE,
> +	DDP_COMPONENT_TYPE_MAX,
> +};
> +
> +struct mtk_ddp_comp_funcs {
> +	enum mtk_ddp_comp_type comp_type;
> +	void (*comp_config)(void __iomem *ovl_base,
> +			unsigned int w, unsigned int h);
> +	void (*comp_power_on)(void __iomem *ovl_base);
> +	void (*comp_power_off)(void __iomem *ovl_base);
> +	void (*comp_enable_vblank)(void __iomem *ovl_base);
> +	void (*comp_disable_vblank)(void __iomem *ovl_base);
> +	void (*comp_clear_vblank)(void __iomem *ovl_base);
> +	void (*comp_layer_on)(void __iomem *ovl_base, unsigned int idx);
> +	void (*comp_layer_off)(void __iomem *ovl_base, unsigned int idx);
> +	void (*comp_layer_config)(void __iomem *ovl_base, unsigned int idx,
> +			unsigned int addr, unsigned int pitch, unsigned int fmt,
> +			int x, int y, unsigned int size);
> +};
> +
> +struct mtk_ddp_comp {
> +	struct clk *clk;
> +	void __iomem *regs;
> +	int irq;
> +	const struct mtk_ddp_comp_funcs *funcs;
> +};
> +
> +enum mtk_ddp_comp_type mtk_ddp_comp_get_type(const char *comp_name);
> +int mtk_ddp_comp_init(struct device *dev, struct mtk_ddp_comp *comp,
> +		      enum mtk_ddp_comp_type comp_type);
> +
> +#endif /* MTK_DRM_DDP_COMP_H */
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> new file mode 100644
> index 0000000..fc071fe
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -0,0 +1,471 @@
> +/*
> + * Copyright (c) 2015 MediaTek Inc.
> + * Author: YT SHEN <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <drm/drmP.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_crtc_helper.h>
> +#include <drm/drm_gem.h>
> +#include <linux/component.h>
> +#include <linux/dma-iommu.h>
> +#include <linux/of_address.h>
> +#include <linux/of_platform.h>
> +#include <linux/pm_runtime.h>
> +#include <soc/mediatek/smi.h>
> +
> +#include "mtk_drm_crtc.h"
> +#include "mtk_drm_ddp_comp.h"
> +#include "mtk_drm_drv.h"
> +#include "mtk_drm_fb.h"
> +#include "mtk_drm_gem.h"
> +
> +#define DRIVER_NAME "mediatek"
> +#define DRIVER_DESC "Mediatek SoC DRM"
> +#define DRIVER_DATE "20150513"
> +#define DRIVER_MAJOR 1
> +#define DRIVER_MINOR 0
> +
> +static int mtk_atomic_commit(struct drm_device *dev,
> +			     struct drm_atomic_state *state,
> +			     bool async)
> +{
> +	return drm_atomic_helper_commit(dev, state, false);

This isn't a proper async commit operation, it will still block userspace
unecessarily. See e.g. the vc4 patches for a proper one.

> +}
> +
> +static const struct drm_mode_config_funcs mtk_drm_mode_config_funcs = {
> +	.fb_create = mtk_drm_mode_fb_create,
> +	.atomic_check = drm_atomic_helper_check,
> +	.atomic_commit = mtk_atomic_commit,
> +};
> +
> +static const enum mtk_ddp_comp_type mtk_ddp_main[] = {
> +	DDP_COMPONENT_OVL0,
> +	DDP_COMPONENT_COLOR0,
> +	DDP_COMPONENT_AAL,
> +	DDP_COMPONENT_OD,
> +	DDP_COMPONENT_RDMA0,
> +	DDP_COMPONENT_UFOE,
> +	DDP_COMPONENT_DSI0,
> +	DDP_COMPONENT_PWM0,
> +};
> +
> +static const enum mtk_ddp_comp_type mtk_ddp_ext[] = {
> +	DDP_COMPONENT_OVL1,
> +	DDP_COMPONENT_COLOR1,
> +	DDP_COMPONENT_GAMMA,
> +	DDP_COMPONENT_RDMA1,
> +	DDP_COMPONENT_DPI0,
> +};
> +
> +static int mtk_drm_kms_init(struct drm_device *dev)
> +{
> +	struct mtk_drm_private *private = dev->dev_private;
> +	struct device_node *node;
> +	struct platform_device *pdev;
> +	int i;
> +	int err;
> +
> +	drm_mode_config_init(dev);
> +
> +	dev->mode_config.min_width = 64;
> +	dev->mode_config.min_height = 64;
> +
> +	/*
> +	 * set max width and height as default value(4096x4096).
> +	 * this value would be used to check framebuffer size limitation
> +	 * at drm_mode_addfb().
> +	 */
> +	dev->mode_config.max_width = 4096;
> +	dev->mode_config.max_height = 4096;
> +	dev->mode_config.funcs = &mtk_drm_mode_config_funcs;
> +
> +	/*
> +	 * We currently support two fixed data streams,
> +	 * OVL0 -> COLOR0 -> AAL -> OD -> RDMA0 -> UFOE -> DSI0
> +	 * and OVL1 -> COLOR1 -> GAMMA -> RDMA1 -> DPI0.
> +	 */
> +	private->path_len[0] = ARRAY_SIZE(mtk_ddp_main);
> +	private->path[0] = mtk_ddp_main;
> +	private->path_len[1] = ARRAY_SIZE(mtk_ddp_ext);
> +	private->path[1] = mtk_ddp_ext;
> +
> +	err = component_bind_all(dev->dev, dev);
> +	if (err)
> +		goto err_crtc;
> +
> +	/*
> +	 * We don't use the drm_irq_install() helpers provided by the DRM
> +	 * core, so we need to set this manually in order to allow the
> +	 * DRM_IOCTL_WAIT_VBLANK to operate correctly.
> +	 */
> +	dev->irq_enabled = true;
> +	err = drm_vblank_init(dev, MAX_CRTC);
> +	if (err < 0)
> +		goto err_unbind;
> +
> +	for (i = 0; i < MAX_CRTC; i++) {
> +		node = of_parse_phandle(dev->dev->of_node, "larb", i);
> +		if (!node)
> +			break;
> +
> +		pdev = of_find_device_by_node(node);
> +		of_node_put(node);
> +		if (WARN_ON(!pdev))
> +			goto err_vblank_cleanup;
> +
> +		private->larb_dev[i] = &pdev->dev;
> +	}
> +
> +	for (i = 0; i < MAX_CRTC; i++) {
> +		if (!private->larb_dev[i])
> +			break;
> +
> +		err = mtk_smi_larb_get(private->larb_dev[i]);
> +		if (err) {
> +			DRM_ERROR("mtk_smi_larb_get fail %d\n", err);
> +			goto err_larb_get;
> +		}
> +	}
> +
> +	drm_kms_helper_poll_init(dev);
> +	drm_mode_config_reset(dev);
> +
> +	return 0;
> +
> +err_larb_get:
> +	for (i = i - 1; i >= 0; i--)
> +		mtk_smi_larb_put(private->larb_dev[i]);
> +err_vblank_cleanup:
> +	drm_kms_helper_poll_fini(dev);
> +	drm_vblank_cleanup(dev);
> +err_unbind:
> +	component_unbind_all(dev->dev, dev);
> +err_crtc:
> +	drm_mode_config_cleanup(dev);
> +
> +	return err;
> +}
> +
> +static void mtk_drm_kms_deinit(struct drm_device *dev)
> +{
> +	drm_kms_helper_poll_fini(dev);
> +
> +	drm_vblank_cleanup(dev);
> +	drm_mode_config_cleanup(dev);
> +}
> +
> +static int mtk_drm_load(struct drm_device *dev, unsigned long flags)
> +{
> +	struct mtk_drm_private *priv;
> +	struct device_node *config_node, *mutex_node;
> +	struct platform_device *mutex_pdev;
> +
> +	priv = devm_kzalloc(dev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	dev->dev_private = priv;
> +	platform_set_drvdata(dev->platformdev, dev);
> +
> +	config_node = of_parse_phandle(dev->dev->of_node, "mmsys-config", 0);
> +	if (!config_node) {
> +		dev_err(dev->dev, "Failed to get mmsys-config node\n");
> +		return -EINVAL;
> +	}
> +
> +	priv->config_regs = of_iomap(config_node, 0);
> +	if (!priv->config_regs) {
> +		dev_err(dev->dev, "Failed to map mmsys-config registers\n");
> +		return -EINVAL;
> +	}
> +
> +	mutex_node = of_parse_phandle(dev->dev->of_node, "disp-mutex", 0);
> +	if (!mutex_node) {
> +		dev_err(dev->dev, "Failed to get disp-mutex node\n");
> +		return -EINVAL;
> +	}
> +
> +	mutex_pdev = of_find_device_by_node(mutex_node);
> +	if (!mutex_pdev) {
> +		dev_err(dev->dev, "Failed to find disp-mutex device\n");
> +		return -EPROBE_DEFER;
> +	}
> +	priv->mutex_dev = &mutex_pdev->dev;
> +
> +	return mtk_drm_kms_init(dev);
> +}
> +
> +static int mtk_drm_unload(struct drm_device *dev)
> +{
> +	mtk_drm_kms_deinit(dev);
> +	dev->dev_private = NULL;
> +
> +	return 0;
> +}
> +
> +static const struct vm_operations_struct mtk_drm_gem_vm_ops = {
> +	.open = drm_gem_vm_open,
> +	.close = drm_gem_vm_close,
> +};
> +
> +static const struct file_operations mtk_drm_fops = {
> +	.owner = THIS_MODULE,
> +	.open = drm_open,
> +	.release = drm_release,
> +	.unlocked_ioctl = drm_ioctl,
> +	.mmap = mtk_drm_gem_mmap,
> +	.poll = drm_poll,
> +	.read = drm_read,
> +#ifdef CONFIG_COMPAT
> +	.compat_ioctl = drm_compat_ioctl,
> +#endif
> +};
> +
> +static struct drm_driver mtk_drm_driver = {
> +	.driver_features = DRIVER_MODESET | DRIVER_GEM,
> +	.load = mtk_drm_load,
> +	.unload = mtk_drm_unload,
> +	.set_busid = drm_platform_set_busid,
> +
> +	.get_vblank_counter = drm_vblank_count,
> +	.enable_vblank = mtk_drm_crtc_enable_vblank,
> +	.disable_vblank = mtk_drm_crtc_disable_vblank,
> +
> +	.gem_free_object = mtk_drm_gem_free_object,
> +	.gem_vm_ops = &mtk_drm_gem_vm_ops,
> +	.dumb_create = mtk_drm_gem_dumb_create,
> +	.dumb_map_offset = mtk_drm_gem_dumb_map_offset,
> +	.dumb_destroy = drm_gem_dumb_destroy,
> +
> +	.fops = &mtk_drm_fops,
> +
> +	.set_busid = drm_platform_set_busid,
> +
> +	.name = DRIVER_NAME,
> +	.desc = DRIVER_DESC,
> +	.date = DRIVER_DATE,
> +	.major = DRIVER_MAJOR,
> +	.minor = DRIVER_MINOR,
> +};
> +
> +static int compare_of(struct device *dev, void *data)
> +{
> +	return dev->of_node == data;
> +}
> +
> +static int mtk_drm_bind(struct device *dev)
> +{
> +	return drm_platform_init(&mtk_drm_driver, to_platform_device(dev));
> +}
> +
> +static void mtk_drm_unbind(struct device *dev)
> +{
> +	drm_put_dev(platform_get_drvdata(to_platform_device(dev)));
> +}
> +
> +static const struct component_master_ops mtk_drm_ops = {
> +	.bind		= mtk_drm_bind,
> +	.unbind		= mtk_drm_unbind,
> +};
> +
> +static int mtk_drm_probe(struct platform_device *pdev)
> +{
> +	struct device_node *np = pdev->dev.of_node;
> +	struct component_match *match = NULL;
> +	unsigned i;
> +	int ret;
> +
> +	for (i = 0; ; i++) {
> +		struct device_node *node;
> +		const char *comp_name;
> +		int comp_type;
> +
> +		node = of_parse_phandle(np, "components", i);
> +		if (!node)
> +			break;
> +
> +		ret = of_property_read_string_index(np, "component-names", i,
> +						    &comp_name);
> +		if (ret) {
> +			dev_err(&pdev->dev, "Failed to get component name\n");
> +			of_node_put(node);
> +			break;
> +		}
> +
> +		comp_type = mtk_ddp_comp_get_type(comp_name);
> +		if (comp_type < 0) {
> +			dev_warn(&pdev->dev, "Skipping unknown component %s\n",
> +				 comp_name);
> +			of_node_put(node);
> +			continue;
> +		}
> +
> +		if (!of_device_is_available(node)) {
> +			dev_dbg(&pdev->dev, "Skipping disabled component %s\n",
> +				comp_name);
> +			of_node_put(node);
> +			continue;
> +		}
> +
> +		/*
> +		 * Currently only the OVL and DSI blocks have separate
> +		 * component platform drivers.
> +		 */
> +		if (comp_type == DDP_COMPONENT_OVL0 ||
> +		    comp_type == DDP_COMPONENT_OVL1 ||
> +		    comp_type == DDP_COMPONENT_DSI0) {
> +			dev_info(&pdev->dev, "Adding component match for %s\n",
> +				 comp_name);
> +			component_match_add(&pdev->dev, &match, compare_of,
> +					    node);
> +		}
> +		of_node_put(node);
> +	}
> +
> +	for (i = 0; i < MAX_CONNECTOR; i++) {
> +		struct device_node *node;
> +
> +		node = of_parse_phandle(np, "connectors", i);
> +		if (!node)
> +			break;
> +
> +		component_match_add(&pdev->dev, &match, compare_of, node);
> +		of_node_put(node);
> +	}
> +
> +	for (i = 0; i < MAX_CRTC; i++) {
> +		struct device_node *node;
> +
> +		node = of_parse_phandle(np, "crtcs", i);
> +		if (!node)
> +			break;
> +
> +		component_match_add(&pdev->dev, &match, compare_of, node);
> +		of_node_put(node);
> +	}
> +
> +	return component_master_add_with_match(&pdev->dev, &mtk_drm_ops, match);
> +}
> +
> +static int mtk_drm_remove(struct platform_device *pdev)
> +{
> +	component_master_del(&pdev->dev, &mtk_drm_ops);
> +
> +	return 0;
> +}
> +
> +#ifdef CONFIG_PM_SLEEP
> +static int mtk_drm_sys_suspend(struct device *dev)
> +{
> +	struct drm_device *ddev = dev_get_drvdata(dev);
> +	struct mtk_drm_private *private = ddev->dev_private;
> +	struct drm_connector *conn;
> +	int i;
> +
> +	drm_kms_helper_poll_disable(ddev);
> +
> +	drm_modeset_lock_all(ddev);
> +	list_for_each_entry(conn, &ddev->mode_config.connector_list, head) {
> +		int old_dpms = conn->dpms;
> +
> +		if (conn->funcs->dpms)
> +			conn->funcs->dpms(conn, DRM_MODE_DPMS_OFF);
> +
> +		/* Set the old mode back to the connector for resume */
> +		conn->dpms = old_dpms;
> +	}
> +	drm_modeset_unlock_all(ddev);
> +
> +	for (i = 0; i < MAX_CRTC; i++) {
> +		if (!private->larb_dev[i])
> +			break;
> +
> +		mtk_smi_larb_put(private->larb_dev[i]);
> +	}
> +
> +	DRM_INFO("mtk_drm_sys_suspend\n");
> +	return 0;
> +}
> +
> +static int mtk_drm_sys_resume(struct device *dev)
> +{
> +	struct drm_device *ddev = dev_get_drvdata(dev);
> +	struct mtk_drm_private *private = ddev->dev_private;
> +	struct drm_connector *conn;
> +	int i;
> +	int err;
> +
> +	for (i = 0; i < MAX_CRTC; i++) {
> +		if (!private->larb_dev[i])
> +			break;
> +
> +		err = mtk_smi_larb_get(private->larb_dev[i]);
> +		if (err) {
> +			DRM_ERROR("mtk_smi_larb_get fail %d\n", err);
> +			return err;
> +		}
> +	}
> +
> +	drm_modeset_lock_all(ddev);
> +	list_for_each_entry(conn, &ddev->mode_config.connector_list, head) {
> +		int desired_mode = conn->dpms;
> +
> +		/*
> +		 * at suspend time, we save dpms to connector->dpms,
> +		 * restore the old_dpms, and at current time, the connector
> +		 * dpms status must be DRM_MODE_DPMS_OFF.
> +		 */
> +		conn->dpms = DRM_MODE_DPMS_OFF;
> +
> +		/*
> +		 * If the connector has been disconnected during suspend,
> +		 * disconnect it from the encoder and leave it off. We'll notify
> +		 * userspace at the end.
> +		 */
> +		if (conn->funcs->dpms)
> +			conn->funcs->dpms(conn, desired_mode);
> +	}
> +	drm_modeset_unlock_all(ddev);
> +
> +	drm_kms_helper_poll_enable(ddev);
> +
> +	DRM_INFO("mtk_drm_sys_resume\n");
> +	return 0;
> +}
> +
> +SIMPLE_DEV_PM_OPS(mtk_drm_pm_ops, mtk_drm_sys_suspend, mtk_drm_sys_resume);
> +#endif
> +
> +static const struct of_device_id mtk_drm_of_ids[] = {
> +	{ .compatible = "mediatek,mt8173-disp", },
> +	{ }
> +};
> +
> +static struct platform_driver mtk_drm_platform_driver = {
> +	.probe	= mtk_drm_probe,
> +	.remove	= mtk_drm_remove,
> +	.driver	= {
> +		.owner	= THIS_MODULE,
> +		.name	= "mediatek-drm",
> +		.of_match_table = mtk_drm_of_ids,
> +#ifdef CONFIG_PM_SLEEP
> +		.pm     = &mtk_drm_pm_ops,
> +#endif
> +	},
> +};
> +
> +module_platform_driver(mtk_drm_platform_driver);
> +
> +MODULE_AUTHOR("YT SHEN <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>");
> +MODULE_DESCRIPTION("Mediatek SoC DRM driver");
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> new file mode 100644
> index 0000000..ded8d0e
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> @@ -0,0 +1,46 @@
> +/*
> + * Copyright (c) 2015 MediaTek Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#ifndef MTK_DRM_DRV_H
> +#define MTK_DRM_DRV_H
> +
> +#include "mtk_drm_ddp_comp.h"
> +
> +#define MAX_CRTC	2
> +#define MAX_CONNECTOR	2
> +
> +struct device;
> +struct drm_crtc;
> +struct drm_fb_helper;
> +struct drm_property;
> +struct regmap;
> +
> +struct mtk_drm_private {
> +	struct drm_fb_helper *fb_helper;
> +
> +	/*
> +	 * created crtc object would be contained at this array and
> +	 * this array is used to be aware of which crtc did it request vblank.
> +	 */
> +	struct drm_crtc *crtc[MAX_CRTC];
> +	struct drm_property *plane_zpos_property;
> +	unsigned int pipe;
> +
> +	struct device *larb_dev[MAX_CRTC];
> +	void __iomem *config_regs;
> +	struct device *mutex_dev;
> +	unsigned int path_len[MAX_CRTC];
> +	const enum mtk_ddp_comp_type *path[MAX_CRTC];
> +};
> +
> +#endif /* MTK_DRM_DRV_H */
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_fb.c b/drivers/gpu/drm/mediatek/mtk_drm_fb.c
> new file mode 100644
> index 0000000..dfa931b
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_fb.c
> @@ -0,0 +1,151 @@
> +/*
> + * Copyright (c) 2015 MediaTek Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <drm/drmP.h>
> +#include <drm/drm_crtc_helper.h>
> +#include <drm/drm_fb_helper.h>
> +#include <drm/drm_gem.h>
> +
> +#include "mtk_drm_drv.h"
> +#include "mtk_drm_fb.h"
> +#include "mtk_drm_gem.h"
> +
> +/*
> + * mtk specific framebuffer structure.
> + *
> + * @fb: drm framebuffer object.
> + * @gem_obj: array of gem objects.
> + */
> +struct mtk_drm_fb {
> +	struct drm_framebuffer	base;
> +	struct drm_gem_object	*gem_obj[MAX_FB_OBJ];
> +};
> +
> +#define to_mtk_fb(x) container_of(x, struct mtk_drm_fb, base)
> +
> +struct drm_gem_object *mtk_fb_get_gem_obj(struct drm_framebuffer *fb,
> +					  unsigned int plane)
> +{
> +	struct mtk_drm_fb *mtk_fb = to_mtk_fb(fb);
> +
> +	if (plane >= MAX_FB_OBJ)
> +		return NULL;
> +
> +	return mtk_fb->gem_obj[plane];
> +}
> +
> +static int mtk_drm_fb_create_handle(struct drm_framebuffer *fb,
> +				    struct drm_file *file_priv,
> +				    unsigned int *handle)
> +{
> +	struct mtk_drm_fb *mtk_fb = to_mtk_fb(fb);
> +
> +	return drm_gem_handle_create(file_priv, mtk_fb->gem_obj[0], handle);
> +}
> +
> +static void mtk_drm_fb_destroy(struct drm_framebuffer *fb)
> +{
> +	unsigned int i;
> +	struct mtk_drm_fb *mtk_fb = to_mtk_fb(fb);
> +	struct drm_gem_object *gem;
> +	int nr = drm_format_num_planes(fb->pixel_format);
> +
> +	drm_framebuffer_cleanup(fb);
> +
> +	for (i = 0; i < nr; i++) {
> +		gem = mtk_fb->gem_obj[i];
> +		drm_gem_object_unreference_unlocked(gem);
> +	}
> +
> +	kfree(mtk_fb);
> +}
> +
> +static const struct drm_framebuffer_funcs mtk_drm_fb_funcs = {
> +	.create_handle = mtk_drm_fb_create_handle,
> +	.destroy = mtk_drm_fb_destroy,
> +};
> +
> +static struct mtk_drm_fb *mtk_drm_framebuffer_init(struct drm_device *dev,
> +						   struct drm_mode_fb_cmd2 *mode,
> +						   struct drm_gem_object **obj)
> +{
> +	struct mtk_drm_fb *mtk_fb;
> +	unsigned int i;
> +	int ret;
> +
> +	mtk_fb = kzalloc(sizeof(*mtk_fb), GFP_KERNEL);
> +	if (!mtk_fb)
> +		return ERR_PTR(-ENOMEM);
> +
> +	drm_helper_mode_fill_fb_struct(&mtk_fb->base, mode);
> +
> +	for (i = 0; i < drm_format_num_planes(mode->pixel_format); i++)
> +		mtk_fb->gem_obj[i] = obj[i];
> +
> +	ret = drm_framebuffer_init(dev, &mtk_fb->base, &mtk_drm_fb_funcs);
> +	if (ret) {
> +		DRM_ERROR("failed to initialize framebuffer\n");
> +		kfree(mtk_fb);
> +		return ERR_PTR(ret);
> +	}
> +
> +	return mtk_fb;
> +}
> +
> +struct drm_framebuffer *mtk_drm_mode_fb_create(struct drm_device *dev,
> +					       struct drm_file *file,
> +					       struct drm_mode_fb_cmd2 *cmd)
> +{
> +	unsigned int hsub, vsub, i;
> +	struct mtk_drm_fb *mtk_fb;
> +	struct drm_gem_object *gem[MAX_FB_OBJ];
> +	int err;
> +
> +	hsub = drm_format_horz_chroma_subsampling(cmd->pixel_format);
> +	vsub = drm_format_vert_chroma_subsampling(cmd->pixel_format);
> +	for (i = 0; i < drm_format_num_planes(cmd->pixel_format); i++) {
> +		unsigned int width = cmd->width / (i ? hsub : 1);
> +		unsigned int height = cmd->height / (i ? vsub : 1);
> +		unsigned int size, bpp;
> +
> +		gem[i] = drm_gem_object_lookup(dev, file, cmd->handles[i]);
> +		if (!gem[i]) {
> +			err = -ENOENT;
> +			goto unreference;
> +		}
> +
> +		bpp = drm_format_plane_cpp(cmd->pixel_format, i);
> +		size = (height - 1) * cmd->pitches[i] + width * bpp;
> +		size += cmd->offsets[i];
> +
> +		if (gem[i]->size < size) {
> +			drm_gem_object_unreference_unlocked(gem[i]);
> +			err = -EINVAL;
> +			goto unreference;
> +		}
> +	}
> +
> +	mtk_fb = mtk_drm_framebuffer_init(dev, cmd, gem);
> +	if (IS_ERR(mtk_fb)) {
> +		err = PTR_ERR(mtk_fb);
> +		goto unreference;
> +	}
> +
> +	return &mtk_fb->base;
> +
> +unreference:
> +	while (i--)
> +		drm_gem_object_unreference_unlocked(gem[i]);
> +
> +	return ERR_PTR(err);
> +}
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_fb.h b/drivers/gpu/drm/mediatek/mtk_drm_fb.h
> new file mode 100644
> index 0000000..9ce7307
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_fb.h
> @@ -0,0 +1,29 @@
> +/*
> + * Copyright (c) 2015 MediaTek Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#ifndef MTK_DRM_FB_H
> +#define MTK_DRM_FB_H
> +
> +#define MAX_FB_OBJ	3
> +
> +struct drm_gem_object *mtk_fb_get_gem_obj(struct drm_framebuffer *fb,
> +					  unsigned int plane);
> +struct drm_framebuffer *mtk_drm_mode_fb_create(struct drm_device *dev,
> +					       struct drm_file *file,
> +					       struct drm_mode_fb_cmd2 *cmd);
> +
> +void mtk_drm_mode_output_poll_changed(struct drm_device *dev);
> +int mtk_fbdev_create(struct drm_device *dev);
> +void mtk_fbdev_destroy(struct drm_device *dev);
> +
> +#endif /* MTK_DRM_FB_H */
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> new file mode 100644
> index 0000000..d5adfd9
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> @@ -0,0 +1,207 @@
> +/*
> + * Copyright (c) 2015 MediaTek Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <drm/drmP.h>
> +#include <drm/drm_gem.h>
> +
> +#include "mtk_drm_gem.h"
> +
> +struct mtk_drm_gem_obj *mtk_drm_gem_init(struct drm_device *dev,
> +					 unsigned long size)
> +{
> +	struct mtk_drm_gem_obj *mtk_gem_obj;
> +	int ret;
> +
> +	size = round_up(size, PAGE_SIZE);
> +
> +	mtk_gem_obj = kzalloc(sizeof(*mtk_gem_obj), GFP_KERNEL);
> +	if (!mtk_gem_obj)
> +		return ERR_PTR(-ENOMEM);
> +
> +	ret = drm_gem_object_init(dev, &mtk_gem_obj->base, size);
> +	if (ret < 0) {
> +		DRM_ERROR("failed to initialize gem object\n");
> +		kfree(mtk_gem_obj);
> +		return ERR_PTR(ret);
> +	}
> +
> +	return mtk_gem_obj;
> +}
> +
> +struct mtk_drm_gem_obj *mtk_drm_gem_create(struct drm_device *dev,
> +					   unsigned long size, bool alloc_kmap)
> +{
> +	struct mtk_drm_gem_obj *mtk_gem;
> +	struct drm_gem_object *obj;
> +	int ret;
> +
> +	mtk_gem = mtk_drm_gem_init(dev, size);
> +	if (IS_ERR(mtk_gem))
> +		return ERR_CAST(mtk_gem);
> +
> +	obj = &mtk_gem->base;
> +
> +	init_dma_attrs(&mtk_gem->dma_attrs);
> +	dma_set_attr(DMA_ATTR_WRITE_COMBINE, &mtk_gem->dma_attrs);
> +
> +	if (!alloc_kmap)
> +		dma_set_attr(DMA_ATTR_NO_KERNEL_MAPPING, &mtk_gem->dma_attrs);
> +
> +	mtk_gem->cookie = dma_alloc_attrs(dev->dev, obj->size,
> +				(dma_addr_t *)&mtk_gem->dma_addr, GFP_KERNEL,
> +				&mtk_gem->dma_attrs);
> +	if (!mtk_gem->cookie) {
> +		DRM_ERROR("failed to allocate %zx byte dma buffer", obj->size);
> +		ret = -ENOMEM;
> +		goto err_gem_free;
> +	}
> +
> +	if (alloc_kmap)
> +		mtk_gem->kvaddr = mtk_gem->cookie;
> +
> +	DRM_INFO("cookie = %p dma_addr = %llx\n",
> +			mtk_gem->cookie, mtk_gem->dma_addr);
> +
> +	return mtk_gem;
> +
> +err_gem_free:
> +	drm_gem_object_free(&mtk_gem->base.refcount);
> +	return ERR_PTR(ret);
> +}
> +
> +void mtk_drm_gem_free_object(struct drm_gem_object *obj)
> +{
> +	struct mtk_drm_gem_obj *mtk_gem = to_mtk_gem_obj(obj);
> +
> +	drm_gem_free_mmap_offset(obj);
> +
> +	/* release file pointer to gem object. */
> +	drm_gem_object_release(obj);
> +
> +	dma_free_attrs(obj->dev->dev, obj->size, mtk_gem->cookie,
> +		       mtk_gem->dma_addr, &mtk_gem->dma_attrs);
> +
> +	kfree(mtk_gem);
> +}
> +
> +int mtk_drm_gem_dumb_create(struct drm_file *file_priv, struct drm_device *dev,
> +			    struct drm_mode_create_dumb *args)
> +{
> +	struct mtk_drm_gem_obj *mtk_gem;
> +	int ret;
> +
> +	args->pitch = args->width * DIV_ROUND_UP(args->bpp, 8);
> +	args->size = args->pitch * args->height;
> +
> +	mtk_gem = mtk_drm_gem_create(dev, args->size, false);
> +	if (IS_ERR(mtk_gem))
> +		return PTR_ERR(mtk_gem);
> +
> +	/*
> +	 * allocate a id of idr table where the obj is registered
> +	 * and handle has the id what user can see.
> +	 */
> +	ret = drm_gem_handle_create(file_priv, &mtk_gem->base, &args->handle);
> +	if (ret)
> +		goto err_handle_create;
> +
> +	/* drop reference from allocate - handle holds it now. */
> +	drm_gem_object_unreference_unlocked(&mtk_gem->base);
> +
> +	return 0;
> +
> +err_handle_create:
> +	mtk_drm_gem_free_object(&mtk_gem->base);
> +	return ret;
> +}
> +
> +int mtk_drm_gem_dumb_map_offset(struct drm_file *file_priv,
> +				struct drm_device *dev, uint32_t handle,
> +				uint64_t *offset)
> +{
> +	struct drm_gem_object *obj;
> +	int ret;
> +
> +	mutex_lock(&dev->struct_mutex);
> +
> +	obj = drm_gem_object_lookup(dev, file_priv, handle);
> +	if (!obj) {
> +		DRM_ERROR("failed to lookup gem object.\n");
> +		ret = -EINVAL;
> +		goto unlock;
> +	}
> +
> +	ret = drm_gem_create_mmap_offset(obj);
> +	if (ret)
> +		goto out;
> +
> +	*offset = drm_vma_node_offset_addr(&obj->vma_node);
> +	DRM_DEBUG_KMS("offset = 0x%llx\n", *offset);
> +
> +out:
> +	drm_gem_object_unreference(obj);
> +unlock:
> +	mutex_unlock(&dev->struct_mutex);
> +	return ret;
> +}
> +
> +static int mtk_drm_gem_object_mmap(struct drm_gem_object *obj,
> +				   struct vm_area_struct *vma)
> +
> +{
> +	int ret;
> +	struct mtk_drm_gem_obj *mtk_gem = to_mtk_gem_obj(obj);
> +	struct drm_device *drm = obj->dev;
> +
> +	/*
> +	 * dma_alloc_attrs() allocated a struct page table for rk_obj, so clear
> +	 * VM_PFNMAP flag that was set by drm_gem_mmap_obj()/drm_gem_mmap().
> +	 */
> +	vma->vm_flags &= ~VM_PFNMAP;
> +	vma->vm_pgoff = 0;
> +
> +	ret = dma_mmap_attrs(drm->dev, vma, mtk_gem->cookie, mtk_gem->dma_addr,
> +			     obj->size, &mtk_gem->dma_attrs);
> +	if (ret)
> +		drm_gem_vm_close(vma);
> +
> +	return ret;
> +}
> +
> +int mtk_drm_gem_mmap_buf(struct drm_gem_object *obj, struct vm_area_struct *vma)
> +{
> +	struct drm_device *drm = obj->dev;
> +	int ret;
> +
> +	mutex_lock(&drm->struct_mutex);
> +	ret = drm_gem_mmap_obj(obj, obj->size, vma);
> +	mutex_unlock(&drm->struct_mutex);
> +	if (ret)
> +		return ret;
> +
> +	return mtk_drm_gem_object_mmap(obj, vma);
> +}
> +
> +int mtk_drm_gem_mmap(struct file *filp, struct vm_area_struct *vma)
> +{
> +	struct drm_gem_object *obj;
> +	int ret;
> +
> +	ret = drm_gem_mmap(filp, vma);
> +	if (ret)
> +		return ret;
> +
> +	obj = vma->vm_private_data;
> +
> +	return mtk_drm_gem_object_mmap(obj, vma);
> +}
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.h b/drivers/gpu/drm/mediatek/mtk_drm_gem.h
> new file mode 100644
> index 0000000..fb7953e
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.h
> @@ -0,0 +1,56 @@
> +/*
> + * Copyright (c) 2015 MediaTek Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#ifndef _MTK_DRM_GEM_H_
> +#define _MTK_DRM_GEM_H_
> +
> +#include <drm/drm_gem.h>
> +
> +/*
> + * mtk drm buffer structure.
> + *
> + * @base: a gem object.
> + *	- a new handle to this gem object would be created
> + *	by drm_gem_handle_create().
> + * @cookie: the return value of dma_alloc_attrs(), keep it for dma_free_attrs()
> + * @kvaddr: kernel virtual address of gem buffer.
> + * @dma_addr: dma address of gem buffer.
> + * @dma_attrs: dma attributes of gem buffer.
> + *
> + * P.S. this object would be transferred to user as kms_bo.handle so
> + *	user can access the buffer through kms_bo.handle.
> + */
> +struct mtk_drm_gem_obj {
> +	struct drm_gem_object	base;
> +	void __iomem		*cookie;
> +	void __iomem		*kvaddr;
> +	dma_addr_t		dma_addr;
> +	struct dma_attrs	dma_attrs;
> +};
> +
> +#define to_mtk_gem_obj(x)	container_of(x, struct mtk_drm_gem_obj, base)
> +
> +struct mtk_drm_gem_obj *mtk_drm_gem_init(struct drm_device *dev,
> +		unsigned long size);
> +void mtk_drm_gem_free_object(struct drm_gem_object *gem);
> +struct mtk_drm_gem_obj *mtk_drm_gem_create(struct drm_device *dev,
> +		unsigned long size, bool alloc_kmap);
> +int mtk_drm_gem_dumb_create(struct drm_file *file_priv,
> +		struct drm_device *dev, struct drm_mode_create_dumb *args);
> +int mtk_drm_gem_dumb_map_offset(struct drm_file *file_priv,
> +		struct drm_device *dev, uint32_t handle, uint64_t *offset);
> +int mtk_drm_gem_mmap(struct file *filp, struct vm_area_struct *vma);
> +int mtk_drm_gem_mmap_buf(struct drm_gem_object *obj,
> +		struct vm_area_struct *vma);
> +
> +#endif
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> new file mode 100644
> index 0000000..9bbf4da
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> @@ -0,0 +1,193 @@
> +/*
> + * Copyright (c) 2015 MediaTek Inc.
> + * Author: CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <drm/drmP.h>
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_plane_helper.h>
> +#include <linux/dma-buf.h>
> +#include <linux/reservation.h>
> +
> +#include "mtk_drm_crtc.h"
> +#include "mtk_drm_ddp_comp.h"
> +#include "mtk_drm_drv.h"
> +#include "mtk_drm_fb.h"
> +#include "mtk_drm_gem.h"
> +#include "mtk_drm_plane.h"
> +
> +static const uint32_t formats[] = {
> +	DRM_FORMAT_XRGB8888,
> +	DRM_FORMAT_ARGB8888,
> +	DRM_FORMAT_RGB565,
> +};
> +
> +static const struct drm_plane_funcs mtk_plane_funcs = {
> +	.update_plane = drm_atomic_helper_update_plane,
> +	.disable_plane = drm_atomic_helper_disable_plane,
> +	.destroy = drm_plane_cleanup,
> +	.reset = drm_atomic_helper_plane_reset,
> +	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
> +};
> +
> +static int mtk_plane_atomic_check(struct drm_plane *plane,
> +		struct drm_plane_state *state)
> +{
> +	struct drm_framebuffer *fb = state->fb;
> +	struct mtk_drm_plane *mtk_plane = to_mtk_plane(plane);
> +	struct drm_crtc_state *crtc_state;
> +	bool visible;
> +	int ret;
> +	struct drm_rect dest = {
> +		.x1 = state->crtc_x,
> +		.y1 = state->crtc_y,
> +		.x2 = state->crtc_x + state->crtc_w,
> +		.y2 = state->crtc_y + state->crtc_h,
> +	};
> +	struct drm_rect src = {
> +		/* 16.16 fixed point */
> +		.x1 = state->src_x,
> +		.y1 = state->src_y,
> +		.x2 = state->src_x + state->src_w,
> +		.y2 = state->src_y + state->src_h,
> +	};
> +	struct drm_rect clip = { 0, };
> +
> +	if (!fb)
> +		return 0;
> +
> +	if (!mtk_fb_get_gem_obj(fb, 0)) {
> +		DRM_DEBUG_KMS("buffer is null\n");
> +		return -EFAULT;
> +	}
> +
> +	if (!state->crtc)
> +		return 0;
> +
> +	crtc_state = drm_atomic_get_crtc_state(state->state,
> +					       state->crtc);
> +	if (IS_ERR(crtc_state))
> +		return PTR_ERR(crtc_state);
> +
> +	clip.x2 = crtc_state->mode.hdisplay;
> +	clip.y2 = crtc_state->mode.vdisplay;
> +
> +	ret = drm_plane_helper_check_update(plane, state->crtc, fb,
> +					    &src, &dest, &clip,
> +					    DRM_PLANE_HELPER_NO_SCALING,
> +					    DRM_PLANE_HELPER_NO_SCALING,
> +					    true, true, &visible);
> +	if (ret)
> +		return ret;
> +
> +	if (!visible)
> +		return 0;
> +
> +	mtk_plane->disp_size = (dest.y2 - dest.y1) << 16 | (dest.x2 - dest.x1);

I think it might work out ok but it's very fragile to update object state
from your atomic_check hooks - atomic allows a TEST_ONLY mode and if
that's used (generic userspace will do that a few times for each frame at
least) then you clobber shared state. Instead it's better to store that in
your own mtk_plane_state which subclasses drm_plane_state.

> +
> +	return 0;
> +}
> +
> +static void mtk_plane_atomic_update(struct drm_plane *plane,
> +		struct drm_plane_state *old_state)
> +{
> +	struct drm_plane_state *state = plane->state;
> +	struct drm_gem_object *gem_obj;
> +	struct mtk_drm_crtc *mtk_crtc;
> +	struct mtk_drm_plane *mtk_plane = to_mtk_plane(plane);
> +
> +	if (!state->crtc)
> +		return;
> +
> +	mtk_crtc = to_mtk_crtc(state->crtc);
> +
> +	if (plane->fb)
> +		drm_framebuffer_unreference(plane->fb);
> +	if (state->fb)
> +		drm_framebuffer_reference(state->fb);
> +	plane->fb = state->fb;
> +
> +	gem_obj = mtk_fb_get_gem_obj(state->fb, 0);
> +	mtk_plane->flip_obj = to_mtk_gem_obj(gem_obj);
> +	mtk_plane->mtk_crtc = mtk_crtc;
> +
> +	if (mtk_plane->flip_obj)
> +		mtk_drm_crtc_plane_config(mtk_crtc, mtk_plane->idx, true,
> +				mtk_plane->flip_obj->dma_addr);
> +}
> +
> +static void mtk_plane_atomic_disable(struct drm_plane *plane,
> +		struct drm_plane_state *old_state)
> +{
> +	struct mtk_drm_plane *mtk_plane = to_mtk_plane(plane);
> +	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(old_state->crtc);
> +
> +	if (!old_state->crtc)
> +		return;
> +
> +	if (mtk_crtc)
> +		mtk_drm_crtc_plane_config(mtk_crtc, mtk_plane->idx, false, 0);
> +
> +	mtk_drm_crtc_commit(mtk_crtc);
> +}
> +
> +static const struct drm_plane_helper_funcs mtk_plane_helper_funcs = {
> +	.atomic_check = mtk_plane_atomic_check,
> +	.atomic_update = mtk_plane_atomic_update,
> +	.atomic_disable = mtk_plane_atomic_disable,
> +};
> +
> +static void mtk_plane_attach_zpos_property(struct drm_plane *plane,
> +		unsigned int zpos, unsigned int max_plane)
> +{
> +	struct drm_device *dev = plane->dev;
> +	struct mtk_drm_private *dev_priv = dev->dev_private;
> +	struct drm_property *prop;
> +
> +	prop = dev_priv->plane_zpos_property;
> +	if (!prop) {
> +		prop = drm_property_create_range(dev, DRM_MODE_PROP_IMMUTABLE,
> +						 "zpos", 0, max_plane - 1);

I know that there's lots of other drivers exposing zpos already, but I
really think we should standardize this properly and document what it
means. So
- add a bit more text to the kerneldoc/doobook, especially what should
  happen when there's a conflict in zpos.
- move zpos registration/decoding into drm core, which means adding it to
  drm_plane_state
- have an open-source implementation using this somewhere (ddx, wayland,
  hwc, ...).

I think for now it's better to drop the zpos property from initial
mediatek enabling.

Cheers, Daniel

> +		if (!prop)
> +			return;
> +
> +		dev_priv->plane_zpos_property = prop;
> +	}
> +
> +	drm_object_attach_property(&plane->base, prop, zpos);
> +}
> +
> +int mtk_plane_init(struct drm_device *dev, struct mtk_drm_plane *mtk_plane,
> +		   unsigned long possible_crtcs, enum drm_plane_type type,
> +		   unsigned int zpos, unsigned int max_plane)
> +{
> +	int err;
> +
> +	err = drm_universal_plane_init(dev, &mtk_plane->base, possible_crtcs,
> +			&mtk_plane_funcs, formats, ARRAY_SIZE(formats), type);
> +
> +	if (err) {
> +		DRM_ERROR("failed to initialize plane\n");
> +		return err;
> +	}
> +
> +	drm_plane_helper_add(&mtk_plane->base, &mtk_plane_helper_funcs);
> +	mtk_plane->idx = zpos;
> +
> +	if (type == DRM_PLANE_TYPE_OVERLAY)
> +		mtk_plane_attach_zpos_property(&mtk_plane->base,
> +				zpos, max_plane);
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.h b/drivers/gpu/drm/mediatek/mtk_drm_plane.h
> new file mode 100644
> index 0000000..80075d493
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.h
> @@ -0,0 +1,38 @@
> +/*
> + * Copyright (c) 2015 MediaTek Inc.
> + * Author: CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#ifndef _MTK_DRM_PLANE_H_
> +#define _MTK_DRM_PLANE_H_
> +
> +struct fence;
> +struct mtk_crtc;
> +struct mtk_drm_gem_obj;
> +
> +#define to_mtk_plane(x)	container_of(x, struct mtk_drm_plane, base)
> +
> +struct mtk_drm_plane {
> +	struct drm_plane		base;
> +	struct mtk_drm_crtc		*mtk_crtc;
> +	unsigned int			idx;
> +	unsigned int			disp_size;
> +
> +	struct mtk_drm_gem_obj		*flip_obj;
> +};
> +
> +void mtk_plane_finish_page_flip(struct mtk_drm_plane *mtk_plane);
> +int mtk_plane_init(struct drm_device *dev, struct mtk_drm_plane *mtk_plane,
> +		   unsigned long possible_crtcs, enum drm_plane_type type,
> +		   unsigned int zpos, unsigned int max_plane);
> +
> +#endif
> -- 
> 2.5.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
