From: Oleksij Rempel <linux@rempel-privat.de>
Subject: Re: [PATCH v4 1/2] pinctrl: Add driver for Alphascale asm9260 pinctrl
Date: Wed, 09 Sep 2015 07:55:24 +0200
Message-ID: <55EFC9CC.3010008@rempel-privat.de>
References: <1428306169.634.51.camel@x220>	<1428311043-12012-1-git-send-email-linux@rempel-privat.de>	<1428311043-12012-2-git-send-email-linux@rempel-privat.de>	<CACRpkdakXbHL6ydeZrs4XZ9Z1odHL5bWRxiHtT_Jbg-ygTudgw@mail.gmail.com>	<55522993.6090104@rempel-privat.de> <CACRpkdZn+bkDKzAD6gpnysezGZ6fzizD2o4zdBfEamFgUbzcvg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="gxA4EMrg3dE83uHXlWEqs74ofg7mr1R4S"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZn+bkDKzAD6gpnysezGZ6fzizD2o4zdBfEamFgUbzcvg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--gxA4EMrg3dE83uHXlWEqs74ofg7mr1R4S
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi, finally i'm able to continue to work on it.

Am 13.05.2015 um 13:00 schrieb Linus Walleij:
> On Tue, May 12, 2015 at 6:25 PM, Oleksij Rempel <linux@rempel-privat.de=
> wrote:
>> Am 05.05.2015 um 17:12 schrieb Linus Walleij:
>=20
>>> Just reference the statically defined array by a pointer instead,
>>> this just takes up a lot o memory for no reason.
>>
>> This two arrays have different types this is why i convert it.
>> priv->pin_desc[i].name - here i copy pointer any ways, and
>> priv->pin_desc[i].number can be smaller then pointer.
>=20
> I probably do not understand what you're trying to do, sorry :(
>=20
> Why is it necessary for the driver to copy one description of
> the pin into another?

If i understand it correctly, pinctrl_pin_desc is essential part of
pinmux framework. Theoretically i should define just statical array of
this struct, but by this number of pins and functions it hard to keep it
readable and error free. So i decided to create asm9260_mux_table which
contains every thing i need. The side effect is higher memory usage
since i need to create pinctrl_pin_desc on fly.

May be i miss some thing?

>>> Mory copying. I don't see why this is necessary at all.
>>
>> I hadn't seen the point to define groups statically, especially becaus=
e
>> they are used only  to make curious user happy. So, memory will be use=
d
>> only if you request the list over sysfs. Or miss some thing?
>=20
> pinctrl does not even use sysfs.

please read debugfs.

> The group names are usually there for matching with a function,
> it is part of the core functionality. The group name + function name
> matching is even more obvious in the dt case.
>=20
> They also make things easier to read in debugfs yes, but
> the core of the crux is to make it easy to config function+groups
> states with e.g. DT or board files.
>=20
>>>> +static struct pinmux_ops asm9260_pinmux_ops =3D {
>>>> +       .get_functions_count    =3D asm9260_pinctrl_get_funcs_count,=

>>>> +       .get_function_name      =3D asm9260_pinctrl_get_func_name,
>>>> +       .get_function_groups    =3D asm9260_pinctrl_get_func_groups,=

>>>> +       .set_mux                =3D asm9260_pinctrl_set_mux,
>>>> +       /* TODO: should we care about gpios here? gpio_request_enabl=
e? */
>>>
>>> I think you should, if you also have a matching GPIO driver.
>>
>> I fear it would cause unpredictable bugs. GPIO mode is just one of mux=

>> modes. If some one will request gpio some busy or dangerous line it
>> would do more harm then use. So, i assume limiting this only to device=

>> tree would be better.
>=20
> Device tree or not doesn't matter, .gpio_request_enable() is used
> as a shortcut to mux in GPIO pins.
>=20
> If the simultaneous use of a pin for a device and GPIO bothers
> you there is nowadays (linux-next or my devel branch) a .strict
> option in pinmux_ops that you can set to disallow simultaneous
> use by devices and GPIO of the same pin.
>=20
> Yours,
> Linus Walleij
>=20


--=20
Regards,
Oleksij


--gxA4EMrg3dE83uHXlWEqs74ofg7mr1R4S
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EAREIAAYFAlXvyc0ACgkQHwImuRkmbWk/yAD/X3a4gDh+YfwauOx97B+O9Um+
63mz2khNmGQkq3yGol4BAINMZVD9vJKdvYRkM+WCQAwwlSnIe1o9c985mYDhLmNy
=BKDK
-----END PGP SIGNATURE-----

--gxA4EMrg3dE83uHXlWEqs74ofg7mr1R4S--
