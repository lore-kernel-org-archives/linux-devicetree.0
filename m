From: "Maciej S. Szmigiero" <mail-APzI5cXaD1zVlRWJc41N0YvC60bnQu0Y@public.gmane.org>
Subject: Re: [PATCH][RESEND] drm: panel-simple: add URT UMSH-8596MD-xT panel
 support
Date: Fri, 02 Oct 2015 23:40:16 +0200
Message-ID: <560EF9C0.7080407@maciej.szmigiero.name>
References: <55E5AD23.8070309@maciej.szmigiero.name>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55E5AD23.8070309-APzI5cXaD1zVlRWJc41N0YvC60bnQu0Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Anybody here?

I've already submitted this patch two times but received no response...

Maciej Szmigiero

On 01.09.2015 15:50, Maciej S. Szmigiero wrote:
> This patch adds support for United Radiant Technology
> UMSH-8596MD-xT 7.0" WVGA TFT LCD panels
> (both LVDS and parallel versions) to DRM
> panel-simple driver.
> 
> Signed-off-by: Maciej Szmigiero <mail-APzI5cXaD1zVlRWJc41N0YvC60bnQu0Y@public.gmane.org>
> ---
> This is a resend without changes.
> 
> diff --git a/Documentation/devicetree/bindings/panel/urt,umsh-8596md.txt b/Documentation/devicetree/bindings/panel/urt,umsh-8596md.txt
> new file mode 100644
> index 0000000..2990e6b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/panel/urt,umsh-8596md.txt
> @@ -0,0 +1,11 @@
> +United Radiant Technology UMSH-8596MD-xT 7.0" WVGA TFT LCD panel
> +
> +Supported are LVDS versions (-11T, -19T) and parallel ones
> +(-T, -1T, -7T, -20T).
> +
> +Required properties:
> +- compatible: should be "urt,umsh-8596md-lvds" for LVDS versions,
> +  "urt,umsh-8596md-parallel" for parallel ones.
> +
> +This binding is compatible with the simple-panel binding, which is specified
> +in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index 66a33ae..234ce41 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -213,6 +213,7 @@ toshiba	Toshiba Corporation
>  toumaz	Toumaz
>  tplink	TP-LINK Technologies Co., Ltd.
>  truly	Truly Semiconductors Limited
> +urt	United Radiant Technology Corporation
>  usi	Universal Scientific Industrial Co., Ltd.
>  v3	V3 Semiconductor
>  variscite	Variscite Ltd.
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index f94201b..be47fd7 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -1036,6 +1036,42 @@ static const struct panel_desc shelly_sca07010_bfn_lnn = {
>  	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
>  };
>  
> +static const struct display_timing urt_umsh_8596md_timing = {
> +	.pixelclock = { 33260000, 33260000, 33260000 },
> +	.hactive = { 800, 800, 800 },
> +	.hfront_porch = { 41, 41, 41 },
> +	.hback_porch = { 216 - 128, 216 - 128, 216 - 128 },
> +	.hsync_len = { 71, 128, 128 },
> +	.vactive = { 480, 480, 480 },
> +	.vfront_porch = { 10, 10, 10 },
> +	.vback_porch = { 35 - 2, 35 - 2, 35 - 2 },
> +	.vsync_len = { 2, 2, 2 },
> +	.flags = DISPLAY_FLAGS_DE_HIGH | DISPLAY_FLAGS_PIXDATA_NEGEDGE |
> +		DISPLAY_FLAGS_HSYNC_LOW | DISPLAY_FLAGS_VSYNC_LOW,
> +};
> +
> +static const struct panel_desc urt_umsh_8596md_lvds = {
> +	.timings = &urt_umsh_8596md_timing,
> +	.num_timings = 1,
> +	.bpc = 6,
> +	.size = {
> +		.width = 152,
> +		.height = 91,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
> +};
> +
> +static const struct panel_desc urt_umsh_8596md_parallel = {
> +	.timings = &urt_umsh_8596md_timing,
> +	.num_timings = 1,
> +	.bpc = 6,
> +	.size = {
> +		.width = 152,
> +		.height = 91,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
> +};
> +
>  static const struct of_device_id platform_of_match[] = {
>  	{
>  		.compatible = "ampire,am800480r3tmqwa1h",
> @@ -1125,6 +1161,12 @@ static const struct of_device_id platform_of_match[] = {
>  		.compatible = "shelly,sca07010-bfn-lnn",
>  		.data = &shelly_sca07010_bfn_lnn,
>  	}, {
> +		.compatible = "urt,umsh-8596md-lvds",
> +		.data = &urt_umsh_8596md_lvds,
> +	}, {
> +		.compatible = "urt,umsh-8596md-parallel",
> +		.data = &urt_umsh_8596md_parallel,
> +	}, {
>  		/* sentinel */
>  	}
>  };
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
