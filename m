From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v7 08/13] ARM: unify MMU/!MMU addruart calls
Date: Tue, 19 May 2015 20:24:04 +0200
Message-ID: <5548280.7uBnLuun8k@wuerfel>
References: <1431769465-26867-1-git-send-email-stefan@agner.ch> <2419398.cbLWQC7K5f@wuerfel> <b41ebeb9d62b9c49faec6500f73460b9@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <b41ebeb9d62b9c49faec6500f73460b9-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, mark.rutland-5wv7dgnIgG8@public.gmane.org, mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 19 May 2015 18:06:53 Stefan Agner wrote:
> On 2015-05-19 13:50, Arnd Bergmann wrote:
> > On Tuesday 19 May 2015 13:23:22 Stefan Agner wrote:
> >> On 2015-05-19 12:16, Russell King - ARM Linux wrote:
> <snip>
> >> Not sure how we can deal with the EFM32 vs. IMX changes... Patches 08-10
> >> has no dependencies on the clock changes which Thomas merged. They could
> >> go through whatever EFM32 is merged normally (last time Arnd directly
> >> merged from Uwe), and then Shawn could base the rest of the changes on
> >> that too?
> > 
> > Do you have a dependency on patch 10 (the one for EFM32) in your later
> > patches?
> 
> Unfortunately, there is a dependency on that patch: I change the default
> of UNCOMPRESS_INCLUDE to debug/uncompress.h for all ARM_SINGLE_ARMV7M
> platforms. Without that patch, it would default to mach/uncompress.h,
> which does not exist for MACH_MXC/SOC_VF610.

An easy approach would be to list both ARM_SINGLE_ARMV7M and
EFM32 in the UNCOMPRESS_INCLUDE option initially, and then
follow-up with a patch that converts the three other platforms
(efm32, stm32 and lpc18xx) to ARM_SINGLE_ARMV7M and also
change the UNCOMPRESS_INCLUDE statement.

Note that I've already added both stm32 and lpc18xx to the
UNCOMPRESS_INCLUDE list in the next/soc branch.

> > If not, you can send the other ones to Shawn, so I pull them as
> > a branch, and then I apply that on top of the merges. I have also
> > merged two other ARMv7M platforms for 4.2 now (both in next/soc),
> > so we should do the same change for those as well, and I'd rather
> > apply a patch for that, than merge a branch that is based on
> > next/soc.
> 
> I guess, in that case, you need to take the others too? (08/09?)

I'm fine with that, too. If Shawn thinks the patches are ok, you can
just send all patches you want me to apply in arm-soc based on
the appropriate branches (next/soc, next/dt and next/defconfig, I
presume), and I'll apply them this time. In the future, you should
send all patches to Shawn though.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
