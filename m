From: Haojian Zhuang <haojian.zhuang@gmail.com>
Subject: Re: [PATCH V3 2/3] clocksource: mmp: support CLOCKSOURCE OF DECLARE
Date: Fri, 12 Jul 2013 07:51:41 +0800
Message-ID: <CAN1soZzkycTDc-U4h43LC6hSYS1v+UkG+C4k-+dYMxRL=t7Zbg@mail.gmail.com>
References: <1373352166-10064-1-git-send-email-zhangwm@marvell.com>
	<1373352166-10064-3-git-send-email-zhangwm@marvell.com>
	<20130709181434.76f6216d@skate>
	<201307092316.20905.arnd@arndb.de>
	<CAN1soZyFztVR1XSw9bDS5JexK0Mdbpr6yevatVf+MnBohwCj1Q@mail.gmail.com>
	<175CCF5F49938B4D99B2E3EF7F558EBE3DBC97FDFF@SC-VEXCH4.marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <175CCF5F49938B4D99B2E3EF7F558EBE3DBC97FDFF@SC-VEXCH4.marvell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Zhang <zhangwm@marvell.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Grant Likely <grant.likely@linaro.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 11, 2013 at 7:23 PM, Neil Zhang <zhangwm@marvell.com> wrote=
:
> Haojian,
>
>
>> -----Original Message-----
>> From: Haojian Zhuang [mailto:haojian.zhuang@gmail.com]
>> Sent: 2013=E5=B9=B47=E6=9C=8810=E6=97=A5 13:59
>> To: Arnd Bergmann
>> Cc: Thomas Petazzoni; Neil Zhang; Grant Likely;
>> devicetree-discuss@lists.ozlabs.org; linux-kernel@vger.kernel.org;
>> linux-arm-kernel@lists.infradead.org
>> Subject: Re: [PATCH V3 2/3] clocksource: mmp: support CLOCKSOURCE OF
>> DECLARE
>>
>> On Wed, Jul 10, 2013 at 5:16 AM, Arnd Bergmann <arnd@arndb.de> wrote=
:
>> > On Tuesday 09 July 2013, Thomas Petazzoni wrote:
>> >> Dear Neil Zhang,
>> >>
>> >> On Tue, 9 Jul 2013 14:42:45 +0800, Neil Zhang wrote:
>> >> > support CLOCKSOURCE OF DECLARE for mmp timer.
>> >> >
>> >> > Signed-off-by: Neil Zhang <zhangwm@marvell.com>
>> >> > ---
>> >> >  arch/arm/mach-mmp/mmp-dt.c  |    5 ++---
>> >> >  arch/arm/mach-mmp/mmp2-dt.c |    3 +--
>> >> >  arch/arm/mach-mmp/time.c    |   15 ++-------------
>> >> >  3 files changed, 5 insertions(+), 18 deletions(-)
>> >>
>> >> Maybe it would be good to take this opportunity to move
>> >> arch/arm/mach-mmp/time.c into drivers/clocksource/.
>> >
>> > +1
>> >
>> > Or we might want to have a more coordinated move of all clocksourc=
e
>> > drivers in arch/arm to drivers/clocksource now, as we have done fo=
r
>> > some other subsystems.
>> >
>> >         Arnd
>>
>> I already sent some patches on this. But I didn't get response yet. =
I'll rebase
>> them and send them again. I hope that they could be merged in this c=
ycle.
>>
>> Regards
>> Haojian
>
> Will you submit a patch to move it by yourself or let me update the p=
atch to
> move it to drivers/clocksource in next version?
>
> Best Regards,
> Neil Zhang

Not one patch. There're a couples of patches. They are depandant each o=
ther.

I don't have time to rebase them in these two weeks. Go ahead to rebase=
 all
your patches on mine.

Regards
Haojian
