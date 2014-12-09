From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH] gpio: sn54hc595: new driver for GPIO shift registers
 chipsets
Date: Tue, 9 Dec 2014 10:12:02 +0100
Message-ID: <20141209091202.GS8739@lukather>
References: <1418048833-27658-1-git-send-email-zajec5@gmail.com>
 <CAMuHMdWf_Cw7DTqhut6Mcic1FmcJjHdXWuXkNZM2z0Zx9wjCxw@mail.gmail.com>
 <CACna6rwRR7FpS97Znyk3ewVW58dn5yYTj8OjCstsuzzX8Prg5Q@mail.gmail.com>
 <2176453.HD1opzG9Wg@wuerfel>
 <CACna6rydKTDO+tBTdNNUDvQCXytE6VnEPjLSGs0yMee8Jz8FGA@mail.gmail.com>
 <CAMuHMdVvK1CTB1SKiNgD8zB9qorV=sQwRO66Dbm5zy=jhw82RA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BuGwuXnZwGGQ9GEc"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdVvK1CTB1SKiNgD8zB9qorV=sQwRO66Dbm5zy=jhw82RA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Gabor Juhos <juhosg@openwrt.org>, Miguel Gaio <miguel.gaio@efixo.com>
List-Id: devicetree@vger.kernel.org


--BuGwuXnZwGGQ9GEc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 08, 2014 at 05:59:11PM +0100, Geert Uytterhoeven wrote:
> > I think that implementing support for this extra SPI layer will
> > actually require more code/tricks than a separated driver.
>=20
> Yes, it will require more code, as spi-gpio is more generic than your sim=
ple
> implementation.  But the end result is more flexible and reusable.
>=20
> The only thing missing is the programmable OE and reset pins,
> which are assumed hardwired by the gpio-74x164 driver.
> These could be implemented using new gpio-oe and gpio-reset
> properties.

=46rom my (very) vague memories of it, OE was actually supported by
using it as spi-gpio's chip select.

So I'd say that only the gpio-reset should be implemented.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--BuGwuXnZwGGQ9GEc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUhrziAAoJEBx+YmzsjxAgQRkP/RiSkrSDY5lnk64+lE81AcGV
y9FD8+JZKpRZkOw+F4JNw7LILkO3Jx//210YiT22dVQwJ2GbCPxosbRcbtHkIjdH
8KwfcNiNby+uQr2/TUUaTeg47wl1ZY7mwLlefScESS8pQMBeHWfj2XvZHi1Kzitr
NIVDgIFDaa+48U0Gwip/kwtA5J0ifem2dKsIX2fpuVD6O0j83vynBtLYHdV0kXIY
F9oUGQZo1ogj+BzhDJiV6bq0mLwAufZhZHfajafcYp6zphItRnLzAtGGmw83VyZB
dgeU2X9jZd9yZTHAU9WDY7KOHuSqSwMfuuVMTbWV33WAe0fm8TzUpwcHG+ovQRrT
NFpzG/hrRfKE17KM9RSslvCcW+0aie957dBM7sE0cuT4d4WWdSJf/hLZg2cRadf9
pYf3o0aIEodaoFCIOuvYagYT+fOSkvbSKZKUNQY3zEAsQtoWZjWg933smAwe344Z
bXBMVjmdu1MT8vjZF4zP0BOUo119gZyABeCpVXe+fSgm4IHMVlKKqtOaNYuaAxXO
QEJvEdYztGA6TI/9aZY8H2UznBF4oGkt5joYabzGf9NmV4o05TadwopxJEZ2V+Yc
Js67PJoF7URIDcGHQ2sqxK7CctXIjArRGIxga+OjdzQJf5QKPXn2EbjHAe+xMfzY
TDBFPawg1c0F5zHAnLOd
=e17I
-----END PGP SIGNATURE-----

--BuGwuXnZwGGQ9GEc--
