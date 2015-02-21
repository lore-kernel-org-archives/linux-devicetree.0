From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] mfd: arizona: Move useful defines into a dt-binding
 include
Date: Sat, 21 Feb 2015 18:23:08 +0900
Message-ID: <20150221092308.GC6236@finisterre.sirena.org.uk>
References: <1424257419-28000-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xo44VMWPx7vlQ2+2"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1424257419-28000-1-git-send-email-ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kWeLe5EKmSxzQ@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, sameo-VuQAYsv1563kn/h4/h/YSQ@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--xo44VMWPx7vlQ2+2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 18, 2015 at 11:03:39AM +0000, Charles Keepax wrote:

> --- a/include/linux/mfd/arizona/pdata.h
> +++ b/include/linux/mfd/arizona/pdata.h
> @@ -7,61 +7,17 @@
>   * it under the terms of the GNU General Public License version 2 as
>   * published by the Free Software Foundation.
>   */
> +#include <dt-bindings/mfd/arizona.h>
> =20
>  #ifndef _ARIZONA_PDATA_H
>  #define _ARIZONA_PDATA_H

It's a bit odd to have the include outside the guards, is there any
great reason for doing so?

--xo44VMWPx7vlQ2+2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJU6E57AAoJECTWi3JdVIfQRd0H/0TbequL2UmzCGdkzXzYdkhn
J5UGuhxnwyPm+ABdx98An/SJKZA5M0p1MnZE1ANe9epwboGb0GZYoDG2BUDIwEnS
lLh+B2R7BiOVSaee7sfH2kK6uZWhy0l2vt5Y9S1b2MjZKd1IeCuaX1zTLgbLNIcR
5pFB35z2PgAcVu8qNkjN4VUvs30XAGeCOcxw4U1ObPXiOea8qP0ivl8jEX/6dIek
Oqz/V+R47QyLfmvbCyjodKPKW1pihDLfdNr96Fh+vEZLOpoQ/uEQBjdFYYqgVXfV
Ugw/Ku8gn2ShOm8V7PpUE83g/7WX0RqBT345mObrdV6V0rGnRG+CBt2YSvT8GQ4=
=Y9fs
-----END PGP SIGNATURE-----

--xo44VMWPx7vlQ2+2--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
