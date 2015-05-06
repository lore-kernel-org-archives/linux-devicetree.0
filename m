From: Andrew <andrew@ncrmnt.org>
Subject: Re: Fwd: Re: [PATCH 2/2] ARM: mvebu: dts: Add dts file for DLink  DNS-327L
Date: Wed, 06 May 2015 16:39:59 +0300
Message-ID: <4b2d8ac976bad0cd6b8ea5fa5fa2cd16@mail.ncrmnt.org>
References: <b6534b962d2cf9d21cb72d43f19a6574@mail.ncrmnt.org>
 <552A6209.9040903@gmail.com>
 <cd7445f789f1082f464d464f77807f12@mail.ncrmnt.org>
 <20150412145857.GA14038@lunn.ch>
 <b172d775afa24cea69a9490f531c6b37@mail.ncrmnt.org>
 <20150412194735.GA27921@lunn.ch> <552BCFAA.2020109@free-electrons.com>
 <1ec8906f00468ca5a9fa227f8c83fe69@mail.ncrmnt.org>
 <55351569.7000307@free-electrons.com>
 <d28764ea5d0d5f4c2e5d3e9ca1d7217a@mail.ncrmnt.org>
 <55351898.60604@free-electrons.com>
 <4e7e91562aac6a260885bf2d12174060@mail.ncrmnt.org>
 <554A057D.3050007@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <554A057D.3050007@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Linus Walleij <linus.walleij@linaro.org>, Wolfram Sang <wsa@the-dreams.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>
List-Id: devicetree@vger.kernel.org

Gregory CLEMENT =D0=BF=D0=B8=D1=81=D0=B0=D0=BB 06.05.2015 15:13:
> Hi Andrew,
>=20
>=20
>>=20
>> Sorry for the long delay with testing, but here come the results.
>> I've rebased everything to 4.1-rc1
>>=20
>> 1. WFI + DeepIdle =3D> freeze after approx:
>>    * 1 hours and 30 minutes, first test
>>    * 3 hours and 40 minutes, second test
>> 2. WFI only (DeepIdle disabled via sysfs) =3D> Still alive after 13=20
>> hours
>> and counting
>=20
> Thanks for testing it. So, to sum-up, WFI+DeepIdle makes the board=20
> freeze
> after a few hours in 4.1-rc1 and 4.0 for sure. Are you aware of any=20
> version
> that did not freeze? It would help to know if it was a regression or=20
> not.

I've been observing it since 3.16 or so, when I first got mainline=20
running on
the box. So my guess would be that it is NOT a regression.

> Andrew Lunn did not report any issue on his 370RD however I will test
> it also on an other Armada 370 base board (a Mirabox) using the .conf=
ig
> you already sent.
>=20
> But what I expect is either a hardware issue, or a hardware=20
> configuration
> issue in U-Boot. We still rely a lot on the bootloader and I fear tha=
t
> we have some implicit assumptions.
>=20
> By the way do you have access on the bootloader sources or at least=20
> could
> you give us the U-boot version used?

AFAIK there's no GPL source drop for DNS-327L just yet. I'm using stock=
=20
uboot:

U-Boot 2009.08-00043-gcfe3b76-dirty (Dec 03 2012 - 15:27:58)
Marvell version: 1.1.2 NQ.DNS-327.01

Didn't risk to burn upstream u-boot, just in case the hardware required=
=20
any
special hacks to work.

> Thanks,
>=20
> Gregory
>=20
>=20
>=20
>>=20
>> The proper patchset will follow as soon as I figure out what change
>> broke
>> dns320l-daemon (The utility that speaks to weltrend mcu on ttyS1)
>> It was working on 3.18.6, on 3.19 and up - it writes data to the por=
t
>> (and mcu acks it),
>> but can't read any responses.
>>=20
>> Same thing happens to the python (pyserial inside) implementation of=
=20
>> the
>> fan-daemon:
>> https://github.com/martignlo/DNS-320L
>>=20

--=20
Regards,
Andrew
