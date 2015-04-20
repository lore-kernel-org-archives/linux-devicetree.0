From: Andrew <andrew@ncrmnt.org>
Subject: Re: Fwd: Re: [PATCH 2/2] ARM: mvebu: dts: Add dts file for DLink  DNS-327L
Date: Mon, 20 Apr 2015 18:15:46 +0300
Message-ID: <d28764ea5d0d5f4c2e5d3e9ca1d7217a@mail.ncrmnt.org>
References: <b6534b962d2cf9d21cb72d43f19a6574@mail.ncrmnt.org>
 <552A6209.9040903@gmail.com>
 <cd7445f789f1082f464d464f77807f12@mail.ncrmnt.org>
 <20150412145857.GA14038@lunn.ch>
 <b172d775afa24cea69a9490f531c6b37@mail.ncrmnt.org>
 <20150412194735.GA27921@lunn.ch> <552BCFAA.2020109@free-electrons.com>
 <1ec8906f00468ca5a9fa227f8c83fe69@mail.ncrmnt.org>
 <55351569.7000307@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <55351569.7000307@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Linus Walleij <linus.walleij@linaro.org>, Wolfram Sang <wsa@the-dreams.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>
List-Id: devicetree@vger.kernel.org

Gregory CLEMENT =D0=BF=D0=B8=D1=81=D0=B0=D0=BB 20.04.2015 18:04:
> Hi Andrew,
>=20
> On 13/04/2015 16:32, Andrew wrote:
>> Gregory CLEMENT =D0=BF=D0=B8=D1=81=D0=B0=D0=BB 13.04.2015 17:16:
>>> Hi Andrew(s),
>>>=20
>>> On 12/04/2015 21:47, Andrew Lunn wrote:
>>>> On Sun, Apr 12, 2015 at 06:41:31PM +0300, Andrew wrote:
>>>>> Andrew Lunn ?????????? 12.04.2015 17:58:
>>>>>>> Okay, got it.
>>>>>>> I'll file a bug about this issue to the the bugzilla. However
>>>>>>> something
>>>>>>> tells me it might not be cpuidle, but D-link. This one's sounds
>>>>>>> nasty
>>>>>>> and it has been around since 3.16.x. How could it go unnoticed?
>>>>>>> Unfortunately I have no other armada-370 hardware to test it.
>>>>>>=20
>>>>>> Hi Andrew
>>>>>>=20
>>>>>> A few of us here do have hardware to test with. Please give a
>>>>>> detailed
>>>>>> description of how you reproduce the issue, and your kernel
>>>>>> configuration, if different from mvebu_v7_defconfig, or
>>>>>> multi_v7_defconfig.
>>>>>>=20
>>>>>> 	Thanks
>>>>>> 		Andrew
>>>>>=20
>>>>>=20
>>>>> arch/arm/configs/mvebu_v7_defconfig has
>>>>> CONFIG_ARM_MVEBU_V7_CPUIDLE=3Dy,
>>>>> so it should be sufficient to reproduce the issue. I first
>>>>> encountered
>>>>> this issue using that very config and observed it on 2 DNS-327L=20
>>>>> boxes
>>>>> I
>>>>> own.
>>>>>=20
>>>>> All I have to do to trigger the bug - enable cpuidle driver and l=
et
>>>>> the box
>>>>> sit for some 4-12 hours, till it hard-freezes. If wdt is enabled =
-
>>>>> wdt reboot
>>>>> will happen.
>>>>=20
>>>> That simple! Well i've got a 370RD which has been sat mostly idle=20
>>>> for
>>>> weeks, using the mvebu_v7_defconfig, with a few addition things=20
>>>> turned
>>>> on for testing the Ethernet switch on the board. I've not had that
>>>> lockup.
>>>>=20
>>>> One thing you can try to narrow it down is the disable the second=20
>>>> idle
>>>> mode. Take a look at armada370_idle_driver. Keep the
>>>> ARM_CPUIDLE_WFI_STATE but disable the "Deep Idle" state.
>>>=20
>>> Actually you don't have to modify the kernel you can setup the CPU=20
>>> idle
>>> level
>>> you want at runtime:
>>>=20
>>> echo 1 > /sys/devices/system/cpu/cpu0/cpuidle/state1/disable
>>>=20
>>> will disable the state1. By doing this on Armada 370 then you
>>> will only use the WFI state.
>>>=20
>>> Do you still have this issue on v4.0-rc7?
>>=20
>> Yep, I can confirm having this issue on 4.0-rc7. I will only be able=
=20
>> to
>> test if
>> disabling state1 fixes it the next weekend.
>=20
> Did you manage to do some test this week-end?
>=20
> Thanks,
>=20
> Gregory
>=20
>=20
>>=20
>>>=20
>>> Thanks,
>>>=20
>>> Gregory
>>>=20
>>>=20
>>>=20
>>>>=20
>>>>       Andrew
>>>>=20
>>=20

Sorry, I've been away for the weekend but managed to take the
hardware home on my way back. I'll rig it for a long test today
in the evening. Expect some test results somewhere around Wednesday.
(Guess it doesn't count unless it's stable for 24+ hours).

--=20
Regards,
Andrew
