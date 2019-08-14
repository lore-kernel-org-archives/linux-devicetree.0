Return-Path: <SRS0=hvZ9=WK=vger.kernel.org=devicetree-owner@kernel.org>
Received: from smtp.220.in.ua ([89.184.67.205]:56108 "EHLO smtp.220.in.ua"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728394AbfHNTqt (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 14 Aug 2019 15:46:49 -0400
Subject: Re: [PATCH v4 2/2] leds: add LED driver for EL15203000 board
References: <20190808203204.8614-1-oleg@kaa.org.ua>
 <20190808203204.8614-2-oleg@kaa.org.ua>
 <c2b006bb-2bb6-98b0-c907-190fd9fc41c7@gmail.com>
 <260f8b69-3f4a-d911-88f8-d6de59e79bc3@kaa.org.ua>
 <56fa6881-2af6-71ec-160c-7712075756be@gmail.com>
From: Oleh Kravchenko <oleg@kaa.org.ua>
Message-ID: <11f6da3b-860a-2e52-e4fa-2a650fd2407b@kaa.org.ua>
Date: Wed, 14 Aug 2019 22:46:02 +0300
MIME-Version: 1.0
In-Reply-To: <56fa6881-2af6-71ec-160c-7712075756be@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="X8hkPNcuD643z8rern2blt7RRtBPavRLo"
Sender: devicetree-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, devicetree@vger.kernel.org, linux-leds@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--X8hkPNcuD643z8rern2blt7RRtBPavRLo
Content-Type: multipart/mixed; boundary="KPml6PeSP0L4oIly2BDTh6bfbp7lqrQ2W";
 protected-headers="v1"
From: Oleh Kravchenko <oleg@kaa.org.ua>
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 devicetree@vger.kernel.org, linux-leds@vger.kernel.org
Message-ID: <11f6da3b-860a-2e52-e4fa-2a650fd2407b@kaa.org.ua>
Subject: Re: [PATCH v4 2/2] leds: add LED driver for EL15203000 board
References: <20190808203204.8614-1-oleg@kaa.org.ua>
 <20190808203204.8614-2-oleg@kaa.org.ua>
 <c2b006bb-2bb6-98b0-c907-190fd9fc41c7@gmail.com>
 <260f8b69-3f4a-d911-88f8-d6de59e79bc3@kaa.org.ua>
 <56fa6881-2af6-71ec-160c-7712075756be@gmail.com>
In-Reply-To: <56fa6881-2af6-71ec-160c-7712075756be@gmail.com>

--KPml6PeSP0L4oIly2BDTh6bfbp7lqrQ2W
Content-Type: text/plain; charset=utf-8
Content-Language: uk-UA
Content-Transfer-Encoding: quoted-printable

Hello Jacek,

14.08.19 21:18, Jacek Anaszewski =D0=BF=D0=B8=D1=88=D0=B5:
>>> Why the sequence "1 800 2 800 4 800 8 800 16 800" is duplicated here?=

>>> It seems redundant. But aside of that - aren't the timings modifiable=
?
>>> In other words - are these all patterns somehow configurable or they =
are
>>> pre-programmed?
>>>
>>
>> All pattern is predefined, you can't change them at all.
>> I just tried to describe real things what happened in LED board.
>> It's ticks every 800 milliseconds for Pipe LEDs.
>=20
> It makes me wonder how you figured out the values? If you have
> a documentation for this controller, could you share how the pattern
> settings are documented?

I saw the code of firmware.
Not sure if I can find any documentation for it right now.
=20
>>>> +
>>>> +		Inverted cascade mode for Pipe LED:
>>>> +		"30 800 29 800 27 800 23 800 15 800 30 800 29 800 27 800 23 800 1=
5 800"
>>>
>>> Similar duplication here.
>>>
>>>> +
>>>> +		Bounce mode for Pipe LED:
>>>> +		"1 800 2 800 4 800 8 800 16 800 16 800 8 800 4 800 2 800 1 800"
>>>
>>> Instead of two repeating "16 800" you could provide "16 1600".
>>> But here again is the question whether these values are configurable.=

>>> From what I can see in your driver implementation you're expecting
>>> exactly the values provided in these examples to enable given hardwar=
e
>>> pattern (led_pattern_cmp()).
>>>
>>>> +
>>>> +		Inverted bounce mode for Pipe LED:
>>>> +		"30 800 29 800 27 800 23 800 15 800 15 800 23 800 27 800 29 800 3=
0 800"
>>>
>>
>> Should I cut this patterns to smaller? Or let keep it?
>>
>=20
> For the first two we could do without sequence duplication.

Ok, I will reduce it.

--=20
Best regards,
Oleh Kravchenko



--KPml6PeSP0L4oIly2BDTh6bfbp7lqrQ2W--

--X8hkPNcuD643z8rern2blt7RRtBPavRLo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEC/TM5t+2NenFhW0Q0xNJm20pl4wFAl1UZR4ACgkQ0xNJm20p
l4wQ7A//RL1h+6RBP25geHEjJGRv4K9QFcUkwonhegU1VQootjm4tQON3zW3PkDF
tvlZ+nxH5ApjeRZTvFlHk9dkDbcW9y4RODAL557I3DSkv0YC41jA/ev7cXrPrdq5
eLHcGneKpcb969HQZ2zJigFtHh0rhpwrXsIMWJvaCR9okJMdxcezS27DGGDnSFkK
QX3lwrwfbITV8VALzLlPeaJ6Ko6fy0LlyiKNWeSs4mR0wfhx9JNwoiueOWxmXxFP
UHR4lPSxogVRYZN1dQHVQnGqlvs4kC6MNuKC/w4ZphMM2EZTD2eCBr1s0r5UW7EX
NYA3qYiCKtOHAYrmFyEy3gdltDJOmTZDrGddqSjy0gHnyHApG/RlBS9V7Ol0V8tU
rojk031ulA2TLmgaffK/6SpfUUWpd7uhvsNJt7yABWEnA8EX/qqQza4MLronwrbM
RivhBUnzJgFQd8CfTBVymlHZCfcrtgauZ/xbrLFBy5RGA4AEoHcybaG5kFpUvUh5
tD0Ow6WKjmpMhosA+gXCXi8nGdVwdn4osBjDpYqRfGC8G6zcCF4f331LIxsCHiy8
AFlDZ8bs0xSypc+6nFPKly547WZEZiaLFKBNI9r+hEdtjMCqpHq3041QPnYDKb6i
BjkH3hgXhM2IEDCIY7SE8Eoatil4hAlAbHMI9LrZ+q9gJ+/EFuQ=
=K99p
-----END PGP SIGNATURE-----

--X8hkPNcuD643z8rern2blt7RRtBPavRLo--
