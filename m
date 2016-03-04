From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: bcm2835: Add devicetree for the Raspberry Pi 3.
Date: Fri, 4 Mar 2016 18:59:24 +0000
Message-ID: <20160304185923.GC5033@leverpostej>
References: <1457116769-8567-1-git-send-email-eric@anholt.net>
 <1457116769-8567-2-git-send-email-eric@anholt.net>
 <20160304184136.GB5033@leverpostej>
 <874mcm3wfs.fsf@eliezer.anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <874mcm3wfs.fsf-omZaPlIz5HhaEpDpdNBo/KxOck334EZe@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Cc: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Mar 04, 2016 at 10:55:03AM -0800, Eric Anholt wrote:
> Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> writes:
> 
> > On Fri, Mar 04, 2016 at 10:39:29AM -0800, Eric Anholt wrote:
> >> For now this doesn't support the new hardware present on the Pi 3 (BT,
> >> wifi, GPIO expander).  Since the GPIO expander isn't supported, we
> >> also don't have the LEDs like the other board files do.
> >> 
> >> Signed-off-by: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
> >> ---
> >>  arch/arm/boot/dts/Makefile            |  3 +-
> >>  arch/arm/boot/dts/bcm2837-rpi-3-b.dts | 22 ++++++++++++
> >>  arch/arm/boot/dts/bcm2837.dtsi        | 68 +++++++++++++++++++++++++++++++++++
> >>  3 files changed, 92 insertions(+), 1 deletion(-)
> >>  create mode 100644 arch/arm/boot/dts/bcm2837-rpi-3-b.dts
> >>  create mode 100644 arch/arm/boot/dts/bcm2837.dtsi
> >
> >> +	timer {
> >> +		compatible = "arm,armv7-timer";
> >> +		interrupt-parent = <&local_intc>;
> >> +		interrupts = <0>, // PHYS_SECURE_PPI
> >> +			     <1>, // PHYS_NONSECURE_PPI
> >> +			     <3>, // VIRT_PPI
> >> +			     <2>; // HYP_PPI
> >> +		always-on;
> >> +	};
> >
> > Are the CPUs in an always-on power domain? Or is it jsut that the kernel
> > doesn't perform power management of CPUs?
> >
> > The always-on proeprty is only intended for the former.
> 
> The kernel doesn't get to do power management of CPUs.  We only have
> control of power domains through the firmware, and the firmware's
> keeping the CPU domain on.

So there is no way that the CPUs could request for the firmare to place
them in a state where the timer would lose context (but other events
coukd wake them up), even if they don't do that today?

Mark
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
