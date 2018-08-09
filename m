From: Christoph Hellwig <hch@lst.de>
Subject: [PATCH v4 2/3] dt-bindings: interrupt-controller: SiFive Plaform
 Level Interrupt Controller
Date: Thu,  9 Aug 2018 09:56:01 +0200
Message-ID: <20180809075602.989-3-hch@lst.de>
References: <20180809075602.989-1-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180809075602.989-1-hch@lst.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org
To: tglx@linutronix.de, palmer@sifive.com, jason@lakedaemon.net, marc.zyngier@arm.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, aou@eecs.berkeley.edu, anup@brainfault.org, linux-kernel@vger.kernel.org, atish.patra@wdc.com, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, shorne@gmail.com
List-Id: devicetree@vger.kernel.org

From: Palmer Dabbelt <palmer@dabbelt.com>

Add documentation for the SiFive implementation of the RISC-V Platform
Level Interrupt Controller (PLIC).  The PLIC connects global interrupt
sources to the local interrupt controller on each hart.

Signed-off-by: Palmer Dabbelt <palmer@dabbelt.com>
[hch: various fixes and updates]
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 .../interrupt-controller/sifive,plic.txt      | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/sifive,plic.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic.txt b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic.txt
new file mode 100644
index 000000000000..fe7ccd944c12
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic.txt
@@ -0,0 +1,58 @@
+SiFive Platform-Level Interrupt Controller (PLIC)
+-------------------------------------------------
+
+SiFive SOCs include an implementation of the Platform-Level Interrupt Controller
+(PLIC) high-level specification in the RISC-V Privileged Architecture
+specification.  The PLIC connects all external interrupts in the system to all
+hart contexts in the system, via the external interrupt source in each hart.
+
+A hart context is a privilege mode in a hardware execution thread.  For example,
+in an 4 core system with 2-way SMT, you have 8 harts and probably at least two
+privilege modes per hart; machine mode and supervisor mode.
+
+Each interrupt can be enabled on per-context basis.  Any context can claim
+a pending enabled interrupt and then release it once it has been handled.
+
+Each interrupt has a configurable priority.  Higher priority interrupts are
+serviced first.  Each context can specify a priority threshold. Interrupts
+with priority below this threshold will not cause the PLIC to raise its
+interrupt line leading to the context.
+
+While the PLIC supports both edge-triggered and level-triggered interrupts,
+interrupt handlers are oblivious to this distinction and therefore it is not
+specified in the PLIC device-tree binding.
+
+While the RISC-V ISA doesn't specify a memory layout for the PLIC, the
+"sifive,plic" device is a concrete implementation of the PLIC that contains a
+specific memory layout, which is documented in chapter 8 of the SiFive U5
+Coreplex Series Manual <https://static.dev.sifive.com/U54-MC-RVCoreIP.pdf>.
+
+Required properties:
+- compatible : "sifive,plic" and a string identifying the actual detailed
+  implementation in case that specific bugs need to be worked around.
+- #address-cells : should be <0> or more.
+- #interrupt-cells : should be <1> or more.
+- interrupt-controller : Identifies the node as an interrupt controller.
+- reg : Should contain 1 register range (address and length).
+- interrupts-extended : Specifies which contexts are connected to the PLIC,
+  with "-1" specifying that a context is not present.  Each node pointed
+  to should be a riscv,cpu-intc node, which has a riscv node as parent.
+- riscv,ndev: Specifies how many external interrupts are supported by
+  this controller.
+
+Example:
+
+	plic: interrupt-controller@c000000 {
+		#address-cells = <0>;
+		#interrupt-cells = <1>;
+		compatible = "riscv,plic", "sifive,fu540-c000-plic";
+		interrupt-controller;
+		interrupts-extended = <
+			&cpu0-intc 11
+			&cpu1-intc 11 &cpu1-intc 9
+			&cpu2-intc 11 &cpu2-intc 9
+			&cpu3-intc 11 &cpu3-intc 9
+			&cpu4-intc 11 &cpu4-intc 9>;
+		reg = <0xc000000 0x4000000>;
+		riscv,ndev = <10>;
+	};
-- 
2.18.0
