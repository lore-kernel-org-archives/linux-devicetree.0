Return-Path: <SRS0=yXcy=TJ=gmail.com=thierry.reding@kernel.org>
Date: Thu, 9 May 2019 16:37:29 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2 26/28] dt-bindings: pci: tegra: Document reset-gpio
 optional prop
Message-ID: <20190509143729.GU8907@ulmo>
References: <20190423092825.759-1-mmaddireddy@nvidia.com>
 <20190423092825.759-27-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="m1rwLFmcefDs/2Y3"
Content-Disposition: inline
In-Reply-To: <20190423092825.759-27-mmaddireddy@nvidia.com>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--m1rwLFmcefDs/2Y3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 23, 2019 at 02:58:23PM +0530, Manikanta Maddireddy wrote:
> Document "reset-gpio" optional property which supports GPIO based PERST#
> signal.
>=20
> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> ---
> V2: Using standard "reset-gpio" property
>=20
>  .../devicetree/bindings/pci/nvidia,tegra20-pcie.txt          | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.tx=
t b/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
> index 7939bca47861..4e75e017f660 100644
> --- a/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
> +++ b/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
> @@ -162,6 +162,10 @@ Required properties:
>    - Root port 0 uses 4 lanes, root port 1 is unused.
>    - Both root ports use 2 lanes.
> =20
> +Optional properties:
> +- reset-gpio: If GPIO is used as PERST# signal instead of available
> +  SFIO, add this property with phandle to GPIO controller and GPIO numbe=
r.
> +
>  Required properties for Tegra124 and later:
>  - phys: Must contain an phandle to a PHY for each entry in phy-names.
>  - phy-names: Must include an entry for each active lane. Note that the n=
umber
> @@ -626,6 +630,7 @@ SoC DTSI:
>  			ranges;
> =20
>  			nvidia,num-lanes =3D <2>;
> +			reset-gpio =3D <&gpio TEGRA_GPIO(A, 3) 0>;

Nit: it's customary to put vendor-specific properties below generic
ones.

Thierry

--m1rwLFmcefDs/2Y3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzUOykACgkQ3SOs138+
s6FsNQ//W3EmnqNBZ49wEPEqFU/6J8fYdmwzJCzpo7KbxVWzpKGaJVmZ4F1IvEWE
Q+0U12iYXyLXrUzdysNSbu9Vb1wUf2iCFP7fA9yr2PBPcPHwnMlgTKl+RB4nSLM2
iFyaSbLPd94sCJP10Qzt1CZtPkp3uigFHDuM0W1sz6DLxVygV5FqGkDBFyI9KpCZ
SW4BsNTHw5nZWM9CUOgZ806SCsPmzcbRRAnJGYC+QwkNu8Z8wIxBrQcsslrQVCpo
YZs6yULR59o3uQ/m4jh6FLnaCM9KjjiB4WoKJU0fvf3vAQja/l2q4f4FwGdGO4W9
rz+jfzs95SN4O3mUONrB1w33Mg3i626MSB7PeF6oz+gAGOk/3TWLjnzcBwrorDu5
mJIn3khVvK4OF9i+USWbloWR5KQzq77rR0yeUOWx1gvSms7XKm+hQJHVagP93Xca
Bulp1nfPTZKIZB4QsU1lDvRrDiv6hMZBNwrDf36Q/V/h7J5FqGWoh1aI8SJUov39
LFTNs1nhO1cVo6fMCGlnOUrmnhTwYZ5tfMDnpA4Tq3vyQIjQ2YngMfWXYBZo0V3Z
rMdHvvDjjERN9IpLP1V02VU4qy9aeS+UU6RexE9WET/NMKdGt1FhYhnBwTLRyc+o
lFM1PpauQXQULwVPOaNNCNQOHcw0llrL7Z8tlMGFJlpQinAKUJg=
=/G0X
-----END PGP SIGNATURE-----

--m1rwLFmcefDs/2Y3--
