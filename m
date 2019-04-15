Return-Path: <SRS0=lIuD=SR=gmail.com=thierry.reding@kernel.org>
Date: Mon, 15 Apr 2019 16:16:54 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 26/30] dt-bindings: pci: tegra: Document
 nvidia,plat-gpios optional prop
Message-ID: <20190415141654.GA29254@ulmo>
References: <20190411170355.6882-1-mmaddireddy@nvidia.com>
 <20190411170355.6882-27-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LG5jgFgJbJFFiAfj"
Content-Disposition: inline
In-Reply-To: <20190411170355.6882-27-mmaddireddy@nvidia.com>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--LG5jgFgJbJFFiAfj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2019 at 10:33:51PM +0530, Manikanta Maddireddy wrote:
> Document "nvidia,plat-gpios" optional property which supports configuring
> of platform specific gpios.
>=20
> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> ---
>  Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.tx=
t b/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
> index fbbd3bcb3435..dca8393b86d1 100644
> --- a/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
> +++ b/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
> @@ -73,6 +73,8 @@ Optional properties:
>    pinctrl phandle to allow driver to explicitly put PCIe IO in DPD state.
>  - pinctrl-1: PCIe IO(bias & REFCLK) deep power down(DPD) enable state.
>    Pass pinctrl phandle to allow driver bring PCIe IO out of DPD state.
> +- nvidia,plat-gpios: A list of platform specific gpios which controls
> +  endpoint's internal regulator or PCIe logic.

We discussed this with Vidya during review of the Tegra194 PCIe device
tree bindings and arrived at the conclusion that all of the GPIOs that
need to be controlled for PCI to work can be modelled as proper device
nodes (I think regulator and GPIO-controlled muxes were the only two
use-cases for which we need this).

Can the same be done for this PCI controller? What use-cases are we
talking about?

>  Required properties on Tegra124 and later (deprecated):
>  - phys: Must contain an entry for each entry in phy-names.
> @@ -567,6 +569,7 @@ Board DTS:
>  		pci@2,0 {
>  			phys =3D <&{/padctl@7009f000/pads/pcie/lanes/pcie-4}>;
>  			phy-names =3D "pcie-0";
> +			nvidia,plat-gpios =3D <&gpio TEGRA_GPIO(X, 3) GPIO_ACTIVE_HIGH>;
>  			status =3D "okay";
>  		};
>  	};

I recall this being the setup for Jetson Nano and the X.3 GPIO going to
an Ethernet device. Let's find out what exactly this GPIO is used for
and why we need it to be set up as part of the PCI controller driver
rather than the Ethernet device.

If it turns out we can't model this other than with a generic GPIO type
of property we need a better explanation than the above, and the Jetson
Nano use-case would provide that explanation.

And if indeed we cannot model this more accurately, I think we should
use something like the gpio-hog binding rather than some custom PCI
controller property.

Thierry

--LG5jgFgJbJFFiAfj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAly0klYACgkQ3SOs138+
s6GeFA//YHggGmb+XMBk1EzBWehSNnWJ7EmZJI5JkHfeKClYo3JbGGjzhwviUnkE
DZ7bTeyzarxpODiYvcNRRVOdsv19adu2q9HFWbkVTWXHo9MyL8CRJaEfyopkzOUr
RzI1qEFrV6E9JnPodIBCW1Rl3f0P8usYdg9AaZp7BYBv98Lfjsi9Tmr6rkg5Bccs
xQ9CVtIUHvj7bc+hCe07ThxbRp9u9qSaqr92SpD4AIppm8pouOnWpDgRyBsuKeM6
GUyh1AxOZnOPjtESB/A2/g5SV3ThkOlBlcEJoZMfi4G6UbvVk6JININlgk2XbZnz
LQo/Yrz2RJDfvJj6F01IPldpi2RKMMr8cHz68P5b3871FoxPQbQTmaMrKsvPwIp4
BNp1I4SGPmieyL1Nop++WDDxAVG73ECFGiB+dAcHPbQSl32OE3KnyaIOgp38MfO2
uCH3/Q9rrNZL/sFrVn+nE4UEJ+EF9jbC+DH3mOsIRkkbFxRlapyP2Oy0szd41jca
DQb2aOtveT8mhFPz+VFulVXwZEwWjMQNKm6Wn3vYI5gyBjBljI2PReIurLPHm/O5
5SDVu3CoXpKWltDEwyGQQ88KiqlXh5DsllPhizpLUSDJC1+J5QUdJruppAI6Y0EI
B3ArLtLr5YigIzCjonKJSbJCyuGXpL4mKlfLMIrEkOI+ARwYQZc=
=GSCe
-----END PGP SIGNATURE-----

--LG5jgFgJbJFFiAfj--
