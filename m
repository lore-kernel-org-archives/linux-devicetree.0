From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/5] drm: convert drivers to use
 drm_of_find_panel_or_bridge
Date: Mon, 6 Feb 2017 11:32:01 -0600
Message-ID: <20170206173201.wkv5snwhvkrjruwi@rob-hp-laptop>
References: <20170204033635.10250-1-robh@kernel.org>
 <20170204033635.10250-5-robh@kernel.org>
 <20170206100301.fatil7cvasuyhnqw@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170206100301.fatil7cvasuyhnqw@lukather>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Seung-Woo Kim <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Alison Wang <alison.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Xinliang Liu <z.liuxinliang@hisi>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 06, 2017 at 11:03:01AM +0100, Maxime Ripard wrote:
> Hi Rob,
> 
> On Fri, Feb 03, 2017 at 09:36:34PM -0600, Rob Herring wrote:
> > Similar to the previous commit, convert drivers open coding OF graph
> > parsing to use drm_of_find_panel_or_bridge instead.
> > 
> > This changes some error messages to debug messages (in the graph core).
> > Graph connections are often "no connects" depending on the particular
> > board, so we want to avoid spurious messages. Plus the kernel is not a
> > DT validator.
> > 
> > Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > ---
> 
> [..]
> 
> > diff --git a/drivers/gpu/drm/sun4i/sun4i_rgb.c b/drivers/gpu/drm/sun4i/sun4i_rgb.c
> > index f5e86fe7750e..4720725b0fb0 100644
> > --- a/drivers/gpu/drm/sun4i/sun4i_rgb.c
> > +++ b/drivers/gpu/drm/sun4i/sun4i_rgb.c
> > @@ -15,6 +15,7 @@
> >  #include <drm/drmP.h>
> >  #include <drm/drm_atomic_helper.h>
> >  #include <drm/drm_crtc_helper.h>
> > +#include <drm/drm_of.h>
> >  #include <drm/drm_panel.h>
> >  
> >  #include "sun4i_drv.h"
> > @@ -217,12 +218,10 @@ int sun4i_rgb_init(struct drm_device *drm)
> >  	rgb->drv = drv;
> >  	encoder = &rgb->encoder;
> >  
> > -	tcon->panel = sun4i_tcon_find_panel(tcon->dev->of_node);
> > -	encoder->bridge = sun4i_tcon_find_bridge(tcon->dev->of_node);
> > -	if (IS_ERR(tcon->panel) && IS_ERR(encoder->bridge)) {
> > -		dev_info(drm->dev, "No panel or bridge found... RGB output disabled\n");
> > -		return 0;
> > -	}
> > +	ret = drm_of_find_panel_or_bridge(tcon->dev->of_node, 1, 0,
> > +					  &tcon->panel, &encoder->bridge);
> > +	if (ret)
> > +		return ret;
> 
> It used to ignore the error if it couldn't find the bridge. This will
> break the probe.

Well, I got it half right. :) The probe does that, but this needs to 
too.

> >  
> >  	drm_encoder_helper_add(&rgb->encoder,
> >  			       &sun4i_rgb_enc_helper_funcs);
> > @@ -239,7 +238,7 @@ int sun4i_rgb_init(struct drm_device *drm)
> >  	/* The RGB encoder can only work with the TCON channel 0 */
> >  	rgb->encoder.possible_crtcs = BIT(0);
> >  
> > -	if (!IS_ERR(tcon->panel)) {
> > +	if (tcon->panel) {
> >  		drm_connector_helper_add(&rgb->connector,
> >  					 &sun4i_rgb_con_helper_funcs);
> >  		ret = drm_connector_init(drm, &rgb->connector,
> > @@ -260,7 +259,7 @@ int sun4i_rgb_init(struct drm_device *drm)
> >  		}
> >  	}
> >  
> > -	if (!IS_ERR(encoder->bridge)) {
> > +	if (encoder->bridge) {
> >  		encoder->bridge->encoder = &rgb->encoder;
> >  
> >  		ret = drm_bridge_attach(drm, encoder->bridge);
> > @@ -268,8 +267,6 @@ int sun4i_rgb_init(struct drm_device *drm)
> >  			dev_err(drm->dev, "Couldn't attach our bridge\n");
> >  			goto err_cleanup_connector;
> >  		}
> > -	} else {
> > -		encoder->bridge = NULL;
> >  	}
> >  
> >  	return 0;
> > diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > index ea2906f87cb9..2e4e365cecf9 100644
> > --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > @@ -15,13 +15,12 @@
> >  #include <drm/drm_crtc.h>
> >  #include <drm/drm_crtc_helper.h>
> >  #include <drm/drm_modes.h>
> > -#include <drm/drm_panel.h>
> > +#include <drm/drm_of.h>
> >  
> >  #include <linux/component.h>
> >  #include <linux/ioport.h>
> >  #include <linux/of_address.h>
> >  #include <linux/of_device.h>
> > -#include <linux/of_graph.h>
> >  #include <linux/of_irq.h>
> >  #include <linux/regmap.h>
> >  #include <linux/reset.h>
> > @@ -405,74 +404,6 @@ static int sun4i_tcon_init_regmap(struct device *dev,
> >  	return 0;
> >  }
> >  
> > -struct drm_panel *sun4i_tcon_find_panel(struct device_node *node)
> > -{
> > -	struct device_node *port, *remote, *child;
> > -	struct device_node *end_node = NULL;
> > -
> > -	/* Inputs are listed first, then outputs */
> > -	port = of_graph_get_port_by_id(node, 1);
> > -
> > -	/*
> > -	 * Our first output is the RGB interface where the panel will
> > -	 * be connected.
> > -	 */
> > -	for_each_child_of_node(port, child) {
> > -		u32 reg;
> > -
> > -		of_property_read_u32(child, "reg", &reg);
> > -		if (reg == 0)
> > -			end_node = child;
> > -	}
> > -
> > -	if (!end_node) {
> > -		DRM_DEBUG_DRIVER("Missing panel endpoint\n");
> > -		return ERR_PTR(-ENODEV);
> > -	}
> > -
> > -	remote = of_graph_get_remote_port_parent(end_node);
> > -	if (!remote) {
> > -		DRM_DEBUG_DRIVER("Unable to parse remote node\n");
> > -		return ERR_PTR(-EINVAL);
> > -	}
> > -
> > -	return of_drm_find_panel(remote) ?: ERR_PTR(-EPROBE_DEFER);
> 
> And the panel is only one of our endpoints, which is optional, while
> other endpoints are mandatory. This means that we might very well have
> an endpoint that is not a panel or a bridge. In this case, I think
> your function will return an error and will be treated as such, while
> it's really the expected behaviour.
> 
> I think it's better to leave this driver alone for now, it's not as
> trivial as it looks, and will require some testing to get things
> right. I'll try to get my head around how to use your new (very
> welcome) helpers.

Well, certainly it needs testing. But this is one of the easier examples 
because you are requesting a specific port/endpoint number. It's the 
drivers that just loop over all the endpoints that give me more 
problems.

Anyway, this is 4.12 material, so I'll make the fix above and want 
to leave this in for now. 

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
