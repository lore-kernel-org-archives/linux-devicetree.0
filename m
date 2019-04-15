Return-Path: <SRS0=lIuD=SR=gmail.com=thierry.reding@kernel.org>
Date: Mon, 15 Apr 2019 13:23:21 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 05/30] PCI: tegra: Advertise PCIe Advanced Error
 Reporting (AER) capability
Message-ID: <20190415112321.GF29254@ulmo>
References: <20190411170355.6882-1-mmaddireddy@nvidia.com>
 <20190411170355.6882-6-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Ls2Gy6y7jbHLe9Od"
Content-Disposition: inline
In-Reply-To: <20190411170355.6882-6-mmaddireddy@nvidia.com>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--Ls2Gy6y7jbHLe9Od
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2019 at 10:33:30PM +0530, Manikanta Maddireddy wrote:
> Default root port setting hides AER capability. This patch enables the
> advertisement of AER capability by root port.
>=20
> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> ---
>  drivers/pci/controller/pci-tegra.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>=20
> diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/=
pci-tegra.c
> index 6ccda82735f8..9ff1a0e2797f 100644
> --- a/drivers/pci/controller/pci-tegra.c
> +++ b/drivers/pci/controller/pci-tegra.c
> @@ -180,6 +180,9 @@
>  #define RP_VEND_XP	0x00000f00
>  #define  RP_VEND_XP_DL_UP	(1 << 30)
> =20
> +#define RP_VEND_CTL1	0x00000f48
> +#define  RP_VEND_CTL1_ERPT	(1 << 13)
> +
>  #define RP_VEND_CTL2 0x00000fa8
>  #define  RP_VEND_CTL2_PCA_ENABLE (1 << 7)
> =20
> @@ -478,6 +481,16 @@ static void tegra_pcie_port_reset(struct tegra_pcie_=
port *port)
>  	afi_writel(port->pcie, value, ctrl);
>  }
> =20
> +static void tegra_pcie_enable_rp_features(struct tegra_pcie_port *port)

Why not call this tegra_pcie_enable_aer()? Are you planning on adding a
lot more overrides to this function? If there aren't too many, you may
want to just have one small function per feature and drop the comment in
the function body.

If there's going to be a lot, the above seems okay.

Thierry

> +{
> +	u32 value;
> +
> +	/* Enable AER capability */
> +	value =3D readl(port->base + RP_VEND_CTL1);
> +	value |=3D RP_VEND_CTL1_ERPT;
> +	writel(value, port->base + RP_VEND_CTL1);
> +}
> +
>  static void tegra_pcie_port_enable(struct tegra_pcie_port *port)
>  {
>  	unsigned long ctrl =3D tegra_pcie_port_get_pex_ctrl(port);
> @@ -502,6 +515,8 @@ static void tegra_pcie_port_enable(struct tegra_pcie_=
port *port)
>  		value |=3D RP_VEND_CTL2_PCA_ENABLE;
>  		writel(value, port->base + RP_VEND_CTL2);
>  	}
> +
> +	tegra_pcie_enable_rp_features(port);
>  }
> =20
>  static void tegra_pcie_port_disable(struct tegra_pcie_port *port)
> --=20
> 2.17.1
>=20

--Ls2Gy6y7jbHLe9Od
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAly0aagACgkQ3SOs138+
s6Gt0xAAsH3/KOaIFzrf/ALqAHBJzuxy5zQvI/swU8tbr/0EA7LgiHx9eQPME3Ox
6qQXloJi39VFHmTtLw2WmyIDSheobOqggSbbPJtBzK6TqWQ5VcJ+02Ax2IDc40qq
v7k1vJPL1uoqxyZcdv9o2myLyEkuI9KXWb/GgOaEF2g7/3DEbFZoxYqhfDLs2AZ1
A6YE6NajLaD2CrvVhEvAYM57NRG+BnA2SnpR3c9lXbtp+8xBX89EZrs+Q2v7okKR
9RplIhM7hVEm37nSgGMgQmS2yVvTtT2L+1WgHEFw8qWACa0ISpWkq6dAYYwaUzxy
Uz5HZwXvjBknbZYRgDYw79Pr8ueYu9jxEkO540BFl9njPl8v9nqZYxjTBTgpvEZ/
lP/mncGbPRIZ+HgpwFV0NTq1oUbUz81RcEKnz9DYhM+60OteEhnSKH81D7BgvEpn
z0GLrE2Tz22oxPOj8xZVFod3+oDSou2mpPw3NHTvbCzn3AjVBTUAKNw4SRLMlvl6
fTytaghShwQLF2Cp72JyPPd1f7PjKi6295t4HhMJr/eHF1grG3wJnCOT6oFHqWYj
0bHVhzC7Asil0/jTDhNaiVQTIEmcrZkQatCXCqueUHhHVdLSU+NAagpk2E4Suqg/
25eBTbFleAqofRz7MnB9g9wqbURMXPNld3hUtUUvzGwKvqSUNL0=
=KKUO
-----END PGP SIGNATURE-----

--Ls2Gy6y7jbHLe9Od--
