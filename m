From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 0/3] fdtdump: Make output prettier
Date: Wed, 14 Jun 2017 23:08:31 +0800
Message-ID: <20170614150831.GG2614@umbus>
References: <1497452030-15588-1-git-send-email-pantelis.antoniou@konsulko.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="doKZ0ri6bHmN2Q5y"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1497452030-15588-1-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--doKZ0ri6bHmN2Q5y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 14, 2017 at 05:53:47PM +0300, Pantelis Antoniou wrote:
> fdtdump output can be very hard to read;
>=20
> This patch makes sure that escaped characters are correctly detected
> as strings and that output respects a given column width.

I really wish people would stop trying to use fdtdump as something
it's not.  It's a trivial debug tool, nothing more.  Options for
pretty don't belong here.  If you want nicer dtb->dts output, use dtc
-I dtb -O dts.

>=20
> Pantelis Antoniou (3):
>   util: Add method for escape output handling
>   fdtdump: Prettify output of properties
>   manual: Document prettification fdtdump options
>=20
>  Documentation/manual.txt |   2 +
>  fdtdump.c                | 103 +++++++++++++++++++++++++++++++++++++++++=
+++---
>  util.c                   |  70 +++++++++++++++++++++++++++++++-
>  util.h                   |  35 ++++++++++++++++
>  4 files changed, 204 insertions(+), 6 deletions(-)
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--doKZ0ri6bHmN2Q5y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJZQVFvAAoJEGw4ysog2bOSh8wP+wUqyGGOWG9DJsCp6Ii3RSF2
WEFtX6R44whHxjsONJOAAzNaqpzy5zCHGfub30HfUGsUQr6z9MJ0ykAw5+w59Yft
w1KtWMVRfQaYdJfP+utO/I2ZfCukQJpE6NyFLhqHAPwks9FLgh+7EJL67g4+iOvF
u/I8wXKwoZfoOO4A17yn+zTvrdlVi2Qwfg/02/9mUtUcIKO59zUqfTi1IZ7fm8HB
IbVQMjEPgVzKRyw5EWR7GenJOkOTV427zu1LS9UwydMt4+fbrOAmCQzwJ0JmhaDA
AjMGN7HhpD48whbj/kTX+DSxoiOTQzpRsMs2E1XLbaeO8sMm+iZcBsQHoG2dpFSn
9QV+qnUvUfL7aJzAMnCfWdZ6SMv+Yw7Een6VcJj/JaYGfooRT9VtCiVOc1eF0GwU
HdPXt6P9W2M39b7SDPNHZ20jJBNVsi379jKFLs7HKzaCbz2mIGU8lIIy6t/CnpJI
VIInmbF8Ux9YcmEUuZDT6VpA8ZLeP5TraGEDDSporvpTscC9otlsIY7tCuWN44q7
G2vxvC4ew+2CQHLxKsJQ8j48N46UAH62+to/l/u0Zx+ERQiJgtGHdHC0w+q9SMrw
KxEyiUv3CdinNSyCju0SwGs/N4k7yp0s4qFa47lmhlzYo88b8rm3d+zPFH6vM6Q3
/f1A43132VpLRMhWs5E7
=2bJp
-----END PGP SIGNATURE-----

--doKZ0ri6bHmN2Q5y--
