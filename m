From: Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 3/5] drm: convert drivers to use of_graph_get_remote_node
Date: Mon, 6 Feb 2017 10:31:15 +0200
Message-ID: <270924f7-8e92-a99a-a185-c814cdf1fe01@ti.com>
References: <20170204033635.10250-1-robh@kernel.org>
 <20170204033635.10250-4-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170204033635.10250-4-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Seung-Woo Kim <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Alison Wang <alison.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Xinliang Liu <z.liuxinliang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Rongrong Zou <zourongrong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Xinwei Kong <kong.kongxinwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Chen
List-Id: devicetree@vger.kernel.org

Thanks Rob, for nice cleanup, but ...

On 02/04/17 05:36, Rob Herring wrote:
> diff --git a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
> index 6dfdb145f3bb..e74cc236a79b 100644
> --- a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
> +++ b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
> @@ -1013,16 +1013,7 @@ int tilcdc_crtc_create(struct drm_device *dev)
>  	drm_crtc_helper_add(crtc, &tilcdc_crtc_helper_funcs);
>  
>  	if (priv->is_componentized) {
> -		struct device_node *ports =
> -			of_get_child_by_name(dev->dev->of_node, "ports");
> -
> -		if (ports) {
> -			crtc->port = of_get_child_by_name(ports, "port");
> -			of_node_put(ports);
> -		} else {
> -			crtc->port =
> -				of_get_child_by_name(dev->dev->of_node, "port");
> -		}
> +		crtc->port = of_graph_get_port_by_id(dev->dev->of_node, 0, 0);
>  		if (!crtc->port) { /* This should never happen */
>  			dev_err(dev->dev, "Port node not found in %s\n",
>  				dev->dev->of_node->full_name);
> diff --git a/drivers/gpu/drm/tilcdc/tilcdc_external.c b/drivers/gpu/drm/tilcdc/tilcdc_external.c
> index c67d7cd7d57e..b7523dce4e8a 100644
> --- a/drivers/gpu/drm/tilcdc/tilcdc_external.c
> +++ b/drivers/gpu/drm/tilcdc/tilcdc_external.c
> @@ -187,39 +187,6 @@ int tilcdc_attach_bridge(struct drm_device *ddev, struct drm_bridge *bridge)
>  	return ret;
>  }
>  
> -static int tilcdc_node_has_port(struct device_node *dev_node)
> -{
> -	struct device_node *node;
> -
> -	node = of_get_child_by_name(dev_node, "ports");
> -	if (!node)
> -		node = of_get_child_by_name(dev_node, "port");
> -	if (!node)
> -		return 0;
> -	of_node_put(node);
> -
> -	return 1;
> -}
> -
> -static
> -struct device_node *tilcdc_get_remote_node(struct device_node *node)
> -{
> -	struct device_node *ep;
> -	struct device_node *parent;
> -
> -	if (!tilcdc_node_has_port(node))
> -		return NULL;
> -
> -	ep = of_graph_get_next_endpoint(node, NULL);
> -	if (!ep)
> -		return NULL;
> -
> -	parent = of_graph_get_remote_port_parent(ep);
> -	of_node_put(ep);
> -
> -	return parent;
> -}
> -
>  int tilcdc_attach_external_device(struct drm_device *ddev)
>  {
>  	struct tilcdc_drm_private *priv = ddev->dev_private;
> @@ -227,7 +194,7 @@ int tilcdc_attach_external_device(struct drm_device *ddev)
>  	struct drm_bridge *bridge;
>  	int ret;
>  
> -	remote_node = tilcdc_get_remote_node(ddev->dev->of_node);
> +	remote_node = of_graph_get_remote_node(ddev->dev->of_node, 0, 0);
>  	if (!remote_node)
>  		return 0;
>  
> @@ -266,35 +233,18 @@ int tilcdc_get_external_components(struct device *dev,
>  				   struct component_match **match)
>  {
>  	struct device_node *node;
> -	struct device_node *ep = NULL;
> -	int count = 0;
> -	int ret = 0;
>  
> -	if (!tilcdc_node_has_port(dev->of_node))


> +	if (!match)
>  		return 0;

This will break tilcdc on setups that use the old tilcdc internal panel-
or tfp410- support. The driver uses tilcdc_get_external_components()
with match == NULL to check if the setup uses graph binding or legacy
internal panel/tfp410 support.

My intention is to get rid off the legacy internal encoder and connector
support (I even did that once already, but DRM had lot of infrastructure
changes in that area and my changes became obsolete), but we still need it.

>  
> -	while ((ep = of_graph_get_next_endpoint(dev->of_node, ep))) {
> -		node = of_graph_get_remote_port_parent(ep);
> -		if (!node || !of_device_is_available(node)) {
> -			of_node_put(node);
> -			continue;
> -		}
> -
> -		dev_dbg(dev, "Subdevice node '%s' found\n", node->name);
> -
> -		if (of_device_is_compatible(node, "nxp,tda998x")) {
> -			if (match)
> -				drm_of_component_match_add(dev, match,
> -							   dev_match_of, node);
> -			ret = 1;
> -		}
> +	node = of_graph_get_remote_node(dev->of_node, 0, 0);
>  
> +	if (!of_device_is_compatible(node, "nxp,tda998x")) {
>  		of_node_put(node);
> -		if (count++ > 1) {
> -			dev_err(dev, "Only one port is supported\n");
> -			return -EINVAL;
> -		}
> +		return 0;
>  	}
>  
> -	return ret;

Simply remove the above mentioned if statement add and this here:
if (match)
> +	drm_of_component_match_add(dev, match, dev_match_of, node);
> +	of_node_put(node);
> +	return 1;
>  }

Best regards,
Jyri

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
