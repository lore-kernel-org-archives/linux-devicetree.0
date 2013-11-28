From: Dave Martin <Dave.Martin@arm.com>
Subject: Re: [RFC PATCH] Documentation: devicetree: add description for
 generic bus properties
Date: Thu, 28 Nov 2013 19:39:17 +0000
Message-ID: <20131128193917.GC4634@e103592.cambridge.arm.com>
References: <20131127172806.GC2291@e103592.cambridge.arm.com>
 <20131127230650.GA6162@kroah.com>
 <20131128102845.GB21354@mudshark.cambridge.arm.com>
 <20131128173339.GB4634@e103592.cambridge.arm.com>
 <20131128191331.GB2385@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20131128191331.GB2385@kroah.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Mark Rutland <Mark.Rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Stephen Warren <swarren@wwwdotorg.org>, Will Deacon <will.deacon@arm.com>, Thierry Reding <thierry.reding@gmail.com>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Hiroshi Doyu <hdoyu@nvidia.com>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 28, 2013 at 11:13:31AM -0800, Greg KH wrote:
> On Thu, Nov 28, 2013 at 05:33:39PM +0000, Dave Martin wrote:
> > On Thu, Nov 28, 2013 at 10:28:45AM +0000, Will Deacon wrote:
> > > Hi Greg,
> > > 
> > > On Wed, Nov 27, 2013 at 11:06:50PM +0000, Greg KH wrote:
> > > > On Wed, Nov 27, 2013 at 05:28:06PM +0000, Dave Martin wrote:
> > > > > >From will.deacon@arm.com Wed Nov 20 12:06:22 2013
> > > > > A number of discussion points remain to be resolved:
> > > > > 
> > > > >   - Use of the ranges property and describing slave vs master bus
> > > > >     address ranges. In the latter case, we actually want to describe our
> > > > >     address space with respect to the bus on which the bus masters,
> > > > >     rather than the parent. This could potentially be achieved by adding
> > > > >     properties such as dma-parent and dma-ranges (already used by PPC?)
> > > > > 
> > > > >   - Describing masters that master through multiple different buses
> > > > > 
> > > > >   - How on Earth this fits in with the Linux device model (it doesn't)
> > > > 
> > > > How does this _not_ fit into the Linux device model?  What am I missing
> > > > here that precludes the use of the "driver/device/bus" model we have
> > > > today?
> > 
> > The physical-sockets history of buses like PCI tends to force a simple
> > tree-like topology as a natural consequence.  You also end up with
> > closely linked topologies for power, clocks, interrupts etc., because
> > those all pass through the same sockets, so it's difficult to have a
> > different structure.
> 
> There's nothing in the driver core that enforces such a topology.

Maybe not ... I have to wrap my head around that stuff a bit more.

> > On SoC, those constraints have never existed and are not followed.  A
> > device's interface to the system is almost always split into multiple
> > connections, not covered by a single design or standard.  The problem
> > now is that increasing complexity means that the sometimes bizarre
> > topology features of SoCs are becoming less and less transparent for
> > software.
> > 
> > The device model currently seems to assume that certain things (power,
> > DMA and MMIO accessibility) follow the tree (which may not work for many
> > SoCs), and some other things (clocks, regulators, interrupts etc.) are
> > not incorporated at all -- making them independent, but it may make some
> > abstractions impossible today.
> > 
> > How much this matters for actual systems is hard to foresee yet.  Since
> > not _all_ possible insanities find their way into silicon.  The
> > onus should certainly be on us (i.e., the ARM/SoC community) to
> > demonstrate if the device model needs to change, and to find practical
> > ways to change it that minimise the resulting churn.
> 
> Yes it is, you all are the ones tasked with implementing the crazy crap
> the hardware people have created, best of luck with that :)

Agreed.  The first assumption should be that we can fit in with the
existing device model -- we should only reconsider if we find that
to be impossible.

> > > The main problem is that we have devices which slave on one bus and master
> > > on another. That then complicates probing, power-management, IOMMU
> > > configuration, address mapping (e.g. I walk the slave buses to figure out
> > > where the slave registers live, but then I need a way to work out where
> > > exactly I master on a different bus) and dynamic coherency, amongst other
> > > things.
> > > 
> > > If we try to use the current infrastructure then we end up with one bus per
> > > device, which usually ends up being a fake bus representing both the slave
> > > and master buses (which is how the platform bus gets abused) and then device
> > > drivers having their own idea of the system topology where it's required.
> > > 
> > > This is fairly horrible and doesn't work for anything other than the trivial
> > > case, where one or both of the buses are `dumb' and don't require any work
> > > from Linux.
> > 
> > If we can come up with some generic bus type that is just a container for
> > a load of hooks that know how to deal with various aspects of each device's
> > interface to the system, on a per-device basis, than may be a start.
> > 
> > The platform bus kinda serves that role, but the trouble with that is that
> > it doesn't encourage any abstraction at all.  In the face of increasing
> > complexity, abstraction is desperately needed.
> 
> Then create a different abstraction, the normal solution to any problem
> in programming :)

That's certainly the first step.  It might end up looking a lot like a
kludge layer which duplicates core functionality -- if so, we should
then consider whether there is a better way, but we shouldn't judge it
prematurely.


It would be great to get some comments [hint to everyone] on the proposed
DT binding so that we can start to explore this properly.

Cheers
---Dave
