From: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH] of/platform: Fix microblaze build failure
Date: Wed, 11 Jun 2014 03:24:26 +0200
Message-ID: <5397AFCA.8030906@monstr.eu>
References: <1402426754-7328-1-git-send-email-linux@roeck-us.net>
Reply-To: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="2HrTdjDTg60UKq4ECdDMmv3s1ekRQTvlm"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1402426754-7328-1-git-send-email-linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--2HrTdjDTg60UKq4ECdDMmv3s1ekRQTvlm
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 06/10/2014 08:59 PM, Guenter Roeck wrote:
> Commit bf5db2f (microblaze: Use generic device.h) removes the
> microblaze specific pdev_archdata and dma_mask.
>=20
> At the same time, commit 591c1ee (of: configure the platform
> device dma parameters) initializes the just removed field.
> This causes all microblaze builds to fail.
>=20
> Drop the unnecessary initialization.
>=20
> Cc: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
> ---
>  drivers/of/platform.c | 4 ----
>  1 file changed, 4 deletions(-)
>=20
> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> index 6c48d73..500436f 100644
> --- a/drivers/of/platform.c
> +++ b/drivers/of/platform.c
> @@ -166,10 +166,6 @@ static void of_dma_configure(struct platform_devic=
e *pdev)
>  	int ret;
>  	struct device *dev =3D &pdev->dev;
> =20
> -#if defined(CONFIG_MICROBLAZE)
> -	pdev->archdata.dma_mask =3D 0xffffffffUL;
> -#endif
> -
>  	/*
>  	 * Set default dma-mask to 32 bit. Drivers are expected to setup
>  	 * the correct supported dma_mask.
>=20

Acked-by: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>

Thanks,
Michal

--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Microblaze cpu - http://www.monstr.eu/fdt/
Maintainer of Linux kernel - Xilinx Zynq ARM architecture
Microblaze U-BOOT custodian and responsible for u-boot arm zynq platform



--2HrTdjDTg60UKq4ECdDMmv3s1ekRQTvlm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iEYEARECAAYFAlOXr8oACgkQykllyylKDCGqJACfZaFqBpVivmJoPHRylgQF+vda
wm8AnilL1Zm/vBguYBn/SCZA91HTFeiF
=rzd9
-----END PGP SIGNATURE-----

--2HrTdjDTg60UKq4ECdDMmv3s1ekRQTvlm--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
