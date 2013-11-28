From: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Subject: Re: [RFC PATCH] Documentation: devicetree: add description for
 generic bus properties
Date: Thu, 28 Nov 2013 16:31:47 -0700
Message-ID: <20131128233147.GA19387@obsidianresearch.com>
References: <20131127172806.GC2291@e103592.cambridge.arm.com>
 <20131128203322.GB14689@mithrandir>
 <20131128211009.GA26447@obsidianresearch.com>
 <20131128222232.GF14689@mithrandir>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131128222232.GF14689@mithrandir>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Dave Martin <Dave.Martin-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 28, 2013 at 11:22:33PM +0100, Thierry Reding wrote:
> On Thu, Nov 28, 2013 at 02:10:09PM -0700, Jason Gunthorpe wrote:
> > On Thu, Nov 28, 2013 at 09:33:23PM +0100, Thierry Reding wrote:
> > 
> > > >   - Describing masters that master through multiple different buses
> > > > 
> > > >   - How on Earth this fits in with the Linux device model (it doesn't)
> > > > 
> > > >   - Interaction with IOMMU bindings (currently under discussion)
> > > 
> > > This is all very vague. Perhaps everyone else knows what this is all
> > > about, in which case it'd be great if somebody could clue me in.
> > 
> > It looks like an approach to describe an AXI physical bus topology in
> > DT..
> 
> Thanks for explaining this. It makes a whole lot more sense now.

Hopefully the ARM guys concur, this was just my impression from
reviewing their patches and having recently done some design work with
AXI..

> > axi
> > {
> >    /* Describe a DAG of AXI connections here. */
> >    cpu { downstream = &ax_switch,}
> >    axi_switch {downstream = &memory,&low_speed}
> >    memory {}
> >    dma {downstream = &memory}
> >    low_speed {}
> > }
> 
> Correct me if I'm wrong, but the switch would be what the specification
> refers to as "interconnect", while a port would correspond to what is
> called an "interface" in the specification?

That seems correct, but for this purpose we are not interested in
boring dumb interconnect but fancy interconnect with address remapping
capabilities, or cache coherency (eg the SCU/L2 cache is modeled as
switch/interconnect in a AXI DAG).

I called it a switch because the job of the interconnect block is to
take an AXI input packet on a slave interface and route it to the
proper master interface with internal arbitration between slave
interfaces. In my world that is a called a switch ;)

AXI is basically an on-chip point-to-point switched fabric like PCI-E,
and the stuff that travels on AXI looks fairly similar to PCI-E TLPs..

If you refer to the PDF I linked I broadly modeled the above DT
fragment on that diagram, each axi sub node (vertex) represents an
'interconnect' and 'downstream' is a master->slave interface pair (edge).

Fundamentally AXI is inherently a DAG, but unlike what we are used to
in other platforms you don't have to go through a fused
CPU/cache/memory controller unit to access memory, so there are
software visible asymmetries depending on how the DMA flows through
the AXI DAG.

> > Which is why I think encoding the AXI DAG directly in DT is probably
> > the most future proof way to model this stuff - it sticks close to the
> > tools ARM provides to the SOC designers, so it is very likely to be
> > able to model arbitary SOC designs.
> 
> I'm not sure I agree with you fully here. At least I think that if what
> we want to describe is an AXI bus topology, then we should be describing
> it in terms of the AXI specification.

Right, that was what I was trying to describe :) 

The DAG would be vertexes that are 'interconnect' and directed edges
that are 'master -> slave interface' pairs.

This would be an addendum/side-table dataset to the standard 'soc' CPU
address map tree, that would only be needed to program address
mapping/iommu hardware.

And it isn't really AXI specific, x86 style platforms can have a DAG
too, it is just much simpler, as there is only 1 vertex - the IOMMU.

> I mean, even though device tree is supposed to describe hardware, there
> needs to be a limit to the amount of detail we put into it. After all it
> isn't a hardware description language, but rather a language to describe
> the hardware in a way that makes sense for operating system software to
> use it.

Right - which is why I said the usual 'soc' node should remain as-is
typical today - a tree formed by viewing the AXI DAG from the CPU
vertex. That 100% matches the OS perspective of the system for CPU
originated MMIO.

The AXI DAG side-table would be used to resolve weirdness with 'bus
master' DMA programming. The OS can detect all the required
configuration and properties by tracing a path through the DAG from
the source of the DMA to the target - that tells you what IOMMUs are
involved, if the path is cache coherent, etc.

> Perhaps this is just another way of saying what Greg has already said.
> If we continue down this road, we'll eventually end up having to
> describe all sorts of nitty gritty details. And we'll need even more

Greg's point makes sense, but the HW guys are not designing things
this way for kicks - there are real physics based reasons for some of
these choices...

eg An all-to-all bus cross bar (eg like Intel's ring bus) is engery
expensive compared to a purpose built muxed bus tree. Doing coherency
look ups on DMA traffic costs energy, etc.

> code to deal with those descriptions and the hardware they represent. At
> some point we need to start pushing some of the complexity back into
> hardware so that we can keep a sane code-base.

Some of this is a consequence of the push to have the firmware
minimal. As soon as you say the kernel has to configure the address
map you've created a big complexity for it..

Jason
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
