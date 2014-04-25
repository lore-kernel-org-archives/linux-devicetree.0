From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v2 02/18] usb: host: xhci-plat: Add clocks support
Date: Fri, 25 Apr 2014 10:02:19 -0500
Message-ID: <20140425150218.GC29632@saruman.home>
References: <1398434836-18908-1-git-send-email-gregory.clement@free-electrons.com>
 <1398434836-18908-3-git-send-email-gregory.clement@free-electrons.com>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JWEK1jqKZ6MHAcjA"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1398434836-18908-3-git-send-email-gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--JWEK1jqKZ6MHAcjA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Apr 25, 2014 at 04:07:00PM +0200, Gregory CLEMENT wrote:
> Some platform (such as the Armada 38x ones) can gate the clock of
> their USB controller. This patch add the support for the clock, by
> enabling them during probe and disabling them on remove.
>=20
> As not all platforms have clock support then enabling and disabling
> the clocks have been placed in separate functions. Then if the clocks
> are not supported we still can use the same calls, and there is no
>=20
> Signed-off-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  drivers/usb/host/xhci-plat.c | 52 ++++++++++++++++++++++++++++++++++++++=
++++--
>  1 file changed, 50 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
> index f5351af4b2c5..bb5d563f729c 100644
> --- a/drivers/usb/host/xhci-plat.c
> +++ b/drivers/usb/host/xhci-plat.c
> @@ -11,6 +11,7 @@
>   * version 2 as published by the Free Software Foundation.
>   */
> =20
> +#include <linux/clk.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> @@ -85,6 +86,42 @@ static const struct hc_driver xhci_plat_xhci_driver =
=3D {
>  	.bus_resume =3D		xhci_bus_resume,
>  };
> =20
> +#if defined(CONFIG_HAVE_CLK)

I don't think this ifdef is necessary, clk api provides stubs.

> +static int try_enable_clk(struct platform_device *pdev)

prepend this with xhci_plat_ as all other definitions here.

> +{
> +	struct clk *clk =3D devm_clk_get(&pdev->dev, NULL);

you need to create a private xhci_plat structure and save a clock
pointer there.

> +
> +	/* Not all platforms have a clk so it is not an error if the clock
> +	   does not exists. */

comment style is wrong.

> +	if (!IS_ERR(clk))

even though some don't like it, the clk API is safe against NULL
pointers, one trick you could use is to set the clk pointer to NULL when
you fail to get it, then you'll have a single place where you check for
IS_ERR().

> +		if (clk_prepare_enable(clk))
> +			return  -ENODEV;
> +	return 0;

these three lines could be rewritten as:

	return clk_prepare_enable(clk);

> +}
> +
> +static int try_disable_clk(struct platform_device *pdev)
> +{
> +	struct clk *clk =3D devm_clk_get(&pdev->dev, NULL);
> +
> +	/* Not all platforms have a clk so it is not an error if the clock
> +	   does not exists. */
> +	if (!IS_ERR(clk))
> +		clk_disable_unprepare(clk);

similar comments to previous function.

>  static int xhci_plat_probe(struct platform_device *pdev)
>  {
>  	const struct hc_driver	*driver;
> @@ -107,6 +144,10 @@ static int xhci_plat_probe(struct platform_device *p=
dev)
>  	if (!res)
>  		return -ENODEV;
> =20
> +	ret =3D try_enable_clk(pdev);
> +	if (ret)
> +		return ret;
> +
>  	/* Initialize dma_mask and coherent_dma_mask to 32-bits */
>  	ret =3D dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32));
>  	if (ret)
> @@ -117,8 +158,10 @@ static int xhci_plat_probe(struct platform_device *p=
dev)
>  		dma_set_mask(&pdev->dev, DMA_BIT_MASK(32));
> =20
>  	hcd =3D usb_create_hcd(driver, &pdev->dev, dev_name(&pdev->dev));
> -	if (!hcd)
> -		return -ENOMEM;
> +	if (!hcd) {
> +		ret =3D -ENOMEM;
> +		goto disable_clk;
> +	}
> =20
>  	hcd->rsrc_start =3D res->start;
>  	hcd->rsrc_len =3D resource_size(res);
> @@ -182,6 +225,9 @@ release_mem_region:
>  put_hcd:
>  	usb_put_hcd(hcd);
> =20
> +disable_clk:
> +	try_disable_clk(pdev);
> +
>  	return ret;
>  }
> =20
> @@ -199,6 +245,8 @@ static int xhci_plat_remove(struct platform_device *d=
ev)
>  	usb_put_hcd(hcd);
>  	kfree(xhci);
> =20
> +	try_disable_clk(dev);

you never call clk_put(). what gives ?

--=20
balbi

--JWEK1jqKZ6MHAcjA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTWnj6AAoJEIaOsuA1yqRE4x0QAJN26xw3ki4U8m8lZPvdfuaj
DzReoLh3XbAOo3iXg8t5hJtI1ZidsG1XMGgEtVAw72XZdOhwbvfAucSKtSCD1Zyl
rLYA5G4UKzsSxENpkl/mlJxKNAtYJNPNKU+dFeUkjk3GMZM+ZUQzlyKRGzDbI69q
I2+7CqvDOwAAZ9nPPczoA9e8qkSmF6Jz42Xay7CS2EzD0pc73PusT7mBiyVAJfS8
rxDLtHUVqqIk1SYDq8Sov/9XowntPKck4Cz+ZL98F/mVZMOBamfUegAz9MgQqcKM
hvFGhbuVNXNEBL5mYEB0QWa6S4s9IOXxJ2KO1SfS5G8IPzHdLRE57ezBZLJakt5A
0DSNMxEtY3hgRtNGJVDcTBHbsyEevlf1QxmAyCDX9mJlY7wfBXvanmYTwlXpwYoe
8iHky/tsRJLajsQK4BiZ4dD91QkDiZOml4EBMlwELpOb3DoN3Upnagjad4HCqrFR
fEkVAFic3PDtPMR3IN41xT8L98aXa3wFYNcHS8QQ9Zwyvj/5BREZdo0tzoCzAzAj
CgfjFf5K1PA18dH/cl8hQf++v5eJiVLnGhOCqdVdHF2fj2/BI7v9ny+IZY+N7lcG
Wjo/XqwwJzI7P+J/LGQIwSTACMWbvm0V5mvjGIKvW0GObE45vtvbd1tp7WVG6Z3n
sZA6y5NlWY0G7pcY0X52
=+Gig
-----END PGP SIGNATURE-----

--JWEK1jqKZ6MHAcjA--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
