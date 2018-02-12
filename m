From: Joel Stanley <joel@jms.id.au>
Subject: [PATCH 05/10] dt-bindings: fsi: Add specification for FSI busses
Date: Mon, 12 Feb 2018 15:45:44 +1030
Message-ID: <20180212051549.8575-6-joel@jms.id.au>
References: <20180212051549.8575-1-joel@jms.id.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180212051549.8575-1-joel@jms.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Jeremy Kerr <jk@ozlabs.org>, Christopher Bostic <cbostic@linux.vnet.ibm.com>, Brad Bishop <bradleyb@fuzziesquirrel.com>, Edward James <eajames@us.ibm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Jeremy Kerr <jk@ozlabs.org>

This change introduces a proposed layout for describing FSI busses in
the device tree. While the bus is probe-able, we'd still like a method
of describing subordinate (eg i2c) busses that are behind FSI devices.

The FSI core will be responsible for matching probed slaves & engines to
their device tree nodes, so the FSI device drivers' probe() functions
will be passed a struct device with the appropriate of_node populated
where a matching DT node is found.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
Acked-by: Joel Stanley <joel@jms.id.au>
Acked-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
Acked-by: Eddie James <eajames@linux.vnet.ibm.com>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 Documentation/devicetree/bindings/fsi/fsi.txt | 144 ++++++++++++++++++++++++++
 1 file changed, 144 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fsi/fsi.txt

diff --git a/Documentation/devicetree/bindings/fsi/fsi.txt b/Documentation/devicetree/bindings/fsi/fsi.txt
new file mode 100644
index 000000000000..4eaf488d4015
--- /dev/null
+++ b/Documentation/devicetree/bindings/fsi/fsi.txt
@@ -0,0 +1,144 @@
+FSI bus & engine generic device tree bindings
+=============================================
+
+The FSI bus is probe-able, so the OS is able to enumerate FSI slaves, and
+engines within those slaves. However, we have a facility to match devicetree
+nodes to probed engines. This allows for fsi engines to expose non-probeable
+busses, which are then exposed by the device tree. For example, an FSI engine
+that is an I2C master - the I2C bus can be described by the device tree under
+the engine's device tree node.
+
+FSI masters may require their own DT nodes (to describe the master HW itself);
+that requirement is defined by the master's implementation, and is described by
+the fsi-master-* binding specifications.
+
+Under the masters' nodes, we can describe the bus topology using nodes to
+represent the FSI slaves and their slave engines. As a basic outline:
+
+  fsi-master {
+      /* top-level of FSI bus topology, bound to an FSI master driver and
+       * exposes an FSI bus */
+
+      fsi-slave@<link,id> {
+          /* this node defines the FSI slave device, and is handled
+           * entirely with FSI core code */
+
+          fsi-slave-engine@<addr> {
+              /* this node defines the engine endpoint & address range, which
+               * is bound to the relevant fsi device driver */
+               ...
+          };
+
+          fsi-slave-engine@<addr> {
+              ...
+          };
+
+      };
+  };
+
+Note that since the bus is probe-able, some (or all) of the topology may
+not be described; this binding only provides an optional facility for
+adding subordinate device tree nodes as children of FSI engines.
+
+FSI masters
+-----------
+
+FSI master nodes declare themselves as such with the "fsi-master" compatible
+value. It's likely that an implementation-specific compatible value will
+be needed as well, for example:
+
+    compatible = "fsi-master-gpio", "fsi-master";
+
+Since the master nodes describe the top-level of the FSI topology, they also
+need to declare the FSI-standard addressing scheme. This requires two cells for
+addresses (link index and slave ID), and no size:
+
+    #address-cells = <2>;
+    #size-cells = <0>;
+
+FSI slaves
+----------
+
+Slaves are identified by a (link-index, slave-id) pair, so require two cells
+for an address identifier. Since these are not a range, no size cells are
+required. For an example, a slave on link 1, with ID 2, could be represented
+as:
+
+    cfam@1,2 {
+        reg = <1 2>;
+	[...];
+    }
+
+Each slave provides an address-space, under which the engines are accessible.
+That address space has a maximum of 23 bits, so we use one cell to represent
+addresses and sizes in the slave address space:
+
+    #address-cells = <1>;
+    #size-cells = <1>;
+
+
+FSI engines (devices)
+---------------------
+
+Engines are identified by their address under the slaves' address spaces. We
+use a single cell for address and size. Engine nodes represent the endpoint
+FSI device, and are passed to those FSI device drivers' ->probe() functions.
+
+For example, for a slave using a single 0x400-byte page starting at address
+0xc00:
+
+    engine@c00 {
+        reg = <0xc00 0x400>;
+    };
+
+
+Full example
+------------
+
+Here's an example that illustrates:
+ - an FSI master
+   - connected to an FSI slave
+     - that contains an engine that is an I2C master
+       - connected to an I2C EEPROM
+
+The FSI master may be connected to additional slaves, and slaves may have
+additional engines, but they don't necessarily need to be describe in the
+device tree if no extra platform information is required.
+
+    /* The GPIO-based FSI master node, describing the top level of the
+     * FSI bus
+     */
+    gpio-fsi {
+        compatible = "fsi-master-gpio", "fsi-master";
+        #address-cells = <2>;
+        #size-cells = <0>;
+
+        /* A FSI slave (aka. CFAM) at link 0, ID 0. */
+        cfam@0,0 {
+            reg = <0 0>;
+            #address-cells = <1>;
+            #size-cells = <1>;
+
+            /* FSI engine at 0xc00, using a single page. In this example,
+             * it's an I2C master controller, so subnodes describe the
+             * I2C bus.
+             */
+            i2c-controller@c00 {
+                reg = <0xc00 0x400>;
+
+                /* Engine-specific data. In this case, we're describing an
+                 * I2C bus, so we're conforming to the generic I2C binding
+                 */
+                compatible = "some-vendor,fsi-i2c-controller";
+                #address-cells = <1>;
+                #size-cells = <1>;
+
+                /* I2C endpoint device: an Atmel EEPROM */
+                eeprom@50 {
+                    compatible = "atmel,24c256";
+                    reg = <0x50>;
+                    pagesize = <64>;
+                };
+            };
+        };
+    };
-- 
2.15.1
