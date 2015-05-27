From: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v3 6/6] ACPI: import watchdog info of GTDT into platform
 device
Date: Wed, 27 May 2015 11:44:08 +0100
Message-ID: <20150527104408.GB29002@arm.com>
References: <=fu.wei@linaro.org>
 <1432548193-19569-1-git-send-email-fu.wei@linaro.org>
 <1432548193-19569-7-git-send-email-fu.wei@linaro.org>
 <20150526122858.GJ1565@arm.com>
 <CAJ5Y-eZfzrDtEL5gpZ1rRNUhr2dCZKuA-MMNcwV=TgFW_9rq=g@mail.gmail.com>
 <20150526151842.GP1565@arm.com>
 <20150526153613.GA22487@roeck-us.net>
 <CADyBb7uMh3vKktXa1VJJdchcCQPyOuZ=5ztxoujjyjmxWGhq5w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CADyBb7uMh3vKktXa1VJJdchcCQPyOuZ=5ztxoujjyjmxWGhq5w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fu Wei <fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Ashwin Chaugule <ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "suravee.suthikulpanit-5C7GfCeVMHo@public.gmane.org" <suravee.suthikulpanit-5C7GfCeVMHo@public.gmane.org>, "linaro-acpi-cunTk1MwBs8s++Sfvej+rw@public.gmane.org" <linaro-acpi-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, "linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "tekkamanninja-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <tekkamanninja-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "graeme.gregory-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <graeme.gregory-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "arnd-r2nGTMty4D4@public.gmane.org" <arnd-r2nGTMty4D4@public.gmane.org>, "vgandhi-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <vgandhi-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org" <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, "jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 26, 2015 at 05:27:33PM +0100, Fu Wei wrote:
> On 26 May 2015 at 23:36, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org> wrote:
> > On Tue, May 26, 2015 at 04:18:42PM +0100, Will Deacon wrote:
> >> Sure, the device it describes may only ever exist on ARM systems, but by
> >> that logic then we should be moving lots of drivers back under arch/arm[64].
> >>
> > It is nt the driver, but its instantiation. The question here would be
> > how and where to instantiate the driver, not where the driver itself
> > is located. The driver itself is ACPI agnostic.
> 
> I really don't mind to refactor the code, If we can make this patch better.
> 
> But for now, I can't see the good reason to move ACPI-relevant code
> into a watchdog driver.

I don't really mind where you move it, just as long as it's outside of
arch/arm64.

> The reasons I put the code here are
> (1)SBSA watchdog only for ARM64
> (2)GTDT only for ARM, design for ARM,
> (3)For ARM Architecture, only ARM64 support ACPI.
> 
> For minimizing arch/arm64/kernel/acpi.c, we can't put the code here,
> and we had better keep these code outside the driver,
> 
> So do you have any suggestion for the better location of the GTDT code?

I don't understand why you can't do the same as
drivers/clocksource/arm_arch_timer.c and parse the table directly in the
driver. If there are objections from the driver/subsystem maintainers then
it sounds like we need a mechanical ACPI table -> platform device
conversion in the core, like we have for device-tree.

Will
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
