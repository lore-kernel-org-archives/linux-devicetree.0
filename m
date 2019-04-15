Return-Path: <SRS0=lIuD=SR=gmail.com=thierry.reding@kernel.org>
Date: Mon, 15 Apr 2019 13:37:03 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 10/30] PCI: tegra: Enable PCIe xclk clock clamping
Message-ID: <20190415113703.GK29254@ulmo>
References: <20190411170355.6882-1-mmaddireddy@nvidia.com>
 <20190411170355.6882-11-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="C7Ke/meiCZutM6I/"
Content-Disposition: inline
In-Reply-To: <20190411170355.6882-11-mmaddireddy@nvidia.com>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--C7Ke/meiCZutM6I/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2019 at 10:33:35PM +0530, Manikanta Maddireddy wrote:
> Enable xclk clock clamping when entering L1. Clamp threshold will
> determine the time spent waiting for clock module to turn on xclk after
> signalling it. Default threshold value in Tegra124 and 210 is not enough

Perhaps spell out Tegra210.

> to turn ON xlck clock. Increase the clamp threshold to meet the clock

s/ON/on/, s/xlck/xclk/

> module timing in Tegra124 and 210, default threshold value is sufficient

Spell out Tegra210. Also, maybe make the part after the , a separate
sentence? And maybe also mention Tegra20 and Tegra30.

Thierry

> in Tegra186.
>=20
> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> ---
>  drivers/pci/controller/pci-tegra.c | 28 ++++++++++++++++++++++++++--
>  1 file changed, 26 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/=
pci-tegra.c
> index e40df52e46a7..f785ecae2f6b 100644
> --- a/drivers/pci/controller/pci-tegra.c
> +++ b/drivers/pci/controller/pci-tegra.c
> @@ -219,8 +219,14 @@
>  #define  RP_VEND_CTL2_PCA_ENABLE (1 << 7)
> =20
>  #define RP_PRIV_MISC	0x00000fe0
> -#define  RP_PRIV_MISC_PRSNT_MAP_EP_PRSNT (0xe << 0)
> -#define  RP_PRIV_MISC_PRSNT_MAP_EP_ABSNT (0xf << 0)
> +#define  RP_PRIV_MISC_PRSNT_MAP_EP_PRSNT		(0xe << 0)
> +#define  RP_PRIV_MISC_PRSNT_MAP_EP_ABSNT		(0xf << 0)
> +#define  RP_PRIV_MISC_CTLR_CLK_CLAMP_THRESHOLD_MASK	(0x7f << 16)
> +#define  RP_PRIV_MISC_CTLR_CLK_CLAMP_THRESHOLD		(0xf << 16)
> +#define  RP_PRIV_MISC_CTLR_CLK_CLAMP_ENABLE		(1 << 23)
> +#define  RP_PRIV_MISC_TMS_CLK_CLAMP_THRESHOLD_MASK	(0x7f << 24)
> +#define  RP_PRIV_MISC_TMS_CLK_CLAMP_THRESHOLD		(0xf << 24)
> +#define  RP_PRIV_MISC_TMS_CLK_CLAMP_ENABLE		(1 << 31)
> =20
>  #define RP_LINK_CONTROL_STATUS			0x00000090
>  #define  RP_LINK_CONTROL_STATUS_DL_LINK_ACTIVE	0x20000000
> @@ -297,6 +303,7 @@ struct tegra_pcie_soc {
>  	bool has_gen2;
>  	bool force_pca_enable;
>  	bool program_uphy;
> +	bool update_clamp_threshold;
>  	struct {
>  		struct {
>  			u32 rp_ectl_2_r1;
> @@ -528,6 +535,7 @@ static void tegra_pcie_port_reset(struct tegra_pcie_p=
ort *port)
> =20
>  static void tegra_pcie_enable_rp_features(struct tegra_pcie_port *port)
>  {
> +	const struct tegra_pcie_soc *soc =3D port->pcie->soc;
>  	u32 value;
> =20
>  	/* Enable AER capability */
> @@ -548,6 +556,17 @@ static void tegra_pcie_enable_rp_features(struct teg=
ra_pcie_port *port)
>  	value =3D readl(port->base + RP_VEND_XP_BIST);
>  	value |=3D RP_VEND_XP_BIST_GOTO_L1_L2_AFTER_DLLP_DONE;
>  	writel(value, port->base + RP_VEND_XP_BIST);
> +
> +	value =3D readl(port->base + RP_PRIV_MISC);
> +	value |=3D RP_PRIV_MISC_CTLR_CLK_CLAMP_ENABLE;
> +	value |=3D RP_PRIV_MISC_TMS_CLK_CLAMP_ENABLE;
> +	if (soc->update_clamp_threshold) {

Blank line between the above two.

> +		value &=3D ~(RP_PRIV_MISC_CTLR_CLK_CLAMP_THRESHOLD_MASK |
> +				RP_PRIV_MISC_TMS_CLK_CLAMP_THRESHOLD_MASK);
> +		value |=3D RP_PRIV_MISC_CTLR_CLK_CLAMP_THRESHOLD |
> +			RP_PRIV_MISC_TMS_CLK_CLAMP_THRESHOLD;
> +	}
> +	writel(value, port->base + RP_PRIV_MISC);

Ditto.

Thierry

>  }
> =20
>  static void tegra_pcie_program_ectl_settings(struct tegra_pcie_port *por=
t)
> @@ -2337,6 +2356,7 @@ static const struct tegra_pcie_soc tegra20_pcie =3D=
 {
>  	.has_gen2 =3D false,
>  	.force_pca_enable =3D false,
>  	.program_uphy =3D true,
> +	.update_clamp_threshold =3D false,
>  	.ectl.enable =3D false,
>  };
> =20
> @@ -2361,6 +2381,7 @@ static const struct tegra_pcie_soc tegra30_pcie =3D=
 {
>  	.has_gen2 =3D false,
>  	.force_pca_enable =3D false,
>  	.program_uphy =3D true,
> +	.update_clamp_threshold =3D false,
>  	.ectl.enable =3D false,
>  };
> =20
> @@ -2378,6 +2399,7 @@ static const struct tegra_pcie_soc tegra124_pcie =
=3D {
>  	.has_gen2 =3D true,
>  	.force_pca_enable =3D false,
>  	.program_uphy =3D true,
> +	.update_clamp_threshold =3D true,
>  	.ectl.enable =3D false,
>  };
> =20
> @@ -2395,6 +2417,7 @@ static const struct tegra_pcie_soc tegra210_pcie =
=3D {
>  	.has_gen2 =3D true,
>  	.force_pca_enable =3D true,
>  	.program_uphy =3D true,
> +	.update_clamp_threshold =3D true,
>  	.ectl.regs.rp_ectl_2_r1 =3D 0x0000000f,
>  	.ectl.regs.rp_ectl_4_r1 =3D 0x00000067,
>  	.ectl.regs.rp_ectl_5_r1 =3D 0x55010000,
> @@ -2427,6 +2450,7 @@ static const struct tegra_pcie_soc tegra186_pcie =
=3D {
>  	.has_gen2 =3D true,
>  	.force_pca_enable =3D false,
>  	.program_uphy =3D false,
> +	.update_clamp_threshold =3D false,
>  	.ectl.enable =3D false,
>  };
> =20
> --=20
> 2.17.1
>=20

--C7Ke/meiCZutM6I/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAly0bN8ACgkQ3SOs138+
s6H8YBAAsTXy+U8ia2sdUCtCg1580iAPmXmMxuJJv1Fb1GAROej2sAEtNWyusJBi
BieronjNR2tOmt7EiPo9u0wRRzVdv4PzvFyQme8PKR5I6yDYfFRF19dvzFMesGCT
1SkcdiC7OlvDSSdCUj4jQjIDDafzyOr2xtbgZrr0jd5GyizRSYJZTdajHPsjMukZ
a3Q0XkeYM5qTX8F3KMFncRj3jNjzMMQgl4t3Vj9LBwO2HO9QqQ3qgYP/fRzN0jYj
s56jIkS61Q8hQMQFNx2TvhgDrLOsSGx81q97+3nTYYoghdepVDP+ZbGmRY+8hWfL
2ZidY9kfSnUu5+8aU77QoOk9uUFHUAzJabfZq+M5s08gLcQEONW3X1tRI++62SQg
E6UBtLT/+7WifmPR88uyleNIwA/mcuH7ZDMK2Oru4fpFi5tbMry3llkZuR7G1R7u
vT3al5xJEO4FxsF2TeeULWK/uijt+kCNKpwVAz6a0fF9vSAihXbTyTOjHcbCRUWJ
PJaXIvQ/zyWQhQbxjPP0Gxm2EIKDzgfL/tv+ZE5urrid5cK+V0S+fqKCMoHwm5NM
VGlwNuj34YlignkFw0wqw8XUgQZwgwtAcU3PivbqlBCRkMD6GxL4yeyYJFHiYB0O
pyQjZMQPG5dGUAFylz8f1PHlXvNeUPtW/CZ7GPUstc0y8RyNdsc=
=pHTi
-----END PGP SIGNATURE-----

--C7Ke/meiCZutM6I/--
