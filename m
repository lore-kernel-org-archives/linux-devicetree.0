From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v2 3/4] drivers: reset: Add STM32 reset driver
Date: Thu, 28 Jul 2016 16:29:18 +0200
Message-ID: <1469716158.12835.54.camel@pengutronix.de>
References: <1469092768-17489-1-git-send-email-gabriel.fernandez@st.com>
	 <34955897.5sjo821nJx@wuerfel> <20160721231602.GK21225@windriver.com>
	 <4648059.qaGUNaKlSl@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4648059.qaGUNaKlSl@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, gabriel.fernandez-qxv4g6HH51o@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, patrice.chotard-qxv4g6HH51o@public.gmane.org, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, alexandre.torgue-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Freitag, den 22.07.2016, 21:25 +0200 schrieb Arnd Bergmann:
> On Thursday, July 21, 2016 7:16:02 PM CEST Paul Gortmaker wrote:
> 
> > > > ...we probably don't need module.h here or any of the other
> > > > MODULE_<blah> tags/macros either.  Use the builtin for the
> > > > register and all should be good.
> > > 
> > > I wonder if we should have separate symbols for each reset driver
> > > instead. Those could be allowed to be tristate, and could also
> > > be enabled for compile testing on other architectures.
> > 
> > I'm not quite clear on what you mean by the above.  Maybe if you have a
> > pointer to an example -- say like the work you mention below -- then
> > I'll understand what you have in mind.
> 
> I mean instead of having each driver compiled implicitly when the
> ARCH_* symbol is enabled, make the drivers user-selectable
> and just default to 'y' when the platform is enabled. This would
> let us actually use modular reset drivers where appropriate
> (which might be nowhere, but at least we wouldn't forbid it
> for no reason).

I agree with this for the drivers that could be built as a module
(which is most of them).
I don't think it is useful for the builtin drivers to have user visible
Kconfig symbols.

> Another annoying thing is that all platforms today need to
> select two symbols
> 
>  	select ARCH_HAS_RESET_CONTROLLER
> 	select RESET_CONTROLLER
> 
> in order to actually build the driver, and the second one is
> user-selectable, meaning you can still disable all of them today,
> just not individual drivers.

RESET_CONTROLLER is default y if ARCH_HAS_RESET_CONTROLLER, so if
platforms select ARCH_HAS_RESET_CONTROLLER, that should be enough.

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
