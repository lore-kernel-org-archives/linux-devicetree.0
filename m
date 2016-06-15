From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v3 0/2] Add support for SYSCON reset
Date: Wed, 15 Jun 2016 18:45:44 +0200
Message-ID: <1466009144.3539.77.camel@pengutronix.de>
References: <20160601184125.20241-1-afd@ti.com> <576178C7.4040204@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <576178C7.4040204@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Andrew F. Davis" <afd@ti.com>, Rob Herring <robh+dt@kernel.org>
Cc: Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Suman Anna <s-anna@ti.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Andrew,

Am Mittwoch, den 15.06.2016, 10:48 -0500 schrieb Andrew F. Davis:
> On 06/01/2016 01:41 PM, Andrew F. Davis wrote:
> > Some SoCs contain reset controls for modules that are memory-mapped to
> > areas shared with other module configuration settings. This requires
> > synchronization across all drivers accessing this memory area. This
> > series adds a generic SYSCON reset driver to allow resets toggled
> > by bits in memory-mapped registers through SYSCON.
> > 
> > Changes from v2:
> >  - Rebased on v4.7-rc1
> >  - Removed the need to give reset specifier nodes an index address
> > 
> > Changes from v1:
> >  - Reset control information is now described in the reset node, this
> >    keeps the reset information centralized for easy verification
> >  - Other small fixups
> > 
> > Andrew F. Davis (2):
> >   Documentation: dt: reset: Add syscon reset binding
> >   reset: add a SYSCON based reset driver
> > 
> >  .../devicetree/bindings/reset/syscon-reset.txt     | 105 ++++++++
> >  drivers/reset/Kconfig                              |  10 +
> >  drivers/reset/Makefile                             |   1 +
> >  drivers/reset/reset-syscon.c                       | 289 +++++++++++++++++++++
> >  include/dt-bindings/reset/syscon.h                 |  23 ++
> >  5 files changed, 428 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/reset/syscon-reset.txt
> >  create mode 100644 drivers/reset/reset-syscon.c
> >  create mode 100644 include/dt-bindings/reset/syscon.h
> > 
> 
> Is there any additional feedback for this driver? I normally try to
> refrain from pings, but this may begin to block further upstreaming of
> IPs that uses this reset if it can not be taken this cycle.

There's still Rob's concern that this binding needs a device tree node
per single register bit in the worst case, which seems a bit overkill.

I'd still prefer to have this information hidden in the drivers, but if
you absolutely have to put it in the device tree, maybe an approach more
similar to pinctrl-simple, where you could list all resets, one per
line, in a single property, would be more acceptable:

pscrst: reset-controller {
	compatible = "ti,<chip>-pscrst", "syscon-reset";

	/* syscon-reset,bits = <ctrl_reg ctrl_bit stat_reg stat_bit flags>; */
	syscon-reset,bits = <0xa3c 8 0x83c 8 RESET_ASSERT_CLEAR  /* 0: pcrst-dsp */
	                     0xa40 5 0     0 RESET_TRIGGER_SET>; /* 1: pcrst-example */
};

dsp0: dsp {
	resets = <&pscrst 0>;
};

> If there is still an objection to calling this a generic reset solution
> we would not strongly object to relabeling this to something implying
> more TI exclusivity.

Good. Right now there don't seem to be that many reset controllers in
the wild for which this binding would be a good fit. If this turns out
to be useful for others, we can add more compatibles to the driver.

regards
Philipp
