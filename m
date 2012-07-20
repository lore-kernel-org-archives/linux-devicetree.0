From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 1/2 v3] USB: dwc3-exynos: Add support for device tree
Date: Fri, 20 Jul 2012 12:49:54 +0300
Message-ID: <20120720094953.GF24414@arwen.pp.htv.fi>
References: <1342418259-23802-1-git-send-email-gautam.vivek@samsung.com>
 <1342418259-23802-2-git-send-email-gautam.vivek@samsung.com>
Reply-To: balbi-l0cyMroinI0@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UKNXkkdQCYZ6W5l3"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1342418259-23802-2-git-send-email-gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, l.majewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, prashanth.g-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kmpark-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, joshi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, olofj-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sshtylyov-Igf4POYTYCDQT0dZR+AlfA@public.gmane.org, av.tikhomirov-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--UKNXkkdQCYZ6W5l3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jul 16, 2012 at 11:27:38AM +0530, Vivek Gautam wrote:
> This patch adds support to parse probe data for
> dwc3 driver for exynos using device tree
>=20
> Signed-off-by: Praveen Paneri <p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  drivers/usb/dwc3/dwc3-exynos.c |   22 ++++++++++++++++++++++
>  1 files changed, 22 insertions(+), 0 deletions(-)
>=20
> diff --git a/drivers/usb/dwc3/dwc3-exynos.c b/drivers/usb/dwc3/dwc3-exyno=
s.c
> index b8f0038..a293c69 100644
> --- a/drivers/usb/dwc3/dwc3-exynos.c
> +++ b/drivers/usb/dwc3/dwc3-exynos.c
> @@ -19,6 +19,7 @@
>  #include <linux/platform_data/dwc3-exynos.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/clk.h>
> +#include <linux/of.h>
> =20
>  #include "core.h"
> =20
> @@ -29,6 +30,8 @@ struct dwc3_exynos {
>  	struct clk		*clk;
>  };
> =20
> +static u64 dwc3_exynos_dma_mask =3D DMA_BIT_MASK(32);
> +
>  static int __devinit dwc3_exynos_probe(struct platform_device *pdev)
>  {
>  	struct dwc3_exynos_data	*pdata =3D pdev->dev.platform_data;
> @@ -45,6 +48,16 @@ static int __devinit dwc3_exynos_probe(struct platform=
_device *pdev)
>  		goto err0;
>  	}
> =20
> +	/*
> +	 * Right now device-tree probed devices don't get dma_mask set.
> +	 * Since shared usb code relies on it, set it here for now.
> +	 * Once we move to full device tree support this will vanish off.
> +	 */
> +	if (!pdev->dev.dma_mask)
> +		pdev->dev.dma_mask =3D &dwc3_exynos_dma_mask;
> +	if (!pdev->dev.coherent_dma_mask)
> +		pdev->dev.coherent_dma_mask =3D DMA_BIT_MASK(32);
> +
>  	platform_set_drvdata(pdev, exynos);
> =20
>  	devid =3D dwc3_get_device_id();
> @@ -134,11 +147,20 @@ static int __devexit dwc3_exynos_remove(struct plat=
form_device *pdev)
>  	return 0;
>  }
> =20
> +#ifdef CONFIG_OF
> +static const struct of_device_id exynos_xhci_match[] =3D {
> +	{ .compatible =3D "samsung,exynos-xhci" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, exynos_xhci_match);

this is not an xhci device. It contains one inside of it, but it's not
an xhci device.

--=20
balbi

--UKNXkkdQCYZ6W5l3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJQCSnBAAoJEIaOsuA1yqREoRUP/At/inO013H0bVrld9rE0pnv
/hqDtw2eHzawN+ozDV6xvEfWYwVIT0sXDv2ces0WoSyP79kKu84UeX2JNR23c6E6
QfONYP3YpG8W4oi3JhSxXBZVJY2AsIJcU2dETj9vT1CCLrjoz5dgC4Op+Lk9g/T7
cmtIqlyVbWaY5Uyt4umqw/Ic+8K6CglHXeCBYSz4RU/d/68A24iUFYF7xDWjE07F
zP0UCu2xC4Uo0PcT8Oo2py7tzmdWcw/p+v0E4wqoLAWoqhouZJCqvYlTv4SCP/AF
kOXgB/jtR4hw9irKJ4w6jiFCa4j2Npfo8wcEiUrlhlSOK0DTw5n+x80G2PM5sdw8
HVRxHc3q2vm6iusLBexKaO9J+gmfWkdLnbS7Hx6t24Kyy9OFwlmQISIQQwsc1gTy
UiEAYYceYmLvqUgtFgsgEi3LsnRY163IFrViyx8ulZubZRkAjEEgNUOp4bp+B+sZ
lTunSzDvnThMIIbLyTr9yk5R7fK8hyqvnO8Ru+oi/sET02KNDWqxNb3UsGbPNWcs
TkPz8tj/Kmyo2Z4qa3zD+KV/WeEMN5uma3uT0PwWiX4cDpv284EfVjms4WOuEb8v
r5T19nemSLlo+RJ34TLncvmTJkpyZfrJa+l8dtTAUYDIV86noxK2oUVLEytaeUdy
fqTtWyqH6pbLVPpV/gUQ
=zisS
-----END PGP SIGNATURE-----

--UKNXkkdQCYZ6W5l3--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
