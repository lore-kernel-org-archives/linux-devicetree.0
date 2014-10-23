From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 3/4] dt/bindings: Introduce the FSL QorIQ DPAA QMan
Date: Thu, 23 Oct 2014 12:26:29 +0100
Message-ID: <20141023112628.GC13690@leverpostej>
References: <1413986972-621-1-git-send-email-Emilian.Medve@Freescale.com>
 <1413986972-621-3-git-send-email-Emilian.Medve@Freescale.com>
 <20141022143732.GB4010@leverpostej>
 <54480DF8.3070604@Freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <54480DF8.3070604@Freescale.com>
Sender: linux-doc-owner@vger.kernel.org
To: Emil Medve <Emilian.Medve@freescale.com>
Cc: "scottwood@freescale.com" <scottwood@freescale.com>, "galak@kernel.crashing.org" <galak@kernel.crashing.org>, "corbet@lwn.net" <corbet@lwn.net>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>, Pawel Moll <Pawel.Moll@arm.com>, "Geoff.Thorpe@freescale.com" <Geoff.Thorpe@freescale.com>, "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

[...]

> >> +QMan Node
> >> +
> >> +PROPERTIES
> >> +
> >> +- compatible
> >> +	Usage:		Required
> >> +	Value type:	<stringlist>
> >> +	Definition:	Must include "fsl,qman"
> >> +			May include "fsl,<SoC>-qman"
> >> +
> >> +- reg
> >> +	Usage:		Required
> >> +	Value type:	<prop-encoded-array>
> >> +	Definition:	Registers region within the CCSR address space
> >> +
> >> +- fsl,liodn
> >> +	Usage:		See pamu.txt
> >> +	Value type:	<prop-encoded-array>
> >> +	Definition:	PAMU property used for static LIODN assignment
> >> +
> >> +- fsl,iommu-parent
> >> +	Usage:		See pamu.txt
> >> +	Value type:	<phandle>
> >> +	Definition:	PAMU property used for dynamic LIODN assignment
> >> +
> >> +	For additional details about the PAMU/LIODN binding(s) see pamu.txt
> > 
> > This is not present in the example. Is this always required?
> 
> Sort of. Initial hardware (and current documentation) programming
> suggestion was to configure all the PAMU instances the same way
> regardless of what devices were behind them. Given the PAMU internal
> caches sizes, this proved suboptimal from a performance perspective so
> we're trying to discover/describe/use the PAMU topology
> 
> fsl,liodn is part of the undocumented static LIODN assignment binding
> that the current PAMU driver uses. If fsl,iommu-parent is present,
> fsl,liodn can be ignored and the LIODN can be assigned dynamically
> and/or programmed only in the relevant PAMU instance

Ok.

> >> +
> >> +- clocks
> >> +	Usage:		See clock-bindings.txt and qoriq-clock.txt
> >> +	Value type:	<prop-encoded-array>
> >> +	Definition:	Half of the platform clock
> >> +
> > 
> > I don't understand the description here. What is the clock from the PoV
> > of the QMan? Which input line on the QMan is this clock attached to?
> > 
> > Is there only one clock input? Or jsut one that you need to manage at
> > the moment?
> 
> As part of the programming model (QoS features specifically) QMan needs
> to know its clock speed. Prior to the existence of the
> clock-bindings.txt, a "static" clock-frequency property was/is used
> convey such information. Using clock-binding.txt to describe the
> clocking hierarchy in the SoC makes it easier with DFS, power
> management, etc.

Ok. My concern is the phrase "Half of the platform clock" is meaingless.
The property contains a phandle + clock-specifier pair that describe a
single input clock by reference (some bindings just say "clock
reference" for that, which is fine). This is not "half" of any
particular clock.

The description of the clock should describe what it logically is from
the PoV of the consumer (i.e. _this_ device) rather than the provider.
To me "platform clock" sounds like a description of the provider. Is
there a name for the clock input line on this device?

Is there only a single clock input? Or just one that you care about at
the moment?

> The platform clock/PLL binding is part of qoriq-clock.txt
> 
> > You also seem to have an interrupt in the example. How many do you
> > expect, and what are their their logical functions?
> 
> That's the error interrupt and hopefully it never triggers. I didn't add
> [many] words about it as it's a standard property

While the interrupts property is standard, it is only standard in the
sense that the name and format are standard. Not every bidning has an
interrupts property, and the set of interrupts described are specific to
the binding. Please describe the set of interrupts you expect.

Does the device only have the error interrupt, or is that the only
interrupt you care about?

> >> +QMan Private Memory Nodes
> >> +
> >> +QMan requires two contiguous range of physical memory used for the backing store
> >> +for QMan Frame Queue Descriptor and Packed Frame Descriptor Record. This memory
> >> +is reserved/allocated as a nodes under the /reserved-memory node
> >> +
> >> +The QMan FQD memory node must be named "qman-fqd"
> >> +
> >> +PROPERTIES
> >> +
> >> +- compatible
> >> +	Usage:		required
> >> +	Value type:	<stringlist>
> >> +	Definition:	Must inclide "fsl,qman-fqd"
> >> +
> >> +The QMan PFDR memory node must be named "qman-pfdr"
> >> +
> >> +PROPERTIES
> >> +
> >> +- compatible
> >> +	Usage:		required
> >> +	Value type:	<stringlist>
> >> +	Definition:	Must inclide "fsl,qman-pfdr"
> >> +
> >> +The following constraints are relevant to the FQD and PFDR private memory:
> >> +	- The size must be 2^(size + 1), with size = 11..29. That is 4 KiB to
> >> +	  1 GiB
> >> +	- The alignment must be a muliptle of the memory size
> >> +
> >> +The size of the FQD and PFDP must be chosen by observing the hardware features
> >> +configured via the RCW and that are relevant to a specific board (e.g. number of
> >> +MAC(s) pinned-out, number of offline/host command FMan ports, etc.). The size
> >> +configured in the DT must reflect the hardware capabilities and not the specific
> >> +needs of an application
> >> +
> >> +If the memory reserved in the device tree proves to be larger then the needs of
> >> +the application a QMan driver may provide a method to release the extra memory
> >> +back to the OS
> > 
> > Driver details should be unimportant to the binding. This sentence can
> > disappear.
> 
> I'm trying to discourage reserved-memory nodes to be used to "optimize"
> the memory allocation/usage. If it comes to it, I can drop this sentence

I think it would be preferable to do so.

Thanks,
Mark.
