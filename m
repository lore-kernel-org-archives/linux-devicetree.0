Return-Path: <SRS0=5STX=FN=gmail.com=thierry.reding@kernel.org>
Date: Mon, 19 Feb 2018 15:14:40 +0100
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V7 1/7] dt-bindings: ahci-tegra: add binding documentation
Message-ID: <20180219141440.GA11455@ulmo>
References: <1518456406-21564-1-git-send-email-pchandru@nvidia.com>
 <1518456406-21564-2-git-send-email-pchandru@nvidia.com>
 <20180219024635.n6yaussnqdxuop5x@rob-hp-laptop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wac7ysb48OaltWcw"
Content-Disposition: inline
In-Reply-To: <20180219024635.n6yaussnqdxuop5x@rob-hp-laptop>
To: Rob Herring <robh@kernel.org>
Cc: Preetham Chandru Ramchandra <pchandru@nvidia.com>, tj@kernel.org, cyndis@kapsi.fi, mark.rutland@arm.com, devicetree@vger.kernel.org, preetham260@gmail.com, linux-tegra@vger.kernel.org, linux-ide@vger.kernel.org, vbyravarasu@nvidia.com, pkunapuli@nvidia.com
List-ID: <devicetree@vger.kernel.org>


--wac7ysb48OaltWcw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 18, 2018 at 08:46:35PM -0600, Rob Herring wrote:
> On Mon, Feb 12, 2018 at 10:56:40PM +0530, Preetham Chandru Ramchandra wro=
te:
> > From: Preetham Ramchandra <pchandru@nvidia.com>
> >=20
> > This adds bindings documentation for the
> > AHCI controller on Tegra210
> >=20
> > Signed-off-by: Preetham Chandru R <pchandru@nvidia.com>
> > ---
> > v7:
> > * For Aux register set drop the Tegra210 since this register
> >   set also works on Tegra124
> > * rephrase the sentence for cml1 clock
> > * change the commit subject to include ahci-tegra
> > * drop pll_e since CCF handles it automatically as
> >   CML1 is a child clock of it.
> > v4:
> > * changed the commit message
> > * changed 'sata-cold' reset to mandatory for t210 and t124
> > * Removed the regulators for T210 since these regulators
> >   will be enabled in phy driver.
> > v3:
> > * Add AUX register.
> > v2:
> > * change cml1, pll_e and phy regulators as optional
> >   for T210.
> > ---
> >  .../bindings/ata/nvidia,tegra124-ahci.txt          | 35 ++++++++++++++=
--------
> >  1 file changed, 22 insertions(+), 13 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/ata/nvidia,tegra124-ahci=
=2Etxt b/Documentation/devicetree/bindings/ata/nvidia,tegra124-ahci.txt
> > index 66c83c3e8915..0f4520a00716 100644
> > --- a/Documentation/devicetree/bindings/ata/nvidia,tegra124-ahci.txt
> > +++ b/Documentation/devicetree/bindings/ata/nvidia,tegra124-ahci.txt
> > @@ -1,20 +1,19 @@
> > -Tegra124 SoC SATA AHCI controller
> > +Tegra SoC SATA AHCI controller
> > =20
> >  Required properties :
> > -- compatible : For Tegra124, must contain "nvidia,tegra124-ahci".  Oth=
erwise,
> > -  must contain '"nvidia,<chip>-ahci", "nvidia,tegra124-ahci"', where <=
chip>
> > -  is tegra132.
> > -- reg : Should contain 2 entries:
> > +- compatible : Must be one of:
> > +  - Tegra124 : "nvidia,tegra124-ahci"
> > +  - Tegra210 : "nvidia,tegra210-ahci"
>=20
> Are you dropping T132?

Tegra132 is identical to Tegra124 except for the CPU cores. That said,
we've erred on the side of caution in the past and required that the
compatible properties for Tegra132 contain both "nvidia,tegra132-*" and
"nvidia,tegra124-*". The reason was that we'd get support from drivers
that support Tegra124 automatically while at the same time having a chip
specific compatible string that would allow us to add Tegra132 specific
quirks should there be any.

So I think it'd be best if AHCI followed that and we add an entry for
Tegra132 here:

  - Tegra132: "nvidia,tegra132-ahci", "nvidia,tegra124-ahci"

Thierry

--wac7ysb48OaltWcw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlqK28wACgkQ3SOs138+
s6ESog//RcYTF6TV3B+ulMsGlFvDfABgJx3jkZR5bTcVo1C+m+raLpp3qw+ZFbm3
qQfav+dy9uhTbfr7lJ5S+hygv6ZIWu9QotzKJ4Wn3vaqBiVxMgN3qyL8u4D+oyB9
f7D7jSa1+fhbTeKQ38MrQJ8cZVh5t5GjGNojk19AGEjde3MtkISlcl/w/XaIvt8/
Uw1r2nKmFF/Taf61/GPrjRVZ3stAJsOvig+0SXVRa09VSWidJzZTWjbnbtb4+2GI
Ey5g44y9iDNT+tgEOzMdJY72+tTWxCo2xoHP5Vcf+e3qjrsdN6tvREaV1zH34GbO
A9VKsa/jtCZnIHOQ8M6Dn7j0oEjewOar3P13xGG2ykmFuxtM+VsiAynWkjyAVM7Y
W9Y6pDDvtUp7hGwE17DOZrVLWBUnRE7U7oDv9SfHpSPe6GsukXrXG/5ufzm4N0MV
UlG48dKvjfWdlPe4qkMfyEdKYTFBP3ACo7mzw+C0pzG6WzwVM62VzSFn5yW9reGn
IlVl3ZtOMqatKQOy5vvk6O3FtVL0z8JJITb9NXknC3N5fTnJSNQ2lp/liVDamvsN
MonBFRJIkz+M6NV1HWMeDH/eCD+jVR3cif1Wv2l83WZDqbsf+fh12HuXBHLhd3X4
t4ngTx/v3fa5qzTztuVuzoJ7l9hB2sLtBoj5nTbtJldHUzExcM0=
=5lDx
-----END PGP SIGNATURE-----

--wac7ysb48OaltWcw--
