Return-Path: <SRS0=lIuD=SR=gmail.com=thierry.reding@kernel.org>
Date: Mon, 15 Apr 2019 13:29:22 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 06/30] PCI: tegra: Program UPHY electrical settings for
 Tegra210
Message-ID: <20190415112922.GG29254@ulmo>
References: <20190411170355.6882-1-mmaddireddy@nvidia.com>
 <20190411170355.6882-7-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="L1c6L/cjZjI9d0Eq"
Content-Disposition: inline
In-Reply-To: <20190411170355.6882-7-mmaddireddy@nvidia.com>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--L1c6L/cjZjI9d0Eq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2019 at 10:33:31PM +0530, Manikanta Maddireddy wrote:
> UPHY electrical programming guidelines are documented in Tegra210 TRM.
> Program these electrical settings for proper eye diagram in Gen1 and Gen2
> link speeds.
>=20
> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> ---
>  drivers/pci/controller/pci-tegra.c | 100 +++++++++++++++++++++++++++++
>  1 file changed, 100 insertions(+)
>=20
> diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/=
pci-tegra.c
> index 9ff1a0e2797f..a377245d254d 100644
> --- a/drivers/pci/controller/pci-tegra.c
> +++ b/drivers/pci/controller/pci-tegra.c
> @@ -177,6 +177,32 @@
> =20
>  #define AFI_PEXBIAS_CTRL_0		0x168
> =20
> +#define RP_ECTL_2_R1	0x00000e84

> +#define  RP_ECTL_2_R1_RX_CTLE_1C_MASK		0xffff
> +
> +#define RP_ECTL_4_R1	0x00000e8c
> +#define  RP_ECTL_4_R1_RX_CDR_CTRL_1C_MASK	(0xffff << 16)
> +#define  RP_ECTL_4_R1_RX_CDR_CTRL_1C_SHIFT	16
> +
> +#define RP_ECTL_5_R1	0x00000e90
> +#define  RP_ECTL_5_R1_RX_EQ_CTRL_L_1C_MASK	0xffffffff
> +
> +#define RP_ECTL_6_R1	0x00000e94
> +#define  RP_ECTL_6_R1_RX_EQ_CTRL_H_1C_MASK	0xffffffff
> +
> +#define RP_ECTL_2_R2	0x00000ea4
> +#define  RP_ECTL_2_R2_RX_CTLE_1C_MASK	0xffff
> +
> +#define RP_ECTL_4_R2	0x00000eac
> +#define  RP_ECTL_4_R2_RX_CDR_CTRL_1C_MASK	(0xffff << 16)
> +#define  RP_ECTL_4_R2_RX_CDR_CTRL_1C_SHIFT	16
> +
> +#define RP_ECTL_5_R2	0x00000eb0
> +#define  RP_ECTL_5_R2_RX_EQ_CTRL_L_1C_MASK	0xffffffff
> +
> +#define RP_ECTL_6_R2	0x00000eb4
> +#define  RP_ECTL_6_R2_RX_EQ_CTRL_H_1C_MASK	0xffffffff
> +
>  #define RP_VEND_XP	0x00000f00
>  #define  RP_VEND_XP_DL_UP	(1 << 30)
> =20
> @@ -265,6 +291,19 @@ struct tegra_pcie_soc {
>  	bool has_gen2;
>  	bool force_pca_enable;
>  	bool program_uphy;
> +	struct {
> +		struct {
> +			u32 rp_ectl_2_r1;
> +			u32 rp_ectl_4_r1;
> +			u32 rp_ectl_5_r1;
> +			u32 rp_ectl_6_r1;
> +			u32 rp_ectl_2_r2;
> +			u32 rp_ectl_4_r2;
> +			u32 rp_ectl_5_r2;
> +			u32 rp_ectl_6_r2;
> +		} regs;
> +		bool enable;
> +	} ectl;
>  };
> =20
>  static inline struct tegra_msi *to_tegra_msi(struct msi_controller *chip)
> @@ -491,6 +530,52 @@ static void tegra_pcie_enable_rp_features(struct teg=
ra_pcie_port *port)
>  	writel(value, port->base + RP_VEND_CTL1);
>  }
> =20
> +static void tegra_pcie_program_ectl_settings(struct tegra_pcie_port *por=
t)
> +{
> +	const struct tegra_pcie_soc *soc =3D port->pcie->soc;
> +	u32 val;

u32 value for consistency.

> +
> +	val =3D readl(port->base + RP_ECTL_2_R1);
> +	val &=3D ~RP_ECTL_2_R1_RX_CTLE_1C_MASK;
> +	val |=3D soc->ectl.regs.rp_ectl_2_r1;
> +	writel(val, port->base + RP_ECTL_2_R1);
> +
> +	val =3D readl(port->base + RP_ECTL_4_R1);
> +	val &=3D ~RP_ECTL_4_R1_RX_CDR_CTRL_1C_MASK;
> +	val |=3D soc->ectl.regs.rp_ectl_4_r1 << RP_ECTL_4_R1_RX_CDR_CTRL_1C_SHI=
FT;
> +	writel(val, port->base + RP_ECTL_4_R1);
> +
> +	val =3D readl(port->base + RP_ECTL_5_R1);
> +	val &=3D ~RP_ECTL_5_R1_RX_EQ_CTRL_L_1C_MASK;
> +	val |=3D soc->ectl.regs.rp_ectl_5_r1;
> +	writel(val, port->base + RP_ECTL_5_R1);
> +
> +	val =3D readl(port->base + RP_ECTL_6_R1);
> +	val &=3D ~RP_ECTL_6_R1_RX_EQ_CTRL_H_1C_MASK;
> +	val |=3D soc->ectl.regs.rp_ectl_6_r1;
> +	writel(val, port->base + RP_ECTL_6_R1);
> +
> +	val =3D readl(port->base + RP_ECTL_2_R2);
> +	val &=3D ~RP_ECTL_2_R2_RX_CTLE_1C_MASK;
> +	val |=3D soc->ectl.regs.rp_ectl_2_r2;
> +	writel(val, port->base + RP_ECTL_2_R2);
> +
> +	val =3D readl(port->base + RP_ECTL_4_R2);
> +	val &=3D ~RP_ECTL_4_R2_RX_CDR_CTRL_1C_MASK;
> +	val |=3D soc->ectl.regs.rp_ectl_4_r2 << RP_ECTL_4_R2_RX_CDR_CTRL_1C_SHI=
FT;
> +	writel(val, port->base + RP_ECTL_4_R2);
> +
> +	val =3D readl(port->base + RP_ECTL_5_R2);
> +	val &=3D ~RP_ECTL_5_R2_RX_EQ_CTRL_L_1C_MASK;
> +	val |=3D soc->ectl.regs.rp_ectl_5_r2;
> +	writel(val, port->base + RP_ECTL_5_R2);
> +
> +	val =3D readl(port->base + RP_ECTL_6_R2);
> +	val &=3D ~RP_ECTL_6_R2_RX_EQ_CTRL_H_1C_MASK;
> +	val |=3D soc->ectl.regs.rp_ectl_6_r2;
> +	writel(val, port->base + RP_ECTL_6_R2);

There are nice macros that help with this nowadays. See the FIELD_*
macros in include/linux/bitfield.h. However, the above is consistent
with the rest of the driver, so feel free to leave this as-is.

> +}
> +
>  static void tegra_pcie_port_enable(struct tegra_pcie_port *port)
>  {
>  	unsigned long ctrl =3D tegra_pcie_port_get_pex_ctrl(port);
> @@ -517,6 +602,8 @@ static void tegra_pcie_port_enable(struct tegra_pcie_=
port *port)
>  	}
> =20
>  	tegra_pcie_enable_rp_features(port);
> +	if (soc->ectl.enable)

An empty line above would help declutter this.

> +		tegra_pcie_program_ectl_settings(port);
>  }
> =20
>  static void tegra_pcie_port_disable(struct tegra_pcie_port *port)
> @@ -2229,6 +2316,7 @@ static const struct tegra_pcie_soc tegra20_pcie =3D=
 {
>  	.has_gen2 =3D false,
>  	.force_pca_enable =3D false,
>  	.program_uphy =3D true,
> +	.ectl.enable =3D false,
>  };
> =20
>  static const struct tegra_pcie_port_soc tegra30_pcie_ports[] =3D {
> @@ -2252,6 +2340,7 @@ static const struct tegra_pcie_soc tegra30_pcie =3D=
 {
>  	.has_gen2 =3D false,
>  	.force_pca_enable =3D false,
>  	.program_uphy =3D true,
> +	.ectl.enable =3D false,
>  };
> =20
>  static const struct tegra_pcie_soc tegra124_pcie =3D {
> @@ -2268,6 +2357,7 @@ static const struct tegra_pcie_soc tegra124_pcie =
=3D {
>  	.has_gen2 =3D true,
>  	.force_pca_enable =3D false,
>  	.program_uphy =3D true,
> +	.ectl.enable =3D false,
>  };
> =20
>  static const struct tegra_pcie_soc tegra210_pcie =3D {
> @@ -2284,6 +2374,15 @@ static const struct tegra_pcie_soc tegra210_pcie =
=3D {
>  	.has_gen2 =3D true,
>  	.force_pca_enable =3D true,
>  	.program_uphy =3D true,
> +	.ectl.regs.rp_ectl_2_r1 =3D 0x0000000f,
> +	.ectl.regs.rp_ectl_4_r1 =3D 0x00000067,
> +	.ectl.regs.rp_ectl_5_r1 =3D 0x55010000,
> +	.ectl.regs.rp_ectl_6_r1 =3D 0x00000001,
> +	.ectl.regs.rp_ectl_2_r2 =3D 0x0000008f,
> +	.ectl.regs.rp_ectl_4_r2 =3D 0x000000c7,
> +	.ectl.regs.rp_ectl_5_r2 =3D 0x55010000,
> +	.ectl.regs.rp_ectl_6_r2 =3D 0x00000001,
> +	.ectl.enable =3D true,

This should be:

	.ectl =3D {
		.regs =3D {
			...
		}
		.enable =3D true;
	},

Do these parameters never differ between board layouts? Are they really
fixed per SoC generation?

Thierry

--L1c6L/cjZjI9d0Eq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAly0axIACgkQ3SOs138+
s6HDLBAAlU1XaxebX8R+2KJb/GR3Khd178wpoHIhuocIFUUxWhyJBlKoApjkQGHR
DBkj46Qz0q9b1VS1WU3hftwH2i5fSuOXnENFe6u4zOZo0qmOgZ73/5+69kk5qzXG
/kkua/7uNv7B0sI/gVlf7iw34C7FNonCgNq3jXyRyxC4mW8rWwJzcRaEI6B15fUU
9E6FEOA52wWG1HSm4df80d+kMjamUyLCC9n8skd/BkmO1zjKNBh1ndaTrqBHv92w
cXXQg+T/b+WGqgTGM+zq99pIqRcgUV5dUo5wsojmNEpDWgE48G/0Mi9PF8ItOUej
vllcK0jysBmhS6GhYa3jlb7njNKXwkuek1NecJbVTi+UMgYo9Vmnl73rNvJZG5uj
ESiVK8vm7TU7QOlz4ysGwd32M32mnv9TAxcK8ofn+d1J/4qs/ntpUee3Pjw4gGl8
ISKmk1Fl6wyRAuxqPnbnJeA5lU2GIhiA4AEMzxeroDti5u1A2Im8Ccvwbcb29aAR
7XvQKv+tyXJM0iFWBVqGOk2oq/1dEUgNMawTAP/dxcTVhTmsOPL8vrtac2KxbAz/
oDUXBEROEfLG/E6zmh4XWYUzxdz6yITh1LOE9mcMreKJCRK8w64WN32HspWy8ski
aBQqsjniUokblS39BOdhIYkxb+3NyMbWUtIq63+YB3TRAySmBr0=
=34jE
-----END PGP SIGNATURE-----

--L1c6L/cjZjI9d0Eq--
