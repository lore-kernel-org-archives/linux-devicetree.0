From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [RFC] DT affinity bindings/representing bus masters with DT
Date: Mon, 18 Mar 2013 09:48:16 +0000
Message-ID: <20130318094815.GA30116@e102568-lin.cambridge.arm.com>
References: <20130215172102.GF3014@e102568-lin.cambridge.arm.com>
 <20130306215714.GC6740@truffula.fritz.box>
 <20130311170657.GD25250@e102568-lin.cambridge.arm.com>
 <20130318030928.GG9402@truffula.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130318030928.GG9402-W9XWwYn+TF0XU02nzanrWNbf9cGiqdzd@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: "nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 18, 2013 at 03:09:28AM +0000, David Gibson wrote:
> On Mon, Mar 11, 2013 at 05:06:57PM +0000, Lorenzo Pieralisi wrote:
> > Hi David,
> > 
> > thanks for your feedback.
> > 
> > On Wed, Mar 06, 2013 at 09:57:14PM +0000, David Gibson wrote:
> > > On Fri, Feb 15, 2013 at 05:21:02PM +0000, Lorenzo Pieralisi wrote:
> [snip]
> > > > Each foo@2000000 reg property maps to a device that represents a bus master
> > > > (to make it clearer, a foo@2000000 reg property defines an address space that
> > > > belongs to a bus master, ie the address space represents a programming
> > > > interface specific to that master; in the bindings above address 0x2000000 is
> > > > the address at which acme1 device can programme its "foo" interface, address
> > > > 0x2001000 is the address at which acme2 device can programme its "foo"
> > > > interface).
> > > 
> > > Ok.  I think annotating the existing reg property like this is a very
> > > bad idea.  I haven't seen all the previous discussion, so I'm not
> > > totally clean on what this affinity concept is about.  But as I
> > > understand it, these "slave" resources cannot be treated like an
> > > ordinary resource in in the reg property.  That means an older client
> > > will potentially misinterpret "reg" because it doesn't know about
> > > "affinity".
> > 
> > Not really, "reg" still complies with the current DT bindings. Affinity
> > is there to associate a reg property to a "master" but the reg property
> > definition does not change. I do not think backward compatibility is a
> > problem per-se here.
> 
> Ok, I did not understand the problem properly.
> 
> > > Worse, again, if I've understood correctly, resources with different
> > > "masters" are essentially in different logical address spaces.  "reg"
> > > properties should always sit in the logical address space representing
> > > the parent node's bus.  Different address spaces could also have
> > > different address sizes, which would really complicate parsing "reg".
> > 
> > I think we need to post what we have, it is really complex to explain
> > the issue without a concrete example. To cut a long story short I
> > would not say that the resources sit in different address spaces, it is
> > that we need to associate those address ranges with specific bus masters.
> > 
> > We have to have a way to say:
> > 
> > "Address range 0x80001000 - 0x80001fff is used to programme the control
> > registers associated with the port connected to master X".
> > 
> > When a CPU wants to programme a control port for a specific master, it
> > needs to know what address range should be programmed.
> > 
> > I mentioned "resources" instead of addresses since the problem we are
> > having is the same when it comes to map IRQs to set of CPUS. We need
> > to associate a resource (IRQ or address) to a set of cpus (or more in
> > general, masters).
> 
> Hrm.  See, I think I may be misunderstanding the problem again,
> because with this description I can see no problem.  It's already up
> to the device binding to describe the purpose of each entry in the reg
> property.  So what's the problem with it just being part of the
> binding to say which reg entry is associated with which master port?

That's exactly what we are trying to do. But to associate the reg
property to a master port we need a phandle, how can we pull that off
otherwise ?

The purpose of each reg entry is to describe the address space
associated with the programming interface for a port. What reg currently
can't describe is to what component that port is connected to. It is not
something we can define in the binding (unless we make it configurable
with a phandle, and that's what we want to do) because it changes with
different SoC implementations.

In one SoC port 0 can be connected to a GPU, in another one to a DMA.

How can we write a binding that encompasses both cases ? The only
solution is a phandle, to say this port is connected to this master.

When a CPU programmes that port is because it wants to change behaviour
of the port for a specific component (a DMA, a GPU, a cluster of CPUs).

Let's say we have to describe a binding for a component having three
slave ports connected to three masters (to have a more accurate example,
two clusters of cpus and a GPU). Each port can be programmed and has an
address space associated to it (reg property). The programming interface
controls the port behaviour.

Now, when a CPU wants to programme the port connected to CPU X (or GPU), how
can it know what address space (ie what reg property) it has to use ?

We cannot hardcode it in the reg property bindings, the component's ports are
connected to different masters in different SoCs.

Let me know if it is unclear, the patchset we are about to post will help
clarify things I hope.

Lorenzo
