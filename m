From: Fu Wei <fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 6/7] Watchdog: introduce ARM SBSA watchdog driver
Date: Mon, 25 May 2015 11:43:31 +0800
Message-ID: <CADyBb7tH+oa_efFTA0V7YksNN+8L+4xGtWuXpxp91SO3e_f9Vg@mail.gmail.com>
References: <=fu.wei@linaro.org>
	<1432197156-16947-1-git-send-email-fu.wei@linaro.org>
	<1432197156-16947-7-git-send-email-fu.wei@linaro.org>
	<555DB4C4.5090606@roeck-us.net>
	<555DD8EE.1060607@codeaurora.org>
	<20150521152838.GB16668@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150521152838.GB16668-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: Timur Tabi <timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Suravee Suthikulpanit <Suravee.Suthikulpanit-5C7GfCeVMHo@public.gmane.org>, Linaro ACPI Mailman List <linaro-acpi-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wei Fu <tekkamanninja-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, G Gregory <graeme.gregory-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Al Stone <al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Hanjun Guo <hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ashwin Chaugule <ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, vgandhi-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Leo Duran <leo.duran-5C7GfCeVMHo@public.gmane.org>, Jon Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Guenter,

On 21 May 2015 at 23:28, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org> wrote:
> On Thu, May 21, 2015 at 08:09:02AM -0500, Timur Tabi wrote:
>> Guenter Roeck wrote:
>> >>
>> >>+static unsigned int sbsa_gwdt_get_timeleft(struct watchdog_device *wdd)
>> >>+{
>> >>+    struct sbsa_gwdt *gwdt = to_sbsa_gwdt(wdd);
>> >>+    u64 timeleft = sbsa_gwdt_get_wcv(wdd) - arch_counter_get_cntvct();
>> >>+
>> >
>> >Still not happy about the use of arch_counter_get_cntvct
>> >instead of using the clock subsystem. I am quite sure this could be done,
>> >possibly through arch_sys_counter, though at this point I am getting wary
>> >of bringing it up, so I guess I'll just let it go.
>>
>> You made the same comment with my driver, and I keep asking for
>> clarification.  The clk_get_sys() API does not work on my system, because
>> there are not clocks defined.  That must be an ACPI limitation that I can't
>> fix.
>>
> Would it be possible to define such clocks ?
>
>> The alternative to arch_counter_get_cntvct() is arch_timer_read_counter(),
>> which is not exported.  So we have two choices,
>>
>> 1) Continue to use arch_counter_get_cntvct(), which works on all ARM64
>> platforms that this driver supports anyway
>>
>> 2) Export arch_timer_read_counter()
>>
>> I prefer option #1.
>>
> Do we have any feedback from the arm maintainers ?
>
> My problem is that I don't want to be the first one to permit using
> those functions outside architecture and clock code. If we do this,
> we should get an Ack from an arm maintainer specifically for the use
> of arch_counter_get_cntvct() and arch_timer_get_rate().

IMO, we may need to use  arch_timer_read_counter.
Reason:  Once the Linux kernel has KVM support and is in hyp mode. we
may need to use arch_counter_get_cntpct.
So arch_timer driver have helped us to make arch_timer_read_counter
point to the right function.
and arch_timer_read_counter is in the
include/clocksource/arm_arch_timer.h,  just like arch_timer_get_rate
as a interface




>
> Thanks,
> Guenter
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best regards,

Fu Wei
Software Engineer
Red Hat Software (Beijing) Co.,Ltd.Shanghai Branch
Ph: +86 21 61221326(direct)
Ph: +86 186 2020 4684 (mobile)
Room 1512, Regus One Corporate Avenue,Level 15,
One Corporate Avenue,222 Hubin Road,Huangpu District,
Shanghai,China 200021
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
