From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: [RFC] DT affinity bindings/representing bus masters with DT
Date: Fri, 15 Feb 2013 17:21:02 +0000
Message-ID: <20130215172102.GF3014@e102568-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
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
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi all,

in order to come up with a solid solution to the affinity bindings concept
we are facing in the ARM world, I am posting this RFC so that hopefully people
on the list can chime in and help us in this endeavour.

I tried to keep things simple on purpose and some statements are a bit of an
oversimplification, we can elaborate on those if needed.

Hereafter a summary of what we are trying to achieve.

Current device tree bindings allow to describe HW configurations of systems
in a bus like fashion, where each bus contains bus slaves and mapping
heuristics to translate address spaces across bus layers (AMBA -> PCI).

The device tree by definition represents the view of the system from the
perspective of the CPU(s). This means that all devices (but CPUs) present
in the device tree are to be seen as "slave" components, ie devices sitting on
a bus and accessible from the CPU with an addressing mode that can vary and it
is defined by the bus the device is sitting on.

There are specific cases in current SoCs though where resources belonging to
a slave device should be linked to a master in the SoC system hierarchy.

To the best of my knowledge, the mechanism used to implement this linkage is
not defined by any device tree binding; it probably can be a phandle in the
device tree syntax, but this has some implications that will be described as
follows.

A programmable device, let's call it "foo" for the sake of this discussion,
has several resources (ie memory spaces) that should be mapped to bus masters
in a SoC hierarchy (each resource "belongs" to a master). The only way this
can be currently done through a device tree is by linking the resource in
question to a device representing the master node through a phandle (keeping
in mind that the concept of master node does not exist in current DT
bindings).

An example is worth a thousand words (pseudo dts file):

/ {
	#address-cells = 1;
	#size-cells = 1;

	acme1: acme@4000000 {
		reg = <0x4000000 0x1000>;
	};

	acme2: acme@5000000 {
		reg = <0x5000000 0x1000>;
	};

	foo@2000000 {
		reg = <0x2000000 0x1000
		       0x2001000 0x1000>;
		affinity = <&acme1 &acme2>;
	};
};

where the "affinity" property contains a number of phandles equal to the number
of resources (ie reg properties) in the foo@2000000 node. The "affinity"
property maps a reg property to a device tree node, one phandle per "reg"
property.

acme1 and acme2 are two bus masters in the system (eg a DMA and a GPU).

Each foo@2000000 reg property maps to a device that represents a bus master
(to make it clearer, a foo@2000000 reg property defines an address space that
belongs to a bus master, ie the address space represents a programming
interface specific to that master; in the bindings above address 0x2000000 is
the address at which acme1 device can programme its "foo" interface, address
0x2001000 is the address at which acme2 device can programme its "foo"
interface).

Now, the dts above links, through a phandle, a reg property to a "slave"
device not a "master" device, basically to a device tree node representing the
acme1 device programming interface (address 0x4000000 is the register space of
the acme1 device, which is used to describe that device in the tree and
represents its address space, its "slave interface").

The approach above has two drawbacks:

1 - we are using a slave device node to map a resource to a master device.
    Since there is no notion of "master" device in the current device tree
    bindings that's our best bet. The approach above works as long as there
    is a node in the device tree describing the "master" node (through its
    slave interface), even if it does not have a programming interface (ie it
    cannot be described in the device tree as a memory mapped/addressable
    device). This is also the approach taken by the dma bindings described in

    Documentation/devicetree/bindings/dma/dma.txt (currently in linux-next)

2 - By connecting a device's resource to a slave device, to emulate a resource
    to a bus master connection, we are implicitly taking the assumption that
    the address space where both eg foo and acme1 devices above reside (acme1
    programming interface) is the same as the one seen by the acme1 master
    device (which has no representation in the device tree). This is not a
    problem for now, but the device tree representation is questionable and
    we are inquiring on possible issues this might create.

Any bits of advice is welcome on the subject, and the problem can be
elaborated with further examples to kickstart discussions.

Thank you very much for your feedback,
Lorenzo
