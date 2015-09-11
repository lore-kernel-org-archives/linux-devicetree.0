From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v7 5/8] Watchdog: introduce ARM SBSA watchdog driver
Date: Thu, 10 Sep 2015 19:50:04 -0700
Message-ID: <55F2415C.1050803@roeck-us.net>
References: <=fu.wei@linaro.org> <1440435683-7343-1-git-send-email-fu.wei@linaro.org> <1440435683-7343-6-git-send-email-fu.wei@linaro.org> <55F20461.20904@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55F20461.20904-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Suravee.Suthikulpanit-5C7GfCeVMHo@public.gmane.org, hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linaro-acpi-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: tekkamanninja-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, graeme.gregory-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, vgandhi-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, leo.duran-5C7GfCeVMHo@public.gmane.org, corbet-T1hC0tSOHrs@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org, dyoung-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, panand-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 09/10/2015 03:29 PM, Jon Masters wrote:
> On 08/24/2015 01:01 PM, fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org wrote:
>
>> +	/*
>> +	 * Get the frequency of system counter from the cp15 interface of ARM
>> +	 * Generic timer. We don't need to check it, because if it returns "0",
>> +	 * system would panic in very early stage.
>> +	 */
>> +	gwdt->clk = arch_timer_get_cntfrq();
>
> Just thinking out loud...
>
> What happens later if we virtualize this device within KVM/QEMU/Xen and
> then live migrate to another system in which the frequency changes?
>

Thinking about it, this scenario would cause severe trouble. I think clocks
(like I would assume pretty much all other hardware parameters / registers)
need to be virtualized and must not change.

Example: clock is set to 100 kHz on original system, and 400 kHz on new
system. Timeout is set to 30s, and registers are programmed accordingly.
User space sends heartbeats every 15 seconds.

In this scenario, the watchdog would time out after 30/4 = 7.5 seconds
on the new system, or in other words almost immediately.

This would be even worse if the original system had a clock of, say,
10 kHz and the new system would use 400 kHz. This just doesn't work.

Guenter

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
