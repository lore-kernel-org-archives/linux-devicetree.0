From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v2 01/18] usb: host: xhci-plat: Sort the headers in
 alphabetic order
Date: Fri, 25 Apr 2014 09:55:39 -0500
Message-ID: <20140425145539.GB29632@saruman.home>
References: <1398434836-18908-1-git-send-email-gregory.clement@free-electrons.com>
 <1398434836-18908-2-git-send-email-gregory.clement@free-electrons.com>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="R3G7APHDIzY6R/pk"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1398434836-18908-2-git-send-email-gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--R3G7APHDIzY6R/pk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2014 at 04:06:59PM +0200, Gregory CLEMENT wrote:
> Sorting the headers in alphabetic order will help to reduce the conflict
> when adding new headers later.
>=20
> Signed-off-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---

Acked-by: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>

>  drivers/usb/host/xhci-plat.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
> index 151901ce1ba9..f5351af4b2c5 100644
> --- a/drivers/usb/host/xhci-plat.c
> +++ b/drivers/usb/host/xhci-plat.c
> @@ -11,11 +11,11 @@
>   * version 2 as published by the Free Software Foundation.
>   */
> =20
> -#include <linux/platform_device.h>
> +#include <linux/dma-mapping.h>
>  #include <linux/module.h>
> -#include <linux/slab.h>
>  #include <linux/of.h>
> -#include <linux/dma-mapping.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> =20
>  #include "xhci.h"
> =20
> --=20
> 1.8.1.2
>=20

--=20
balbi

--R3G7APHDIzY6R/pk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTWndrAAoJEIaOsuA1yqRE5jYP+gOv2Y9+XWWEULsDGw+xdL8s
1CXfrDkA2EMtCI1QFImA4M/v5Y/TpU8XqLsC14utltV/t5d9X24qNaveuS/IHWSp
aD7foenGz+3vIOdLTBMb7qYVnY53L+A7hrZMTTdKpl7olpidKfhgBe2IvQbhKOuG
veEm8yRgwmLaUsBvtAwhq1oIfDNz6CmY45giXQnT1j+leu1xA/JvotuMI8Gdp5Yd
H3QrPHe55FiaSZmAL2bnCd3ZRwN5Ad0za6cOWNXgKGmAo+pxlnOvESx6nvkJdgxt
wCIv5X15lDDXDy/PJFnZAOo7JmWx/fPXInDxgN6gqzSgBke15X1Suonw2rA6s4N/
Y8U+F4ASebPtLonO/XX64emqvsP6matd6MevMclNR0PZRcCDceZ19eo/alDcklZi
KL57kbsiqomHVScTXx2/phiuIlTUZsmEgQtqygYnw1IZiJMPqs+uizGx4/J7GFD5
aHz0XUzCKJCrZ+CHYOt2qixZK6AU0KkeIdb5Cs9RRFbjHeY8GXmwNm5Yp90OluYF
6PDkWBB+GXNiKtJskNaOPDiXwPO+0Iki6ha2y+m2mgMTrgD3hPdW3Kk9imnnl3La
42vrJ9QudnQ6CVYKGsXXEpI6T3vbG5zWDKp3wh0rvRH8Uwg8pFIOxWT+nMU8QzTd
NKp192yZoFdwYGULEsRx
=AAm3
-----END PGP SIGNATURE-----

--R3G7APHDIzY6R/pk--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
