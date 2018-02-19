Return-Path: <SRS0=5STX=FN=gmail.com=thierry.reding@kernel.org>
Date: Mon, 19 Feb 2018 15:41:25 +0100
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V7 3/7] ata: ahci_tegra: Update initialization sequence
Message-ID: <20180219144125.GF11455@ulmo>
References: <1518456406-21564-1-git-send-email-pchandru@nvidia.com>
 <1518456406-21564-4-git-send-email-pchandru@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Pgaa2uWPnPrfixyx"
Content-Disposition: inline
In-Reply-To: <1518456406-21564-4-git-send-email-pchandru@nvidia.com>
To: Preetham Chandru Ramchandra <pchandru@nvidia.com>
Cc: tj@kernel.org, cyndis@kapsi.fi, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, preetham260@gmail.com, linux-tegra@vger.kernel.org, linux-ide@vger.kernel.org, vbyravarasu@nvidia.com, pkunapuli@nvidia.com
List-ID: <devicetree@vger.kernel.org>


--Pgaa2uWPnPrfixyx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 12, 2018 at 10:56:42PM +0530, Preetham Chandru Ramchandra wrote:
> From: Preetham Ramchandra <pchandru@nvidia.com>
>=20
> Update the controller initialization sequence and move
> t124 specifics to tegra124_ahci_init.
>=20
> Signed-off-by: Preetham Chandru R <pchandru@nvidia.com>
> ---
> v7:
> * moveed tegra124_ahci_soc_data definition to be
>   just above the of_device_id table.
> ---
>  drivers/ata/ahci_tegra.c | 288 ++++++++++++++++++++++++++++++++++++-----=
------
>  1 file changed, 223 insertions(+), 65 deletions(-)
>=20
> diff --git a/drivers/ata/ahci_tegra.c b/drivers/ata/ahci_tegra.c
> index 3a62eb246d80..7ffe8a97447a 100644
> --- a/drivers/ata/ahci_tegra.c
> +++ b/drivers/ata/ahci_tegra.c
[...]
> @@ -99,6 +159,14 @@ static const struct sata_pad_calibration tegra124_pad=
_calibration[] =3D {
>  	{0x14, 0x0e, 0x1a, 0x0e},
>  };
> =20
> +struct tegra_ahci_ops {
> +	int (*init)(struct ahci_host_priv *hpriv);
> +};
> +
> +struct tegra_ahci_soc {
> +	struct tegra_ahci_ops	ops;
> +};
> +
>  struct tegra_ahci_priv {
>  	struct platform_device	   *pdev;
>  	void __iomem		   *sata_regs;
> @@ -108,8 +176,53 @@ struct tegra_ahci_priv {
>  	/* Needs special handling, cannot use ahci_platform */
>  	struct clk		   *sata_clk;
>  	struct regulator_bulk_data supplies[5];
> +	struct tegra_ahci_soc	   *soc_data;

This should be const. I also think the _data suffix is unnecessary.

> @@ -145,7 +258,6 @@ static int tegra_ahci_power_on(struct ahci_host_priv =
*hpriv)
> =20
>  disable_regulators:
>  	regulator_bulk_disable(ARRAY_SIZE(tegra->supplies), tegra->supplies);
> -
>  	return ret;
>  }

Unneeded whitespace change.

> @@ -179,78 +290,114 @@ static int tegra_ahci_controller_init(struct ahci_=
host_priv *hpriv)
>  		return ret;
>  	}
> =20
> +	/*
> +	 * Program the following SATA IPFS registers
> +	 * to allow SW accesses to SATA's MMIO register range.
> +	 */

You can also use the full width of a line for comments. No need to wrap
at arbitrary points.

> @@ -285,8 +432,17 @@ static const struct ata_port_info ahci_tegra_port_in=
fo =3D {
>  	.port_ops	=3D &ahci_tegra_port_ops,
>  };
> =20
> +static const struct tegra_ahci_soc tegra124_ahci_soc_data =3D {
> +	.ops =3D {
> +		.init =3D tegra124_ahci_init,
> +	},
> +};
> +

Again, I don't think there's a need for _data. Also, you've made this
const, so tegra->soc(_data) should also be const. One rule of thumb is
that if you have const in one place, then you need to make it const
everywhere.

>  static const struct of_device_id tegra_ahci_of_match[] =3D {
> -	{ .compatible =3D "nvidia,tegra124-ahci" },
> +	{
> +		.compatible =3D "nvidia,tegra124-ahci",
> +		.data =3D &tegra124_ahci_soc_data
> +	},
>  	{}
>  };

of_device_id.data is const as well, which is why this compiles properly.

>  MODULE_DEVICE_TABLE(of, tegra_ahci_of_match);
> @@ -313,6 +469,8 @@ static int tegra_ahci_probe(struct platform_device *p=
dev)
>  	hpriv->plat_data =3D tegra;
> =20
>  	tegra->pdev =3D pdev;
> +	tegra->soc_data =3D
> +	    (struct tegra_ahci_soc *)of_device_get_match_data(&pdev->dev);

And if you make tegra->soc(_data) const, then there's no need for this
cast, you can simply assign directly:

	tegra->soc =3D of_device_get_match_data(&pdev->dev);

void * will be automatically cast to any other pointer. The only reason
why you need the cast above is to avoid the compiler from warning about
the const qualifier being cast away.

Once const, always const.

Thierry

--Pgaa2uWPnPrfixyx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlqK4hIACgkQ3SOs138+
s6EqzxAAnNh14919gaa7Fg08r29Wf3udULhWUw9ZP2dlHlpB2mqqMzrWO7iGH6kU
96HrvlWC+aaMByJ1rvwRadT7wd7BQ4L8OCUwymFLbD/YBDMvPamyuPv/ckVDaHaZ
WCEjaAE3lWh2nyyexu4w/Rfe93mBjqK46myeyuqfAkB6rqtIIJbD/hxc3yZXdHZr
SF8rCNzmW1N5Mwq4yvVmAcXmqkE3kjSGKJ2Kt50CfFZ1VHYmsTQcfclOH3QDFvht
vQ/1iO2lYCQFEaYdFJSGu3gW9+kGkaqwt0gBxd8CRqZwWPhmizKcCOEkDWCBKrre
NZfJNCXhaDQZ9f1tyayX1fc7yC9h/iGcm+HGgEmGUaN2Pd4Ss/+Y2YK2NkMv1ajv
DEzA1gT1eo9FOGZkiI7mTLfixvjrsWyWV5CDsU1Ejd/bZDaFCg0o7FcmsLSfK0MP
iq/xEQobDKxHOb/0ErVnaKH4pR4DGthH0HkgwHR+9C9JwbMpCggYqtEZkE9aEte5
iglyHt5hhIupEtSenQ0K1id1q5B8FyxIipkgO6E8iFcRt3ZjdUqRG+TQTb+yjSQ8
V0ccmY5ENEMmenZvUbN9bgAcDbaiRj6cdkNX9VDhs/SRIsNa44CP0Jto4q2uruHA
OBO1hgSXeP8RCuA6z1MY2MhByNA6iLJYuIv5IuYQYFAE4ADoCm0=
=8RU2
-----END PGP SIGNATURE-----

--Pgaa2uWPnPrfixyx--
