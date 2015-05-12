From: NeilBrown <neilb-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH 3/4] TTY: add support for uart_slave devices.
Date: Wed, 13 May 2015 09:35:36 +1000
Message-ID: <20150513093536.7a1d4a13@notabene.brown>
References: <20150511013540.5709.93626.stgit@notabene.brown>
	<20150511015614.5709.16746.stgit@notabene.brown>
	<1431419461.2398.132.camel@x220>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/3KVj_YVTUp/k9H5jwBFe03A"; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431419461.2398.132.camel@x220>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>
Cc: NeilBrown <neil-+NVA1uvv1dVBDLzU/O5InQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, One Thousand Gnomes <gnomes-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org>, Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jiri Slaby <jslaby-AlSwsSmVLrQ@public.gmane.org>, GTA04 owners <gta04-owner-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--Sig_/3KVj_YVTUp/k9H5jwBFe03A
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 12 May 2015 10:31:01 +0200 Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org> wrote:

> Just a nit: a license mismatch.
>=20
> On Mon, 2015-05-11 at 11:56 +1000, NeilBrown wrote:
> > --- /dev/null
> > +++ b/drivers/tty/serial/slave/uart_slave_core.c
>=20
> > + *    This program is free software; you can redistribute it and/or mo=
dify
> > + *   it under the terms of the GNU General Public License as published=
 by
> > + *   the Free Software Foundation; either version 2 of the License, or
> > + *   (at your option) any later version.
> > + *
> > + *    This program is distributed in the hope that it will be useful,
> > + *   but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + *   GNU General Public License for more details.
>=20
> This states the license is GPL v2 or later.
>=20
> > +MODULE_LICENSE("GPL v2");
>=20
> And, according to include/linux/module.h, this states the license is
> just GPL v2. So I think either the comment at the top of this file or
> the license ident used in the MODULE_LICENSE() macro needs to change.
>=20
> Thanks,
>=20
>=20
> Paul Bolle
>=20

Thanks.  I've modified the comment to be explicit that only 'version 2' is
appropriate.

NeilBrown

--Sig_/3KVj_YVTUp/k9H5jwBFe03A
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIVAwUBVVKOSDnsnt1WYoG5AQKo/A/9GXaSmk4CY2t/fpX6aAlXdHHk7pmIb7gj
2QLS1IBzQVS6+h57TNpqntGmLgLiKRwePGR3JP2vNhpaCmh6APSxWEWnrvO2uJKy
j4zj5dSVEZNI4Pk25JA/8jKC075ZZZ6JqawTrp1OtdsciQm79471zzTZr+SMWU6a
5wd7L6L+jAwZXhn20T2x6lrNePhxr6/D2aFlH19Q92qfPHnd14VR/qeuJYp6VfXl
eOQFcuUDmw0U3GKDmoXwKgI27JTc4gVwMT8YjAtDLTDUoDUEPjV2FhOtfMUZAnmX
8gnUiioKHL3zvOZ5Zl2/MQ+l1SZjOrqHcMdKucuUG12NdvC+m3t0WaAYRMPXEbJi
utSsklUzQm2Xk0PehXjLwACxWe9ZLOnu37NGqukDgXIDpsSmoGy8tqxsdiaStmPG
XC7xO4sVpavnlPVs+0+E+GyFvTDs5OnjO4iMgdLJD5Ue723HCyqfK/vX/Lc0QBUG
SmxLWM4kxiXu55XryB3WUNv7ufbAGj+PBjHRn4zf0qnHb8pLEz84Eupl8he/3dzJ
Voo4QeG8wXaxLqRcMWxNI9ShuwupcU6tiUrl3IelzlIGHVVqLEK1oXsS5KAlEEIP
7yvJLAZ7aVxPelWNEEn9+Ki7zy/Z5D1QcKVPY7eCsm2O8kfagez8hE7bFU8dx3Jg
nqnawEezr9w=
=u8Ae
-----END PGP SIGNATURE-----

--Sig_/3KVj_YVTUp/k9H5jwBFe03A--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
