From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [RFC] DT affinity bindings/representing bus masters with DT
Date: Mon, 11 Mar 2013 17:06:57 +0000
Message-ID: <20130311170657.GD25250@e102568-lin.cambridge.arm.com>
References: <20130215172102.GF3014@e102568-lin.cambridge.arm.com>
 <20130306215714.GC6740@truffula.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130306215714.GC6740-W9XWwYn+TF0XU02nzanrWNbf9cGiqdzd@public.gmane.org>
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

Hi David,

thanks for your feedback.

On Wed, Mar 06, 2013 at 09:57:14PM +0000, David Gibson wrote:
> On Fri, Feb 15, 2013 at 05:21:02PM +0000, Lorenzo Pieralisi wrote:
> > Hi all,
> > 
> > in order to come up with a solid solution to the affinity bindings concept
> > we are facing in the ARM world, I am posting this RFC so that hopefully people
> > on the list can chime in and help us in this endeavour.
> > 
> > I tried to keep things simple on purpose and some statements are a bit of an
> > oversimplification, we can elaborate on those if needed.
> > 
> > Hereafter a summary of what we are trying to achieve.
> > 
> > Current device tree bindings allow to describe HW configurations of systems
> > in a bus like fashion, where each bus contains bus slaves and mapping
> > heuristics to translate address spaces across bus layers (AMBA -> PCI).
> > 
> > The device tree by definition represents the view of the system from the
> > perspective of the CPU(s). This means that all devices (but CPUs) present
> > in the device tree are to be seen as "slave" components, ie devices sitting on
> > a bus and accessible from the CPU with an addressing mode that can vary and it
> > is defined by the bus the device is sitting on.
> > 
> > There are specific cases in current SoCs though where resources belonging to
> > a slave device should be linked to a master in the SoC system hierarchy.
> > 
> > To the best of my knowledge, the mechanism used to implement this linkage is
> > not defined by any device tree binding; it probably can be a phandle in the
> > device tree syntax, but this has some implications that will be described as
> > follows.
> > 
> > A programmable device, let's call it "foo" for the sake of this discussion,
> > has several resources (ie memory spaces) that should be mapped to bus masters
> > in a SoC hierarchy (each resource "belongs" to a master). The only way this
> > can be currently done through a device tree is by linking the resource in
> > question to a device representing the master node through a phandle (keeping
> > in mind that the concept of master node does not exist in current DT
> > bindings).
> > 
> > An example is worth a thousand words (pseudo dts file):
> > 
> > / {
> > 	#address-cells = 1;
> > 	#size-cells = 1;
> > 
> > 	acme1: acme@4000000 {
> > 		reg = <0x4000000 0x1000>;
> > 	};
> > 
> > 	acme2: acme@5000000 {
> > 		reg = <0x5000000 0x1000>;
> > 	};
> > 
> > 	foo@2000000 {
> > 		reg = <0x2000000 0x1000
> > 		       0x2001000 0x1000>;
> > 		affinity = <&acme1 &acme2>;
> > 	};
> > };
> > 
> > where the "affinity" property contains a number of phandles equal to the number
> > of resources (ie reg properties) in the foo@2000000 node. The "affinity"
> > property maps a reg property to a device tree node, one phandle per "reg"
> > property.
> > 
> > acme1 and acme2 are two bus masters in the system (eg a DMA and a GPU).
> > 
> > Each foo@2000000 reg property maps to a device that represents a bus master
> > (to make it clearer, a foo@2000000 reg property defines an address space that
> > belongs to a bus master, ie the address space represents a programming
> > interface specific to that master; in the bindings above address 0x2000000 is
> > the address at which acme1 device can programme its "foo" interface, address
> > 0x2001000 is the address at which acme2 device can programme its "foo"
> > interface).
> 
> Ok.  I think annotating the existing reg property like this is a very
> bad idea.  I haven't seen all the previous discussion, so I'm not
> totally clean on what this affinity concept is about.  But as I
> understand it, these "slave" resources cannot be treated like an
> ordinary resource in in the reg property.  That means an older client
> will potentially misinterpret "reg" because it doesn't know about
> "affinity".

Not really, "reg" still complies with the current DT bindings. Affinity
is there to associate a reg property to a "master" but the reg property
definition does not change. I do not think backward compatibility is a
problem per-se here.

> Worse, again, if I've understood correctly, resources with different
> "masters" are essentially in different logical address spaces.  "reg"
> properties should always sit in the logical address space representing
> the parent node's bus.  Different address spaces could also have
> different address sizes, which would really complicate parsing "reg".

I think we need to post what we have, it is really complex to explain
the issue without a concrete example. To cut a long story short I
would not say that the resources sit in different address spaces, it is
that we need to associate those address ranges with specific bus masters.

We have to have a way to say:

"Address range 0x80001000 - 0x80001fff is used to programme the control
registers associated with the port connected to master X".

When a CPU wants to programme a control port for a specific master, it
needs to know what address range should be programmed.

I mentioned "resources" instead of addresses since the problem we are
having is the same when it comes to map IRQs to set of CPUS. We need
to associate a resource (IRQ or address) to a set of cpus (or more in
general, masters).

We will be posting the code we have soon, this will simplify the discussion.

> Now, a device tree extension I've considered before for other reasons
> might also be relevant to your case.  That is to add a new "bus-reg"
> property that has a meaning similar to "reg" but contains (phandle,
> address, size) tuples instead of just (address, size) tuples.  The
> phandle in each case would represent the node in whose address space
> this resource appears.  This would generalize the "dcr-reg" and
> "scom-reg" properties we've sometimes used on ppc.

It might be used that way but I need an example to understand if it fits
the purpose. We still have to associate that resource to a set of
masters, so for that to work the address space pointed at by the phandle
must be capable of defining a master (or set of masters).

I am not sure the problem is identical to dcr-reg though.

> It's not clear if this essentially incompatible extension would be
> worth it, though.  The other way to represent these structures is to
> just split the node for this logical device into different pieces
> under each address space it has resources on.  These pieces are then
> linked together with (binding specific) phandle pointers to each
> other.

I think that could be feasible too and we thought about that.

Code coming, let's restart the discussion then to see how we can move
forward.

Thank you very much,
Lorenzo
