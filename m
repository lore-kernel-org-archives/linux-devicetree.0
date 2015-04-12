From: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: Fwd: Re: [PATCH 2/2] ARM: mvebu: dts: Add dts file for DLink
 DNS-327L
Date: Sun, 12 Apr 2015 14:16:09 +0200
Message-ID: <552A6209.9040903@gmail.com>
References: <b6534b962d2cf9d21cb72d43f19a6574@mail.ncrmnt.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <b6534b962d2cf9d21cb72d43f19a6574@mail.ncrmnt.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Andrew <andrew@ncrmnt.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Linus Walleij <linus.walleij@linaro.org>, Wolfram Sang <wsa@the-dreams.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>, Jason Cooper <jason@lakedaemon.net>
List-Id: devicetree@vger.kernel.org

On 12.04.2015 13:43, Andrew wrote:
> Sebastian Hesselbarth =D0=BF=D0=B8=D1=81=D0=B0=D0=BB 12.04.2015 14:20=
:
>> On 11.04.2015 22:29, Andrew Andrianov wrote:
>>> Signed-off-by: Andrew Andrianov <andrew@ncrmnt.org>
[...]
>>> + * CONFIG_ARM_MVEBU_V7_CPUIDLE=3Dy causes hard freezes every 1-8 h=
ours
>>
>> I don't think the dts is the right place for Linux issues.
>
> Not sure if that's a hardware weirdness or software issue (yet).
> Just checked - this goblin is there in 4.0-rc7.

I understand the issue, but still the dts is not the right place
for this comment.

[...]
>>> +                marvell,nand-keep-config;
>>> +                marvell,nand-enable-arbiter;
>>> +                nand-on-flash-bbt;
>>
>> Do you know the ECC scheme used?
>
> Any hints on how to find it apart from dumping NAND controller regist=
ers
> from bootloader ?

 From the original bootlog:

armada-nand armada-nand.0: Initialize HAL based NFC in 8bit mode with=20
DMA Disabled using BCH 4bit ECC

that translates into

nand-ecc-strength =3D <4>;
nand-ecc-step-size =3D <512>;

[...]
>>> +                /* Hardwired into stock bootloader */
>>
>> I don't get the comment above.
>
> The stock u-boot is hacked with a 'failsafe' kernel address.

Ok, the above partition isn't passed by the bootloader on mtdparts
cmdline, i.e. that is why you call it "hardwired" ?

Just remove the comment, actually the whole partition table is
"hacked" into the stock bootloader.

> If for some reason running the 'bootcmd' fails, it reads
> 5MiBs from partition @ (5d00000 + 0x800) and tries to boot it.
> There's no way to change this via environment, only by replacing
> the bootloader.
> Personally I'm more happy with a simpler partition table, but I
> guess upstream should be oriented towards the stock bootloader.

Yeah, leave the original partition table. Any other, smarter
bootloader can replace it.

[...]
> Thanks for the review, I'll resubmit the fixed patchset shortly.
> Please disregard my [PATCH v2] messages. I've send them the moment be=
fore
> I noticed your email and review.

Please always leave the Cc-list in place.

And you should relax and leave patches there a day or two (or three).
Not everybody is reading patches immediately.

We are in no hurry, the current merge window is already closed,
the new one is 6 weeks away.

Sebastian
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
