From: Timur Tabi <timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v2 6/7] Watchdog: introduce ARM SBSA watchdog driver
Date: Thu, 21 May 2015 11:33:01 -0500
Message-ID: <555E08BD.9010603@codeaurora.org>
References: <=fu.wei@linaro.org>	<1432197156-16947-1-git-send-email-fu.wei@linaro.org>	<1432197156-16947-7-git-send-email-fu.wei@linaro.org>	<555DB4C4.5090606@roeck-us.net>	<CADyBb7vbcHG69cpnx6sUwaT7abS7w3Er62+50D6PUrGHVnG9vQ@mail.gmail.com>	<20150521151847.GA16668@roeck-us.net>	<CADyBb7tPjZrty-B=Lis_zdObxM1_MRcKCinOx3K73=6juxsikw@mail.gmail.com>	<20150521155950.GA18300@roeck-us.net> <CADyBb7vwGcdxeOE+QEzgmF5=2dsk83F4WyfJvp2ccZ12w1qYHQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CADyBb7vwGcdxeOE+QEzgmF5=2dsk83F4WyfJvp2ccZ12w1qYHQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fu Wei <fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: Suravee Suthikulpanit <Suravee.Suthikulpanit-5C7GfCeVMHo@public.gmane.org>, Linaro ACPI Mailman List <linaro-acpi-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wei Fu <tekkamanninja-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, G Gregory <graeme.gregory-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Al Stone <al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Hanjun Guo <hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ashwin Chaugule <ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, vgandhi-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Leo Duran <leo.duran-5C7GfCeVMHo@public.gmane.org>, Jon Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 05/21/2015 11:12 AM, Fu Wei wrote:
>> >
>> >Having said that, my personal preference would be for the counter
>> >and rate to be exported through the clock subsystem (ie with
>> >clk_get_rate). But that would still not provide the current counter
>> >value, so maybe that isn't even possible.
> I will try to make a patch for this, If the arm maintainers don't like
> exporting "arch_timer_get_rate();"
>
> But your thought is good,  the clk_get_rate is the best way to do for now

The rate isn't the problem.  It's the current timestamp counter.  The 
only way to get that is with either arch_counter_get_cntvct() or 
arch_timer_read_counter().  I'm not sure which of the two functions is 
better.  However, arch_timer_read_counter() is really just a function 
pointer that points to arch_counter_get_cntvct().

Also, clk_get_rate() only works if you have a real clk object.  I've 
said this before many times, but on my ACPI platform, there are no clk 
objects.  Clocks are handled by UEFI.

-- 
Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
