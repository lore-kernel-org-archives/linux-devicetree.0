Return-Path: <SRS0=QbIb=NR=gmail.com=chunkeey@kernel.org>
From: Christian Lamparter <chunkeey@gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: dmaengine: dw-dmac: add protection control property
Date: Tue, 06 Nov 2018 19:36:13 +0100
Message-ID: <1637379.5gUKLKV2Xl@debian64>
In-Reply-To: <20181105230652.GA22828@bogus>
References: <6b18bcf33d6473c166b607a5fa31ba63727cf6bb.1541350844.git.chunkeey@gmail.com> <20181105230652.GA22828@bogus>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
To: Rob Herring <robh@kernel.org>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vkoul@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Viresh Kumar <vireshk@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

On Tuesday, November 6, 2018 12:06:52 AM CET Rob Herring wrote:
> On Sun, Nov 04, 2018 at 06:01:38PM +0100, Christian Lamparter wrote:
> > This patch adds the per-channel dma protection control
> > prop-encoded-array and dt-binding definitions (including
> > definitions for the existing channel allocation and priority
> > order values based on include/linux/platform_data/dma-dw.h)
> > for the DesignWare AHB Central Direct Memory Access Controller.
> > 
> > Note: The protection control signals are one-to-one mapped to
> > the AHB HPROT[1:3] signals.  The HPROT0 (Data Access) is
> > always hardwired to 1 for this controller.
> > 
> > Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
> > ---
> >  .../devicetree/bindings/dma/snps-dma.txt      |  4 ++++
> >  MAINTAINERS                                   |  4 +++-
> >  include/dt-bindings/dma/dw-dmac.h             | 20 +++++++++++++++++++
> >  3 files changed, 27 insertions(+), 1 deletion(-)
> >  create mode 100644 include/dt-bindings/dma/dw-dmac.h
> > 
> > diff --git a/Documentation/devicetree/bindings/dma/snps-dma.txt b/Documentation/devicetree/bindings/dma/snps-dma.txt
> > index 39e2b26be344..72b4984a4c18 100644
> > --- a/Documentation/devicetree/bindings/dma/snps-dma.txt
> > +++ b/Documentation/devicetree/bindings/dma/snps-dma.txt
> > @@ -27,6 +27,10 @@ Optional properties:
> >    general purpose DMA channel allocator. False if not passed.
> >  - multi-block: Multi block transfers supported by hardware. Array property with
> >    one cell per channel. 0: not supported, 1 (default): supported.
> > +- snps,dma-protection-control: Channel's AHB HPROT[3:1] protection setting.
> > +  Array property with one cell per channel. The default value for a channel
> > +  is 0 (for non-cacheable, strongly ordered, unprivileged data access).
> 
> IIRC, 'strongly ordered' is outside the scope of AHB (and AXI) 
> definitions. There is a mapping of SO page table entries to bus control 
> signals, but that's part of the cpu and outside the scope of this doc.
Ok, the "stongly ordered" is the term I got from the ARM AMBA specification as
the AMCC/APM Hardware document links to it. However, in the PROTCTL register
description it reads "non-buffered":

"The AMBA Specification recommends that the default value of HPROT indicates
a non-cached, non-buffered, privileged data access. The reset value is
used to indicate such an access. HPROT[0] is tied high because all transfers
are data accesses, as there are no opcode fetches."
 
> > +  Refer to include/dt-bindings/dma/dw-dmac.h for possible values.
> 
> Do you really need this to be per channel rather than just per platform? 
> If anything, the optimal setting is probably based on the memory address 
> (device, on-chip RAM, or DRAM), not the channel. 
For my APM82181 and PPC460EX SoCs "the platform" approach would work just
fine. I made this "per-channel" because the HPROT bits can be configured
for each dma channel individually. But as far as the APM82181 (and PPC460EX)
are concerned: They both are PowerPC-SoCs and the AHB is not even the main bus.
Instead the dw-dmac DMA-Controller is bundled together with two 
SATA-II Controllers behind a bidirectional PLB4-To-AHB-bridge that 
interfaces with the rest of the system. The funkyness stems from the
bridge that tries to translate, buffer and modify the data (including
the HPROT signals) to make everything "fit" more or less.

So, I'll make the snps,dma-protection-control property a single "u32"
and apply it to all the channels for the v2.

> I'd expect for most platforms, bufferable works without any s/w issue
> (and should be more correct in that coherent allocations are bufferable 
> (at least for ARM). Cacheable probably has no effect as most systems 
> don't have coherent i/o (again, at least for ARM).
I think I would it leave this decision to the arch. Because from what I
can tell (based on grepping the kernel source): the dw-dmac is used by
various ARM, ARC, PowerPC and x86 machines. (The avr32 arch used to be
a user too, but it has been dropped in 4.12.). And I don't want to 
accidentally break those. Or, @Viresh Kumar what's your opinion?

> >  Example:
> >  
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index dacba23b80b4..c35998e20e9d 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -14107,9 +14107,11 @@ SYNOPSYS DESIGNWARE DMAC DRIVER
> >  M:	Viresh Kumar <vireshk@kernel.org>
> >  R:	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> >  S:	Maintained
> > +F:	Documentation/devicetree/bindings/dma/snps-dma.txt
> > +F:	drivers/dma/dw/
> > +F:	include/dt-bindings/dma/dw-dmac.h
> >  F:	include/linux/dma/dw.h
> >  F:	include/linux/platform_data/dma-dw.h
> > -F:	drivers/dma/dw/
> >  
> >  SYNOPSYS DESIGNWARE ENTERPRISE ETHERNET DRIVER
> >  M:	Jose Abreu <Jose.Abreu@synopsys.com>
> > diff --git a/include/dt-bindings/dma/dw-dmac.h b/include/dt-bindings/dma/dw-dmac.h
> > new file mode 100644
> > index 000000000000..9152a6e2406c
> > --- /dev/null
> > +++ b/include/dt-bindings/dma/dw-dmac.h
> > @@ -0,0 +1,20 @@
> > +/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
> > +
> > +#ifndef __DT_BINDINGS_DMA_DW_DMAC_H__
> > +#define __DT_BINDINGS_DMA_DW_DMAC_H__
> > +
> > +#define DW_DMAC_CHAN_ALLOCATION_ASCENDING       0       /* zero to seven */
> > +#define DW_DMAC_CHAN_ALLOCATION_DESCENDING      1       /* seven to zero */
> > +#define DW_DMAC_CHAN_PRIORITY_ASCENDING         0       /* chan0 highest */
> > +#define DW_DMAC_CHAN_PRIORITY_DESCENDING        1       /* chan7 highest */
> 
> These seem unrelated?
they belong to the existing chan_allocation_order and the chan_priority DT
properties. The values are matching what is already in the existing
include/linux/platform_data/dma-dw.h. But Ok, I'll leave them out in the next
version.
 
> > +
> > +/*
> > + * Protection Control bits provide protection against illegal transactions.
> > + * The protection bits[0:2] are one-to-one mapped to AHB HPROT[3:1] signals.
> > + * The AHB HPROT[0] bit is hardwired to 1: Data Access.
> > + */
> > +#define DW_DMAC_HPROT1_PRIVILEGED_MODE	(1 << 0)	/* Privileged Mode */
> > +#define DW_DMAC_HPROT2_BUFFERABLE	(1 << 1)	/* DMA is bufferable */
> > +#define DW_DMAC_HPROT3_CACHEABLE	(1 << 2)	/* DMA is cacheable */
> > +
> > +#endif /* __DT_BINDINGS_DMA_DW_DMAC_H__ */
> 
