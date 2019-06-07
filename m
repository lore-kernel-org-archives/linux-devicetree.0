Return-Path: <SRS0=d9CS=UG=vger.kernel.org=devicetree-owner@kernel.org>
Received: from smtp.220.in.ua ([89.184.67.205]:45591 "EHLO smtp.220.in.ua"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729342AbfFGUF1 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 7 Jun 2019 16:05:27 -0400
Subject: Re: [PATCH 2/2] leds: add LED driver for EL15203000 board
References: <20190607114823.3735-1-oleg@kaa.org.ua>
 <20190607114823.3735-2-oleg@kaa.org.ua>
 <f0ec5988-77c2-b0fa-045d-ec6a7445fc48@ti.com>
 <a2382176-f4f5-b346-0b9f-bf59d047b8a6@kaa.org.ua>
 <39d78c5c-01b0-23ce-6d01-d6baa7a34159@ti.com>
From: Oleh Kravchenko <oleg@kaa.org.ua>
Message-ID: <ef09e290-719e-3cd9-f3a9-e13be8ce9c1e@kaa.org.ua>
Date: Fri, 7 Jun 2019 23:05:15 +0300
MIME-Version: 1.0
In-Reply-To: <39d78c5c-01b0-23ce-6d01-d6baa7a34159@ti.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="SqKlBOAlBzO95kdqckzYyffYrK6eHCJ4s"
Sender: devicetree-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>, devicetree@vger.kernel.org, linux-leds@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--SqKlBOAlBzO95kdqckzYyffYrK6eHCJ4s
Content-Type: multipart/mixed; boundary="2rnzjl1nlNJgvOEVs4HWAh63CITQ63FP8";
 protected-headers="v1"
From: Oleh Kravchenko <oleg@kaa.org.ua>
To: Dan Murphy <dmurphy@ti.com>, devicetree@vger.kernel.org,
 linux-leds@vger.kernel.org
Message-ID: <ef09e290-719e-3cd9-f3a9-e13be8ce9c1e@kaa.org.ua>
Subject: Re: [PATCH 2/2] leds: add LED driver for EL15203000 board
References: <20190607114823.3735-1-oleg@kaa.org.ua>
 <20190607114823.3735-2-oleg@kaa.org.ua>
 <f0ec5988-77c2-b0fa-045d-ec6a7445fc48@ti.com>
 <a2382176-f4f5-b346-0b9f-bf59d047b8a6@kaa.org.ua>
 <39d78c5c-01b0-23ce-6d01-d6baa7a34159@ti.com>
In-Reply-To: <39d78c5c-01b0-23ce-6d01-d6baa7a34159@ti.com>

--2rnzjl1nlNJgvOEVs4HWAh63CITQ63FP8
Content-Type: text/plain; charset=utf-8
Content-Language: uk-UA
Content-Transfer-Encoding: quoted-printable

Dan,

07.06.19 22:41, Dan Murphy =D0=BF=D0=B8=D1=88=D0=B5:
> Oleh
>=20
> On 6/7/19 12:46 PM, Oleh Kravchenko wrote:
>>> These can be #defined which makes them desctiptive
>>>
>>> #define EL15203000_LED_OFF =C2=A0=C2=A0=C2=A0 0x30
>>>
>>> #define EL15203000_LED_ON =C2=A0=C2=A0=C2=A0 0x31
>>>
>>> and so on
>> Hm, but just adding 0x30 not will be more clear and faster?
>> I think switch .. case or if .. else, will be more hard to read :)
>=20
> Huh?
>=20
> You had to explain what the value 0x3X meant in a comment.=C2=A0 So cla=
rity is not there.=C2=A0 Faster?
>=20
> The #define LED_?? makes sense without having to explain the protocol.=C2=
=A0 What is 0x30?
>=20
> And I am not seeing any switch..case or if..else in the code using thes=
e values but if it was defined it would be easier to read.
>=20
> Why would this value be in a switch..case or if..else if it is just a p=
rotocol value?
>=20
> You have 1 line of code that uses the 0x30 so maybe you don't need to d=
efine LED_ON and LED_OFF but this value means something
>=20
> and that should be #defined as there is no understanding what the 0x30 =
is actually doing.
>=20
> cmd[1] =3D=C2=A0 EL15203000_LED_???? + (u8)brightness;

I described it in top of the file. Looks likes it's not clear.
LED board has next brightness level:
	'0' - 0x30
	'1' - 0x31
	'2' - 0x32


>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (reg > U8_MAX) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
dev_err(priv->dev, "LED value %d is invalid", reg);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
fwnode_handle_put(child);
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
return -ENODEV;
>>> -EINVAL
>> Done
>>
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 led->reg =3D reg;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D fwnode_property_=
read_string(child, "label", &str);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
snprintf(led->name, sizeof(led->name),
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 "el15203000::");
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
snprintf(led->name, sizeof(led->name),
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 "el15203000:%s", str);
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fwnode_property_read_str=
ing(child, "linux,default-trigger",
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &le=
d->ldev.default_trigger);
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 led->priv=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D priv;=

>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 led->ldev.name=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D le=
d->name;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 led->ldev.max_brightness=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D LED_ON;
>>> Do not need this as it should be stored when doing the fwnode read.
>> This is default value 1, by dtb we can override it to 2.
>=20
> This has code some other issues.=C2=A0 I will comment in your v2.

Thanks

> Dan
>=20

--=20
Best regards,
Oleh Kravchenko



--2rnzjl1nlNJgvOEVs4HWAh63CITQ63FP8--

--SqKlBOAlBzO95kdqckzYyffYrK6eHCJ4s
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEC/TM5t+2NenFhW0Q0xNJm20pl4wFAlz6w3wACgkQ0xNJm20p
l4xaChAAin19NDL+RwRkGr378uO87ZoJ8cYYRzDqUfE9DcbLLzqOj8r/e0eIG4GQ
uxwhL70EvpbIvJMHdwgVyE1LPneRFRYRmCu+6MELIWApmuj8KvKymVDHl5cdJ71o
D/eIkS6TZgRDcd1hd/cBZSBS9xkbYCiBX92ix0ygaxnupCG9jsbLHG016ocSlmd+
iwlFk4Oq9KKNCDPq8ibMXAz29gULlCNhZ175CD9j5cc8vflCWkHgmSNdQXdLMdrw
fWuIE+o5z8+KnbajSQRlIQsOBDQdqGiOR1tlsZuvcs0dm5QDOmeVWH/2EAbMOWxG
W8aa4oEMDt5JaOo5/KZO875qYA5idddzBtTSdj3aVgAiiFJaAEN8lU8clVUAd3nc
9GtIHDNZheht52M9w9y8lpNK59e+FCUffP7j7HSMv0YRlWE9VojVXqTMimpoZSBq
bN3zJT//8asvJjj90g0TSeoBlH38tdCQ/4oBJQsya3TwVIPlgrM1xm6bv0pMv8sU
5YS1YdAVYjHxBh/lJ4JaLUBTQDzG4uG2BDMRZ8/s6gqu34Y1w4xuIXvGY5aEodcp
ceYFVMUB1bsPjTWjR2H3s19GV+BgXCwOqEfHDZ8JL1iWue0ebgZINvHNAKLkltUU
c9TwPQRmPZmD/PJ+I1hKgOBh69Drg+8y6J5dAJ4C4zmmicFxqlw=
=rJyY
-----END PGP SIGNATURE-----

--SqKlBOAlBzO95kdqckzYyffYrK6eHCJ4s--
