From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 1/8] drm/bridge: rgb-to-vga: Support an
 enable GPIO
Date: Thu, 27 Oct 2016 00:17:24 +0200
Message-ID: <20161026221724.55yufeql6s5nd5gq@lukather>
References: <20161020034344.14154-1-wens@csie.org>
 <20161020034344.14154-2-wens@csie.org>
 <20161026221346.tdpmbrwca4jehch2@rob-hp-laptop>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eevsugkk5iyywdid"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBB76WYTAAKGQEC2BGNQA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20161026221346.tdpmbrwca4jehch2@rob-hp-laptop>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--eevsugkk5iyywdid
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi Rob,

On Wed, Oct 26, 2016 at 05:13:46PM -0500, Rob Herring wrote:
> On Thu, Oct 20, 2016 at 11:43:37AM +0800, Chen-Yu Tsai wrote:
> > Some rgb-to-vga bridges have an enable GPIO, either directly tied to
> > an enable pin on the bridge IC, or indirectly controlling a power
> > switch.
> > 
> > Add support for it.
> > 
> > Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> > ---
> >  .../bindings/display/bridge/dumb-vga-dac.txt       |  2 ++
> >  drivers/gpu/drm/bridge/dumb-vga-dac.c              | 28 ++++++++++++++++++++++
> >  2 files changed, 30 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/bridge/dumb-vga-dac.txt b/Documentation/devicetree/bindings/display/bridge/dumb-vga-dac.txt
> > index 003bc246a270..d3484822bf77 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/dumb-vga-dac.txt
> > +++ b/Documentation/devicetree/bindings/display/bridge/dumb-vga-dac.txt
> > @@ -16,6 +16,8 @@ graph bindings specified in Documentation/devicetree/bindings/graph.txt.
> >  - Video port 0 for RGB input
> >  - Video port 1 for VGA output
> >  
> > +Optional properties:
> > +- enable-gpios: GPIO pin to enable or disable the bridge
> 
> This should also define the active state.
> 
> > +static void dumb_vga_enable(struct drm_bridge *bridge)
> > +{
> > +	struct dumb_vga *vga = drm_bridge_to_dumb_vga(bridge);
> > +
> > +	if (vga->enable_gpio)
> > +		gpiod_set_value_cansleep(vga->enable_gpio, 1);
> 
> So the driver should allow either active high or low.

You mean like having a enable-active-high property? Isn't that
redundant with the GPIO flags?

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--eevsugkk5iyywdid--
