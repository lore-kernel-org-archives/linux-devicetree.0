From: Palmer Dabbelt <palmer-96lFi9zoCfxBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 2/3] dts: RISC-V local interrupt controller docs
Date: Mon, 26 Jun 2017 22:21:23 -0700
Message-ID: <20170627052124.426-3-palmer@dabbelt.com>
References: <20170627052124.426-1-palmer@dabbelt.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170627052124.426-1-palmer-96lFi9zoCfxBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, ccc94453-1EA3ORoCGBhoJ7GROcy7lA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Palmer Dabbelt <palmer-96lFi9zoCfxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds documentation on the RISC-V local interrupt controller,
which is a per-hart interrupt controller that manages all interrupts
entering a RISC-V hart.  This interrupt controller is present on all
RISC-V systems.

Signed-off-by: Palmer Dabbelt <palmer-96lFi9zoCfxBDgjK7y7TUQ@public.gmane.org>
---
 .../interrupt-controller/riscv,cpu-intc.txt        | 70 ++++++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,cpu-intc.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,cpu-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/riscv,cpu-intc.txt
new file mode 100644
index 000000000000..f4906f49a1b4
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,cpu-intc.txt
@@ -0,0 +1,70 @@
+RISC-V Hart-Level Interrupt Controller (HLIC)
+---------------------------------------------
+
+RISC-V cores include Control Status Registers (CSRs) which are local to each
+hart and can be read or written by software. Some of these CSRs are used to
+control local interrupts connected to the core.  Every interrupt is ultimately
+routed through a hart's HLIC before it interrupts that hart.
+
+The RISC-V supervisor ISA manual specifices three interrupt sources that are
+attached to every HLIC: software interrupts, the timer interrupt, and external
+interrupts.  Software interrupts are used to send IPIs between cores.  The
+timer interrupt comes from an architectually mandated real-time timer that is
+controller via SBI calls and CSR reads.  External interrupts connect all other
+device interrupts to the HLIC, which are routed via the platforw-level
+interrupt contrellor (PLIC).
+
+All RISC-V systems that conform to the supervisor ISA specification are
+required to have a HLIC with these three interrupt sources present.
+
+Required properties:
+- compatible : "riscv,cpu-intc"
+- #interrupt-cells : should be <1>
+- interrupt-controller : Identifies the node as an interrupt controller
+
+Furthermore, this interrupt-controller MUST be embedded inside the cpu
+definition of the hart whose CSRs control these local interrupts.
+
+An example of a device tree entry for a standard RISC-V hart is as follows:
+
+	cpu1: cpu@1 {
+		clock-frequency = <1600000000>;
+		compatible = "riscv";
+		d-cache-block-size = <64>;
+		d-cache-sets = <64>;
+		d-cache-size = <16384>;
+		d-tlb-sets = <1>;
+		d-tlb-size = <32>;
+		device_type = "cpu";
+		i-cache-block-size = <64>;
+		i-cache-sets = <64>;
+		i-cache-size = <16384>;
+		i-tlb-sets = <1>;
+		i-tlb-size = <32>;
+		mmu-type = "riscv,sv39";
+		next-level-cache = <&L2>;
+		reg = <1>;
+		riscv,isa = "rv64imac";
+		status = "okay";
+		tlb-split;
+		cpu1-intc: interrupt-controller {
+			#interrupt-cells = <1>;
+			compatible = "riscv,cpu-intc";
+			interrupt-controller;
+		};
+	};
+
+The sections specifically relevant to the HLIC are
+
+	cpu1: cpu@1 {
+		cpu1-intc: interrupt-controller {
+			#interrupt-cells = <1>;
+			compatible = "riscv,cpu-intc";
+			interrupt-controller;
+		};
+	};
+
+As the HLIC is essentially a static interrupt controller, this device tree
+entry essentially just indicates the presence of a HLIC.  All HLIC interrupts
+are level-triggered, so there is no need to specify this as part of the device
+tree.
-- 
2.13.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
