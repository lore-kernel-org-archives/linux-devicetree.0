From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v2 03/10] Clocksource: add nuc970 clocksource driver
Date: Thu, 21 Jul 2016 14:54:42 +0200
Message-ID: <6378088.D2hhHiJIV0@wuerfel>
References: <1468135649-19980-1-git-send-email-vw@iommu.org> <26830152.1oBSpuVOM0@wuerfel> <20160721125224.GA10047@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160721125224.GA10047-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Wan Zongshun <vw-6ukY98dZOFrYtjvyW6yDsg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, Wan Zongshun <mcuos.com-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thursday, July 21, 2016 2:52:24 PM CEST Daniel Lezcano wrote:
> On Tue, Jul 12, 2016 at 10:28:35AM +0200, Arnd Bergmann wrote:
> 
> [ ... ]
> 
> > > > Also the init function has changed its return type in linux-next:
> > > >
> > > >> +static void __init nuc970_timer_of_init(struct device_node *node)
> > > >
> > > > This now needs to return an error code or we get:
> > > >
> > > > ../include/linux/of.h:1004:20: error: comparison of distinct pointer types lacks a cast [-Werror]
> > > >          .data = (fn == (fn_type)NULL) ? fn : fn  }
> > > >
> > > > Daniel Lezcano seems to have implemented a migration strategy, but I
> > > > can't see what you are supposed to do here, since the
> > > > CLOCKSOURCE_OF_DECLARE_RET macro is no longer part of linux-next.
> > > 
> > > Wait for Daniel's comments? or what should I do now?
> > 
> > Yes, let's see what he says. I guess from the timing, this will probably
> > have to wait for linux-4.9 anyway, and then we have no problem because the
> > API change will make it into 4.8.
> 
> CLOCKSOURCE_OF_DECLARE_RET was renamed back to CLOCKSOURCE_OF_DECLARE but it 
> expects now an init function returning an 'int'.
> 
> These changes are now in tip/timers/core, so in linux-next.

Ok, so the driver could be merged on top of that, but it's really
late for 4.8 now, so we'd just wait until after the merge window
anyway.

	Arnd

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
