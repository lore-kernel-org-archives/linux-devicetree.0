From: Markus Pargmann <mpa@pengutronix.de>
Subject: Re: [PATCH 2/4] tools: gpio: Add necessary include paths
Date: Wed, 24 Feb 2016 07:39:33 +0100
Message-ID: <1663266.QvtJ23oI59@adelgunde>
References: <1456214089-13954-1-git-send-email-mpa@pengutronix.de> <1456214089-13954-2-git-send-email-mpa@pengutronix.de> <CACRpkdYxDeKDLN8bsA0q3F_q-WiSDd1JTEsw8YYwUXSecMmsoA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2251985.t5KeR8lPiv"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYxDeKDLN8bsA0q3F_q-WiSDd1JTEsw8YYwUXSecMmsoA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Johan Hovold <johan@kernel.org>, Michael Welling <mwelling@ieee.org>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--nextPart2251985.t5KeR8lPiv
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Tuesday, February 23, 2016 02:26:09 PM Linus Walleij wrote:
> On Tue, Feb 23, 2016 at 8:54 AM, Markus Pargmann <mpa@pengutronix.de>=
 wrote:
>=20
> > Add include paths to the Makefile so that linux/gpio.h can be found=
 even
> > on systems without this header.
> >
> > Signed-off-by: Markus Pargmann <mpa@pengutronix.de>
> (...)
> > -CFLAGS +=3D -Wall -g -D_GNU_SOURCE
> > +CFLAGS +=3D -Wall -g -D_GNU_SOURCE -I ../include -I ../../include/=
uapi
>=20
> This is probably not how userspace compilation is supposed
> to work. The way I understand it, userspace programs from tools/*
> should be compiled like this:
>=20
> make headers_install ARCH=3Dfoo INSTALL_HDR_PATH=3D<bar>
> cd tools/gpio
> make CFLAGS=3D"$CFLAGS -I<bar>"
>=20
> The reason being that UAPI files can differ after install depending
> on arch.

I see, thanks for explaining.

Best Regards,

Markus

=2D-=20
Pengutronix e.K.                           |                           =
  |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0  =
  |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-555=
5 |

--nextPart2251985.t5KeR8lPiv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWzVAqAAoJEEpcgKtcEGQQdK4P/RiFS6ojxUHZG6LEQDCWmqNB
FeNEzKHzfj5Z/qF4hh0CF4d5t68bhyqaStMDdSpFdMJSBdHawjQq0hlXH9R47bgJ
6mqyUmeCFATYieHCXsxiqZgttRMZu/GfJLyP3N8El/H82HDcbUtSiaDSKNYWEZoU
PSwWAV/rhojbTaRdXKX28emAYSo3yBUg4VSaOl/mU3YYJHERb9W3zKuv8R51iPhD
hFsanxXd4cMulz1nlH2z6EhnFzQnV9EJb+DCYkmImFRrPYSL2FJ9mXx+w9BORlzb
fZSIxHZrfCea5CYIrP0UY61VR9PBn9C3PL1Q2A/cmcWAfv9IdBMJfxbsoB1Wxz0q
cHVqFNUJBOS3oDNxr3XN5NXxLHRQmB6wNvs0QbKNfMVhX5wcbRiuHl1SgnQCH1bU
A2lpf7aPFudcXtPj8LZylfcEJ5gMkUW6yOLXEp8Plte+/QnEaYqJQvBEQYU6liwz
pgb411+/gO7O7wfmu9BnJs9NwVRMaxLXMGLZOd+Bq4UVtEXI/3YLEO5WG6lQSyZh
c3+5Bj6b4tDmrbKqKEMrA53y2n24LTWW8YgrZxcueqxDOMrgLNQb3SZsYeQqGT5X
FvsW5+EyIS7/oBzZO9ZMKwe5RoDMWS4uv/amstj5C3/N2JBiqG7DixwkJruO8dzy
rXTgFC+iUhRmDuyv4Zi6
=XR+i
-----END PGP SIGNATURE-----

--nextPart2251985.t5KeR8lPiv--

