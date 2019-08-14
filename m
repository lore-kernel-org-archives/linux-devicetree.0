Return-Path: <SRS0=hvZ9=WK=vger.kernel.org=devicetree-owner@kernel.org>
Received: from smtp.220.in.ua ([89.184.67.205]:58880 "EHLO smtp.220.in.ua"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729984AbfHNU6w (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 14 Aug 2019 16:58:52 -0400
Subject: Re: [PATCH v4 2/2] leds: add LED driver for EL15203000 board
References: <20190808203204.8614-1-oleg@kaa.org.ua>
 <20190808203204.8614-2-oleg@kaa.org.ua>
 <c2b006bb-2bb6-98b0-c907-190fd9fc41c7@gmail.com>
 <260f8b69-3f4a-d911-88f8-d6de59e79bc3@kaa.org.ua>
 <56fa6881-2af6-71ec-160c-7712075756be@gmail.com>
 <11f6da3b-860a-2e52-e4fa-2a650fd2407b@kaa.org.ua>
 <b0965dd8-2085-db4d-519d-8ea8a51f57a6@gmail.com>
 <e72f3669-1537-54ee-5ddd-ea77f9d13f07@kaa.org.ua>
 <4af185e2-95cf-4e21-f3f0-b35bd39441e3@gmail.com>
From: Oleh Kravchenko <oleg@kaa.org.ua>
Message-ID: <f61e7a4e-89dc-26f1-b4fb-aa83ec7f24dc@kaa.org.ua>
Date: Wed, 14 Aug 2019 23:58:31 +0300
MIME-Version: 1.0
In-Reply-To: <4af185e2-95cf-4e21-f3f0-b35bd39441e3@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="GtVYTrX15OJJRP5fbKQMvJOeYEhU69NaB"
Sender: devicetree-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, devicetree@vger.kernel.org, linux-leds@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--GtVYTrX15OJJRP5fbKQMvJOeYEhU69NaB
Content-Type: multipart/mixed; boundary="R7oHU1g8zQgMohrnskBCfs8Ss0HWmt3kC";
 protected-headers="v1"
From: Oleh Kravchenko <oleg@kaa.org.ua>
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 devicetree@vger.kernel.org, linux-leds@vger.kernel.org
Message-ID: <f61e7a4e-89dc-26f1-b4fb-aa83ec7f24dc@kaa.org.ua>
Subject: Re: [PATCH v4 2/2] leds: add LED driver for EL15203000 board
References: <20190808203204.8614-1-oleg@kaa.org.ua>
 <20190808203204.8614-2-oleg@kaa.org.ua>
 <c2b006bb-2bb6-98b0-c907-190fd9fc41c7@gmail.com>
 <260f8b69-3f4a-d911-88f8-d6de59e79bc3@kaa.org.ua>
 <56fa6881-2af6-71ec-160c-7712075756be@gmail.com>
 <11f6da3b-860a-2e52-e4fa-2a650fd2407b@kaa.org.ua>
 <b0965dd8-2085-db4d-519d-8ea8a51f57a6@gmail.com>
 <e72f3669-1537-54ee-5ddd-ea77f9d13f07@kaa.org.ua>
 <4af185e2-95cf-4e21-f3f0-b35bd39441e3@gmail.com>
In-Reply-To: <4af185e2-95cf-4e21-f3f0-b35bd39441e3@gmail.com>

--R7oHU1g8zQgMohrnskBCfs8Ss0HWmt3kC
Content-Type: text/plain; charset=utf-8
Content-Language: uk-UA
Content-Transfer-Encoding: quoted-printable

By the way,

14.08.19 23:53, Jacek Anaszewski =D0=BF=D0=B8=D1=88=D0=B5:
> On 8/14/19 10:16 PM, Oleh Kravchenko wrote:
>> Hello Jacek,
>>
>> 14.08.19 22:57, Jacek Anaszewski =D0=BF=D0=B8=D1=88=D0=B5:
>>>>>>
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
> OK, I didn't analyze the driver thoroughly enough.
> Now everything is clear to me. Patterns are triggered just
> by writing two-byte command.
>=20
>>>>>
>>>>> For the first two we could do without sequence duplication.
>>>>
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
>=20
> OK, so this is LED string. We would need to bend rules to make it
> appearing as a single LED class device, but allowing non-synchronous
> blinking of LEDs in the string.
>=20
>> - Second LED (Vending area) is highlight coffee cap
>>   * OFF
>>   * ON
>> - Third LED (Pipe) is actually virtual, because consists from 5 LEDs
>>   * OFF for all 5 LEDs
>>   * ON for all 5 LEDs
>>   * Cascade
>>   * Inverses cascade
>>   * Bounce
>>   * Inverses bounce

Full cycle takes 8 seconds too.
So actually it's splitted into 10 stages, each takes 800ms.

> Similarly in case of this one. I will give you a feedback on how
> to define the patterns within few days.
>=20

Take you time.

--=20
Best regards,
Oleh Kravchenko



--R7oHU1g8zQgMohrnskBCfs8Ss0HWmt3kC--

--GtVYTrX15OJJRP5fbKQMvJOeYEhU69NaB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEC/TM5t+2NenFhW0Q0xNJm20pl4wFAl1UdfcACgkQ0xNJm20p
l4wTYRAAnuyeM2RhtePIjmMjqjprwdokI8MJVZLfldB7OFNMjg60iBKSNH/AfTWz
T5RjYtrDptmtWNDl8jEDJmNKD4R0Vgg1hHZwS/I+RQs7KR6Ti3bHyJ58M3Xn8orM
a5K6cNbclUVqiG2N6VD3o4X3xzeWjs5PGeYmEg0p1GrYscPG/0DXHuHEfFLpVpWH
iVt20YOLQZxH6YZx8/GDPwtVW/+ztkt4KpwAty4Le1mPIMbpEYnW5thgdPxP9YcJ
rNEV7do/v6Vcx7ocD1ZEmBvravE+mwN1UEgwmp0lV31GFWaatMoHa9wpUW7iMgJ2
3DIEODnB1r4gFGMY5jViEIhGQSdOjO+rkip48huZV+78XLfIx2T70l76b8MutJvY
vmS+2juD9fg1ZgK393R+TMk0c4PAuv+HvciFWJeq9ZQCzoLR5ZZrwzdKcz/nk6kH
eC1Qn2WOrjRtATU6lDur0ubL1BRn2bLkaFO32lhYRawU9NJz+FzjDfB0nWyArA49
pabFjWnwXMsDWHp2+NODaekx7EUsSSzTZk5iWU7PeYDbbtlkajWTPuS2c6Umqf5G
Pmnf96aKYCLY7OhpEYuUGFPwCl1OJO9lzy3SM+dJG07qec64jA8IMtCfjUx5Vn+N
ZIVJDXiO/oh9JcPBY5pjoOTdsexlv8SqtF2arSlcWNSSsW9taas=
=v1le
-----END PGP SIGNATURE-----

--GtVYTrX15OJJRP5fbKQMvJOeYEhU69NaB--
