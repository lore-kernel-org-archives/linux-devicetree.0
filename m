Return-Path: <SRS0=d9CS=UG=vger.kernel.org=devicetree-owner@kernel.org>
Received: from smtp.220.in.ua ([89.184.67.205]:52654 "EHLO smtp.220.in.ua"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731142AbfFGVsP (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 7 Jun 2019 17:48:15 -0400
Subject: Re: [PATCH v2 1/2] dt-bindings: Add docs for EL15203000
References: <20190607184022.13793-1-oleg@kaa.org.ua>
 <b1f0eaf6-e91c-2095-5928-179ad8695b33@ti.com>
 <27c0b356-8111-6b36-23cc-8e654147178f@kaa.org.ua>
 <b6a5cc5e-74f1-d328-7a47-995670ba7aa7@ti.com>
 <adf5a755-c534-64c3-6e99-ba39ffea95e2@kaa.org.ua>
 <2eba86cb-01be-c002-32d0-80ab2ab14f97@gmail.com>
From: Oleh Kravchenko <oleg@kaa.org.ua>
Message-ID: <7e787498-537b-390d-589a-577f34ffbc3f@kaa.org.ua>
Date: Sat, 8 Jun 2019 00:48:03 +0300
MIME-Version: 1.0
In-Reply-To: <2eba86cb-01be-c002-32d0-80ab2ab14f97@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="RYWAu1ML0zaqebF05WhOieeoq2a3whEb6"
Sender: devicetree-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Dan Murphy <dmurphy@ti.com>, devicetree@vger.kernel.org, linux-leds@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--RYWAu1ML0zaqebF05WhOieeoq2a3whEb6
Content-Type: multipart/mixed; boundary="hRclynZB9Rsqj0k0M9FjUXiYCcdZQ1zE4";
 protected-headers="v1"
From: Oleh Kravchenko <oleg@kaa.org.ua>
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Dan Murphy
 <dmurphy@ti.com>, devicetree@vger.kernel.org, linux-leds@vger.kernel.org
Message-ID: <7e787498-537b-390d-589a-577f34ffbc3f@kaa.org.ua>
Subject: Re: [PATCH v2 1/2] dt-bindings: Add docs for EL15203000
References: <20190607184022.13793-1-oleg@kaa.org.ua>
 <b1f0eaf6-e91c-2095-5928-179ad8695b33@ti.com>
 <27c0b356-8111-6b36-23cc-8e654147178f@kaa.org.ua>
 <b6a5cc5e-74f1-d328-7a47-995670ba7aa7@ti.com>
 <adf5a755-c534-64c3-6e99-ba39ffea95e2@kaa.org.ua>
 <2eba86cb-01be-c002-32d0-80ab2ab14f97@gmail.com>
In-Reply-To: <2eba86cb-01be-c002-32d0-80ab2ab14f97@gmail.com>

--hRclynZB9Rsqj0k0M9FjUXiYCcdZQ1zE4
Content-Type: text/plain; charset=utf-8
Content-Language: uk-UA
Content-Transfer-Encoding: quoted-printable

Jacek,

08.06.19 00:23, Jacek Anaszewski =D0=BF=D0=B8=D1=88=D0=B5:
> Hi Oleh.
>=20
> On 6/7/19 11:17 PM, Oleh Kravchenko wrote:
>> Dan,
>>
>> On 08.06.19 00:04, Dan Murphy wrote:
>>> Oleh
>>> But this is not really max_brightness now this is a feature and now
>>> does not make sense in this context
>>>>>
>>>>> You may need to use something different for this property or expose=

>>>>> a file in the driver.
>>>>>
>>>>>
>>>> Protocol for this board define 0x32 as brightness level.
>>>> This behaviur needed to keep backward compatibity.
>>>>
>>>>
>>> Backwards compatibility to what?
>> With old/new boards.
>=20
> You have in your driver the following:
>=20
> + * BRIGHTNESS=C2=A0=C2=A0=C2=A0 Can be 0x30 (OFF), 0x31 (ON).
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x32 (Effect) can b=
e used for 0x50 (leaking) and
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for 0x53 (blinking)=

>=20
> If your max-brightness DT property is to be used for controlling this,
> then I don't see how it would be backward compatible with anything.
>=20
> Clearly, you don't need max-brightness DT property at all.

What I should do with board which accept brightness in range 0x30 - 0x3a?=

Where 0x3a means special effect.

>=20
> For blinking you can use blink_set op. To be able to recommend
> you anoptimal solution for the effect we would need more
> details regarding its nature.

Thanks, I will do that.
But how to properly handle other effects? Not only blinking?

And how to define it by device tree?
Driver can't get this information about what is really supported.
I don't want define effect code inside DT.

=20
>>> This is a new driver there should be no DT that has this compatible o=
r
>>> definition.
>>>
>>> I will let Rob ack or nack this node.
>>>
>>> Dan
>>>
>>
>>
>=20

--=20
Best regards,
Oleh Kravchenko
Phone: +380972763224 | oleg@kaa.org.ua | Skype: oleg_krava


--hRclynZB9Rsqj0k0M9FjUXiYCcdZQ1zE4--

--RYWAu1ML0zaqebF05WhOieeoq2a3whEb6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEC/TM5t+2NenFhW0Q0xNJm20pl4wFAlz625MACgkQ0xNJm20p
l4wEXQ/8CFjkbCKFh8BQOKmMKvQjxbbm6xGCG6bmsgi/qQQkWjlifUgmV5/oh6a+
D9KKolQTqNgOCx4uSB3nLsivDswxLUuaCqrqmh/BnQkM2ufRYJrGSCC5eOD8BHL+
4Rn99dv+j6yjQiGUedmIkVmENxWabsD7HU6hpAwDf3WPaUygYgBnylIWmopLxBzu
RTZJ320i2LocviV59ldWriUMFTF8Ilnlu9ycsXWFUuQwcE+riID7eqdUrZvMAcce
O0HbAlt6/55TuBJwFwXV2xn7X1bP+ZuU4G9VO4rLyA/yHc5J+D1jKugO3wywt7v+
sQaj0rOzfeedM7wDTG0aszZRvQiKK3UUHHsQo9zWsN/AB+d9WbXhkkFddW9RSjBw
iAoXilP9mpwfDi6NuaKpzt0k9XHrLOfd2BheW2dorxaYYcnIkxAZ9SLlVzzkKHzC
MOUQig1fsk4e7O4X+E3nc9NMh5/z7M+EfIiUKU8FenCaZ2oGqnL5ZA/bLF5FSVtu
Q8aK5QnyNK8ujEloswBUjcW1AlFYC/0UzCADiNzAItHcyulkldKms3zF7CuUbe3C
dB4+nwDEtKZAo2twJc7uDhdRSj3ajAhNiouY1mjOfMMlMkamCt4H3J1gEZvoobCy
9u2oLi8N9WaiWR1+sCtyrMXiwT1d5KVLp80ThzhDzXT9VwNDdac=
=uuWK
-----END PGP SIGNATURE-----

--RYWAu1ML0zaqebF05WhOieeoq2a3whEb6--
