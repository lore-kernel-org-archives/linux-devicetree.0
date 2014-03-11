From: Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/5] mfd: add bcm590xx pmu driver
Date: Tue, 11 Mar 2014 11:50:02 -0400
Message-ID: <20140311155002.GK25092@beef>
References: <1392765432-9111-1-git-send-email-mporter@linaro.org>
 <1392765432-9111-3-git-send-email-mporter@linaro.org>
 <20140219044605.GB2669@sirena.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="z4+8/lEcDcG5Ke9S"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140219044605.GB2669-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM Kernel List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--z4+8/lEcDcG5Ke9S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 19, 2014 at 01:46:05PM +0900, Mark Brown wrote:
> On Tue, Feb 18, 2014 at 06:17:09PM -0500, Matt Porter wrote:
>=20
> > +config MFD_BCM590XX
> > +	bool "Broadcom BCM590xx PMUs"
> > +	select MFD_CORE
> > +	select REGMAP_I2C
> > +	depends on I2C=3Dy
> > +	help
> > +	  Support for the BCM590xx PMUs from Broadcom
> > +
>=20
> Why does this need to be built in?

It doesn't. Just an oversight now fixed in v3.

-Matt

--z4+8/lEcDcG5Ke9S
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTHzCqAAoJEOfTILNwq7R4/AcP/0afa+s37SF5aJM7vlrFWTSu
K7YyO9bp7HXJqPi/VY/RosgwOW/y6gVV4Yv6+4i7sNX/3+xBwAnME1qIxZsvW5io
m7qe8omfmWzNKsiwRSIM6zM84DLCyLtjsPtUH0PUi41U12AsnuBdTXzoEtxgG+ib
+RD+Y5tYebifCurjgxR5wrnMZJvoS+SS2h/9hOzc+AJAKbKtDNPoN2ejw8j/MM1A
QcwF2IhVFXbkZir2EEeU/YGca6AKhDt2I5S8UsWU9bUc0HJTRfHQqXP656wjjVLh
Uy9fTd/QMLE0/Ih8ugq8GEpRGAcw3sYxz+APnlFwwsbWBrxj6PyysQB8aZxLEAl1
OAakIjkg/t2uYptS/KrpcriWzzTctsyo2VMYJ9ijtJb+uxSqrk7hU1EvKrf7/nlN
Db/GmEfor9/diuLfWJy8mni3b5JdZ/wfHUEuG3+wIi9+kqf6Gu4YWnCm33vDOuUO
mfmvkJ/Scf/am4hxw9AvBI32la9ttciMmI4QFoPcYeIJlmTMdz9EWtHG4wAEDxxA
tTaGAdjKeOs88BIQl6zGUjQkknbvBJy5i/8xTuJ/vVomkyKdjh9MZk2UEgGBUf4L
0R0fkt71Afibq7ylFGG5A0bXBW74FJGTQVfi3RnvmuQ8AOUPACPBkw6gyoFX7A0q
Tz/yN9f8FowoLUiQkDRM
=n+KR
-----END PGP SIGNATURE-----

--z4+8/lEcDcG5Ke9S--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
