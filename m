From: Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] iio:light:tsl2563: Add DT support
Date: Sat, 26 Oct 2013 01:09:07 +0200
Message-ID: <20131025230906.GB8657@earth.universe>
References: <1382565063-17083-1-git-send-email-sre@debian.org>
 <20131025191028.8C140C40422@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DKU6Jbt7q3WqK7+M"
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131025191028.8C140C40422-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Jonathan Cameron <jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Bill Pemberton <wfp5p-4Ng6DfrEGID2fBVCVOL8/A@public.gmane.org>, Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--DKU6Jbt7q3WqK7+M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Grant,

On Fri, Oct 25, 2013 at 08:10:28PM +0100, Grant Likely wrote:
> > +  - cover-comp-gain : integer used as multiplier for gain
> > +                      compensation (default =3D 1)
>=20
> Should be taos,cover-comp-gain

Has been updated to "amstaos,cover-comp-gain" in the latest
patches, see https://lkml.org/lkml/2013/10/25/59

> Otherwise looks fine to me.

Is this an acked-by?

> > +	else if (np)
> > +		of_property_read_u32_index(np, "cover-comp-gain", 0,
> > +							&chip->cover_comp_gain);
>=20
> of_property_read_u32() should be sufficient. You don't need the _index
> variant.

ah, I missed the function when skipping over linux/of.h.
I will sent another update.

-- Sebastian

--DKU6Jbt7q3WqK7+M
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.15 (GNU/Linux)

iQIcBAEBCAAGBQJSavoSAAoJENju1/PIO/qaPngP/iTc636yeeTXa3PxCxazE3Xm
qTdwUYjgbQlgbNZ0zebN2WZCE+zu95Txeb6Wd6tTS7Nc7FXu3RNFNyazxPxcqjmo
LAtXIRpD9OcDp2HWzxxIzAirRHejkj7KCS16GNlI/TZIbwlU+CPMz8FWFWF4jrJf
5ud0X32XuUFhNI5C9OQ6a9Y/H9e3jny/q6jaIrb0JDo6sVnY8ggfvTXpg212OXPS
a/EbcNw6grtwWFdJZBXDohDlzsBPMKhJVe1Ic1pNp4L1jrHTg1o5NqTf2QEIx61w
TF4u/a0TNSONVi6oOJys5g//u+ETpfvbY70BYc812J4CCcAdUyWivzjc7UWXptpQ
lc+LjI2wglcGr3vulbhxpP2+AbN0Tgmytj1le63SEhG54Nb3gjvBUCFB7ju7j56k
MCmVCZyiLDrFb8lzXr/Sqx/IO3lVBdNTBI/Zu/wLJ7AT0fZXYafuDAkpkHBcFbXs
IoHNi8wY9HDLblltxLbkUuJrPXygmFQBVGvuSRPl87ubK4Ct6Z88YLf6BJqby+kX
b//QprsTk+G3TSjnMLT3Z46cHPGjmO59n5nmVWC38OllugqrGTnZf57rHiBQhdZY
QDUsj7TyW4FpEjfhAl9cdM8pNCQdSdpzWeI72ErBRPgc87IUX34ZaW+LrFwwypro
2jXDswbaTkBOHO+oWrP0
=joN1
-----END PGP SIGNATURE-----

--DKU6Jbt7q3WqK7+M--
