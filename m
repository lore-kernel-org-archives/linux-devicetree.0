From: Hanjun Guo <hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v7 8/8] clocksource: simplify ACPI code in arm_arch_timer.c
Date: Thu, 27 Aug 2015 20:02:28 +0800
Message-ID: <55DEFC54.4090904@linaro.org>
References: <=fu.wei@linaro.org> <1440435683-7343-1-git-send-email-fu.wei@linaro.org> <1440435683-7343-9-git-send-email-fu.wei@linaro.org> <alpine.DEB.2.11.1508241942450.3873@nanos> <CADyBb7sVGePKtU45_DBGd74fykAPVshmbnRQJDDOrrvoHTGcKQ@mail.gmail.com> <alpine.DEB.2.11.1508252113590.15006@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.11.1508252113590.15006@nanos>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Fu Wei <fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Suravee Suthikulpanit <Suravee.Suthikulpanit-5C7GfCeVMHo@public.gmane.org>, Linaro ACPI Mailman List <linaro-acpi-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wei Fu <tekkamanninja-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, G Gregory <graeme.gregory-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Al Stone <al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Vipul Gandhi <vgandhi-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Leo Duran <leo.duran-5C7GfCeVMHo@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Rafael Wysocki <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, dyoung-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, panand-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Thomas,

Thanks for the comments, I got some questions and
reply below.

On 08/26/2015 03:17 AM, Thomas Gleixner wrote:
> On Wed, 26 Aug 2015, Fu Wei wrote:
>>>>   /* Initialize per-processor generic timer */
>>>> -static int __init arch_timer_acpi_init(struct acpi_table_header *table)
>>>> +void __init arch_timer_acpi_init(void)
>>>>   {
>>>
>>> And how is that supposed to work when we have next generation CPUs
>>> which implement a different timer? You break multisystem kernels that
>>> way.

Sorry, I think I missed some context here that I don't understand
why the code here will break multisystem kernels? I'm trying to
understand the problem here and update the code :)

>>
>> yes, you are right, If there is a  next generation CPUs  which
>> implement a different timer, (maybe) this driver can not work.
>> we may need a new timer driver.
>>
>> But,
>> (1) for now,  aarch64  core always has the arch timer(this timer is
>> part of aarch64 architecture).
>> and the existing code make  ARM64 kernel "select ARM_ARCH_TIMER "
>> (2) GTDT is designed for generic timer, so in this call "
>> arch_timer_acpi_init"  we  parse the gtdt info.
>> (3) once we have a ARM64 CPUs which implement a different timer, we
>> may need to select a right timer in the config stage.
>> and this timer may not be described in GTDT.  So we can implement
>> another arch_timer_acpi_init by that time in new timer driver..
>> if the new time still uses GTDT(or new version GTDT), we may need to
>> update gtdt.c for new timer by that time.
>
> That's simply wrong. You want to build kernels which run on both cpus
> and the selection of the timer happens at runtime depending on the
> ACPI info. We do the same thing with device tree.

I think the code can do that if I understand correctly. The code for
now is that we only support arch timer on ARM64, and this patch set
is adding SBSA watchdog timer support which need same function in
arch timer, so we move that function to common place.

We will load the driver (arch timer, memory mapped timer) when the
ACPI table defines them, which when new timer is coming, that will
defined in the ACPI table and load the driver as needed.

Please correct me if I misse something, thanks.

Hanjun
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
