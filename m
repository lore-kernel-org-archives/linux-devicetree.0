Return-Path: <SRS0=5STX=FN=gmail.com=thierry.reding@kernel.org>
Date: Mon, 19 Feb 2018 15:24:33 +0100
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V7 1/7] dt-bindings: ahci-tegra: add binding documentation
Message-ID: <20180219142433.GB11455@ulmo>
References: <1518456406-21564-1-git-send-email-pchandru@nvidia.com>
 <1518456406-21564-2-git-send-email-pchandru@nvidia.com>
 <20180219024635.n6yaussnqdxuop5x@rob-hp-laptop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Fba/0zbH8Xs+Fj9o"
Content-Disposition: inline
In-Reply-To: <20180219024635.n6yaussnqdxuop5x@rob-hp-laptop>
To: Rob Herring <robh@kernel.org>
Cc: Preetham Chandru Ramchandra <pchandru@nvidia.com>, tj@kernel.org, cyndis@kapsi.fi, mark.rutland@arm.com, devicetree@vger.kernel.org, preetham260@gmail.com, linux-tegra@vger.kernel.org, linux-ide@vger.kernel.org, vbyravarasu@nvidia.com, pkunapuli@nvidia.com
List-ID: <devicetree@vger.kernel.org>


--Fba/0zbH8Xs+Fj9o
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
>=20
> > +- reg : Should contain 3 entries:
>=20
> You can't just add more entries to existing compatibles. Does this apply=
=20
> to T124?

I'd consider this a bug in existing DTSs. The SATA AUX registers exist
as far back as Tegra30. The reason why they were never included in the
DTS in because the driver never programmed those registers.

However, the driver change in patch 5/7 which uses this has a comment
that AUX registers are optional, so perhaps we can just add that fact to
the bindings as well.

Thierry

--Fba/0zbH8Xs+Fj9o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlqK3iEACgkQ3SOs138+
s6GmTg//SZ+IfVZRmAA/A3Yx4zFS4PmqTquiqJ3iWFuIryiftBAZMTLgpZ++LsZ9
Px8IXKUfkOWjMeHIskU3CJCMHRYuz3iqVYekaCJ7hWgOw1xmZSGcKuKjO/70sur5
+waERE0loorhEoSgXm1D/MdV92XbZoQZvcEkIAf282B9ln+sg+G/l6QPUAe7XTPy
X9m00YgVYlJ8Md41tHDTxOf55XybIxelN1KJpwl7Zoq1As638SGycAH3KC/7ev5j
utTxpeX629O5BqxO95TGdnqnmgu/E/8rh7pCFt2x8FNTSCzNFjJ5uyfBdAeSrvd2
FyxjeUSGDrvWMhxH4g1n/4LjaikLAk61VaLWiw1ZmnYjN5yFbmlkRqLE4jeYRdKP
MDRQRdPtuXZOtrJnMyh02bO0vQ8yBLg4pdYeU1KqbJozuE83XRVCh4AgvZ5cFq75
1hngFfL5Ac/H78+LDorbX9JYClS6RKxw4kAJW8bfKnnT1Asz8qf7JkeKnLZRYkME
u6N1YE6DdJGze6VLMVErCurXEPZJFDyUXBEzKuz46CCyN2OflML0kV/KpbKUbRkQ
INit60YHuFwXf2Gyc/8g6GawEFd7+cjB0DDxebxSh09s5ZQ1qXmzQxMrb2RW0PzA
hCVPasGkjNp/EPsH9x6xDrxlzI4+XanwCh/+sDQXp+VHPBK8ojg=
=kwB/
-----END PGP SIGNATURE-----

--Fba/0zbH8Xs+Fj9o--
