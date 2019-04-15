Return-Path: <SRS0=lIuD=SR=gmail.com=thierry.reding@kernel.org>
Date: Mon, 15 Apr 2019 15:31:44 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 20/30] PCI: tegra: Add AFI_PEX2_CTRL reg offset as part
 of soc struct
Message-ID: <20190415133144.GT29254@ulmo>
References: <20190411170355.6882-1-mmaddireddy@nvidia.com>
 <20190411170355.6882-21-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2wYUONsACSj9OMJp"
Content-Disposition: inline
In-Reply-To: <20190411170355.6882-21-mmaddireddy@nvidia.com>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--2wYUONsACSj9OMJp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2019 at 10:33:45PM +0530, Manikanta Maddireddy wrote:
> Tegra186 and Tegra30 have three PCIe root ports. AFI_PEX2_CTRL register
> is defined for third root port. Offset of this register in Tegra186 is
> different from Tegra30, so add offset as part of soc data structure.
>=20
> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> ---
>  drivers/pci/controller/pci-tegra.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

> diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/=
pci-tegra.c
> index 11be88a394e3..8fdc7934d4c9 100644
> --- a/drivers/pci/controller/pci-tegra.c
> +++ b/drivers/pci/controller/pci-tegra.c
> @@ -169,7 +169,6 @@
> =20
>  #define AFI_PEX0_CTRL			0x110
>  #define AFI_PEX1_CTRL			0x118
> -#define AFI_PEX2_CTRL			0x128
>  #define  AFI_PEX_CTRL_RST		(1 << 0)
>  #define  AFI_PEX_CTRL_CLKREQ_EN		(1 << 1)
>  #define  AFI_PEX_CTRL_REFCLK_EN		(1 << 3)
> @@ -307,6 +306,7 @@ struct tegra_pcie_soc {
>  	unsigned int num_ports;
>  	const struct tegra_pcie_port_soc *ports;
>  	unsigned int msi_base_shift;
> +	unsigned long afi_pex2_ctrl;
>  	u32 pads_pll_ctl;
>  	u32 tx_ref_sel;
>  	u32 pads_refclk_cfg0;
> @@ -516,6 +516,7 @@ static struct pci_ops tegra_pcie_ops =3D {
> =20
>  static unsigned long tegra_pcie_port_get_pex_ctrl(struct tegra_pcie_port=
 *port)
>  {
> +	const struct tegra_pcie_soc *soc =3D port->pcie->soc;
>  	unsigned long ret =3D 0;
> =20
>  	switch (port->index) {
> @@ -528,7 +529,7 @@ static unsigned long tegra_pcie_port_get_pex_ctrl(str=
uct tegra_pcie_port *port)
>  		break;
> =20
>  	case 2:
> -		ret =3D AFI_PEX2_CTRL;
> +		ret =3D soc->afi_pex2_ctrl;
>  		break;
>  	}
> =20
> @@ -2439,6 +2440,7 @@ static const struct tegra_pcie_soc tegra20_pcie =3D=
 {
>  	.num_ports =3D 2,
>  	.ports =3D tegra20_pcie_ports,
>  	.msi_base_shift =3D 0,
> +	.afi_pex2_ctrl =3D 0x128,
>  	.pads_pll_ctl =3D PADS_PLL_CTL_TEGRA20,
>  	.tx_ref_sel =3D PADS_PLL_CTL_TXCLKREF_DIV10,
>  	.pads_refclk_cfg0 =3D 0xfa5cfa5c,
> @@ -2548,6 +2550,7 @@ static const struct tegra_pcie_soc tegra186_pcie =
=3D {
>  	.num_ports =3D 3,
>  	.ports =3D tegra186_pcie_ports,
>  	.msi_base_shift =3D 8,
> +	.afi_pex2_ctrl =3D 0x19c,
>  	.pads_pll_ctl =3D PADS_PLL_CTL_TEGRA30,
>  	.tx_ref_sel =3D PADS_PLL_CTL_TXCLKREF_BUF_EN,
>  	.pads_refclk_cfg0 =3D 0x80b880b8,
> --=20
> 2.17.1
>=20

--2wYUONsACSj9OMJp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAly0h8AACgkQ3SOs138+
s6HcvRAAuPosCZSsiaNrAsPsKj5JdLdBSkQSa+kIKANfg/dontJT5KWNmwVIcTKe
x2R17zFUOUSL5W49kmtbYVzISiM05gyCDJv59D6HUSJbODob6oA8h9imRMwz+8nY
4VydqeF3r5GwplUChZrDmRNFKY7SPIssgLjaGArFQ0xv/qoY00Qc6u5tkK9WEWX/
aGdsDQ6wChrAhDhc8LR6xngRHOFYO4EWdpEGmlP/Y4KOxiNmWlmlo9Q0QXhXZ8Dr
WZSJeoYqmPI9oQX6JnR1bYwRUqPfP0nMcyLIZG7MEbFbjs7SrM7GPiqVEvYUOpJo
BMEEorS4Jo5B6KXKsHGM48dEdXT487OPpIonDSLvGNipTVsE0uGhcI96DMNMyUTA
w7kkTG+3JLT8uNsPR3SDEii2SCNzxL/Nd3eUoTpvLj7NX2twj40OCh/D/ZPxnUT3
iVXPVFbrXZwkHa2WqQVkbhie6iq36m704WN3JWZnxA1TlzC/r99tKwJSUk7SMRui
fltlxugdo1hejV5rbS/d4FvuSCvyTAhnrbqSGEzN08aLF2vSpFBn+gC2AcWHf66Z
1HhyPcKjuPkrVaowZoJByfZHn/azvW1wK+Hsn7cmsP9cUb2kclpi8sHR2t1rOdsC
+AwkwN7MdmZEJWQa0/SlhlaovkcvgdUiAJeL7PG51r7crFT7FPE=
=1fJC
-----END PGP SIGNATURE-----

--2wYUONsACSj9OMJp--
