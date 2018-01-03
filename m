From: PrasannaKumar Muralidharan <prasannatsmkumar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 5/8] MIPS: jz4740: dts: Add bindings for the jz4740-wdt driver
Date: Wed, 3 Jan 2018 19:58:04 +0530
Message-ID: <CANc+2y4_saELdhX7SFOAOxSqvZUoDO53zOBQasx3_+UDykJHrQ@mail.gmail.com>
References: <20171228162939.3928-2-paul@crapouillou.net> <20171230135108.6834-1-paul@crapouillou.net>
 <20171230135108.6834-5-paul@crapouillou.net> <CANc+2y5ZUM_ZzXaGgbx9b7O1GF4GrbaYsv97G+akvhP2d2VVUA@mail.gmail.com>
 <1514911698.3623.1@smtp.crapouillou.net> <698e7ae5-9f19-1282-7b82-0e2fd2080906@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <698e7ae5-9f19-1282-7b82-0e2fd2080906-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Guenter,

On 3 January 2018 at 10:16, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org> wrote:
> On 01/02/2018 08:48 AM, Paul Cercueil wrote:
>>
>> Hi PrasannaKumar,
>>
>> Le mar. 2 janv. 2018 =C3=A0 17:37, PrasannaKumar Muralidharan
>> <prasannatsmkumar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> a =C3=A9crit :
>>>
>>> Hi Paul,
>>>
>>> On 30 December 2017 at 19:21, Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org> wrot=
e:
>>>>
>>>>  Also remove the watchdog platform_device from platform.c, since it
>>>>  wasn't used anywhere anyway.
>>>>
>>>>  Signed-off-by: Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>
>>>>  ---
>>>>   arch/mips/boot/dts/ingenic/jz4740.dtsi |  8 ++++++++
>>>>   arch/mips/jz4740/platform.c            | 16 ----------------
>>>>   2 files changed, 8 insertions(+), 16 deletions(-)
>>>>
>>>>   v2: No change
>>>>
>>>>  diff --git a/arch/mips/boot/dts/ingenic/jz4740.dtsi
>>>> b/arch/mips/boot/dts/ingenic/jz4740.dtsi
>>>>  index cd5185bb90ae..26c6b561d6f7 100644
>>>>  --- a/arch/mips/boot/dts/ingenic/jz4740.dtsi
>>>>  +++ b/arch/mips/boot/dts/ingenic/jz4740.dtsi
>>>>  @@ -45,6 +45,14 @@
>>>>                  #clock-cells =3D <1>;
>>>>          };
>>>>
>>>>  +       watchdog: watchdog@10002000 {
>>>>  +               compatible =3D "ingenic,jz4740-watchdog";
>>>>  +               reg =3D <0x10002000 0x10>;
>>>>  +
>>>>  +               clocks =3D <&cgu JZ4740_CLK_RTC>;
>>>>  +               clock-names =3D "rtc";
>>>>  +       };
>>>>  +
>>>
>>>
>>> The watchdog driver calls jz4740_timer_enable_watchdog and
>>> jz4740_timer_disable_watchdog which defined in
>>> arch/mips/jz4740/timer.c. It accesses registers iomapped by timer
>>> code. Declaring register size as 0x10 does not show the real picture.
>>> Better use register size as 0x100 and let timer, wdt, pwm drivers to
>>> share them.
>>
>>
>> As you said, it accesses registers iomapped by timer code. So the watchd=
og
>> driver doesn't need to iomap them.
>>
>>> Code from one of your branches
>>>
>>> (https://github.com/OpenDingux/linux/blob/for-upstream-clocksource/arch=
/mips/boot/dts/ingenic/jz4740.dtsi)
>>> does it. Can you prepare a patch series and send it?
>>> I have a patch set that moves timer code out of arch/mips/jz4740/ and
>>> does a similar thing for watchdog and pwm. As your new timer driver is
>>> better than the existing one I have not sent my patches yet. I would
>>> like to see it getting mainlined as it paves way for removing most of
>>> code in arch/mips/jz4740.
>>
>>
>> The whole 'for-upstream-clocksource' branch is supposed to go upstream,
>> but I can't do it in one big patchset without having lots of breakages
>> with
>> my other patchsets (jz4770 SoC support, and jz4740 watchdog updates)
>> currently under review. That also makes it simpler to upstream than havi=
ng
>> one single patchset that touches 6 different frameworks (MIPS, irq,
>> clocks,
>> clocksource, watchdog, PWM).
>>
>> So I will submit it in two steps, first the irq/clocks/clocksource drive=
rs
>> (this patchset) hopefully for 4.16, and then the platform/watchdog/PWM
>> fixes
>> for 4.17.
>>
>
> I kind of lost it in this exchange, sorry. At this point I don't know if
> something
> is wrong with the watchdog patches, and I have no clue what the upstream
> path

There is nothing wrong in this watchdog patches.

> is supposed to be. My working assumption is that 1) something may be wron=
g
> with
> the current version of the patches, and, 2), even if not, none of the
> patches
> is expected to find its way upstream through the watchdog subsystem. Plus=
,
> 3),
> even if some of the patches are supposed to go upstream through the watch=
dog
> subsystem, that won't happen in 4.16, and the patches will be resubmitted
> later
> when they are ready [and will hopefully marked clearly for submission
> through
> the watchdog subsystem].
>
> With that in mind, I'll mark the series for my reference as "not
> applicable".
> If this is wrong please let me know.

Paul has patches related to timer code. While sending that he would
send changes to watchdog dts entry also. I was suggesting him to send
timer patches together with watchdog patches as a single patch series
but he prefers to send them as separate patch series.

I would like to reiterate that there is nothing wrong with this
watchdog patches. I should have set the correct context in my previous
email itself. I sincerely apologize for creating this confusion.

Regards,
PrasannaKumar
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
