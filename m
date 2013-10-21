From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: ARM topic: Is DT on ARM the solution, or is there something
 better?
Date: Tue, 22 Oct 2013 01:18:00 +0200
Message-ID: <20131021231800.GG30088@pengutronix.de>
References: <52644A9E.3060007@wwwdotorg.org>
 <20131020231134.GR25034@n2100.arm.linux.org.uk>
 <20131021083242.GB30088@pengutronix.de>
 <20131021084854.GV25034@n2100.arm.linux.org.uk>
 <20131021092730.GF30088@pengutronix.de>
 <20131021095757.GY25034@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131021095757.GY25034-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 21, 2013 at 10:57:57AM +0100, Russell King - ARM Linux wrote:
> On Mon, Oct 21, 2013 at 11:27:30AM +0200, Sascha Hauer wrote:
> > If you have a better vision how imx-drm can be implemented without
> > getting crazy I'd love to hear about it. Please also think about the two
> > IPUs the i.MX6 has, the single one on i.MX5, parallel displays, HDMI
> > displays, LVDS displays, VGA encoder on i.MX53, external I2C slave
> > encoders,...
> 
> Well, the multi-driver solution is just too fragile: the problem
> with it is you can never be sure when all the drivers have definitely
> finished initialising.  This problem is made much worse should one of
> them use deferred probing.
> 
> To put it another way - with a multi-driver solution, there is no
> definite point you can say "okay, we got everything".
> 
> So, as long as a subsystem contains something that needs to be done
> once everything is known (such as initialising the fb_helper), there
> is a fundamental disconnect between a multi-driver solution and the
> subsystem.  To put it another way, a multi-driver solution should
> not be used.
> 
> The I2C slave encoder problem doesn't really come into this because
> it's not really a separate driver - yes, it's modelled by a separate
> driver but when analysed, it's not really using the driver model at
> all.  The driver model is only really used to locate the required
> driver.
> 
> Conceptually, the imx-drm hardware is not much different from the the
> Armada/Dove display hardware: it too has the problem that there
> can be several CRTCs and several display outputs.  In some ways it's
> worse there because there isn't the same level of integration found
> on i.MX - it just has VGA and parallel outputs.  If you want something
> else, you need to stick a chip on the output.  In the case of HDMI,
> that's a TDA998x device.
> 
> For that, I've opted not to even _try_ to come up with a DT solution
> at present, because I know that trying to come up something that
> represents the hardware will not work properly with DRM.  That's
> exactly what everyone else should have done.
> 
> Then the effort would not be spent trying to come up with individual
> DT solutions and driver specific hacks, but instead would be spent on
> trying to sort out the DRM core to allow it to handle separately
> pluggable connectors, encoders and crtcs.

Been there, done that:

http://www.mail-archive.com/dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org/msg20927.html

The only relevant reaction I received (from Dave) was frustrating:

> I'm sorry to say I totally hate this on every level. I think I said to
> you before that midlayers are not the answer, and this is a hella big
> midlayer.

With this reaction it became basically impossible to sort out the DRM
core. Now we ended up with variants of the above layer implemented in
each driver, see the Exynos, imx-drm and Tegra drivers.

I hope Laurent has more success with CDF than I had with SDRM. We already
have patches adding CDF support for the imx-drm driver which look
promising.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
