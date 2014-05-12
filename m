From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCHv5 07/20] usb: host: xhci-plat: add clock support
Date: Mon, 12 May 2014 12:37:02 -0500
Message-ID: <20140512173702.GG31882@saruman.home>
References: <1399832288-19899-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1399832288-19899-8-git-send-email-thomas.petazzoni@free-electrons.com>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="64j1qyTOoGvYcHb1"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1399832288-19899-8-git-send-email-thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--64j1qyTOoGvYcHb1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 11, 2014 at 08:17:55PM +0200, Thomas Petazzoni wrote:
> From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>=20
> Some platforms (such as the Armada 38x ones) can gate the clock of
> their USB controller. This patch adds the support for one clock in
> xhci-plat, by enabling it during probe and disabling it on remove.
>=20
> To achieve this, it adds a 'struct clk *' member in xhci_hcd. While
> only used for now in xhci-plat, it might be used by other drivers in
> the future. Moreover, the xhci_hcd structure already holds other
> members such as msix_count and msix_entries, which are MSI-X specific,
> and therefore only used by xhci-pci.
>=20
> Signed-off-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

FWIW

Acked-by: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>

> ---
>  drivers/usb/host/xhci-plat.c | 24 +++++++++++++++++++++++-
>  drivers/usb/host/xhci.h      |  2 ++
>  2 files changed, 25 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
> index f5351af..8108e58 100644
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
> @@ -91,6 +92,7 @@ static int xhci_plat_probe(struct platform_device *pdev)
>  	struct xhci_hcd		*xhci;
>  	struct resource         *res;
>  	struct usb_hcd		*hcd;
> +	struct clk              *clk;
>  	int			ret;
>  	int			irq;
> =20
> @@ -137,14 +139,27 @@ static int xhci_plat_probe(struct platform_device *=
pdev)
>  		goto release_mem_region;
>  	}
> =20
> +	/*
> +	 * Not all platforms have a clk so it is not an error if the
> +	 * clock does not exists.
> +	 */
> +	clk =3D devm_clk_get(&pdev->dev, NULL);
> +	if (!IS_ERR(clk)) {
> +		ret =3D clk_prepare_enable(clk);
> +		if (ret)
> +			goto unmap_registers;
> +	}
> +
>  	ret =3D usb_add_hcd(hcd, irq, IRQF_SHARED);
>  	if (ret)
> -		goto unmap_registers;
> +		goto disable_clk;
> +
>  	device_wakeup_enable(hcd->self.controller);
> =20
>  	/* USB 2.0 roothub is stored in the platform_device now. */
>  	hcd =3D platform_get_drvdata(pdev);
>  	xhci =3D hcd_to_xhci(hcd);
> +	xhci->clk =3D clk;
>  	xhci->shared_hcd =3D usb_create_shared_hcd(driver, &pdev->dev,
>  			dev_name(&pdev->dev), hcd);
>  	if (!xhci->shared_hcd) {
> @@ -173,6 +188,10 @@ put_usb3_hcd:
>  dealloc_usb2_hcd:
>  	usb_remove_hcd(hcd);
> =20
> +disable_clk:
> +	if (!IS_ERR(clk))
> +		clk_disable_unprepare(clk);
> +
>  unmap_registers:
>  	iounmap(hcd->regs);
> =20
> @@ -189,11 +208,14 @@ static int xhci_plat_remove(struct platform_device =
*dev)
>  {
>  	struct usb_hcd	*hcd =3D platform_get_drvdata(dev);
>  	struct xhci_hcd	*xhci =3D hcd_to_xhci(hcd);
> +	struct clk *clk =3D xhci->clk;
> =20
>  	usb_remove_hcd(xhci->shared_hcd);
>  	usb_put_hcd(xhci->shared_hcd);
> =20
>  	usb_remove_hcd(hcd);
> +	if (!IS_ERR(clk))
> +		clk_disable_unprepare(clk);
>  	iounmap(hcd->regs);
>  	release_mem_region(hcd->rsrc_start, hcd->rsrc_len);
>  	usb_put_hcd(hcd);
> diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
> index d280e92..003dc09 100644
> --- a/drivers/usb/host/xhci.h
> +++ b/drivers/usb/host/xhci.h
> @@ -1478,6 +1478,8 @@ struct xhci_hcd {
>  	/* msi-x vectors */
>  	int		msix_count;
>  	struct msix_entry	*msix_entries;
> +	/* optional clock */
> +	struct clk		*clk;
>  	/* data structures */
>  	struct xhci_device_context_array *dcbaa;
>  	struct xhci_ring	*cmd_ring;
> --=20
> 1.9.2
>=20

--=20
balbi

--64j1qyTOoGvYcHb1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTcQa9AAoJEIaOsuA1yqREk2EP/03Brf3G0p/bQAOOhjKhHuMM
/DdI9TYDdBEPKPlQa1rc2QOLWTHPt6RIC5a14pOFtzhC4XvXZ2CkOcdaKrXJszLX
Fc1ixSBhA9I/Z8OmnmBznsruuNdWOftSflQsmDRPd+Im7SY3f7H+kBbEbTc/WmSE
lwoPfvZ/v+TEoHtCN5rt8APGN5Ujtbmsl7Z5WApROmfIXh98NVmbB5PVfPusrezk
souWWfgBq8trc0eNr9BfGBoHVRz9Gn+A8boOyOudlnGaTIOmwBiut4BmUvl0j7wa
rplxhLB8Fw8SeC+FAUDgvFkKi1y2kLjrJc8L8ASzBZKDsJ0Pv8hk/OFChzJEOcdV
HicbaS7PYMfQxd8gz3/WGl8/kKEWhMQlkwQpeF4F26ULSUyMZf/AX2PXIDc+J2iy
ILvn2nrnRL935ZHAXtrFECov2aTdOHv67zqlk74Y1qauin0y2+E1ew4/6ol7l86G
a+HBudEts2fHBZvG/sOx6X0wF9bdAvrdJm1FqsFDdDpqFBI6wji0KUaGxlwurIQy
IsxHFhbxxcFq6z6s12BfmRDy9K1QxCZNZIG5cVx55NmGn+cnGBbc5L8Mh+WTmOZ6
s5lHlxknaLkFyaxPMGBDiglD+lJPVuoEBvugReVGegF0oG+O1at9VSkBqW7WqrsP
D5y+O9lMg+pnTJS3SIOn
=tCOV
-----END PGP SIGNATURE-----

--64j1qyTOoGvYcHb1--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
