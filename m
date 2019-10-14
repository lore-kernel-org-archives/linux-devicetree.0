From: Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH v4 13/14] drm/mxsfb: Add support for horizontal stride
Date: Mon, 14 Oct 2019 14:40:55 +0200
Message-ID: <3f346b1f809e77d343117dabc00c0402@agner.ch>
References: <1567078215-31601-1-git-send-email-robert.chiras@nxp.com>
 <1567078215-31601-14-git-send-email-robert.chiras@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1567078215-31601-14-git-send-email-robert.chiras@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Robert Chiras <robert.chiras@nxp.com>
Cc: =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, Marek Vasut <marex@denx.de>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Robert,

Sorry it took me so long to have a closer look at this patchset.

I will definitely merge part of it, but this particular patch actually
breaks i.MX 7. I have vertical stripes on my display with this patch
applied (using Weston with DRM backend). Not sure why this exactly
happens, from what I understand this should only affect IP Version 4.

Some notes below:


On 2019-08-29 13:30, Robert Chiras wrote:
> Besides the eLCDIF block, there is another IP block, used in the past
> for EPDC panels. Since the iMX.8mq doesn't have an EPDC connector, this
> block is not documented, but we can use it to do additional operations
> on the frame buffer.

Hm, but this block is part of the ELCDIF block, in terms of clock, power
domain etc?

> In this case, we can use the pigeon registers from this IP block in
> order to do horizontal crop on the frame buffer processed by the eLCDIF
> block.
> 
> Signed-off-by: Robert Chiras <robert.chiras@nxp.com>
> Tested-by: Guido Günther <agx@sigxcpu.org>
> ---
>  drivers/gpu/drm/mxsfb/mxsfb_crtc.c | 79 ++++++++++++++++++++++++++++++++++++--
>  drivers/gpu/drm/mxsfb/mxsfb_drv.c  |  1 +
>  drivers/gpu/drm/mxsfb/mxsfb_regs.h | 16 ++++++++
>  3 files changed, 92 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_crtc.c
> b/drivers/gpu/drm/mxsfb/mxsfb_crtc.c
> index a12f53d..317575e 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_crtc.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_crtc.c
> @@ -15,6 +15,7 @@
>  
>  #include <video/videomode.h>
>  
> +#include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_fb_cma_helper.h>
> @@ -435,13 +436,66 @@ void mxsfb_crtc_disable(struct mxsfb_drm_private *mxsfb)
>  	clk_disable_unprepare(mxsfb->clk_axi);
>  }
>  
> +void mxsfb_set_fb_hcrop(struct mxsfb_drm_private *mxsfb, u32 src_w, u32 fb_w)
> +{
> +	u32 mask_cnt, htotal, hcount;
> +	u32 vdctrl2, vdctrl3, vdctrl4, transfer_count;
> +	u32 pigeon_12_0, pigeon_12_1, pigeon_12_2;
> +
> +	if (src_w == fb_w) {
> +		writel(0x0, mxsfb->base + HW_EPDC_PIGEON_12_0);
> +		writel(0x0, mxsfb->base + HW_EPDC_PIGEON_12_1);
> +
> +		return;
> +	}
> +
> +	transfer_count = readl(mxsfb->base + LCDC_V4_TRANSFER_COUNT);
> +	hcount = TRANSFER_COUNT_GET_HCOUNT(transfer_count);
> +
> +	transfer_count &= ~TRANSFER_COUNT_SET_HCOUNT(0xffff);
> +	transfer_count |= TRANSFER_COUNT_SET_HCOUNT(fb_w);
> +	writel(transfer_count, mxsfb->base + LCDC_V4_TRANSFER_COUNT);
> +
> +	vdctrl2 = readl(mxsfb->base + LCDC_VDCTRL2);
> +	htotal  = VDCTRL2_GET_HSYNC_PERIOD(vdctrl2);
> +	htotal  += fb_w - hcount;
> +	vdctrl2 &= ~VDCTRL2_SET_HSYNC_PERIOD(0x3ffff);
> +	vdctrl2 |= VDCTRL2_SET_HSYNC_PERIOD(htotal);
> +	writel(vdctrl2, mxsfb->base + LCDC_VDCTRL2);
> +
> +	vdctrl4 = readl(mxsfb->base + LCDC_VDCTRL4);
> +	vdctrl4 &= ~SET_DOTCLK_H_VALID_DATA_CNT(0x3ffff);
> +	vdctrl4 |= SET_DOTCLK_H_VALID_DATA_CNT(fb_w);
> +	writel(vdctrl4, mxsfb->base + LCDC_VDCTRL4);
> +
> +	/* configure related pigeon registers */
> +	vdctrl3  = readl(mxsfb->base + LCDC_VDCTRL3);
> +	mask_cnt = GET_HOR_WAIT_CNT(vdctrl3) - 5;
> +
> +	pigeon_12_0 = PIGEON_12_0_SET_STATE_MASK(0x24)		|
> +		      PIGEON_12_0_SET_MASK_CNT(mask_cnt)	|
> +		      PIGEON_12_0_SET_MASK_CNT_SEL(0x6)		|
> +		      PIGEON_12_0_POL_ACTIVE_LOW		|
> +		      PIGEON_12_0_EN;
> +	writel(pigeon_12_0, mxsfb->base + HW_EPDC_PIGEON_12_0);
> +
> +	pigeon_12_1 = PIGEON_12_1_SET_CLR_CNT(src_w) |
> +		      PIGEON_12_1_SET_SET_CNT(0x0);
> +	writel(pigeon_12_1, mxsfb->base + HW_EPDC_PIGEON_12_1);
> +
> +	pigeon_12_2 = 0x0;
> +	writel(pigeon_12_2, mxsfb->base + HW_EPDC_PIGEON_12_2);
> +}
> +
>  void mxsfb_plane_atomic_update(struct mxsfb_drm_private *mxsfb,
>  			       struct drm_plane_state *state)
>  {
>  	struct drm_simple_display_pipe *pipe = &mxsfb->pipe;
>  	struct drm_crtc *crtc = &pipe->crtc;
> +	struct drm_plane_state *new_state = pipe->plane.state;
> +	struct drm_framebuffer *fb = pipe->plane.state->fb;
>  	struct drm_pending_vblank_event *event;
> -	dma_addr_t paddr;
> +	u32 fb_addr, src_off, src_w, stride, cpp = 0;

dma_addr_t seems to be the better type here, why change?

>  
>  	spin_lock_irq(&crtc->dev->event_lock);
>  	event = crtc->state->event;
> @@ -456,10 +510,27 @@ void mxsfb_plane_atomic_update(struct
> mxsfb_drm_private *mxsfb,
>  	}
>  	spin_unlock_irq(&crtc->dev->event_lock);
>  
> -	paddr = mxsfb_get_fb_paddr(mxsfb);
> -	if (paddr) {
> +	if (!fb)
> +		return;
> +
> +	fb_addr = mxsfb_get_fb_paddr(mxsfb);
> +	if (mxsfb->devdata->ipversion >= 4) {
> +		cpp = fb->format->cpp[0];
> +		src_off = (new_state->src_y >> 16) * fb->pitches[0] +
> +			  (new_state->src_x >> 16) * cpp;
> +		fb_addr += fb->offsets[0] + src_off;
> +	}
> +
> +	if (fb_addr) {
>  		clk_prepare_enable(mxsfb->clk_axi);
> -		writel(paddr, mxsfb->base + mxsfb->devdata->next_buf);
> +		writel(fb_addr, mxsfb->base + mxsfb->devdata->next_buf);
>  		clk_disable_unprepare(mxsfb->clk_axi);
>  	}
> +
> +	if (mxsfb->devdata->ipversion >= 4 &&
> +	    unlikely(drm_atomic_crtc_needs_modeset(new_state->crtc->state))) {
> +		stride = DIV_ROUND_UP(fb->pitches[0], cpp);
> +		src_w = new_state->src_w >> 16;
> +		mxsfb_set_fb_hcrop(mxsfb, src_w, stride);
> +	}
>  }
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> index 888b520..06d3bf0 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> @@ -133,6 +133,7 @@ static int mxsfb_atomic_helper_check(struct drm_device *dev,
>  		if (old_bpp != new_bpp)
>  			new_state->mode_changed = true;
>  	}
> +

Can you also drop this unrelated change?

--
Stefan

>  	return ret;
>  }
>  
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_regs.h
> b/drivers/gpu/drm/mxsfb/mxsfb_regs.h
> index 0f63ba1..df3279b 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_regs.h
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_regs.h
> @@ -145,6 +145,22 @@
>  #define DEBUG0_HSYNC			BIT(26)
>  #define DEBUG0_VSYNC			BIT(25)
>  
> +/* pigeon registers for crop */
> +#define HW_EPDC_PIGEON_12_0		0xb00
> +#define HW_EPDC_PIGEON_12_1		0xb10
> +#define HW_EPDC_PIGEON_12_2		0xb20
> +
> +#define PIGEON_12_0_SET_STATE_MASK(x)	REG_PUT((x), 31, 24)
> +#define PIGEON_12_0_SET_MASK_CNT(x)	REG_PUT((x), 23, 12)
> +#define PIGEON_12_0_SET_MASK_CNT_SEL(x)	REG_PUT((x), 11,  8)
> +#define PIGEON_12_0_SET_OFFSET(x)	REG_PUT((x),  7,  4)
> +#define PIGEON_12_0_SET_INC_SEL(x)	REG_PUT((x),  3,  2)
> +#define PIGEON_12_0_POL_ACTIVE_LOW	BIT(1)
> +#define PIGEON_12_0_EN			BIT(0)
> +
> +#define PIGEON_12_1_SET_CLR_CNT(x)	REG_PUT((x), 31, 16)
> +#define PIGEON_12_1_SET_SET_CNT(x)	REG_PUT((x), 15,  0)
> +
>  #define MXSFB_MIN_XRES			120
>  #define MXSFB_MIN_YRES			120
>  #define MXSFB_MAX_XRES			0xffff
