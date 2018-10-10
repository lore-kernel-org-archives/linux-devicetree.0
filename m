From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 2/4] drm/panel: simple: Add support for the
 Lemaker BL035 3.5" LCD
Date: Wed, 10 Oct 2018 16:58:50 +0200
Message-ID: <20181010145850.krwe7wlqkbcpja33@flea>
References: <20181010114134.8211-1-contact@paulk.fr>
 <20181010114134.8211-2-contact@paulk.fr>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBNVH7DOQKGQEE4DDINQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20181010114134.8211-2-contact-W9ppeneeCTY@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Mark Van den Borre <mark-8Ycg9RsmSNMdnm+yROfE0A@public.gmane.org>, Gerry Demaret <gerry-8Ycg9RsmSNMdnm+yROfE0A@public.gmane.org>, Luc Verhaegen <libv-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 10, 2018 at 01:41:32PM +0200, Paul Kocialkowski wrote:
> This adds support for the 3.5" LCD panel from Lemaker, sold for use with
> BananaPi boards. It comes with a 24-bit RGB888 parallel interface and
> requires an active-low DE signal
> 
> Signed-off-by: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 97964f7f2ace..229080fcf65e 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -1461,6 +1461,30 @@ static const struct panel_desc kyo_tcg121xglp = {
>  	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
>  };
>  
> +static const struct drm_display_mode lemaker_bl035_mode = {
> +	.clock = 7000,
> +	.hdisplay = 320,
> +	.hsync_start = 320 + 20,
> +	.hsync_end = 320 + 20 + 30,
> +	.htotal = 320 + 20 + 30 + 38,
> +	.vdisplay = 240,
> +	.vsync_start = 240 + 4,
> +	.vsync_end = 240 + 4 + 3,
> +	.vtotal = 240 + 4 + 3 + 15,
> +	.vrefresh = 60,
> +};
> +
> +static const struct panel_desc lemaker_bl035 = {
> +	.modes = &lemaker_bl035_mode,
> +	.num_modes = 1,
> +	.size = {
> +		.width = 70,
> +		.height = 52,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> +	.bus_flags = DRM_BUS_FLAG_DE_LOW,
> +};
> +
>  static const struct drm_display_mode lg_lb070wv8_mode = {
>  	.clock = 33246,
>  	.hdisplay = 800,
> @@ -2456,6 +2480,9 @@ static const struct of_device_id platform_of_match[] = {
>  	}, {
>  		.compatible = "kyo,tcg121xglp",
>  		.data = &kyo_tcg121xglp,
> +	}, {
> +		.compatible = "lemaker,bl035",
> +		.data = &lemaker_bl035,

You should document that new compatible. Also, where is this name
coming from? Is it the name it's sold under? something you came up
with?

Thanks,
Maxime

-- 
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
