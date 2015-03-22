From: NeilBrown <neilb@suse.de>
Subject: Re: [PATCH 2/3] TTY: add support for tty_slave devices.
Date: Sun, 22 Mar 2015 14:32:52 +1100
Message-ID: <20150322143252.2896377d@notabene.brown>
References: <20150318055437.21025.13990.stgit@notabene.brown>
	<20150318055831.21025.85317.stgit@notabene.brown>
	<1426669895.2649.7.camel@tiscali.nl>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/jXnKlSuXQdnvz.zYJsAsfxC"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1426669895.2649.7.camel@tiscali.nl>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Bolle <pebolle@tiscali.nl>
Cc: NeilBrown <neil@brown.name>, Mark Rutland <mark.rutland@arm.com>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Peter Hurley <peter@hurleysoftware.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sebastian Reichel <sre@kernel.org>, Pavel Machek <pavel@ucw.cz>, Grant Likely <grant.likely@linaro.org>, Jiri Slaby <jslaby@suse.cz>, GTA04 owners <gta04-owner@goldelico.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

--Sig_/jXnKlSuXQdnvz.zYJsAsfxC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 18 Mar 2015 10:11:35 +0100 Paul Bolle <pebolle@tiscali.nl> wrote:

> Just two nits to look into once you get to fix up all the smaller
> issues.

Thanks.  I've fixed both those nits.

NeilBrown


>=20
> NeilBrown schreef op wo 18-03-2015 om 16:58 [+1100]:
> > --- /dev/null
> > +++ b/drivers/tty/slave/Kconfig
> > @@ -0,0 +1,7 @@
> > +menuconfig TTY_SLAVE
> > +	tristate "TTY slave devices"
> > +	depends on OF
> > +	help
> > +	  Devices which attach via a uart, but need extra
> > +	  driver support for power management etc.
> > +
>=20
> This blank line makes "git am" whine: "new blank line at EOF".
>=20
> > --- /dev/null
> > +++ b/drivers/tty/slave/tty_slave_core.c
>=20
> [...]
>=20
> This file doesn't have a MODULE_LICENSE() macro. So I think that, if
> this driver is built as a module and loaded, kernel/module.c will set
> its license to "unspecified" and taint the kernel.
>=20
>=20
> Paul Bolle
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/


--Sig_/jXnKlSuXQdnvz.zYJsAsfxC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIVAwUBVQ435Tnsnt1WYoG5AQLf+A//SpnA7X69kCJQa6JfSZ2jF/A2I3Q8abXz
O8Nqg72cdwF2iNxs9l2LqSEF6kYlKJj5/PpVCktneaWoazGUXptXLPXvMGmqLWTK
zT4VIOHyeb/ClZtJWFwBZNnp8MOMR08If3Yjz+GH9FJzRbbVvhMdGm6LbIjhR+0B
Qbw+lI/Y9AC6EL9xLhzZwc4XkuPyNnDxhEXWnpF4A5mT5H5tdZIejWB+w7DkbkNk
I6UgcqCUYl7tuYzyrjlURwT9EMZttJwhALPg6Vs5CPPGJPQkuog4MJGG9nFtnP+C
XVjBLEcWU0BUab5hE0JK7DO5Y/DuHqlo7mtyy/rk9rjpsG/9N/tMDBGk3XWn9y0X
Ymr1Hc7jzMzuQJWiJM/MNIw8RAzCVUj31wMc7Tb/JGX82aYbPZHzsRjGhQ6aiIOz
MOJq/O5cJHJGDr6CAgHdrYUyItvTkxY3IdfM7vp7jHIFhhjac4Qjkgn4m3nQktso
gt5nbu6wtVdfn5RXpyH+Sk43uNZvzFF02WBbBe8JnEAtq4GJqUX9TfizmY4aDshf
5LYRwQL2cLPSilK1xst0ORL/xN1KUtrAhDLczNFoc0pDYSjISx41WEhb1ViRzjqY
nBCuOhAWYU1BW+5bAm28XFVOmk48/fpR7rFtws03R4xGBFwZ6gkvSiDE8+UeUgnx
K3Tpj6Zd2d8=
=ugxe
-----END PGP SIGNATURE-----

--Sig_/jXnKlSuXQdnvz.zYJsAsfxC--
