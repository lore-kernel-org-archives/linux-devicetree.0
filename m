From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v2 6/7] Watchdog: introduce ARM SBSA watchdog driver
Date: Fri, 22 May 2015 08:01:45 -0700
Message-ID: <20150522150145.GA2930@roeck-us.net>
References: <=fu.wei@linaro.org>
 <1432197156-16947-7-git-send-email-fu.wei@linaro.org>
 <555F4236.7040206@linaro.org>
 <4095167.UOriXdSu53@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4095167.UOriXdSu53@wuerfel>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Hanjun Guo <hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Suravee.Suthikulpanit-5C7GfCeVMHo@public.gmane.org, linaro-acpi-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tekkamanninja-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, graeme.gregory-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, vgandhi-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, leo.duran-5C7GfCeVMHo@public.gmane.org, corbet-T1hC0tSOHrs@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, May 22, 2015 at 04:55:04PM +0200, Arnd Bergmann wrote:
> On Friday 22 May 2015 22:50:30 Hanjun Guo wrote:
> > > diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> > > index e5e7c55..25a0df1 100644
> > > --- a/drivers/watchdog/Kconfig
> > > +++ b/drivers/watchdog/Kconfig
> > > @@ -152,6 +152,18 @@ config ARM_SP805_WATCHDOG
> > >         ARM Primecell SP805 Watchdog timer. This will reboot your system when
> > >         the timeout is reached.
> > >
> > > +config ARM_SBSA_WATCHDOG
> > > +     tristate "ARM SBSA Generic Watchdog"
> > > +     depends on ARM || ARM64 || COMPILE_TEST
> > 
> > SBSA is for ARMv8-A based (64-bit) servers, no need to depends on ARM,
> > and why we depends on COMPILE_TEST?
> > 
> 
> I think it's a reasonable assumption that someone will sooner or later
> put that hardware into an ARM32 machine, or run a 32-bit kernel on
> a chip that has it.
> 
> While SBSA requires this watchdog device, nothing prevents SoC
> manufacturers from using the same design in something that is not
> a server.
> 
Tricky, though. Since teh driver uses arm specific clock functions,
I don't think this can compile on a non-arm machine.

Guenter
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
