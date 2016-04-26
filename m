From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4 08/11] drm: sun4i: tv: Add PAL output standard
Date: Tue, 26 Apr 2016 11:59:24 +0200
Message-ID: <20160426115924.2234bca5@bbrezillon>
References: <1461590572-4027-1-git-send-email-maxime.ripard@free-electrons.com>
	<1461590572-4027-9-git-send-email-maxime.ripard@free-electrons.com>
Reply-To: boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCIPJ6FA2QLBB7PX7S4AKGQEMKGZWPY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <1461590572-4027-9-git-send-email-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 25 Apr 2016 15:22:49 +0200
Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:

> Now that we have support for the composite output, we can start adding new
> supported standards. Start with PAL, and we will add other eventually.
> 
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Reviewed-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

> ---
>  drivers/gpu/drm/sun4i/sun4i_tv.c | 42 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tv.c b/drivers/gpu/drm/sun4i/sun4i_tv.c
> index 78634dfc0f77..ccf275a90132 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tv.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_tv.c
> @@ -178,7 +178,49 @@ struct sun4i_tv {
>  	struct sun4i_drv	*drv;
>  };
>  
> +struct video_levels pal_video_levels = {
> +	.black = 252,	.blank = 252,
> +};
> +
> +struct burst_levels pal_burst_levels = {
> +	.cb = 40,	.cr = 40,
> +};
> +
> +struct color_gains pal_color_gains = {
> +	.cb = 224,	.cr = 224,
> +};
> +
> +struct resync_parameters pal_resync_parameters = {
> +	.field = true,	.line = 13,	.pixel = 12,
> +};
> +
>  struct tv_mode tv_modes[] = {
> +	{
> +		.name		= "PAL",
> +		.mode		= SUN4I_TVE_CFG0_RES_576i,
> +		.chroma_freq	= 0x2a098acb,
> +
> +		.back_porch	= 138,
> +		.front_porch	= 24,
> +		.line_number	= 625,
> +
> +		.hdisplay	= 720,
> +		.hfront_porch	= 3,
> +		.hsync_len	= 2,
> +		.hback_porch	= 139,
> +
> +		.vdisplay	= 576,
> +		.vfront_porch	= 28,
> +		.vsync_len	= 2,
> +		.vback_porch	= 19,
> +
> +		.vblank_level	= 252,
> +
> +		.color_gains	= &pal_color_gains,
> +		.burst_levels	= &pal_burst_levels,
> +		.video_levels	= &pal_video_levels,
> +		.resync_params	= &pal_resync_parameters,
> +	},
>  };
>  
>  static inline struct sun4i_tv *



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
