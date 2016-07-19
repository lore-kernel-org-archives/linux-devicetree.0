From: YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v4 3/8] drm/mediatek: add shadow register support
Date: Tue, 19 Jul 2016 19:12:38 +0800
Message-ID: <1468926758.24098.37.camel@mtksdaap41>
References: <1468577274-6178-1-git-send-email-yt.shen@mediatek.com>
	 <1468577274-6178-4-git-send-email-yt.shen@mediatek.com>
	 <1468823575.30644.33.camel@mtksdaap41>
	 <1468830992.2994.6.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1468830992.2994.6.camel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mao Huang <littlecvr-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Bibby Hsieh <bibby.hsieh-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Philipp, CK,

Thanks for the review.

On Mon, 2016-07-18 at 10:36 +0200, Philipp Zabel wrote:
> Hi CK, YT,
> 
> Am Montag, den 18.07.2016, 14:32 +0800 schrieb CK Hu:
> > Hi, YT:
> > 
> > One comment inline.
> > 
> > 
> > On Fri, 2016-07-15 at 18:07 +0800, YT Shen wrote:
> > > We need to acquire mutex before using the resources,
> > > and need to release it after finished.
> > > So we don't need to write registers in the blanking period.
> > > 
> > > Signed-off-by: YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > > ---
> > >  drivers/gpu/drm/mediatek/mtk_drm_crtc.c |   75 +++++++++++++++++++------------
> > >  drivers/gpu/drm/mediatek/mtk_drm_ddp.c  |   22 +++++++++
> > >  drivers/gpu/drm/mediatek/mtk_drm_ddp.h  |    2 +
> > >  drivers/gpu/drm/mediatek/mtk_drm_drv.h  |    1 +
> > >  4 files changed, 71 insertions(+), 29 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > > index 24aa3ba..80d9641 100644
> > > --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > > +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > > @@ -315,6 +315,42 @@ static void mtk_crtc_ddp_hw_fini(struct mtk_drm_crtc *mtk_crtc)
> > >  	pm_runtime_put(drm->dev);
> > >  }
> > >  
> > > +static void mtk_crtc_ddp_config(struct drm_crtc *crtc)
> > > +{
> > > +	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
> > > +	struct mtk_crtc_state *state = to_mtk_crtc_state(mtk_crtc->base.state);
> > > +	struct mtk_ddp_comp *ovl = mtk_crtc->ddp_comp[0];
> > > +	unsigned int i;
> > > +
> > > +	/*
> > > +	 * TODO: instead of updating the registers here, we should prepare
> > > +	 * working registers in atomic_commit and let the hardware command
> > > +	 * queue update module registers on vblank.
> > > +	 */
> > > +	if (state->pending_config) {
> > > +		mtk_ddp_comp_config(ovl, state->pending_width,
> > > +				    state->pending_height,
> > > +				    state->pending_vrefresh);
> > > +
> > > +		state->pending_config = false;
> > > +	}
> > > +
> > > +	if (mtk_crtc->pending_planes) {
> > > +		for (i = 0; i < OVL_LAYER_NR; i++) {
> > > +			struct drm_plane *plane = &mtk_crtc->planes[i].base;
> > > +			struct mtk_plane_state *plane_state;
> > > +
> > > +			plane_state = to_mtk_plane_state(plane->state);
> > > +
> > > +			if (plane_state->pending.config) {
> > > +				mtk_ddp_comp_layer_config(ovl, i, plane_state);
> > > +				plane_state->pending.config = false;
> > > +			}
> > > +		}
> > > +		mtk_crtc->pending_planes = false;
> > > +	}
> > > +}
> > > +
> > >  static void mtk_drm_crtc_enable(struct drm_crtc *crtc)
> > >  {
> > >  	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
> > > @@ -391,6 +427,7 @@ static void mtk_drm_crtc_atomic_flush(struct drm_crtc *crtc,
> > >  				      struct drm_crtc_state *old_crtc_state)
> > >  {
> > >  	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
> > > +	struct mtk_drm_private *priv = crtc->dev->dev_private;
> > >  	unsigned int pending_planes = 0;
> > >  	int i;
> > >  
> > > @@ -409,6 +446,12 @@ static void mtk_drm_crtc_atomic_flush(struct drm_crtc *crtc,
> > >  	}
> > >  	if (pending_planes)
> > >  		mtk_crtc->pending_planes = true;
> > > +
> > > +	if (priv->data->shadow_register) {
> > > +		mtk_disp_mutex_acquire(mtk_crtc->mutex);
> > > +		mtk_crtc_ddp_config(crtc);
> > > +		mtk_disp_mutex_release(mtk_crtc->mutex);
> > > +	}
> > >  }
> > >  
> > >  static const struct drm_crtc_funcs mtk_crtc_funcs = {
> > > @@ -453,36 +496,10 @@ err_cleanup_crtc:
> > >  void mtk_crtc_ddp_irq(struct drm_crtc *crtc, struct mtk_ddp_comp *ovl)
> > >  {
> > >  	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
> > > -	struct mtk_crtc_state *state = to_mtk_crtc_state(mtk_crtc->base.state);
> > > -	unsigned int i;
> > > +	struct mtk_drm_private *priv = crtc->dev->dev_private;
> > >  
> > > -	/*
> > > -	 * TODO: instead of updating the registers here, we should prepare
> > > -	 * working registers in atomic_commit and let the hardware command
> > > -	 * queue update module registers on vblank.
> > > -	 */
> > > -	if (state->pending_config) {
> > > -		mtk_ddp_comp_config(ovl, state->pending_width,
> > > -				    state->pending_height,
> > > -				    state->pending_vrefresh);
> > > -
> > > -		state->pending_config = false;
> > > -	}
> > > -
> > > -	if (mtk_crtc->pending_planes) {
> > > -		for (i = 0; i < OVL_LAYER_NR; i++) {
> > > -			struct drm_plane *plane = &mtk_crtc->planes[i].base;
> > > -			struct mtk_plane_state *plane_state;
> > > -
> > > -			plane_state = to_mtk_plane_state(plane->state);
> > > -
> > > -			if (plane_state->pending.config) {
> > > -				mtk_ddp_comp_layer_config(ovl, i, plane_state);
> > > -				plane_state->pending.config = false;
> > > -			}
> > > -		}
> > > -		mtk_crtc->pending_planes = false;
> > > -	}
> > > +	if (!priv->data->shadow_register)
> > > +		mtk_crtc_ddp_config(crtc);
> > >  
> > >  	mtk_drm_finish_page_flip(mtk_crtc);
> > >  }
> > > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> > > index 8030769..fa53806 100644
> > > --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> > > +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> > > @@ -12,6 +12,7 @@
> > >   */
> > >  
> > >  #include <linux/clk.h>
> > > +#include <linux/iopoll.h>
> > >  #include <linux/module.h>
> > >  #include <linux/of_device.h>
> > >  #include <linux/platform_device.h>
> > > @@ -32,6 +33,7 @@
> > >  #define DISP_REG_CONFIG_MMSYS_CG_CON0		0x100
> > >  
> > >  #define DISP_REG_MUTEX_EN(n)	(0x20 + 0x20 * (n))
> > > +#define DISP_REG_MUTEX(n)	(0x24 + 0x20 * (n))
> > >  #define DISP_REG_MUTEX_RST(n)	(0x28 + 0x20 * (n))
> > >  #define DISP_REG_MUTEX_MOD(n)	(0x2c + 0x20 * (n))
> > >  #define DISP_REG_MUTEX_SOF(n)	(0x30 + 0x20 * (n))
> > > @@ -300,6 +302,26 @@ void mtk_disp_mutex_disable(struct mtk_disp_mutex *mutex)
> > >  	writel(0, ddp->regs + DISP_REG_MUTEX_EN(mutex->id));
> > >  }
> > >  
> > > +void mtk_disp_mutex_acquire(struct mtk_disp_mutex *mutex)
> > > +{
> > > +	struct mtk_ddp *ddp = container_of(mutex, struct mtk_ddp,
> > > +					   mutex[mutex->id]);
> > > +	u32 tmp;
> > > +
> > > +	writel(1, ddp->regs + DISP_REG_MUTEX_EN(mutex->id));
> > > +	writel(1, ddp->regs + DISP_REG_MUTEX(mutex->id));
> > > +	readl_poll_timeout_atomic(ddp->regs + DISP_REG_MUTEX(mutex->id), tmp,
> > > +				  tmp & 0x2, 1, 10000);
> 
> Please add a descriptive #define for the 0x2 bit of the DISP_REG_MUTEX
> registers.
OK, will do.

> 
> > Nothing to do with timeout? I think it should print error message here
> > or reset HW to recover it.
I will print error messages here for future debugging.

> 
> I assume that if mtk_disp_mutex_acquire is called while the hardware has
> the mutex (during the shadow register update), this should wait until
> the update is complete, since it can't back out from trying to acquire
> the lock. Is that the case?
The acquire/release is handshake interface between software and hardware
to guarantee hardware receives a complete setting.  If software wants to
modify registers, it needs set a request and wait acknowledge.  And
after everything is done, software needs to notify hardware.  As far as
I know, this timeout means hardware is wrong, eg: no output signals.

> 
> regards
> Philipp
> 


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
