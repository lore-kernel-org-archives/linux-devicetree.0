From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH v2] Documentation: DT: arm: Add topology property to define package boundaries
Date: Fri,  9 Feb 2018 12:00:34 +0000
Message-ID: <20180209120034.13388-1-lorenzo.pieralisi@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Jeremy Linton <jeremy.linton-5wv7dgnIgG8@public.gmane.org>, Morten Rasmussen <morten.rasmussen-5wv7dgnIgG8@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The current ARM DT topology description provides the operating system
with a topological view of the system that is based on leaf nodes
representing either cores or threads (in an SMT system) and a
hierarchical set of cluster nodes that creates a hierarchical topology
view of how those cores and threads are grouped.

As opposed to the ACPI topology description ([1], PPTT table), this
hierarchical representation of clusters does not allow to describe what
topology level actually represents the physical package boundary, which
is a key piece of information to be used by an operating system to
optimize resource allocation and scheduling.

Define an optional, backward compatible boolean property for cluster
nodes that, by reusing the ACPI nomenclature, add to the ARM DT
topological description a binding to define what cluster level
represents a physical package boundary.

[1] http://www.uefi.org/sites/default/files/resources/ACPI_6_2.pdf

Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: Jeremy Linton <jeremy.linton-5wv7dgnIgG8@public.gmane.org>
Cc: Morten Rasmussen <morten.rasmussen-5wv7dgnIgG8@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
---
v1->v2:

	- Added dual-package example
	- Improved physical-package property description according to review
	- Dropped RFC tag

v1: https://marc.info/?l=linux-arm-kernel&m=151664137216555&w=2

 Documentation/devicetree/bindings/arm/topology.txt | 432 +++++++++++++++++++++
 1 file changed, 432 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/topology.txt b/Documentation/devicetree/bindings/arm/topology.txt
index de9eb0486630..09b3b22e57c1 100644
--- a/Documentation/devicetree/bindings/arm/topology.txt
+++ b/Documentation/devicetree/bindings/arm/topology.txt
@@ -109,6 +109,21 @@ Bindings for cluster/cpu/thread nodes are defined as follows:
 	The cluster node name must be "clusterN" as described in 2.1 above.
 	A cluster node can not be a leaf node.
 
+	Properties for cluster nodes:
+
+	- physical-package
+		Usage: optional
+		Value type: <empty>
+		Definition: if present the cluster node represents the
+			    boundary of a physical package, whether socketed
+			    or surface mounted.
+			    The cluster node itself and all its children nodes
+			    represent a single distinct physical-package unit.
+			    The cluster node parent and sibling cluster nodes
+			    (if any) must therefore be considered part of
+			    separate physical package units in multi
+			    physical-package systems.
+
 	A cluster node's child nodes must be:
 
 	- one or more cluster nodes; or
@@ -470,6 +485,423 @@ cpus {
 	};
 };
 
+Example 3 (ARM 64-bit, 32-cpu system, 2 packages):
+
+cpus {
+	#size-cells = <0>;
+	#address-cells = <2>;
+
+	cpu-map {
+		cluster0 {
+			physical-package;
+
+			cluster0 {
+				core0 {
+					cpu = <&CPU0>;
+				};
+
+				core1 {
+					cpu = <&CPU1>;
+				};
+
+				core2 {
+					cpu = <&CPU2>;
+				};
+
+				core3 {
+					cpu = <&CPU3>;
+				};
+			};
+
+			cluster1 {
+				core0 {
+					cpu = <&CPU4>;
+				};
+
+				core1 {
+					cpu = <&CPU5>;
+				};
+
+				core2 {
+					cpu = <&CPU6>;
+				};
+
+				core3 {
+					cpu = <&CPU7>;
+				};
+			};
+
+			cluster2 {
+				core0 {
+					cpu = <&CPU8>;
+				};
+
+				core1 {
+					cpu = <&CPU9>;
+				};
+
+				core2 {
+					cpu = <&CPU10>;
+				};
+
+				core3 {
+					cpu = <&CPU11>;
+				};
+			};
+
+			cluster3 {
+				core0 {
+					cpu = <&CPU12>;
+				};
+
+				core1 {
+					cpu = <&CPU13>;
+				};
+
+				core2 {
+					cpu = <&CPU14>;
+				};
+
+				core3 {
+					cpu = <&CPU15>;
+				};
+			};
+		};
+
+		cluster1 {
+			physical-package;
+
+			cluster0 {
+				core0 {
+					cpu = <&CPU16>;
+				};
+
+				core1 {
+					cpu = <&CPU17>;
+				};
+
+				core2 {
+					cpu = <&CPU18>;
+				};
+
+				core3 {
+					cpu = <&CPU19>;
+				};
+			};
+
+			cluster1 {
+				core0 {
+					cpu = <&CPU20>;
+				};
+
+				core1 {
+					cpu = <&CPU21>;
+				};
+
+				core2 {
+					cpu = <&CPU22>;
+				};
+
+				core3 {
+					cpu = <&CPU23>;
+				};
+			};
+
+			cluster2 {
+				core0 {
+					cpu = <&CPU24>;
+				};
+
+				core1 {
+					cpu = <&CPU25>;
+				};
+
+				core2 {
+					cpu = <&CPU26>;
+				};
+
+				core3 {
+					cpu = <&CPU27>;
+				};
+			};
+
+			cluster3 {
+				core0 {
+					cpu = <&CPU28>;
+				};
+
+				core1 {
+					cpu = <&CPU29>;
+				};
+
+				core2 {
+					cpu = <&CPU30>;
+				};
+
+				core3 {
+					cpu = <&CPU31>;
+				};
+			};
+		};
+	};
+
+	CPU0: cpu@0 {
+		device_type = "cpu";
+		compatible = "arm,cortex-a72";
+		reg = <0x0 0x0>;
+		enable-method = "spin-table";
+		cpu-release-addr = <0 0x20000000>;
+	};
+
+	CPU1: cpu@1 {
+		device_type = "cpu";
+		compatible = "arm,cortex-a72";
+		reg = <0x0 0x1>;
+		enable-method = "spin-table";
+		cpu-release-addr = <0 0x20000000>;
+	};
+
+	CPU2: cpu@2 {
+		device_type = "cpu";
+		compatible = "arm,cortex-a72";
+		reg = <0x0 0x2>;
+		enable-method = "spin-table";
+		cpu-release-addr = <0 0x20000000>;
+	};
+
+	CPU3: cpu@3 {
+		device_type = "cpu";
+		compatible = "arm,cortex-a72";
+		reg = <0x0 0x3>;
+		enable-method = "spin-table";
+		cpu-release-addr = <0 0x20000000>;
+	};
+
+	CPU4: cpu@100 {
+		device_type = "cpu";
+		compatible = "arm,cortex-a72";
+		reg = <0x0 0x100>;
+		enable-method = "spin-table";
+		cpu-release-addr = <0 0x20000000>;
+	};
+
+	CPU5: cpu@101 {
+		device_type = "cpu";
+		compatible = "arm,cortex-a72";
+		reg = <0x0 0x101>;
+		enable-method = "spin-table";
+		cpu-release-addr = <0 0x20000000>;
+	};
+
+	CPU6: cpu@102 {
+		device_type = "cpu";
+		compatible = "arm,cortex-a72";
+		reg = <0x0 0x102>;
+		enable-method = "spin-table";
+		cpu-release-addr = <0 0x20000000>;
+	};
+
+	CPU7: cpu@103 {
+		device_type = "cpu";
+		compatible = "arm,cortex-a72";
+		reg = <0x0 0x103>;
+		enable-method = "spin-table";
+		cpu-release-addr = <0 0x20000000>;
+	};
+
+	CPU8: cpu@200 {
+		device_type = "cpu";
+		compatible = "arm,cortex-a72";
+		reg = <0x0 0x00200>;
+		enable-method = "spin-table";
+		cpu-release-addr = <0 0x20000000>;
+	};
+
+	CPU9: cpu@201 {
+		device_type = "cpu";
+		compatible = "arm,cortex-a72";
+		reg = <0x0 0x00201>;
+		enable-method = "spin-table";
+		cpu-release-addr = <0 0x20000000>;
+	};
+
+	CPU10: cpu@202 {
+		device_type = "cpu";
+		compatible = "arm,cortex-a72";
+		reg = <0x0 0x00202>;
+		enable-method = "spin-table";
+		cpu-release-addr = <0 0x20000000>;
+	};
+
+	CPU11: cpu@203 {
+		device_type = "cpu";
+		compatible = "arm,cortex-a72";
+		reg = <0x0 0x00203>;
+		enable-method = "spin-table";
+		cpu-release-addr = <0 0x20000000>;
+	};
+
+	CPU12: cpu@300 {
+		device_type = "cpu";
+		compatible = "arm,cortex-a72";
+		reg = <0x0 0x00300>;
+		enable-method = "spin-table";
+		cpu-release-addr = <0 0x20000000>;
+	};
+
+	CPU13: cpu@301 {
+		device_type = "cpu";
+		compatible = "arm,cortex-a72";
+		reg = <0x0 0x00301>;
+		enable-method = "spin-table";
+		cpu-release-addr = <0 0x20000000>;
+	};
+
+	CPU14: cpu@302 {
+		device_type = "cpu";
+		compatible = "arm,cortex-a72";
+		reg = <0x0 0x00302>;
+		enable-method = "spin-table";
+		cpu-release-addr = <0 0x20000000>;
+	};
+
+	CPU15: cpu@303 {
+		device_type = "cpu";
+		compatible = "arm,cortex-a72";
+		reg = <0x0 0x00303>;
+		enable-method = "spin-table";
+		cpu-release-addr = <0 0x20000000>;
+	};
+
+	CPU16: cpu@10000 {
+		device_type = "cpu";
+		compatible = "arm,cortex-a72";
+		reg = <0x0 0x10000>;
+		enable-method = "spin-table";
+		cpu-release-addr = <0 0x20000000>;
+	};
+
+	CPU17: cpu@10001 {
+		device_type = "cpu";
+		compatible = "arm,cortex-a72";
+		reg = <0x0 0x10001>;
+		enable-method = "spin-table";
+		cpu-release-addr = <0 0x20000000>;
+	};
+
+	CPU18: cpu@10002 {
+		device_type = "cpu";
+		compatible = "arm,cortex-a72";
+		reg = <0x0 0x10002>;
+		enable-method = "spin-table";
+		cpu-release-addr = <0 0x20000000>;
+	};
+
+	CPU19: cpu@10003 {
+		device_type = "cpu";
+		compatible = "arm,cortex-a72";
+		reg = <0x0 0x10003>;
+		enable-method = "spin-table";
+		cpu-release-addr = <0 0x20000000>;
+	};
+
+	CPU20: cpu@10100 {
+		device_type = "cpu";
+		compatible = "arm,cortex-a72";
+		reg = <0x0 0x10100>;
+		enable-method = "spin-table";
+		cpu-release-addr = <0 0x20000000>;
+	};
+
+	CPU21: cpu@10101 {
+		device_type = "cpu";
+		compatible = "arm,cortex-a72";
+		reg = <0x0 0x10101>;
+		enable-method = "spin-table";
+		cpu-release-addr = <0 0x20000000>;
+	};
+
+	CPU22: cpu@10102 {
+		device_type = "cpu";
+		compatible = "arm,cortex-a72";
+		reg = <0x0 0x10102>;
+		enable-method = "spin-table";
+		cpu-release-addr = <0 0x20000000>;
+	};
+
+	CPU23: cpu@10103 {
+		device_type = "cpu";
+		compatible = "arm,cortex-a72";
+		reg = <0x0 0x10103>;
+		enable-method = "spin-table";
+		cpu-release-addr = <0 0x20000000>;
+	};
+
+	CPU24: cpu@10200 {
+		device_type = "cpu";
+		compatible = "arm,cortex-a72";
+		reg = <0x0 0x10200>;
+		enable-method = "spin-table";
+		cpu-release-addr = <0 0x20000000>;
+	};
+
+	CPU25: cpu@10201 {
+		device_type = "cpu";
+		compatible = "arm,cortex-a72";
+		reg = <0x0 0x10201>;
+		enable-method = "spin-table";
+		cpu-release-addr = <0 0x20000000>;
+	};
+
+	CPU26: cpu@10202 {
+		device_type = "cpu";
+		compatible = "arm,cortex-a72";
+		reg = <0x0 0x10202>;
+		enable-method = "spin-table";
+		cpu-release-addr = <0 0x20000000>;
+	};
+
+	CPU27: cpu@10203 {
+		device_type = "cpu";
+		compatible = "arm,cortex-a72";
+		reg = <0x0 0x10203>;
+		enable-method = "spin-table";
+		cpu-release-addr = <0 0x20000000>;
+	};
+
+	CPU28: cpu@10300 {
+		device_type = "cpu";
+		compatible = "arm,cortex-a72";
+		reg = <0x0 0x10300>;
+		enable-method = "spin-table";
+		cpu-release-addr = <0 0x20000000>;
+	};
+
+	CPU29: cpu@10301 {
+		device_type = "cpu";
+		compatible = "arm,cortex-a72";
+		reg = <0x0 0x10301>;
+		enable-method = "spin-table";
+		cpu-release-addr = <0 0x20000000>;
+	};
+
+	CPU30: cpu@10302 {
+		device_type = "cpu";
+		compatible = "arm,cortex-a72";
+		reg = <0x0 0x10302>;
+		enable-method = "spin-table";
+		cpu-release-addr = <0 0x20000000>;
+	};
+
+	CPU31: cpu@10303 {
+		device_type = "cpu";
+		compatible = "arm,cortex-a72";
+		reg = <0x0 0x10303>;
+		enable-method = "spin-table";
+		cpu-release-addr = <0 0x20000000>;
+	};
+};
+
 ===============================================================================
 [1] ARM Linux kernel documentation
     Documentation/devicetree/bindings/arm/cpus.txt
-- 
2.15.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
