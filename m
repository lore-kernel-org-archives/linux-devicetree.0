Return-Path: <SRS0=lIuD=SR=gmail.com=thierry.reding@kernel.org>
Date: Mon, 15 Apr 2019 13:47:03 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 13/30] PCI: tegra: Update flow control threshold in
 Tegra210
Message-ID: <20190415114703.GO29254@ulmo>
References: <20190411170355.6882-1-mmaddireddy@nvidia.com>
 <20190411170355.6882-14-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="96dIhm/ZjrNld+BP"
Content-Disposition: inline
In-Reply-To: <20190411170355.6882-14-mmaddireddy@nvidia.com>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--96dIhm/ZjrNld+BP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2019 at 10:33:38PM +0530, Manikanta Maddireddy wrote:
> Recommended update FC threshold in Tegra210 is 0x60 for best performance
> of x1 link. Setting this to 0x60 provides the best balance between number
> of UpdateFC and read data sent over the link.
>=20
> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> ---
>  drivers/pci/controller/pci-tegra.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)

Looks to me like part of this patch ended up in 12/30?

Thierry

> diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/=
pci-tegra.c
> index b74408eeb367..7dc728cc5f51 100644
> --- a/drivers/pci/controller/pci-tegra.c
> +++ b/drivers/pci/controller/pci-tegra.c
> @@ -319,6 +319,7 @@ struct tegra_pcie_soc {
>  	bool update_clamp_threshold;
>  	bool program_deskew_time;
>  	bool raw_violation_fixup;
> +	bool update_fc_threshold;
>  	struct {
>  		struct {
>  			u32 rp_ectl_2_r1;
> @@ -662,6 +663,13 @@ static void tegra_pcie_apply_sw_fixup(struct tegra_p=
cie_port *port)
>  		value |=3D soc->update_fc_val;
>  		writel(value, port->base + RP_VEND_XP);
>  	}
> +
> +	if (soc->update_fc_threshold) {
> +		value =3D readl(port->base + RP_VEND_XP);
> +		value &=3D ~RP_VEND_XP_UPDATE_FC_THRESHOLD_MASK;
> +		value |=3D soc->update_fc_val;
> +		writel(value, port->base + RP_VEND_XP);
> +	}
>  }
> =20
>  static void tegra_pcie_port_enable(struct tegra_pcie_port *port)
> @@ -2409,6 +2417,7 @@ static const struct tegra_pcie_soc tegra20_pcie =3D=
 {
>  	.update_clamp_threshold =3D false,
>  	.program_deskew_time =3D false,
>  	.raw_violation_fixup =3D false,
> +	.update_fc_threshold =3D false,
>  	.ectl.enable =3D false,
>  };
> =20
> @@ -2436,6 +2445,7 @@ static const struct tegra_pcie_soc tegra30_pcie =3D=
 {
>  	.update_clamp_threshold =3D false,
>  	.program_deskew_time =3D false,
>  	.raw_violation_fixup =3D false,
> +	.update_fc_threshold =3D false,
>  	.ectl.enable =3D false,
>  };
> =20
> @@ -2458,6 +2468,7 @@ static const struct tegra_pcie_soc tegra124_pcie =
=3D {
>  	.update_clamp_threshold =3D true,
>  	.program_deskew_time =3D false,
>  	.raw_violation_fixup =3D true,
> +	.update_fc_threshold =3D false,
>  	.ectl.enable =3D false,
>  };
> =20
> @@ -2468,6 +2479,8 @@ static const struct tegra_pcie_soc tegra210_pcie =
=3D {
>  	.pads_pll_ctl =3D PADS_PLL_CTL_TEGRA30,
>  	.tx_ref_sel =3D PADS_PLL_CTL_TXCLKREF_BUF_EN,
>  	.pads_refclk_cfg0 =3D 0x90b890b8,
> +	/* FC threshold is bit[25:18] */
> +	.update_fc_val =3D 0x01800000,
>  	.has_pex_clkreq_en =3D true,
>  	.has_pex_bias_ctrl =3D true,
>  	.has_intr_prsnt_sense =3D true,
> @@ -2478,6 +2491,7 @@ static const struct tegra_pcie_soc tegra210_pcie =
=3D {
>  	.update_clamp_threshold =3D true,
>  	.program_deskew_time =3D true,
>  	.raw_violation_fixup =3D false,
> +	.update_fc_threshold =3D true,
>  	.ectl.regs.rp_ectl_2_r1 =3D 0x0000000f,
>  	.ectl.regs.rp_ectl_4_r1 =3D 0x00000067,
>  	.ectl.regs.rp_ectl_5_r1 =3D 0x55010000,
> @@ -2513,6 +2527,7 @@ static const struct tegra_pcie_soc tegra186_pcie =
=3D {
>  	.update_clamp_threshold =3D false,
>  	.program_deskew_time =3D false,
>  	.raw_violation_fixup =3D false,
> +	.update_fc_threshold =3D false,
>  	.ectl.enable =3D false,
>  };
> =20
> --=20
> 2.17.1
>=20

--96dIhm/ZjrNld+BP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAly0bzcACgkQ3SOs138+
s6FC9Q/+NP0IHv6WGcpL1qKW4euVJU1JjqWQIebNKPKDt/h+tEzDDvRoTvy4HCoL
Hhm372Qvjm/U4bLkKniFEcb5HfM8Bjn5RBD8+HJ5O55bRQJ+mH8bverT5Nio+4S8
4tYmj1aIkLRV74pUvMyLbmA5iyWTvRR3f56ag9KYWyUj90AFOq6TOpDYDzOPJTQX
PEzvcxNYC1h6RX8I28JbQa+KM1gq97vs76eeEjqCimp8ZZCOeeoeO7K1amTUibl3
9EdWsh//Oz9QOHDekKx6+obcYeXW5On7Qz3UQfwvQWGIO7ehNQeuCV29i6pYNPnC
Qi75DIzT4YmqgX4B3HdiRPQ4pB3HjzORJmn5HD21l0MNGlceM8h1JAFHXdhmdxQa
vVB172gr0IZTP8ePAwcK8f3S4Qw8GvTL+sx3cVBX8m+2H+p6TPR1vED50nCIdfJT
pMa+HLLtjW8NKdRFtWXnEGe1c1OoFUGO9z19Pm5Mp6FQIf1xWAkJfOUMzNxC0sU2
y5JoJDxloYmfAAXIKxqFbMDVyUkvcHguh/R27JtHAVPElj2mFQNx79FwimgVLXW5
tEQ5H/WsU3dfWMxHdaEpLF0vuDx4qKdIAJwnRCQVqhEdqdYmyl40wTK8HhOIxceR
vepZM2tAiEd5N9qXBIlq7Fz3of82kNQdAPrBUD9r+pprERy+PzI=
=fi8I
-----END PGP SIGNATURE-----

--96dIhm/ZjrNld+BP--
