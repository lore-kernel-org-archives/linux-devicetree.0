From: Alexander Stein <alexanders83@web.de>
Subject: Re: Re: [PATCH 2/3 v8] mailbox: Enable BCM2835 mailbox support
Date: Fri, 08 May 2015 10:33:53 +0200
Message-ID: <2464203.68HkYCAlx7@kongar>
References: <1430857666-18877-1-git-send-email-eric@anholt.net> <554BA0B7.8040600@tronnes.org> <87mw1grwnn.fsf@eliezer.anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87mw1grwnn.fsf@eliezer.anholt.net>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-rpi-kernel@lists.infradead.org
Cc: Eric Anholt <eric@anholt.net>, Noralf =?ISO-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thursday 07 May 2015, 12:54:20 wrote Eric Anholt:
> Noralf Tr=C3=B8nnes <noralf@tronnes.org> writes:
>=20
> > Den 05.05.2015 22:27, skrev Eric Anholt:
> >> From: Lubomir Rintel <lkundrak@v3.sk>
> >>
> >> This mailbox driver provides a single mailbox channel to write 32-=
bit
> >> values to the VPU and get a 32-bit response.  The Raspberry Pi
> >> firmware uses this mailbox channel to implement firmware calls, wh=
ile
> >> Roku 2 (despite being derived from the same firmware tree) doesn't=
=2E
> >>
> >> The driver was originally submitted by Lubomir, based on the
> >> out-of-tree 2708 mailbox driver.  Eric Anholt fixed it up for
> >> upstreaming, with the major functional change being that it now ha=
s no
> >> notion of multiple channels (since that is a firmware-dependent
> >> concept) and instead the raspberrypi-firmware driver will do that
> >> bit-twiddling in its own messages.
> > ...
> >> +static struct platform_driver bcm2835_mbox_driver =3D {
> >> +	.driver =3D {
> >> +		.name =3D "bcm2835-mbox",
> >> +		.owner =3D THIS_MODULE,
> >> +		.of_match_table =3D bcm2835_mbox_of_match,
> >> +	},
> >> +	.probe		=3D bcm2835_mbox_probe,
> >> +	.remove		=3D bcm2835_mbox_remove,
> >> +};
> >> +module_platform_driver(bcm2835_mbox_driver);
> >
> > I have tested this driver and the firmware driver booting directly
> > from the VideoCore bootloader (no uboot).
> > The mailbox driver loads too late to turn on USB power:
>=20
> Yeah, I have a patch on my branches that returns -EPROBE_DEFER when
> trying to get a power domain and not finding the provider.  It was
> rejected by the maintainers in favor of a proposed solution whose
> description I didn't quite follow.

Do you have a link for this thread?

> > This silences the warning:
> > struct raspberrypi_power_domain raspberrypi_power_domain_usb =3D {
> >      .base =3D {
> >          .power_on_latency_ns =3D 600000000,
>=20
> Oh, nice.  Thanks!

Well, Using a timeout for dependencies seems odd to me.

Regards,
Alexander
