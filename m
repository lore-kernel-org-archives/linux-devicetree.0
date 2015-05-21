From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v2 6/7] Watchdog: introduce ARM SBSA watchdog driver
Date: Thu, 21 May 2015 08:28:38 -0700
Message-ID: <20150521152838.GB16668@roeck-us.net>
References: <=fu.wei@linaro.org>
 <1432197156-16947-1-git-send-email-fu.wei@linaro.org>
 <1432197156-16947-7-git-send-email-fu.wei@linaro.org>
 <555DB4C4.5090606@roeck-us.net>
 <555DD8EE.1060607@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <555DD8EE.1060607-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Timur Tabi <timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Suravee.Suthikulpanit-5C7GfCeVMHo@public.gmane.org, linaro-acpi-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tekkamanninja-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, graeme.gregory-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, vgandhi-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, leo.duran-5C7GfCeVMHo@public.gmane.org, corbet-T1hC0tSOHrs@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, May 21, 2015 at 08:09:02AM -0500, Timur Tabi wrote:
> Guenter Roeck wrote:
> >>
> >>+static unsigned int sbsa_gwdt_get_timeleft(struct watchdog_device *wdd)
> >>+{
> >>+    struct sbsa_gwdt *gwdt = to_sbsa_gwdt(wdd);
> >>+    u64 timeleft = sbsa_gwdt_get_wcv(wdd) - arch_counter_get_cntvct();
> >>+
> >
> >Still not happy about the use of arch_counter_get_cntvct
> >instead of using the clock subsystem. I am quite sure this could be done,
> >possibly through arch_sys_counter, though at this point I am getting wary
> >of bringing it up, so I guess I'll just let it go.
> 
> You made the same comment with my driver, and I keep asking for
> clarification.  The clk_get_sys() API does not work on my system, because
> there are not clocks defined.  That must be an ACPI limitation that I can't
> fix.
> 
Would it be possible to define such clocks ?

> The alternative to arch_counter_get_cntvct() is arch_timer_read_counter(),
> which is not exported.  So we have two choices,
> 
> 1) Continue to use arch_counter_get_cntvct(), which works on all ARM64
> platforms that this driver supports anyway
> 
> 2) Export arch_timer_read_counter()
> 
> I prefer option #1.
> 
Do we have any feedback from the arm maintainers ?

My problem is that I don't want to be the first one to permit using
those functions outside architecture and clock code. If we do this,
we should get an Ack from an arm maintainer specifically for the use
of arch_counter_get_cntvct() and arch_timer_get_rate().

Thanks,
Guenter
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
