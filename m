From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 07/15] drm/mxsfb: Fix the vblank events
Date: Wed, 14 Aug 2019 19:31:55 +0200
Message-ID: <20190814173155.GR7444@phenom.ffwll.local>
References: <1565779731-1300-1-git-send-email-robert.chiras@nxp.com>
 <1565779731-1300-8-git-send-email-robert.chiras@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1565779731-1300-8-git-send-email-robert.chiras@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Robert Chiras <robert.chiras@nxp.com>
Cc: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>, Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 14, 2019 at 01:48:43PM +0300, Robert Chiras wrote:
> Currently, the vblank support is not correctly implemented in MXSFB_DRM
> driver. The call to drm_vblank_init is made with mode_config.num_crtc
> which at that time is 0. Because of this, vblank is not activated, so
> there won't be any vblank event submitted.
> For example, when running modetest with the '-v' parameter will result
> in an astronomical refresh rate (10000+ Hz), because of that.

Uh, that sounds a bit like a bug somewhere. If vblank doesn't work, we
should give userspace an error back.

Maybe we need more checks in drm_vblank_init()? Can you pls look into
that?

> 
> Signed-off-by: Robert Chiras <robert.chiras@nxp.com>
> ---
>  drivers/gpu/drm/mxsfb/mxsfb_drv.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> index 2743975..829abec 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> @@ -38,6 +38,9 @@
>  #include "mxsfb_drv.h"
>  #include "mxsfb_regs.h"
>  
> +/* The eLCDIF max possible CRTCs */
> +#define MAX_CRTCS 1
> +
>  enum mxsfb_devtype {
>  	MXSFB_V3,
>  	MXSFB_V4,
> @@ -138,6 +141,8 @@ static void mxsfb_pipe_enable(struct drm_simple_display_pipe *pipe,
>  		mxsfb->connector = &mxsfb->panel_connector;
>  	}
>  
> +	drm_crtc_vblank_on(&pipe->crtc);
> +
>  	pm_runtime_get_sync(drm->dev);
>  	drm_panel_prepare(mxsfb->panel);
>  	mxsfb_crtc_enable(mxsfb);
> @@ -164,6 +169,8 @@ static void mxsfb_pipe_disable(struct drm_simple_display_pipe *pipe)
>  	}
>  	spin_unlock_irq(&drm->event_lock);
>  
> +	drm_crtc_vblank_off(&pipe->crtc);
> +
>  	if (mxsfb->connector != &mxsfb->panel_connector)
>  		mxsfb->connector = NULL;
>  }
> @@ -246,7 +253,7 @@ static int mxsfb_load(struct drm_device *drm, unsigned long flags)
>  
>  	pm_runtime_enable(drm->dev);
>  
> -	ret = drm_vblank_init(drm, drm->mode_config.num_crtc);
> +	ret = drm_vblank_init(drm, MAX_CRTCS);
>  	if (ret < 0) {
>  		dev_err(drm->dev, "Failed to initialise vblank\n");
>  		goto err_vblank;
> @@ -269,6 +276,8 @@ static int mxsfb_load(struct drm_device *drm, unsigned long flags)
>  		goto err_vblank;
>  	}
>  
> +	drm_crtc_vblank_off(&mxsfb->pipe.crtc);

Are you sure you need this one here? vblanks should be off after
drm_vblank_init() is called.

Thanks, Daniel

> +
>  	/*
>  	 * Attach panel only if there is one.
>  	 * If there is no panel attach, it must be a bridge. In this case, we
> -- 
> 2.7.4
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
