Return-Path: <SRS0=JAT3=UQ=gmail.com=thierry.reding@kernel.org>
Date: Mon, 17 Jun 2019 13:48:49 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V4 26/28] PCI: Add DT binding for "reset-gpios" property
Message-ID: <20190617114849.GM508@ulmo>
References: <20190516055307.25737-1-mmaddireddy@nvidia.com>
 <20190516055307.25737-27-mmaddireddy@nvidia.com>
 <20190617113038.GK508@ulmo>
 <bc6a3de8-89b0-41a8-006e-0db85fbb4d4d@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TxukmIqg3MmZ0Kmh"
Content-Disposition: inline
In-Reply-To: <bc6a3de8-89b0-41a8-006e-0db85fbb4d4d@nvidia.com>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--TxukmIqg3MmZ0Kmh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2019 at 05:08:45PM +0530, Manikanta Maddireddy wrote:
>=20
>=20
> On 17-Jun-19 5:00 PM, Thierry Reding wrote:
> > On Thu, May 16, 2019 at 11:23:05AM +0530, Manikanta Maddireddy wrote:
> >> Add DT binding for "reset-gpios" property which supports GPIO based PE=
RST#
> >> signal.
> >>
> >> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> >> Reviewed-by: Rob Herring <robh@kernel.org>
> >> Acked-by: Thierry Reding <treding@nvidia.com>
> >> ---
> >> V4: No change
> >>
> >> V3: Moved to common pci binding doc
> >>
> >> V2: Using standard "reset-gpio" property
> >>
> >>  Documentation/devicetree/bindings/pci/pci.txt | 3 +++
> >>  1 file changed, 3 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/pci/pci.txt b/Documenta=
tion/devicetree/bindings/pci/pci.txt
> >> index c77981c5dd18..79124898aa5b 100644
> >> --- a/Documentation/devicetree/bindings/pci/pci.txt
> >> +++ b/Documentation/devicetree/bindings/pci/pci.txt
> >> @@ -24,3 +24,6 @@ driver implementation may support the following prop=
erties:
> >>     unsupported link speed, for instance, trying to do training for
> >>     unsupported link speed, etc.  Must be '4' for gen4, '3' for gen3, =
'2'
> >>     for gen2, and '1' for gen1. Any other values are invalid.
> >> +- reset-gpios:
> >> +   If present this property specifies PERST# GPIO. Host drivers can p=
arse the
> >> +   GPIO and apply fundamental reset to endpoints.
> > As mentioned in patch 27/28, maybe mention here that this is only a
> > workaround for bad board designs and that it shouldn't be necessary in
> > the majority of cases.
> >
> > Thierry
>=20
> This is common DT binding doc, I cannot add Tegra specific here.
> reset-gpios is common DT prop, so Rob asked me to add it in common file.

Ah, indeed. Alright, let's document it in the Tegra driver patch, then.

Thierry

--TxukmIqg3MmZ0Kmh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0HfiAACgkQ3SOs138+
s6Fn+w/+LYI/OWEFoh9H55Bv5F4iAYdjJsFolI2oa373iKROlpxS3+KJQ1sE3rGO
Q+WSuTiuR2mWU98KZtW7wC1bq4tZIFatu1NSWU+GHoOsFK4RFF7ysbgD3i4xIRm9
lnVADCS4XYTjtU6pt8psSiYaIGmTStAVeqJ1qMENChW417flbJzT4EWpuaqsPMy/
OpNvBkJSm/9CpnRcxpc7YIQhdr7EUQtOj/h+r8TNrBACdu1ipH15jps2iv3Co2K8
4SIO89bAEsbp+yH2aaC0jE3sJdXsXKLkd8s57Dhz2jHI7DGK9hUutX2Z/UmIVw0v
yuTVrE4peXcNoFDoBDcT+qKSjuanEF6fDIPrXuuvtUapwLzSRHRCMuj0lrtg0vTD
Tgiic1Asw6eTM9ruKq+MHJpaD0SQYIUGWOq50bNl1bavmHDdxhEO+aMh/742STpR
ULwnCMVgldH2dCQ08PXjzxusIOOCXX0jaDA943LvwPBcQ4xvojyx0FZ/Qe9dygCq
Pi/blX9EbqzGJjd8rA+QymTxpmI1UmP0NiXgP/7VqLMc4DFfGkEKf28o6rgucxa4
1Wt8uNxCrptrOYf7ywh1L/xbeDY+q0o9m0oQ1jny9UlCihLNDbS/rbkdYOplDqW5
uWhAqucz679mcX3rCo4GB2CHoHVt0NHPAnm1Y3aIh1EUY8fiZjs=
=mels
-----END PGP SIGNATURE-----

--TxukmIqg3MmZ0Kmh--
