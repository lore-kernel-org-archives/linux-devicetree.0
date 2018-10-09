From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 18/29] drm/sun4i: dw-hdmi: Add quirk for
 setting TMDS clock
Date: Tue, 9 Oct 2018 11:14:02 +0200
Message-ID: <20181009091402.gjaruavagscq6wt5@flea>
References: <20181007093905.11253-1-jernej.skrabec@siol.net>
 <20181007093905.11253-19-jernej.skrabec@siol.net>
 <20181008091406.yjs2u22fmj72e4rj@flea>
 <8016466.hta3A6eauk@jernej-laptop>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uycfxtqpuxuus2aj"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBZXC6HOQKGQEH5HIHHQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <8016466.hta3A6eauk@jernej-laptop>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Cc: wens-jdAy2FN1RRM@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--uycfxtqpuxuus2aj
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 08, 2018 at 05:09:42PM +0200, Jernej =C5=A0krabec wrote:
> Dne ponedeljek, 08. oktober 2018 ob 11:14:06 CEST je Maxime Ripard napisa=
l(a):
> > Hi,
> >=20
> > On Sun, Oct 07, 2018 at 11:38:54AM +0200, Jernej Skrabec wrote:
> > > It turns out that H6 HDMI BSP kernel driver doesn't change TMDS rate =
at
> > > all. At this point it is not clear whether it is just not necessary o=
r
> > > it would cause some kind of issues.
> > >=20
> > > Add a quirk for it.
> > >=20
> > > Reviewed-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> > > Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
> > > ---
> > >=20
> > >  drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c | 5 ++++-
> > >  drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h | 1 +
> > >  2 files changed, 5 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
> > > b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c index ec122136ee9d..e9e93f174=
b35
> > > 100644
> > > --- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
> > > +++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
> > > @@ -165,7 +165,9 @@ static int sun8i_dw_hdmi_bind(struct device *dev,
> > > struct device *master,>=20
> > >  		goto err_disable_clk_tmds;
> > >  =09
> > >  	}
> > >=20
> > > -	drm_encoder_helper_add(encoder, &sun8i_dw_hdmi_encoder_helper_funcs=
);
> > > +	if (hdmi->quirks->set_rate)
> > > +		drm_encoder_helper_add(encoder,
> > > +				       &sun8i_dw_hdmi_encoder_helper_funcs);
> >=20
> > That seems a bit backward, it only works because we only have mode_set
> > at the moment, and the only thing it does is changing the clock
> > rate. As soon as we change one of these two assumptions, the code will
> > break.
> >=20
> > Why not just return in mode_set if that boolean is true?
>=20
> My original intention was to optimize execution time a bit. If there is n=
o=20
> helpers registered, there is no need to call callback which does nothing.=
 But=20
> your way is probably more reasonable approach.
>=20
> However, I'm pretty sure that even older HDMI controller doesn't need thi=
s=20
> rate changing code. All tests shown that changing HDMI controller divider=
=20
> doesn't have an effect on video or audio output. It's only there because =
BSP=20
> kernel driver set rate and AW engineer said it's necessary.

Maybe we can simply remove it then, and see if it breaks. Given the
feedback from Allwinner, I'd prefer to have the behaviour they
recommend though, at least from MMC experience, it proved to be
needed.

> >=20
> > >  	drm_encoder_init(drm, encoder, &sun8i_dw_hdmi_encoder_funcs,
> > >  =09
> > >  			 DRM_MODE_ENCODER_TMDS, NULL);
> > >=20
> > > @@ -235,6 +237,7 @@ static int sun8i_dw_hdmi_remove(struct platform_d=
evice
> > > *pdev)>=20
> > >  static const struct sun8i_dw_hdmi_quirks sun8i_a83t_quirks =3D {
> > > =20
> > >  	.mode_valid =3D sun8i_dw_hdmi_mode_valid_a83t,
> > >=20
> > > +	.set_rate =3D true,
> > >=20
> > >  };
> > > =20
> > >  static const struct of_device_id sun8i_dw_hdmi_dt_ids[] =3D {
> > >=20
> > > diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
> > > b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h index a645b8bc9f58..f9eb66386=
5a4
> > > 100644
> > > --- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
> > > +++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
> > > @@ -173,6 +173,7 @@ struct sun8i_hdmi_phy {
> > >=20
> > >  struct sun8i_dw_hdmi_quirks {
> > > =20
> > >  	enum drm_mode_status (*mode_valid)(struct drm_connector *connector,
> > >  =09
> > >  					   const struct drm_display_mode *mode);
> > >=20
> > > +	bool set_rate;
> >=20
> > This triggers a check in checkpatch. You should address them (and
> > there's several in your series).
>=20
> Till now we used bools in driver internal structures in spite of this=20
> warnings. So should we start using unsigned int? Or maybe bitfield with=
=20
> unsigned int as a base according to https://lkml.org/lkml/2017/11/21/384

That warning has been introduced pretty recently, so we do indeed have
some drivers that use a bool in their structure.

> As far as other issues reported by strict checkpatch go, most of them are=
 DT=20
> lines over 80 charachters. This was tolerated till now. Last type of issu=
es is=20
> that macro parameters weren't enclosed with braces. These issues won't be=
=20
> reported anymore in new series because sun8i_csc.h won't be touched if I =
drop=20
> patch which renames DE2 register macros (but original issue will remain).

Yeah, I don't worry about those.

Thanks!
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

--uycfxtqpuxuus2aj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlu8cVkACgkQ0rTAlCFN
r3Qitg//W2A0VndfZeKOlQuNqD+WOEb7E0Ug/AQF+nZ/RkJY+QAePt2Cy8/6TYGZ
8XjJfnp3VBzWN/MhzWR1LYC1ClaaTdFRqBJ7DgkHn14Z7ocP2wjFj14KgBGXlf+h
N57tg5csjGLp/0eMh4174gg4A2IJkBWcZ673PKwxvSPtepQ/UTqFpKZ0oOB6Y269
9x8EtPF4uM6gHyp/azOqaFRdC39hOVYWGEUSwuwmCw9Mqhh5djSgMK7+XfRQ4Ik+
ECXOPAXTL8RgcrlzVGCx9mk8V2KtXKjHVKwX4SENgObllIARCusPh3nMJPNyyvZS
gQFJbi8AlI6gcilvy6+oOhaFkH74/N07UF5k5Jnq6HeQp6Mv85ns+XMTYB5qTnag
0gKvRzTOsAONOvT8/VGokW1+RRbhJfBrdpLpfJIfiXMICpVlR+EAFJiNwXIzGvrd
Fl2POkNIB3Xu8bhRocSJpsZGbOnwOkSMUnlUFRWo5mb6SR7MAM94vQc1DeXHNUxJ
pRjqXL/kBHjZyvC9VnIvWLa17T4O8ZpDcp8E7bH1oEp/6KQKGxBAYWRjrEeVXliz
b/UNVrTiGar3Yy0eCfX10c0VGhTaN3J4k9ngRnmX2sJ4iwVYm+Fu7WEdDAJM50d2
wbqxvxholpMTSv5iLNzYstFXtIQ4dButuxSvxRoHn9IbZ52NFB0=
=+zwh
-----END PGP SIGNATURE-----

--uycfxtqpuxuus2aj--
