Return-Path: <SRS0=lIuD=SR=gmail.com=thierry.reding@kernel.org>
Date: Mon, 15 Apr 2019 13:39:18 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 11/30] PCI: tegra: Increase the deskew retry time
Message-ID: <20190415113918.GL29254@ulmo>
References: <20190411170355.6882-1-mmaddireddy@nvidia.com>
 <20190411170355.6882-12-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="O8/n5iBOhiUtMkxf"
Content-Disposition: inline
In-Reply-To: <20190411170355.6882-12-mmaddireddy@nvidia.com>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--O8/n5iBOhiUtMkxf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2019 at 10:33:36PM +0530, Manikanta Maddireddy wrote:
> Some times link speed change from Gen2 to Gen1 fails due to instability

"Sometimes"

> in deskew logic on lane-0 in Tegra210. Increase the deskew retry time
> to resolve this issue.
>=20
> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> ---
>  drivers/pci/controller/pci-tegra.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>=20
> diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/=
pci-tegra.c
> index f785ecae2f6b..9e61da68cfae 100644
> --- a/drivers/pci/controller/pci-tegra.c
> +++ b/drivers/pci/controller/pci-tegra.c
> @@ -209,6 +209,10 @@
>  #define  RP_VEND_XP_OPPORTUNISTIC_ACK		(1 << 27)
>  #define  RP_VEND_XP_OPPORTUNISTIC_UPDATEFC	(1 << 28)
> =20
> +#define RP_VEND_CTL0	0x00000f44
> +#define  RP_VEND_CTL0_DSK_RST_PULSE_WIDTH_MASK	(0xf << 12)
> +#define  RP_VEND_CTL0_DSK_RST_PULSE_WIDTH	(0x9 << 12)
> +
>  #define RP_VEND_CTL1	0x00000f48
>  #define  RP_VEND_CTL1_ERPT	(1 << 13)
> =20
> @@ -304,6 +308,7 @@ struct tegra_pcie_soc {
>  	bool force_pca_enable;
>  	bool program_uphy;
>  	bool update_clamp_threshold;
> +	bool program_deskew_time;
>  	struct {
>  		struct {
>  			u32 rp_ectl_2_r1;
> @@ -615,6 +620,23 @@ static void tegra_pcie_program_ectl_settings(struct =
tegra_pcie_port *port)
>  	writel(val, port->base + RP_ECTL_6_R2);
>  }
> =20
> +static void tegra_pcie_apply_sw_fixup(struct tegra_pcie_port *port)
> +{
> +	const struct tegra_pcie_soc *soc =3D port->pcie->soc;
> +	u32 value;
> +
> +	/*
> +	 * Tune deskew retry time to take care of Gen2 -> Gen1
> +	 * link speed change error in corner cases
> +	 */
> +	if (soc->program_deskew_time) {
> +		value =3D readl(port->base + RP_VEND_CTL0);
> +		value &=3D ~RP_VEND_CTL0_DSK_RST_PULSE_WIDTH_MASK;
> +		value |=3D RP_VEND_CTL0_DSK_RST_PULSE_WIDTH;
> +		writel(value, port->base + RP_VEND_CTL0);
> +	}
> +}
> +
>  static void tegra_pcie_port_enable(struct tegra_pcie_port *port)
>  {
>  	unsigned long ctrl =3D tegra_pcie_port_get_pex_ctrl(port);
> @@ -643,6 +665,7 @@ static void tegra_pcie_port_enable(struct tegra_pcie_=
port *port)
>  	tegra_pcie_enable_rp_features(port);
>  	if (soc->ectl.enable)
>  		tegra_pcie_program_ectl_settings(port);
> +	tegra_pcie_apply_sw_fixup(port);

Blank line between the above two for readability.

Thierry

>  }
> =20
>  static void tegra_pcie_port_disable(struct tegra_pcie_port *port)
> @@ -2357,6 +2380,7 @@ static const struct tegra_pcie_soc tegra20_pcie =3D=
 {
>  	.force_pca_enable =3D false,
>  	.program_uphy =3D true,
>  	.update_clamp_threshold =3D false,
> +	.program_deskew_time =3D false,
>  	.ectl.enable =3D false,
>  };
> =20
> @@ -2382,6 +2406,7 @@ static const struct tegra_pcie_soc tegra30_pcie =3D=
 {
>  	.force_pca_enable =3D false,
>  	.program_uphy =3D true,
>  	.update_clamp_threshold =3D false,
> +	.program_deskew_time =3D false,
>  	.ectl.enable =3D false,
>  };
> =20
> @@ -2400,6 +2425,7 @@ static const struct tegra_pcie_soc tegra124_pcie =
=3D {
>  	.force_pca_enable =3D false,
>  	.program_uphy =3D true,
>  	.update_clamp_threshold =3D true,
> +	.program_deskew_time =3D false,
>  	.ectl.enable =3D false,
>  };
> =20
> @@ -2418,6 +2444,7 @@ static const struct tegra_pcie_soc tegra210_pcie =
=3D {
>  	.force_pca_enable =3D true,
>  	.program_uphy =3D true,
>  	.update_clamp_threshold =3D true,
> +	.program_deskew_time =3D true,
>  	.ectl.regs.rp_ectl_2_r1 =3D 0x0000000f,
>  	.ectl.regs.rp_ectl_4_r1 =3D 0x00000067,
>  	.ectl.regs.rp_ectl_5_r1 =3D 0x55010000,
> @@ -2451,6 +2478,7 @@ static const struct tegra_pcie_soc tegra186_pcie =
=3D {
>  	.force_pca_enable =3D false,
>  	.program_uphy =3D false,
>  	.update_clamp_threshold =3D false,
> +	.program_deskew_time =3D false,
>  	.ectl.enable =3D false,
>  };
> =20
> --=20
> 2.17.1
>=20

--O8/n5iBOhiUtMkxf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAly0bWUACgkQ3SOs138+
s6H3aRAAui4fKyf5HV4PmHv7bi0C1FhnlFQWIQ4KmJImOj4zkEqEYuVsQ3CY0j1F
JQCk4/9m7bIzxfK3wDQzyCd6nujr81JME+iWPgHvqTU40bLd4GaE9N3uH8cH4bqB
qJFfS74sdiKmWjJO3IiEYKa1WVqs5xRPhh25bXHzH4rrrQSjZPHqI+nJQCrB1DbE
pJTu7S58/7vCkEti4EYUFhpFtg8VpmlEZ/4bwk3xwhNdLtKcoiLgItPw5dYbJDvs
FibxO4lPij/vsa73O4zZWAb1LkukosASnqq6C0H3dsX9tVwnAPWXkkP0BKi0Y1Rm
GfyHAiSnVnGcb/dorrefbrmkgjCj0U+OPWKyDaM1w/PLeCvRM2LsTmCkxQWKZ9Lt
iEhNIgEKas/U0EjwLor0AYQ2v5K8dDwzHe/wntWpXBMTkXmyck++nD4swBq/5/8A
D8Ay7lE+AiePNvhHo0oC6x0j2vdSFgJJyHuEZ5t1svsr8Dr0Y79rv653BprEotiw
ptkX1xECSBpKVcZAEF3GnZTS/AU2JcyQaxAyUhbLUQoi6KR2f3+c3XwrJ7W1sTZF
g5HDy9b8vVg5viTHaEybJIx2rzSOL27rcjdDmAC8jvgHWEnZrup+NRpJXmNlWRGE
PftsYBQYHRpQTb8k+zzej7H1zvtlcYxJCGLFb4b4Ox7qOcsr8Yc=
=p8CP
-----END PGP SIGNATURE-----

--O8/n5iBOhiUtMkxf--
