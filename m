From: Oleksij Rempel <linux@rempel-privat.de>
Subject: Re: [PATCH v3 1/2] pinctrl: Add driver for Alphascale asm9260 pinctrl
Date: Mon, 06 Apr 2015 10:38:28 +0200
Message-ID: <55224604.8070009@rempel-privat.de>
References: <1427476243.2334.12.camel@x220>	 <1428215185-14190-1-git-send-email-linux@rempel-privat.de>	 <1428215185-14190-2-git-send-email-linux@rempel-privat.de> <1428306169.634.51.camel@x220>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="GRjHhFh4dkH7PXU3T1EO03q9pNTVeJc2C"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1428306169.634.51.camel@x220>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Bolle <pebolle@tiscali.nl>
Cc: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--GRjHhFh4dkH7PXU3T1EO03q9pNTVeJc2C
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

A suggestion to your correction.

If you won't to say: "You have a mismatch between header and
MODULE_LICENSE, please make sure it will match."
You saying some thing like this: "I was right last time. Make module
License like I saying."

I'm confuse, what is your actual point? Do you trying to prove some thing=
?

Am 06.04.2015 um 09:42 schrieb Paul Bolle:
> A license nit follows.
>=20
> On Sun, 2015-04-05 at 08:26 +0200, Oleksij Rempel wrote:
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
>=20
> This states the license of this file is GPL v2.
>=20
>> +MODULE_LICENSE("GPL");
>=20
> Your reading of include/linux/module.h (see
> https://lkml.org/lkml/2015/4/5/7 ) is incorrect. Because according to
> that header "GPL" means
>     GNU Public License v2 or later
>=20
> while "GPL v2" means
>     GNU Public License v2
>=20
> So only "GPL v2" matches what's found in the comment at top of this
> file.
>=20
> Thanks,
>=20
>=20
> Paul Bolle
>=20


--=20
Regards,
Oleksij


--GRjHhFh4dkH7PXU3T1EO03q9pNTVeJc2C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iF4EAREIAAYFAlUiRggACgkQHwImuRkmbWk4gAD/aQ8toFGWoqfzdW9MpUPgx3Qy
mhtFiBct9MieiI7FoWYBAIX8p6j19ACL2fX8orYWOvcEk+4WZyd9nUAiEDfSmHZv
=X5ot
-----END PGP SIGNATURE-----

--GRjHhFh4dkH7PXU3T1EO03q9pNTVeJc2C--
