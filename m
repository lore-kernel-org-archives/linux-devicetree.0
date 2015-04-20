From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: Re: Fwd: Re: [PATCH 2/2] ARM: mvebu: dts: Add dts file for DLink
  DNS-327L
Date: Mon, 20 Apr 2015 17:17:44 +0200
Message-ID: <55351898.60604@free-electrons.com>
References: <b6534b962d2cf9d21cb72d43f19a6574@mail.ncrmnt.org> <552A6209.9040903@gmail.com> <cd7445f789f1082f464d464f77807f12@mail.ncrmnt.org> <20150412145857.GA14038@lunn.ch> <b172d775afa24cea69a9490f531c6b37@mail.ncrmnt.org> <20150412194735.GA27921@lunn.ch> <552BCFAA.2020109@free-electrons.com> <1ec8906f00468ca5a9fa227f8c83fe69@mail.ncrmnt.org> <55351569.7000307@free-electrons.com> <d28764ea5d0d5f4c2e5d3e9ca1d7217a@mail.ncrmnt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <d28764ea5d0d5f4c2e5d3e9ca1d7217a@mail.ncrmnt.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Andrew <andrew@ncrmnt.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Linus Walleij <linus.walleij@linaro.org>, Wolfram Sang <wsa@the-dreams.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>
List-Id: devicetree@vger.kernel.org

On 20/04/2015 17:15, Andrew wrote:
> Gregory CLEMENT =D0=BF=D0=B8=D1=81=D0=B0=D0=BB 20.04.2015 18:04:
>> Hi Andrew,
>>
>> On 13/04/2015 16:32, Andrew wrote:
>>> Gregory CLEMENT =D0=BF=D0=B8=D1=81=D0=B0=D0=BB 13.04.2015 17:16:
>>>> Hi Andrew(s),
>>>>
>>>> On 12/04/2015 21:47, Andrew Lunn wrote:
>>>>> On Sun, Apr 12, 2015 at 06:41:31PM +0300, Andrew wrote:
>>>>>> Andrew Lunn ?????????? 12.04.2015 17:58:
>>>>>>>> Okay, got it.
>>>>>>>> I'll file a bug about this issue to the the bugzilla. However
>>>>>>>> something
>>>>>>>> tells me it might not be cpuidle, but D-link. This one's sound=
s
>>>>>>>> nasty
>>>>>>>> and it has been around since 3.16.x. How could it go unnoticed=
?
>>>>>>>> Unfortunately I have no other armada-370 hardware to test it.
>>>>>>>
>>>>>>> Hi Andrew
>>>>>>>
>>>>>>> A few of us here do have hardware to test with. Please give a
>>>>>>> detailed
>>>>>>> description of how you reproduce the issue, and your kernel
>>>>>>> configuration, if different from mvebu_v7_defconfig, or
>>>>>>> multi_v7_defconfig.
>>>>>>>
>>>>>>> 	Thanks
>>>>>>> 		Andrew
>>>>>>
>>>>>>
>>>>>> arch/arm/configs/mvebu_v7_defconfig has
>>>>>> CONFIG_ARM_MVEBU_V7_CPUIDLE=3Dy,
>>>>>> so it should be sufficient to reproduce the issue. I first
>>>>>> encountered
>>>>>> this issue using that very config and observed it on 2 DNS-327L=20
>>>>>> boxes
>>>>>> I
>>>>>> own.
>>>>>>
>>>>>> All I have to do to trigger the bug - enable cpuidle driver and =
let
>>>>>> the box
>>>>>> sit for some 4-12 hours, till it hard-freezes. If wdt is enabled=
 -
>>>>>> wdt reboot
>>>>>> will happen.
>>>>>
>>>>> That simple! Well i've got a 370RD which has been sat mostly idle=
=20
>>>>> for
>>>>> weeks, using the mvebu_v7_defconfig, with a few addition things=20
>>>>> turned
>>>>> on for testing the Ethernet switch on the board. I've not had tha=
t
>>>>> lockup.
>>>>>
>>>>> One thing you can try to narrow it down is the disable the second=
=20
>>>>> idle
>>>>> mode. Take a look at armada370_idle_driver. Keep the
>>>>> ARM_CPUIDLE_WFI_STATE but disable the "Deep Idle" state.
>>>>
>>>> Actually you don't have to modify the kernel you can setup the CPU=
=20
>>>> idle
>>>> level
>>>> you want at runtime:
>>>>
>>>> echo 1 > /sys/devices/system/cpu/cpu0/cpuidle/state1/disable
>>>>
>>>> will disable the state1. By doing this on Armada 370 then you
>>>> will only use the WFI state.
>>>>
>>>> Do you still have this issue on v4.0-rc7?
>>>
>>> Yep, I can confirm having this issue on 4.0-rc7. I will only be abl=
e=20
>>> to
>>> test if
>>> disabling state1 fixes it the next weekend.
>>
>> Did you manage to do some test this week-end?
>>
>> Thanks,
>>
>> Gregory
>>
>>
>>>
>>>>
>>>> Thanks,
>>>>
>>>> Gregory
>>>>
>>>>
>>>>
>>>>>
>>>>>       Andrew
>>>>>
>>>
>=20
> Sorry, I've been away for the weekend but managed to take the

No problem

> hardware home on my way back. I'll rig it for a long test today
> in the evening. Expect some test results somewhere around Wednesday.
> (Guess it doesn't count unless it's stable for 24+ hours).


great! thanks to take care of it.

Gregory
>=20


--=20
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
