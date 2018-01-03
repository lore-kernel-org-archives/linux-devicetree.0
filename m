From: Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>
Subject: Re: [PATCH v2 5/8] MIPS: jz4740: dts: Add bindings for the jz4740-wdt
 driver
Date: Wed, 03 Jan 2018 13:01:06 +0100
Message-ID: <1514980866.1642.0@smtp.crapouillou.net>
References: <20171228162939.3928-2-paul@crapouillou.net>
        <20171230135108.6834-1-paul@crapouillou.net>
        <20171230135108.6834-5-paul@crapouillou.net>
        <CANc+2y5ZUM_ZzXaGgbx9b7O1GF4GrbaYsv97G+akvhP2d2VVUA@mail.gmail.com>
        <1514911698.3623.1@smtp.crapouillou.net>
        <698e7ae5-9f19-1282-7b82-0e2fd2080906@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <698e7ae5-9f19-1282-7b82-0e2fd2080906-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: PrasannaKumar Muralidharan <prasannatsmkumar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



Le mer. 3 janv. 2018 =E0 5:46, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org> a=20
=E9crit :
> On 01/02/2018 08:48 AM, Paul Cercueil wrote:
>> Hi PrasannaKumar,
>>=20
>> Le mar. 2 janv. 2018 =E0 17:37, PrasannaKumar Muralidharan=20
>> <prasannatsmkumar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> a =E9crit :
>>> Hi Paul,
>>>=20
>>> On 30 December 2017 at 19:21, Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>=20
>>> wrote:
>>>>  Also remove the watchdog platform_device from platform.c, since it
>>>>  wasn't used anywhere anyway.
>>>>=20
>>>>  Signed-off-by: Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>
>>>>  ---
>>>>   arch/mips/boot/dts/ingenic/jz4740.dtsi |  8 ++++++++
>>>>   arch/mips/jz4740/platform.c            | 16 ----------------
>>>>   2 files changed, 8 insertions(+), 16 deletions(-)
>>>>=20
>>>>   v2: No change
>>>>=20
>>>>  diff --git a/arch/mips/boot/dts/ingenic/jz4740.dtsi=20
>>>> b/arch/mips/boot/dts/ingenic/jz4740.dtsi
>>>>  index cd5185bb90ae..26c6b561d6f7 100644
>>>>  --- a/arch/mips/boot/dts/ingenic/jz4740.dtsi
>>>>  +++ b/arch/mips/boot/dts/ingenic/jz4740.dtsi
>>>>  @@ -45,6 +45,14 @@
>>>>                  #clock-cells =3D <1>;
>>>>          };
>>>>=20
>>>>  +       watchdog: watchdog@10002000 {
>>>>  +               compatible =3D "ingenic,jz4740-watchdog";
>>>>  +               reg =3D <0x10002000 0x10>;
>>>>  +
>>>>  +               clocks =3D <&cgu JZ4740_CLK_RTC>;
>>>>  +               clock-names =3D "rtc";
>>>>  +       };
>>>>  +
>>>=20
>>> The watchdog driver calls jz4740_timer_enable_watchdog and
>>> jz4740_timer_disable_watchdog which defined in
>>> arch/mips/jz4740/timer.c. It accesses registers iomapped by timer
>>> code. Declaring register size as 0x10 does not show the real=20
>>> picture.
>>> Better use register size as 0x100 and let timer, wdt, pwm drivers to
>>> share them.
>>=20
>> As you said, it accesses registers iomapped by timer code. So the=20
>> watchdog
>> driver doesn't need to iomap them.
>>=20
>>> Code from one of your branches
>>> (https://github.com/OpenDingux/linux/blob/for-upstream-clocksource/arch=
/mips/boot/dts/ingenic/jz4740.dtsi)
>>> does it. Can you prepare a patch series and send it?
>>> I have a patch set that moves timer code out of arch/mips/jz4740/=20
>>> and
>>> does a similar thing for watchdog and pwm. As your new timer driver=20
>>> is
>>> better than the existing one I have not sent my patches yet. I would
>>> like to see it getting mainlined as it paves way for removing most=20
>>> of
>>> code in arch/mips/jz4740.
>>=20
>> The whole 'for-upstream-clocksource' branch is supposed to go=20
>> upstream,
>> but I can't do it in one big patchset without having lots of=20
>> breakages with
>> my other patchsets (jz4770 SoC support, and jz4740 watchdog updates)
>> currently under review. That also makes it simpler to upstream than=20
>> having
>> one single patchset that touches 6 different frameworks (MIPS, irq,=20
>> clocks,
>> clocksource, watchdog, PWM).
>>=20
>> So I will submit it in two steps, first the irq/clocks/clocksource=20
>> drivers
>> (this patchset) hopefully for 4.16, and then the=20
>> platform/watchdog/PWM fixes
>> for 4.17.
>>=20
>=20
> I kind of lost it in this exchange, sorry. At this point I don't know=20
> if something
> is wrong with the watchdog patches, and I have no clue what the=20
> upstream path
> is supposed to be. My working assumption is that 1) something may be=20
> wrong with
> the current version of the patches, and, 2), even if not, none of the=20
> patches
> is expected to find its way upstream through the watchdog subsystem.=20
> Plus, 3),
> even if some of the patches are supposed to go upstream through the=20
> watchdog
> subsystem, that won't happen in 4.16, and the patches will be=20
> resubmitted later
> when they are ready [and will hopefully marked clearly for submission=20
> through
> the watchdog subsystem].
>=20
> With that in mind, I'll mark the series for my reference as "not=20
> applicable".
> If this is wrong please let me know.
>=20
> Guenter

Sorry, my fault, PrasannaKumar mentionned my 'for-upstream-clocksource'=20
branch requesting
me to submit it upstream, which I am doing in parallel of this one. I=20
thought I was
answering him in the other patchset's thread, hence the confusion.

There is nothing wrong with these watchdog patches. Upstream path is=20
through the MIPS tree.

Paul
=

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
