From: Palmer Dabbelt <palmer-96lFi9zoCfxBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v9 03/12] dt-bindings: RISC-V CPU Bindings
Date: Tue, 26 Sep 2017 18:56:29 -0700
Message-ID: <20170927015638.19443-4-palmer@dabbelt.com>
References: <20170927015638.19443-1-palmer@dabbelt.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170927015638.19443-1-palmer-96lFi9zoCfxBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-q3qR2WxjNRFS9aJRtSZj7A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, albert-SpMDHPYPyPbQT0dZR+AlfA@public.gmane.org, yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org, mmarek-IBi9RG/b67k@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, boqun.feng-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Palmer Dabbelt <palmer-96lFi9zoCfxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds device tree bindings for RISC-V CPUs, patterned after
the ARM device tree CPU bindings.

Signed-off-by: Palmer Dabbelt <palmer-96lFi9zoCfxBDgjK7y7TUQ@public.gmane.org>
---
 Documentation/devicetree/bindings/riscv/cpus.txt | 162 +++++++++++++++++++++++
 1 file changed, 162 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/cpus.txt

diff --git a/Documentation/devicetree/bindings/riscv/cpus.txt b/Documentation/devicetree/bindings/riscv/cpus.txt
new file mode 100644
index 000000000000..adf7b7af5dc3
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/cpus.txt
@@ -0,0 +1,162 @@
+===================
+RISC-V CPU Bindings
+===================
+
+The device tree allows to describe the layout of CPUs in a system through
+the "cpus" node, which in turn contains a number of subnodes (ie "cpu")
+defining properties for every cpu.
+
+Bindings for CPU nodes follow the Devicetree Specification, available from:
+
+https://www.devicetree.org/specifications/
+
+with updates for 32-bit and 64-bit RISC-V systems provided in this document.
+
+===========
+Terminology
+===========
+
+This document uses some terminology common to the RISC-V community that is not
+widely used, the definitions of which are listed here:
+
+* hart: A hardware execution context, which contains all the state mandated by
+  the RISC-V ISA: a PC and some registers.  This terminology is designed to
+  disambiguate software's view of execution contexts from any particular
+  microarchitectural implementation strategy.  For example, my Intel laptop is
+  described as having one socket with two cores, each of which has two hyper
+  threads.  Therefore this system has four harts.
+
+=====================================
+cpus and cpu node bindings definition
+=====================================
+
+The RISC-V architecture, in accordance with the Devicetree Specification,
+requires the cpus and cpu nodes to be present and contain the properties
+described below.
+
+- cpus node
+
+        Description: Container of cpu nodes
+
+        The node name must be "cpus".
+
+        A cpus node must define the following properties:
+
+        - #address-cells
+                Usage: required
+                Value type: <u32>
+                Definition: must be set to 1
+        - #size-cells
+                Usage: required
+                Value type: <u32>
+                Definition: must be set to 0
+
+- cpu node
+
+        Description: Describes a hart context
+
+        PROPERTIES
+
+        - device_type
+                Usage: required
+                Value type: <string>
+                Definition: must be "cpu"
+        - reg
+                Usage: required
+                Value type: <u32>
+                Definition: The hart ID of this CPU node
+        - compatible:
+                Usage: required
+                Value type: <stringlist>
+                Definition: must contain "riscv", may contain one of
+                            "sifive,rocket0"
+        - mmu-type:
+                Usage: optional
+                Value type: <string>
+                Definition: Specifies the CPU's MMU type.  Possible values are
+                            "riscv,sv32"
+                            "riscv,sv39"
+                            "riscv,sv48"
+        - riscv,isa:
+                Usage: required
+                Value type: <string>
+                Definition: Contains the RISC-V ISA string of this hart.  These
+                            ISA strings are defined by the RISC-V ISA manual.
+
+Example: SiFive Freedom U540G Development Kit
+---------------------------------------------
+
+This system contains two harts: a hart marked as disabled that's used for
+low-level system tasks and should be ignored by Linux, and a second hart that
+Linux is allowed to run on.
+
+        cpus {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                timebase-frequency = <1000000>;
+                cpu@0 {
+                        clock-frequency = <1600000000>;
+                        compatible = "sifive,rocket0", "riscv";
+                        device_type = "cpu";
+                        i-cache-block-size = <64>;
+                        i-cache-sets = <128>;
+                        i-cache-size = <16384>;
+                        next-level-cache = <&L15 &L0>;
+                        reg = <0>;
+                        riscv,isa = "rv64imac";
+                        status = "disabled";
+                        L10: interrupt-controller {
+                                #interrupt-cells = <1>;
+                                compatible = "riscv,cpu-intc";
+                                interrupt-controller;
+                        };
+                };
+                cpu@1 {
+                        clock-frequency = <1600000000>;
+                        compatible = "sifive,rocket0", "riscv";
+                        d-cache-block-size = <64>;
+                        d-cache-sets = <64>;
+                        d-cache-size = <32768>;
+                        d-tlb-sets = <1>;
+                        d-tlb-size = <32>;
+                        device_type = "cpu";
+                        i-cache-block-size = <64>;
+                        i-cache-sets = <64>;
+                        i-cache-size = <32768>;
+                        i-tlb-sets = <1>;
+                        i-tlb-size = <32>;
+                        mmu-type = "riscv,sv39";
+                        next-level-cache = <&L15 &L0>;
+                        reg = <1>;
+                        riscv,isa = "rv64imafdc";
+                        status = "okay";
+                        tlb-split;
+                        L13: interrupt-controller {
+                                #interrupt-cells = <1>;
+                                compatible = "riscv,cpu-intc";
+                                interrupt-controller;
+                        };
+                };
+        };
+
+Example: Spike ISA Simulator with 1 Hart
+----------------------------------------
+
+This device tree matches the Spike ISA golden model as run with `spike -p1`.
+
+        cpus {
+                cpu@0 {
+                        device_type = "cpu";
+                        reg = <0x00000000>;
+                        status = "okay";
+                        compatible = "riscv";
+                        riscv,isa = "rv64imafdc";
+                        mmu-type = "riscv,sv48";
+                        clock-frequency = <0x3b9aca00>;
+                        interrupt-controller {
+                                #interrupt-cells = <0x00000001>;
+                                interrupt-controller;
+                                compatible = "riscv,cpu-intc";
+                        }
+                }
+        }
-- 
2.13.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
