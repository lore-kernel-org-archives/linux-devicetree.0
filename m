From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v7 02/14] drm/mediatek: Add DRM Driver for Mediatek SoC
 MT8173.
Date: Wed, 16 Dec 2015 10:52:59 +0100
Message-ID: <1450259579.3421.17.camel@pengutronix.de>
References: <1448917676-25584-1-git-send-email-p.zabel@pengutronix.de>
	 <1448917676-25584-3-git-send-email-p.zabel@pengutronix.de>
	 <CAGS+omCeJU77tkjf4YGPiH9SZDo7aA4Cpbgih8RvvtSJVEKrnQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGS+omCeJU77tkjf4YGPiH9SZDo7aA4Cpbgih8RvvtSJVEKrnQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>, YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Jitao Shi <jitao.shi-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Jie Qiu <jie.qiu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Cawa Cheng <cawa.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Daniel Stone <daniel-rLtY4a/8tF1rovVCs/uTlw@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sasha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Daniel,

Am Dienstag, den 15.12.2015, 02:57 +0800 schrieb Daniel Kurtz:
> HI Philipp,
> 
> This driver is looking really good.
> 
> But, still some things to think about (mostly small) inline below...

Most of my answers below seem to be "ok" or some form thereof, but I
have one or two questions regarding the layer_config and crtc_reset
suggestions.

[...]
> > diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediatek/Kconfig
> > new file mode 100644
> > index 0000000..5343cf1
> > --- /dev/null
> > +++ b/drivers/gpu/drm/mediatek/Kconfig
> > @@ -0,0 +1,16 @@
> > +config DRM_MEDIATEK
> > +       tristate "DRM Support for Mediatek SoCs"
> > +       depends on DRM
> > +       depends on ARCH_MEDIATEK || (ARM && COMPILE_TEST)
> > +       select MTK_SMI
> > +       select DRM_PANEL
> > +       select DRM_MIPI_DSI
> > +       select DRM_PANEL_SIMPLE
> > +       select DRM_KMS_HELPER
> > +       select IOMMU_DMA
> 
> nit: alphabetize these selects ?

Ok.

[...]
> > +#define DISP_REG_OVL_CON(n)                    (0x0030 + 0x20 * n)
> 
> nit: it is recommended to always enclose macro arguments in ():
> 
>  (0x0030 + 0x20 * (n))
>
> > +#define DISP_REG_OVL_SRC_SIZE(n)               (0x0038 + 0x20 * n)
> > +#define DISP_REG_OVL_OFFSET(n)                 (0x003c + 0x20 * n)
> > +#define DISP_REG_OVL_PITCH(n)                  (0x0044 + 0x20 * n)
> > +#define DISP_REG_OVL_RDMA_CTRL(n)              (0x00c0 + 0x20 * n)
> > +#define DISP_REG_OVL_RDMA_GMC(n)               (0x00c8 + 0x20 * n)
> > +#define DISP_REG_OVL_ADDR(n)                   (0x0f40 + 0x20 * n)

Thanks for the pointer, I'll change those.

[...]
> > +static void mtk_ovl_enable_vblank(void __iomem *disp_base)
> 
> It would be more consistent to pass struct mtk_ddp_comp *comp to all of these
> functions.

Yes.

> > +{
> > +       writel(OVL_FME_CPL_INT, disp_base + DISP_REG_OVL_INTEN);
> 
> I think most of these can be writel_relaxed() instead of writel().
> 
> > +}
> > +
> > +static void mtk_ovl_disable_vblank(void __iomem *disp_base)
> > +{
> > +       writel(0x0, disp_base + DISP_REG_OVL_INTEN);
> > +}
> > +
> > +static void mtk_ovl_start(struct mtk_ddp_comp *comp)
> > +{
> > +       writel(0x1, comp->regs + DISP_REG_OVL_EN);
> > +}
> > +
> > +static void mtk_ovl_stop(struct mtk_ddp_comp *comp)
> > +{
> > +       writel(0x0, comp->regs + DISP_REG_OVL_EN);
> > +}
> > +
> > +static void mtk_ovl_config(void __iomem *ovl_base,
> > +               unsigned int w, unsigned int h, unsigned int vrefresh)
> > +{
> > +       if (w != 0 && h != 0)
> > +               writel(h << 16 | w, ovl_base + DISP_REG_OVL_ROI_SIZE);
> > +       writel(0x0, ovl_base + DISP_REG_OVL_ROI_BGCLR);
> > +
> > +       writel(0x1, ovl_base + DISP_REG_OVL_RST);
> > +       writel(0x0, ovl_base + DISP_REG_OVL_RST);
> 
> These two probably do have to be writel().

Ack.

[...]
> > +static void mtk_ovl_layer_on(void __iomem *ovl_base, unsigned int idx)
> > +{
> > +       unsigned int reg;
> > +
> > +       writel(0x1, ovl_base + DISP_REG_OVL_RDMA_CTRL(idx));
> > +       writel(OVL_RDMA_MEM_GMC, ovl_base + DISP_REG_OVL_RDMA_GMC(idx));
> > +
> > +       reg = readl(ovl_base + DISP_REG_OVL_SRC_CON);
> > +       reg = reg | (1 << idx);
> 
> nit(?):
>  reg |= BIT(idx);
>
> > +       writel(reg, ovl_base + DISP_REG_OVL_SRC_CON);
> > +}
> > +
> > +static void mtk_ovl_layer_off(void __iomem *ovl_base, unsigned int idx)
> > +{
> > +       unsigned int reg;
> > +
> > +       reg = readl(ovl_base + DISP_REG_OVL_SRC_CON);
> > +       reg = reg & ~(1 << idx);
> 
> nit(?):
>  reg &= ~BIT(idx);

Ok.

[...]
> > +static void mtk_ovl_layer_config(void __iomem *ovl_base, unsigned int idx,
> > +               struct mtk_plane_state *state)
> > +{
> > +       struct mtk_plane_pending_state *pending = &state->pending;
> > +       unsigned int addr = pending->addr;
> > +       unsigned int pitch = pending->pitch & 0xffff;
> > +       unsigned int fmt = pending->format;
> > +       unsigned int offset = (pending->y << 16) | pending->x;
> > +       unsigned int src_size = (pending->height << 16) | pending->width;
> > +       unsigned int con;
> > +
> > +       con = has_rb_swapped(fmt) << 24 | ovl_fmt_convert(fmt) << 12;
> 
> Call these conversion routines earlier (during atomic_check) and just add the
> resulting "con" value to pending.

You mean to add a .layer_atomic_check callback to the mtk_ddp_comp ops?

[...]
> > +/**
> > + * struct mtk_drm_crtc - MediaTek specific crtc structure.
> > + * @base: crtc object.
> > + * @pipe: a crtc index created at load() with a new crtc object creation
> > + *     and the crtc object would be set to private->crtc array
> > + *     to get a crtc object corresponding to this pipe from private->crtc
> > + *     array when irq interrupt occurred. the reason of using this pipe is that
> > + *     drm framework doesn't support multiple irq yet.
> > + *     we can refer to the crtc to current hardware interrupt occurred through
> > + *     this pipe value.
> 
> Can you fix the above comment?

Oh, sorry I missed this. I think you've pointed this out this before.

[...]
> > +static struct mtk_drm_crtc *mtk_crtc_by_comp(struct mtk_drm_private *priv,
> > +                                            struct mtk_ddp_comp *ddp_comp)
> > +{
> > +       struct mtk_drm_crtc *mtk_crtc;
> > +       int i;
> > +
> > +       for (i = 0; i < MAX_CRTC; i++) {
> > +               mtk_crtc = to_mtk_crtc(priv->crtc[i]);
> > +               if (mtk_crtc->ddp_comp[0] == ddp_comp)
> > +                       return mtk_crtc;
> > +       }
> 
> This looks a little bit like black magic.
> I think you relying on the fact that the 0-th component is special.
> 
> It might be clearer if you named it separately (ovl), or at least add a comment
> here explaining what this function is actually doing.

Yes. Perhaps the function should also be called mtk_crtc_by_source_comp
since it doesn't look for components further down the pipe.

In theory the first component could also be a rdma instead of ovl,
but this is for the future.

> > +
> > +       return NULL;
> > +}
> > +
> > +static void mtk_drm_crtc_finish_page_flip(struct mtk_drm_crtc *mtk_crtc)
> 
> Where does this get called?

This should be part of the fence patch later in the patchstack.

[...]
> > +static void mtk_drm_crtc_reset(struct drm_crtc *crtc)
> > +{
> > +       struct mtk_crtc_state *state;
> > +
> > +       if (crtc->state && crtc->state->mode_blob)
> > +               drm_property_unreference_blob(crtc->state->mode_blob);
> > +
> > +       kfree(crtc->state);
> 
> nit: this is relying on the fact that mtk_crtc_state.base is the first element.

Yes.

> IMHO, it is slightly cleaner to kfree(to_mtk_crtc_state(crtc->state)), since
> that is the pointer that was actually allocated.

Not if crtc->state == NULL.

> Or:
> 
>   state = to_mtk_crtc_state(crtc->state);
>   kfree(state);

That one would work.

> but...  why free and then alloc the same struct here?
> Why not just memset(0) and reuse the same memory?

The _reset callback is initially called with crtc->state == NULL.
How about this:

static void mtk_drm_crtc_reset(struct drm_crtc *crtc)
{
        struct mtk_crtc_state *state;

        if (crtc->state) {
                if (crtc->state->mode_blob)
                        drm_property_unreference_blob(crtc->state->mode_blob);
                
                state = to_mtk_crtc_state(crtc->state);
                memset(state, 0, sizeof(*state));
        } else {
                state = kzalloc(sizeof(*state), GFP_KERNEL);
		if (!state)
			return;
	        crtc->state = &state->base;
        }

        state->base.crtc = crtc;
}

[...]
> > +static struct drm_crtc_state *mtk_drm_crtc_duplicate_state(struct drm_crtc *crtc)
> > +{
> > +       struct mtk_crtc_state *state;
> > +
> > +       state = kzalloc(sizeof(*state), GFP_KERNEL);
> > +       if (!state)
> > +               return NULL;
> > +
> > +       __drm_atomic_helper_crtc_duplicate_state(crtc, &state->base);
> > +
> > +       WARN_ON(state->base.crtc != crtc);
> > +       state->base.crtc = crtc;
> > +
> > +       return &state->base;
> > +}
> 
> nit:
> missing destroy_state() (to do the pointer conversion dance).

I'll add that.

[...]
> > +static int mtk_crtc_ddp_power_on(struct mtk_drm_crtc *mtk_crtc)
> 
> nit: This function enables clocks, not power, so:
>  mtk_crtc_ddp_clk_enable()

Ok.

[...]
> > +       /* Set all pending plane state to disabled */
> > +       for (i = 0; i < OVL_LAYER_NR; i++) {
> > +               struct drm_plane *plane = &mtk_crtc->planes[i].base;
> > +               struct mtk_plane_state *plane_state;
> > +
> > +               plane_state = to_mtk_plane_state(plane->state);
> > +               plane_state->pending.enable = false;
> 
> wmb(); ?

In principle yes. Although, as you point out below, we should instead
mark all planes as ready for configuration updates atomically.

> > +               plane_state->pending.config = true;
> > +       }
> > +
> > +       /* Wait for planes to be disabled */
> > +       drm_crtc_wait_one_vblank(crtc);
> > +
> > +       drm_crtc_vblank_off(crtc);
> > +       mtk_crtc_ddp_hw_fini(mtk_crtc);
> > +       mtk_smi_larb_put(ovl->larb_dev);
> > +
> > +       mtk_crtc->do_flush = false;
> 
> do_flush is written here, but never read.

This belongs to another patch, I'll remove it here.

> > +       mtk_crtc->enabled = false;
> > +}
> > +
> > +static void mtk_drm_crtc_atomic_begin(struct drm_crtc *crtc,
> > +                                     struct drm_crtc_state *old_crtc_state)
> > +{
> > +       struct mtk_crtc_state *state = to_mtk_crtc_state(crtc->state);
> > +
> > +       if (state->base.event) {
> > +               state->base.event->pipe = drm_crtc_index(crtc);
> > +               WARN_ON(drm_crtc_vblank_get(crtc) != 0);
> > +               state->event = state->base.event;
> > +               state->base.event = NULL;
> > +       }
> 
> I don't understand this... why are we moving the event from drm_crtc_state to
> its parent mtk_crtc_state?

The event was originally moved to mtk_crtc because the state can change
and the event won't be inherited by the new state. I may have been a bit
overzealous moving this into the mtk_crtc_state.
mtk_drm_crtc_finish_page_flip can be called from the interrupt after the crtc
state has already changed for the next frame.

> > +}
> > +
> > +void mtk_drm_crtc_commit(struct drm_crtc *crtc)
> 
> I think this is static now; just move to mtk_drm_crtc_atomic_flush().

Will do.

> > +{
> > +       struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
> > +       unsigned int i;
> > +
> > +       for (i = 0; i < OVL_LAYER_NR; i++) {
> > +               struct drm_plane *plane = &mtk_crtc->planes[i].base;
> > +               struct mtk_plane_state *plane_state;
> > +
> > +               plane_state = to_mtk_plane_state(plane->state);
> > +               if (plane_state->pending.dirty) {
> > +                       plane_state->pending.config = true;
> 
> This doesn't look very "atomic".
> If an interrupt occurs here, it will may update some planes but not others.

In the future this will be handled by the the command queue hardware.
For now, I'll just add another flag that will be raised only after all
pending plane state is marked for configuration update.

> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> > new file mode 100644
> > index 0000000..16584e4
> > --- /dev/null
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
[...]
> > +#define DISP_REG_CONFIG_DISP_OVL0_MOUT_EN      0x040
[...]
> > +#define OVL0_MOUT_EN_COLOR0            0x1
> 
> Are these really "BIT(0)" ?

Yes, OVL0_MOUT_EN contains a 2-bit field with BIT(0) enabling the output
to COLOR0 and BIT(1) enabling the output to WDMA0.

> > +#define OD_MOUT_EN_RDMA0               0x1
> > +#define UFOE_MOUT_EN_DSI0              0x1
> > +#define COLOR0_SEL_IN_OVL0             0x1
> > +#define OVL1_MOUT_EN_COLOR1            0x1
> > +#define GAMMA_MOUT_EN_RDMA1            0x1
> > +#define RDMA1_MOUT_DPI0                        0x2
> > +#define DPI0_SEL_IN_RDMA1              0x1
> > +#define COLOR1_SEL_IN_OVL1             0x1

I could add the currently unused bits and move them next to their
respective registers to make this more clear.

> > +static void mtk_color_config(void __iomem *color_base, unsigned int w,
> 
> It seems a bit awkward to pass "void __iomem *X" to _config() but
> "struct mtk_ddp_comp *comp" for _start().
> 
> Any reason not to pass "struct mtk_ddp_comp *comp" to both?

No, I'll change them all.

> > +               unsigned int h, unsigned int vrefresh)
> > +{
> > +       writel(w, color_base + DISP_COLOR_WIDTH);
> 
> Can these all be writel_relaxed()?

Yes, will relax.

> > +       writel(h, color_base + DISP_COLOR_HEIGHT);
> > +}
> > +
> > +static void mtk_color_start(struct mtk_ddp_comp *comp)
> > +{
> > +       writel(COLOR_BYPASS_ALL | COLOR_SEQ_SEL,
> > +              comp->regs + DISP_COLOR_CFG_MAIN);
> > +       writel(0x1, comp->regs + DISP_COLOR_START);
> 
> Is this a 'go' bit that has to be writel()?

Yes.

> > +struct mtk_ddp_comp_funcs {
> > +       void (*config)(void __iomem *base, unsigned int w, unsigned int h,
> > +                      unsigned int vrefresh);
> > +       void (*start)(struct mtk_ddp_comp *comp);
> > +       void (*stop)(struct mtk_ddp_comp *comp);
> > +       void (*enable_vblank)(void __iomem *base);
> > +       void (*disable_vblank)(void __iomem *base);
> > +       void (*layer_on)(void __iomem *base, unsigned int idx);
> > +       void (*layer_off)(void __iomem *base, unsigned int idx);
> > +       void (*layer_config)(void __iomem *base, unsigned int idx,
> > +                            struct mtk_plane_state *state);
> > +};
> 
> Here: I think it would be cleaner if these all had "struct mtk_ddp_comp *comp"
> as their first parameter.

Already pointed out before, and I agree.

> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > new file mode 100644
> > index 0000000..a34c765
> > --- /dev/null
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
[...]
> > +#define DRIVER_NAME "mediatek"
> > +#define DRIVER_DESC "Mediatek SoC DRM"
> > +#define DRIVER_DATE "20150513"
> 
> Is this DATE important?

I don't think so. I didn't touch it, don't intend to unless necessary.

> > +#define DRIVER_MAJOR 1
> > +#define DRIVER_MINOR 0
> > +
> > +static void mtk_atomic_schedule(struct mtk_drm_private *private,
> > +                               struct drm_atomic_state *state)
> > +{
> > +       private->commit.state = state;
> > +       schedule_work(&private->commit.work);
> > +}
> > +
> > +static void mtk_atomic_complete(struct mtk_drm_private *private,
> > +                               struct drm_atomic_state *state)
> > +{
> > +       struct drm_device *drm = private->drm;
> > +
> > +       drm_atomic_helper_commit_modeset_disables(drm, state);
> > +       drm_atomic_helper_commit_planes(drm, state, false);
> > +       drm_atomic_helper_commit_modeset_enables(drm, state);
> 
> Why do these 3 calls in the worker as opposed to mtk_atomic_commit()?

As I understand the reason to do this in the worker was that this allows
to release the modeset locks ASAP and give other threads the opportunity
to do further atomic checks in parallel.

> It feels like it would be more efficient to do this work as fast as possible,
> and only do the wait & cleanup in the worker.
>
> > +static int mtk_drm_probe(struct platform_device *pdev)
> > +{
[...]
> > +       pm_runtime_enable(dev);
> > +
> > +       platform_set_drvdata(pdev, private);
> > +
> > +       ret = component_master_add_with_match(dev, &mtk_drm_ops, match);
> > +       if (ret)
> 
>       pm_runtime_disable(dev);

Yes, thanks.

[...]
> > +static SIMPLE_DEV_PM_OPS(mtk_drm_pm_ops, mtk_drm_sys_suspend,
> > +                        mtk_drm_sys_resume);
> 
> I think you can move this out of the #if CONFIG_PM_SLEEP, and remove the
> #ifdef check around ".pm = ".

Ok.

[...]
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> > new file mode 100644
> > index 0000000..df421cd
> > --- /dev/null
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
[...]
> > +struct mtk_drm_private {
> > +       struct drm_device *drm;
> > +
> > +       struct drm_crtc *crtc[MAX_CRTC];
> > +       struct drm_property *plane_zpos_property;
> 
> not used

Thanks, removed.

> > +static struct mtk_drm_fb *mtk_drm_framebuffer_init(struct drm_device *dev,
> > +                                                  struct drm_mode_fb_cmd2 *mode,
> > +                                                  struct drm_gem_object *obj)
> > +{
> > +       struct mtk_drm_fb *mtk_fb;
> > +       int ret;
> > +
> > +       if (drm_format_num_planes(mode->pixel_format) != 1)
> > +               return ERR_PTR(-EINVAL);
> > +
> > +       mtk_fb = kzalloc(sizeof(*mtk_fb), GFP_KERNEL);
> > +       if (!mtk_fb)
> > +               return ERR_PTR(-ENOMEM);
> > +
> > +       drm_helper_mode_fill_fb_struct(&mtk_fb->base, mode);
> > +
> > +       mtk_fb->gem_obj = obj;
> > +
> > +       ret = drm_framebuffer_init(dev, &mtk_fb->base, &mtk_drm_fb_funcs);
> > +       if (ret) {
> > +               DRM_ERROR("failed to initialize framebuffer\n");
> > +               kfree(mtk_fb);
> > +               return ERR_PTR(ret);
> > +       }
> > +
> > +       return mtk_fb;
> > +}
> > +
> 
> 
> Something like this here would be useful:
> 
> /*
>  * Wait for any exclusive fence in fb's gem object's reservation object.
>  *
>  * Returns -ERESTARTSYS if interrupted, else 0.
>  */
> int mtk_fb_wait(struct drm_framebuffer *fb)
> {
> struct drm_gem_object *gem;
> struct reservation_object *resv;
> long ret;
> 
> if (!fb)
> return 0;
> 
> gem = mtk_fb_get_gem_obj(fb, 0);
> if (!gem || !gem->dma_buf || !gem->dma_buf->resv)
> return 0;
> 
> resv = gem->dma_buf->resv;
> ret = reservation_object_wait_timeout_rcu(resv, false, true,
>  MAX_SCHEDULE_TIMEOUT);
> /* MAX_SCHEDULE_TIMEOUT on success, -ERESTARTSYS if interrupted */
> if (WARN_ON(ret < 0))
> return ret;
> 
> return 0;
> }
> 
> And then, call this from mtk_atomic_complete():
> 
> static void mtk_atomic_wait_for_fences(struct drm_atomic_state *state)
> {
> struct drm_plane *plane;
> struct drm_plane_state *plane_state;
> int i;
> 
> for_each_plane_in_state(state, plane, plane_state, i)
> mtk_fb_wait(plane->state->fb);
> }

Thanks, I see you've already prepared a patch. I'll try and integrate this.

[...]
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_fb.h b/drivers/gpu/drm/mediatek/mtk_drm_fb.h
> > new file mode 100644
> > index 0000000..ca378c7
> > --- /dev/null
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_fb.h
[...]
> > +#define MAX_FB_OBJ     3
> 
> unused.
>
[...]
> > +void mtk_drm_mode_output_poll_changed(struct drm_device *dev);
> > +int mtk_fbdev_create(struct drm_device *dev);
> > +void mtk_fbdev_destroy(struct drm_device *dev);
> 
> these 3 are unused

Thanks, these have to be moved up in the patchstack, the fbdev patches
are not part of this series.

> > +struct mtk_drm_gem_obj *mtk_drm_gem_create(struct drm_device *dev,
> > +                                          unsigned long size, bool alloc_kmap)
> > +{
> > +       struct mtk_drm_gem_obj *mtk_gem;
> > +       struct drm_gem_object *obj;
> > +       int ret;
> > +
> > +       mtk_gem = mtk_drm_gem_init(dev, size);
> > +       if (IS_ERR(mtk_gem))
> > +               return ERR_CAST(mtk_gem);
> > +
> > +       obj = &mtk_gem->base;
> > +
> > +       init_dma_attrs(&mtk_gem->dma_attrs);
> > +       dma_set_attr(DMA_ATTR_WRITE_COMBINE, &mtk_gem->dma_attrs);
> > +
> > +       if (!alloc_kmap)
> > +               dma_set_attr(DMA_ATTR_NO_KERNEL_MAPPING, &mtk_gem->dma_attrs);
> > +
> > +       mtk_gem->cookie = dma_alloc_attrs(dev->dev, obj->size,
> > +                               (dma_addr_t *)&mtk_gem->dma_addr, GFP_KERNEL,
> 
> why this cast (dma_addr_t *)?

Leftover, will drop it ...

> > +                               &mtk_gem->dma_attrs);
> > +       if (!mtk_gem->cookie) {
> > +               DRM_ERROR("failed to allocate %zx byte dma buffer", obj->size);
> > +               ret = -ENOMEM;
> > +               goto err_gem_free;
> > +       }
> > +
> > +       if (alloc_kmap)
> > +               mtk_gem->kvaddr = mtk_gem->cookie;
> > +
> > +       DRM_DEBUG_DRIVER("cookie = %p dma_addr = %llx\n",
> 
> dma_addr = %pad\n" ... ,  &mtk_gem->dma_addr);

... and fix this.

> > +                        mtk_gem->cookie, mtk_gem->dma_addr);
> > +
> > +       return mtk_gem;
> > +
> > +err_gem_free:
> > +       drm_gem_object_release(obj);
> > +       kfree(mtk_gem);
> 
> nit: structurally, to parallel mtk_drm_gem_init(), these two bits of cleanup
> could be in a function called:
> 
>   mtk_drm_gem_fini()
> 
> That could also be called from mtk_drm_gem_free_object().

Ok.

> > +static int mtk_drm_gem_object_mmap(struct drm_gem_object *obj,
> > +                                  struct vm_area_struct *vma)
> > +
> > +{
> > +       int ret;
> > +       struct mtk_drm_gem_obj *mtk_gem = to_mtk_gem_obj(obj);
> > +       struct drm_device *drm = obj->dev;
> > +
> > +       /*
> > +        * dma_alloc_attrs() allocated a struct page table for rk_obj, so clear
> 
> rk_obj ;-) ?

s/rk_obj/mtk_gem/

> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> > new file mode 100644
> > index 0000000..c0b62d1
> > --- /dev/null
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
[...]
> > +static void mtk_plane_config(struct mtk_drm_plane *mtk_plane, bool enable,
> > +                            dma_addr_t addr, struct drm_rect *dest)
> 
> This function is really only useful in the enable case, so I'd just rename it:
> 
> static void mtk_plane_enable(struct mtk_drm_plane *mtk_plane,
>                              dma_addr_t addr, struct drm_rect *dest)
[...]
> For disable, all you really need is:
> 
> static void mtk_plane_disable(struct mtk_drm_plane *mtk_plane)
> {
>   struct drm_plane *plane = &mtk_plane->base;
>   struct mtk_plane_state *state = to_mtk_plane_state(plane->state);
> 
>   state->pending.enable = false;
>   state->pending.dirty = true;
> }

Ok.

> > +
> > +static void mtk_plane_reset(struct drm_plane *plane)
> > +{
> > +       struct mtk_plane_state *state;
> > +
> > +       if (plane->state && plane->state->fb)
> > +               drm_framebuffer_unreference(plane->state->fb);
> > +
> > +       kfree(plane->state);
> > +       state = kzalloc(sizeof(*state), GFP_KERNEL);
> 
> nit: same comments here about wrong kfree'ing the wrong type and using
> memset(0) instead of free+alloc.

Ok.

> > +static struct drm_plane_state *mtk_plane_duplicate_state(struct drm_plane *plane)
> > +{
> > +       struct mtk_plane_state *old_state = to_mtk_plane_state(plane->state);
> > +       struct mtk_plane_state *state;
> > +
> > +       state = kzalloc(sizeof(*state), GFP_KERNEL);
> > +       if (!state)
> > +               return NULL;
> > +
> > +       __drm_atomic_helper_plane_duplicate_state(plane, &state->base);
> > +
> > +       WARN_ON(state->base.plane != plane);
> > +
> > +       state->pending = old_state->pending;
> > +
> > +       return &state->base;
> > +}
> 
> nit: same comment about destroy and the type cast dance.

Ok.

[...]
> > +static int mtk_plane_atomic_check(struct drm_plane *plane,
> > +                                 struct drm_plane_state *state)
> > +{
[...]
> > +       ret = drm_plane_helper_check_update(plane, state->crtc, fb,
> > +                                           &src, &dest, &clip,
> > +                                           DRM_PLANE_HELPER_NO_SCALING,
> > +                                           DRM_PLANE_HELPER_NO_SCALING,
> > +                                           true, true, &visible);
> 
> Just:
>           return drm_plane_helper_check_update(...);

More code will be added with the fence patch here.

[...]
> > +static void mtk_plane_atomic_update(struct drm_plane *plane,
> > +                                   struct drm_plane_state *old_state)
> > +{
> > +       struct mtk_plane_state *state = to_mtk_plane_state(plane->state);
> > +       struct drm_crtc *crtc = state->base.crtc;
> > +       struct drm_gem_object *gem;
[...]
> > +
> > +       gem = mtk_fb_get_gem_obj(state->base.fb);
> > +       if (gem)
> > +               mtk_plane_config(mtk_plane, true, to_mtk_gem_obj(gem)->dma_addr,
> > +                                &dest);
> 
> Just pass in plane, and let mtk_plane_enable() figure out the dma_addr.

Ok.

> > --- /dev/null
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.h
[...]
> > +struct mtk_plane_pending_state {
> > +       bool                            config;
> > +       bool                            enable;
> > +       unsigned int                    addr;
> 
> dma_addr_t ?

Indeed.

Thanks for the review!

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
