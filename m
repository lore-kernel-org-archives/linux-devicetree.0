From: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 1/4] arm64: dts: fix PMU IRQ ordering for Juno
Date: Thu, 5 Feb 2015 11:54:16 +0000
Message-ID: <20150205115416.GE23241@arm.com>
References: <1422294858-28100-1-git-send-email-will.deacon@arm.com>
 <20150205114642.GG11344@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150205114642.GG11344@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 05, 2015 at 11:46:42AM +0000, Mark Rutland wrote:
> On Mon, Jan 26, 2015 at 05:54:15PM +0000, Will Deacon wrote:
> > diff --git a/arch/arm64/boot/dts/arm/juno.dts b/arch/arm64/boot/dts/arm/juno.dts
> > index cb3073e4e7a8..4ed9287aaef1 100644
> > --- a/arch/arm64/boot/dts/arm/juno.dts
> > +++ b/arch/arm64/boot/dts/arm/juno.dts
> > @@ -107,11 +107,11 @@
> >  	pmu {
> >  		compatible = "arm,armv8-pmuv3";
> >  		interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>,
> > +			     <GIC_SPI 02 IRQ_TYPE_LEVEL_HIGH>,
> > +			     <GIC_SPI 06 IRQ_TYPE_LEVEL_HIGH>,
> >  			     <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>,
> >  			     <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>,
> > -			     <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>,
> > -			     <GIC_SPI 02 IRQ_TYPE_LEVEL_HIGH>,
> > -			     <GIC_SPI 06 IRQ_TYPE_LEVEL_HIGH>;
> > +			     <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
> >  	};
> 
> I am very much not keen on this. While this may get things working
> today, it completely relies on Linux-internal details (the order of CPU
> bringup, which in this case is different from the order of entries in
> /cpus).
> 
> In all other dts that I am aware of, the order of entries in /cpus
> aligns with the order of interrupts in the PMU node, and the first entry
> is the boot CPU.
> 
> I think that we should ensure that the ordering of CPU nodes matches the
> order of interrupts here. That way we can fall back to that ordering (if
> not explicitly overridden), and even after an arbitrary logical
> renumbering (e.g. after a kexec) the relationship should stay intact.

There are a few problems with reordering the CPU nodes:

  (1) It breaks any existing users of taskset to pin on big/little
      clusters.

  (2) It's not generally possible if, for example, the bootloader decides
      to boot Linux on a different CPU then we have no choice but to
      change the PMU interrupt order.

  (3) I didn't think that the ordering of CPU nodes was guaranteed to be
      preserved by dtc, whereas the order of the interrupts will be.

> This DT has clearly never worked (nor been tested), and I think having
> this as an intermediary step only adds to the long term support burden
> by having the juno dts arbitrarily different to all other dts files (by
> relying on a logical order that's different to the /cpus order).
> 
> Longer term we must ensure we have a more explicit ordering, as with
> your later patches.

Agreed. This is intended as something simpler for -stable.

Will
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
