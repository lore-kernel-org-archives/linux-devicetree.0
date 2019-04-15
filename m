Return-Path: <SRS0=lIuD=SR=gmail.com=thierry.reding@kernel.org>
Date: Mon, 15 Apr 2019 15:17:16 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 15/30] PCI: tegra: Fix PLLE powerdown issue due to
 CLKREQ# signal
Message-ID: <20190415131716.GQ29254@ulmo>
References: <20190411170355.6882-1-mmaddireddy@nvidia.com>
 <20190411170355.6882-16-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XQ/JOjNzrAcf1KaA"
Content-Disposition: inline
In-Reply-To: <20190411170355.6882-16-mmaddireddy@nvidia.com>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--XQ/JOjNzrAcf1KaA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2019 at 10:33:40PM +0530, Manikanta Maddireddy wrote:
> Disable controllers which failed to link up and configure CLKREQ# signals
> of these controllers as GPIO. This is required to avoid CLKREQ# signal of
> inactive controllers interfering with PLLE powerdown sequence.
>=20
> PCIE_CLKREQ_GPIO bits are defined only in Tegra186, however programming
> these bits in other SoCs doesn't cause any side effects. Program these
> bits for all Tegra SoCs to avoid conditional check.
>=20
> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> ---
>  drivers/pci/controller/pci-tegra.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/=
pci-tegra.c
> index 7e24eac12668..8e5fdc8ce3d6 100644
> --- a/drivers/pci/controller/pci-tegra.c
> +++ b/drivers/pci/controller/pci-tegra.c
> @@ -160,6 +160,8 @@
>  #define  AFI_PCIE_CONFIG_SM2TMS0_XBAR_CONFIG_211	(0x1 << 20)
>  #define  AFI_PCIE_CONFIG_SM2TMS0_XBAR_CONFIG_411	(0x2 << 20)
>  #define  AFI_PCIE_CONFIG_SM2TMS0_XBAR_CONFIG_111	(0x2 << 20)
> +#define  AFI_PCIE_CONFIG_PCIE_CLKREQ_GPIO(x)		(1 << ((x) + 29))
> +#define  AFI_PCIE_CONFIG_PCIE_CLKREQ_GPIO_ALL		(0x7 << 29)
> =20
>  #define AFI_FUSE			0x104
>  #define  AFI_FUSE_PCIE_T0_GEN2_DIS	(1 << 2)
> @@ -733,6 +735,15 @@ static void tegra_pcie_port_disable(struct tegra_pci=
e_port *port)
> =20
>  	value &=3D ~AFI_PEX_CTRL_REFCLK_EN;
>  	afi_writel(port->pcie, value, ctrl);
> +
> +	/*
> +	 * disable PCIe device and set CLKREQ# as gpio

Did you mean to say "PCIe port"? Also, s/gpio/GPIO/, and you can make
use of 78 characters. With those changes, the above may just fit on one
line.

Thierry

> +	 * to allow PLLE power down
> +	 */
> +	value =3D afi_readl(port->pcie, AFI_PCIE_CONFIG);
> +	value |=3D AFI_PCIE_CONFIG_PCIE_DISABLE(port->index);
> +	value |=3D AFI_PCIE_CONFIG_PCIE_CLKREQ_GPIO(port->index);
> +	afi_writel(port->pcie, value, AFI_PCIE_CONFIG);
>  }
> =20
>  static void tegra_pcie_port_free(struct tegra_pcie_port *port)
> @@ -1147,9 +1158,12 @@ static int tegra_pcie_enable_controller(struct teg=
ra_pcie *pcie)
>  	value =3D afi_readl(pcie, AFI_PCIE_CONFIG);
>  	value &=3D ~AFI_PCIE_CONFIG_SM2TMS0_XBAR_CONFIG_MASK;
>  	value |=3D AFI_PCIE_CONFIG_PCIE_DISABLE_ALL | pcie->xbar_config;
> +	value |=3D AFI_PCIE_CONFIG_PCIE_CLKREQ_GPIO_ALL;
> =20
> -	list_for_each_entry(port, &pcie->ports, list)
> +	list_for_each_entry(port, &pcie->ports, list) {
>  		value &=3D ~AFI_PCIE_CONFIG_PCIE_DISABLE(port->index);
> +		value &=3D ~AFI_PCIE_CONFIG_PCIE_CLKREQ_GPIO(port->index);
> +	}
> =20
>  	afi_writel(pcie, value, AFI_PCIE_CONFIG);
> =20
> --=20
> 2.17.1
>=20

--XQ/JOjNzrAcf1KaA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAly0hEsACgkQ3SOs138+
s6Hczg//TopF/Zrzk9uIpF12zvnPscYSstD6HBBQ7Ymw6iIqfFFXA4os2oXRVz7/
n2hLZm9tbjjFPT6dgoOg7i65R2ttb8I4/ehbHRjteRnjBW+cN5jlkc/z9tGHn6hZ
HVPyASmZu7XvyFCE5zlBz3jnfiOp2PwcL/QEY2vHkhnaiVxnTBbjjDQdDgLPHkEQ
qKdfAQ7JL7VGAiYb3nf8XWGQwtuqOG3Y95SDO2YdvOFGVtO+daLj5B/I1sX3Y1g+
ranrQS0alVZTguO2a2+avDvKTzZbR2o34zPoLsEMTCQrmIIogTyCPbvNYhtFFw+L
zy751jS0WV7Cq8gkOX8cK3MsWxdZlEep0UL7Fm0m85CBDSMew1+ltmX27BMkf5Z7
eIr8wb0gXB5J52GViWKyI+EoPTzTRQqSTdClxQmd/ry2gS3ffj12Nh8IlwZ+a/4B
zbJIvtoXiwKCqMyQAMM3GMVwrESJR/ffYEQN3KYgShWwIJnVj3K0b3v3AtTY4cG0
cQDlUDRkm821lH3MMPsiR6eMqkUT5meDIjBV8YhM9GxHqH6cK/ptz9xOXSEjh1ND
42/dhYcBm8ltOts0cr3ohlx8gBaqjDf1fh0PtykZzYmHr0BoWsEJLaHKziveSqIG
sP5zHVORC6EN/ISQImWXXO4BvXya90J1vO5MB13q6veJMTz1gRY=
=T3tO
-----END PGP SIGNATURE-----

--XQ/JOjNzrAcf1KaA--
