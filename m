Return-Path: <devicetree-owner@vger.kernel.org>
Received: from cam-admin0.cambridge.arm.com ([217.140.96.50]:54534 "EHLO
	cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756765Ab3GaP4T (ORCPT
	<rfc822;devicetree@vger.kernel.org>);
	Wed, 31 Jul 2013 11:56:19 -0400
Date: Wed, 31 Jul 2013 16:56:08 +0100
From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [RFC RESEND] GPIO: gpio-generic: Add DT support
Message-ID: <20130731155608.GR29859@e106331-lin.cambridge.arm.com>
References: <1375183115-30237-1-git-send-email-shc_work@mail.ru>
 <20130730162241.GA13634@quad.lixom.net>
 <51F7FEE5.1010608@wwwdotorg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51F7FEE5.1010608@wwwdotorg.org>
Sender: devicetree-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Olof Johansson <olof@lixom.net>, Alexander Shiyan <shc_work@mail.ru>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Pawel Moll <Pawel.Moll@arm.com>, Ian Campbell <ian.campbell@citrix.com>, "grant.likely@linaro.org" <grant.likely@linaro.org>
List-ID: <devicetree@vger.kernel.org>

On Tue, Jul 30, 2013 at 06:59:01PM +0100, Stephen Warren wrote:
> On 07/30/2013 10:22 AM, Olof Johansson wrote:
> > On Tue, Jul 30, 2013 at 03:18:35PM +0400, Alexander Shiyan wrote:
> >> This patch adds DT support for generic (MMIO) GPIO driver.
> 
> >> diff --git a/Documentation/devicetree/bindings/gpio/gpio-generic.txt b/Documentation/devicetree/bindings/gpio/gpio-generic.txt
> 
> >> +Generic memory-mapped GPIO controller
> >> +
> >> +Required properties:
> >> +- compatible: Should be "basic-mmio-gpio" or "basic-mmio-gpio-be".
> 
> I think naming this "simple-gpio" would match other simple/basic/generic
> bindings better.
> 
> >> +- reg: Physical base GPIO controller registers location and length.
> >> +- reg-names: Should be the names of reg resources. Each register uses
> >> +  its own reg name, so there should be as many reg names as referenced
> >> +  registers:
> >> +  "dat"		: Input/output register (Required),
> >> +  "set"		: Register for set output bits (Optional),
> >> +  "clr"		: Register for clear output bits (Optional),
> >> +  "dirout"	: Register for setup direction as output (Optional),
> >> +  "dirin"	: Register for setup direction as input (Optional).
> >> +- gpio-controller: Marks the device node as a gpio controller.
> >> +- #gpio-cells: Should be two.
> ...
> > 
> > I'm trying to figure out what to say about this binding. It's not really
> > describing hardware, instead it's strongly tied to how the basic-mmio-gpio
> > driver expects the platform data to look.
> 
> I'm not sure; the binding seems to only contain a direct representation
> of pure HW properties; the addresses/offsets of various registers in the
> HW block.
> 
> > It makes more sense to actually describe the hardware in question,
> > and then have the driver handle that as expected. I.e. either have a
> > small conversion layer that binds to the actual hardware compatible
> > value and registers a basic-mmio-gpio device from there, or extend the
> > basic-mmio-gpio driver to do it by itself.
> 
> Ah, I guess the question more: Do we want generic bindings that describe
> the low-level details of the HW in a completely generic fashion so that
> new HW can be supported with zero kernel changes, or do we want a simple
> driver with a lookup table that maps from compatible value to the HW
> configuration? One of the potential benefits of DT is to be able to
> support new HW without code changes, although perhaps that's more
> typically considered in the context of new boards rather than new IP
> blocks or SoCs.

I think that going forward it would be better to have have a compatible
string per different device. As Olof pointed out, we're leaking the way
we currently handle things in Linux into the binding, rather than
precisely describing the hardware (with a unique compatible string). I'm
not sure if this is much better than embedding a bytecode describing how
to poke devices.

Certainly there should be more-specific bindings for each device, so we
can later improve support for them. If we have that anyway, I think it
would be nicer to have the mapping from that compatible string to some
internal data passed to the simple-gpio driver, rather than explicitly
stating that the current version of the Linux simple-gpio driver is
capable of driving the device.

I think the issue is that we're describing a hardware block in general,
rather than the instance of the hardware block, and that limits how
flexibly we can use the data in the description.

> 
> If we reject this driver, we surely have to get rid of pinctrl-single,
> and perhaps some others?
> 

That's certainly something we need to consider. However, those bindings
are in active use, and this is not yet. I don't think that we should
necessarily follow that style of binding.

Thanks,
Mark.
