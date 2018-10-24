From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 1/4] drm/sun4i: tcon: Support an active-low
 DE signal with RGB interface
Date: Wed, 24 Oct 2018 17:47:58 +0100
Message-ID: <20181024164758.iqnlie4witckzauy@flea>
References: <20181010114134.8211-1-contact@paulk.fr>
 <20181010145736.l6zpohvvd4b5qngr@flea>
 <224ec158bf627b4d2f577b1dadf10bd87891e2a7.camel@paulk.fr>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBSOEYLPAKGQENDIW2RI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <224ec158bf627b4d2f577b1dadf10bd87891e2a7.camel-W9ppeneeCTY@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Mark Van den Borre <mark-8Ycg9RsmSNMdnm+yROfE0A@public.gmane.org>, Gerry Demaret <gerry-8Ycg9RsmSNMdnm+yROfE0A@public.gmane.org>, Luc Verhaegen <libv-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 23, 2018 at 11:33:10AM +0200, Paul Kocialkowski wrote:
> Hi,
>=20
> Le mercredi 10 octobre 2018 =C3=A0 16:57 +0200, Maxime Ripard a =C3=A9cri=
t :
> > On Wed, Oct 10, 2018 at 01:41:31PM +0200, Paul Kocialkowski wrote:
> > > Some panels need an active-low data enable (DE) signal for the RGB
> > > interface. This requires flipping a bit in the TCON0 polarity registe=
r
> > > when setting up the mode for the RGB interface.
> > >=20
> > > Add a new helper function to match specific bus flags and use it to s=
et
> > > the polarity inversion bit for the DE signal when required.
> > >=20
> > > Signed-off-by: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
> > > ---
> > >  drivers/gpu/drm/sun4i/sun4i_tcon.c | 28 ++++++++++++++++++++++++++--
> > >  drivers/gpu/drm/sun4i/sun4i_tcon.h |  1 +
> > >  2 files changed, 27 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun=
4i/sun4i_tcon.c
> > > index 3fb084f802e2..d249a462ec09 100644
> > > --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > > +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > > @@ -78,6 +78,24 @@ static int sun4i_tcon_get_pixel_depth(const struct=
 drm_encoder *encoder)
> > >  	return -EINVAL;
> > >  }
> > > =20
> > > +static bool sun4i_tcon_match_bus_flags(const struct drm_encoder *enc=
oder,
> > > +				       u32 bus_flags)
> > > +{
> > > +	struct drm_connector *connector;
> > > +	struct drm_display_info *info;
> > > +
> > > +	connector =3D sun4i_tcon_get_connector(encoder);
> > > +	if (!connector)
> > > +		return false;
> > > +
> > > +	info =3D &connector->display_info;
> > > +
> > > +	if ((info->bus_flags & bus_flags) =3D=3D bus_flags)
> > > +		return true;
> > > +
> > > +	return false;
> > > +}
> > > +
> > >  static void sun4i_tcon_channel_set_status(struct sun4i_tcon *tcon, i=
nt channel,
> > >  					  bool enabled)
> > >  {
> > > @@ -415,6 +433,7 @@ static void sun4i_tcon0_mode_set_lvds(struct sun4=
i_tcon *tcon,
> > >  }
> > > =20
> > >  static void sun4i_tcon0_mode_set_rgb(struct sun4i_tcon *tcon,
> > > +				     const struct drm_encoder *encoder,
> > >  				     const struct drm_display_mode *mode)
> > >  {
> > >  	unsigned int bp, hsync, vsync;
> > > @@ -474,8 +493,13 @@ static void sun4i_tcon0_mode_set_rgb(struct sun4=
i_tcon *tcon,
> > >  	if (mode->flags & DRM_MODE_FLAG_PVSYNC)
> > >  		val |=3D SUN4I_TCON0_IO_POL_VSYNC_POSITIVE;
> > > =20
> > > +	if (sun4i_tcon_match_bus_flags(encoder, DRM_BUS_FLAG_DE_LOW))
> > > +		val |=3D SUN4I_TCON0_IO_POL_DE_NEGATIVE;
> > > +
> >=20
> > There's other flags in use in that function, you should also migrate
> > them (ideally by splitting that new function into a separate patch).
>=20
> Actually, these other flags are not DRM bus flags but DRM mode flags,
> which can be accessed directly from the mode pointer passed as
> argument. Thus, they don't require a helper.

I was talking about DRM_BUS_FLAG_PIXDATA_POSEDGE and
DRM_BUS_FLAG_PIXDATA_NEGEDGE, which are in the current tree.

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
