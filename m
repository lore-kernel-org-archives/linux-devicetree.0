From: Fu Wei <fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v7 5/8] Watchdog: introduce ARM SBSA watchdog driver
Date: Tue, 13 Oct 2015 16:34:25 +0800
Message-ID: <CADyBb7vxbdftskfDKSmgz82=Y2XtCYOawp2mGiUsJ7f=H1ZAoA@mail.gmail.com>
References: <=fu.wei@linaro.org>
	<1440435683-7343-1-git-send-email-fu.wei@linaro.org>
	<1440435683-7343-6-git-send-email-fu.wei@linaro.org>
	<20150915083823.GB5767@localhost.localdomain>
	<CADyBb7sDPgFU3Hb_f_iMtF7TYU0xoBnuLCDUihufdOShO5uOkg@mail.gmail.com>
	<20150916015741.GA6699@dhcp-128-62.nay.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150916015741.GA6699-0VdLhd/A9PlKO6g2yTT9Sx/sF2h8X+2i0E9HWUfgJXw@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dave Young <dyoung-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Suravee Suthikulpanit <Suravee.Suthikulpanit-5C7GfCeVMHo@public.gmane.org>, Hanjun Guo <hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linaro ACPI Mailman List <linaro-acpi-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wei Fu <tekkamanninja-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, G Gregory <graeme.gregory-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Al Stone <al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Vipul Gandhi <vgandhi-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Leo Duran <leo.duran-5C7GfCeVMHo@public.gmane.org>, Jon Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Rafael Wysocki <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, Pratyush Anand <panand-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Dave,

On 16 September 2015 at 09:57, Dave Young <dyoung-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>> >> diff --git a/drivers/watchdog/sbsa_gwdt.c b/drivers/watchdog/sbsa_gwdt.c
>> >> new file mode 100644
>> >> index 0000000..7ae45cc
>> >> --- /dev/null
>> >> +++ b/drivers/watchdog/sbsa_gwdt.c
>> >> @@ -0,0 +1,459 @@
>> >> +/*
>> >> + * SBSA(Server Base System Architecture) Generic Watchdog driver
>> >> + *
>> >> + * Copyright (c) 2015, Linaro Ltd.
>> >> + * Author: Fu Wei <fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> >> + *         Suravee Suthikulpanit <Suravee.Suthikulpanit-5C7GfCeVMHo@public.gmane.org>
>> >> + *
>> >> + * This program is free software; you can redistribute it and/or modify
>> >> + * it under the terms of the GNU General Public License 2 as published
>> >> + * by the Free Software Foundation.
>> >> + *
>> >> + * This program is distributed in the hope that it will be useful,
>> >> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> >> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> >> + * GNU General Public License for more details.
>> >> + *
>> >> + * The SBSA Generic watchdog driver is compatible with the pretimeout
>> >> + * concept of Linux kernel.
>> >> + * The timeout and pretimeout are determined by WCV or WOR.
>> >> + * The first watch period is set by writing WCV directly, that can
>> >> + * support more than 10s timeout at the maximum system counter
>> >> + * frequency (400MHz).
>> >> + * When WS0 is triggered, the second watch period (pretimeout) is
>> >> + * determined by one of these registers:
>> >> + * (1)WOR: 32bit register, this gives a maximum watch period of
>> >> + * around 10s at the maximum system counter frequency. It's loaded
>> >> + * automatically by hardware.
>> >> + * (2)WCV: If the pretimeout value is greater then "max_wor_timeout",
>> >> + * it will be loaded in WS0 interrupt routine. If system is in
>> >> + * ws0_mode (reboot by kexec/kdump in panic with watchdog enabled
>> >> + * and WS0 == true), the ping operation will only reload WCV.
>> >
>> > Below is the field comment about ws0_mode, it says ws0_mode is only
>> > for rebooting in second stage timeout, but kexec/kdump can reboot in
>> > either first or second stage
>>
>> Great thanks for your feedback.
>>
>> yes, if kexec/kdump reboot the system before the WS0, ws0_mode may not be set.
>> in this case, if WS0 is triggered during the reboot(AFAIK, panic will
>> disable irq, and in the early boot stage of system, irq is disabled,
>> too.), ws0_mode will be set at the next "open" in kdump kernel
>> if WS0 haven't triggered until the watchdog is opened again in kdump
>> kernel , ws0_mode won't  be set.
>>
>> ws0_mode doesn't indicate if the system is in the kdump kernel, it
>> indicates that if WS0 is triggered, when the watchdog is initialized.
>>
>> Do I answer your question?
>
> Yes, thanks for explanation. So it sounds better to change the comment like below?
> from
> (reboot by kexec/kdump in panic with watchdog enabled and WS0 == true)
> to
> (reboot in the pre-timeout stage and WS0 == true)

" in the pre-timeout stage" means " WS0 == true", so I think we should say:
(reboot with watchdog enabled and WS0 == true)

Thanks for your suggestion.

>
> Thanks
> Dave



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
