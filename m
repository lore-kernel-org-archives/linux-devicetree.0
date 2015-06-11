From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v5 4/8] Watchdog: introdouce "pretimeout" into framework
Date: Thu, 11 Jun 2015 09:38:43 -0700
Message-ID: <20150611163843.GA23656@roeck-us.net>
References: <=fu.wei@linaro.org>
 <1433943713-32466-1-git-send-email-fu.wei@linaro.org>
 <1433943713-32466-5-git-send-email-fu.wei@linaro.org>
 <5578641E.1060209@roeck-us.net>
 <CADyBb7uzf0CUop5q9V2xmzmNvxPr8b+OEaV-0GxjmVvxKvRCeA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CADyBb7uzf0CUop5q9V2xmzmNvxPr8b+OEaV-0GxjmVvxKvRCeA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fu Wei <fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Suravee Suthikulpanit <Suravee.Suthikulpanit-5C7GfCeVMHo@public.gmane.org>, Linaro ACPI Mailman List <linaro-acpi-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wei Fu <tekkamanninja-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, G Gregory <graeme.gregory-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Al Stone <al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Hanjun Guo <hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Timur Tabi <timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ashwin Chaugule <ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Vipul Gandhi <vgandhi-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Leo Duran <leo.duran-5C7GfCeVMHo@public.gmane.org>, Jon Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jun 11, 2015 at 07:22:44PM +0800, Fu Wei wrote:
> Hi Guenter,
> 
[ ... ]
> 
> > value we are trying to set. Effectively the above accepts every pretimeout
> > if wdd->pretimeout is 0. It also accepts every pretimeout if
> > max_pretimeout == 0, even if wdd->timeout is set and t >= wdd->timeout.
> >
> > Try
> >
> >         return (wdd->max_pretimeout && (t < wdd->min_pretimeout ||
> >                                         t > wdd->max_pretimeout)) ||
> >                 (wdd->timeout && t >= wdd->timeout);
> >
> >>   }
> 
> /*
>  * Use the following function to check if a pretimeout value is invalid.
>  * It can be "0", that means we don't use pretimeout.
>  * This function returns 0, when pretimeout is 0.

returns false if pretimeout is 0.

>  */
> static inline bool watchdog_pretimeout_invalid(struct watchdog_device *wdd,
>                            unsigned int t)
> {
>     return t && (wdd->max_pretimeout &&
>         (t < wdd->min_pretimeout || t > wdd->max_pretimeout)) ||
>            (wdd->timeout && t >= wdd->timeout);
> }
> 
Makes sense. Be careful with (), though. This evaluates to

	return t && (...) || (wdd->timeout && t >= wdd->timeout);

but it should probably be
	return t && ((...) || (wdd->timeout && t >= wdd->timeout));

That doesn't make a difference in practice (if t == 0, it is never >= timeout
if timeout is > 0), but it would be a bit cleaner.

> 
> >>
> >>   /* Use the following functions to manipulate watchdog driver specific
> >> data */
> >> @@ -132,11 +153,20 @@ static inline void *watchdog_get_drvdata(struct
> >> watchdog_device *wdd)
> >>   }
> >>
> >>   /* drivers/watchdog/watchdog_core.c */
> >> -extern int watchdog_init_timeout(struct watchdog_device *wdd,
> >> -                                 unsigned int timeout_parm, struct device
> >> *dev);
> >> +int watchdog_init_timeouts(struct watchdog_device *wdd,
> >> +                                 unsigned int pretimeout_parm,
> >> +                                 unsigned int timeout_parm,
> >> +                                 struct device *dev);
> >
> >
> > Please align continuation lines with '('.
> 
> Fixed , thanks
> 
> >
> >
> >>   extern int watchdog_register_device(struct watchdog_device *);
> >>   extern void watchdog_unregister_device(struct watchdog_device *);
> >>
> >> +static inline int watchdog_init_timeout(struct watchdog_device *wdd,
> >> +                                       unsigned int timeout_parm,
> >> +                                       struct device *dev)
> >> +{
> >> +       return watchdog_init_timeouts(wdd, 0, timeout_parm, dev);
> >> +}
> >> +
> >>   #ifdef CONFIG_HARDLOCKUP_DETECTOR
> >>   void watchdog_nmi_disable_all(void);
> >>   void watchdog_nmi_enable_all(void);
> >>
> >
> 
> 
> 
> -- 
> Best regards,
> 
> Fu Wei
> Software Engineer
> Red Hat Software (Beijing) Co.,Ltd.Shanghai Branch
> Ph: +86 21 61221326(direct)
> Ph: +86 186 2020 4684 (mobile)
> Room 1512, Regus One Corporate Avenue,Level 15,
> One Corporate Avenue,222 Hubin Road,Huangpu District,
> Shanghai,China 200021
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
