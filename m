From: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH 06/12] gpio: Add Aspeed driver
Date: Fri, 22 Jul 2016 10:19:32 +0930
Message-ID: <1469148572.5468.2.camel@aj.id.au>
References: <1468994313-13538-1-git-send-email-andrew@aj.id.au>
	 <1468994313-13538-7-git-send-email-andrew@aj.id.au>
	 <CAP=VYLrJfRmKOoDWTpBrD5+iPdX6J9r609FzZ0CkzDd7vGBWyw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-Ry2ZyVOAmp0cH92jkNPh"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CAP=VYLrJfRmKOoDWTpBrD5+iPdX6J9r609FzZ0CkzDd7vGBWyw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Joel Stanley <joel@jms.id.au>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Jeremy Kerr <jk@ozlabs.org>, devicetree@vger.kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-gpio@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Alistair Popple <alistair@popple.id.au>
List-Id: devicetree@vger.kernel.org


--=-Ry2ZyVOAmp0cH92jkNPh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2016-07-21 at 16:12 -0400, Paul Gortmaker wrote:
> On Wed, Jul 20, 2016 at 1:58 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> >=20
> > From: Joel Stanley <joel@jms.id.au>
> >=20
> > The Aspeed SoCs contain GPIOs grouped by letter, where each letter grou=
p
> > contains 8 pins. The GPIO letter groups are then banked in sets of four
> > in the register layout.
> >=20
> > The implementation exposes multiple banks through the one driver, and
> > requests and releases pins via the pinctrl subsystem. The hardware
> > supports generation of interrupts with per-pin triggers, and exposes th=
is
> > capability through an irqchip and devicetree.
> >=20
> > A number of supported features are not yet implemented: Configuration o=
f
> > interrupt direction (ARM or LPC), debouncing, and provides WDT reset
> > tolerance for output ports.
> >=20
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > Signed-off-by: Alistair Popple <alistair@popple.id.au>
> > Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> > =C2=A0arch/arm/mach-aspeed/Kconfig |=C2=A0=C2=A0=C2=A04 +
> > =C2=A0drivers/gpio/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0|=C2=A0=C2=A0=C2=A08 +-
> > =C2=A0drivers/gpio/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0|=C2=A0=C2=A0=C2=A01 +
> > =C2=A0drivers/gpio/gpio-aspeed.c=C2=A0=C2=A0=C2=A0| 456 +++++++++++++++=
++++++++++++++++++++++++++++
> > =C2=A04 files changed, 468 insertions(+), 1 deletion(-)
> > =C2=A0create mode 100644 drivers/gpio/gpio-aspeed.c
> >=20
> > diff --git a/arch/arm/mach-aspeed/Kconfig b/arch/arm/mach-aspeed/Kconfi=
g
> > index 25a0ae01429e..a52de9d3adfb 100644
> > --- a/arch/arm/mach-aspeed/Kconfig
> > +++ b/arch/arm/mach-aspeed/Kconfig
> > @@ -6,6 +6,10 @@ menuconfig ARCH_ASPEED
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0select ASPEED_WATCHDOG
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0select MOXART_TIMER
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0select PINCTRL
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0select GPIOLIB
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0select GPIO_ASPEED
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0select GPIO_SYSFS
> > +
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0help
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Say Y here =
if you want to run your kernel on an ASpeed BMC SoC.
> >=20
> > diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> > index 536112fd2466..2c21b5db09cd 100644
> > --- a/drivers/gpio/Kconfig
> > +++ b/drivers/gpio/Kconfig
> > @@ -137,6 +137,13 @@ config GPIO_ATH79
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Select this=
 option to enable GPIO driver for
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Atheros AR7=
1XX/AR724X/AR913X SoC devices.
> >=20
> > +config GPIO_ASPEED
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bool "Aspeed GPIO support"
> Since this is a bool Kconfig...
>=20
> >=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0depends on (ARCH_ASPEED || C=
OMPILE_TEST) && OF
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0select GENERIC_IRQ_CHIP
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0help
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Say Y here to su=
pport Aspeed AST2400 and AST2500 GPIO controllers.
> > +
> [...]
>=20
> =C2=A0> diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspee=
d.c
> >=20
> > new file mode 100644
> > index 000000000000..7885adc1332a
> > --- /dev/null
> > +++ b/drivers/gpio/gpio-aspeed.c
> > @@ -0,0 +1,456 @@
> > +/*
> > + * Copyright 2015 IBM Corp
> > + *
> > + * Joel Stanley <joel@jms.id.au>
> > + *
> > + * This program is free software; you can redistribute it and/or
> > + * modify it under the terms of the GNU General Public License
> > + * as published by the Free Software Foundation; either version
> > + * 2 of the License, or (at your option) any later version.
> > + */
> > +
> > +#include=20
> ...can you please get rid of module.h and all the MODULE_
> stuff and use the built in registration?=C2=A0=C2=A0=C2=A0Alternatively c=
hange it to
> a tristate if there is a valid use case for it to be modular.
>=20

I'll change it to tristate; I don't see a reason to require it be built
in.

Cheers,

Andrew
--=-Ry2ZyVOAmp0cH92jkNPh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXkW2cAAoJEJ0dnzgO5LT54CkQAKZQUEQk3HH/Hyu41xfDlYLT
KFU8GaH10/tzDZWeKYlAr5ppnN3G8MYkcueUvrRR7M+YgkJ3HYpdpdPVSTH4Dxhe
Q+Q2SAUXM4OlT8IAmdQirG0wFiKND8jt5o7ReaST3x31QncX1zQ1+P1ARMdUORDU
O643bF5SB4p/n9KL47JitKmukAbANJJLtPjDxHLyY4pYmSN2q+8s8hxlKCCU19p8
PsKh0Jo274mBFAOUWx9SJ/RnJVCXEb4TDK8vMrn1sR0iBkcPbi320VpF2/xHO4NB
Mevz910hOW4uW2RgRD3xkuUBpZ+lULL+G/TKB3ighUZZcDJ9bXo1/0K+cZ7YYkWG
bJN0r1sBK8DrRFnRV7c6YNyuaHEErM7wHMwTIzqI00rh1Ux29pikJIbLWa1ZmNfN
rw62KCSSoGzjM4Y+ElD8dhBaUMdm4hLtM5t3G4dRLUJQBNvUZaxr9iqQCkz5owYq
0r+5dx3AZnfdQJ4AtYBZilaFyYIBZGCjG0WnvdN/W6vsO8NJr0w3Zcv/pwYdiy/U
RilOv5ZgSipGkMusJjQjQZXGrUbwB4yZ1LRDtq3pCDX6EJvkeQ7PR1cP1AEXe5Zv
ENnsMveiNXzu+zt8cVDlfrfm/mO6YxSf8/P2VTkwS4Wa9oZrVhCXk/WrpKL3pCa0
HpJgjB56iQKl9aCvUkJV
=mNBF
-----END PGP SIGNATURE-----

--=-Ry2ZyVOAmp0cH92jkNPh--

