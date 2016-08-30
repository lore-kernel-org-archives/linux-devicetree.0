From: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH] microblaze: move xlnx,compound to default bus matching
Date: Tue, 30 Aug 2016 14:10:44 +0200
Message-ID: <916117df-bedf-fde0-ef96-b1a9a77a4c62@monstr.eu>
References: <20160829234558.2903-1-robh@kernel.org>
Reply-To: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="DjaSFKSjGIQxFMF3mcOJ6giARtvJt6eNT"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160829234558.2903-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--DjaSFKSjGIQxFMF3mcOJ6giARtvJt6eNT
Content-Type: multipart/mixed; boundary="xJ4mKiuUuv9H2aFkVi8c2oDpDR11j3DvI";
 protected-headers="v1"
From: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Reply-To: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org,
 Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Message-ID: <916117df-bedf-fde0-ef96-b1a9a77a4c62-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH] microblaze: move xlnx,compound to default bus matching
References: <20160829234558.2903-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
In-Reply-To: <20160829234558.2903-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

--xJ4mKiuUuv9H2aFkVi8c2oDpDR11j3DvI
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On 30.8.2016 01:45, Rob Herring wrote:
> Microblaze bus probing is partially broken because "xlnx,compound" is
> missing from the default bus probe. Add it to the default and remove fr=
om
> the Microblaze arch code.

xlnx,compound is not used for ages. I see see dts files for MB in the
tree but really it is just an very old example.


>=20
> Fixes: 44a7185c2ae6 ("of/platform: Add common method to populate defaul=
t bus")
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
> Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> ---
>  arch/microblaze/kernel/platform.c | 9 ---------
>  drivers/of/platform.c             | 1 +
>  2 files changed, 1 insertion(+), 9 deletions(-)
>=20
> diff --git a/arch/microblaze/kernel/platform.c b/arch/microblaze/kernel=
/platform.c
> index b9529ca..9d520bf 100644
> --- a/arch/microblaze/kernel/platform.c
> +++ b/arch/microblaze/kernel/platform.c
> @@ -11,19 +11,10 @@
>   */
> =20
>  #include <linux/init.h>
> -#include <linux/of_platform.h>
> -#include <asm/prom.h>
>  #include <asm/setup.h>
> =20
> -static struct of_device_id xilinx_of_bus_ids[] __initdata =3D {
> -	{ .compatible =3D "simple-bus", },
> -	{ .compatible =3D "xlnx,compound", },
> -	{}
> -};
> -
>  static int __init microblaze_device_probe(void)
>  {
> -	of_platform_bus_probe(NULL, xilinx_of_bus_ids, NULL);
>  	of_platform_reset_gpio_probe();
>  	return 0;
>  }
> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> index f39ccd5..f0314c4 100644
> --- a/drivers/of/platform.c
> +++ b/drivers/of/platform.c
> @@ -32,6 +32,7 @@ const struct of_device_id of_default_bus_match_table[=
] =3D {
>  #ifdef CONFIG_ARM_AMBA
>  	{ .compatible =3D "arm,amba-bus", },
>  #endif /* CONFIG_ARM_AMBA */
> +	{ .compatible =3D "xlnx,compound", },
>  	{} /* Empty terminated list */
>  };
> =20
>=20

Acked-by: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>

Thanks,
Michal

--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP SoCs



--xJ4mKiuUuv9H2aFkVi8c2oDpDR11j3DvI--

--DjaSFKSjGIQxFMF3mcOJ6giARtvJt6eNT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlfFd8QACgkQykllyylKDCH54gCdE5nYbDbr4nYE8qqWhVsGumW7
Ql0AoJrKEiJ3/U57nTMPT+n0a4CoaxYp
=QhfA
-----END PGP SIGNATURE-----

--DjaSFKSjGIQxFMF3mcOJ6giARtvJt6eNT--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
