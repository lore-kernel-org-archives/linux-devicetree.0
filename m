From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 1/2] Documentation: dt: reset: Add syscon reset binding
Date: Thu, 04 Feb 2016 16:49:39 +0100
Message-ID: <1454600979.3356.68.camel@pengutronix.de>
References: <1453748564-6429-1-git-send-email-afd@ti.com>
	 <1453748564-6429-2-git-send-email-afd@ti.com>
	 <1454431489.5358.62.camel@pengutronix.de> <56B102B4.1010000@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56B102B4.1010000-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Andrew,

Am Dienstag, den 02.02.2016, 13:25 -0600 schrieb Andrew F. Davis:
[...]
> > sti also chose a single address cell and a logical number to enumerate
> > the resets and to store the actual reset control and status bit position
> > in a table in the driver. Is there a reason not to follow the same
> > approach for ti?
> 
> The number of reset-able modules is rather large, and we would have to
> have an entry for them, and then a table of them for each chip, I
> would like to avoid this as it may become unmaintainable with the number
> of devices we would like to support.

Maybe I underestimate the amount of work necessary to translate the
register bit positions from the reference manuals into tables in a
driver (after all the imx-src driver that started this framework only
has 5 reset controls registered with it), but to me this doesn't sound
like a very strong argument.

> We currently only need to reset one module this way currently anyway, we
> will be moving away from toggling bits from the host side to perform resets,
> but rather ask a power management controller to perform the reset for us
> (I also have a reset driver that communicates with this controller that I
> will post when the rest of the needed framework is upstreamed). So, for TI,
> this syscon based driver will probably mostly be used for compatibility with
> older SoCs that do not support the management controller, allowing new device
> drivers to use the reset framework and still function with older SoCs.

So this will only be used for a few legacy devices? I'd probably be less
hesitant if you proposed this as some ti chip specific binding, as right
now I just don't expect that many other devices to use this supposedly
generic binding.

> > This approach of specifying bits in the device tree at
> > the consumer side doesn't allow any error handling in the driver to
> > determine if the bits are in fact valid.
> 
> Yes, that is lost by not having a table of all valid resets, but this would
> be like many DT driver/node that allow registers/addresses to be specified
> and then write/read from those.

True. Still, I'd argue that having a list of registers and bit-shifts in
a single place (whether that is in the driver or in the reset controller
node), that can be easily checked against a manual. On the other hand
sprinkling these values around the device tree at the consumer sites
makes this much harder to review.

[...]
> >> +Required properties:
> >> +--------------------
> >> + - compatible	: Should be "syscon-reset"
> >
> > What if later an erratum turns up and something special needs to be done
> > (delays, special care about other bits in the same register, etc.)?
> > This should always contain a soc specific compatible.
>
> In this case a specific reset driver would be needed for that device, this
> driver only intends to cover the more traditional base cases.

And for that to work in a backwards compatible way, you need to have the
SoC specific compatible value already in the device tree.

[...]
> > This is a binding for single reset bits that are spread throughout the
> > register space. For any syscon that has a few registers of contiguous
> > resets this is rather suboptimal.
>
> Yes, this is only intended for when a few resets need controlling out of
> a large reset space without having to directly encode the reset information
> into the device driver for that hardware module.

How about if we came up with a way to encode the bit fields in the reset
controller node?

[...]
> > The polarity should have some RESET_ACTIVE_HIGH/LOW #define. Using
> > numbers in the gpio phandle bindings in the beginning has caused a lot
> > of problems over time.
> 
> That works, I'll add these. Something like RESET_ASSERT_{SET,CLEAR} work?

Yes, this is better.

> > Do you really have varying polarity across the resets?
> 
> Not on the part I'm using, but this should keep things generic.

We already established that this binding is not generic enough for most
of the current cases, so I'm not convinced it is valuable to complicate
it for some theoretical case.

> The alternative would be to set the polarity per reset controller node, then
> if a system has both it could have two controllers and the consumers would
> have a phandle to the correct one, then all consumers would only need 4
> instead of 6 args. Actually now that I think about it, this is probably the
> way to go as most systems I would imagine only have one polarity and it still
> can work for systems that do have both. I think I'll make this change.

How about going one more step and also moving the register and bit-shift
description into a property of the reset controller node?

> >> +		dsp0: dsp0 {
> >> +			...
> >> +			resets = <&pscrst 0xa3c 8 0 0x83c 8 0>;
> >
> > This sounds a bit error prone and rather verbose for all controllers
> > that don't have control and status bits peppered randomly around the
> > register space.
> 
> I was also thinking about adding the ability to have only one set of args
> for control, then we just return ENOTSUPP when asked for status when only
> the control register is provided.

Yes, that should work.

> With the above polarity change, we end up allowing:
> 
> resets = <&pscrst 0xa3c 8>;

Would this be a reset controller with no control bit, but just a trigger
that is triggered when the bit is set? (or cleared?).

> when appropriate. This would cover many common use-cases and keep the
> framework clean for unique case drivers when needed. It would eliminate
> the need for many reset-berlin like drivers that only differentiate
> themselves in trivial ways, like offsets/polarity, etc..

That's not a good example. reset-berlin needs a bit to be set to trigger
the reset pulse, and doesn't have support for manual assert/deassert.
Also according to the driver it doesn't signal reset status, so there is
a fixed delay needed.
Honestly, I expect most drivers in the near future to fall into two
categories: either they need special attention, or they are not a good
fit for this binding because all the resets are (at least mostly)
contiguous.

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
