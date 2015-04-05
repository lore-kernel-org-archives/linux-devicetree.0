From: Oleksij Rempel <linux@rempel-privat.de>
Subject: Re: [PATCH v2 1/2] pinctrl: Add driver for Alphascale asm9260 pinctrl
Date: Sun, 05 Apr 2015 07:49:50 +0200
Message-ID: <5520CCFE.8090501@rempel-privat.de>
References: <CACRpkdbKLkMB6WP0zp2xN+gM4ytvs=3V5hh8uKt8e=YE4gAAqQ@mail.gmail.com>	 <1427448973-665-1-git-send-email-linux@rempel-privat.de>	 <1427448973-665-2-git-send-email-linux@rempel-privat.de> <1427476243.2334.12.camel@x220>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="WDDA8Ajpd84t1PD5LK5mvUMHvGDG4WhmD"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1427476243.2334.12.camel@x220>
Sender: linux-gpio-owner@vger.kernel.org
To: Paul Bolle <pebolle@tiscali.nl>
Cc: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--WDDA8Ajpd84t1PD5LK5mvUMHvGDG4WhmD
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Paul,

thank you for your review.

Am 27.03.2015 um 18:10 schrieb Paul Bolle:
> This patch adds a mismatch between the Kconfig symbol (bool) and the
> code (which assumes a modular built too).
>=20
> On Fri, 2015-03-27 at 10:36 +0100, Oleksij Rempel wrote:
>> --- a/drivers/pinctrl/Kconfig
>> +++ b/drivers/pinctrl/Kconfig
>> @@ -47,6 +47,14 @@ config PINCTRL_AS3722
>>  	  open drain configuration for the GPIO pins of AS3722 devices. It a=
lso
>>  	  supports the GPIO functionality through gpiolib.
>> =20
>> +config PINCTRL_ASM9260
>> +	bool "Pinctrl driver for Alphascale asm9260"
>=20
> This adds a bool symbol.
>=20
>> +	depends on MACH_ASM9260
>> +	select PINMUX
>> +	select GENERIC_PINCONF
>> +	help
>> +	  Say Y here to enable the Alphascale asm9260 pinctrl driver
>> +
>=20
>> -- a/drivers/pinctrl/Makefile
>> +++ b/drivers/pinctrl/Makefile
>=20
>> +obj-$(CONFIG_PINCTRL_ASM9260)	+=3D pinctrl-asm9260.o
>=20
> So this object can now only be built-in.
>=20
>> --- /dev/null
>> +++ b/drivers/pinctrl/pinctrl-asm9260.c
>> @@ -0,0 +1,733 @@
>> +/*
>> + * Pinctrl driver for the Alphascale ASM9260 SoC
>> + *
>> + * Copyright (c) 2014, Oleksij Rempel <linux@rempel-privat.de>
>> + *
>> + * This program is free software; you can redistribute it and/or modi=
fy it
>> + * under the terms and conditions of the GNU General Public License,
>> + * version 2, as published by the Free Software Foundation.
>> + */
>> +
>> +#include <linux/clk.h>
>> +#include <linux/io.h>
>> +#include <linux/module.h>
>=20
> This include is probably not needed.

This include is still needed for MODULE_DEVICE_TABLE.

>> +#include <linux/pinctrl/pinconf-generic.h>
>> +#include <linux/pinctrl/pinmux.h>
>> +#include <linux/platform_device.h>
>> +
>> +#include "core.h"
>> +#include "pinctrl-utils.h"
>=20
>> +/*
>> + * Pin control driver setup
>> + */
>> +static struct pinctrl_desc asm9260_pinctrl_desc =3D {
>> +	.pctlops	=3D &asm9260_pinctrl_ops,
>> +	.pmxops		=3D &asm9260_pinmux_ops,
>> +	.confops	=3D &asm9260_pinconf_ops,
>> +	.owner		=3D THIS_MODULE,
>=20
> THIS_MODULE is, basically, equivalent to NULL for built-in code.
>=20
>> +};
>> +
>=20
>> +MODULE_DEVICE_TABLE(of, asm9260_pinctrl_of_match);
>=20
> This will be preprocessed away for built-in code.
>=20
>> +module_platform_driver(asm9260_pinctrl_driver);
>=20
> The built-in equivalent of this seems to be a wrapper that
> only does
>     platform_driver_register(&asm9260_pinctrl_driver);
>=20
> and mark that wrapper as a device_initcall(). There appears to be no
> macro that does all that in one line.
>=20
>> +MODULE_AUTHOR("Oleksij Rempel <linux@rempel-privat.de>");
>> +MODULE_DESCRIPTION("Alphascale ASM9260 pinctrl driver");
>> +MODULE_LICENSE("GPL");
>=20
> These three macros will be, effectively, preprocessed away for built-in=

> code. (By the way, you probably want to use "GPL v2" as the license
> ident if it would be possible to build this code modular.)
>=20

According to:
http://lxr.free-electrons.com/source/include/linux/module.h#L100
"GPL"                          [GNU Public License v2 or later]

which reflects statement provided in the header :)

I assume all this changes are in the grey zone between: "make it pretty"
and "it won't make any difference" :D

Are you ok if we leave it as is?

--=20
Regards,
Oleksij


--WDDA8Ajpd84t1PD5LK5mvUMHvGDG4WhmD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iF4EAREIAAYFAlUgzQMACgkQHwImuRkmbWkJfwEAjZyY7SjnqdwecSVHrSH/9NWf
VVNS4zy9JAgkcf4/MmEA/RXQUSq08Xq79tUPQWyNr6R3nqGAECvxxoqMLGvFBwqy
=ixGN
-----END PGP SIGNATURE-----

--WDDA8Ajpd84t1PD5LK5mvUMHvGDG4WhmD--
