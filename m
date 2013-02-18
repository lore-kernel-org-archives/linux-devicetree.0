From: Dave Martin <dave.martin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC] DT affinity bindings/representing bus masters with DT
Date: Mon, 18 Feb 2013 18:39:19 +0000
Message-ID: <20130218183919.GA2016@linaro.org>
References: <20130215172102.GF3014@e102568-lin.cambridge.arm.com>
 <20130215175206.GA11931@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130215175206.GA11931-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
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
To: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Feb 15, 2013 at 05:52:06PM +0000, Dave Martin wrote:
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
> 
> Maybe we should avoid the word "affinity".  We know what this means with
> respct to devices symmetric across multiple CPUs (though the illusion of
> symmetry is often less complete than we'd like).
> 
> In other contexts, we might just get confused about what this word means
> (I do, anyway).
> 
> > acme1 and acme2 are two bus masters in the system (eg a DMA and a GPU).
> > 
> > Each foo@2000000 reg property maps to a device that represents a bus master
> > (to make it clearer, a foo@2000000 reg property defines an address space that
> > belongs to a bus master, ie the address space represents a programming
> > interface specific to that master; in the bindings above address 0x2000000 is
> > the address at which acme1 device can programme its "foo" interface, address
> > 0x2001000 is the address at which acme2 device can programme its "foo"
> > interface).
> > 
> > Now, the dts above links, through a phandle, a reg property to a "slave"
> > device not a "master" device, basically to a device tree node representing the
> > acme1 device programming interface (address 0x4000000 is the register space of
> > the acme1 device, which is used to describe that device in the tree and
> > represents its address space, its "slave interface").
> > 
> > The approach above has two drawbacks:
> > 
> > 1 - we are using a slave device node to map a resource to a master device.
> >     Since there is no notion of "master" device in the current device tree
> >     bindings that's our best bet. The approach above works as long as there
> >     is a node in the device tree describing the "master" node (through its
> >     slave interface), even if it does not have a programming interface (ie it
> >     cannot be described in the device tree as a memory mapped/addressable
> >     device). This is also the approach taken by the dma bindings described in
> > 
> >     Documentation/devicetree/bindings/dma/dma.txt (currently in linux-next)
> > 
> > 2 - By connecting a device's resource to a slave device, to emulate a resource
> >     to a bus master connection, we are implicitly taking the assumption that
> >     the address space where both eg foo and acme1 devices above reside (acme1
> >     programming interface) is the same as the one seen by the acme1 master
> >     device (which has no representation in the device tree). This is not a
> >     problem for now, but the device tree representation is questionable and
> >     we are inquiring on possible issues this might create.
> > 
> > Any bits of advice is welcome on the subject, and the problem can be
> > elaborated with further examples to kickstart discussions.
> 
> Every master potentially has its own address space -- a bus
> (either hypothetical or real) which maps the accessible slaves.  This
> bus might or might not be shared with other masters in the system.
> 
> If could help illustrate the potential issues if we can sketch a system
> which we can't adequately describe.
> 
> Things which come to mind are:
> 
>  * CPU-local and cluster-local peripherals
> 
>  * Non-coherent CPUs or microcontrollers
> 
>  * Bus masters with slave interfaces (e.g., control interfaces) in a location
>    in the bus hierarchy unrelated to where the device makes its master
>    accesses, to that we can't guess from the DT how to map addresses
>    for those devices (interconnects are an example of this: the CCI
>    control register interface is likely to be dangling from an AXI or APB
>    bus, topologically distant from the CCI's interconnect and master
>    ports, for example)
> 
>    Most DMA controllers will have this property too.  For now, we just
>    have to guess what view of the system the controller sees in its
>    master role.
> 
>  * Masters with weird private links (for example, a high-throughput DMA
>    controller with its own, non-coherent port on the DRAM controller,
>    bypassing the bus through which CPUs and other masters see the DRAM)
> 
> We don't necessarily have to solve all of these yet, but they all feel
> related.  The fundamental problem is how to describe the fact that
> there may be multiple, arbitrarily different, views of the system.
> 
> If we can come up with non-tortured ways of describing all these things
> in DT, then we don't have a problem...


Below, I attempt to define the problem in a bit more detail and sketch
out some solutions and implications.  It's a bit long -- apologies --
but I couldn't figure out a good way to compress it.


Cheers
---Dave


Thinking a bit about this, CPU nodes feel like a good place to start
thinking about what masters look like, since CPUs are the only pure
masters that DT currently describes today.

Could we describe each CPU's address space by putting child nodes into
a CPU node itself?  ePAPR already specifies that a missing ranges
property means that there is no address mapping between the parent
and the child, so each cpu node can already represent an isolated
memory space:

/ {
	#address-cells = <1>;
	#size-cells = <0>;

	cpus {
		// Note: no ranges property means that CPU reg properties
		// are not mapped in to / as addresses

		#address-cells = <1>;
		#size-cells = <0>;

		cpu@0 {
			#address-cells = <1>;
			#size-cells = <0>;

			// Note: no ranges property means that we have a
			// separate CPU-local address space, nothing to
			// do with CPU ids.

			memory {
				compatible = "arm,tcm";
				reg = <0xe0400000 0x4000>;
			};
		};

		cpu@1 {
			#address-cells = <1>;
			#size-cells = <0>;

			memory {
				compatible = "arm,tcm";
				reg = <0xe0400000 0x4000>;
			};
		};

		// ...
	};

	// ...
};

Representing:

    +------+            +------+
    | CPU0 |            | CPU1 |
    +------+            +------+
      |  |                |  |
      |  v                |  v
      | +------+          | +------+
      | |memory|          | |memory|
      | +------+          | +------+
      |                   |
      v                   v
   +-------------------------+
   |   common interconnect   |
   +-------------------------+
          |     |     |
          v     v     v
        common peripherals


Here, the common interconnect is represented by / in the DT.  The DT
consists of a mixture of nodes which have a reg or ranges propertyo
(peripherals and buses) and therefore has no presence in the / address
space, and nodes which have neither (other stuff which may not represent
hardware at all but which "has to go in the DT somewhere".

I've invented some local memory on each CPU for the purpose of
illustration.  That's probably not a realistic or likely system design
-- but I'm just trying to expore ideas here.


Some outcomes:

 * The primary bus seen by each CPU would be the cpu node itself.

 * Addresses not matching any peripheral on the local bus propagate to /.
   The address mapping between the CPU local bus and / is assumed by
   default to be the identifity mapping.  This also means that a master
   node's #address-cells and #size-cells must match /.

 * There is no risk of circular lookup here, because the cpus { } node
   is isolated from / by the absence of reg or ranges properties.


This suggests a way to represent a master device in the DT, if the
address space it sees in its master role is /:

 * A device with master capabilities must be represented by a node

 * Such a node must define #address-cells and #size-cells to match /.


For simplicity, we could consider every device a potential master,
such that a hypothetical dt_map_address(struct device_node *slave,
struct device_node *master) would always produce a result for any
slave reachable from /.

Alternatively, we could require master nodes to be labelled with a
special property to indicate that the node represents a device with
master capabilities.


This can work when / really is the common merge point for all
masters, but what if it isn't?

Suppose we have a non-coherent DMA engine, like this:

    +------+            +------+
    | CPU0 |            | CPU1 |
    +------+            +------+
      |  |                |  |
      |  v                |  v
      | +------+          | +------+
      | |memory|          | |memory|
      | +------+          | +------+
      |                   |      ,-.
      v                   v     |   v (control slave port)
   +-------------------------+  |  +-------+
   |   common interconnect   |  |  | ncDMA |
   +-------------------------+  |  +-------+
      | |          |      | |   |  | (master port)
      v v          |      |  `-'   |
common peripherals |      |        |
                   v      v        v
          +---------+   +-----------+
          |  DRAM1  |   |   DRAM2   |
          +---------+   +-----------+


Unlike the CPU-local-memory thing, this isn't unrealistic at all.  We
have a situation something like this with the motherboard CLCD
controller on vexpress.  I think that most complex SoCs will have at
least one instance of this kind of configuration (just my guess, based
on no evidence)  Real SoCs are not designed from a clean page, but will
inherit legacy subsystems from older SoCs, especially in areas where
performance is not much of an issue (audio codecs, UARTs ... whatever).


Omitting the CPU nodes, this might look something like:

/ {
	cpus {
		// omitted
	};

	// Question: what does the memory node mean wrt bus topology??
	memory {
		device_type = "memory";
		reg = <0x80000000 0x40000000>; // 1GB DRAM1
	};

	common-bus {
		compatible = "simple-bus";
		ranges = <0x00000000 0x80000000 0x80000000>;

		// DRAM1 omitted because it's in the toplevel memory
		// node.  This may or may not be appropriate.

ncDMA_bus:	bus@42000000 {
			compatible = "simple-bus";
			ranges = <0x00000000 0x42000000 0x01000000>;

			memory {
				reg = <0x00000000 0x01000000>;
			};
		};

		dma@4c00000 {
			// control slave interface
			reg = <0x04c00000 0x00001000>; 

			// device also has master capabilities:
			master;

			// links to shared slaves
			// intentionally similar to the ePAPR dma-ranges
			// property
			slave = <&ncDMA_bus 0x00000000 0x00000000 0x01000000>;
		};
	}
};

"slave" is a prop-encoded array of slave-bus-phandle, master-address,
slave-bus-address, length.  master-address obeys #address-cells of
the master node; slave-bus-address obeys #address-cells of the node
to which slave-bus-phandle points; length obeys the #size-cells of
the master node.  The slave node might contain multiple such tuples.

ePAPR has dma-ranges, which is close to what we need, but too limited
for the general case.  The assumption there seems to be that DMA
accesses are a special type of memory access which can travel up the
tree and then down into other peripherals or subtrees.  dma-ranges
can be thought of as a "slave" property where slave-bus-phandle
implicitly points to the immediate parent of the containing node.

However, while this is probably adequate to describe a cards-in-slots
physical bus, on-SoC peripherals can be crosslinked in arbitrary
ways, bypassing shared buses.

"slave" allows us to eliminate the assumption that all master accesses
originating from a subtree behave identically, by adding an explicit
phandle.


To get around this problem in a way which follows the spirit of
dma-ranges, I created a fictional transparent bus (labelled ncDMA_bus),
and a slave property to refer to it.

Some more outcomes:

 * cpus are probably still special.  We assume those are masters
   even with no "master" property.

 * Masters with no "slaves" property master on /, with an identity
   address mapping.

 * Masters with local subnodes master on those subnodes.

 * Masters with a "slave" property master the referenced devices
   or buses.

 * We can retain the dma-ranges property and continue to use it
   in those cases where it is adequate.

 * The "master" property might not be needed.  Either a device
   has subnodes or a slave or dma-ranges node (in which case it
   can be considered a master) ... or has none of these (in which
   the device is not a master).


Cheers
---Dave
