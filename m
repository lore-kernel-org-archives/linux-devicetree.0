From: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 2/2] drm/panel: simple: Add support for Kyocera
 TCG121XGLP panel
Date: Tue, 15 Dec 2015 18:10:34 +0100
Message-ID: <1450199434.3163.90.camel@pengutronix.de>
References: <1449081671-25327-1-git-send-email-l.stach@pengutronix.de>
	 <1449081671-25327-2-git-send-email-l.stach@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1449081671-25327-2-git-send-email-l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, patchwork-lst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

This has been on the list for 2 weeks without a reaction, so please
consider this a friendly ping.

Regards,
Lucas

Am Mittwoch, den 02.12.2015, 19:41 +0100 schrieb Lucas Stach:
> The Kyocera TCG121XGLP panel is an XGA LCD TFT panel connected through
> LVDS, which can be supported by the simple panel driver.
> 
> Signed-off-by: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---
>  .../bindings/display/panel/kyo,tcg121xglp.txt      |  7 ++++++
>  drivers/gpu/drm/panel/panel-simple.c               | 27 ++++++++++++++++++++++
>  2 files changed, 34 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/kyo,tcg121xglp.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/kyo,tcg121xglp.txt b/Documentation/devicetree/bindings/display/panel/kyo,tcg121xglp.txt
> new file mode 100644
> index 000000000000..a8e940fe731e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/kyo,tcg121xglp.txt
> @@ -0,0 +1,7 @@
> +Kyocera Corporation 12.1" XGA (1024x768) TFT LCD panel
> +
> +Required properties:
> +- compatible: should be "kyo,tcg121xglp"
> +
> +This binding is compatible with the simple-panel binding, which is specified
> +in simple-panel.txt in this directory.
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index f97b73ec4713..1476bb90ac14 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -902,6 +902,30 @@ static const struct panel_desc innolux_zj070na_01p = {
>  	},
>  };
>  
> +static const struct display_timing kyo_tcg121xglp_timing = {
> +	.pixelclock = { 52000000, 65000000, 71000000 },
> +	.hactive = { 1024, 1024, 1024 },
> +	.hfront_porch = { 2, 2, 2 },
> +	.hback_porch = { 2, 2, 2 },
> +	.hsync_len = { 86, 124, 244 },
> +	.vactive = { 768, 768, 768 },
> +	.vfront_porch = { 2, 2, 2 },
> +	.vback_porch = { 2, 2, 2 },
> +	.vsync_len = { 6, 34, 73 },
> +	.flags = DISPLAY_FLAGS_DE_HIGH,
> +};
> +
> +static const struct panel_desc kyo_tcg121xglp = {
> +	.timings = &kyo_tcg121xglp_timing,
> +	.num_timings = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 246,
> +		.height = 184,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> +};
> +
>  static const struct drm_display_mode lg_lb070wv8_mode = {
>  	.clock = 33246,
>  	.hdisplay = 800,
> @@ -1167,6 +1191,9 @@ static const struct of_device_id platform_of_match[] = {
>  		.compatible = "innolux,zj070na-01p",
>  		.data = &innolux_zj070na_01p,
>  	}, {
> +		.compatible = "kyo,tcg121xglp",
> +		.data = &kyo_tcg121xglp,
> +	}, {
>  		.compatible = "lg,lb070wv8",
>  		.data = &lg_lb070wv8,
>  	}, {

-- 
Pengutronix e.K.             | Lucas Stach                 |
Industrial Linux Solutions   | http://www.pengutronix.de/  |

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
