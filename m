Return-Path: <SRS0=yXcy=TJ=gmail.com=thierry.reding@kernel.org>
Date: Thu, 9 May 2019 16:37:59 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2 26/28] dt-bindings: pci: tegra: Document reset-gpio
 optional prop
Message-ID: <20190509143759.GV8907@ulmo>
References: <20190423092825.759-1-mmaddireddy@nvidia.com>
 <20190423092825.759-27-mmaddireddy@nvidia.com>
 <20190509143729.GU8907@ulmo>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SZSwH5G1FJ2Fz+jP"
Content-Disposition: inline
In-Reply-To: <20190509143729.GU8907@ulmo>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--SZSwH5G1FJ2Fz+jP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 09, 2019 at 04:37:29PM +0200, Thierry Reding wrote:
> On Tue, Apr 23, 2019 at 02:58:23PM +0530, Manikanta Maddireddy wrote:
> > Document "reset-gpio" optional property which supports GPIO based PERST#
> > signal.
> >=20
> > Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> > ---
> > V2: Using standard "reset-gpio" property
> >=20
> >  .../devicetree/bindings/pci/nvidia,tegra20-pcie.txt          | 5 +++++
> >  1 file changed, 5 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.=
txt b/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
> > index 7939bca47861..4e75e017f660 100644
> > --- a/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
> > +++ b/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
> > @@ -162,6 +162,10 @@ Required properties:
> >    - Root port 0 uses 4 lanes, root port 1 is unused.
> >    - Both root ports use 2 lanes.
> > =20
> > +Optional properties:
> > +- reset-gpio: If GPIO is used as PERST# signal instead of available
> > +  SFIO, add this property with phandle to GPIO controller and GPIO num=
ber.
> > +
> >  Required properties for Tegra124 and later:
> >  - phys: Must contain an phandle to a PHY for each entry in phy-names.
> >  - phy-names: Must include an entry for each active lane. Note that the=
 number
> > @@ -626,6 +630,7 @@ SoC DTSI:
> >  			ranges;
> > =20
> >  			nvidia,num-lanes =3D <2>;
> > +			reset-gpio =3D <&gpio TEGRA_GPIO(A, 3) 0>;
>=20
> Nit: it's customary to put vendor-specific properties below generic
> ones.

With that:

Acked-by: Thierry Reding <treding@nvidia.com>

--SZSwH5G1FJ2Fz+jP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzUO0cACgkQ3SOs138+
s6FkTg//Zi66AcXJEL2Znr9udLX0M3wfqYQt5QP+O9HT3fPBBWZTDHe6h5Dp3q6o
c8HOcL7XwCaktAyVNIfGCAP+DxL1xj4YLWcngWJJ9PLKYdXIaJccG47bn+YDSOLZ
ZQIfYCFX33/iR2nirr7ORoXGQAurgX5kw7NDTBtiEY9JAIfPyozIAsN53YT4fCnC
4vMOd2A0xUc2XNBuu0jREXhB+IxmlHZyy1Tcf4wDjorYGlhkUkREgv2Jx1pkPMlR
dnVX/7LhkGhYHFbR9LdFOCFtm4p3ZI4iTAq+JLQs1D318jG+HR8kpP5jBxwhk0ix
/9kcZP95mjlIRRr7gs9BLicMP44OddEhQWxtHT9hfLzIhchfK+lEPfb2G+oUPXV+
erOta2eJwyrMvua4JFwtLMVnq+zlWBI+BdSckJd4tTmHpplXh9+ziJLCUZwD0QHZ
RDfztDZSR7TDDDkhYXbUYNVmnm6lsfhOvy8nHbW8TG6ZBsnnLLHVu3cN4Gf/5lqE
bhYOYwXCOMiJpulDBOtFmLqTQTX7eylOQuaN/K2mqIYqGU6M7pY7XraP2UmITEOm
shWjcJcw+gcNQMXK+98Om2biu6AExXPwvNfN0hC8kfiQf6EiYkQvV507BzkTbT7S
yMTC1uxEL2RddM8xl43xOEDdUxtJoORxLuIWMleQVeW+HPVHV2w=
=jUgq
-----END PGP SIGNATURE-----

--SZSwH5G1FJ2Fz+jP--
