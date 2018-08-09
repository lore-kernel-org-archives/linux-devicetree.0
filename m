From: Christoph Hellwig <hch@lst.de>
Subject: [PATCH v4 1/3] dt-bindings: interrupt-controller: RISC-V local
 interrupt controller
Date: Thu,  9 Aug 2018 09:56:00 +0200
Message-ID: <20180809075602.989-2-hch@lst.de>
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

Add documentation on the RISC-V local interrupt controller, which is a
per-hart interrupt controller that manages all interrupts entering a
RISC-V hart.  This interrupt controller is present on all RISC-V systems.

Signed-off-by: Palmer Dabbelt <palmer@dabbelt.com>
[hch: minor cleanups]
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 .../interrupt-controller/riscv,cpu-intc.txt   | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,cpu-intc.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,cpu-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/riscv,cpu-intc.txt
new file mode 100644
index 000000000000..b0a8af51c388
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,cpu-intc.txt
@@ -0,0 +1,44 @@
+RISC-V Hart-Level Interrupt Controller (HLIC)
+---------------------------------------------
+
+RISC-V cores include Control Status Registers (CSRs) which are local to each
+CPU core (HART in RISC-V terminology) and can be read or written by software.
+Some of these CSRs are used to control local interrupts connected to the core.
+Every interrupt is ultimately routed through a hart's HLIC before it
+interrupts that hart.
+
+The RISC-V supervisor ISA manual specifies three interrupt sources that are
+attached to every HLIC: software interrupts, the timer interrupt, and external
+interrupts.  Software interrupts are used to send IPIs between cores.  The
+timer interrupt comes from an architecturally mandated real-time timer that is
+controller via Supervisor Binary Interface (SBI) calls and CSR reads.  External
+interrupts connect all other device interrupts to the HLIC, which are routed
+via the platform-level interrupt controller (PLIC).
+
+All RISC-V systems that conform to the supervisor ISA specification are
+required to have a HLIC with these three interrupt sources present.  Since the
+interrupt map is defined by the ISA it's not listed in the HLIC's device tree
+entry, though external interrupt controllers (like the PLIC, for example) will
+need to define how their interrupts map to the relevant HLICs.  This means
+a PLIC interrupt property will typically list the HLICs for all present HARTs
+in the system.
+
+Required properties:
+- compatible : "riscv,cpu-intc"
+- #interrupt-cells : should be <1>
+- interrupt-controller : Identifies the node as an interrupt controller
+
+Furthermore, this interrupt-controller MUST be embedded inside the cpu
+definition of the hart whose CSRs control these local interrupts.
+
+An example device tree entry for a HLIC is show below.
+
+	cpu1: cpu@1 {
+		compatible = "riscv";
+		...
+		cpu1-intc: interrupt-controller {
+			#interrupt-cells = <1>;
+			compatible = "riscv,cpu-intc", "sifive,fu540-c000-cpu-intc";
+			interrupt-controller;
+		};
+	};
-- 
2.18.0
