From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: ARM topic: Is DT on ARM the solution, or is there something
	better?
Date: Mon, 21 Oct 2013 10:57:57 +0100
Message-ID: <20131021095757.GY25034@n2100.arm.linux.org.uk>
References: <52644A9E.3060007@wwwdotorg.org> <20131020231134.GR25034@n2100.arm.linux.org.uk> <20131021083242.GB30088@pengutronix.de> <20131021084854.GV25034@n2100.arm.linux.org.uk> <20131021092730.GF30088@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131021092730.GF30088-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 21, 2013 at 11:27:30AM +0200, Sascha Hauer wrote:
> If you have a better vision how imx-drm can be implemented without
> getting crazy I'd love to hear about it. Please also think about the two
> IPUs the i.MX6 has, the single one on i.MX5, parallel displays, HDMI
> displays, LVDS displays, VGA encoder on i.MX53, external I2C slave
> encoders,...

Well, the multi-driver solution is just too fragile: the problem
with it is you can never be sure when all the drivers have definitely
finished initialising.  This problem is made much worse should one of
them use deferred probing.

To put it another way - with a multi-driver solution, there is no
definite point you can say "okay, we got everything".

So, as long as a subsystem contains something that needs to be done
once everything is known (such as initialising the fb_helper), there
is a fundamental disconnect between a multi-driver solution and the
subsystem.  To put it another way, a multi-driver solution should
not be used.

The I2C slave encoder problem doesn't really come into this because
it's not really a separate driver - yes, it's modelled by a separate
driver but when analysed, it's not really using the driver model at
all.  The driver model is only really used to locate the required
driver.

Conceptually, the imx-drm hardware is not much different from the the
Armada/Dove display hardware: it too has the problem that there
can be several CRTCs and several display outputs.  In some ways it's
worse there because there isn't the same level of integration found
on i.MX - it just has VGA and parallel outputs.  If you want something
else, you need to stick a chip on the output.  In the case of HDMI,
that's a TDA998x device.

For that, I've opted not to even _try_ to come up with a DT solution
at present, because I know that trying to come up something that
represents the hardware will not work properly with DRM.  That's
exactly what everyone else should have done.

Then the effort would not be spent trying to come up with individual
DT solutions and driver specific hacks, but instead would be spent on
trying to sort out the DRM core to allow it to handle separately
pluggable connectors, encoders and crtcs.

I have been getting is pressure to come up with a fudge for the Armada
DRM to make it work with DT just like everything else: there was even
suggestions that the driver should not be merged because it doesn't
support DT, and as everyone is going DT, it would have very few users.
Quite rightfully, I refuse to fudge the driver and create yet another
abomination.  Thankfully, the subsystem maintainers agree that this
is something that can be worked on independently: it should be, it's
not a specific driver problem, it's a subsystem problem and it needs
solving for everyone.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
