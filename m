Return-Path: <SRS0=WWNl=FN=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-qt0-f194.google.com ([209.85.216.194]:44527 "EHLO
        mail-qt0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752853AbeBSOts (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 19 Feb 2018 09:49:48 -0500
Date: Mon, 19 Feb 2018 15:49:45 +0100
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V7 7/7] ata: ahci_tegra: Add AHCI support for Tegra210
Message-ID: <20180219144945.GJ11455@ulmo>
References: <1518456406-21564-1-git-send-email-pchandru@nvidia.com>
 <1518456406-21564-8-git-send-email-pchandru@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="W13SgbpmD6bhZUTM"
Content-Disposition: inline
In-Reply-To: <1518456406-21564-8-git-send-email-pchandru@nvidia.com>
Sender: devicetree-owner@vger.kernel.org
To: Preetham Chandru Ramchandra <pchandru@nvidia.com>
Cc: tj@kernel.org, cyndis@kapsi.fi, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, preetham260@gmail.com, linux-tegra@vger.kernel.org, linux-ide@vger.kernel.org, vbyravarasu@nvidia.com, pkunapuli@nvidia.com
List-ID: <devicetree@vger.kernel.org>


--W13SgbpmD6bhZUTM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 12, 2018 at 10:56:46PM +0530, Preetham Chandru Ramchandra wrote:
> From: Preetham Ramchandra <pchandru@nvidia.com>
>=20
> Add support for the AHCI-compliant Serial ATA host
> controller on the Tegra210 system-on-chip.
>=20
> Signed-off-by: Preetham Chandru R <pchandru@nvidia.com>
> ---
> v7:
> * Added commit message
> ---
>  drivers/ata/ahci_tegra.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/ata/ahci_tegra.c b/drivers/ata/ahci_tegra.c
> index ffad5c61e991..4524755b9b23 100644
> --- a/drivers/ata/ahci_tegra.c
> +++ b/drivers/ata/ahci_tegra.c
> @@ -466,11 +466,19 @@ static const struct tegra_ahci_soc tegra124_ahci_so=
c_data =3D {
>  	},
>  };
> =20
> +static const struct tegra_ahci_soc tegra210_ahci_soc_data =3D {
> +	.quirks =3D NO_DEVSLP,
> +};
> +
>  static const struct of_device_id tegra_ahci_of_match[] =3D {
>  	{
>  		.compatible =3D "nvidia,tegra124-ahci",
>  		.data =3D &tegra124_ahci_soc_data
>  	},
> +	{
> +		.compatible =3D "nvidia,tegra210-ahci",
> +		.data =3D &tegra210_ahci_soc_data
> +	},
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, tegra_ahci_of_match);
> @@ -585,5 +593,5 @@ static struct platform_driver tegra_ahci_driver =3D {
>  module_platform_driver(tegra_ahci_driver);
> =20
>  MODULE_AUTHOR("Mikko Perttunen <mperttunen@nvidia.com>");
> -MODULE_DESCRIPTION("Tegra124 AHCI SATA driver");
> +MODULE_DESCRIPTION("Tegra AHCI SATA driver");
>  MODULE_LICENSE("GPL v2");

I think you should also update the Kconfig file to clarify that this is
no longer Tegra124-only.

With that:

Acked-by: Thierry Reding <treding@nvidia.com>

--W13SgbpmD6bhZUTM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlqK5AkACgkQ3SOs138+
s6HH5g//UPryaM+yNpURIhhP+ViWNE6M/xkK4TL9PsVPWoxSxww4npUrPRkXRmpw
g3QSBxw5PeenqPa44k5qa/PkHhMHues7Vz4+KE24ZfhuovklmrFfYsnnGmBCGmUD
/LIMZ12Ayqc4/OSFHTKXv6vfEriRhAaXsuw/s8eEOObe36grKb3sg14eu5Ry3hps
WEt6PSmE6EhemxjJO1Ehajvfn5dHp9OshqSSEkrJ2vS4Ce8m4mF3sloQeZiDPp7g
ehLJ2AFzq4urCi+fGTZX01wevx7wpY+ovP/bXgmGZEuenAvcQqAiWA98j/vyh/L3
IhEvrdYXaUMzcRdV/5St2Y+Pg1SwYYSeyrie+G09ms6eMy6haSLWz4azzthl+/7Z
Ru4Gp11+Wao96G08N3gY9WcJGXyhsZlBMhrwlbFLoxA+LvGPEFCcJ3oh/8EEc7tB
GdpFMX6LMG65ISh/kMR163lCkCDK+odnUx/x3TY0H6CazrKTXTFvwoyBRFDgJCIq
0hsgviHuO7GdMh6/abW4z2ObCUJvTvD1Oj/ZsbkA9LegZjMZuqFeqq+1PuZlE7sE
Xzac9hpq5+BO7YUNJ9TBXCrgdDt+5/b5NopC50C7kq3coVZCjv9XWpzAnCfw65QR
ovhtTioz8gmTMJeYQ+xhs/kY7NN+6k3WQt0qpeg46IyF9P1erBA=
=fDa5
-----END PGP SIGNATURE-----

--W13SgbpmD6bhZUTM--
