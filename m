Return-Path: <SRS0=5STX=FN=gmail.com=thierry.reding@kernel.org>
Date: Mon, 19 Feb 2018 15:54:56 +0100
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V7 3/7] ata: ahci_tegra: Update initialization sequence
Message-ID: <20180219145456.GK11455@ulmo>
References: <1518456406-21564-1-git-send-email-pchandru@nvidia.com>
 <1518456406-21564-4-git-send-email-pchandru@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GvuyDaC2GNSBQusT"
Content-Disposition: inline
In-Reply-To: <1518456406-21564-4-git-send-email-pchandru@nvidia.com>
To: Preetham Chandru Ramchandra <pchandru@nvidia.com>
Cc: tj@kernel.org, cyndis@kapsi.fi, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, preetham260@gmail.com, linux-tegra@vger.kernel.org, linux-ide@vger.kernel.org, vbyravarasu@nvidia.com, pkunapuli@nvidia.com
List-ID: <devicetree@vger.kernel.org>


--GvuyDaC2GNSBQusT
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

Just noticed this: it's slightly more customary to make ops a pointer to
a function table, like so:

	struct tegra_ahci_soc {
		const struct tegra_ahci_ops *ops;
	};

and then have:

	static const struct tegra_ahci_ops tegra124_ahci_ops =3D {
		.init =3D tegra124_ahci_init,
	};

	static const struct tegra_ahci_soc tegra124_ahci_soc =3D {
		.ops =3D &tegra124_ahci_ops,
	};

That's not terribly useful in this case because the ops are not passed
around or shared between multiple instances, so there are no benefits.
Either way is fine here, I guess.

Thierry

--GvuyDaC2GNSBQusT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlqK5T8ACgkQ3SOs138+
s6FSsQ/+Iboid2SUlKgjjgT9Pv51h2VlmMmX55ef8X5p+OXcf5h2rF6yjTOF+mg5
zLHp3ZXO5p9rVYSQVgB57gwiVB0kQ1+qx9/HqWhx5Wx8x8FddNFtvcUEHeM+zw8N
ks1c4MGKssV36dc4P7PohG5IqX6CWNc8iJhLa1Jp48MY4Skzo81C7NyySipuSjuH
JOkBtSJb8PRN7d/7Xt7fU+vIFyNSftovrHzis8SP+iYyDrSLmxcx1rTP6jkcrvOs
6WV08FUnAqhw5T69kUz0ZiuoePAYHuDaiZ5eDkTGp7JACpU3fvKBocsSk1u96/km
gS896SPPRqUWNIrcbUIGaYBfgwYgN17UxmBWXAiiPVDFmuzFajjCHZIuFlZs9Cww
oV0rsLK3Sl4vCtepJ+WxAt0VWb/oEIvr5B1pUV7H+13+9rzgD2TubqyuBYlNuwk5
j7ni1owO0Z5Uq7yX1Ddf3YfHkfo7YrNuvhNARXyjcVH+n9qFQwc8+Xe5MqN5peuu
xXg+1Y/hSzyr8L/8JOpVhyk2Yu3V/dOrvehAtw1Q8bwH5SD1/KEPIDfZnf6RLSEs
4kFIyW+FWdkhUnfD4Lkh8e16TkdDwovjq9BLmwHey1K2gZ4zBHD1aK/oEEK1GbJZ
xGpnTIAEmR9Vf8MvOZe5HPIAYsjZvI4axtkM6XRYjncNs5UzTyo=
=yhwy
-----END PGP SIGNATURE-----

--GvuyDaC2GNSBQusT--
