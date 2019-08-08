From: Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH] dt-bindings: riscv: remove obsolete cpus.txt
Date: Thu, 8 Aug 2019 15:21:58 -0700 (PDT)
Message-ID: <alpine.DEB.2.21.9999.1908081520100.6414@viisi.sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org
To: devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


Remove the now-obsolete riscv/cpus.txt DT binding document, since we
are using YAML binding documentation instead.

While doing so, transfer the explanatory text about 'harts' (with some
edits) into the YAML file, at Rob's request.

Link: https://lore.kernel.org/linux-riscv/CAL_JsqJs6MtvmuyAknsUxQymbmoV=G+=JfS1PQj9kNHV7fjC9g@mail.gmail.com/
Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/riscv/cpus.txt        | 162 ------------------
 .../devicetree/bindings/riscv/cpus.yaml       |  12 ++
 2 files changed, 12 insertions(+), 162 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/riscv/cpus.txt

diff --git a/Documentation/devicetree/bindings/riscv/cpus.txt b/Documentation/devicetree/bindings/riscv/cpus.txt
deleted file mode 100644
index adf7b7af5dc3..000000000000
--- a/Documentation/devicetree/bindings/riscv/cpus.txt
+++ /dev/null
@@ -1,162 +0,0 @@
-===================
-RISC-V CPU Bindings
-===================
-
-The device tree allows to describe the layout of CPUs in a system through
-the "cpus" node, which in turn contains a number of subnodes (ie "cpu")
-defining properties for every cpu.
-
-Bindings for CPU nodes follow the Devicetree Specification, available from:
-
-https://www.devicetree.org/specifications/
-
-with updates for 32-bit and 64-bit RISC-V systems provided in this document.
-
-===========
-Terminology
-===========
-
-This document uses some terminology common to the RISC-V community that is not
-widely used, the definitions of which are listed here:
-
-* hart: A hardware execution context, which contains all the state mandated by
-  the RISC-V ISA: a PC and some registers.  This terminology is designed to
-  disambiguate software's view of execution contexts from any particular
-  microarchitectural implementation strategy.  For example, my Intel laptop is
-  described as having one socket with two cores, each of which has two hyper
-  threads.  Therefore this system has four harts.
-
-=====================================
-cpus and cpu node bindings definition
-=====================================
-
-The RISC-V architecture, in accordance with the Devicetree Specification,
-requires the cpus and cpu nodes to be present and contain the properties
-described below.
-
-- cpus node
-
-        Description: Container of cpu nodes
-
-        The node name must be "cpus".
-
-        A cpus node must define the following properties:
-
-        - #address-cells
-                Usage: required
-                Value type: <u32>
-                Definition: must be set to 1
-        - #size-cells
-                Usage: required
-                Value type: <u32>
-                Definition: must be set to 0
-
-- cpu node
-
-        Description: Describes a hart context
-
-        PROPERTIES
-
-        - device_type
-                Usage: required
-                Value type: <string>
-                Definition: must be "cpu"
-        - reg
-                Usage: required
-                Value type: <u32>
-                Definition: The hart ID of this CPU node
-        - compatible:
-                Usage: required
-                Value type: <stringlist>
-                Definition: must contain "riscv", may contain one of
-                            "sifive,rocket0"
-        - mmu-type:
-                Usage: optional
-                Value type: <string>
-                Definition: Specifies the CPU's MMU type.  Possible values are
-                            "riscv,sv32"
-                            "riscv,sv39"
-                            "riscv,sv48"
-        - riscv,isa:
-                Usage: required
-                Value type: <string>
-                Definition: Contains the RISC-V ISA string of this hart.  These
-                            ISA strings are defined by the RISC-V ISA manual.
-
-Example: SiFive Freedom U540G Development Kit
----------------------------------------------
-
-This system contains two harts: a hart marked as disabled that's used for
-low-level system tasks and should be ignored by Linux, and a second hart that
-Linux is allowed to run on.
-
-        cpus {
-                #address-cells = <1>;
-                #size-cells = <0>;
-                timebase-frequency = <1000000>;
-                cpu@0 {
-                        clock-frequency = <1600000000>;
-                        compatible = "sifive,rocket0", "riscv";
-                        device_type = "cpu";
-                        i-cache-block-size = <64>;
-                        i-cache-sets = <128>;
-                        i-cache-size = <16384>;
-                        next-level-cache = <&L15 &L0>;
-                        reg = <0>;
-                        riscv,isa = "rv64imac";
-                        status = "disabled";
-                        L10: interrupt-controller {
-                                #interrupt-cells = <1>;
-                                compatible = "riscv,cpu-intc";
-                                interrupt-controller;
-                        };
-                };
-                cpu@1 {
-                        clock-frequency = <1600000000>;
-                        compatible = "sifive,rocket0", "riscv";
-                        d-cache-block-size = <64>;
-                        d-cache-sets = <64>;
-                        d-cache-size = <32768>;
-                        d-tlb-sets = <1>;
-                        d-tlb-size = <32>;
-                        device_type = "cpu";
-                        i-cache-block-size = <64>;
-                        i-cache-sets = <64>;
-                        i-cache-size = <32768>;
-                        i-tlb-sets = <1>;
-                        i-tlb-size = <32>;
-                        mmu-type = "riscv,sv39";
-                        next-level-cache = <&L15 &L0>;
-                        reg = <1>;
-                        riscv,isa = "rv64imafdc";
-                        status = "okay";
-                        tlb-split;
-                        L13: interrupt-controller {
-                                #interrupt-cells = <1>;
-                                compatible = "riscv,cpu-intc";
-                                interrupt-controller;
-                        };
-                };
-        };
-
-Example: Spike ISA Simulator with 1 Hart
-----------------------------------------
-
-This device tree matches the Spike ISA golden model as run with `spike -p1`.
-
-        cpus {
-                cpu@0 {
-                        device_type = "cpu";
-                        reg = <0x00000000>;
-                        status = "okay";
-                        compatible = "riscv";
-                        riscv,isa = "rv64imafdc";
-                        mmu-type = "riscv,sv48";
-                        clock-frequency = <0x3b9aca00>;
-                        interrupt-controller {
-                                #interrupt-cells = <0x00000001>;
-                                interrupt-controller;
-                                compatible = "riscv,cpu-intc";
-                        }
-                }
-        }
diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index c899111aa5e3..5963af8c0c11 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -10,6 +10,18 @@ maintainers:
   - Paul Walmsley <paul.walmsley@sifive.com>
   - Palmer Dabbelt <palmer@sifive.com>
 
+description: |
+  This document uses some terminology common to the RISC-V community
+  that is not widely used, the definitions of which are listed here:
+
+  hart: A hardware execution context, which contains all the state
+  mandated by the RISC-V ISA: a PC and some registers.  This
+  terminology is designed to disambiguate software's view of execution
+  contexts from any particular microarchitectural implementation
+  strategy.  For example, an Intel laptop containing one socket with
+  two cores, each of which has two hyperthreads, could be described as
+  having four harts.
+
 properties:
   compatible:
     items:
-- 
2.22.0
