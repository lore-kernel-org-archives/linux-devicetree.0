From: Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 3/5] drm: convert drivers to use of_graph_get_remote_node
Date: Mon, 6 Feb 2017 17:23:06 +0000
Message-ID: <20170206172306.GY3140@e110455-lin.cambridge.arm.com>
References: <20170204033635.10250-1-robh@kernel.org>
 <20170204033635.10250-4-robh@kernel.org>
 <20170206102933.GV3140@e110455-lin.cambridge.arm.com>
 <20170206170949.tmm4m2lm2rybm5dh@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170206170949.tmm4m2lm2rybm5dh@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Seung-Woo Kim <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Alison Wang <alison.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Xinliang Liu <z.liuxinliang@hisi>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 06, 2017 at 11:09:49AM -0600, Rob Herring wrote:
> On Mon, Feb 06, 2017 at 10:29:33AM +0000, Liviu Dudau wrote:
> > On Fri, Feb 03, 2017 at 09:36:33PM -0600, Rob Herring wrote:
> > > Convert drivers to use the new of_graph_get_remote_node() helper
> > > instead of parsing the endpoint node and then getting the remote device
> > > node. Now drivers can just specify the device node and which
> > > port/endpoint and get back the connected remote device node. The details
> > > of the graph binding are nicely abstracted into the core OF graph code.
> > > 
> > > This changes some error messages to debug messages (in the graph core).
> > > Graph connections are often "no connects" depending on the particular
> > > board, so we want to avoid spurious messages. Plus the kernel is not a
> > > DT validator.
> > > 
> > > Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > > ---
> > >  drivers/gpu/drm/arm/hdlcd_drv.c                 | 22 ++-------
> > >  drivers/gpu/drm/arm/malidp_drv.c                | 29 ++---------
> > >  drivers/gpu/drm/bridge/adv7511/adv7533.c        | 12 +----
> > >  drivers/gpu/drm/bridge/dumb-vga-dac.c           | 15 ++----
> > >  drivers/gpu/drm/bridge/ti-tfp410.c              | 15 ++----
> > >  drivers/gpu/drm/exynos/exynos_drm_dpi.c         | 16 +-----
> > >  drivers/gpu/drm/exynos/exynos_drm_dsi.c         | 13 ++---
> > >  drivers/gpu/drm/exynos/exynos_drm_mic.c         | 27 +---------
> > >  drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c    | 26 ++--------
> > >  drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c | 30 +----------
> > >  drivers/gpu/drm/mediatek/mtk_dpi.c              | 12 ++---
> > >  drivers/gpu/drm/mediatek/mtk_hdmi.c             | 26 ++--------
> > >  drivers/gpu/drm/meson/meson_drv.c               | 12 ++---
> > >  drivers/gpu/drm/meson/meson_venc_cvbs.c         | 19 ++-----
> > >  drivers/gpu/drm/msm/dsi/dsi_host.c              |  3 +-
> > >  drivers/gpu/drm/msm/mdp/mdp4/mdp4_kms.c         | 28 +----------
> > >  drivers/gpu/drm/rockchip/rockchip_drm_drv.c     | 18 +++----
> > >  drivers/gpu/drm/tilcdc/tilcdc_crtc.c            | 11 +----
> > >  drivers/gpu/drm/tilcdc/tilcdc_external.c        | 66 +++----------------------
> > >  drivers/gpu/drm/vc4/vc4_dpi.c                   | 15 ++----
> > >  20 files changed, 64 insertions(+), 351 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_drv.c
> > > index e5f4f4a6546d..0f70f5fe9970 100644
> > > --- a/drivers/gpu/drm/arm/hdlcd_drv.c
> > > +++ b/drivers/gpu/drm/arm/hdlcd_drv.c
> > > @@ -430,29 +430,13 @@ static int compare_dev(struct device *dev, void *data)
> > >  
> > >  static int hdlcd_probe(struct platform_device *pdev)
> > >  {
> > > -	struct device_node *port, *ep;
> > > +	struct device_node *port;
> > >  	struct component_match *match = NULL;
> > >  
> > > -	if (!pdev->dev.of_node)
> > > -		return -ENODEV;
> > > -
> > >  	/* there is only one output port inside each device, find it */
> > > -	ep = of_graph_get_next_endpoint(pdev->dev.of_node, NULL);
> > > -	if (!ep)
> > > -		return -ENODEV;
> > > -
> > > -	if (!of_device_is_available(ep)) {
> > > -		of_node_put(ep);
> > > +	port = of_graph_get_remote_node(pdev->dev.of_node, 0, 0);
> > > +	if (!port)
> > >  		return -ENODEV;
> > > -	}
> > > -
> > > -	/* add the remote encoder port as component */
> > > -	port = of_graph_get_remote_port_parent(ep);
> > > -	of_node_put(ep);
> > > -	if (!port || !of_device_is_available(port)) {
> > > -		of_node_put(port);
> > > -		return -EAGAIN;
> > 
> > The HDLCD change looks reasonable except for this -EAGAIN business. I'll have to
> > test your changes on my setup to see how this affects having the encoder as a module.
> 
> What are you expecting to happen with -EAGAIN? This one was a bit of an 
> oddball.

When both the HDLCD and the TDA998x drivers are compiled as modules, the order in which
they are inserted can be somewhat random (due to testing). It is at that time when you
want the probe of HDLCD to be retried on the insmod-ing of the tda998x.ko rather than
fail entirely.

> 
> This condition would only change if you had an overlay. That's a use 
> case that needs to be handled in a common way ('cause I don't want to 
> clean-up every driver doing overlays in their own way latter). Just 
> having "status" changing at runtime would have all sorts of implications 
> in the kernel.

Hmm, not sure what you mean here with overlays. Are you thinking that the
remote port is initially disabled and then re-enabled by an overlay? That is
not the only way of_device_is_available() can fail, see above regarding modules.

Best regards,
Liviu

> 
> > 
> > > -	}
> > >  
> > >  	drm_of_component_match_add(&pdev->dev, &match, compare_dev, port);
> > >  	of_node_put(port);
> > > diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
> > > index 32f746e31379..bfa04be7f5de 100644
> > > --- a/drivers/gpu/drm/arm/malidp_drv.c
> > > +++ b/drivers/gpu/drm/arm/malidp_drv.c
> > > @@ -262,7 +262,6 @@ static int malidp_bind(struct device *dev)
> > >  {
> > >  	struct resource *res;
> > >  	struct drm_device *drm;
> > > -	struct device_node *ep;
> > >  	struct malidp_drm *malidp;
> > >  	struct malidp_hw_device *hwdev;
> > >  	struct platform_device *pdev = to_platform_device(dev);
> > > @@ -360,12 +359,7 @@ static int malidp_bind(struct device *dev)
> > >  		goto init_fail;
> > >  
> > >  	/* Set the CRTC's port so that the encoder component can find it */
> > > -	ep = of_graph_get_next_endpoint(dev->of_node, NULL);
> > > -	if (!ep) {
> > > -		ret = -EINVAL;
> > > -		goto port_fail;
> > > -	}
> > > -	malidp->crtc.port = of_get_next_parent(ep);
> > > +	malidp->crtc.port = of_graph_get_port_by_id(dev->of_node, 0);
> > >  
> > >  	ret = component_bind_all(dev, drm);
> > >  	if (ret) {
> > > @@ -418,9 +412,7 @@ static int malidp_bind(struct device *dev)
> > >  irq_init_fail:
> > >  	component_unbind_all(dev, drm);
> > >  bind_fail:
> > > -	of_node_put(malidp->crtc.port);
> > 
> > Why removing this line? AFAICT this is still needed, according to of_graph_get_port_by_id()
> > documentation.
> 
> Yes, you are right.
> 
> Rob

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
