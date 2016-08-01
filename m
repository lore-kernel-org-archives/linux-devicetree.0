From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH V3 1/5] drm/imx-ldb: Add support to drm-bridge
Date: Mon, 01 Aug 2016 12:21:10 +0200
Message-ID: <1470046870.3025.36.camel@pengutronix.de>
References: <1464626385-19253-1-git-send-email-peter.senna@collabora.com>
	 <cover.1469993472.git.peter.senna@collabora.com>
	 <5d55969a1509de751dc550d9a02bd5070455f99b.1469993472.git.peter.senna@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5d55969a1509de751dc550d9a02bd5070455f99b.1469993472.git.peter.senna-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Senna Tschudin <peter.senna-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org, andrey.gusakov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am Sonntag, den 31.07.2016, 21:55 +0200 schrieb Peter Senna Tschudin:
> Add support to attach a drm_bridge to imx-ldb in addition to
> existing support to attach a LVDS panel.
> 
> This patch does a simple code refactoring by moving code
> from for_each_child_of_node iterator to a new function named
> imx_ldb_panel_ddc(). This was necessary to allow the panel ddc
> code to run only when the imx_ldb is not attached to a bridge.
> 
> Cc: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
> Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
> Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>
> Cc: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Peter Senna Tschudin <peter.senna-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
> ---
> Changes from V2:
>  - Updated to be aplied on top of Liu Ying changes that made imx-ldb atomic.
>  - Tested on next-20160729.
[...]
> @@ -469,19 +473,28 @@ static int imx_ldb_register(struct drm_device *drm,
>  	drm_encoder_init(drm, encoder, &imx_ldb_encoder_funcs,
>  			 DRM_MODE_ENCODER_LVDS, NULL);
>  
> -	drm_connector_helper_add(&imx_ldb_ch->connector,
> -			&imx_ldb_connector_helper_funcs);
> -	drm_connector_init(drm, &imx_ldb_ch->connector,
> -			   &imx_ldb_connector_funcs, DRM_MODE_CONNECTOR_LVDS);
> -
>  	if (imx_ldb_ch->panel) {
> +		drm_connector_helper_add(&imx_ldb_ch->connector,
> +				&imx_ldb_connector_helper_funcs);
> +		drm_connector_init(drm, &imx_ldb_ch->connector,
> +				&imx_ldb_connector_funcs,
> +				DRM_MODE_CONNECTOR_LVDS);

This is still not right. We want to add the connector whenever there is
no bridge that brings its own, not only when there is a panel. For
historical reasons, the ldb driver can also work without a panel.

>  		ret = drm_panel_attach(imx_ldb_ch->panel,
> -				       &imx_ldb_ch->connector);
> +				&imx_ldb_ch->connector);

What is the purpose of this change?

>  		if (ret)
>  			return ret;
>  	}
>  
> -	drm_mode_connector_attach_encoder(&imx_ldb_ch->connector, encoder);

Where is this gone?

> +	if (imx_ldb_ch->bridge) {
> +		imx_ldb_ch->bridge->encoder = encoder;
> +
> +		imx_ldb_ch->encoder.bridge = imx_ldb_ch->bridge;
> +		ret = drm_bridge_attach(drm, imx_ldb_ch->bridge);
> +		if (ret) {
> +			DRM_ERROR("Failed to initialize bridge with drm\n");
> +			return ret;
> +		}
> +	}
>  
>  	return 0;
>  }

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
