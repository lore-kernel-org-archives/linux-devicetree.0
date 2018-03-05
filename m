From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v4 10/10] ARM: sunxi: smp: Add initialization of CNTVOFF
Date: Mon, 5 Mar 2018 09:31:14 +0100
Message-ID: <20180305083114.dwqfdqlziwptfnxq@flea.lan>
References: <20180223133742.26044-1-mylene.josserand@bootlin.com>
 <20180223133742.26044-11-mylene.josserand@bootlin.com>
 <CAGb2v67SuK9Xr7_dVb7RVGXUJwYRKnTiJwDrOJ-Su5CXmm7HXA@mail.gmail.com>
 <20180226101252.ozdsxjvawgkemz2c@flea.lan>
 <CAGb2v64SaBR-_nL9S20eXe57r_kJTiqSg-di=_mZrv3Yx2-2JA@mail.gmail.com>
 <20180305085148.1de2a99c@dell-desktop.home>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="grzg6bvngnjss7hr"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180305085148.1de2a99c@dell-desktop.home>
Sender: linux-kernel-owner@vger.kernel.org
To: =?utf-8?Q?Myl=C3=A8ne?= Josserand <mylene.josserand@bootlin.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, LABBE Corentin <clabbe.montjoie@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, quentin.schulz@bootlin.com
List-Id: devicetree@vger.kernel.org


--grzg6bvngnjss7hr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 05, 2018 at 08:51:48AM +0100, Myl=E8ne Josserand wrote:
> > >> > diff --git a/arch/arm/mach-sunxi/sunxi.c b/arch/arm/mach-sunxi/sun=
xi.c
> > >> > index 5e9602ce1573..4bb041492b54 100644
> > >> > --- a/arch/arm/mach-sunxi/sunxi.c
> > >> > +++ b/arch/arm/mach-sunxi/sunxi.c
> > >> > @@ -37,8 +37,12 @@ static const char * const sun6i_board_dt_compat=
[] =3D {
> > >> >  };
> > >> >
> > >> >  extern void __init sun6i_reset_init(void);
> > >> > +extern void sunxi_init_cntvoff(void);
> > >> > +
> > >> >  static void __init sun6i_timer_init(void)
> > >> >  {
> > >> > +       sunxi_init_cntvoff(); =20
> > >>
> > >> You should check the enable-method to see if PSCI is set or not,
> > >> as an indicator whether the kernel is booted secure or non-secure. =
=20
> > >
> > > It's an indicator, but it's not really a perfect one. You could very
> > > well have your kernel booted in non-secure, without PSCI. Or even with
> > > PSCI, but without the SMP ops.
> > >
> > > We have a quite big number of these cases already, where, depending on
> > > the configuration, we might not have access to the device we write to,
> > > the number of hacks to just enable that device for non-secure is a
> > > good example of that. =20
> >=20
> > I wouldn't consider them hacks though. The hardware gives the option
> > to have control of many devices delegated solely to secure-only, or
> > secure/non-secure. Our present model is to support everything we can
> > in Linux directly, instead of through some firmware interface to a
> > non-existent firmware.
>=20
> I am not sure to understand what is the conclusion about it.
> Should I use "psci"/enable-method or should I use another mechanism to
> detect we are in secure/non-secure (if it exists)?
>=20
> Otherwise, for the moment, I can use machine-compatible on sun8i-a83t
> and we will see later how we can handle it in a better way.

Can't we have another approach here?

If we use an enable-method (and we should), instead of having it tied
to the machine compatible, the SMP setup code will run only if our
enable-method is the one we set up. If PSCI is in use, the
enable-method is not going to be the one defined here, and the code
will not run.

So why not just move that call to the SMP ops setup function, just
like renesas does?

Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--grzg6bvngnjss7hr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlqdAFEACgkQ0rTAlCFN
r3RdQA/9HU5Ba4g4v3e6RNYQp8EwnNGgQGQ0kGSYKJA41r5llcY7d7Cr3dvU9B59
YV0DDswSVkpBFefkmO+KIYMmbphnue+vtPGOt5wU+zu3iDQFEc4O/4Bwb7Hs9SQz
qHtGCV4ytDrBqrIZDAL3op6F5mOGbDr445NP4bnjZ9TWOIxpL0l37n9cYy1BW25/
ofFTHCUFeRC9m+dwp2zemt+Fe1XS0FX+YRNkPnfPsuZBlpwPrtz+oqgSk2d7qL70
g8T5xTHWJPj83dD63Hvz5hUsNvnPe7fcy5iFVKhj5b/QNNOLVsIyz6cBih09ZdyK
oOFPW4ym257f3bVFrd6XVRhtVKo78I4tJiuonep/sPqqtcJAKWcsFi6woQWMqve0
edoEiOtCgbpL+SNKTuszw/KTvddw1/BGX6yW/ieCjkeldO/O7t/M4A1g0KaGeeVs
OFweH3t76Hm6eCqxm1NsI7EyzLhUOvnA3m1h2azc1ndSnlR8vXvIWF3nA3tGKSbb
DaDmJXpvBdgJLggQazA3eLYr3kSYdU+Lt4Ire328rXmz5OrIgkQgCXEqY0w6KB1s
YoKPFLlZe2AfQisqOefJGgkhXChCef+NuGpfg/6bYMm1it7kgeHo55Z7fTcliFNB
GAwZMTjO4JpYDUBVd4G2jNAzDYNNpNB/2ViOcbgICu8WhL9zR20=
=ssrt
-----END PGP SIGNATURE-----

--grzg6bvngnjss7hr--
