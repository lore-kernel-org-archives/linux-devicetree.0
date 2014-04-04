From: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH V2 02/19] mmc: mmci: Convert to devm functions
Date: Fri, 04 Apr 2014 12:40:46 +0200
Message-ID: <533E8C2E.9040400@monstr.eu>
References: <1396279100-2920-1-git-send-email-ulf.hansson@linaro.org> <1396279100-2920-3-git-send-email-ulf.hansson@linaro.org>
Reply-To: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="KErni5qCl215deKVVBOucTW93fOpQCN0G"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1396279100-2920-3-git-send-email-ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--KErni5qCl215deKVVBOucTW93fOpQCN0G
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 03/31/2014 05:18 PM, Ulf Hansson wrote:
> Converting to devm functions to simplify error handling in ->probe() an=
d
> to cleanup ->remove().
>=20
> Signed-off-by: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  drivers/mmc/host/mmci.c |   51 ++++++++++++++++++---------------------=
--------
>  1 file changed, 19 insertions(+), 32 deletions(-)
>=20
> diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
> index b0b81ac..d6f20ba 100644
> --- a/drivers/mmc/host/mmci.c
> +++ b/drivers/mmc/host/mmci.c
> @@ -13,6 +13,7 @@
>  #include <linux/init.h>
>  #include <linux/ioport.h>
>  #include <linux/device.h>
> +#include <linux/io.h>
>  #include <linux/interrupt.h>
>  #include <linux/kernel.h>
>  #include <linux/slab.h>
> @@ -1456,15 +1457,13 @@ static int mmci_probe(struct amba_device *dev,
>  	if (np)
>  		mmci_dt_populate_generic_pdata(np, plat);
> =20
> -	ret =3D amba_request_regions(dev, DRIVER_NAME);
> -	if (ret)
> -		goto out;
> +	if (!devm_request_mem_region(&dev->dev, dev->res.start,
> +				resource_size(&dev->res), DRIVER_NAME))
> +		return -ENOMEM;

here. Look below.

> =20
>  	mmc =3D mmc_alloc_host(sizeof(struct mmci_host), &dev->dev);
> -	if (!mmc) {
> -		ret =3D -ENOMEM;
> -		goto rel_regions;
> -	}
> +	if (!mmc)
> +		return -ENOMEM;
> =20
>  	host =3D mmc_priv(mmc);
>  	host->mmc =3D mmc;
> @@ -1500,8 +1499,10 @@ static int mmci_probe(struct amba_device *dev,
>  		dev_dbg(mmc_dev(mmc), "eventual mclk rate: %u Hz\n",
>  			host->mclk);
>  	}
> +
>  	host->phybase =3D dev->res.start;
> -	host->base =3D ioremap(dev->res.start, resource_size(&dev->res));
> +	host->base =3D devm_ioremap(&dev->dev, host->phybase,
> +				resource_size(&dev->res));

Isn't it better to use devm_ioremap_resource directly?
You will get correct error return values too.

Thanks,
Michal


--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Microblaze cpu - http://www.monstr.eu/fdt/
Maintainer of Linux kernel - Xilinx Zynq ARM architecture
Microblaze U-BOOT custodian and responsible for u-boot arm zynq platform



--KErni5qCl215deKVVBOucTW93fOpQCN0G
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iEYEARECAAYFAlM+jC4ACgkQykllyylKDCEPVACeJ3oIPEkI8kHHgC5+oeWNfVy6
wYoAoJhYY9rD2SOA48v4NT+HHNFR4rQZ
=wVE5
-----END PGP SIGNATURE-----

--KErni5qCl215deKVVBOucTW93fOpQCN0G--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
