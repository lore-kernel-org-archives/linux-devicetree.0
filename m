From: Eric Anholt <eric@anholt.net>
Subject: Re: Re: [PATCH 2/3 v8] mailbox: Enable BCM2835 mailbox support
Date: Fri, 08 May 2015 12:19:46 -0700
Message-ID: <87a8xenagd.fsf@eliezer.anholt.net>
References: <1430857666-18877-1-git-send-email-eric@anholt.net> <554BA0B7.8040600@tronnes.org> <87mw1grwnn.fsf@eliezer.anholt.net> <2464203.68HkYCAlx7@kongar>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2464203.68HkYCAlx7@kongar>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexander Stein <alexanders83@web.de>, linux-rpi-kernel@lists.infradead.org
Cc: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Alexander Stein <alexanders83@web.de> writes:

> On Thursday 07 May 2015, 12:54:20 wrote Eric Anholt:
>> Noralf Tr=C3=B8nnes <noralf@tronnes.org> writes:
>>=20
>> > Den 05.05.2015 22:27, skrev Eric Anholt:
>> >> From: Lubomir Rintel <lkundrak@v3.sk>
>> >>
>> >> This mailbox driver provides a single mailbox channel to write 32-bit
>> >> values to the VPU and get a 32-bit response.  The Raspberry Pi
>> >> firmware uses this mailbox channel to implement firmware calls, while
>> >> Roku 2 (despite being derived from the same firmware tree) doesn't.
>> >>
>> >> The driver was originally submitted by Lubomir, based on the
>> >> out-of-tree 2708 mailbox driver.  Eric Anholt fixed it up for
>> >> upstreaming, with the major functional change being that it now has no
>> >> notion of multiple channels (since that is a firmware-dependent
>> >> concept) and instead the raspberrypi-firmware driver will do that
>> >> bit-twiddling in its own messages.
>> > ...
>> >> +static struct platform_driver bcm2835_mbox_driver =3D {
>> >> +	.driver =3D {
>> >> +		.name =3D "bcm2835-mbox",
>> >> +		.owner =3D THIS_MODULE,
>> >> +		.of_match_table =3D bcm2835_mbox_of_match,
>> >> +	},
>> >> +	.probe		=3D bcm2835_mbox_probe,
>> >> +	.remove		=3D bcm2835_mbox_remove,
>> >> +};
>> >> +module_platform_driver(bcm2835_mbox_driver);
>> >
>> > I have tested this driver and the firmware driver booting directly
>> > from the VideoCore bootloader (no uboot).
>> > The mailbox driver loads too late to turn on USB power:
>>=20
>> Yeah, I have a patch on my branches that returns -EPROBE_DEFER when
>> trying to get a power domain and not finding the provider.  It was
>> rejected by the maintainers in favor of a proposed solution whose
>> description I didn't quite follow.
>
> Do you have a link for this thread?

https://lkml.org/lkml/2015/3/11/483

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJVTQxTAAoJELXWKTbR/J7o86UP/jNr2iWWBrd3KCHJQk177Sqb
FVb73ld0MeW3DDnDNCnNaM2lJDHIYKXtroiDzsfyiHq22GdJP19NteHQ2gqJ24zw
pRr5m0u7JfjTlQG7RcvMDc8a7VFbjumV3gbLp0Df0ADvhTnRgE4IZF79rz8e3wT8
fmqCe1r+GmA+UXPcuvDVs5pcTRQw2Zq2dzBysMk8Zx0+aZncorpYgPioS7ogpHut
nMQ2ClEzQG8ToNlPnXU2PWJtJg4/WnyW6pYZMKR+BNsl11604Yo+LkmXm76RyYNo
t1RN2DCWtbv9IhibDZX5BJXmvgWN+9wYDzm2U+5xKONNjtQEGW+nKxizKdsJaC5u
72hGjSRf8M5wPVDZ94k28Fgu7O1eDgZ/jMJg0L+Wy6M4v20AgH2IZhVvRSk4b+cP
Z2c8JTy/vvNzHrAj5h6u+wU3/6aCT9FoGZUV9mDsYW+yIqO7Vuw44bfcUQH/jhwk
pPAY7zdV5BfscPaBPhUzMcc85r6jZW9Y2b+mHTVd/OwZjtMH8/mBdvI7Uyc55fNC
cEB/s66ow47M/iYVSuc1QCd1i76nAzmiLEVreO8GhSgRmeDJeKjWmdolTLnqdsSb
K38hnaxVm6UsjdJERs7dlyNy8cOxKzp1TNbH4LE+ub6qlOOu+xn3I1Jm4JA+w0yJ
rsBOpKeyGFBr3rnN4a6X
=Kn/6
-----END PGP SIGNATURE-----
--=-=-=--
