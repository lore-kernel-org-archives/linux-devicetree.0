Return-Path: <devicetree-owner@vger.kernel.org>
Received: from cam-admin0.cambridge.arm.com ([217.140.96.50]:40819 "EHLO
	cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S933229Ab3HGOHX (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Wed, 7 Aug 2013 10:07:23 -0400
Date: Wed, 7 Aug 2013 15:07:02 +0100
From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [RFC RESEND] GPIO: gpio-generic: Add DT support
Message-ID: <20130807140702.GE28558@e106331-lin.cambridge.arm.com>
References: <1375183115-30237-1-git-send-email-shc_work@mail.ru>
 <20130730162241.GA13634@quad.lixom.net>
 <51F7FEE5.1010608@wwwdotorg.org>
 <20130731155608.GR29859@e106331-lin.cambridge.arm.com>
 <1375786850.12043.22.camel@hornet>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1375786850.12043.22.camel@hornet>
Sender: devicetree-owner@vger.kernel.org
To: Pawel Moll <Pawel.Moll@arm.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Olof Johansson <olof@lixom.net>, Alexander Shiyan <shc_work@mail.ru>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Ian Campbell <ian.campbell@citrix.com>, "grant.likely@linaro.org" <grant.likely@linaro.org>, Mike Turquette <mturquette@linaro.org>
List-ID: <devicetree@vger.kernel.org>

On Tue, Aug 06, 2013 at 12:00:50PM +0100, Pawel Moll wrote:
> On Wed, 2013-07-31 at 16:56 +0100, Mark Rutland wrote:
> > > Ah, I guess the question more: Do we want generic bindings that describe
> > > the low-level details of the HW in a completely generic fashion so that
> > > new HW can be supported with zero kernel changes, or do we want a simple
> > > driver with a lookup table that maps from compatible value to the HW
> > > configuration? One of the potential benefits of DT is to be able to
> > > support new HW without code changes, although perhaps that's more
> > > typically considered in the context of new boards rather than new IP
> > > blocks or SoCs.
> 
> ... or FPGAs that can be synthesized with random collection of standard
> IP blocks. With Xilinx's Zynq and Altera's SOCFPGA this is getting
> simpler and simpler...
> 
> > I think that going forward it would be better to have have a compatible
> > string per different device. As Olof pointed out, we're leaking the way
> > we currently handle things in Linux into the binding, rather than
> > precisely describing the hardware (with a unique compatible string). I'm
> > not sure if this is much better than embedding a bytecode describing how
> > to poke devices.
> > 
> > Certainly there should be more-specific bindings for each device, so we
> > can later improve support for them. If we have that anyway, I think it
> > would be nicer to have the mapping from that compatible string to some
> > internal data passed to the simple-gpio driver, rather than explicitly
> > stating that the current version of the Linux simple-gpio driver is
> > capable of driving the device.
> 
> This is one of the important decisions we may have to make going
> forward... Do we only accept bindings for "real" blocks of IP? (and how
> we define "real"?) If so, why does the "simple-bus"?

Agreed. I suspect this is going to be a bit messy.

I'd argue that "simple-bus" is at least special in that compatibility
implies nothing: It's more an annotation that the configuration logic
for some bus is ignorable, and can be used without being poked in any
way whatsoever. It's also useful for sharing blocks of components that
might be mapped in different areas in different dts using ranges, but
that's probably another point of contention ;)

> 
> Frankly speaking I don't know where to draw the line, but I feel that in
> this particular case - a "generic" GPIO binding - is worth the effort.
> SOCs are literally littered with control registers driving random bits.
> My favourite example - Versatile Express ;-) - have random registers
> representing things like LEDs or MMC status lines. Depending on the
> motherboard/FPGA version they can live in different places. And yes, I
> can have a Versatile Express "platform" driver registering different set
> of them depending on the particular variant of the FPGA bitfile. Or try
> to represent them in the tree...

I worry that going down that route encourages bindings to describe a
single way to use a given device, rather than describing the device
itself and allowing the OS to decide how to use it. This limits what we
can do in future, and I worry about how we can handle quirks sanely if
we describe devices in this way.

> 
> And yes, I've actually came with a patch almost identical to Alexander's
> one. No, I won't feel depressed if it doesn't get in :-)
> 
> > I think the issue is that we're describing a hardware block in general,
> > rather than the instance of the hardware block, and that limits how
> > flexibly we can use the data in the description.
> 
> So if I went and designed a parametrized, synthesizeble, memory-mapped
> GPIO "controller" matching the binding in question, would it change the
> situation?

It would certainly muddy the waters a bit.

> 
> > > If we reject this driver, we surely have to get rid of pinctrl-single,
> > > and perhaps some others?
> >
> > That's certainly something we need to consider. However, those bindings
> > are in active use, and this is not yet. I don't think that we should
> > necessarily follow that style of binding.
> 
> I think we should tell Mike Turquette about this, as his bindings for
> basic clock components definitely fall into the same category:
> 
> http://thread.gmane.org/gmane.linux.kernel/1513049/

Definitely.

It would be useful for the other maintainers to share their opinions
here. This is a rather important policy decision.

Thanks,
Mark.
