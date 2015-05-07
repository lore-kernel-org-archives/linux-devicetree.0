From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH 2/3 v8] mailbox: Enable BCM2835 mailbox support
Date: Thu, 07 May 2015 12:54:20 -0700
Message-ID: <87mw1grwnn.fsf@eliezer.anholt.net>
References: <1430857666-18877-1-git-send-email-eric@anholt.net> <1430857666-18877-2-git-send-email-eric@anholt.net> <554BA0B7.8040600@tronnes.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <554BA0B7.8040600@tronnes.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>, linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Noralf Tr=C3=B8nnes <noralf@tronnes.org> writes:

> Den 05.05.2015 22:27, skrev Eric Anholt:
>> From: Lubomir Rintel <lkundrak@v3.sk>
>>
>> This mailbox driver provides a single mailbox channel to write 32-bit
>> values to the VPU and get a 32-bit response.  The Raspberry Pi
>> firmware uses this mailbox channel to implement firmware calls, while
>> Roku 2 (despite being derived from the same firmware tree) doesn't.
>>
>> The driver was originally submitted by Lubomir, based on the
>> out-of-tree 2708 mailbox driver.  Eric Anholt fixed it up for
>> upstreaming, with the major functional change being that it now has no
>> notion of multiple channels (since that is a firmware-dependent
>> concept) and instead the raspberrypi-firmware driver will do that
>> bit-twiddling in its own messages.
> ...
>> +static struct platform_driver bcm2835_mbox_driver =3D {
>> +	.driver =3D {
>> +		.name =3D "bcm2835-mbox",
>> +		.owner =3D THIS_MODULE,
>> +		.of_match_table =3D bcm2835_mbox_of_match,
>> +	},
>> +	.probe		=3D bcm2835_mbox_probe,
>> +	.remove		=3D bcm2835_mbox_remove,
>> +};
>> +module_platform_driver(bcm2835_mbox_driver);
>
> I have tested this driver and the firmware driver booting directly
> from the VideoCore bootloader (no uboot).
> The mailbox driver loads too late to turn on USB power:

Yeah, I have a patch on my branches that returns -EPROBE_DEFER when
trying to get a power domain and not finding the provider.  It was
rejected by the maintainers in favor of a proposed solution whose
description I didn't quite follow.

> This silences the warning:
> struct raspberrypi_power_domain raspberrypi_power_domain_usb =3D {
>      .base =3D {
>          .power_on_latency_ns =3D 600000000,

Oh, nice.  Thanks!

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJVS8LsAAoJELXWKTbR/J7oat4P/jLZGA7Rx1DtQaAUUm3fMwq/
ax8C6lvDDh3XUa1AQRa4DlNn/5zhlzBzcGLg5R+XbQwNFfMDKunnpcMUt4dBvNxi
Go7xbz2eAq3u6I3YbTG5pPoG0bO3GxHpSsKcZlWjr04w1Xwvv6hYG3+39AhjfykP
yH9lS4Ax9edq2MfMXkkBpRzXAr2dolsqchV0G11J0uSYwwpvR43h18J8ZqajW805
Qw21TvSIfB1U4gAQi91YRMtrFIC2Yl31abYQFKAI3IV+nfWEgpNKctJrIVVAz8vZ
WOMJ5gbFN8IS72n4AfZPUf4dOIFCEDln7GDt7PjF7VnLsppIBN3vx8Wv9f9oqZXa
X1ihJmgxeC65FKwjvxrD7AJiqerlj2HY/D8j1N3ffpOx8gPEgSn0wb+r3VH7qE1I
MTAmAFLTWFcT8kata9q2Wipr2Xwu96F6aBZUFmCZyawWbiz5Hwr0UKGNHCevb11H
/SVXo45fq2LAGUkQr/QikQ+bcR/2WCKiFlpU5mZSybv34ghMTSuKAlErlarHaQ0U
g/R0oUuvOIvsy7Uzxhny6+y3V8tq9Meqi6POFQ7XkW96UXSDiGjyrSo4bqpt9CNN
yBKcpzJoETicxI4edd08WcGgXreeJ3epNNrFmcyyhUaaomnSWTv3wHgHANIepmW2
xIDP9hnowWxBShXnKWLs
=MMva
-----END PGP SIGNATURE-----
--=-=-=--
