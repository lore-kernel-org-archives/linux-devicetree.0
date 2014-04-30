From: Dave Martin <Dave.Martin-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v3 5/6] arm: exynos: Add MCPM call-back functions
Date: Wed, 30 Apr 2014 11:24:18 +0100
Message-ID: <20140430102418.GB3986@e103592.cambridge.arm.com>
References: <1398528348-21214-1-git-send-email-a.kesavan@samsung.com>
 <1398528348-21214-6-git-send-email-a.kesavan@samsung.com>
 <20140428174456.GE31782@e102568-lin.cambridge.arm.com>
 <CAM4voa=mhcZO9v7nDdrcz+T8RVN-Av3eERVErCX52k1ftUcKcQ@mail.gmail.com>
 <alpine.LFD.2.11.1404291435450.980@knanqh.ubzr>
 <CAM4voa=Po9r5MpxyjQKcYhyES1UjfVaqbP_PnKCbsw5LtEkpZg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAM4voa=Po9r5MpxyjQKcYhyES1UjfVaqbP_PnKCbsw5LtEkpZg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Abhilash Kesavan <kesavan.abhilash-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lorenzo Pieralisi <Lorenzo.Pieralisi-5wv7dgnIgG8@public.gmane.org>, "daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org" <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "thomas.ab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <thomas.ab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "inderpal.s-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <inderpal.s-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, "arnd-r2nGTMty4D4@public.gmane.org" <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 30, 2014 at 04:01:24AM +0100, Abhilash Kesavan wrote:
> Hi Nicolas,
> 
> On Wed, Apr 30, 2014 at 12:19 AM, Nicolas Pitre
> <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> > On Tue, 29 Apr 2014, Abhilash Kesavan wrote:
> >
> >> >> +/*
> >> >> + * Enable cluster-level coherency, in preparation for turning on the MMU.
> >> >> + */
> >> >> +static void __naked exynos_pm_power_up_setup(unsigned int affinity_level)
> >> >> +{
> >> >> +       asm volatile ("\n"
> >> >> +       "cmp    r0, #1\n"
> >> >> +       "bxne   lr\n"
> >> >> +       "b      cci_enable_port_for_self");
> >> >> +}
> >> >
> >> > How many times are we going to duplicate this function before we decide
> >> > to move it to a common header ?
> >> I see this being used in arch/arm/mach-vexpress/tc2_pm.c (where I
> >> copied it from for exynos) and arch/arm/mach-vexpress/dcscb.c. A
> >> common function named "mcpm_default_power_up_setup" in the mcpm header
> >> would be acceptable ?
> >
> > Not necessarily.
> >
> > First of all, this can't be a static inline as we need a pointer to it.
> > And moving this to a header would create multiple instances of the same
> > function in a multiplatform build for example.
> >
> > Furthermore, this can't be called "default_power_up_setup" as this is
> > specific to systems with a CCI.

On some SoCs the argument to cmp might not be #1, or the constant required
might not even be the same on all CPUs.  Some SoCs might need to do other
setup too, such as invalidating a cluster-level cache that doesn't power
up into a clean state.

So, the above function is going to be common but it's not really generic.

For such a tiny function, I agree that factoring it may not be that
beneficial.

Cheers
---Dave
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
