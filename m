From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/5] drm: of: introduce drm_of_find_panel_or_bridge
Date: Mon, 6 Feb 2017 10:53:23 -0600
Message-ID: <20170206165323.255ltzlzmpfx4vl7@rob-hp-laptop>
References: <20170204033635.10250-1-robh@kernel.org>
 <20170204033635.10250-3-robh@kernel.org>
 <1486377768.3005.34.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1486377768.3005.34.camel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Seung-Woo Kim <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Alison Wang <alison.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Xinliang Liu <z.liuxinliang@hisi>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 06, 2017 at 11:42:48AM +0100, Philipp Zabel wrote:
> On Fri, 2017-02-03 at 21:36 -0600, Rob Herring wrote:
> > Many drivers have a common pattern of searching the OF graph for either an
> > attached panel or bridge and then finding the DRM struct for the panel
> > or bridge. Also, most drivers need to handle deferred probing when the
> > DRM device is not yet instantiated. Create a common function,
> > drm_of_find_panel_or_bridge, to find the connected node and the
> > associated DRM panel or bridge device.

[...]

> > +int drm_of_find_panel_or_bridge(const struct device_node *np,
> > +				int port, int endpoint,
> > +				struct drm_panel **panel,
> > +				struct drm_bridge **bridge)
> > +{
> > +	int ret = -ENODEV;
> 
> This is only returned if !panel && !bridge. I'd consider this invalid
> usage of this function, so maybe use -EINVAL?

Yes.

> > +	struct device_node *remote;
> > +
> > +	remote = of_graph_get_remote_node(np, port, endpoint);
> > +	if (!remote)
> > +		return -ENODEV;
> > +
> > +	if (bridge)
> > +		*bridge = NULL;
> 
> I would move this ^ ...
> 
> > +	if (panel) {
> > +		*panel = of_drm_find_panel(remote);
> > +		if (*panel) {
> 
> ... here.

Okay.

> > +			ret = 0;
> > +			goto out_put;
> > +		}
> > +		ret = -EPROBE_DEFER;
> > +	}
> > +
> > +	if (bridge) {
> > +		*bridge = of_drm_find_bridge(remote);
> > +		if (*bridge)
> > +			ret = 0;
> > +		else
> > +			ret = -EPROBE_DEFER;
> > +	}
> > +out_put:
> > +	of_node_put(remote);
> > +	return ret;
> > +}

I've ended up re-writing things a bit getting rid of the goto and the 
result looks like this:

int drm_of_find_panel_or_bridge(const struct device_node *np,
				int port, int endpoint,
				struct drm_panel **panel,
				struct drm_bridge **bridge)
{
	int ret = -EPROBE_DEFER;
	struct device_node *remote;

	if (!panel && !bridge)
		return -EINVAL;

	remote = of_graph_get_remote_node(np, port, endpoint);
	if (!remote)
		return -ENODEV;

	if (panel) {
		*panel = of_drm_find_panel(remote);
		if (*panel) {
			if (bridge)
				*bridge = NULL;
			ret = 0;
		}
	}

	/* No panel found yet, check for a bridge next. */
	if (ret && bridge) {
		*bridge = of_drm_find_bridge(remote);
		if (*bridge)
			ret = 0;
	}

	of_node_put(remote);
	return ret;
}

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
