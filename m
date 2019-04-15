Return-Path: <SRS0=lIuD=SR=gmail.com=thierry.reding@kernel.org>
Date: Mon, 15 Apr 2019 13:45:10 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 12/30] PCI: tegra: Add SW fixup for RAW violations
Message-ID: <20190415114510.GN29254@ulmo>
References: <20190411170355.6882-1-mmaddireddy@nvidia.com>
 <20190411170355.6882-13-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1HuzLmPZrG5RH6bG"
Content-Disposition: inline
In-Reply-To: <20190411170355.6882-13-mmaddireddy@nvidia.com>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--1HuzLmPZrG5RH6bG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2019 at 10:33:37PM +0530, Manikanta Maddireddy wrote:
> The logic which blocks read requests till AFI gets ACK for all outstanding
> MC writes does not behave correctly when number of outstanding write
> becomes more than 32 in Tegra124 and 132.
>=20
> SW fixup to prevent this issue is to limit outstanding posted writes and
> tweak updateFC timer threshold.
>=20
> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> ---
>  drivers/pci/controller/pci-tegra.c | 34 ++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>=20
> diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/=
pci-tegra.c
> index 9e61da68cfae..b74408eeb367 100644
> --- a/drivers/pci/controller/pci-tegra.c
> +++ b/drivers/pci/controller/pci-tegra.c
> @@ -178,6 +178,13 @@
> =20
>  #define AFI_PEXBIAS_CTRL_0		0x168
> =20
> +#define RP_PRIV_XP_DL		0x00000494
> +#define  RP_PRIV_XP_DL_GEN2_UPD_FC_TSHOLD	(0x1ff << 1)
> +
> +#define RP_RX_HDR_LIMIT		0x00000e00
> +#define  RP_RX_HDR_LIMIT_PW_MASK	(0xff << 8)
> +#define  RP_RX_HDR_LIMIT_PW		(0x0e << 8)
> +
>  #define RP_ECTL_2_R1	0x00000e84
>  #define  RP_ECTL_2_R1_RX_CTLE_1C_MASK		0xffff
> =20
> @@ -208,6 +215,7 @@
>  #define  RP_VEND_XP_DL_UP			(1 << 30)
>  #define  RP_VEND_XP_OPPORTUNISTIC_ACK		(1 << 27)
>  #define  RP_VEND_XP_OPPORTUNISTIC_UPDATEFC	(1 << 28)
> +#define  RP_VEND_XP_UPDATE_FC_THRESHOLD_MASK	(0xff << 18)
> =20
>  #define RP_VEND_CTL0	0x00000f44
>  #define  RP_VEND_CTL0_DSK_RST_PULSE_WIDTH_MASK	(0xf << 12)
> @@ -300,6 +308,7 @@ struct tegra_pcie_soc {
>  	u32 tx_ref_sel;
>  	u32 pads_refclk_cfg0;
>  	u32 pads_refclk_cfg1;
> +	u32 update_fc_val;

Shouldn't this be something like "update_fc_threshold" since the mask
defined above is for a field named UPDATE_FC_THRESHOLD?

>  	bool has_pex_clkreq_en;
>  	bool has_pex_bias_ctrl;
>  	bool has_intr_prsnt_sense;
> @@ -309,6 +318,7 @@ struct tegra_pcie_soc {
>  	bool program_uphy;
>  	bool update_clamp_threshold;
>  	bool program_deskew_time;
> +	bool raw_violation_fixup;
>  	struct {
>  		struct {
>  			u32 rp_ectl_2_r1;
> @@ -635,6 +645,23 @@ static void tegra_pcie_apply_sw_fixup(struct tegra_p=
cie_port *port)
>  		value |=3D RP_VEND_CTL0_DSK_RST_PULSE_WIDTH;
>  		writel(value, port->base + RP_VEND_CTL0);
>  	}
> +
> +	/* Fixup for read after write violation in T124 & T132 platforms */

No need to mention the SoC generations here, it's already implied by the
per-SoC flag.

Thierry

> +	if (soc->raw_violation_fixup) {
> +		value =3D readl(port->base + RP_RX_HDR_LIMIT);
> +		value &=3D ~RP_RX_HDR_LIMIT_PW_MASK;
> +		value |=3D RP_RX_HDR_LIMIT_PW;
> +		writel(value, port->base + RP_RX_HDR_LIMIT);
> +
> +		value =3D readl(port->base + RP_PRIV_XP_DL);
> +		value |=3D RP_PRIV_XP_DL_GEN2_UPD_FC_TSHOLD;
> +		writel(value, port->base + RP_PRIV_XP_DL);
> +
> +		value =3D readl(port->base + RP_VEND_XP);
> +		value &=3D ~RP_VEND_XP_UPDATE_FC_THRESHOLD_MASK;
> +		value |=3D soc->update_fc_val;
> +		writel(value, port->base + RP_VEND_XP);
> +	}
>  }
> =20
>  static void tegra_pcie_port_enable(struct tegra_pcie_port *port)
> @@ -2381,6 +2408,7 @@ static const struct tegra_pcie_soc tegra20_pcie =3D=
 {
>  	.program_uphy =3D true,
>  	.update_clamp_threshold =3D false,
>  	.program_deskew_time =3D false,
> +	.raw_violation_fixup =3D false,
>  	.ectl.enable =3D false,
>  };
> =20
> @@ -2407,6 +2435,7 @@ static const struct tegra_pcie_soc tegra30_pcie =3D=
 {
>  	.program_uphy =3D true,
>  	.update_clamp_threshold =3D false,
>  	.program_deskew_time =3D false,
> +	.raw_violation_fixup =3D false,
>  	.ectl.enable =3D false,
>  };
> =20
> @@ -2417,6 +2446,8 @@ static const struct tegra_pcie_soc tegra124_pcie =
=3D {
>  	.pads_pll_ctl =3D PADS_PLL_CTL_TEGRA30,
>  	.tx_ref_sel =3D PADS_PLL_CTL_TXCLKREF_BUF_EN,
>  	.pads_refclk_cfg0 =3D 0x44ac44ac,
> +	/* FC threshold is bit[25:18] */
> +	.update_fc_val =3D 0x03fc0000,



>  	.has_pex_clkreq_en =3D true,
>  	.has_pex_bias_ctrl =3D true,
>  	.has_intr_prsnt_sense =3D true,
> @@ -2426,6 +2457,7 @@ static const struct tegra_pcie_soc tegra124_pcie =
=3D {
>  	.program_uphy =3D true,
>  	.update_clamp_threshold =3D true,
>  	.program_deskew_time =3D false,
> +	.raw_violation_fixup =3D true,
>  	.ectl.enable =3D false,
>  };
> =20
> @@ -2445,6 +2477,7 @@ static const struct tegra_pcie_soc tegra210_pcie =
=3D {
>  	.program_uphy =3D true,
>  	.update_clamp_threshold =3D true,
>  	.program_deskew_time =3D true,
> +	.raw_violation_fixup =3D false,
>  	.ectl.regs.rp_ectl_2_r1 =3D 0x0000000f,
>  	.ectl.regs.rp_ectl_4_r1 =3D 0x00000067,
>  	.ectl.regs.rp_ectl_5_r1 =3D 0x55010000,
> @@ -2479,6 +2512,7 @@ static const struct tegra_pcie_soc tegra186_pcie =
=3D {
>  	.program_uphy =3D false,
>  	.update_clamp_threshold =3D false,
>  	.program_deskew_time =3D false,
> +	.raw_violation_fixup =3D false,
>  	.ectl.enable =3D false,
>  };
> =20
> --=20
> 2.17.1
>=20

--1HuzLmPZrG5RH6bG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAly0bsUACgkQ3SOs138+
s6GQsBAAphKNxmjeFEhYJ7PzO3svVSMm0PsR5lmax1lw4LIfKrdFT3TxghwSu8qV
U4UqMKTxWVQdZ4XjtY9O1C03AqTtODi1qrwg1yRu9QqBO7yjrlVXEp5h6slPDkLN
4vCtfR9Q+QDiidZNPLHU1iK9oCMuxVBVLSSHPPXVS3Lb51I1L5b+2e1y2f2Ox9/9
E6vQUDxt5LO0iogNljn6CXNtPKx0FFdPUxqMauUk+dqtuGH5TVr7UzVKEWd14rsw
cgv3M9ERIZXW3tozCYSKsgA8OabHznigNd7zTpVMiz2zelynXMxqcxns2sktX54d
fmdIi1sKmDMGfK2kujmsU3S/xyHpHWCgCA4uK/L3mcbJksQgTb1//8A6ZCeEeyfR
5Ybl73NFNJLx8vIdi0WASf1Fur0mzvd0t78VwNzzcIw3vCiRrWqA+EThSbCah4UT
zjHJYIS9y8K+XG6xcxpF2/bX8ibA9TQsme3mesQqIGrM9bvpa5EirwbjYOS8DrE/
TH/sKl5EtDFb43TWvX83rHgmfs/Apg0RzJf39yarITH/JTKglQXOClPAMS4oI7+k
lbNj8ZGylmHyVLgzRXtul714PVDqXthaEeux+71PEGvmNcrea5QeSnXyL9Ur4aY1
w9CJhiVlhVsVzEQdK8QcPGHrEfhtVTpf89vzcAdH5G4HxGx3IHE=
=sdBQ
-----END PGP SIGNATURE-----

--1HuzLmPZrG5RH6bG--
