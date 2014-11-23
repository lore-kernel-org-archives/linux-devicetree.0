From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4] clocksource: arch_timer: Allow the device tree to
 specify uninitialized timer registers
Date: Sun, 23 Nov 2014 22:41:06 +0100
Message-ID: <54725472.7010804@linaro.org>
References: <1412753627-28287-1-git-send-email-sonnyrao@chromium.org> <CAD=FV=VhaMo4fNide3a2S6jdLiq2pyOqY3hmx7ai0iDTPxCsPA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAD=FV=VhaMo4fNide3a2S6jdLiq2pyOqY3hmx7ai0iDTPxCsPA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Sudeep Holla <Sudeep.Holla-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Nathan Lynch <Nathan_Lynch-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sonny Rao <sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/20/2014 12:01 AM, Doug Anderson wrote:
> Daniel,
>
> On Wed, Oct 8, 2014 at 12:33 AM, Sonny Rao <sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wr=
ote:
>> From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>>
>> Some 32-bit (ARMv7) systems are architected like this:
>>
>> * The firmware doesn't know and doesn't care about hypervisor mode a=
nd
>>    we don't want to add the complexity of hypervisor there.
>>
>> * The firmware isn't involved in SMP bringup or resume.
>>
>> * The ARCH timer come up with an uninitialized offset (CNTVOFF)
>>    between the virtual and physical counters.  Each core gets a
>>    different random offset.
>>
>> * The device boots in "Secure SVC" mode.
>>
>> * Nothing has touched the reset value of CNTHCTL.PL1PCEN or
>>    CNTHCTL.PL1PCTEN (both default to 1 at reset)
>>
>> On systems like the above, it doesn't make sense to use the virtual
>> counter.  There's nobody managing the offset and each time a core go=
es
>> down and comes back up it will get reinitialized to some other rando=
m
>> value.
>>
>> This adds an optional property which can inform the kernel of this
>> situation, and firmware is free to remove the property if it is goin=
g
>> to initialize the CNTVOFF registers when each CPU comes out of reset=
=2E
>>
>> Currently, the best course of action in this case is to use the
>> physical timer, which is why it is important that CNTHCTL hasn't bee=
n
>> changed from its reset value and it's a reasonable assumption given
>> that the firmware has never entered HYP mode.
>>
>> Note that it's been said that on ARMv8 systems the firmware and
>> kernel really can't be architected as described above.  That means
>> using the physical timer like this really only makes sense for ARMv7
>> systems.
>>
>> Signed-off-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> Signed-off-by: Sonny Rao <sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> Reviewed-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
>> ---
>> Changes in v2:
>> - Add "#ifdef CONFIG_ARM" as per Will Deacon
>>
>> Changes in v3:
>> - change property name to arm,cntvoff-not-fw-configured and specify
>>    that the value of CNTHCTL.PL1PC(T)EN must still be the reset valu=
e
>>    of 1 as per Mark Rutland
>>
>> Changes in v4:
>> - change property name to arm,cpu-registers-not-fw-configured and
>>    specify that all cpu registers must have architected reset values
>>    per Mark Rutland
>> - change from "#ifdef CONFIG_ARM" to "if (IS_ENABLED(CONFIG_ARM))" p=
er
>>    Arnd Bergmann
>> ---
>>   Documentation/devicetree/bindings/arm/arch_timer.txt | 8 ++++++++
>>   drivers/clocksource/arm_arch_timer.c                 | 8 ++++++++
>>   2 files changed, 16 insertions(+)
>
> Do you know what the status of this patch is?  This patch and Sonny's
> patch at <https://patchwork.kernel.org/patch/5051901/> are needed on
> Rockchip rk3288 for some specific things:
>
> 1. To make SMP happy with coreboot.
>
> 2. To (I assume) make SMP happy after S2R (no matter which firmware i=
s
> used since I don't think anyone has PSCI for rk3288).
>
> ...we still need a DTS entry atop these patches, but that's trivial t=
o
> add once these land.

Hi Doug,

sounds like I forgot it. Thanks for the heads up.

Applied for 3.19.

   -- Daniel


--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
