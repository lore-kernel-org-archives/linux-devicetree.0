From: Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH v4 02/14] drm/mxsfb: Read bus flags from bridge if present
Date: Mon, 14 Oct 2019 22:24:51 +0200
Message-ID: <b5da1f015a4dd87a612e1a9e57fdca7a@agner.ch>
References: <1567078215-31601-1-git-send-email-robert.chiras@nxp.com>
 <1567078215-31601-3-git-send-email-robert.chiras@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1567078215-31601-3-git-send-email-robert.chiras@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Robert Chiras <robert.chiras@nxp.com>
Cc: =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, Marek Vasut <marex@denx.de>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 2019-08-29 13:30, Robert Chiras wrote:
> From: Guido Günther <agx@sigxcpu.org>
> 
> The bridge might have special requirmentes on the input bus. This
> is e.g. used by the imx-nwl bridge.
> 
> Signed-off-by: Guido Günther <agx@sigxcpu.org>
> Reviewed-by: Stefan Agner <stefan@agner.ch>

Applied to the drm-misc-next branch.

I decided to apply those two since they are independent from the rest.
You can drop them in the next spin of the rest.

--
Stefan


> ---
>  drivers/gpu/drm/mxsfb/mxsfb_crtc.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_crtc.c
> b/drivers/gpu/drm/mxsfb/mxsfb_crtc.c
> index de09b93..b69ace8 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_crtc.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_crtc.c
> @@ -209,7 +209,7 @@ static void mxsfb_crtc_mode_set_nofb(struct
> mxsfb_drm_private *mxsfb)
>  {
>  	struct drm_device *drm = mxsfb->pipe.crtc.dev;
>  	struct drm_display_mode *m = &mxsfb->pipe.crtc.state->adjusted_mode;
> -	const u32 bus_flags = mxsfb->connector->display_info.bus_flags;
> +	u32 bus_flags = mxsfb->connector->display_info.bus_flags;
>  	u32 vdctrl0, vsync_pulse_len, hsync_pulse_len;
>  	int err;
>  
> @@ -233,6 +233,9 @@ static void mxsfb_crtc_mode_set_nofb(struct
> mxsfb_drm_private *mxsfb)
>  
>  	clk_set_rate(mxsfb->clk, m->crtc_clock * 1000);
>  
> +	if (mxsfb->bridge && mxsfb->bridge->timings)
> +		bus_flags = mxsfb->bridge->timings->input_bus_flags;
> +
>  	DRM_DEV_DEBUG_DRIVER(drm->dev, "Pixel clock: %dkHz (actual: %dkHz)\n",
>  			     m->crtc_clock,
>  			     (int)(clk_get_rate(mxsfb->clk) / 1000));
