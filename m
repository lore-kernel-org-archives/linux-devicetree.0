Return-Path: <SRS0=UOXp=WQ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from smtp.220.in.ua ([89.184.67.205]:60096 "EHLO smtp.220.in.ua"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726049AbfHTHqp (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 20 Aug 2019 03:46:45 -0400
Subject: Re: [PATCH v4 2/2] leds: add LED driver for EL15203000 board
References: <20190808203204.8614-1-oleg@kaa.org.ua>
 <20190808203204.8614-2-oleg@kaa.org.ua>
 <c2b006bb-2bb6-98b0-c907-190fd9fc41c7@gmail.com>
 <260f8b69-3f4a-d911-88f8-d6de59e79bc3@kaa.org.ua>
 <56fa6881-2af6-71ec-160c-7712075756be@gmail.com>
 <11f6da3b-860a-2e52-e4fa-2a650fd2407b@kaa.org.ua>
 <b0965dd8-2085-db4d-519d-8ea8a51f57a6@gmail.com>
 <e72f3669-1537-54ee-5ddd-ea77f9d13f07@kaa.org.ua>
 <20190817150246.GB18381@amd>
From: Oleh Kravchenko <oleg@kaa.org.ua>
Message-ID: <360390b3-c6d4-52e2-287c-8c90369a5c5c@kaa.org.ua>
Date: Tue, 20 Aug 2019 10:46:30 +0300
MIME-Version: 1.0
In-Reply-To: <20190817150246.GB18381@amd>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="2bdeSvOGPSt5nZ1tykwQAcOd1cf4H7cdf"
Sender: devicetree-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, devicetree@vger.kernel.org, linux-leds@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--2bdeSvOGPSt5nZ1tykwQAcOd1cf4H7cdf
Content-Type: multipart/mixed; boundary="GTBdxFSP5F1pfDW1WhYRK1Cce9ALHVRce";
 protected-headers="v1"
From: Oleh Kravchenko <oleg@kaa.org.ua>
To: Pavel Machek <pavel@ucw.cz>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 devicetree@vger.kernel.org, linux-leds@vger.kernel.org
Message-ID: <360390b3-c6d4-52e2-287c-8c90369a5c5c@kaa.org.ua>
Subject: Re: [PATCH v4 2/2] leds: add LED driver for EL15203000 board
References: <20190808203204.8614-1-oleg@kaa.org.ua>
 <20190808203204.8614-2-oleg@kaa.org.ua>
 <c2b006bb-2bb6-98b0-c907-190fd9fc41c7@gmail.com>
 <260f8b69-3f4a-d911-88f8-d6de59e79bc3@kaa.org.ua>
 <56fa6881-2af6-71ec-160c-7712075756be@gmail.com>
 <11f6da3b-860a-2e52-e4fa-2a650fd2407b@kaa.org.ua>
 <b0965dd8-2085-db4d-519d-8ea8a51f57a6@gmail.com>
 <e72f3669-1537-54ee-5ddd-ea77f9d13f07@kaa.org.ua>
 <20190817150246.GB18381@amd>
In-Reply-To: <20190817150246.GB18381@amd>

--GTBdxFSP5F1pfDW1WhYRK1Cce9ALHVRce
Content-Type: text/plain; charset=UTF-8
Content-Language: uk-UA
Content-Transfer-Encoding: quoted-printable

Hello Pavel,

17.08.19 18:02, Pavel Machek =D0=BF=D0=B8=D1=88=D0=B5:
> Hi!
>=20
>>>>>> All pattern is predefined, you can't change them at all.
>>>>>> I just tried to describe real things what happened in LED board.
>>>>>> It's ticks every 800 milliseconds for Pipe LEDs.
>>>>>
>>>>> It makes me wonder how you figured out the values? If you have
>>>>> a documentation for this controller, could you share how the patter=
n
>>>>> settings are documented?
>>>>
>>>> I saw the code of firmware.
>>>> Not sure if I can find any documentation for it right now.
>>>
>>> Have you tried to alter the values? Or check what happens when
>>> the duplication is removed?
>>
>> What do you mean alter? It doesn't make any sense.
>> Board is accepts only brightness level from '0' to '5'.
>> I'm really confused :-)
>=20
> For the record, what you did seems ok to me.

Thanks :)
=20
>>>> Ok, I will reduce it.
>>>
>>> Please hold on for a while. I will have some more remarks to the driv=
er,
>>> just collecting missing info for now to gain more complete view on th=
is
>>> device.
>>
>> Here is the full story:
>>
>> EL15203000 LEDs board (aka RED LEDs board, because it has only RED LED=
s).
>> It's provide access to 3 LEDs:
>>
>> - First LED (Screen) is a light tube around big 21" screen
>>   It's have 3 brightness levels:
>>   * OFF
>>   * ON
>>   * Breathing mode (8 seconds full cycle)
>> - Second LED (Vending area) is highlight coffee cap
>>   * OFF
>>   * ON
>=20
> Again, this is ok.
>=20
>> - Third LED (Pipe) is actually virtual, because consists from 5 LEDs
>>   * OFF for all 5 LEDs
>>   * ON for all 5 LEDs
>>   * Cascade
>>   * Inverses cascade
>>   * Bounce
>>   * Inverses bounce
>=20
> But having one virtual LED that is really five LEDs scares me a tiny
> bit. But I guess its ok for your case...
>=20
> Best regards,
> 									Pavel
>=20
>=20
>=20
>=20

--=20
Best regards,
Oleh Kravchenko



--GTBdxFSP5F1pfDW1WhYRK1Cce9ALHVRce--

--2bdeSvOGPSt5nZ1tykwQAcOd1cf4H7cdf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEC/TM5t+2NenFhW0Q0xNJm20pl4wFAl1bpVoACgkQ0xNJm20p
l4xJ1hAAiNQQZ8XTMpjVn+DpZbomH9EV00/TcHTx9OsLvY8/usqtVshfeWUT//TH
EEr65GYM/T1/PoeAlrVc4MRFBznILt3weXp4K4WRWe0MdXm1gG5yJ6OUEAYj071c
OhtWmPWW5b6JeNmYp7/kSdnlV/Gi1medj4mYaXStiZ2RtlB0Tyv4Y3Ycfn6tpBQG
S+GC72tP7CiG50vPbntcul2l0082Z0E3P5u8G9QxIyPryrJjsizKtmZuNDWAxxZ3
oOjOsYQK+b2LqcPtgyVRktGlE5OeWpgnaBggjl7kR+dInmvc0Adv93UIg1IhD+RV
cOpNCPVSUPWQsogWqWDjG2jMFLJQ9pdkZi6iB3kXH10hyuJa+0qPYI5nAmcoOJSg
d47jBgmehbiPChuZP/u7T1C1OxB6lOuW8U6BYBLVAg8oUPfz+1CSCXBT4hOTUbdm
4lIh2acpBfmxCr3UOls8A40GOyqJe1N5lEZZ5gKyvEJqLh7OlO17t0ornQm7xa2X
SElfe1E7gK4byv4zYDCHZueNdCw2TP0AUxKSYGuVEFrR4AV7XRRWBBTZbcAueszO
eZj0K+EqmKZBqv1Fo/DoxDiM9oK2CilNfni91HeLqs8FLQGQSPOkj75ycrba2uBx
77AEmfkBIZExeHtKgvJIdqgAEaOfcnIPATud892hV/+S5USra8k=
=Q2VZ
-----END PGP SIGNATURE-----

--2bdeSvOGPSt5nZ1tykwQAcOd1cf4H7cdf--
