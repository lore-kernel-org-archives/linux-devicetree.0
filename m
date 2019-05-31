From: Morten Rasmussen <morten.rasmussen@arm.com>
Subject: Re: [PATCH v6 1/7] Documentation: DT: arm: add support for sockets
 defining package boundaries
Date: Fri, 31 May 2019 10:54:28 +0100
Message-ID: <20190531095428.GC10919@e105550-lin.cambridge.arm.com>
References: <20190529211340.17087-1-atish.patra@wdc.com>
 <20190529211340.17087-2-atish.patra@wdc.com>
 <49f41e62-5354-a674-d95f-5f63851a0ca6@ti.com>
 <20190530115103.GA10919@e105550-lin.cambridge.arm.com>
 <20190530214254.tuxsnyv52a2fyhck@shell.armlinux.org.uk>
 <20190531093743.GB18292@e107155-lin>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190531093743.GB18292@e107155-lin>
Sender: linux-kernel-owner@vger.kernel.org
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Russell King - ARM Linux admin <linux@armlinux.org.uk>, "Andrew F. Davis" <afd@ti.com>, Atish Patra <atish.patra@wdc.com>, linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, Catalin Marinas <catalin.marinas@arm.com>, "David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ingo Molnar <mingo@kernel.org>, Jeremy Linton <jeremy.linton@arm.com>, Linus Walleij <linus.walleij@linaro.org>, linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Otto Sabart <ottosabart@seberm.com>, Palmer Dabbelt <palmer@sifive.com>, Paul Walmsley <paul.walmsley@sifive.co>
List-Id: devicetree@vger.kernel.org

On Fri, May 31, 2019 at 10:37:43AM +0100, Sudeep Holla wrote:
> On Thu, May 30, 2019 at 10:42:54PM +0100, Russell King - ARM Linux admin wrote:
> > On Thu, May 30, 2019 at 12:51:03PM +0100, Morten Rasmussen wrote:
> > > On Wed, May 29, 2019 at 07:39:17PM -0400, Andrew F. Davis wrote:
> > > > On 5/29/19 5:13 PM, Atish Patra wrote:
> > > > >From: Sudeep Holla <sudeep.holla@arm.com>
> > > > >
> > > > >The current ARM DT topology description provides the operating system
> > > > >with a topological view of the system that is based on leaf nodes
> > > > >representing either cores or threads (in an SMT system) and a
> > > > >hierarchical set of cluster nodes that creates a hierarchical topology
> > > > >view of how those cores and threads are grouped.
> > > > >
> > > > >However this hierarchical representation of clusters does not allow to
> > > > >describe what topology level actually represents the physical package or
> > > > >the socket boundary, which is a key piece of information to be used by
> > > > >an operating system to optimize resource allocation and scheduling.
> > > > >
> > > >
> > > > Are physical package descriptions really needed? What does "socket" imply
> > > > that a higher layer "cluster" node grouping does not? It doesn't imply a
> > > > different NUMA distance and the definition of "socket" is already not well
> > > > defined, is a dual chiplet processor not just a fancy dual "socket" or are
> > > > dual "sockets" on a server board "slotket" card, will we need new names for
> > > > those too..
> > >
> > > Socket (or package) just implies what you suggest, a grouping of CPUs
> > > based on the physical socket (or package). Some resources might be
> > > associated with packages and more importantly socket information is
> > > exposed to user-space. At the moment clusters are being exposed to
> > > user-space as sockets which is less than ideal for some topologies.
> >
> > Please point out a 32-bit ARM system that has multiple "socket"s.
> >
> > As far as I'm aware, all 32-bit systems do not have socketed CPUs
> > (modern ARM CPUs are part of a larger SoC), and the CPUs are always
> > in one package.
> >
> > Even the test systems I've seen do not have socketed CPUs.
> >
> 
> As far as we know, there's none. So we simply have to assume all
> those systems are single socket(IOW all CPUs reside inside a single
> SoC package) system.

Right, but we don't make that assumption. Clusters are reported as
sockets/packages for arm, just like they are for arm64. My comment above
applied to what can be described using DT, not what systems actually
exists. We need to be able describe packages for architecture where we
can't make assumptions.

arm example (ARM TC2):
root@morras01-tc2:~# lstopo
Machine (985MB)
  Package L#0
    Core L#0 + PU L#0 (P#0)
    Core L#1 + PU L#1 (P#1)
  Package L#1
    Core L#2 + PU L#2 (P#2)
    Core L#3 + PU L#3 (P#3)
    Core L#4 + PU L#4 (P#4)

Morten
