From: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Subject: Re: [RFC PATCH] Documentation: devicetree: add description for
 generic bus properties
Date: Thu, 28 Nov 2013 14:10:09 -0700
Message-ID: <20131128211009.GA26447@obsidianresearch.com>
References: <20131127172806.GC2291@e103592.cambridge.arm.com>
 <20131128203322.GB14689@mithrandir>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131128203322.GB14689@mithrandir>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Dave Martin <Dave.Martin-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 28, 2013 at 09:33:23PM +0100, Thierry Reding wrote:

> >   - Describing masters that master through multiple different buses
> > 
> >   - How on Earth this fits in with the Linux device model (it doesn't)
> > 
> >   - Interaction with IOMMU bindings (currently under discussion)
> 
> This is all very vague. Perhaps everyone else knows what this is all
> about, in which case it'd be great if somebody could clue me in.

It looks like an approach to describe an AXI physical bus topology in
DT..

AFAIK the issue is that the AXI toolkit arm provides encourages a
single IP block to have several AXI ports - control, DMA, high speed
MMIO, for instance. Each of those ports is hooked up into an AXI bus
DAG that has little to do with the CPU address map.

Contrasted with something like PCI, where each IP has exactly one bus
port into the system, so the MMIO register access address range
directly implies the bus master DMA path.

To my mind, a sensble modeling would be to have the DT tree represent
the AXI DAG flattened into a tree rooted at the CPU vertex. Separately
in the DT would be the full AXI DAG represented with phandle
connections.

Nodes in the DT would use phandles to indicate their connections into
the AXI DAG.

Hugely roughly:
soc 
{
   ranges = <Some quasi-real ranges indicating IP to CPU mapping>;
   ip_block 
   { 
      reg = <...>
      axi-ports = <mmio = &axi_low_speed_port0, dma = &axi_dma_port1, .. >;
   }
}

axi
{
   /* Describe a DAG of AXI connections here. */
   cpu { downstream = &ax_switch,}
   axi_switch {downstream = &memory,&low_speed}
   memory {}
   dma {downstream = &memory}
   low_speed {}
}

I was just reading the Zynq manual which gives a pretty good
description of what one vendor did using the ARM AXI toolkits..

http://www.xilinx.com/support/documentation/user_guides/ug585-Zynq-7000-TRM.pdf
Figure 5-1 pg 122

You can see it is a complex DAG of AXI busses. For instance if you
want to master from a 'High Performance Port M0' to 'On Chip RAM' you
follow the path AXI_HP[MO] -> Switch1[M2] -> OCM.

But you can't master from 'High Performance Port M0' to internal
slaves, as there is no routing path.

Each switch block is an opportunity for the designer to provide
address remapping/IO MMU hardware that needs configuring :)

Which is why I think encoding the AXI DAG directly in DT is probably
the most future proof way to model this stuff - it sticks close to the
tools ARM provides to the SOC designers, so it is very likely to be
able to model arbitary SOC designs.

Regards,
Jason
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
