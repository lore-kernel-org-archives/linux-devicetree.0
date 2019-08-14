Return-Path: <SRS0=hvZ9=WK=vger.kernel.org=devicetree-owner@kernel.org>
Received: from smtp.220.in.ua ([89.184.67.205]:57224 "EHLO smtp.220.in.ua"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726509AbfHNUQL (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 14 Aug 2019 16:16:11 -0400
Subject: Re: [PATCH v4 2/2] leds: add LED driver for EL15203000 board
References: <20190808203204.8614-1-oleg@kaa.org.ua>
 <20190808203204.8614-2-oleg@kaa.org.ua>
 <c2b006bb-2bb6-98b0-c907-190fd9fc41c7@gmail.com>
 <260f8b69-3f4a-d911-88f8-d6de59e79bc3@kaa.org.ua>
 <56fa6881-2af6-71ec-160c-7712075756be@gmail.com>
 <11f6da3b-860a-2e52-e4fa-2a650fd2407b@kaa.org.ua>
 <b0965dd8-2085-db4d-519d-8ea8a51f57a6@gmail.com>
From: Oleh Kravchenko <oleg@kaa.org.ua>
Message-ID: <e72f3669-1537-54ee-5ddd-ea77f9d13f07@kaa.org.ua>
Date: Wed, 14 Aug 2019 23:16:00 +0300
MIME-Version: 1.0
In-Reply-To: <b0965dd8-2085-db4d-519d-8ea8a51f57a6@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Vv9XVWA37xOGFiwJN7qaUrU1B6VJMXZid"
Sender: devicetree-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, devicetree@vger.kernel.org, linux-leds@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Vv9XVWA37xOGFiwJN7qaUrU1B6VJMXZid
Content-Type: multipart/mixed; boundary="6Geq9CZOi8uLuNapBUiDV7eGT1q7pXtDU";
 protected-headers="v1"
From: Oleh Kravchenko <oleg@kaa.org.ua>
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 devicetree@vger.kernel.org, linux-leds@vger.kernel.org
Message-ID: <e72f3669-1537-54ee-5ddd-ea77f9d13f07@kaa.org.ua>
Subject: Re: [PATCH v4 2/2] leds: add LED driver for EL15203000 board
References: <20190808203204.8614-1-oleg@kaa.org.ua>
 <20190808203204.8614-2-oleg@kaa.org.ua>
 <c2b006bb-2bb6-98b0-c907-190fd9fc41c7@gmail.com>
 <260f8b69-3f4a-d911-88f8-d6de59e79bc3@kaa.org.ua>
 <56fa6881-2af6-71ec-160c-7712075756be@gmail.com>
 <11f6da3b-860a-2e52-e4fa-2a650fd2407b@kaa.org.ua>
 <b0965dd8-2085-db4d-519d-8ea8a51f57a6@gmail.com>
In-Reply-To: <b0965dd8-2085-db4d-519d-8ea8a51f57a6@gmail.com>

--6Geq9CZOi8uLuNapBUiDV7eGT1q7pXtDU
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hello Jacek,

14.08.19 22:57, Jacek Anaszewski =D0=BF=D0=B8=D1=88=D0=B5:
>>>>
>>>> All pattern is predefined, you can't change them at all.
>>>> I just tried to describe real things what happened in LED board.
>>>> It's ticks every 800 milliseconds for Pipe LEDs.
>>>
>>> It makes me wonder how you figured out the values? If you have
>>> a documentation for this controller, could you share how the pattern
>>> settings are documented?
>>
>> I saw the code of firmware.
>> Not sure if I can find any documentation for it right now.
>=20
> Have you tried to alter the values? Or check what happens when
> the duplication is removed?

What do you mean alter? It doesn't make any sense.
Board is accepts only brightness level from '0' to '5'.
I'm really confused :-)
=20
>>>
>>> For the first two we could do without sequence duplication.
>>
>> Ok, I will reduce it.
>=20
> Please hold on for a while. I will have some more remarks to the driver=
,
> just collecting missing info for now to gain more complete view on this=

> device.

Here is the full story:

EL15203000 LEDs board (aka RED LEDs board, because it has only RED LEDs).=

It's provide access to 3 LEDs:

- First LED (Screen) is a light tube around big 21" screen
  It's have 3 brightness levels:
  * OFF
  * ON
  * Breathing mode (8 seconds full cycle)
- Second LED (Vending area) is highlight coffee cap
  * OFF
  * ON
- Third LED (Pipe) is actually virtual, because consists from 5 LEDs
  * OFF for all 5 LEDs
  * ON for all 5 LEDs
  * Cascade
  * Inverses cascade
  * Bounce
  * Inverses bounce

--=20
Best regards,
Oleh Kravchenko



--6Geq9CZOi8uLuNapBUiDV7eGT1q7pXtDU--

--Vv9XVWA37xOGFiwJN7qaUrU1B6VJMXZid
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEC/TM5t+2NenFhW0Q0xNJm20pl4wFAl1UbAAACgkQ0xNJm20p
l4zO1xAA10nvI+cGkHcQNuZKmf18GsyCviv9spWx0iRuv4Ml1GdXNSMdIXgSgDXd
L01arcZNr2pe6FwrlWIBgsOTaSD7/vvcw+k5pPlp917hbBPzayNUxRuv3qSKwdzA
6VohgDGnpxCnGzEvux1sCuKZcWsN957vSq4nC0xVvhBUSQebhZcNzsa6jr/6wVWl
O7HNaRUpvP+zTfRe/3F/tKCnCT+5UiT+L33TYZhSj5Ig3ICTGcFHag3Ga/d+tT+X
88/5VkwfFlS2hzPhiWTKmrAx8sdll9h2i1zvRP8tC+wJlH418XoM6w8YIo9eGzJE
finlRijpFFw2xGEAMxXZcJzsnvrhRzhL1fprt9pEzonsEjfmDOvki9CjFpm+bU77
dl0P2+QJBeGLT+jyUVCwvteNcTQaWnU/OAsfeDsUweTS6M3om1NEk+BtTZq1HzLt
oLOK6nY3LWSu4aQj82jEkMPw0hiFJBxIqVwkaLj1+iiBdYIgzB3yZlDNw4e7rdpN
6EMIYAApvuQxsR9ojdLpOwHkL1hjzBF3TLnsxxqkAVMhKcruplary2/alxo75189
e9mOrdgK4sSV0S8c/DGGUR1c4+pMpn1l0rMsNX7hKv0v4pMTtxI3MRzKq9LZ1+d0
P7LepXHF/nbbjscmanovoG73xQoT32ugko/Mx4DKRdjFtdFSQyM=
=AOEo
-----END PGP SIGNATURE-----

--Vv9XVWA37xOGFiwJN7qaUrU1B6VJMXZid--
