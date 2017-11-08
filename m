From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: sun8i: a83t: add dwmac-sun8i ethernet driver
Date: Wed, 8 Nov 2017 08:48:58 +0100
Message-ID: <20171108074858.ompog5in7xi776d6@flea.lan>
References: <20171107201326.17401-1-clabbe.montjoie@gmail.com>
 <CAGb2v64zkEoy=_9D7g+GC5ZxYg_zuaTo3LL1e=4RXLnL0VDWaA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="xackkjxhsjqtl42t"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v64zkEoy=_9D7g+GC5ZxYg_zuaTo3LL1e=4RXLnL0VDWaA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Corentin Labbe <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--xackkjxhsjqtl42t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 08, 2017 at 02:27:21PM +0800, Chen-Yu Tsai wrote:
> On Wed, Nov 8, 2017 at 4:13 AM, Corentin Labbe
> <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > The dwmac-sun8i is an ethernet MAC hardware that support 10/100/1000 sp=
eed.
> > This patch enable the dwmac-sun8i on the Allwinner a83t SoC Device-tree.
>=20
> The subject should say "add .... device node", not driver.
>=20
> >
> > Signed-off-by: Corentin Labbe <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > Reviewed-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> > ---
> >  arch/arm/boot/dts/sun8i-a83t.dtsi | 29 +++++++++++++++++++++++++++++
> >  1 file changed, 29 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8=
i-a83t.dtsi
> > index 19acae1b4089..68e5135410ec 100644
> > --- a/arch/arm/boot/dts/sun8i-a83t.dtsi
> > +++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
> > @@ -336,6 +336,14 @@
> >                         #interrupt-cells =3D <3>;
> >                         #gpio-cells =3D <3>;
> >
> > +                       emac_rgmii_pins: emac-rgmii-pins {
> > +                               pins =3D "PD2", "PD3", "PD4", "PD5", "P=
D6", "PD7",
> > +                                      "PD11", "PD12", "PD13", "PD14", =
"PD18",
> > +                                      "PD19", "PD21", "PD22", "PD23";
> > +                               function =3D "gmac";
> > +                               drive-strength =3D <40>;
> > +                       };
> > +
>=20
> You should mention this change in your commit log.

And add a comment about why that drive strength is needed.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--xackkjxhsjqtl42t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJaArbqAAoJEBx+YmzsjxAg56gP/1Tvqfwt5nO9IJHVdFwyKTvx
4GPQ9liWNrdFXGfkig0leQ2CECEEBfH2+DSe0TzX0A6tlp0RPpT5zvyeVX25R324
JOv7w5k0B7XVfiigWVdOufrJYDkfZZFmzfm5cWvqG8/HfQ1QnMxOpL+bVesoMrr2
W6tnFuLDp9+/XvlhWoHkAwX235q0dFPMuMZq9JtvYoemcybxXhHxeZFB+CFzJAPL
P2kDe+uKhWJ4cTFaFEabmx2ulYrqOGd0qclQsBUIFzim9xkij/dQm7anrfKQtLtF
sAaaWhDMz+fMpfsVTGN2UjCvusM4SqAdpLMvPeT5DF1KATzURdADLFVsZv/ul/mj
ca7FzkIsceTVit/u1uIsxKClwKtYdN9FXFvrfQg0h6yrtEOgQSDGBtYKObFDe806
NSa1/0VCDT0uHOzk1UT/qHjcYndXa3Oz65oLBgP4QHi755XjQ9FmYZSnjEpMmxx5
ni6UNFABLVzF6YPvygd2MFjDTO8R93viinep+mnmuug/PT3DVsdpYhWuzyMFganY
0HZT0O3AIVaY/MZ8h392fTNpauPRBQSkkTmuwbc7baIMEuWlCK7w0aNSLXzEnSk4
eu1yObuDAcYAgMilYptLpnEuD6HaeGoLN9DyR1kvAygAN3hc+vk2ech/nakW6wzG
FyYKMmncHPWEc2qX5oNw
=4hxg
-----END PGP SIGNATURE-----

--xackkjxhsjqtl42t--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
