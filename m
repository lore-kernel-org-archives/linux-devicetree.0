From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH] gpio: sn54hc595: new driver for GPIO shift registers
 chipsets
Date: Tue, 9 Dec 2014 10:09:41 +0100
Message-ID: <20141209090941.GR8739@lukather>
References: <1418048833-27658-1-git-send-email-zajec5@gmail.com>
 <2176453.HD1opzG9Wg@wuerfel>
 <CACna6rydKTDO+tBTdNNUDvQCXytE6VnEPjLSGs0yMee8Jz8FGA@mail.gmail.com>
 <101906283.ZCEfV1JaGs@wuerfel>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZaW/dtY/7oMe/vLp"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <101906283.ZCEfV1JaGs@wuerfel>
Sender: linux-gpio-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Gabor Juhos <juhosg@openwrt.org>, Miguel Gaio <miguel.gaio@efixo.com>
List-Id: devicetree@vger.kernel.org


--ZaW/dtY/7oMe/vLp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 08, 2014 at 05:56:56PM +0100, Arnd Bergmann wrote:
> On Monday 08 December 2014 17:31:45 Rafa=C5=82 Mi=C5=82ecki wrote:
> > On 8 December 2014 at 16:41, Arnd Bergmann <arnd@arndb.de> wrote:
> > > On Monday 08 December 2014 16:23:01 Rafa=C5=82 Mi=C5=82ecki wrote:
> > >> On 8 December 2014 at 16:03, Geert Uytterhoeven <geert@linux-m68k.or=
g> wrote:
> > >> >> gpio-74x164.c seems to be tight closely to the SPI. In my case it=
's
> > >> >> GPIO-controller '595.
> > >> >
> > >> > Right. gpio-74x164.c uses the SPI framework, so it will work with =
any SPI
> > >> > master controller, while your driver contains a very simple varian=
t (without any
> > >> > timing constraints) of spi-gpio.c, and is limited to connecting to=
 GPIO pins.
> > >> >
> > >> >> Do you have any other idea how we could handle this?
> > >> >
> > >> > Your driver does provide OE support, which gpio-74x164 doesn't sup=
port.
> > >> > Perhaps that can be added to gpio-74x164 instead?
> > >>
> > >> It's not the missing OE support in gpio-74x164 that worries me, but
> > >> the whole rest.
> > >>
> > >> I would need to modify gpio-74x164 to:
> > >> 1) Use another OF table with different entry
> > >> 2) Use different probe function that doesn't take spi_device paramet=
er
> > >> and doesn't do spi setup
> > >> 3) Extend struct gen_74x164_chip to include GPIOs
> > >> 4) Use totally different __gen_74x164_write_config
> > >
> > > I think the suggestion was to use the spi-gpio driver in combination
> > > with gpio-74x164.
> >=20
> > Oh, OK, I've obviously missed that.
> >=20
> > I don't know... I'm somehow not really convinced to that, because
> > AFAIK there isn't any SPI master device between GPIOs and 'HC595. I
> > don't know if pretending there is some extra hardware (just to use
> > another Linux driver/layer) is a good idea. This would:
> > 1) Not match hardware design
> > 2) Involve some extra code.
> >=20
> > I'm not even sure if this would work out-of-the box (without some
> > extra changes) at all. From early look at spi-gpio.c I can't see it
> > implementing everything I need for GPIO-connected 'HC595.
> > I think that implementing support for this extra SPI layer will
> > actually require more code/tricks than a separated driver.
>=20
> The purpose of the spi-gpio driver is to avoid having to write
> two drivers for every spi slave device if someone wants to drive
> it using bit-banged gpios.
>=20
> The existing users of the driver are in fact all using spi-gpio,
> see:
> arch/arm/boot/dts/armada-xp-lenovo-ix4-300d.dts
> arch/arm/boot/dts/imx28-cfa10049.dts

I'm the one who worked on the cfa10049, and yeah, it worked pretty
well at the time using spi-gpio.

We couldn't really do it any other way though, since we had another
SPI device tied to the same bus, so it really felt like this was the
right thing to do.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--ZaW/dtY/7oMe/vLp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUhrxVAAoJEBx+YmzsjxAg50YQAI3N3IFs8kJTLb0gf4uv0yxU
1S7oUq/dF+sONPGaJrjRXLVBJhaWVXwzJkgklo3fBW0+GV6tNOhb7uXJW4iqTtZD
tU3soZyV3Mel2mDbXPDRmttpxoc13Ane5skE9pum/EicYi4MnA5j6/+D0YI7rTSi
+/1AEJH6ZpV1kfuml5SCTvzvBd78yy40wIyazuQPcmvisnvR13jBmzavg/bH4QHy
uK9As2DAkoTcrfbso5qAXEoBac2ESBvkrjj0sXGaOlZbUXZODlH8Hc12d9t1B15g
uhTcROEDk261pK+QHra++iDDS4LqNBFp4nUSVmUkpokQ/oXqcv7w0v893dlPw9Ho
k5Ge/j+UN1qqrOVk9apz9VThR+/gyZmJvgwjwLJNpwBF0lzVnZOOIAsUh8Tzc1Jh
UPY+9g/Ju+N+g+LScD/RAWjmnTi8y69uEUiZlz77BBjaTyusJ2rugn9XQvvkh+BH
2ZqjDSgFY7Pa+LgbPxtbrsQ4L9AmLbb0sdrLVumMs4GDrSmWYl7abSRAIIcZuyOX
UKIn+LXmOFi6Yxf3Ns3hJGqlwDVDicWKx7xX8U/SDn7QYo8RZsHpsz3bXjB6ix3+
TKTkHJY2H9FROkCq46MDpZ/yMpq3vU9/MdLcCuP6AZAfhrHeCwiIX4uFl3eTzWvA
BL4YFGOoVzuF5yvf47VQ
=bJOM
-----END PGP SIGNATURE-----

--ZaW/dtY/7oMe/vLp--
