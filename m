Return-Path: <devicetree-owner@vger.kernel.org>
Received: from fw-tnat.cambridge.arm.com ([217.140.96.21]:54639 "EHLO
	cam-smtp0.cambridge.arm.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1750968Ab3IFKvI (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Fri, 6 Sep 2013 06:51:08 -0400
Date: Fri, 6 Sep 2013 11:50:53 +0100
From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [RFC PATCH] dt: add a binding review checklist
Message-ID: <20130906105053.GT18206@e106331-lin.cambridge.arm.com>
References: <1378334532-21025-1-git-send-email-swarren@wwwdotorg.org>
 <20130905111918.GQ18206@e106331-lin.cambridge.arm.com>
 <5228F91A.5060302@wwwdotorg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5228F91A.5060302@wwwdotorg.org>
Sender: devicetree-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Pawel Moll <Pawel.Moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Stephen Warren <swarren@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

On Thu, Sep 05, 2013 at 10:35:22PM +0100, Stephen Warren wrote:
> On 09/05/2013 05:19 AM, Mark Rutland wrote:
> > Hi Stephen,
> > 
> > On Wed, Sep 04, 2013 at 11:42:12PM +0100, Stephen Warren wrote:
> >> From: Stephen Warren <swarren@nvidia.com>
> >>
> >> I originally intended this to be a brief list of items to check when
> >> reviewing a new DT binding. However, I appear to have become slightly
> >> distracted and added in a bunch of background/justification verbiage
> >> too!
> >>
> >> Do people think this is going the right direction? Should I continue in
> >> the current style and add more sections to the document, or strip it back
> >> to be a much more plain list, perhaps something like:
> >> https://fedoraproject.org/wiki/Packaging:ReviewGuidelines
> >> (which is where I got the idea for this)
> > 
> > I think this is going in the right direction, but I think it would make
> > sense to also have a basic checklist that people can go over
> > mechanically that detects big issues (e.g. unallocated vendor prefixes,
> > undocumented or ambiguous properties, undescribed HW inputs/outputs).
> 
> Perhaps we should do what Fedora does; rename this
> binding-review-guidelines.txt, and have a simpler
> binding-review-checklist.txt which is just a set of tick-boxes with
> fairly short descriptions?

That would make sense to me.

> 
> >> +Valid values for a vendor prefix are:
> >> +
> >> +* A short, yet not obscure or obfuscated, representation of the vendor's name,
> >> +  in lower-case. Stock tickers may be used in lower-case.
> >> +* The vendor's stock ticker, in upper-case.
> > 
> > We've got plenty of stock ticker names in lower case. The only prefix I
> > can see documented with any upper case part is "GEFanuc" (though "SUNW"
> > is an obvious undocumented example...).
> 
> Should we document what we hope to be standard procedure going forward,
> or also write the document to encompass existing bindings? Perhaps we
> just shouldn't mention upper-case stock tickers at all? I did because of
> David's comments in:
> 
> http://www.spinics.net/lists/devicetree/msg00097.html

I think the key point is that a string is stable once defined, I'm not
sure the distinction between upper/lower case adds anything.

> 
> >> +* For all properties the binding supports, defines:
> >> +** The property name.
> >> +** Whether the property is defined by, or is an instance of, some generic
> >> +   binding, such as GPIO, IRQ, etc. If so, reference the binding document
> >> +   filename that defines that binding.
> >> +** Whether it is required or optional.
> >> +** For optional properties, the implied value when the property is missing.
> >> +** The type of the value.
> >> +** The set or range of legal values for the property.
> >> +** For properties that are lists, the order (if any) the entries must appear.
> > 
> > I'd note that this may be defined by reference to other properties. There
> > might be a ${X}-names style property defining each entry in the list, or
> > there might be other properties defining the list (e.g.
> > "#global-interrupts" in the "arm,smmu" binding).
> 
> Yes. I expand on this in the "specifiers" section below, but perhaps
> it'd be a good idea to briefly mention that here too.
> 
> >> +* Typically contains a simple example to demonstrate the binding.
> >> +
> >> +Compatible Property
> >> +-------------------
> >> +
> >> +A compatible value identifies a hardware module. It needs to identify the
> >> +vendor (e.g. NVIDIA), type or name of device (e.g. I2C), and version of the
> >> +device (e.g. an IP block version number or chip name). The following formats
> >> +of compatible value are acceptable:
> >> +
> >> +* ${vendor},${device}-${version} (e.g. ti,omap4-i2c)
> >> +* ${vendor},${version}-${device} (e.g. nvidia,tegra20-i2c)
> >> +* ${vendor},${device}-${version} (e.g. synopsis,dwc3)
> > 
> > It would be nice to make it clear that the compatible string for a
> > device should (wherever possible) be the name of the specific IP block,
> > which isn't completely clear above (e.g. "arm,pl011" is preferred to
> > "arm,vexpress-v2m-serial"). It would be nice if we could avoid examples
> > with SoC names for this reason.
> 
> I guess I should expand upon the difference between the IP block
> version, perhaps:
> 
> nvidia,i2c-v1 # NV I2C IP block version 1
> 
> and the "instance" version, perhaps:
> 
> nvidia,i2c-tegra20 # That same thing, but when it's part of Tegra20 SoC.
> 
> since I believe we're agreed that both should be present; the IP block
> compatible value for a driver to bind against (typically), but the
> "instance" value to allow quirks/WARs to be enabled if the SoC
> integration causes some issue.

That sounds like a good idea. Ideally, a platform shouldn't require a
SoC-specific compatible entry (or we're just distributing board file
entries into each driver...).

What kind of quirks/differences are we handling currently with
"instance" compatible strings?

> 
> >> +Specifiers
> >> +----------
> >> +
> >> +Many properties define a resource that is provided by one DT node and used by
> >> +another. Any naming, formatting, and order of entry conventions for these
> >> +properties should be defined by a "super-class" or "subsystem" binding.
> >> +
> >> +For example, some properties (such as reg, interrupts) are accessed by list
> >> +index. Any reg-names or interrupt-names property is purely informational. The
> >> +core definition of the regs or interrupts properties defines that these
> >> +properties are accessed by index. Any binding that uses these properties must
> >> +define how many entries these properties should contain (e.g. if multiple
> >> +interrupts are generated by the hardware module or not), and which order
> >> +the entries must appear.
> > 
> > I don't agree that any reg-names or interrupt-names property is purely
> > informational. I think this is certainly binding-specific, but we have
> > drivers grabbing values by name, and in some cases there is no defined
> > ordering and names are required for disambiguation and/or handling
> > missing entries.
> 
> Yes, part of posting this doc was to agree on the rules going forward:-)
> 
> I believe that Grant has asserted in the past that the ordering rules
> are defined by the property itself, so reg/interrupt are always indexed,
> whereas clocks is always looked up via clock-names. However, I know that
> in the past we've discussed that individual bindings get to decide which
> option(s) are allowed, irrespective of which property, so we could allow
> reg/interrupts to be looked up by name, but clocks to be looked up by
> index. Should we just decide to be flexible and allow whatever
> individual bindings want here? Do we need to get an ack from Grant?

We should aim for consistency (e.g. all clocks *should* be referenced by
name), but inevitably there are going to be cases where that breaks down
(e.g. an IP block with a configurable number of clock inputs). Given
that and the existing legacy, I think this needs to be described in
particular binding documents.

At binding creation time we need to consider how a device may be
integrated. Interrupts often gets OR'd or thrown away by integrators, so
preferring interrupt-names to an ordered list makes sense (though there
will be cases with configurable IP blocks where another mechanism for
disambiguating interrupts entries may be necessary instead).

We also need to consider how future revisions may extend a device -- new
inputs and outputs may be added, but the device may be otherwise
backwards compatible. Using ${X}-names properties allows an accurate
description of the set of resources wired up, whether they are new and
unused or old and missing. That way we have a greater chance of a new
device working with an older kernel (using a driver for an older hw
revision).

For the above reasons, I think preferring the presence of ${X}-names in
bindings for devices with more than one entry in some property list
makes sense, but it needs to be dealt with on a case-by-case basis.
What I'm saying we need is a mechanism for disambiguating property lists
(which may or may not be a ${X}-names property).

> 
> >> +Other properties (such as clocks) have a mandatory associated names property
> >> +(e.g. clock-names). In this case, the clock subsystem binding defines that
> >> +clock names are first located in the clock-names property, then the index of
> >> +the name is also used to index into the clocks property to find the actual
> >> +clock definition. In this case, any binding that uses these properties must
> >> +define the set of required and optional entries for the clock-names property.
> >> +No specification of order of entries is possible.
> > 
> > The primecell bindings are in violation of the above (but the code is
> > not), and there may be other cases I'm not aware of. Ideally the above
> > would be true, but I'm not sure we can document it as such (though we
> > can enforce such rules for new bindings).
> 
> OK - this brings up the same question as above. Do we document new
> practice, or attempt to encompass existing bindings? Documenting
> required new practice would keep things simpler, although if we do that,
> I should add a note at the top of the file to explain this.
> 

We should definitely define best practices, even if they don't match
existing bindings. Whether or not they're required is a grey area, but
that can come from review -- these documents don't override a proper
review.

Thanks,
Mark.
