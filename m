From: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Subject: Re: [PATCH v2 1/7] drm/sun4i: tcon: Pass encoder
 instead of using panel for RGB setup
Date: Mon, 05 Nov 2018 11:21:09 +0100
Message-ID: <48d864c0da9200ff052ec0cc0879d7b00de23b7a.camel@paulk.fr>
References: <20181101200045.6078-1-contact@paulk.fr>
	 <20181101200045.6078-2-contact@paulk.fr>
	 <20181105085927.tvg5vy3oyygw65z6@flea>
Reply-To: contact-W9ppeneeCTY@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-2RKZOHW4noP3lk/w0Veq"
Return-path: <linux-sunxi+bncBC75HK6WUAEBB3FSQDPQKGQEQR4YY4Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20181105085927.tvg5vy3oyygw65z6@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--=-2RKZOHW4noP3lk/w0Veq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le lundi 05 novembre 2018 =C3=A0 09:59 +0100, Maxime Ripard a =C3=A9crit :
> Hi,
>=20
> On Thu, Nov 01, 2018 at 09:00:39PM +0100, Paul Kocialkowski wrote:
> > Features such as dithering and pixel data edge configuration currently
> > rely on the panel registered with the TCON driver. However, bridges are
> > also supported in addition panels.
> >=20
> > Instead of retrieving the connector from the panel, pass the encoder
> > from the calling function, as is done for other interfaces.
> >=20
> > The connector is then retrieved from the encoder with the dedicated
> > helper. Even in the case of bridges, the connector is registered with
> > the encoder from our driver and is accessible when iterating connectors=
.
> >=20
> > Signed-off-by: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
> > ---
> >  drivers/gpu/drm/sun4i/sun4i_tcon.c | 22 +++++++++-------------
> >  1 file changed, 9 insertions(+), 13 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i=
/sun4i_tcon.c
> > index f949287d926c..262ffb6b0f82 100644
> > --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > @@ -478,8 +478,11 @@ static void sun4i_tcon0_mode_set_lvds(struct sun4i=
_tcon *tcon,
> >  }
> > =20
> >  static void sun4i_tcon0_mode_set_rgb(struct sun4i_tcon *tcon,
> > +				     const struct drm_encoder *encoder,
> >  				     const struct drm_display_mode *mode)
> >  {
> > +	struct drm_connector *connector =3D sun4i_tcon_get_connector(encoder)=
;
> > +	struct drm_display_info display_info =3D connector->display_info;
> >  	unsigned int bp, hsync, vsync;
> >  	u8 clk_delay;
> >  	u32 val =3D 0;
> > @@ -491,8 +494,7 @@ static void sun4i_tcon0_mode_set_rgb(struct sun4i_t=
con *tcon,
> >  	sun4i_tcon0_mode_set_common(tcon, mode);
> > =20
> >  	/* Set dithering if needed */
> > -	if (tcon->panel)
> > -		sun4i_tcon0_mode_set_dithering(tcon, tcon->panel->connector);
> > +	sun4i_tcon0_mode_set_dithering(tcon, connector);
> > =20
> >  	/* Adjust clock delay */
> >  	clk_delay =3D sun4i_tcon_get_clk_delay(mode, 0);
> > @@ -556,17 +558,11 @@ static void sun4i_tcon0_mode_set_rgb(struct sun4i=
_tcon *tcon,
> >  	 * Following code is a way to avoid quirks all around TCON
> >  	 * and DOTCLOCK drivers.
> >  	 */
> > -	if (tcon->panel) {
> > -		struct drm_panel *panel =3D tcon->panel;
> > -		struct drm_connector *connector =3D panel->connector;
> > -		struct drm_display_info display_info =3D connector->display_info;
> > -
> > -		if (display_info.bus_flags & DRM_BUS_FLAG_PIXDATA_POSEDGE)
> > -			clk_set_phase(tcon->dclk, 240);
> > +	if (display_info.bus_flags & DRM_BUS_FLAG_PIXDATA_POSEDGE)
> > +		clk_set_phase(tcon->dclk, 240);
> > =20
> > -		if (display_info.bus_flags & DRM_BUS_FLAG_PIXDATA_NEGEDGE)
> > -			clk_set_phase(tcon->dclk, 0);
> > -	}
> > +	if (display_info.bus_flags & DRM_BUS_FLAG_PIXDATA_NEGEDGE)
> > +		clk_set_phase(tcon->dclk, 0);
>=20
> You're doing multiple things here: you're changing the function API,
> and then moving the display info checks outside of the tcon->panel
> condition.
>=20
> You should do two separate patches for that.

Thanks, I'll do that in the next revision then.

Cheers,

Paul

--=20
Developer of free digital technology and hardware support.

Website: https://www.paulk.fr/
Coding blog: https://code.paulk.fr/
Git repositories: https://git.paulk.fr/ https://git.code.paulk.fr/

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--=-2RKZOHW4noP3lk/w0Veq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAlvgGZUACgkQhP3B6o/u
lQz6Ug/+MWE2rvdL11jDYpl7QhEJUt3CXDbQ+ZDuHD5LMhqlpbj98RBkqIvs4cK2
P8Br2W/NfKcajvFd+AWLWhFdYW3JwuiXOLhpsc95zmVZQP+XD8ZC75HOLsOE9775
ZbVv8CYxrkvPJX3buVC65bpPglq/I1JpwWg+T7gxHPEFvK7L6OmZfsc7SgsIfqCa
xeJedS8ueD0uO+829fMiqjuG6UzTur29eQ/8lXckR+pwnQxIiy39v0ox1eg6il6R
xoNLcPe2xASxdYX/t56gH9DTpPvm4BzkYS5ESFc4Ax+7UMR91hg1gPjL7i/RvpF1
Ierb70p6Vlp77FaTOvbLTSVpggUg+9zVbP5yqW5FwEbR9oA6Y/jKQviMgxnHiUDv
8eOpXGwzMlF5zibP6HmZLY5PekT+AKBOS0jG6G17XKOytdbSXezNBdlqmLAhEgsm
lbu+1qsu2cZizRrk9WL/HWxOm65HITjeeiV4NSW6JpClAMjjTkXYfRHowX4lQXWm
jN2SkclHmAQPPxJgbozcahOQ+NsUgjT07BDce0+ES7qyQ+LURz4mSQS3H+iXOy2H
wRrUiEGep25YFhYmd5OZM+ShIqkHlPjiXbmZkgg0uqpgdd5BzDW6PQtpriL3hCKc
j8k4MGNiVB1b86ec+Y56d7Il9Jd/xKM/+1PvT+emBz5lHGdj0i8=
=TYY3
-----END PGP SIGNATURE-----

--=-2RKZOHW4noP3lk/w0Veq--
