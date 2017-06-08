From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2 2/2] ARM: sun8i: a83t: add dwmac-sun8i ethernet driver
Date: Thu, 8 Jun 2017 14:48:41 +0200
Message-ID: <20170608124841.b6i5qphsyubksbvb@flea.home>
References: <20170607173345.22462-1-clabbe.montjoie@gmail.com>
 <20170607173345.22462-3-clabbe.montjoie@gmail.com>
 <20170608083428.csv54tryvgwdb552@flea.home>
 <20170608084222.GA10830@Red>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="booem2zrrwoj5jp6"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170608084222.GA10830@Red>
Sender: linux-kernel-owner@vger.kernel.org
To: Corentin Labbe <clabbe.montjoie@gmail.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, wens@csie.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--booem2zrrwoj5jp6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 08, 2017 at 10:42:22AM +0200, Corentin Labbe wrote:
> On Thu, Jun 08, 2017 at 10:34:28AM +0200, Maxime Ripard wrote:
> > On Wed, Jun 07, 2017 at 07:33:45PM +0200, Corentin Labbe wrote:
> > > The dwmac-sun8i is an ethernet MAC hardware that support 10/100/1000 =
speed.
> > > This patch enable the dwmac-sun8i on the Allwinner a83t SoC Device-tr=
ee.
> > >=20
> > > Signed-off-by: Corentin Labbe <clabbe.montjoie@gmail.com>
> > > Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> > > ---
> > >  arch/arm/boot/dts/sun8i-a83t.dtsi | 28 ++++++++++++++++++++++++++++
> > >  1 file changed, 28 insertions(+)
> > >=20
> > > diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/su=
n8i-a83t.dtsi
> > > index 01a83406f9ae..7d719b4aeaa9 100644
> > > --- a/arch/arm/boot/dts/sun8i-a83t.dtsi
> > > +++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
> > > @@ -200,6 +200,14 @@
> > >  			#interrupt-cells =3D <3>;
> > >  			#gpio-cells =3D <3>;
> > > =20
> > > +			emac_rgmii_pins: emac-rgmii-pins {
> > > +				pins =3D "PD2", "PD3", "PD4", "PD5", "PD6", "PD7",
> > > +				       "PD11", "PD12", "PD13", "PD14", "PD18",
> > > +				       "PD19", "PD21", "PD22", "PD23";
> > > +				function =3D "gmac";
> > > +				drive-strength =3D <40>;
> > > +			};
> > > +
> >=20
> > This is not used anywhere.
> >=20
> But will be used by bpim3 board

Then will add it when we'll add support for that board, until then,
it's dead code.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--booem2zrrwoj5jp6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZOUepAAoJEBx+YmzsjxAgE/QP+QF8JO2x4KI+HQ3GKq2eqEGd
7lYPo5inB6POVuSUqbim/E6MjZbpSqTaBHiDfmaVTopT37ldpGS+vXKythVVtw+S
F14uK7hXTbfQdouTmbLc/AFHLGnmzgt+RhUeRW94kx6tAKChd2glFiXg7RWwgt7l
qfMTfe7TW+HVjC81aisxUTR9ogOUzTlHoK5Mgij3xtXG6Bp1HPVRMKHsj2DgOLIc
2x9IVfhMe7f7MApYqSMx4NLAQWtGyVtJTHQH4A9JDPLZbyKVL5BNMdCSMJ2J7mur
Tlc/EExSplMqy5TVMG8wBAND6gYg0pl3IMML9nbca0ZUCOHy8Yug5g5goMgTONTo
YjlJI2S1pbQOxE0Q820MbfIKHLlHEBw8JoXZ1iBmVG/k9IkLOAXtJROREBgC+4K1
B54kfIE+ojCEFQirbiUT5kij6ZuW9hdxUBYvYZj4Cfzyh+zktvPm8julyr2OOEJe
toR0LU/EM5nf0QQIAvuxA3uHNqhFHksqP97ylWC4fXwZ8OfHbYT2rt4IaLZsZl+P
Z3KNspbeSKmo6yOnctd3U2u2pXPEHOWvLTgo9jhQ+VKedmHDv0fDSKiFs1UzdWuN
3GI/OTtF8/cJpgcUIAsfyZxsZsNuNZxFFCjsBWCJ8OfKbsNHLHOKCH+d+ACShmY6
a/h1B1J9Xfb5mZu6UgxI
=4TH8
-----END PGP SIGNATURE-----

--booem2zrrwoj5jp6--
