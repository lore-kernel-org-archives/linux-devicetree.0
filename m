From: Timur Tabi <timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [Linaro-acpi] [PATCH v8 5/5] Watchdog: introduce ARM SBSA
 watchdog driver
Date: Thu, 5 Nov 2015 07:47:04 -0600
Message-ID: <563B5DD8.901@codeaurora.org>
References: <1445961999-9506-1-git-send-email-fu.wei@linaro.org>
 <1445961999-9506-6-git-send-email-fu.wei@linaro.org>
 <CAOZdJXV8x8EMQEZhdFS+34iO+6P9S==k9bQjt=67iXt6K2oSCw@mail.gmail.com>
 <563AE588.1080009@roeck-us.net>
 <CADyBb7tTf0Jz0sgKecSn-LgMEUMdueTb5Uxq_e5t39byOsJQEQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CADyBb7tTf0Jz0sgKecSn-LgMEUMdueTb5Uxq_e5t39byOsJQEQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fu Wei <fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: Linaro ACPI Mailman List <linaro-acpi-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Rafael J. Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Pratyush Anand <panand-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Wei Fu <tekkamanninja-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Vipul Gandhi <vgandhi-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Dave Young <dyoung-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Fu Wei wrote:
> (1)It is not new.
>   pre-timeout concept has been used by two drivers before this driver.
> and this concept has been in kernel documentation.

It's "new" in that it's a new infrastructure.  The private API of two 
other drivers doesn't count.

> (1) if we don't, for this two stages timeout, we have to config them
> by one value.
> that means "the first stage timeout" have to be equal to "the second
> stage timeout",
> For example, if we need 60 second for  "the second stage timeout", 30
> or less for "the first stage timeout".
> then "the first stage timeout" have to be 60s too. I don't think it 's
> good idea.

Why do we care about two stages?  Don't have a pre-timeout, and just 
have one stage: the WS1 reset.  Ignore the WS0 interrupt, and program 
the timeout so that WS1 is the reset.

I'm not saying that pre-timeout is a terrible idea and we should never 
do it.  I'm saying that it's not an important feature, and we should 
only support it to the extent that the hardware provides the feature. 
We should definitely not make the driver more complicated and less safe.

If we agree that an SBSA watchdog allows for a pre-timeout at half-way 
through timeout, and that software can't change this, then we can use 
WS0 as the pre-timeout and applications just have to deal with that. 
The hardware is programmed to reset via WS1, and all we do in the 
interrupt handler is notify the application that a pre-timeout has 
occurred.

-- 
Sent by an employee of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the
Code Aurora Forum, hosted by The Linux Foundation.
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
