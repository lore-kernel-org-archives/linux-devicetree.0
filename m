From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: Fwd: Re: [PATCH 2/2] ARM: mvebu: dts: Add dts file for DLink
  DNS-327L
Date: Mon, 20 Apr 2015 17:04:09 +0200
Message-ID: <55351569.7000307@free-electrons.com>
References: <b6534b962d2cf9d21cb72d43f19a6574@mail.ncrmnt.org> <552A6209.9040903@gmail.com> <cd7445f789f1082f464d464f77807f12@mail.ncrmnt.org> <20150412145857.GA14038@lunn.ch> <b172d775afa24cea69a9490f531c6b37@mail.ncrmnt.org> <20150412194735.GA27921@lunn.ch> <552BCFAA.2020109@free-electrons.com> <1ec8906f00468ca5a9fa227f8c83fe69@mail.ncrmnt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1ec8906f00468ca5a9fa227f8c83fe69-IcawJbj+vY1vZ+LtbKW8tg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew <andrew-g16cbSVCqPUdnm+yROfE0A@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Andrew,

On 13/04/2015 16:32, Andrew wrote:
> Gregory CLEMENT =D0=BF=D0=B8=D1=81=D0=B0=D0=BB 13.04.2015 17:16:
>> Hi Andrew(s),
>>
>> On 12/04/2015 21:47, Andrew Lunn wrote:
>>> On Sun, Apr 12, 2015 at 06:41:31PM +0300, Andrew wrote:
>>>> Andrew Lunn ?????????? 12.04.2015 17:58:
>>>>>> Okay, got it.
>>>>>> I'll file a bug about this issue to the the bugzilla. However
>>>>>> something
>>>>>> tells me it might not be cpuidle, but D-link. This one's sounds=20
>>>>>> nasty
>>>>>> and it has been around since 3.16.x. How could it go unnoticed?
>>>>>> Unfortunately I have no other armada-370 hardware to test it.
>>>>>
>>>>> Hi Andrew
>>>>>
>>>>> A few of us here do have hardware to test with. Please give a=20
>>>>> detailed
>>>>> description of how you reproduce the issue, and your kernel
>>>>> configuration, if different from mvebu_v7_defconfig, or
>>>>> multi_v7_defconfig.
>>>>>
>>>>> 	Thanks
>>>>> 		Andrew
>>>>
>>>>
>>>> arch/arm/configs/mvebu_v7_defconfig has=20
>>>> CONFIG_ARM_MVEBU_V7_CPUIDLE=3Dy,
>>>> so it should be sufficient to reproduce the issue. I first=20
>>>> encountered
>>>> this issue using that very config and observed it on 2 DNS-327L bo=
xes=20
>>>> I
>>>> own.
>>>>
>>>> All I have to do to trigger the bug - enable cpuidle driver and le=
t
>>>> the box
>>>> sit for some 4-12 hours, till it hard-freezes. If wdt is enabled -
>>>> wdt reboot
>>>> will happen.
>>>
>>> That simple! Well i've got a 370RD which has been sat mostly idle f=
or
>>> weeks, using the mvebu_v7_defconfig, with a few addition things tur=
ned
>>> on for testing the Ethernet switch on the board. I've not had that
>>> lockup.
>>>
>>> One thing you can try to narrow it down is the disable the second i=
dle
>>> mode. Take a look at armada370_idle_driver. Keep the
>>> ARM_CPUIDLE_WFI_STATE but disable the "Deep Idle" state.
>>
>> Actually you don't have to modify the kernel you can setup the CPU i=
dle=20
>> level
>> you want at runtime:
>>
>> echo 1 > /sys/devices/system/cpu/cpu0/cpuidle/state1/disable
>>
>> will disable the state1. By doing this on Armada 370 then you
>> will only use the WFI state.
>>
>> Do you still have this issue on v4.0-rc7?
>=20
> Yep, I can confirm having this issue on 4.0-rc7. I will only be able =
to=20
> test if
> disabling state1 fixes it the next weekend.

Did you manage to do some test this week-end?

Thanks,

Gregory


>=20
>>
>> Thanks,
>>
>> Gregory
>>
>>
>>
>>>
>>>       Andrew
>>>
>=20


--=20
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
