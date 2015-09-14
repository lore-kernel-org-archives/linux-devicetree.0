From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v7 8/8] clocksource: simplify ACPI code in arm_arch_timer.c
Date: Mon, 14 Sep 2015 19:05:15 +0100
Message-ID: <55F70C5B.8040508@arm.com>
References: <=fu.wei@linaro.org>	<1440435683-7343-1-git-send-email-fu.wei@linaro.org>	<1440435683-7343-9-git-send-email-fu.wei@linaro.org>	<alpine.DEB.2.11.1508241942450.3873@nanos>	<CADyBb7sVGePKtU45_DBGd74fykAPVshmbnRQJDDOrrvoHTGcKQ@mail.gmail.com>	<alpine.DEB.2.11.1508252113590.15006@nanos>	<55DEFC54.4090904@linaro.org>	<alpine.DEB.2.11.1508271405330.15006@nanos>	<55DF025F.2050102@linaro.org>	<55DF1257.9090303@linaro.org>	<alpine.DEB.2.11.1508271539560.15006@nanos> <CADyBb7vKQq_T_P27hZQs+6-TJo2YD=QXjVseQ8dOvixwSHwL5A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CADyBb7vKQq_T_P27hZQs+6-TJo2YD=QXjVseQ8dOvixwSHwL5A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fu Wei <fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: Hanjun Guo <hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Suravee Suthikulpanit <Suravee.Suthikulpanit-5C7GfCeVMHo@public.gmane.org>, Linaro ACPI Mailman List <linaro-acpi-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wei Fu <tekkamanninja-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, G Gregory <graeme.gregory-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Al Stone <al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Vipul Gandhi <vgandhi-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Leo Duran <leo.duran-5C7GfCeVMHo@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Rafael Wysocki <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, dyoung-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, panand-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 27/08/15 14:51, Fu Wei wrote:
> Hi Thomas, Hanjun
> 
> On 27 August 2015 at 21:40, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org> wrote:
>> On Thu, 27 Aug 2015, Hanjun Guo wrote:
>>>> [1]: https://lkml.org/lkml/2015/7/29/236
>>>>
>>>> If that is ok with you, we will introduce similar DECLARE_ thing
>>>> for clock declare.
>>
>> Yes.
> 
> Thanks
> 
>>
>>> Or we can drop this patch from this patch set, and clean up this
>>> patch when the ACPI_DECLARE() infrastructure is ready for upstream.
>>
>> Works either way. I just noticed that hard coded init thing and
>> decided to rant about it :)
> 
> OK, good idea, this patch will be improve by DECLARE_ thing, then upstream.
> drop this from this patchset.
> 
> Great thanks for your help

You probably want to keep an eye on this:

https://lwn.net/Articles/657238/

which implements the necessary infrastructure. I'd appreciate if you
could give it a go to find out if it works for you.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
