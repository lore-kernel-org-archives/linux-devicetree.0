From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/2] drm/panel: Support for LG lp120up1 panel with eDP
 input
Date: Mon, 22 Feb 2016 12:43:08 +0100
Message-ID: <20160222114308.GA22505@ulmo>
References: <1456138904-15258-1-git-send-email-jitao.shi@mediatek.com>
 <1456138904-15258-2-git-send-email-jitao.shi@mediatek.com>
 <CAGUYZuSsrneg8zQ0Ro8z5C469A2D-TOKpONECxWdoM6T+xNAeg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="M9NhX3UHpAaciwkO"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAGUYZuSsrneg8zQ0Ro8z5C469A2D-TOKpONECxWdoM6T+xNAeg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sanjeev sharma <sanjeevsharmaengg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jitao Shi <jitao.shi-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, stonea168-9Onoh4P/yGk@public.gmane.org, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ajay Kumar <ajaykumar.rs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Vincent Palatin <vpalatin-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, cawa.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, bibby.hsieh-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM9gwCICpdfJQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--M9NhX3UHpAaciwkO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 22, 2016 at 04:42:54PM +0530, sanjeev sharma wrote:
> Hello Jitao,
>=20
> Can't we add this panel information in device tree file instead inside the
> device driver ?

We could, but that would be redundant. Panels need to be represented by
a specific compatible string anyway, and that compatible string implies
the video timings, bits-per-color, width and height.

Also there's more to panels than just the timings or dimensions. Power
up and power down sequences are also implied by the compatible stirng.
Describing all of that in the device tree was at some point attempted,
but in the end it turned out too complicated and we ended up with what
we have now.

Thierry

> On Mon, Feb 22, 2016 at 4:31 PM, Jitao Shi <jitao.shi-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
>=20
> > The LG lp120up1 TFT LCD panel with eDP interface is a 12.0" 1920x1280
> > panel, which can be supported by the simple panel driver
> >
> > Signed-off-by: Jitao Shi <jitao.shi-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > ---
> > Changes since v1:
> >  - Add eDP panel type in comment msg
> >  - Fixed comment msg with 72 characters width
> > ---
> >  drivers/gpu/drm/panel/panel-simple.c |   26 ++++++++++++++++++++++++++
> >  1 file changed, 26 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-simple.c
> > b/drivers/gpu/drm/panel/panel-simple.c
> > index f88a631..2030c37 100644
> > --- a/drivers/gpu/drm/panel/panel-simple.c
> > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > @@ -982,6 +982,29 @@ static const struct panel_desc lg_lb070wv8 =3D {
> >         .bus_format =3D MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> >  };
> >
> > +static const struct drm_display_mode lg_lp120up1_mode =3D {
> > +       .clock =3D 162300,
> > +       .hdisplay =3D 1920,
> > +       .hsync_start =3D 1920 + 40,
> > +       .hsync_end =3D 1920 + 40 + 40,
> > +       .htotal =3D 1920 + 40 + 40+ 80,
> > +       .vdisplay =3D 1280,
> > +       .vsync_start =3D 1280 + 4,
> > +       .vsync_end =3D 1280 + 4 + 4,
> > +       .vtotal =3D 1280 + 4 + 4 + 12,
> > +       .vrefresh =3D 60,
> > +};
> > +
> > +static const struct panel_desc lg_lp120up1 =3D {
> > +       .modes =3D &lg_lp120up1_mode,
> > +       .num_modes =3D 1,
> > +       .bpc =3D 8,
> > +       .size =3D {
> > +               .width =3D 267,
> > +               .height =3D 183,
> > +       },
> > +};
> > +
> >  static const struct drm_display_mode lg_lp129qe_mode =3D {
> >         .clock =3D 285250,
> >         .hdisplay =3D 2560,
> > @@ -1256,6 +1279,9 @@ static const struct of_device_id platform_of_matc=
h[]
> > =3D {
> >                 .compatible =3D "lg,lb070wv8",
> >                 .data =3D &lg_lb070wv8,
> >         }, {
> > +               .compatible =3D "lg,lp120up1",
> > +               .data =3D &lg_lp120up1,
> > +       }, {
> >                 .compatible =3D "lg,lp129qe",
> >                 .data =3D &lg_lp129qe,
> >         }, {
> > --
> > 1.7.9.5
> >
> >
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> >

--M9NhX3UHpAaciwkO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWyvRIAAoJEN0jrNd/PrOhckoP/3p8swvDH4Qm3/l6w5Qaw7mf
DIXu1ovTOcBWPBvPKP7RANwrZIgwpPQDgP2PWU+cLCdQsAv+UdxGEX1qATAQC2Al
ExGYaNrawQI8lFhvuTinNbiURG6ovSfsWNrc0aRw5bEv6cXn6uEqAETH0bFHcm30
aDF6JrP6+gi23oGSWYimarCy+i/IBhHHfsqiyG+C19eDk3K3ttkIfdhmxpw3uhye
/SRwYbyN8sn/Fb0NmJoS8qXEJ0uCxkb3Huu4r1XNQw+eEOagrEHPliBwISDSHLeS
boqtI1bwj2622E+BXEoxRiSFokdIfUKNF+KEx9p6Gc3VQwCpWZx6Zpi6UC651uit
I8ryxJHlmCU/saV9o2wACJsdCsU/eBEb32ohx7ymSe587DUKcdxaIQF+P0OPRumt
5jbOaAH8aMdDKWI0l5Z/gbowPjcPz9j7tLPw+PJOJgF1Sg8qQKPHdehaE/aWzCHR
N6anwDl4TYTwc9GQVY64X575CdUciNad/lvo/WuAqs70b1Y/azkQFFoPBHfJzQA6
SKOdYJh0PHDfvYVSW2IXQvNj3qAuheURny7QakhGddsp7bITwoMb1k/k64NMkFlv
roPn+Xls5V8mfKaZYOQ43U56nSVAq4nOvQ2n+I3jY1RZXsRxlm1VZP221N91C97O
GBVVG9XLkAl4p2U2HNFv
=tT3r
-----END PGP SIGNATURE-----

--M9NhX3UHpAaciwkO--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
