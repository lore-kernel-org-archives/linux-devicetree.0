From: Mark Brown <broonie-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/4] regulator/axp20x: use axp2xx consolidated header
Date: Tue, 9 Sep 2014 12:25:16 +0100
Message-ID: <20140909112516.GR2601@sirena.org.uk>
References: <1410215046-31751-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1410215046-31751-4-git-send-email-jacob.jun.pan@linux.intel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="l2C7pJE7HE4aLL3l"
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1410215046-31751-4-git-send-email-jacob.jun.pan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacob Pan <jacob.jun.pan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: IIO <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DEVICE TREE <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Srinivas Pandruvada <srinivas.pandruvada-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Aaron Lu <aaron.lu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Alan Cox <alan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Jean Delvare <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Fugang Duan <B38611-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Zubair Lutfullah <zubair.lutfullah-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Johannes Thumshirn <johannes.thumshirn-csrFAY9JiS4@public.gmane.org>, Philippe Reynes <tremyfr-Qt13gs6zZMY@public.gmane.org>, Angelo Compagnucci <angelo.compagnucci-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>Doug Anderson <d>
List-Id: devicetree@vger.kernel.org


--l2C7pJE7HE4aLL3l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 08, 2014 at 03:24:05PM -0700, Jacob Pan wrote:
> AXP20x driver has been extended to support axp288 variant. Header file
> and common data structures has also been renamed to suit the new
> scope of devices supported.
>=20
> This patch makes use of the renamed header and structure.

> -#include <linux/mfd/axp20x.h>
> +#include <linux/mfd/axp2xx.h>

Acked-by: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

but is it really worth the effort of renaming everything?  That's going
to cause problems for things like the stable workflow.

--l2C7pJE7HE4aLL3l
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUDuObAAoJECTWi3JdVIfQ+p8H/iGfPM7c+ObHEgBC5s9ogh3t
bkogCkWlDwMlDjGYF8k7272clZenUvvvMZdiYpkYO9PvqipyjPKMBzb9vWgfQ4+s
lWao77aeZUzAleAAMJi0wiC6qmbqNkFozbpbugdzy7DPzPY7ip3L0lAStg/yvcQr
itdCReJPCQMYv+iHqsFRkmW43QoWk6zsX8fdaZQYyLt2mHYNlx2hWDPZubtyU3r0
pDZhc6zh3K1tcWX0ynLHXYWwUnpEBt71ecyGigTAy/lTyH8fZmMqyADMFCz8rLEB
0Vw/vSd3UMPRrkOaGWEx1v7Lq+4PzY3qymr19QWGvGvA8SLBW+CG34le1Ohzmmo=
=Q61h
-----END PGP SIGNATURE-----

--l2C7pJE7HE4aLL3l--
