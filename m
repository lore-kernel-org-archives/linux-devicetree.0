From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH v4 07/11] ARM: allow MULTIPLATFORM with !MMU
Date: Sun, 5 Apr 2015 17:10:14 +0100
Message-ID: <20150405161014.GG13898@n2100.arm.linux.org.uk>
References: <1428090292-21693-1-git-send-email-stefan@agner.ch>
 <1428090292-21693-8-git-send-email-stefan@agner.ch>
 <20150403200931.GD13898@n2100.arm.linux.org.uk>
 <1f84d767d3bb8a8c470a26064cba454e@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1f84d767d3bb8a8c470a26064cba454e-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Cc: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Apr 04, 2015 at 01:56:20AM +0200, Stefan Agner wrote:
> On 2015-04-03 22:09, Russell King - ARM Linux wrote:
> > On Fri, Apr 03, 2015 at 09:44:48PM +0200, Stefan Agner wrote:
> >> In order to support SoC with heterogenous CPU architectures (such
> >> as Freescale Vybrid/i.MXSX) it is preferable to use the same
> >> architecture (ARCH_MXC in this case) for the MMU enabled and !MMU
> >> CPU. Hence allow to select MULTIPLATFORM even without MMU.
> >>
> >> Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
> >> ---
> >>  arch/arm/Kconfig | 21 ++++++++++-----------
> >>  1 file changed, 10 insertions(+), 11 deletions(-)
> >>
> >> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> >> index 9f1f09a..636cb3f 100644
> >> --- a/arch/arm/Kconfig
> >> +++ b/arch/arm/Kconfig
> >> @@ -230,7 +230,7 @@ config VECTORS_BASE
> >>  	  in size.
> >>
> >>  config ARM_PATCH_PHYS_VIRT
> >> -	bool "Patch physical to virtual translations at runtime" if EMBEDDED
> >> +	bool "Patch physical to virtual translations at runtime" if EMBEDDED || (ARCH_MULTIPLATFORM && MMU)
> >>  	default y
> > 
> > This makes no sense.  Multiplatform MMU _requires_ this feature, so why
> > offer it to the user when multiplatform is enabled _and_ MMU is enabled?
> 
> I see, this is plain wrong. Will replace that with a select ... if MMU
> in multiplatform.

I think what I'd like to see is, in the top level choice:

config ARM_SINGLE_ARMV7M
	bool "ARM architecture v7M compliant (Cortex-M0/M3/M4) SoC"
	depends on !MMU
	select ARM_NVIC
	... etc ...

which then allows a /multiplatform/ v7M kernel to be built, allowing the
selection of EFM32, SOC_VF610, and any other v7M compliant SoC.

So, it's very similar to multiplatform in the sense that several SoCs
can be built together, but we preserve the need not to build
incompatible stuff together.

Thoughts?

-- 
FTTC broadband for 0.8mile line: currently at 10.5Mbps down 400kbps up
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
