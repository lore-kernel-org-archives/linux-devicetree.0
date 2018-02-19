Return-Path: <SRS0=5STX=FN=gmail.com=thierry.reding@kernel.org>
Date: Mon, 19 Feb 2018 15:47:12 +0100
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V7 5/7] ata: ahci_tegra: disable devslp for t124
Message-ID: <20180219144712.GH11455@ulmo>
References: <1518456406-21564-1-git-send-email-pchandru@nvidia.com>
 <1518456406-21564-6-git-send-email-pchandru@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Rn7IEEq3VEzCw+ji"
Content-Disposition: inline
In-Reply-To: <1518456406-21564-6-git-send-email-pchandru@nvidia.com>
To: Preetham Chandru Ramchandra <pchandru@nvidia.com>
Cc: tj@kernel.org, cyndis@kapsi.fi, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, preetham260@gmail.com, linux-tegra@vger.kernel.org, linux-ide@vger.kernel.org, vbyravarasu@nvidia.com, pkunapuli@nvidia.com
List-ID: <devicetree@vger.kernel.org>


--Rn7IEEq3VEzCw+ji
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 12, 2018 at 10:56:44PM +0530, Preetham Chandru Ramchandra wrote:
> From: Preetham Ramchandra <pchandru@nvidia.com>
>=20
> t124 does not support devslp and it should be
> disabled.

Please spell out t124 as Tegra124 in the subject and the commit message.

>=20
> Signed-off-by: Preetham Chandru R <pchandru@nvidia.com>
> ---
>  drivers/ata/ahci_tegra.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>=20
> diff --git a/drivers/ata/ahci_tegra.c b/drivers/ata/ahci_tegra.c
> index 6aaf8a4571c8..62f2afb54789 100644
> --- a/drivers/ata/ahci_tegra.c
> +++ b/drivers/ata/ahci_tegra.c
> @@ -145,6 +145,10 @@
>  #define FUSE_SATA_CALIB					0x124
>  #define FUSE_SATA_CALIB_MASK				0x3
> =20
> +enum {
> +	NO_DEVSLP	=3D (1 << 0),
> +};
> +
>  struct sata_pad_calibration {
>  	u8 gen1_tx_amp;
>  	u8 gen1_tx_peak;
> @@ -166,12 +170,14 @@ struct tegra_ahci_ops {
>  struct tegra_ahci_soc {
>  	const char *const	*supply_names;
>  	u32			num_supplies;
> +	u32			quirks;
>  	struct tegra_ahci_ops	ops;
>  };

I'd prefer these to be simple booleans, which make the code easier to
read, in my opinion. This could be:

	bool supports_devslp;

> =20
>  struct tegra_ahci_priv {
>  	struct platform_device	   *pdev;
>  	void __iomem		   *sata_regs;
> +	void __iomem		   *sata_aux_regs;
>  	struct reset_control	   *sata_rst;
>  	struct reset_control	   *sata_oob_rst;
>  	struct reset_control	   *sata_cold_rst;
> @@ -181,6 +187,18 @@ struct tegra_ahci_priv {
>  	struct tegra_ahci_soc	   *soc_data;
>  };
> =20
> +static void tegra_ahci_handle_quirks(struct ahci_host_priv *hpriv)
> +{
> +	struct tegra_ahci_priv *tegra =3D hpriv->plat_data;
> +	u32 val;
> +
> +	if (tegra->sata_aux_regs && (tegra->soc_data->quirks & NO_DEVSLP)) {

And then this becomes:

	if (tegra->sata_aux_regs && !tegra->soc->supports_devslp)

> +		val =3D readl(tegra->sata_aux_regs + SATA_AUX_MISC_CNTL_1_0);
> +		val &=3D ~SATA_AUX_MISC_CNTL_1_0_SDS_SUPPORT;
> +		writel(val, tegra->sata_aux_regs + SATA_AUX_MISC_CNTL_1_0);
> +	}
> +}
> +
>  static int tegra124_ahci_init(struct ahci_host_priv *hpriv)
>  {
>  	struct tegra_ahci_priv *tegra =3D hpriv->plat_data;
> @@ -400,6 +418,7 @@ static int tegra_ahci_controller_init(struct ahci_hos=
t_priv *hpriv)
>  	val &=3D ~SATA_CONFIGURATION_0_CLK_OVERRIDE;
>  	writel(val, tegra->sata_regs + SATA_CONFIGURATION_0);
> =20
> +	tegra_ahci_handle_quirks(hpriv);
> =20
>  	/* Unmask SATA interrupts */
> =20
> @@ -441,6 +460,7 @@ static const char *const tegra124_supply_names[] =3D {
>  static const struct tegra_ahci_soc tegra124_ahci_soc_data =3D {
>  	.supply_names =3D tegra124_supply_names,
>  	.num_supplies =3D ARRAY_SIZE(tegra124_supply_names),
> +	.quirks =3D NO_DEVSLP,
>  	.ops =3D {
>  		.init =3D tegra124_ahci_init,
>  	},
> @@ -485,6 +505,15 @@ static int tegra_ahci_probe(struct platform_device *=
pdev)
>  	tegra->sata_regs =3D devm_ioremap_resource(&pdev->dev, res);
>  	if (IS_ERR(tegra->sata_regs))
>  		return PTR_ERR(tegra->sata_regs);
> +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 2);
> +	/*
> +	 * Aux register is optional.
> +	 */

"Aux register" -> "AUX registers". Also, I think it's more idiomatic to
place the comment above platform_get_resource() so that the assignment
and the check below are not separated.

Thierry

--Rn7IEEq3VEzCw+ji
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlqK428ACgkQ3SOs138+
s6Hgrw/+J2h4Sw7YKPPGrbefTfjY+J1d8+kA4NQZdMMFhXuKhrfp0wK1ZMsCYOA1
PK1ApKQXk/CiXN8NkRM4+84rk7b+6gCgeiCuxaYs74Kqkf/a3dHQaspEZD0jXw14
rGZa4QGG5B9eIgUAg+uO8EMACZdsZEp5kw/ULdJ5tQ3EwBzLmwslpZ0twguXeSsO
n3ISNjwfKZciuX5tfVQmvygRenhNwdKCww9ZkzdJW+0IH1hlNO3Wsg/4eKCQO8yu
83fXwB856/e0LqUnxrOmkS272uVgGz8wr6N63LUokoYV6xaG2x0K3DU9FXndrP9m
oTY5S0s5rnB4DFwjWK6U84M2EvrXyBW05UiYxhRHNtZPPulp4T/TrHLPzIrOs972
JmzRhgCZ7aQpR9AX1Zv2A5kaNZmYq4LZNJPBldFCaaP8hNWv3TBcnA4D8maYhOpG
NQgTDJbZ3vZq2njU8z/qQVrH3/LtgC4K0UhsOrSbZKxTupcTxux7DgxQj0ucp4RT
JCqbeJJfbSkQwMcgkH93aKhvUeGiipmSi23KZ/adYUHH4PJjn9FtR1oM67roHJzP
H02k0qz5Em2FnV/oT4tRc+U4jXdtO0TZYYI8cw5opS/qmw9ANetOxzlU7kBqRvIn
XIv+NJ81VXiPJIJPyG7iqV0d3I+PBghdE3dQIJh1mlThtUp28vA=
=AR90
-----END PGP SIGNATURE-----

--Rn7IEEq3VEzCw+ji--
