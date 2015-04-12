From: Andrew <andrew@ncrmnt.org>
Subject: Re: Fwd: Re: [PATCH 2/2] ARM: mvebu: dts: Add dts file for DLink  DNS-327L
Date: Sun, 12 Apr 2015 16:02:12 +0300
Message-ID: <cd7445f789f1082f464d464f77807f12@mail.ncrmnt.org>
References: <b6534b962d2cf9d21cb72d43f19a6574@mail.ncrmnt.org>
 <552A6209.9040903@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <552A6209.9040903@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Linus Walleij <linus.walleij@linaro.org>, Wolfram Sang <wsa@the-dreams.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>, Jason Cooper <jason@lakedaemon.net>
List-Id: devicetree@vger.kernel.org

Sebastian Hesselbarth =D0=BF=D0=B8=D1=81=D0=B0=D0=BB 12.04.2015 15:16:
> On 12.04.2015 13:43, Andrew wrote:
>> Sebastian Hesselbarth =D0=BF=D0=B8=D1=81=D0=B0=D0=BB 12.04.2015 14:2=
0:
>>> On 11.04.2015 22:29, Andrew Andrianov wrote:
>>>> Signed-off-by: Andrew Andrianov <andrew@ncrmnt.org>
> [...]
>>>> + * CONFIG_ARM_MVEBU_V7_CPUIDLE=3Dy causes hard freezes every 1-8=20
>>>> hours
>>>=20
>>> I don't think the dts is the right place for Linux issues.
>>=20
>> Not sure if that's a hardware weirdness or software issue (yet).
>> Just checked - this goblin is there in 4.0-rc7.
>=20
> I understand the issue, but still the dts is not the right place
> for this comment.

Okay, got it.
I'll file a bug about this issue to the the bugzilla. However something
tells me it might not be cpuidle, but D-link. This one's sounds nasty
and it has been around since 3.16.x. How could it go unnoticed?
Unfortunately I have no other armada-370 hardware to test it.

>=20
> [...]
>>>> +                marvell,nand-keep-config;
>>>> +                marvell,nand-enable-arbiter;
>>>> +                nand-on-flash-bbt;
>>>=20
>>> Do you know the ECC scheme used?
>>=20
>> Any hints on how to find it apart from dumping NAND controller=20
>> registers
>> from bootloader ?
>=20
> From the original bootlog:
>=20
> armada-nand armada-nand.0: Initialize HAL based NFC in 8bit mode with
> DMA Disabled using BCH 4bit ECC
>=20
> that translates into
>=20
> nand-ecc-strength =3D <4>;
> nand-ecc-step-size =3D <512>;

Thanks!

>=20
> [...]
>>>> +                /* Hardwired into stock bootloader */
>>>=20
>>> I don't get the comment above.
>>=20
>> The stock u-boot is hacked with a 'failsafe' kernel address.
>=20
> Ok, the above partition isn't passed by the bootloader on mtdparts
> cmdline, i.e. that is why you call it "hardwired" ?

As far I got - stock u-boot knows nothing about partition tables and
operates just on raw NAND offsets.

> Just remove the comment, actually the whole partition table is
> "hacked" into the stock bootloader.
>=20
>> If for some reason running the 'bootcmd' fails, it reads
>> 5MiBs from partition @ (5d00000 + 0x800) and tries to boot it.
>> There's no way to change this via environment, only by replacing
>> the bootloader.
>> Personally I'm more happy with a simpler partition table, but I
>> guess upstream should be oriented towards the stock bootloader.
>=20
> Yeah, leave the original partition table. Any other, smarter
> bootloader can replace it.
>=20
> [...]
>> Thanks for the review, I'll resubmit the fixed patchset shortly.
>> Please disregard my [PATCH v2] messages. I've send them the moment=20
>> before
>> I noticed your email and review.
>=20
> Please always leave the Cc-list in place.

Sorry, I had to resend that email twice. First one to you, next to the=20
list
and others. I'm quite new to LKML so still playing with proper email=20
setup.

> And you should relax and leave patches there a day or two (or three).
> Not everybody is reading patches immediately.
>=20
> We are in no hurry, the current merge window is already closed,
> the new one is 6 weeks away.
>=20
> Sebastian

I only have a chance to play with the hardware at the weekend, since th=
e
spare dns327l is at the country house, so I try to send fixes as soon a=
s
get feedback while I can quickly test it.

--=20
Regards,
Andrew
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
