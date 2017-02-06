From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 2/5] drm: of: introduce drm_of_find_panel_or_bridge
Date: Mon, 06 Feb 2017 11:42:48 +0100
Message-ID: <1486377768.3005.34.camel@pengutronix.de>
References: <20170204033635.10250-1-robh@kernel.org>
         <20170204033635.10250-3-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170204033635.10250-3-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Seung-Woo Kim <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Alison Wang <alison.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Xinliang Liu <z.liuxinliang@hisi>
List-Id: devicetree@vger.kernel.org

On Fri, 2017-02-03 at 21:36 -0600, Rob Herring wrote:
> Many drivers have a common pattern of searching the OF graph for either an
> attached panel or bridge and then finding the DRM struct for the panel
> or bridge. Also, most drivers need to handle deferred probing when the
> DRM device is not yet instantiated. Create a common function,
> drm_of_find_panel_or_bridge, to find the connected node and the
> associated DRM panel or bridge device.
> 
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>  drivers/gpu/drm/drm_of.c | 50 ++++++++++++++++++++++++++++++++++++++++++++++++
>  include/drm/drm_of.h     | 13 +++++++++++++
>  2 files changed, 63 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
> index 47848ed8ca48..b29ce2f52113 100644
> --- a/drivers/gpu/drm/drm_of.c
> +++ b/drivers/gpu/drm/drm_of.c
> @@ -3,7 +3,9 @@
>  #include <linux/list.h>
>  #include <linux/of_graph.h>
>  #include <drm/drmP.h>
> +#include <drm/drm_bridge.h>
>  #include <drm/drm_crtc.h>
> +#include <drm/drm_panel.h>
>  #include <drm/drm_of.h>
>  
>  static void drm_release_of(struct device *dev, void *data)
> @@ -207,3 +209,51 @@ int drm_of_encoder_active_endpoint(struct device_node *node,
>  	return -EINVAL;
>  }
>  EXPORT_SYMBOL_GPL(drm_of_encoder_active_endpoint);
> +
> +/*
> + * drm_of_find_panel_or_bridge - return connected panel or bridge device
> + * @np: device tree node containing encoder input ports
> + * @panel: pointer to hold returned drm_panel
> + * @bridge: pointer to hold returned drm_bridge
> + *
> + * Given a DT node's port and endpoint number, find the connected node and
> + * return either the associated struct drm_panel or drm_bridge device.

Add a commend that at least one of panel, bridge must be set?

> + * Returns zero if successful, or one of the standard error codes if it fails.
> + */
> +int drm_of_find_panel_or_bridge(const struct device_node *np,
> +				int port, int endpoint,
> +				struct drm_panel **panel,
> +				struct drm_bridge **bridge)
> +{
> +	int ret = -ENODEV;

This is only returned if !panel && !bridge. I'd consider this invalid
usage of this function, so maybe use -EINVAL?

> +	struct device_node *remote;
> +
> +	remote = of_graph_get_remote_node(np, port, endpoint);
> +	if (!remote)
> +		return -ENODEV;
> +
> +	if (bridge)
> +		*bridge = NULL;

I would move this ^ ...

> +	if (panel) {
> +		*panel = of_drm_find_panel(remote);
> +		if (*panel) {

... here.

> +			ret = 0;
> +			goto out_put;
> +		}
> +		ret = -EPROBE_DEFER;
> +	}
> +
> +	if (bridge) {
> +		*bridge = of_drm_find_bridge(remote);
> +		if (*bridge)
> +			ret = 0;
> +		else
> +			ret = -EPROBE_DEFER;
> +	}
> +out_put:
> +	of_node_put(remote);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(drm_of_find_panel_or_bridge);
> diff --git a/include/drm/drm_of.h b/include/drm/drm_of.h
> index 26a64805cc15..f86507f0599b 100644
> --- a/include/drm/drm_of.h
> +++ b/include/drm/drm_of.h
> @@ -8,6 +8,8 @@ struct component_match;
>  struct device;
>  struct drm_device;
>  struct drm_encoder;
> +struct drm_panel;
> +struct drm_bridge;
>  struct device_node;
>  
>  #ifdef CONFIG_OF
> @@ -23,6 +25,10 @@ extern int drm_of_component_probe(struct device *dev,
>  extern int drm_of_encoder_active_endpoint(struct device_node *node,
>  					  struct drm_encoder *encoder,
>  					  struct of_endpoint *endpoint);
> +extern int drm_of_find_panel_or_bridge(const struct device_node *np,
> +				       int port, int endpoint,
> +				       struct drm_panel **panel,
> +				       struct drm_bridge **bridge);
>  #else
>  static inline uint32_t drm_of_find_possible_crtcs(struct drm_device *dev,
>  						  struct device_node *port)
> @@ -52,6 +58,13 @@ static inline int drm_of_encoder_active_endpoint(struct device_node *node,
>  {
>  	return -EINVAL;
>  }
> +static inline int drm_of_find_panel_or_bridge(const struct device_node *np,
> +					      int port, int endpoint,
> +					      struct drm_panel **panel,
> +					      struct drm_bridge **bridge)
> +{
> +	return -EINVAL;
> +}
>  #endif
>  
>  static inline int drm_of_encoder_active_endpoint_id(struct device_node *node,

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
