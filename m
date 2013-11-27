From: Dave Martin <Dave.Martin@arm.com>
Subject: [RFC PATCH] Documentation: devicetree: add description for generic
 bus properties
Date: Wed, 27 Nov 2013 17:28:06 +0000
Message-ID: <20131127172806.GC2291@e103592.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: devicetree@vger.kernel.org
Cc: Mark Rutland <Mark.Rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Greg KH <gregkh@linuxfoundation.org>, Will Deacon <Will.Deacon@arm.com>, Thierry Reding <thierry.reding@gmail.com>, Grant Likely <grant.likely@linaro.org>, linux-arm-kernel@lists.infradead.org, Hiroshi Doyu <hdoyu@nvidia.com>
List-Id: devicetree@vger.kernel.org

Hi all,

SoC architectures are getting increasingly complex in ways that are not
transparent to software.

A particular emerging issue is that of multi-master SoCs, which may have
different address views, IOMMUs, and coherency behaviour from one master
to the next.

DT can't describe multi-master systems today except for PCI DMA and
similar.  This comes with constraints and assumptions that won't work
for emerging SoC bus architectures.  On-SoC, a device's interface to the
system can't be described in terms of a single interface to a single
"bus".

Different masters may have different views of the system too.  Software
needs to understand the true topology in order to do address mapping,
coherency management etc., in any generic way.

One piece of the puzzle is to define how to describe these topologies in
DT.

The other is how to get the right abstractions in the kernel to drive
these systems in a generic way.

The following proposal (originally from Will) begins to address the DT
part.

Comments encouraged -- I anticipate it may take some discussion to
reach a consensus here.

Cheers
---Dave


>From will.deacon@arm.com Wed Nov 20 12:06:22 2013
Date: Wed, 20 Nov 2013 12:06:13 +0000
Subject: [PATCH RFC v2] Documentation: devicetree: add description for generic bus properties

This patch documents properties that can be used as part of bus and
device bindings in order to describe their linkages within the system
topology.

Use of these properties allows topological parsing to occur in generic
library code, making it easier for bus drivers to parse information
regarding their upstream masters and potentially allows us to treat
the slave and master interfaces separately for a given device.

Signed-off-by: Will Deacon <will.deacon@arm.com>
---

A number of discussion points remain to be resolved:

  - Use of the ranges property and describing slave vs master bus
    address ranges. In the latter case, we actually want to describe our
    address space with respect to the bus on which the bus masters,
    rather than the parent. This could potentially be achieved by adding
    properties such as dma-parent and dma-ranges (already used by PPC?)

  - Describing masters that master through multiple different buses

  - How on Earth this fits in with the Linux device model (it doesn't)

  - Interaction with IOMMU bindings (currently under discussion)

Cheers,

Will

 .../devicetree/bindings/arm/coherent-bus.txt       | 110 +++++++++++++++++++++
 1 file changed, 110 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/coherent-bus.txt

diff --git a/Documentation/devicetree/bindings/arm/coherent-bus.txt b/Documentation/devicetree/bindings/arm/coherent-bus.txt
new file mode 100644
index 000000000000..e3fbc2e491c7
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/coherent-bus.txt
@@ -0,0 +1,110 @@
+* Generic binding to describe a coherent bus
+
+In some systems, devices (peripherals and/or CPUs) do not share
+coherent views of memory, while on other systems sets of devices may
+share a coherent view of memory depending on the static bus topology
+and/or dynamic configuration of both the bus and device. Establishing
+such dynamic configurations requires appropriate topological information
+to be communicated to the operating system.
+
+This binding document attempts to define a set of generic properties
+which can be used to encode topological information in bus and device
+nodes.
+
+
+* Terminology
+
+  - Port                : An interface over which memory transactions
+                          can propagate. A port may act as a master,
+                          slave or both (see below).
+
+  - Master port         : A port capable of issuing memory transactions
+                          to a slave. For example, a port connecting a
+                          DMA controller to main memory.
+
+  - Slave port          : A port capable of responding to memory
+                          transactions received by a master. For
+                          example, a port connecting the control
+                          registers of an MMIO device to a peripheral
+                          bus.
+
+  **Note** The ports on a bus to which masters are connected are
+           referred to as slave ports on that bus.
+
+
+* Properties
+
+  - #slave-port-cells   : A property of the bus, describing the number
+                          of cells required for an upstream master
+                          device to encode a single slave port on the
+                          bus. The actual encoding is defined by the
+                          bus binding.
+
+  - slave-ports         : A property of a device mastering through a
+                          downstream bus, describing the set of slave
+                          ports on the bus to which the device is
+                          connected. The property takes the form of a
+                          list of pairs, where each pair contains a
+                          phandle to the bus node as its first element
+                          and #slave-port-cells cells (for the bus
+                          referred to in the first element) as the
+                          second element.
+
+
+* Example
+
+        my-coherent-bus {
+                compatible = "acme,coherent-bus-9000";
+                #address-cells = <1>;
+                #size-cells = <1>;
+                reg = <0xba5e0000 0x10000>;
+
+                [...]        /* More bus-specific properties */
+
+                /*
+                 * Slave ports on this bus can be identified with a
+                 * single cell.
+                 */
+                #slave-port-cells = <1>;
+
+                /* 1:1 address space mapping with our parent bus. */
+                ranges;
+
+                /*
+                 * These devices all have at least their *slave* interfaces
+                 * on the coherent bus.
+                 */
+                dma0@0xfff00000 {
+                        compatible = "acme,coherent-dma-9000";
+                        reg = <0xfff00000 0x10000>;
+
+                        [...]        /* More dma-specific properties */
+
+                        /*
+                         * The DMA controller can master through two
+                         * ports on the coherent bus, using port
+                         * identifiers '0' and '1'.
+                         */
+                        slave-ports = <&my-coherent-bus 0>,
+                                      <&my-coherent-bus 1>;
+                };
+
+                [...]        /* More devices */
+        };
+
+        /*
+         * A device that can master through the coherent bus, but has its
+         * slave interface elsewhere.
+         */
+        dma1@0xfff80000 {
+                compatible = "acme,coherent-dma-9000";
+                reg = <0xfff80000 0x10000>;
+
+                [...]        /* More dma-specific properties */
+
+                /*
+                 * The DMA controller can master through a single port
+                 * on the coherent bus above, using port identifier '8'.
+                 */
+                slave-ports = <&my-coherent-bus 8>;
+        };
-- 
1.8.2.2
