From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v4 2/2] reset: add TI SYSCON based reset driver
Date: Thu, 23 Jun 2016 11:05:54 +0200
Message-ID: <1466672754.2278.34.camel@pengutronix.de>
References: <20160620184607.4380-1-afd@ti.com>
	 <20160620184607.4380-3-afd@ti.com>
	 <1466590772.4123.38.camel@pengutronix.de> <576AEB17.7070302@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <576AEB17.7070302@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Andrew F. Davis" <afd@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Suman Anna <s-anna@ti.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Am Mittwoch, den 22.06.2016, 14:46 -0500 schrieb Andrew F. Davis:
[...]
> >> +	depends on HAS_IOMEM
> >> +	select MFD_SYSCON
> >> +	help
> >> +	  This enables the reset driver support for TI devices with
> >> +	  memory-mapped reset registers as part of a syscon device node. If
> >> +	  you wish to use the reset framework for such memory-mapped devices,
> >> +	  say Y here. Otherwise, say N.
> > 
> > Actually, do you need the user configurable option at all?
>
> I'm not sure, right now it is selected by other things, but that is true
> for much of Kconfig, it is not platform dependent so it doesn't need to
> only be enabled by arch, it probably isn't hurting anything to leave it?

No, that's okay. So the intention is to make it possible to enable it
for COMPILE_TESTs on architectures other than TI?

[...]
> >> +	if (control->toggle)
> >> +		return -ENOSYS; /* status not supported for this reset */
> > 
> > That should be -ENOTSUPP.
> > 
> 
> Will fix.
> 
> > Are you sure that reading status is not supported for your trigger
> > resets?
> > On i.MX6 the triggered reset bits are self-clearing, for example, but
> > only after the reset sequence is finished. So it is possible to read the
> > reset status there.
> 
> All the resets we have should have separate status bits, this trigger
> flag was added for systems that don't have and readable status bits
> (like some trigger resets), maybe the name should be changed?

I misunderstood. With "trigger" I mean a reset line that can't be
controlled directly, so the driver should implement .reset() to trigger
a reset sequence instead of .assert()/.deassert() to control the level.
Whether or not the status can be read is something different.

If you don't need it yet, you could just drop it for now, But if we want
to make this as universally useful as possible, we should be sure that
we cover most existing cases before defining the binding options.

The hisilicon driver for example has just been changed to syscon. There
the assert and deassert bits are in different registers and the status
can't be read at all. To support that, too, we'd have to add a third
register/bit pair to the binding...

So far, I have seen the following variants. Depending on the hardware, a
reset could be:
- asserted by setting a bit
- asserted by clearing a bit
- deasserted by clearing/setting the same bit
- deasserted by setting/clearing the same bit in another register
- triggered to be asserted/deasserted automatically with some specific
  timing that the hardware knows about (in that case the manual
  assert/deassert is not available)
The status of the reset line could be read via
- the same bit that is used to assert/deassert
- the same bit in another register
- not at all

What I've not yet seen but surely exists somewhere is the case where
assert/deassert/status bits are at different bit positions either in the
same register or in different registers.

regards
Philipp
