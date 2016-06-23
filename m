From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v4 2/2] reset: add TI SYSCON based reset driver
Date: Thu, 23 Jun 2016 18:28:17 +0200
Message-ID: <1466699297.2278.111.camel@pengutronix.de>
References: <20160620184607.4380-1-afd@ti.com>
	 <20160620184607.4380-3-afd@ti.com>
	 <1466590772.4123.38.camel@pengutronix.de> <576AEB17.7070302@ti.com>
	 <1466672754.2278.34.camel@pengutronix.de> <576BF20D.8040504@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <576BF20D.8040504-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Donnerstag, den 23.06.2016, 09:28 -0500 schrieb Andrew F. Davis:
> On 06/23/2016 04:05 AM, Philipp Zabel wrote:
> > Am Mittwoch, den 22.06.2016, 14:46 -0500 schrieb Andrew F. Davis:
> > [...]
> >>>> +	depends on HAS_IOMEM
> >>>> +	select MFD_SYSCON
> >>>> +	help
> >>>> +	  This enables the reset driver support for TI devices with
> >>>> +	  memory-mapped reset registers as part of a syscon device node. If
> >>>> +	  you wish to use the reset framework for such memory-mapped devices,
> >>>> +	  say Y here. Otherwise, say N.
> >>>
> >>> Actually, do you need the user configurable option at all?
> >>
> >> I'm not sure, right now it is selected by other things, but that is true
> >> for much of Kconfig, it is not platform dependent so it doesn't need to
> >> only be enabled by arch, it probably isn't hurting anything to leave it?
> > 
> > No, that's okay. So the intention is to make it possible to enable it
> > for COMPILE_TESTs on architectures other than TI?
> 
> I was thinking more that it should be usable on non-TI architectures and
> so can be user enabled if needed.

Those architectures could also just select it, then. Having the option
might improve discoverability though.

[...]
> > So far, I have seen the following variants. Depending on the hardware, a
> > reset could be:
> > - asserted by setting a bit
> > - asserted by clearing a bit
> > - deasserted by clearing/setting the same bit
> > - deasserted by setting/clearing the same bit in another register
> > - triggered to be asserted/deasserted automatically with some specific
> >   timing that the hardware knows about (in that case the manual
> >   assert/deassert is not available)
> > The status of the reset line could be read via
> > - the same bit that is used to assert/deassert
> > - the same bit in another register
> > - not at all
> > 
> > What I've not yet seen but surely exists somewhere is the case where
> > assert/deassert/status bits are at different bit positions either in the
> > same register or in different registers.
> 
> Exactly why I was thinking having a node for the resets would be more
> future proof, we could add more properties later:
> 
> pscrst-dsp: dsp {
> 	reset-control = <0xa3c 8 RESET_ASSERT_CLEAR>;
> 	reset-status = <0x83c 8 RESET_ASSERT_CLEAR>;
> +	reset-deassert = <0x840 3 RESET_ASSERT_SET>;
> +	reset-toggle-time-ms = <20>;
> };
> 
> While a fixed length array does make for a more condensed binding we
> don't get much flexibility.
> 
> What we could also do is have a longer array then use macros to trim it
> down for simple cases:
> 
> reset-bits = <
> 	SINGLE_BIT_RESET(0xa3c, 8)
> 	SINGLE_BIT_RESET(0xa40, 7)
> 	SINGLE_BIT_RESET(0xa44, 6)
> >;

I think there has been opposition in the past against hiding things more
complex than a single value behind macros.

> Each real entry could have 9 fields that the macro would expand into:
> 	(assert reg) (assert bit) (assert flag)
> 	(deassert reg) (deassert bit) (deassert flag)
> 	(status reg) (status bit) (status flag)
> 
> This would be able to handle all of the above cases except the timing
> one, that case can always be handled by a dedicated driver for that system.

How about seven:
	(assert reg) (assert bit)
	(deassert reg) (deassert bit)
 	(status reg) (status bit)
        (flags)

reset-bits = <
	0xa3c 8 0xa3c 8 0x83c 8 (ASSERT_CLEAR|DEASSERT_SET|STATUS_SET)
>;

> My goal here, I would like to believe, aligns with the goals of DT in
> general, I would like to see one kernel work on many platforms without
> having to compile-in a bunch of SoC specific info. Some SoCs will need
> their own reset driver for when they do something unique (like this
> reset driver I will post next cycle which sends a message to a power
> management chip for its resets:
> http://git.ti.com/gitweb/?p=ti-linux-kernel/ti-linux-kernel.git;a=blob;f=drivers/reset/reset-ti-sci.c;h=3636dc176c8b5c4449eefc1fe13df7b912cec73e;hb=refs/heads/ti-lsk-linux-4.4.y
> )
> but I see no reason a bunch of different drivers for simple register bit
> resets with the only difference being a #define offset. I hope that this
> effort will get ahead of these drivers and reduce the maintenance burden
> for you.

The problem of reducing the amount of simple drivers is completely
orthogonal to agreeing on a fitting DT binding. A common driver could
just as well have static syscon_reset_control arrays per compatible
compiled in.

> So how much is handled by this driver is up to you, (hopefully without
> trying to handle every possible case :)).

It's also up to the DT maintainers to approve the bindings.

I have no delusions that we have to find a compromise between
driver/binding complexity and the number of supported common cases.
The reason I find it difficult to make a decision is I don't feel like I
have enough data.
Should we support separate status reg? Obviously, you need it. Separate
deassert reg? Questionable. Those devices usually have set/clear
registers dedicated to resets and as such are not a good fit for this
driver anyway. assert/deassert/status bits at different positions? Maybe
not even needed. Support for triggered, self-clearing resets? Maybe
better handled by a different driver, too.

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
