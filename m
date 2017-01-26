From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/5] drm: zte: add interlace mode support
Date: Thu, 26 Jan 2017 11:14:31 +0800
Message-ID: <20170126031429.GC5662@dragon>
References: <1484843100-16284-1-git-send-email-shawnguo@kernel.org>
 <1484843100-16284-2-git-send-email-shawnguo@kernel.org>
 <20170123151901.GA19505@trickycodes.roam.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170123151901.GA19505-6JpoNmjd1+aEBhuJAZrboHoUN1GumTyQ7j82oEJ37pA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>, Baoyou Xie <xie.baoyou-Th6q7B73Y6EnDS1+zs4M5A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jun Nie <jun.nie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Sean,

Thanks for reviewing the patches.

On Mon, Jan 23, 2017 at 10:19:01AM -0500, Sean Paul wrote:
> On Fri, Jan 20, 2017 at 12:24:56AM +0800, Shawn Guo wrote:
> > From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > 
> > It adds interlace mode support in VOU TIMING_CTRL and channel control
> > block, so that VOU driver gets ready to support output device in
> > interlace mode like TV Encoder.
> > 
> > Signed-off-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > ---
> >  drivers/gpu/drm/zte/zx_vou.c      | 53 +++++++++++++++++++++++++++++++++++++--
> >  drivers/gpu/drm/zte/zx_vou_regs.h | 15 +++++++++++
> >  2 files changed, 66 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/zte/zx_vou.c b/drivers/gpu/drm/zte/zx_vou.c
> > index 3056b41df518..8c4f0e2885f3 100644
> > --- a/drivers/gpu/drm/zte/zx_vou.c
> > +++ b/drivers/gpu/drm/zte/zx_vou.c
> 
> <snip>
> 
> > @@ -196,19 +211,26 @@ static inline void vou_chn_set_update(struct zx_crtc *zcrtc)
> >  static void zx_crtc_enable(struct drm_crtc *crtc)
> >  {
> >  	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
> > +	bool interlaced = mode->flags & DRM_MODE_FLAG_INTERLACE;
> >  	struct zx_crtc *zcrtc = to_zx_crtc(crtc);
> >  	struct zx_vou_hw *vou = zcrtc->vou;
> >  	const struct zx_crtc_regs *regs = zcrtc->regs;
> >  	const struct zx_crtc_bits *bits = zcrtc->bits;
> >  	struct videomode vm;
> > +	u32 vactive;
> >  	u32 pol = 0;
> >  	u32 val;
> > +	u32 mask;
> >  	int ret;
> >  
> >  	drm_display_mode_to_videomode(mode, &vm);
> >  
> >  	/* Set up timing parameters */
> > -	val = V_ACTIVE(vm.vactive - 1);
> > +	vactive = vm.vactive;
> > +	if (interlaced)
> > +		vactive /= 2;
> > +
> > +	val = V_ACTIVE(vactive - 1);
> 
> Instead of introducing a new var, I think you can get away with:
> 
> if (interlaced)
>         val = V_ACTIVE(vm.vactive / 2);
> else
>         val = V_ACTIVE(vm.vactive - 1);

The variable is used by SEC_V_ACTIVE register setup below as well.  But
yeah, I admit this additional variable makes the code even harder for
readers.  I will kill it by having interlaced case check where
necessary.

> 
> 
> >  	val |= H_ACTIVE(vm.hactive - 1);
> >  	zx_writel(vou->timing + regs->fir_active, val);
> >  
> > @@ -222,6 +244,22 @@ static void zx_crtc_enable(struct drm_crtc *crtc)
> >  	val |= FRONT_PORCH(vm.vfront_porch - 1);
> >  	zx_writel(vou->timing + regs->fir_vtiming, val);
> >  
> > +	if (interlaced) {
> > +		u32 shift = bits->sec_vactive_shift;
> > +		u32 mask = bits->sec_vactive_mask;
> 
> mask is already defined at the function scope

Right.  I will rename the one in function scope to avoid the confusion.

> 
> > +
> > +		val = zx_readl(vou->timing + SEC_V_ACTIVE);
> > +		val &= ~mask;
> > +		val |= ((vactive - 1) << shift) & mask;
> > +		zx_writel(vou->timing + SEC_V_ACTIVE, val);
> > +
> > +		val = SYNC_WIDE(vm.vsync_len - 1);
> > +		/* sec_vbp = fir_vbp + 1 */
> 
> Looks like leftover kruft here.

It's actually a comment which seems to be only understandable by
myself :)  I will write up some proper text for it.

> 
> > +		val |= BACK_PORCH(vm.vback_porch);
> > +		val |= FRONT_PORCH(vm.vfront_porch - 1);
> > +		zx_writel(vou->timing + regs->sec_vtiming, val);
> > +	}
> > +
> >  	/* Set up polarities */
> >  	if (vm.flags & DISPLAY_FLAGS_VSYNC_LOW)
> >  		pol |= 1 << POL_VSYNC_SHIFT;
> > @@ -232,9 +270,16 @@ static void zx_crtc_enable(struct drm_crtc *crtc)
> >  		       pol << bits->polarity_shift);
> >  
> >  	/* Setup SHIFT register by following what ZTE BSP does */
> > -	zx_writel(vou->timing + regs->timing_shift, H_SHIFT_VAL);
> > +	val = H_SHIFT_VAL;
> > +	if (interlaced)
> > +		val |= V_SHIFT_VAL << 16;
> > +	zx_writel(vou->timing + regs->timing_shift, val);
> >  	zx_writel(vou->timing + regs->timing_pi_shift, H_PI_SHIFT_VAL);
> >  
> > +	/* Progressive or interlace scan select */
> > +	mask = bits->interlace_select | bits->pi_enable;
> > +	zx_writel_mask(vou->timing + SCAN_CTRL, mask, interlaced ? mask : 0);
> > +
> >  	/* Enable TIMING_CTRL */
> >  	zx_writel_mask(vou->timing + TIMING_TC_ENABLE, bits->tc_enable,
> >  		       bits->tc_enable);
> > @@ -245,6 +290,10 @@ static void zx_crtc_enable(struct drm_crtc *crtc)
> >  	zx_writel_mask(zcrtc->chnreg + CHN_CTRL1, CHN_SCREEN_H_MASK,
> >  		       vm.vactive << CHN_SCREEN_H_SHIFT);
> >  
> > +	/* Configure channel interlace buffer control */
> > +	zx_writel_mask(zcrtc->chnreg + CHN_INTERLACE_BUF_CTRL, CHN_INTERLACE_EN,
> > +		       interlaced ? CHN_INTERLACE_EN : 0);
> > +
> >  	/* Update channel */
> >  	vou_chn_set_update(zcrtc);
> >  
> > diff --git a/drivers/gpu/drm/zte/zx_vou_regs.h b/drivers/gpu/drm/zte/zx_vou_regs.h
> > index 193c1ce01fe7..e6ed844e068a 100644
> > --- a/drivers/gpu/drm/zte/zx_vou_regs.h
> > +++ b/drivers/gpu/drm/zte/zx_vou_regs.h
> > @@ -75,6 +75,8 @@
> >  #define CHN_SCREEN_H_SHIFT		5
> >  #define CHN_SCREEN_H_MASK		(0x1fff << CHN_SCREEN_H_SHIFT)
> >  #define CHN_UPDATE			0x08
> > +#define CHN_INTERLACE_BUF_CTRL		0x24
> 
> Maybe it's my email reader, but it seems like there's an alignment issue here.

It's indeed your email reader.

Shawn

> 
> > +#define CHN_INTERLACE_EN		BIT(2)
> >  
> >  /* TIMING_CTRL registers */
> >  #define TIMING_TC_ENABLE		0x04
> > @@ -117,6 +119,19 @@
> >  #define TIMING_MAIN_SHIFT		0x2c
> >  #define TIMING_AUX_SHIFT		0x30
> >  #define H_SHIFT_VAL			0x0048
> > +#define V_SHIFT_VAL			0x0001
> > +#define SCAN_CTRL			0x34
> > +#define AUX_PI_EN			BIT(19)
> > +#define MAIN_PI_EN			BIT(18)
> > +#define AUX_INTERLACE_SEL		BIT(1)
> > +#define MAIN_INTERLACE_SEL		BIT(0)
> > +#define SEC_V_ACTIVE			0x38
> > +#define SEC_VACT_MAIN_SHIFT		0
> > +#define SEC_VACT_MAIN_MASK		(0xffff << SEC_VACT_MAIN_SHIFT)
> > +#define SEC_VACT_AUX_SHIFT		16
> > +#define SEC_VACT_AUX_MASK		(0xffff << SEC_VACT_AUX_SHIFT)
> > +#define SEC_MAIN_V_TIMING		0x3c
> > +#define SEC_AUX_V_TIMING		0x40
> >  #define TIMING_MAIN_PI_SHIFT		0x68
> >  #define TIMING_AUX_PI_SHIFT		0x6c
> >  #define H_PI_SHIFT_VAL			0x000f
> > -- 
> > 1.9.1
> > 
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
