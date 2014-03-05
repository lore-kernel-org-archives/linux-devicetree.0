From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: imx6qdl-sabresd.dtsi: Add red led
Date: Wed, 5 Mar 2014 19:39:26 +0000
Message-ID: <20140305193925.GY21483@n2100.arm.linux.org.uk>
References: <20140305062216.GI8784@S2101-09.ap.freescale.net> <1394007383-21874-1-git-send-email-vincent.stehle@freescale.com> <20140305114223.GN8784@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140305114223.GN8784-rvtDTF3kK1ictlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Vincent =?iso-8859-1?Q?Stehl=E9?= <vincent.stehle-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Mar 05, 2014 at 07:42:28PM +0800, Shawn Guo wrote:
> It's not a hog pin, so shouldn't be added here.  (Right, most of the
> existing pins shouldn't be here from the beginning)

On the subject of that kind of thing... I have an issue with the existing
pinmux stuff.  This is a wider issue than your discussion above...

I regard the idea of requiring the pinmux to be configured as part of
the driver probe a rather broken concept - yes, it makes sense in some
scenarios, but for the vast majority of cases, it doesn't.

Let's take an example.  A pin is wired to a SPDIF transceiver.  The
out-of-reset SoC configuration results in the pin turning the LED on
in the SPDIF transceiver.

With the way stuff is setup, with the driver having the pinmux settings
for itself, the point at which that pin gets configured is when the
driver loads, which may be a module - so that can happen quite late in
the boot sequence.  A failure to boot can result in it not happening at
all.

So, this brings up the obvious question: is this proper behaviour of the
hardware, or is this something we should do better with - such as where
we know what the settings should be for a platform, and these settings
never change, we arrange for that to happen at kernel boot time as a
once-off.

For example, in the above case, we know it's board XYZ, we know that this
pin is connected to the SPDIF transceiver, so maybe we should configure
it early on in the boot sequence whether or not the driver has been
configured and/or loaded.

Comments?

-- 
FTTC broadband for 0.8mile line: now at 9.7Mbps down 460kbps up... slowly
improving, and getting towards what was expected from it.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
