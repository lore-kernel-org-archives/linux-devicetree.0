From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 5/5] arm64: Add DT support for Juno r1 board.
Date: Thu, 14 May 2015 15:18:17 +0100
Message-ID: <20150514141817.GF494@leverpostej>
References: <1431537092-19597-1-git-send-email-Liviu.Dudau@arm.com>
 <1431537092-19597-6-git-send-email-Liviu.Dudau@arm.com>
 <1431612451.2881.54.camel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1431612451.2881.54.camel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Jon Medhurst (Tixy)" <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Marc Zyngier <Marc.Zyngier-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Sudeep Holla <Sudeep.Holla-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LAKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 14, 2015 at 03:07:31PM +0100, Jon Medhurst (Tixy) wrote:
> On Wed, 2015-05-13 at 18:11 +0100, Liviu Dudau wrote:
> > This board is based on Juno r0 with updated Cortex A5x revisions
> > and board errata fixes. It also contains coherent ThinLinks ports
> > on the expansion slot that allow for an AXI master on the daughter
> > card to participate in a coherency domain.
> > 
> > Support for SoC PCIe host bridge will be added as a separate series.
> > 
> > Signed-off-by: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
> > ---
> >  arch/arm64/boot/dts/arm/Makefile    |   2 +-
> >  arch/arm64/boot/dts/arm/juno-r1.dts | 123 ++++++++++++++++++++++++++++++++++++
> >  2 files changed, 124 insertions(+), 1 deletion(-)
> >  create mode 100644 arch/arm64/boot/dts/arm/juno-r1.dts
> > 
> > diff --git a/arch/arm64/boot/dts/arm/Makefile b/arch/arm64/boot/dts/arm/Makefile
> > index 301a0da..c5c98b9 100644
> > --- a/arch/arm64/boot/dts/arm/Makefile
> > +++ b/arch/arm64/boot/dts/arm/Makefile
> > @@ -1,5 +1,5 @@
> >  dtb-$(CONFIG_ARCH_VEXPRESS) += foundation-v8.dtb
> > -dtb-$(CONFIG_ARCH_VEXPRESS) += juno.dtb
> > +dtb-$(CONFIG_ARCH_VEXPRESS) += juno.dtb juno-r1.dtb
> >  dtb-$(CONFIG_ARCH_VEXPRESS) += rtsm_ve-aemv8a.dtb
> >  
> >  always		:= $(dtb-y)
> > diff --git a/arch/arm64/boot/dts/arm/juno-r1.dts b/arch/arm64/boot/dts/arm/juno-r1.dts
> > new file mode 100644
> > index 0000000..f6bc073
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/arm/juno-r1.dts
> > @@ -0,0 +1,123 @@
> > +/*
> > + * ARM Ltd. Juno Platform
> > + *
> > + * Copyright (c) 2015 ARM Ltd.
> > + *
> > + * This file is licensed under a dual GPLv2 or BSD license.
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> > +/ {
> > +	model = "ARM Juno development board (r1)";
> > +	compatible = "arm,juno", "arm,vexpress";
> 
> Is there scope for adding "arm,juno-r1" to the front of that list?
> Reason I ask, is that I can't help but think [1] that userside code
> (like Android) which wants to select device-specific configuration,
> should use something like the devices compatible string rather than what
> they currently propose [2].

> [1] https://lists.linaro.org/pipermail/linaro-android/2015-April/002743.html
> [2] https://lists.linaro.org/pipermail/linaro-android/2015-April/002742.html

Ideally, userspace shouldn't need to know what specific device they're
running on (though obviously there will always be cases...). To that
end, it would be interesting to know what this data would be used for.
If it's just a string for some "About device" menu, the model string
should be ok.

I'm a bit lost with the suggestion in [2]. It doesn't seem to have
anything to do with firmware, though perhaps I'm missing something? What
information are they trying to get at?

Thanks,
Mark.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
