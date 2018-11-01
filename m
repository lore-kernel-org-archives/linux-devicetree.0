From: Atish Patra <atish.patra@wdc.com>
Subject: [RFC 1/2] dt-bindings: topology: Add RISC-V cpu topology.
Date: Thu,  1 Nov 2018 16:04:27 -0700
Message-ID: <1541113468-22097-2-git-send-email-atish.patra@wdc.com>
References: <1541113468-22097-1-git-send-email-atish.patra@wdc.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1541113468-22097-1-git-send-email-atish.patra@wdc.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-riscv@lists.infradead.org
Cc: palmer@sifive.com, anup@brainfault.org, hch@infradead.org, Damien.LeMoal@wdc.com, tglx@linutronix.de, mark.rutland@arm.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org, alankao@andestech.com, zong@andestech.com
List-Id: devicetree@vger.kernel.org

Define a RISC-V cpu topology. This is based on cpu-map in ARM world.
But it doesn't need a separate thread node for defining SMT systems.
Multiple cpu phandle properties can be parsed to identify the sibling
hardware threads. Moreover, we do not have cluster concept in RISC-V.
So package is a better word choice than cluster for RISC-V.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 .../devicetree/bindings/riscv/topology.txt         | 154 +++++++++++++++++++++
 1 file changed, 154 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/topology.txt

diff --git a/Documentation/devicetree/bindings/riscv/topology.txt b/Documentation/devicetree/bindings/riscv/topology.txt
new file mode 100644
index 00000000..96039ed3
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/topology.txt
@@ -0,0 +1,154 @@
+===========================================
+RISC-V cpu topology binding description
+===========================================
+
+===========================================
+1 - Introduction
+===========================================
+
+In a RISC-V system, the hierarchy of CPUs can be defined through following nodes that
+are used to describe the layout of physical CPUs in the system:
+
+- packages
+- core
+
+The cpu nodes (bindings defined in [1]) represent the devices that
+correspond to physical CPUs and are to be mapped to the hierarchy levels.
+Simultaneous multi-threading (SMT) systems can also represent their topology
+by defining multiple cpu phandles inside core node. The details are explained
+in paragraph 3.
+
+The remainder of this document provides the topology bindings for ARM, based
+on the Devicetree Specification, available from:
+
+https://www.devicetree.org/specifications/
+
+If not stated otherwise, whenever a reference to a cpu node phandle is made its
+value must point to a cpu node compliant with the cpu node bindings as
+documented in [1].
+A topology description containing phandles to cpu nodes that are not compliant
+with bindings standardized in [1] is therefore considered invalid.
+
+This cpu topology binding description is mostly based on the topology defined
+in ARM [2].
+===========================================
+2 - cpu-topology node
+===========================================
+
+The RISC-V CPU topology is defined within the "cpu-topology" node, which is a direct
+child of the "cpus" node and provides a container where the actual topology
+nodes are listed.
+
+- cpu-topology node
+
+	Usage: Optional - RISC-V SMP systems need to provide CPUs topology to
+			  the OS. RISC-V uniprocessor systems do not require a
+			  topology description and therefore should not define a
+			  cpu-topology node.
+
+	Description: The cpu-topology node is just a container node where its
+		     subnodes describe the CPU topology.
+
+	Node name must be "cpu-topology".
+
+	The cpu-topology node's parent node must be the cpus node.
+
+	The cpu-topology node's child nodes can be:
+
+	- one or more package nodes
+
+	Any other configuration is considered invalid.
+
+The cpu-topology node can only contain two types of child nodes:
+
+- package node
+- core node
+
+whose bindings are described in paragraph 3.
+
+=================================================
+2.1 - cpu-topology child nodes naming convention
+=================================================
+
+cpu-topology child nodes must follow a naming convention where the node name
+must be "packageN", "coreN" depending on the node type (i.e. package/core).
+For SMT systems, coreN node can contain several cpuN to indicate individual
+SMT harts (where N = {0, 1, ...} is the node number; nodes which are siblings
+within a single common parent node must be given a unique and sequential N
+value, starting from 0). cpu-topology child nodes which do not share a common
+parent node can have the same name (i.e. same number N as other cpu-topology
+child nodes at different device tree levels) since name uniqueness will be
+guaranteed by the device tree hierarchy.
+
+===========================================
+3 - package/core node bindings
+===========================================
+
+Bindings for package/core nodes are defined as follows:
+
+- package node
+
+	 Description: must be declared within a cpu-topology node, one node
+		      per package. A system can contain several layers of
+		      package nodes. It can also be contained in parent
+		      package nodes.
+
+	The package node name must be "packageN" as described in 2.1 above.
+	A package node can not be a leaf node.
+
+	A package node's child nodes must be:
+
+	- one or more package nodes; or
+	- one or more core nodes
+
+	Any other configuration is considered invalid.
+
+- core node
+
+	Description: must be declared in a package node, one node per core in
+		     the package.
+
+	The core node name must be "coreN" as described in 2.1 above.
+
+	A core node must always be a leaf node.
+
+	Properties for core nodes :
+
+	- cpuN
+		Usage: required
+		Value type: <phandle>
+		Definition: a phandle to the cpu node that corresponds to the
+			    core node.
+	For SMT systems, a core node will contain multiple cpuN phandles.
+
+	Any other configuration is considered invalid.
+
+===========================================
+4 - Example dts
+===========================================
+
+Example : HiFive Unleashed (RISC-V 64 bit, 4 core system)
+
+L100: cpu-topology {
+	 package0 {
+		 core0 {
+			 cpu0 = <&L12>;
+		 };
+		 core1 {
+			 cpu0 = <&L15>;
+		 };
+		 core2 {
+			 cpu0 = <&L18>;
+		 };
+		 core3 {
+			 cpu0 = <&L21>;
+		 };
+	 };
+ };
+===============================================================================
+[1] RISC-V cpus documentation
+    Documentation/devicetree/binding/riscv/cpus.txt
+[2] ARM topology documentation
+    Documentation/devicetree/binding/arm/topology.txt
+
+===============================================================================
-- 
2.7.4
