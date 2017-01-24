From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 2/2] clocksource: Add renesas-ostm timer driver
Date: Tue, 24 Jan 2017 15:32:22 +0100
Message-ID: <20170124143222.GA2021@mai>
References: <20170123135423.28780-1-chris.brandt@renesas.com>
 <20170123135423.28780-3-chris.brandt@renesas.com>
 <20170123175210.GH2166@mai>
 <SG2PR06MB11657AE9653A4B66B1EA02718A750@SG2PR06MB1165.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <SG2PR06MB11657AE9653A4B66B1EA02718A750-ESzmfEwOt/xoAsOJh7vwSm0DtJ1/0DrXvxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Brandt <Chris.Brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 24, 2017 at 04:45:47AM +0000, Chris Brandt wrote:

Hi Chris,

[ ... ]

> > > +	bool "Renesas OSTM timer driver" if COMPILE_TEST
> > > +	depends on GENERIC_CLOCKEVENTS
> > > +	select CLKSRC_MMIO
> > > +	default SYS_SUPPORTS_RENESAS_OSTM
> > 
> > - default SYS_SUPPORTS_RENESAS_OSTM
> > 
> > Except I missing something, I don' the point of having this intermediate
> > config option.
> 
> I was basically following what all the other clocksource drivers do.
> Selecting an ARCH will then set SYS_SUPPORTS_xxTIMERxx which will then
> force xxTIMERxx=y.

Yeah, little by little these options are clean up to be more consistent across
the different drivers. The sh/mtu drivers are different from the other drivers.

The idea with the config option is to let the platform to select the drivers,
and optionnaly allows the compilation on other architecture to increase the
compilation test coverage. That is the reason of COMPILE_TEST.

> But, if "COMPILE_TEST" is set, you can choose what clocksource timers
> you want to build in.
> 
> Is your suggestion to do away with the COMPILE_TEST ability and
> just force RENESAS_OSTM=y if ARCH_R7S72100 is selected?

Just like that:

config RENESAS_OSTM
	bool "Renesas OSTM timer driver" if COMPILE_TEST
	depends on GENERIC_CLOCKEVENTS
	select CLKSRC_MMIO
	help
	  Enables the support for the Renesas OSTM

And then from arch/arm/mach-shmobile/Kconfig:

	select RENESAS_OSTM


> > > +#include <linux/module.h>
> > 
> > Please remove everything module related here and below. This driver is not
> > supposed to be removed and it is compiled in with the Kconfig option.
> 
> Good point. I will remove.
> 
> I guess if you can't compile it as a module, you don't need things like
> 'MODULE_LICENSE'.

Right.

[ ... ]

> > > +static int __init ostm_init_clksrc(struct ostm_device *ostm) {
> > > +	int ret;
> > > +
> > > +	/* irq not used (clock sources don't use interrupts) */
> > > +
> > > +	/* stop counter */
> > 
> > One line comment is usually in the network code. Please use multiline.
> > 
> > /*
> >  * Bla bla
> >  */
> 
> I'm confused. Do you mean:
> 
> A) use multiline formatting for every single-line comment throughout
>    the file?
> 
> B) use multiline for any place where you have 2 or more single-line
>    comments back to back?

I think it is simpler if you just ignore my comment, remove all your comments
in this function, implement a couple of wrapper (eg. clksrc_stop, clksrc_start)
which will speak by themselves.

By the way, is it normal stopping the clockevent is the same code than stopping
the clocksource ?

[ ... ]

> > > +	if (!is_early_platform_device(pdev)) {
> > > +		pm_runtime_set_active(&pdev->dev);
> > > +		pm_runtime_enable(&pdev->dev);
> > > +	}
> > 
> > Can you clarify why the 'early' is needed here ?
> 
> Actually, it means nothing.
> 
> I was using sh_mtu2.c and sh_cmt.c as reference and they were registering
> an "earlytimer" which made me think the kernel would probe this driver
> early in boot....but....now I see that is just a SH4 kernel specific thing.
> 
> So, I will remove all the early platform reference stuff.
> 
> Of course I still have the question of how are you supposed to get a
> clocksource up and running early in boot. (but I'll figure that out later).

Until the hardware clocksource is registered, the jiffies are used as source of
time. That happens at the very early boot time. The clockevent must be
registered early to update the jiffies but you won't have to care about that if
you use the macro below.

[ ... ]

> > > +early_platform_init("earlytimer", &ostm_timer);
> > > +subsys_initcall(ostm_init); module_exit(ostm_exit);
> > > +
> > > +MODULE_AUTHOR("Chris Brandt");
> > > +MODULE_DESCRIPTION("Renesas OSTM Timer Driver"); MODULE_LICENSE("GPL
> > > +v2");
> > 
> > Maybe you can try with builtin_platform ?
> 
> Good idea. But, now I get a "Section mismatch" during link time so I'll
> have to figure out why that is.

Mmh, I think it would be more consistent to convert this to:

CLOCKSOURCE_OF_DECLARE(ostm, "renesas,ostm", ostm_init);

The only problem is to get the struct device associated to the of_node passed
as parameter to ostm_init in order to use the devm_* API.

I think of_find_device_by_node should return the platform_device, then
pdev->dev. If that works the other drivers will benefit from that to remove all
the rollback code everywhere.

  -- Daniel

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
