Return-Path: <SRS0=d9CS=UG=vger.kernel.org=devicetree-owner@kernel.org>
Received: from smtp.220.in.ua ([89.184.67.205]:35936 "EHLO smtp.220.in.ua"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728684AbfFGRqk (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 7 Jun 2019 13:46:40 -0400
Subject: Re: [PATCH 2/2] leds: add LED driver for EL15203000 board
References: <20190607114823.3735-1-oleg@kaa.org.ua>
 <20190607114823.3735-2-oleg@kaa.org.ua>
 <f0ec5988-77c2-b0fa-045d-ec6a7445fc48@ti.com>
From: Oleh Kravchenko <oleg@kaa.org.ua>
Message-ID: <a2382176-f4f5-b346-0b9f-bf59d047b8a6@kaa.org.ua>
Date: Fri, 7 Jun 2019 20:46:25 +0300
MIME-Version: 1.0
In-Reply-To: <f0ec5988-77c2-b0fa-045d-ec6a7445fc48@ti.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="DneP41flqMxjWVVuhYpQa2G87jNPbPNte"
Sender: devicetree-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>, devicetree@vger.kernel.org, linux-leds@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--DneP41flqMxjWVVuhYpQa2G87jNPbPNte
Content-Type: multipart/mixed; boundary="V2LsHsohcHhh5Qh0XY92kyTe105w53OF3";
 protected-headers="v1"
From: Oleh Kravchenko <oleg@kaa.org.ua>
To: Dan Murphy <dmurphy@ti.com>, devicetree@vger.kernel.org,
 linux-leds@vger.kernel.org
Message-ID: <a2382176-f4f5-b346-0b9f-bf59d047b8a6@kaa.org.ua>
Subject: Re: [PATCH 2/2] leds: add LED driver for EL15203000 board
References: <20190607114823.3735-1-oleg@kaa.org.ua>
 <20190607114823.3735-2-oleg@kaa.org.ua>
 <f0ec5988-77c2-b0fa-045d-ec6a7445fc48@ti.com>
In-Reply-To: <f0ec5988-77c2-b0fa-045d-ec6a7445fc48@ti.com>

--V2LsHsohcHhh5Qh0XY92kyTe105w53OF3
Content-Type: text/plain; charset=utf-8
Content-Language: uk-UA
Content-Transfer-Encoding: quoted-printable

Hello Dan,
thank you for your review!

07.06.19 17:59, Dan Murphy =D0=BF=D0=B8=D1=88=D0=B5:
> Oleh
>=20
> On 6/7/19 6:48 AM, Oleh Kravchenko wrote:

>> +#include <linux/delay.h>
>> +#include <linux/leds.h>
>> +#include <linux/limits.h>
> I do not see any #defines used from this file

For U8_MAX, please see below.

>> +#include <linux/module.h>
>> +#include <linux/of_device.h>
>> +#include <linux/spi/spi.h>
>> +#include <linux/workqueue.h>
>=20
> It does not look like you are using any work queues.
=20
My bad, thank you!

>> + * LED=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ID, known values is =
0x50 (Pipe), 0x53 (Screen Frame) and
>> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x56 (Vending Area=
);
>> + * BRIGHTNESS=C2=A0=C2=A0=C2=A0 Can be 0x30 (OFF), 0x31 (ON).
>> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x32 (Effect) can =
be used for 0x50 (leaking) and
>> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for 0x53 (blinking=
).
>> + *
>=20
> These can be #defined which makes them desctiptive
>=20
> #define EL15203000_LED_OFF =C2=A0=C2=A0=C2=A0 0x30
>=20
> #define EL15203000_LED_ON =C2=A0=C2=A0=C2=A0 0x31
>=20
> and so on

Hm, but just adding 0x30 not will be more clear and faster?
I think switch .. case or if .. else, will be more hard to read :)

>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (reg > U8_MAX) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 de=
v_err(priv->dev, "LED value %d is invalid", reg);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fw=
node_handle_put(child);
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
turn -ENODEV;
> -EINVAL

Done

>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 led->reg =3D reg;
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D fwnode_property_re=
ad_string(child, "label", &str);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sn=
printf(led->name, sizeof(led->name),
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 "el15203000::");
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sn=
printf(led->name, sizeof(led->name),
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 "el15203000:%s", str);
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fwnode_property_read_strin=
g(child, "linux,default-trigger",
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &le=
d->ldev.default_trigger);
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 led->priv=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D priv;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 led->ldev.name=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D le=
d->name;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 led->ldev.max_brightness=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D LED_ON;
> Do not need this as it should be stored when doing the fwnode read.

This is default value 1, by dtb we can override it to 2.

>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 led->ldev.brightness_set_b=
locking =3D el15203000_set_sync;
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D fwnode_property_re=
ad_u32(child, "max-brightness",
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 &led->ldev.max_brightness);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (led->ldev.max_brightne=
ss > EL_MAX_BRIGHTNESS) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 de=
v_err(priv->dev, "invalid max brightness %d",
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 led->ldev.max_brightness);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fw=
node_handle_put(child);
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
turn -ENODEV;
>=20
> -EINVAL

Done
=20
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D devm_of_led_classd=
ev_register(priv->dev, np,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 &led->ldev);
>=20
> please use devm_led_classdev_register then there is no need to set np o=
r store it.
>=20
> Dan
>=20

--=20
Best regards,
Oleh Kravchenko



--V2LsHsohcHhh5Qh0XY92kyTe105w53OF3--

--DneP41flqMxjWVVuhYpQa2G87jNPbPNte
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEC/TM5t+2NenFhW0Q0xNJm20pl4wFAlz6ovQACgkQ0xNJm20p
l4yMmg/9EMIQNq2ECjItpf7TYqRVnPGRsQPm8zFSduN5muGLjq34DpcKevVZPOBT
jWMIj4aP0UIpEKqT4ZcU7OQER31q4D9UEp6aKEwSInZiYWlmiBwCzEtHGLCZl0nQ
aw09Qli1Iu459/W87yMWVXzlHq2qy4iLRt52e58VICaCjD11Ga7uPK7cCumqlPZ9
QFHo7eZDsJq6gEmo4XIv1D/KCb7ou4PvCVoPpeL4tMI88jrYfDOCuuNZzdXEw64M
h2LEwp9eor+OkGDI40mgIghsNt+sC5Oyv+oA5fpsLzXK25MHspgjeTSfi91HS9RF
s/H3apdfu+z67BZ1jzNuLYObHPCkNtbNNRfOvez4rd9alq4mzoN3cFRbG/+uO0E0
WeZ7nhVMxj4H1CEqXoZ4wrAdsDbz//xaoJ3EPPsp89D5UzdBpTrSCJXZJ4gcj5d9
6Sq3FKUG5Shc/jpT0Gx9Yzx+Wv87UJifjcMSlK1OJMkpbpWFs7WTsGBgKlS0+doU
wF/h4yxsgARuhgLg/Kcs0W8N6xRg5Uh4kOQKuClkBImH/WON+S+3O+aWnth0TlYc
TZhfT35oQH6xY5JEVed7q0/Jv5Yx9e1zJQyhQ2Kwc9GtuWnh05F8FlAbPvOl4GOg
hCk/UQGS0w1BtXGIw2sngtb5w/2jkMKSyt54labS1/vEUFvwcNs=
=6gs/
-----END PGP SIGNATURE-----

--DneP41flqMxjWVVuhYpQa2G87jNPbPNte--
