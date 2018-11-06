From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [RFC 1/2] dt-bindings: topology: Add RISC-V cpu topology.
Date: Tue, 6 Nov 2018 11:37:23 +0000
Message-ID: <20181106113723.j5k5f7ovehiupyid@lakrids.cambridge.arm.com>
References: <mhng-799bd6f4-e4af-481e-90d8-bdc0e30f2530@palmer-si-x1c4>
 <9e77989d6b868d914bc328401cd64557@mailhost.ics.forth.gr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <9e77989d6b868d914bc328401cd64557@mailhost.ics.forth.gr>
Sender: linux-kernel-owner@vger.kernel.org
To: Nick Kossifidis <mick@ics.forth.gr>
Cc: Palmer Dabbelt <palmer@sifive.com>, robh+dt@kernel.org, devicetree@vger.kernel.org, Damien.LeMoal@wdc.com, alankao@andestech.com, zong@andestech.com, anup@brainfault.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>, atish.patra@wdc.com, linux-riscv@lists.infradead.org, tglx@linutronix.de
List-Id: devicetree@vger.kernel.org

On Tue, Nov 06, 2018 at 12:03:17PM +0200, Nick Kossifidis wrote:
> Στις 2018-11-05 21:38, Palmer Dabbelt έγραψε:
> > On Fri, 02 Nov 2018 06:09:39 PDT (-0700), robh+dt@kernel.org wrote:
> > > On Thu, Nov 1, 2018 at 6:04 PM Atish Patra <atish.patra@wdc.com>
> > > wrote:
> > > > 
> > > > Define a RISC-V cpu topology. This is based on cpu-map in ARM world.
> > > > But it doesn't need a separate thread node for defining SMT systems.
> > > > Multiple cpu phandle properties can be parsed to identify the sibling
> > > > hardware threads. Moreover, we do not have cluster concept in RISC-V.
> > > > So package is a better word choice than cluster for RISC-V.
> > > 
> > > There was a proposal to add package info for ARM recently. Not sure
> > > what happened to that, but we don't need 2 different ways.
> > > 
> > > There's never going to be clusters for RISC-V? What prevents that?
> > > Seems shortsighted to me.
> > > 
> > > > 
> > > > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > > > ---
> > > >  .../devicetree/bindings/riscv/topology.txt         | 154
> > > > +++++++++++++++++++++
> > > >  1 file changed, 154 insertions(+)
> > > >  create mode 100644
> > > > Documentation/devicetree/bindings/riscv/topology.txt
> > > > 
> > > > diff --git
> > > > a/Documentation/devicetree/bindings/riscv/topology.txt
> > > > b/Documentation/devicetree/bindings/riscv/topology.txt
> > > > new file mode 100644
> > > > index 00000000..96039ed3
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/riscv/topology.txt
> > > > @@ -0,0 +1,154 @@
> > > > +===========================================
> > > > +RISC-V cpu topology binding description
> > > > +===========================================
> > > > +
> > > > +===========================================
> > > > +1 - Introduction
> > > > +===========================================
> > > > +
> > > > +In a RISC-V system, the hierarchy of CPUs can be defined
> > > > through following nodes that
> > > > +are used to describe the layout of physical CPUs in the system:
> > > > +
> > > > +- packages
> > > > +- core
> > > > +
> > > > +The cpu nodes (bindings defined in [1]) represent the devices that
> > > > +correspond to physical CPUs and are to be mapped to the
> > > > hierarchy levels.
> > > > +Simultaneous multi-threading (SMT) systems can also represent
> > > > their topology
> > > > +by defining multiple cpu phandles inside core node. The details
> > > > are explained
> > > > +in paragraph 3.
> > > 
> > > I don't see a reason to do this differently than ARM. That said, I
> > > don't think the thread part is in use on ARM, so it could possibly be
> > > changed.
> > > 
> > > > +
> > > > +The remainder of this document provides the topology bindings
> > > > for ARM, based
> > > 
> > > for ARM?
> > > 
> > > > +on the Devicetree Specification, available from:
> > > > +
> > > > +https://www.devicetree.org/specifications/
> > > > +
> > > > +If not stated otherwise, whenever a reference to a cpu node
> > > > phandle is made its
> > > > +value must point to a cpu node compliant with the cpu node
> > > > bindings as
> > > > +documented in [1].
> > > > +A topology description containing phandles to cpu nodes that
> > > > are not compliant
> > > > +with bindings standardized in [1] is therefore considered invalid.
> > > > +
> > > > +This cpu topology binding description is mostly based on the
> > > > topology defined
> > > > +in ARM [2].
> > > > +===========================================
> > > > +2 - cpu-topology node
> > > 
> > > cpu-map. Why change this?
> > > 
> > > What I would like to see is the ARM topology binding reworked to be
> > > common or some good reasons why it doesn't work for RISC-V as-is.
> > 
> > I think it would be great if CPU topologies were not a RISC-V specific
> > thing.  We don't really do anything different than anyone else, so
> > it'd be great if we could all share the same spec and code.  Looking
> > quickly at the ARM cpu-map bindings, I don't see any reason why we
> > can't just use the same thing on RISC-V -- it's not quite how I'd do
> > it, but I don't think the differences are worth having another
> > implementation.  Mechanically I'm not sure how to do this: should
> > there just be a "Documentation/devicetree/bindings/cpu-map.txt"?
> > 
> > If everyone is OK with that then I vote we just go ahead and
> > genericise the ARM "cpu-map" stuff for CPU topology.  Sharing the
> > implementation looks fairly straight-forward as well.
> > 
> 
> Please check this out...
> https://lkml.org/lkml/2018/11/3/99
> 
> It's also non arch-dependent and it can handle the scheduler's capabilities
> better than cpu-map.

Could you elaborate on what this does better than cpu-map? I'd be
curious to see if we could/should augment cpu-map to cater for those
details.

Generally, we deliberately avoid placing software abstractions in the DT
(e.g. scheduler domains), because the design of these abstractions are
specific to a given software stack rather than the hardware, and even in
the context of that specific software stack these abstractions change
over time.

Placing software abstractions in the DT may seem simpler initially, but
longer term it ends up requiring translation anyway as abstractions
change, and typically it involves placing some policy in the DT, which
restricts the ability of software to do something better.

Having some translation between the DT and the Linux-internal
abstraction is how we expect things to work generally, and allows for a
more natural representation in the DT (which may be more or less
powerful than the current Linux abstraction).

Thanks,
Mark.
