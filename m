From: Vagrant Cascadian <vagrantc@aikidev.net>
Subject: Re: [PATCH v2] ARM: dts: rockchip: temporarily remove emmc hs200 speed from rk3288-veyron-speedy.
Date: Tue, 18 Oct 2016 20:42:44 -0700
Message-ID: <878ttl9f7v.fsf@aikidev.net>
References: <87twd1vzc5.fsf@aikidev.net> <1476647383.3885.3.camel@paulk.fr> <12872023.2LumKfgYDl@diego> <1476824417.1031.9.camel@paulk.fr>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1476824417.1031.9.camel@paulk.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Kocialkowski <contact@paulk.fr>, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 2016-10-18, Paul Kocialkowski wrote:
> Le mardi 18 octobre 2016 =C3=A0 11:21 +0200, Heiko St=C3=BCbner a =C3=A9c=
rit=C2=A0:
>> Am Sonntag, 16. Oktober 2016, 21:49:43 schrieb Paul Kocialkowski:
>> > Le mardi 27 septembre 2016 =C3=A0 13:53 -0700, Vagrant Cascadian a =C3=
=A9crit :
>> > >=20
>> > > This essentially mimics what was done with rk3288-veyron-minnie in
>> > > commit 984926781122f034d5bc9962815d135b6c4a8e1d.
>> > >=20
>> > > The eMMC of the speedy Chromebook also appears to need the same tuni=
ng
>> > > workaround, as it frequently fails to recognize the eMMC without it.
>> >=20
>> > I have a device where (without this patch) eMMC sometimes fails, with:
>> > [=C2=A0=C2=A0=C2=A0=C2=A03.561010] dwmmc_rockchip ff0f0000.dwmmc: Succ=
essfully tuned phase to
>> > 175 [=C2=A0=C2=A0=C2=A0=C2=A03.571742] mmc2: new HS200 MMC card at add=
ress 0001
>> > [=C2=A0=C2=A0=C2=A0=C2=A03.571943] mmcblk2: mmc2:0001 HAG2e 14.7 GiB=
=C2=A0
>> > [=C2=A0=C2=A0=C2=A0=C2=A03.572026] mmcblk2boot0: mmc2:0001 HAG2e parti=
tion 1 4.00 MiB
>> > [=C2=A0=C2=A0=C2=A0=C2=A03.572107] mmcblk2boot1: mmc2:0001 HAG2e parti=
tion 2 4.00 MiB
>> > [=C2=A0=C2=A0=C2=A0=C2=A03.572181] mmcblk2rpmb: mmc2:0001 HAG2e partit=
ion 3 4.00 MiB
>> > [=C2=A0=C2=A0=C2=A0=C2=A03.685647] mmcblk2: error -110 transferring da=
ta, sector 0, nr 8, cmd
>> > response 0x900, card status 0x0

>> > And sometimes works, with:
>> > [=C2=A0=C2=A0=C2=A0=C2=A03.451058] dwmmc_rockchip ff0f0000.dwmmc: Succ=
essfully tuned phase to
>> > 176 [=C2=A0=C2=A0=C2=A0=C2=A03.491093] mmc2: new HS200 MMC card at add=
ress 0001
>> > [=C2=A0=C2=A0=C2=A0=C2=A03.491277] mmcblk2: mmc2:0001 HAG2e 14.7 GiB=
=C2=A0
>> > [=C2=A0=C2=A0=C2=A0=C2=A03.491345] mmcblk2boot0: mmc2:0001 HAG2e parti=
tion 1 4.00 MiB
>> > [=C2=A0=C2=A0=C2=A0=C2=A03.491409] mmcblk2boot1: mmc2:0001 HAG2e parti=
tion 2 4.00 MiB
>> > [=C2=A0=C2=A0=C2=A0=C2=A03.491474] mmcblk2rpmb: mmc2:0001 HAG2e partit=
ion 3 4.00 MiB
>> > [=C2=A0=C2=A0=C2=A0=C2=A03.493548]=C2=A0=C2=A0mmcblk2: p1 p2

This is similar behavior to my veyron-speedy. Here are several boot logs
From=20running 4.8.0-rc7, with some failures and some successes:

  https://cascadia.aikidev.net/~vagrant/veyron-speedy/


>> > However, with this change, it always fails, with:
>> > [=C2=A0=C2=A0=C2=A0=C2=A03.322129] mmc_host mmc2: Bus speed (slot 0) =
=3D 50000000Hz (slot req
>> > 52000000Hz, actual 50000000HZ div =3D 0) [=C2=A0=C2=A0=C2=A0=C2=A03.33=
3174] mmc2: error -110
>> > whilst initialising MMC card
>> >=20
>> > I don't have so much time to investigate this issue, but it's clear th=
at
>> > this patch doesn't fix the issue (and actually worsens it) for my devi=
ce.

Well, that makes things more complicated.


>> As discussed on IRC we now have varying reports of the emmc working or n=
ot=C2=A0
>> working with and without that patch applied. So it's not really a bandai=
d fix=C2=A0
>> and I've thus dropped this patch again.
>
> Thanks for dropping it! For the record, my eMMC shows up as:
> mmcblk2: mmc2:0001 HAG2e 14.7 GiB

Mine looks similar, although reporting as mmc0:

  [    3.166550] mmcblk0: mmc0:0001 HAG2e 14.7 GiB


> Maybe it could help to share what each tested device reports as eMMC mode=
l and
> associate that with the current behavior, in spite of getting a clearer i=
dea of
> what issue affects what model.

FWIW, I'm using a veyron-speedy with 4GB of ram, not sure what other
information might be useful to distinguish between different models.

On the bottom of the case, it claims to be a C201P. Near the serial,
it's marked as C201PA-DS02-LG.


live well,
  vagrant

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCgAGBQJYBuu0AAoJELeLgtSBS5G2PY0P/2Y9TGB784kgR3u1Csw5tH+v
kFjjTKNVy0lFuSIbRdrUvTorq5rMG+imDH/7PVwhOsznstdHiLDMlkVhKYmpkWZ9
h1/xN1yFXCRX49vzO0JJXz0JIyAkcyFHBkNSWkAAN3jv6/Wm46Ei6FdwRsc3xU49
Jmfui5fjwth6Bgc7C10z7IKSY5g8rnE+A1ri3YX5gGtmYMa8F498tI7ULT/Y59+p
Vlbaa2tELwRsi2DcGmZspqzvO6jsXeDP/nhZ7w98g7eX3VxdaAbYkYcVGChPIII1
QZeMbJzt8eKVNypB8jup5qNLcIcq1KDQsT2d68Ib5lpWGJP7RYr9uZPMB22d9hbx
pcA4ri3XvSZKvn0Qf8u4DJeNn1V+yoJdMtqx7tY6tC2O609rjv7UBkAUqJw8WDIA
oy3YlezhvseWS8U/2QroNvxvtBj9pAfNfrtP7BULj36TIOCkZdavuP7uBf/viK3f
DKt1KSepZaJFCzwAa17OGBbpaNqib4AJ4Juj+Jzz1I0Dbi7mc4D5jFkXSIxGt8FR
s/9Ys513JCl+goPK8ns9xxzHLAcc5PPKK6FKyAvQNgzfEIaiioX9vREdstKYvtZK
Pb4WL/pmz5hdto0J9a2jBAepnETPOnR3ZxbeNjjVl1YTUvIJnsyI+HHmayc87s2w
mvnbJPFZG2WGVd3PthOh
=cE5v
-----END PGP SIGNATURE-----
--=-=-=--
