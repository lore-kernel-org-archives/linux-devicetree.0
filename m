From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 3/6] drm/sun4i: dsi: Add bridge support
Date: Fri, 15 Mar 2019 14:45:55 +0100
Message-ID: <20190315134555.ekpywymjx3xqmdhf@flea>
References: <20190315130825.9005-1-jagan@amarulasolutions.com>
 <20190315130825.9005-4-jagan@amarulasolutions.com>
 <c232d5620d6a3272a6064ce9ccdec5c86a3a7950.camel@bootlin.com>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pswiqfcemuf43jfz"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBF6ZV3SAKGQERLXAIGA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <c232d5620d6a3272a6064ce9ccdec5c86a3a7950.camel-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Paul Kocialkowski <paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Laurent Pinchart <Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-amarula-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org
List-Id: devicetree@vger.kernel.org


--pswiqfcemuf43jfz
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Fri, Mar 15, 2019 at 02:32:55PM +0100, Paul Kocialkowski wrote:
> Hi,
> 
> On Fri, 2019-03-15 at 18:38 +0530, Jagan Teki wrote:
> > Some display panels would come up with a non-DSI output which
> > can have an option to connect DSI interface by means of bridge
> > convertor.
> > 
> > This DSI to non-DSI bridge convertor would require a bridge
> > driver that would communicate the DSI controller for bridge
> > functionalities.
> > 
> > So, add support for bridge functionalities in Allwinner DSI
> > controller.
> 
> See a few comments below.
> 
> > Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> > ---
> >  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 65 +++++++++++++++++++-------
> >  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h |  1 +
> >  2 files changed, 49 insertions(+), 17 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > index 0960b96b62cc..64d74313b842 100644
> > --- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > +++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > @@ -781,6 +781,9 @@ static void sun6i_dsi_encoder_enable(struct drm_encoder *encoder)
> >  	if (!IS_ERR(dsi->panel))
> >  		drm_panel_prepare(dsi->panel);
> >  
> > +	if (!IS_ERR(dsi->bridge))
> > +		drm_bridge_pre_enable(dsi->bridge);
> > +
> >  	/*
> >  	 * FIXME: This should be moved after the switch to HS mode.
> >  	 *
> > @@ -796,6 +799,9 @@ static void sun6i_dsi_encoder_enable(struct drm_encoder *encoder)
> >  	if (!IS_ERR(dsi->panel))
> >  		drm_panel_enable(dsi->panel);
> >  
> > +	if (!IS_ERR(dsi->bridge))
> > +		drm_bridge_enable(dsi->bridge);
> > +
> >  	sun6i_dsi_start(dsi, DSI_START_HSC);
> >  
> >  	udelay(1000);
> > @@ -812,6 +818,9 @@ static void sun6i_dsi_encoder_disable(struct drm_encoder *encoder)
> >  	if (!IS_ERR(dsi->panel)) {
> >  		drm_panel_disable(dsi->panel);
> >  		drm_panel_unprepare(dsi->panel);
> > +	} else if (!IS_ERR(dsi->bridge)) {
> > +		drm_bridge_disable(dsi->bridge);
> > +		drm_bridge_post_disable(dsi->bridge);
> >  	}
> >  
> >  	phy_power_off(dsi->dphy);
> > @@ -973,11 +982,16 @@ static int sun6i_dsi_attach(struct mipi_dsi_host *host,
> >  	struct sun6i_dsi *dsi = host_to_sun6i_dsi(host);
> >  
> >  	dsi->device = device;
> > -	dsi->panel = of_drm_find_panel(device->dev.of_node);
> > -	if (IS_ERR(dsi->panel))
> > -		return PTR_ERR(dsi->panel);
> >  
> > -	dev_info(host->dev, "Attached device %s\n", device->name);
> > +	dsi->bridge = of_drm_find_bridge(device->dev.of_node);
> > +	if (!dsi->bridge) {
> 
> You are using IS_ERR to check that the bridge is alive in the changes
> above, but switch to checking that it's non-NULL at this point.
> 
> Are both guaranteed to be interchangeable?

They aren't. Any ERR_PTR will be !NULL

> > +		dsi->panel = of_drm_find_panel(device->dev.of_node);
> > +		if (IS_ERR(dsi->panel))
> > +			return PTR_ERR(dsi->panel);
> > +	}
> 
> You should probably use drm_of_find_panel_or_bridge instead of
> duplicating the logic here.

Or we can even use the drm_panel_bridge_add to simplify things.

Maxime

-- 
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
--pswiqfcemuf43jfz--
