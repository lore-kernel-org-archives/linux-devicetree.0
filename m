From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [linux-sunxi] Re: Changed: sunxi-ng clock code - NKMP clock
 implementation is wrong
Date: Thu, 28 Jul 2016 19:38:06 +0800
Message-ID: <CAGb2v66HnehqwbZzEvSF9aCLyrrDupibwqnWGJCUGiXT_pA4uA@mail.gmail.com>
References: <20160625034511.7966-1-megous@megous.com> <20160625034511.7966-7-megous@megous.com>
 <20160630204001.GC5485@lukather> <0b71ed7e-98c9-109e-85e6-ceb95131d88a@megous.com>
 <20160715085356.GR4761@lukather> <085e185a-ac76-dd3f-9b0e-a7dc9c0c09f3@megous.com>
 <20160721094852.GI5993@lukather> <c46d1af5-9410-402a-7144-48b396ef6da7@megous.com>
 <20160726063253.GW7419@lukather> <e1b8127f-c422-46ab-384b-aeee85aa940b@megous.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <e1b8127f-c422-46ab-384b-aeee85aa940b@megous.com>
Sender: linux-clk-owner@vger.kernel.org
To: =?UTF-8?Q?Ond=C5=99ej_Jirman?= <megous@megous.com>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, dev <dev@linux-sunxi.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>, =?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Thu, Jul 28, 2016 at 7:27 PM, Ond=C5=99ej Jirman <megous@megous.com>=
 wrote:
> Hi Maxime,
>
> I don't have your sunxi-ng clock patches in my mailbox, so I'm replyi=
ng
> to this.
>
> On 26.7.2016 08:32, Maxime Ripard wrote:
>> On Thu, Jul 21, 2016 at 11:52:15AM +0200, Ond=C5=99ej Jirman wrote:
>>>>>> If so, then yes, trying to switch to the 24MHz oscillator before
>>>>>> applying the factors, and then switching back when the PLL is st=
able
>>>>>> would be a nice solution.
>>>>>>
>>>>>> I just checked, and all the SoCs we've had so far have that
>>>>>> possibility, so if it works, for now, I'd like to stick to that.
>>>>>
>>>>> It would need to be tested. U-boot does the change only once, whi=
le the
>>>>> kernel would be doing it all the time and between various frequen=
cies
>>>>> and PLL settings. So the issues may show up with this solution to=
o.
>>>>
>>>> That would have the benefit of being quite easy to document, not b=
e a
>>>> huge amount of code and it would work on all the CPUs PLLs we have=
 so
>>>> far, so still, a pretty big win. If it doesn't, of course, we don'=
t
>>>> really have the choice.
>>>
>>> It's probably more code though. It has to access different register=
 from
>>> the one that is already defined in dts, which would add a lot of co=
de
>>> and require dts changes. The original patch I sent is simpler than =
that.
>>
>> Why?
>>
>> You can use container_of to retrieve the parent structure of the clo=
ck
>> notifier, and then you get a ccu_common structure pointer, with the
>> CCU base address, the clock register, its lock, etc.
>>
>> Look at what is done in drivers/clk/meson/clk-cpu.c. It's like 20 Lo=
C.
>>
>> I don't really get why anything should be changed in the DT, or why =
it
>> would add a lot of code. Or maybe we're not talking about the same
>> thing?
>
> I've looked at the new CCU code, particularly ccu_nkmp.c, and found t=
hat
> it very liberally uses divider parameters, even in situations that ar=
e
> out of spec compared to the current code in the kernel.
>
> In the current code and especially in the original vendor code, divid=
er
> parameters are used as last resort only. Presumably because, of the
> inherent trouble in changing them, as I described to you in other ema=
il.
>
> The new ccu code uses dividers often and even at very high frequencie=
s,
> which goes against the spec.
>
> In the vendor code M is never anything else but 0, and P is used only
> for frequencies below 288MHz, which matches the H3 datasheet, which s=
ays:
>
> "The P factor only use in the condition that PLL output less than 288
> MHz."
>
> Also other datasheets of similar socs from Allwinner state that M sho=
uld
> not be used in production code. So it may be that they either forgot =
to
> state it in the H3 datasheet, or it can be used. In any case, they ne=
ver
> use M in their code, so it may be wise to keep to that.
>
> When I boot with the new CCU code I get this:
>
> PLL_CPUX =3D 0x00001B21 : M =3D 2, K =3D 3, N =3D 28, P =3D 1, EN =3D=
 0
> PLL_CPUX : freq =3D 1008MHz
>
> Mathematically it works, but it is against the spec.
>
> Also, this:
>
> analyzing CPU 0:
>   driver: cpufreq-dt
>   CPUs which run at the same hardware frequency: 0 1 2 3
>   CPUs which need to have their frequency coordinated by software: 0 =
1 2 3
>   maximum transition latency: 1.74 ms
>   hardware limits: 120 MHz - 1.37 GHz
>   available frequency steps:  120 MHz, 240 MHz, 480 MHz, 648 MHz, 816
> MHz, 960 MHz, 1.01 GHz, 1.06 GHz, 1.10 GHz, 1.15 GHz, 1.20 GHz, 1.22
> GHz, 1.25 GHz, 1.30 GHz, 1.34 GHz, 1.37 GHz
>   available cpufreq governors: conservative ondemand userspace powers=
ave
> performance
>   current policy: frequency should be within 240 MHz and 240 MHz.
>                   The governor "performance" may decide which speed t=
o use
>                   within this range.
>   current CPU frequency: 24.0 MHz (asserted by call to hardware)
>
>
> Somehow, the new CCU code sets the CPUX to 24MHz no matter what.
>
> I'm using your pen/clk-rework branch without any other patches that w=
ere
> later sent to the mailing list.

The H3 CPUX clock does not have the CLK_SET_RATE_PARENT flag set, which
means cpufreq's attempts to set the clk rate will, in some cases, be
ignored as the change is not propagated up to the parent PLL. In the
worst case it will select the 24 MHz oscillator. The fix is to add
CLK_SET_RATE_PARENT. And then you'll have to deal with the PLL potentia=
lly
going too high, as you stated in your other mail, and can be mitigated
with my clk notifier patch.

ChenYu

> regards,
>   Ondrej
>
>>
>> Maxime
>>
>
> --
> You received this message because you are subscribed to the Google Gr=
oups "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, sen=
d an email to linux-sunxi+unsubscribe@googlegroups.com.
> For more options, visit https://groups.google.com/d/optout.
