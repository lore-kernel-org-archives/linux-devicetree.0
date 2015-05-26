From: Fu Wei <fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 6/6] ACPI: import watchdog info of GTDT into platform device
Date: Wed, 27 May 2015 00:27:33 +0800
Message-ID: <CADyBb7uMh3vKktXa1VJJdchcCQPyOuZ=5ztxoujjyjmxWGhq5w@mail.gmail.com>
References: <=fu.wei@linaro.org>
	<1432548193-19569-1-git-send-email-fu.wei@linaro.org>
	<1432548193-19569-7-git-send-email-fu.wei@linaro.org>
	<20150526122858.GJ1565@arm.com>
	<CAJ5Y-eZfzrDtEL5gpZ1rRNUhr2dCZKuA-MMNcwV=TgFW_9rq=g@mail.gmail.com>
	<20150526151842.GP1565@arm.com>
	<20150526153613.GA22487@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150526153613.GA22487-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Ashwin Chaugule <ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "suravee.suthikulpanit-5C7GfCeVMHo@public.gmane.org" <suravee.suthikulpanit-5C7GfCeVMHo@public.gmane.org>, "linaro-acpi-cunTk1MwBs8s++Sfvej+rw@public.gmane.org" <linaro-acpi-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, "linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "tekkamanninja-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <tekkamanninja-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "graeme.gregory-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <graeme.gregory-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "arnd-r2nGTMty4D4@public.gmane.org" <arnd-r2nGTMty4D4@public.gmane.org>, "vgandhi-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <vgandhi-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org" <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, "jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 26 May 2015 at 23:36, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org> wrote:
> On Tue, May 26, 2015 at 04:18:42PM +0100, Will Deacon wrote:
>> On Tue, May 26, 2015 at 04:02:56PM +0100, Ashwin Chaugule wrote:
>> > On 26 May 2015 at 08:28, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org> wrote:
>> > > On Mon, May 25, 2015 at 11:03:13AM +0100, fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org wrot=
e:
>> > >> From: Fu Wei <fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> > >>
>> > >> Parse SBSA Generic Watchdog Structure in GTDT table of ACPI,
>> > >> and create a platform device with that information.
>> > >> This platform device can be used by the ARM SBSA Generic
>> > >> Watchdog driver.
>> > >>
>> > >> Tested-by: Suravee Suthikulpanit <Suravee.Suthikulpanit-5C7GfCeVMHo@public.gmane.org=
>
>> > >> Tested-by: Timur Tabi <timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
>> > >> Signed-off-by: Fu Wei <fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> > >> ---
>> > >>  arch/arm64/kernel/acpi.c | 145 +++++++++++++++++++++++++++++++=
++++++++++++++++
>> > >>  1 file changed, 145 insertions(+)
>> > >
>> > > Why does this all need to be under arch/arm64? The GTDT really i=
sn't
>> > > architecture-specific, so I'd *much* rather it was parsed in the=
 driver code
>> > > itself, like we already do for the architected timer. The GIC is=
 an
>> > > exception because it's in the MADT, which we need to parse in th=
e arch code
>> > > to configure SMP properly.
>> >
>> > I'm not really against refactoring the code. But the GTDT looks qu=
ite
>> > specific to ARM..
>> >
>> > ---8<----
>> > 5.2.24 Generic Timer Description Table (GTDT)
>> > This section describes the format of the Generic Timer Description
>> > Table (GTDT), which provides
>> > OSPM with information about a system=E2=80=99s Generic Timers conf=
iguration.
>> > The Generic Timer (GT) is
>> > a standard timer interface implemented on ARM processor-based syst=
ems.
>> > The GT hardware
>> > specification can be found at Links to ACPI-Related Documents
>> > (http://uefi.org/acpi) under the
>> > heading ARM Architecture. The GTDT provides OSPM with information
>> > about a system's GT
>> > interrupt configurations, for both per-processor timers, and platf=
orm
>> > (memory-mapped) timers.
>> > The GT specification defines the following per-processor timers:
>> > =E2=80=A2 Secure privilege level 1 (EL1) timer,
>> > =E2=80=A2 Non-Secure EL1 timer,
>> > =E2=80=A2 Non-Secure privilege level 2 (EL2) timer,
>> > =E2=80=A2 Virtual timer,
>> > and the following Platform (memory-mapped) timers.
>> > =E2=80=A2 GT Block
>> > =E2=80=A2 Server Base System Architecture (SBSA) Generic Watchdog
>> > ---8<----
>>
>> Sure, the device it describes may only ever exist on ARM systems, bu=
t by
>> that logic then we should be moving lots of drivers back under arch/=
arm[64].
>>
> It is nt the driver, but its instantiation. The question here would b=
e
> how and where to instantiate the driver, not where the driver itself
> is located. The driver itself is ACPI agnostic.

Hi Will,

I really don't mind to refactor the code, If we can make this patch bet=
ter.

But for now, I can't see the good reason to move ACPI-relevant code
into a watchdog driver.

The reasons I put the code here are
(1)SBSA watchdog only for ARM64
(2)GTDT only for ARM, design for ARM,
(3)For ARM Architecture, only ARM64 support ACPI.

=46or minimizing arch/arm64/kernel/acpi.c, we can't put the code here,
and we had better keep these code outside the driver,

So do you have any suggestion for the better location of the GTDT code?

Great thanks for your help.

>
> What you are really saying is that you want the driver instantiation
> to be moved into the driver.
>
> Guenter



--=20
Best regards,

=46u Wei
Software Engineer
Red Hat Software (Beijing) Co.,Ltd.Shanghai Branch
Ph: +86 21 61221326(direct)
Ph: +86 186 2020 4684 (mobile)
Room 1512, Regus One Corporate Avenue,Level 15,
One Corporate Avenue,222 Hubin Road,Huangpu District,
Shanghai,China 200021
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
