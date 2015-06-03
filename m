From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v4 5/7] Watchdog: introduce ARM SBSA watchdog driver
Date: Wed, 3 Jun 2015 11:25:03 -0700
Message-ID: <20150603182503.GD6460@roeck-us.net>
References: <=fu.wei@linaro.org>
 <1433217907-928-1-git-send-email-fu.wei@linaro.org>
 <1433217907-928-6-git-send-email-fu.wei@linaro.org>
 <556F4489.6030206@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <556F4489.6030206-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Timur Tabi <timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Suravee.Suthikulpanit-5C7GfCeVMHo@public.gmane.org, linaro-acpi-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tekkamanninja-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, graeme.gregory-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, vgandhi-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, leo.duran-5C7GfCeVMHo@public.gmane.org, corbet-T1hC0tSOHrs@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jun 03, 2015 at 01:16:41PM -0500, Timur Tabi wrote:
> On 06/01/2015 11:05 PM, fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org wrote:
> >+	if (wdd->pretimeout)
> >+		/* The pretimeout is valid, go panic */
> >+		panic("SBSA Watchdog pre-timeout");
> 
> The problem with this is that WS1 will still occur.  So a few seconds after
> the panic() call, the hardware will reset.  There won't be any time to debug
> or log anything.
> 

In general the idea here would be to use a crashdump kernel, which,
when loaded, would reset the watchdog before it fires. This kernel
would then write a core dump to a specified location. 

If arm64 doesn't support a crashdump kernel, it might still be possible
to log the backtrace somewhere (eg in nvram using pstore if that is
supported via acpi or efi).

Is there reason to believe that this all won't work on arm64 ?

Thanks,
Guenter
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
