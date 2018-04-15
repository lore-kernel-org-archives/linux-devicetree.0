Return-Path: <SRS0=IdnT=HE=gmail.com=jacek.anaszewski@kernel.org>
Subject: Re: Standardized LED function names [was: Re: [PATCH v3] leds: add
 LED driver for CR0014114 board]
References: <20180312155829.12365-1-oleg@kaa.org.ua>
 <20180313124548.12074-1-oleg@kaa.org.ua>
 <20180318124925.i4yuxigkfu6spv26@rob-hp-laptop>
 <fbe35381-45a6-7084-c1f9-5ede1eb88bab@gmail.com>
 <CAL_JsqKdCa_FV13fEw8V-avojUCN_PB+2djsnCsGDH-5qAOEcA@mail.gmail.com>
 <f8cd9de6-839b-b874-40af-d84b9f7de296@gmail.com>
 <CAL_JsqKOB8tB20hL5WxbEsryCVaDEs=C=U-z5p6BqQCEMskPGg@mail.gmail.com>
 <486709a4-027a-8995-7d6f-217d3d029786@gmail.com> <20180415161541.GE10802@amd>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <36632143-c218-dc10-0fde-a9e7627ab666@gmail.com>
Date: Sun, 15 Apr 2018 20:30:37 +0200
MIME-Version: 1.0
In-Reply-To: <20180415161541.GE10802@amd>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="kPpu9J8VRtSwj9QjOal7ArD7qOlipTLk6"
To: Pavel Machek <pavel@ucw.cz>
Cc: Rob Herring <robh@kernel.org>, Oleh Kravchenko <oleg@kaa.org.ua>, devicetree@vger.kernel.org, Linux LED Subsystem <linux-leds@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--kPpu9J8VRtSwj9QjOal7ArD7qOlipTLk6
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 04/15/2018 06:15 PM, Pavel Machek wrote:
> Hi!
>=20
>>>> A case I care about is I have a family of boards that all have a
>>>> common defined set of 4 LEDs. They could be driven by anything, but =
I
>>>> want the same interface presented to userspace across boards.
>>>> "
>>>
>>> Yes, and "label" should provide me with that ability as the context
>>> was the practice of putting the controller name in the label.
>>
>> Exactly. There are two options:
>>
>> 1.
>> - label format : "<color>:<function"
>> 2.
>> - label format : "<function>"
>> - new "color" DT property
>=20
> We should provide compatibility here.
>=20
> So we should really have new "color" property, and probably new
> "function" property, too.
>=20
>> The changes in dts files would have to be accompanied by changes in
>> DT parsing part of LED class drivers. Also, I wonder if it wouldn't
>> make sense to add config option to choose between old and new LED
>> naming convention to avoid userspace breakage.
>=20
> Both old and new kernels are expected to be working with both old and
> new dts...
>=20
> And having config option choosing userland interfaces would not be nice=
=2E

Agreed. So the naming pattern will be chosen basing on whether
there is 'label' property available or the 'function' and 'color' ones.

>> It would allow to use dts files with old style labels with
>> newer kernels. The LED class device names would differ like below:
>>
>> Old style name (current):
>> 	/sys/class/leds/netxbig:red:power
>>
>> New style name:
>> 	/sys/class/leds/red:power (we could also think of dropping
>>                                    color from name and adding sysfs
>>                                    file for it)
>=20
> I believe color needs to stay: it is common to have "green:battery"
> for "battery ok" and "yellow:battery" for charging, for
> example. Notification LED has three channels, "red", "green",
> "blue"...

I don't have a strong opinion on that, so ack.

> Thanks for looking into this,

Thanks for the feedback. I'll try to come up with an initial
patchset when I'll find a moment.

--=20
Best regards,
Jacek Anaszewski


--kPpu9J8VRtSwj9QjOal7ArD7qOlipTLk6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJa05pOAAoJEL1qUBy3i3wmEt8P/1q6dzIibjrra2ajmLi5CbI0
0q+Lne5jVSpWmIwE+YCgil+fnlgXKdRlJv2xbfORCD4Tg+hfEkAqc8m3G9rldatm
U5b+T6pKnavYEsuAXUaCLpQU7oS/4WoNHgMO4Q1kVwsTaI+EDTU+bjvLIFwUtjxk
/gDZnT5Yrw4xbrmRr30wMOyhdj4vBU2bdmki6IqptCRw3m4t+MJla5AhRKFI3eys
C32CIAFzNb3Dhek2Tm16mhTiHbbhQYgXNi7rpP+q+BTCfBM0ALgt3GLnT/1+vWwQ
ewhpuw+NfgBs0Ufq09E+Ye6jIPt8W9geyJIIGWuv28a6m2SEJr/t63853voUeWt9
x/wav6vBoq0XuhclBwvN6CsU78YbCLx9xUrPOjcrC8ENDp7eM1SUxH4mofrfmlJ6
buEt3zwNh/P2PWSK4urNGAlzcjR4nFaNdWETshjELhWdn/knqKTsxAl8YjLv4N3y
muP32Mb4JGCTX9OJpCy5cIsapLIjtwn+dAioUV2bCeUy0Kd16j2SGu6/OuxoWWYL
DJPkYUsEoZQ4Jw3AaW/Axzl5uUkKIP7XM/swv+Q9G1Kz7/r94hGw5eO6JqcpGapC
35OkIVEQw5FlZ+AFPlr2rpUU25zprRfFQd3DHky8tqC7ltPGk4v0bPv6LhsH3ffC
aGQr2dcA3oUjON4xGnvz
=mc0z
-----END PGP SIGNATURE-----

--kPpu9J8VRtSwj9QjOal7ArD7qOlipTLk6--
