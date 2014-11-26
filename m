From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v4] clocksource: arch_timer: Allow the device tree to
 specify uninitialized timer registers
Date: Wed, 26 Nov 2014 13:49:57 +0100
Message-ID: <5475CC75.5030300@linaro.org>
References: <1412753627-28287-1-git-send-email-sonnyrao@chromium.org> <4822206.0yqmIumDEc@diego> <5475C802.4050903@linaro.org> <11522840.iniX5CHHHk@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <11522840.iniX5CHHHk@diego>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>
Cc: Doug Anderson <dianders@chromium.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Olof Johansson <olof@lixom.net>, Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will.deacon@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Sudeep Holla <Sudeep.Holla@arm.com>, Mark Rutland <Mark.Rutland@arm.com>, Stephen Boyd <sboyd@codeaurora.org>, Marc Zyngier <marc.zyngier@arm.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Nathan Lynch <Nathan_Lynch@mentor.com>, Rob Herring <robh+dt@kernel.org>, Sonny Rao <sonnyrao@chromium.org>
List-Id: devicetree@vger.kernel.org

On 11/26/2014 01:48 PM, Heiko St=C3=BCbner wrote:
> Am Mittwoch, 26. November 2014, 13:30:58 schrieb Daniel Lezcano:
>> On 11/26/2014 01:06 PM, Heiko St=C3=BCbner wrote:
>>> Hi Daniel,
>>>
>>> Am Mittwoch, 26. November 2014, 12:51:08 schrieb Daniel Lezcano:
>>>> Hi Doug, Olof,
>>>>
>>>> IIUC, it sounds like this patch is needed from some other patches =
in
>>>> arm-soc. Olof was proposing to take this patch through its tree to
>>>> facilitate the integration.
>>>>
>>>> Olof, is it this patch you were worried about ?
>>>
>>> I think this is one of two patches in question.
>>>
>>> "clocksource: arch_timer: Fix code to use physical timers when requ=
ested"
>>> [0] would be the second one.
>>>
>>> And the patch for arm-soc that Olof means would be "ARM: dts: rk328=
8: add
>>> arm,cpu-registers-not-fw-configured" [1].
>>
>> Ok, so IIUC, "clocksource: arch_timer: Fix code to use physical time=
rs
>> when requested" should go via arm's tree, right ?
>
> If I'm reading Olof's irc-comments from yesterday correctly, that is =
right and
> the 3 patches should go in together:
>
> - "clocksource: arch_timer: Fix code to use physical timers
>    when requested" fixes the use of physical timers in general
> - "clocksource: arch_timer: Allow the device tree to specify uninitia=
lized
>    timer registers" allows this to be set from dt
> - "ARM: dts: rk3288: add arm,cpu-registers-not-fw-configured" enables=
 this on
>    rk3288

Ok, then I drop them from my tree and will let Olof to handle them.

Thanks !

   -- Daniel


--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
