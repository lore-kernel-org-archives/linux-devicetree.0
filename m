From: Joshua Clayton <stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 1/2] drm/panel: simple: Add support for Sharp
 LQ101K1LY04
Date: Wed, 29 Jun 2016 15:08:22 -0700
Message-ID: <577446D6.1050201@gmail.com>
References: <1464795351-11668-1-git-send-email-stillcompiling@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1464795351-11668-1-git-send-email-stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Thierry, David,
Can these patches be pulled in?
Do I need anything additional?
the Documentation bit has been Acked by Rob Herring.

On 06/01/2016 08:35 AM, Joshua Clayton wrote:
> Trivial patch to add Sharp LQ101K1LY04i to simple-panel
>
> Support the Sharp LQ101K1LY04i, a 10 inch WXGA (1280x800) lvds panel.
>
> Signed-off-by: Joshua Clayton <stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>
>  This trivial addition and its documenatation patch was reviewed for 4.5;
>  the only problems then were alphabetization. 
>
>  They slipped through the cracks and I haven't had the time to rebase and
>  repost them until now. hopefully we can get these into 4.8?
>
>  drivers/gpu/drm/panel/panel-simple.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 3a7bdf1..c2d377c 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -1270,6 +1270,30 @@ static const struct panel_desc samsung_ltn140at29_301 = {
>  	},
>  };
>  
> +static const struct display_timing sharp_lq101k1ly04_timing = {
> +	.pixelclock = { 60000000, 65000000, 80000000 },
> +	.hactive = { 1280, 1280, 1280 },
> +	.hfront_porch = { 20, 20, 20 },
> +	.hback_porch = { 20, 20, 20 },
> +	.hsync_len = { 10, 10, 10 },
> +	.vactive = { 800, 800, 800 },
> +	.vfront_porch = { 4, 4, 4 },
> +	.vback_porch = { 4, 4, 4 },
> +	.vsync_len = { 4, 4, 4 },
> +	.flags = DISPLAY_FLAGS_PIXDATA_POSEDGE,
> +};
> +
> +static const struct panel_desc sharp_lq101k1ly04 = {
> +	.timings = &sharp_lq101k1ly04_timing,
> +	.num_timings = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 217,
> +		.height = 136,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA,
> +};
> +
>  static const struct drm_display_mode shelly_sca07010_bfn_lnn_mode = {
>  	.clock = 33300,
>  	.hdisplay = 800,
> @@ -1487,6 +1511,9 @@ static const struct of_device_id platform_of_match[] = {
>  		.compatible = "samsung,ltn140at29-301",
>  		.data = &samsung_ltn140at29_301,
>  	}, {
> +		.compatible = "sharp,lq101k1ly04",
> +		.data = &sharp_lq101k1ly04,
> +	}, {
>  		.compatible = "shelly,sca07010-bfn-lnn",
>  		.data = &shelly_sca07010_bfn_lnn,
>  	}, {

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
