From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH v3 2/2] Documentation: DT: arm: define CPU topology bindings
Date: Thu, 26 Sep 2013 10:42:03 +0100
Message-ID: <1380188523-20589-3-git-send-email-lorenzo.pieralisi@arm.com>
References: <1380188523-20589-1-git-send-email-lorenzo.pieralisi@arm.com>
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1380188523-20589-1-git-send-email-lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Dave Martin <dave.martin-5wv7dgnIgG8@public.gmane.org>, Vincent Guittot <vincent.guittot-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Hanjun Guo <hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The advent of multi-cluster ARM systems requires a mechanism to describe
how in hierarchical terms CPUs are connected in ARM SoCs so that the kernel
can initialize and map resources like IRQs and memory space to specific
group(s) of CPUs.

The CPU topology is made up of multiple hierarchy levels whose bottom
layers (aka leaf nodes in device tree syntax) contain links to the HW
CPUs in the system.

The topology bindings are generic for both 32-bit and 64-bit systems and
lay the groundwork on top of which affinity schemes can be built.

This patch provides the documentation in the kernel required to define the
device tree bindings describing the CPU topology for ARM 32-bit and 64-bit
systems.

Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
---
 Documentation/devicetree/bindings/arm/topology.txt | 474 +++++++++++++++++=
++++
 1 file changed, 474 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/topology.txt

diff --git a/Documentation/devicetree/bindings/arm/topology.txt b/Documenta=
tion/devicetree/bindings/arm/topology.txt
new file mode 100644
index 0000000..4aa20e7
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/topology.txt
@@ -0,0 +1,474 @@
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+ARM topology binding description
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+1 - Introduction
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+In an ARM system, the hierarchy of CPUs is defined through three entities =
that
+are used to describe the layout of physical CPUs in the system:
+
+- cluster
+- core
+- thread
+
+The cpu nodes (bindings defined in [1]) represent the devices that
+correspond to physical CPUs and are to be mapped to the hierarchy levels.
+
+The bottom hierarchy level sits at core or thread level depending on wheth=
er
+symmetric multi-threading (SMT) is supported or not.
+
+For instance in a system where CPUs support SMT, "cpu" nodes represent all
+threads existing in the system and map to the hierarchy level "thread" abo=
ve.
+In systems where SMT is not supported "cpu" nodes represent all cores pres=
ent
+in the system and map to the hierarchy level "core" above.
+
+ARM topology bindings allow one to associate cpu nodes with hierarchical g=
roups
+corresponding to the system hierarchy; syntactically they are defined as d=
evice
+tree nodes.
+
+The remainder of this document provides the topology bindings for ARM, bas=
ed
+on the ePAPR standard, available from:
+
+http://www.power.org/documentation/epapr-version-1-1/
+
+If not stated otherwise, whenever a reference to a cpu node phandle is mad=
e its
+value must point to a cpu node compliant with the cpu node bindings as
+documented in [1].
+A topology description containing phandles to cpu nodes that are not compl=
iant
+with bindings standardized in [1] is therefore considered invalid.
+
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+2 - cpu-map node
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+The ARM CPU topology is defined within the cpu-map node, which is a direct
+child of the cpus node and provides a container where the actual topology
+nodes are listed.
+
+- cpu-map node
+
+=09Usage: Optional - On ARM SMP systems provide CPUs topology to the OS.
+=09=09=09  ARM uniprocessor systems do not require a topology
+=09=09=09  description and therefore should not define a
+=09=09=09  cpu-map node.
+
+=09Description: The cpu-map node is just a container node where its
+=09=09     subnodes describe the CPU topology.
+
+=09Node name must be "cpu-map".
+
+=09The cpu-map node's parent node must be the cpus node.
+
+=09The cpu-map node's child nodes can be:
+
+=09- one or more cluster nodes
+
+=09Any other configuration is considered invalid.
+
+The cpu-map node can only contain three types of child nodes:
+
+- cluster node
+- core node
+- thread node
+
+whose bindings are described in paragraph 3.
+
+The nodes describing the CPU topology (cluster/core/thread) can only be
+defined within the cpu-map node.
+Any other configuration is consider invalid and therefore must be ignored.
+
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+2.1 - cpu-map child nodes naming convention
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+cpu-map child nodes must follow a naming convention where the node name
+must be "clusterN", "coreN", "threadN" depending on the node type (ie
+cluster/core/thread) (where N =3D {0, 1, ...} is the node number; nodes wh=
ich
+are siblings within a single common parent node must be given a unique and
+sequential N value, starting from 0).
+cpu-map child nodes which do not share a common parent node can have the s=
ame
+name (ie same number N as other cpu-map child nodes at different device tr=
ee
+levels) since name uniqueness will be guaranteed by the device tree hierar=
chy.
+
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+3 - cluster/core/thread node bindings
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Bindings for cluster/cpu/thread nodes are defined as follows:
+
+- cluster node
+
+=09 Description: must be declared within a cpu-map node, one node
+=09=09      per cluster. A system can contain several layers of
+=09=09      clustering and cluster nodes can be contained in parent
+=09=09      cluster nodes.
+
+=09The cluster node name must be "clusterN" as described in 2.1 above.
+=09A cluster node can not be a leaf node.
+
+=09A cluster node's child nodes must be:
+
+=09- one or more cluster nodes; or
+=09- one or more core nodes
+
+=09Any other configuration is considered invalid.
+
+- core node
+
+=09Description: must be declared in a cluster node, one node per core in
+=09=09     the cluster. If the system does not support SMT, core
+=09=09     nodes are leaf nodes, otherwise they become containers of
+=09=09     thread nodes.
+
+=09The core node name must be "coreN" as described in 2.1 above.
+
+=09A core node must be a leaf node if SMT is not supported.
+
+=09Properties for core nodes that are leaf nodes:
+
+=09- cpu
+=09=09Usage: required
+=09=09Value type: <phandle>
+=09=09Definition: a phandle to the cpu node that corresponds to the
+=09=09=09    core node.
+
+=09If a core node is not a leaf node (CPUs supporting SMT) a core node's
+=09child nodes can be:
+
+=09- one or more thread nodes
+
+=09Any other configuration is considered invalid.
+
+- thread node
+
+=09Description: must be declared in a core node, one node per thread
+=09=09     in the core if the system supports SMT. Thread nodes are
+=09=09     always leaf nodes in the device tree.
+
+=09The thread node name must be "threadN" as described in 2.1 above.
+
+=09A thread node must be a leaf node.
+
+=09A thread node must contain the following property:
+
+=09- cpu
+=09=09Usage: required
+=09=09Value type: <phandle>
+=09=09Definition: a phandle to the cpu node that corresponds to
+=09=09=09    the thread node.
+
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+4 - Example dts
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Example 1 (ARM 64-bit, 16-cpu system, two clusters of clusters):
+
+cpus {
+=09#size-cells =3D <0>;
+=09#address-cells =3D <2>;
+
+=09cpu-map {
+=09=09cluster0 {
+=09=09=09cluster0 {
+=09=09=09=09core0 {
+=09=09=09=09=09thread0 {
+=09=09=09=09=09=09cpu =3D <&CPU0>;
+=09=09=09=09=09};
+=09=09=09=09=09thread1 {
+=09=09=09=09=09=09cpu =3D <&CPU1>;
+=09=09=09=09=09};
+=09=09=09=09};
+
+=09=09=09=09core1 {
+=09=09=09=09=09thread0 {
+=09=09=09=09=09=09cpu =3D <&CPU2>;
+=09=09=09=09=09};
+=09=09=09=09=09thread1 {
+=09=09=09=09=09=09cpu =3D <&CPU3>;
+=09=09=09=09=09};
+=09=09=09=09};
+=09=09=09};
+
+=09=09=09cluster1 {
+=09=09=09=09core0 {
+=09=09=09=09=09thread0 {
+=09=09=09=09=09=09cpu =3D <&CPU4>;
+=09=09=09=09=09};
+=09=09=09=09=09thread1 {
+=09=09=09=09=09=09cpu =3D <&CPU5>;
+=09=09=09=09=09};
+=09=09=09=09};
+
+=09=09=09=09core1 {
+=09=09=09=09=09thread0 {
+=09=09=09=09=09=09cpu =3D <&CPU6>;
+=09=09=09=09=09};
+=09=09=09=09=09thread1 {
+=09=09=09=09=09=09cpu =3D <&CPU7>;
+=09=09=09=09=09};
+=09=09=09=09};
+=09=09=09};
+=09=09};
+
+=09=09cluster1 {
+=09=09=09cluster0 {
+=09=09=09=09core0 {
+=09=09=09=09=09thread0 {
+=09=09=09=09=09=09cpu =3D <&CPU8>;
+=09=09=09=09=09};
+=09=09=09=09=09thread1 {
+=09=09=09=09=09=09cpu =3D <&CPU9>;
+=09=09=09=09=09};
+=09=09=09=09};
+=09=09=09=09core1 {
+=09=09=09=09=09thread0 {
+=09=09=09=09=09=09cpu =3D <&CPU10>;
+=09=09=09=09=09};
+=09=09=09=09=09thread1 {
+=09=09=09=09=09=09cpu =3D <&CPU11>;
+=09=09=09=09=09};
+=09=09=09=09};
+=09=09=09};
+
+=09=09=09cluster1 {
+=09=09=09=09core0 {
+=09=09=09=09=09thread0 {
+=09=09=09=09=09=09cpu =3D <&CPU12>;
+=09=09=09=09=09};
+=09=09=09=09=09thread1 {
+=09=09=09=09=09=09cpu =3D <&CPU13>;
+=09=09=09=09=09};
+=09=09=09=09};
+=09=09=09=09core1 {
+=09=09=09=09=09thread0 {
+=09=09=09=09=09=09cpu =3D <&CPU14>;
+=09=09=09=09=09};
+=09=09=09=09=09thread1 {
+=09=09=09=09=09=09cpu =3D <&CPU15>;
+=09=09=09=09=09};
+=09=09=09=09};
+=09=09=09};
+=09=09};
+=09};
+
+=09CPU0: cpu@0 {
+=09=09device_type =3D "cpu";
+=09=09compatible =3D "arm,cortex-a57";
+=09=09reg =3D <0x0 0x0>;
+=09=09enable-method =3D "spin-table";
+=09=09cpu-release-addr =3D <0 0x20000000>;
+=09};
+
+=09CPU1: cpu@1 {
+=09=09device_type =3D "cpu";
+=09=09compatible =3D "arm,cortex-a57";
+=09=09reg =3D <0x0 0x1>;
+=09=09enable-method =3D "spin-table";
+=09=09cpu-release-addr =3D <0 0x20000000>;
+=09};
+
+=09CPU2: cpu@100 {
+=09=09device_type =3D "cpu";
+=09=09compatible =3D "arm,cortex-a57";
+=09=09reg =3D <0x0 0x100>;
+=09=09enable-method =3D "spin-table";
+=09=09cpu-release-addr =3D <0 0x20000000>;
+=09};
+
+=09CPU3: cpu@101 {
+=09=09device_type =3D "cpu";
+=09=09compatible =3D "arm,cortex-a57";
+=09=09reg =3D <0x0 0x101>;
+=09=09enable-method =3D "spin-table";
+=09=09cpu-release-addr =3D <0 0x20000000>;
+=09};
+
+=09CPU4: cpu@10000 {
+=09=09device_type =3D "cpu";
+=09=09compatible =3D "arm,cortex-a57";
+=09=09reg =3D <0x0 0x10000>;
+=09=09enable-method =3D "spin-table";
+=09=09cpu-release-addr =3D <0 0x20000000>;
+=09};
+
+=09CPU5: cpu@10001 {
+=09=09device_type =3D "cpu";
+=09=09compatible =3D "arm,cortex-a57";
+=09=09reg =3D <0x0 0x10001>;
+=09=09enable-method =3D "spin-table";
+=09=09cpu-release-addr =3D <0 0x20000000>;
+=09};
+
+=09CPU6: cpu@10100 {
+=09=09device_type =3D "cpu";
+=09=09compatible =3D "arm,cortex-a57";
+=09=09reg =3D <0x0 0x10100>;
+=09=09enable-method =3D "spin-table";
+=09=09cpu-release-addr =3D <0 0x20000000>;
+=09};
+
+=09CPU7: cpu@10101 {
+=09=09device_type =3D "cpu";
+=09=09compatible =3D "arm,cortex-a57";
+=09=09reg =3D <0x0 0x10101>;
+=09=09enable-method =3D "spin-table";
+=09=09cpu-release-addr =3D <0 0x20000000>;
+=09};
+
+=09CPU8: cpu@100000000 {
+=09=09device_type =3D "cpu";
+=09=09compatible =3D "arm,cortex-a57";
+=09=09reg =3D <0x1 0x0>;
+=09=09enable-method =3D "spin-table";
+=09=09cpu-release-addr =3D <0 0x20000000>;
+=09};
+
+=09CPU9: cpu@100000001 {
+=09=09device_type =3D "cpu";
+=09=09compatible =3D "arm,cortex-a57";
+=09=09reg =3D <0x1 0x1>;
+=09=09enable-method =3D "spin-table";
+=09=09cpu-release-addr =3D <0 0x20000000>;
+=09};
+
+=09CPU10: cpu@100000100 {
+=09=09device_type =3D "cpu";
+=09=09compatible =3D "arm,cortex-a57";
+=09=09reg =3D <0x1 0x100>;
+=09=09enable-method =3D "spin-table";
+=09=09cpu-release-addr =3D <0 0x20000000>;
+=09};
+
+=09CPU11: cpu@100000101 {
+=09=09device_type =3D "cpu";
+=09=09compatible =3D "arm,cortex-a57";
+=09=09reg =3D <0x1 0x101>;
+=09=09enable-method =3D "spin-table";
+=09=09cpu-release-addr =3D <0 0x20000000>;
+=09};
+
+=09CPU12: cpu@100010000 {
+=09=09device_type =3D "cpu";
+=09=09compatible =3D "arm,cortex-a57";
+=09=09reg =3D <0x1 0x10000>;
+=09=09enable-method =3D "spin-table";
+=09=09cpu-release-addr =3D <0 0x20000000>;
+=09};
+
+=09CPU13: cpu@100010001 {
+=09=09device_type =3D "cpu";
+=09=09compatible =3D "arm,cortex-a57";
+=09=09reg =3D <0x1 0x10001>;
+=09=09enable-method =3D "spin-table";
+=09=09cpu-release-addr =3D <0 0x20000000>;
+=09};
+
+=09CPU14: cpu@100010100 {
+=09=09device_type =3D "cpu";
+=09=09compatible =3D "arm,cortex-a57";
+=09=09reg =3D <0x1 0x10100>;
+=09=09enable-method =3D "spin-table";
+=09=09cpu-release-addr =3D <0 0x20000000>;
+=09};
+
+=09CPU15: cpu@100010101 {
+=09=09device_type =3D "cpu";
+=09=09compatible =3D "arm,cortex-a57";
+=09=09reg =3D <0x1 0x10101>;
+=09=09enable-method =3D "spin-table";
+=09=09cpu-release-addr =3D <0 0x20000000>;
+=09};
+};
+
+Example 2 (ARM 32-bit, dual-cluster, 8-cpu system, no SMT):
+
+cpus {
+=09#size-cells =3D <0>;
+=09#address-cells =3D <1>;
+
+=09cpu-map {
+=09=09cluster0 {
+=09=09=09core0 {
+=09=09=09=09cpu =3D <&CPU0>;
+=09=09=09};
+=09=09=09core1 {
+=09=09=09=09cpu =3D <&CPU1>;
+=09=09=09};
+=09=09=09core2 {
+=09=09=09=09cpu =3D <&CPU2>;
+=09=09=09};
+=09=09=09core3 {
+=09=09=09=09cpu =3D <&CPU3>;
+=09=09=09};
+=09=09};
+
+=09=09cluster1 {
+=09=09=09core0 {
+=09=09=09=09cpu =3D <&CPU4>;
+=09=09=09};
+=09=09=09core1 {
+=09=09=09=09cpu =3D <&CPU5>;
+=09=09=09};
+=09=09=09core2 {
+=09=09=09=09cpu =3D <&CPU6>;
+=09=09=09};
+=09=09=09core3 {
+=09=09=09=09cpu =3D <&CPU7>;
+=09=09=09};
+=09=09};
+=09};
+
+=09CPU0: cpu@0 {
+=09=09device_type =3D "cpu";
+=09=09compatible =3D "arm,cortex-a15";
+=09=09reg =3D <0x0>;
+=09};
+
+=09CPU1: cpu@1 {
+=09=09device_type =3D "cpu";
+=09=09compatible =3D "arm,cortex-a15";
+=09=09reg =3D <0x1>;
+=09};
+
+=09CPU2: cpu@2 {
+=09=09device_type =3D "cpu";
+=09=09compatible =3D "arm,cortex-a15";
+=09=09reg =3D <0x2>;
+=09};
+
+=09CPU3: cpu@3 {
+=09=09device_type =3D "cpu";
+=09=09compatible =3D "arm,cortex-a15";
+=09=09reg =3D <0x3>;
+=09};
+
+=09CPU4: cpu@100 {
+=09=09device_type =3D "cpu";
+=09=09compatible =3D "arm,cortex-a7";
+=09=09reg =3D <0x100>;
+=09};
+
+=09CPU5: cpu@101 {
+=09=09device_type =3D "cpu";
+=09=09compatible =3D "arm,cortex-a7";
+=09=09reg =3D <0x101>;
+=09};
+
+=09CPU6: cpu@102 {
+=09=09device_type =3D "cpu";
+=09=09compatible =3D "arm,cortex-a7";
+=09=09reg =3D <0x102>;
+=09};
+
+=09CPU7: cpu@103 {
+=09=09device_type =3D "cpu";
+=09=09compatible =3D "arm,cortex-a7";
+=09=09reg =3D <0x103>;
+=09};
+};
+
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
+[1] ARM Linux kernel documentation
+    Documentation/devicetree/bindings/arm/cpus.txt
--=20
1.8.2.2


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
