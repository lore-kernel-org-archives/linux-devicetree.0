From: Palmer Dabbelt <palmer-96lFi9zoCfxBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 3/3] dts: RISC-V PLIC documentation
Date: Mon, 26 Jun 2017 22:21:24 -0700
Message-ID: <20170627052124.426-4-palmer@dabbelt.com>
References: <20170627052124.426-1-palmer@dabbelt.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170627052124.426-1-palmer-96lFi9zoCfxBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, ccc94453-1EA3ORoCGBhoJ7GROcy7lA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Palmer Dabbelt <palmer-96lFi9zoCfxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds documentation for the platform-level interrupt
controller (PLIC) found in all RISC-V systems.  This interrupt
controller routes interrupts from all the devices in the system to each
hart-local interrupt controller.

Note: the DTS bindings for the PLIC aren't set in stone yet, as we might
want to change how we're specifying holes in the hart list.

Signed-off-by: Palmer Dabbelt <palmer-96lFi9zoCfxBDgjK7y7TUQ@public.gmane.org>
---
 .../bindings/interrupt-controller/riscv,plic0.txt  | 63 ++++++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,plic0.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,plic0.txt b/Documentation/devicetree/bindings/interrupt-controller/riscv,plic0.txt
new file mode 100644
index 000000000000..b51a948d9acc
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,plic0.txt
@@ -0,0 +1,63 @@
+RISC-V Platform-Level Interrupt Controller (PLIC)
+-------------------------------------------------
+
+The RISC-V supervisor ISA specification allows for the presence of a
+platform-level interrupt contrellor (PLIC).   The PLIC connects all external
+interrupts in the system to all hart contexts in the system, via the external
+interrupt source in each hart's hart-local interrupt controller (HLIC).  A hart
+context is a priviledge mode in a hardware execution thread.  For example, in
+an 4 core system with 2-way SMT, you have 8 harts and probably at least two
+priviledge modes per hart; machine mode and supervisor mode.
+
+Each interrupt can be enabled on per-context basis. Any context can claim
+a pending enabled interrupt and then release it once it has been handled.
+
+Each interrupt has a configurable priority. Higher priority interrupts are
+serviced firs. Each context can specify a priority threshold. Interrupts
+with priority below this threshold will not cause the PLIC to raise its
+interrupt line leading to the context.
+
+While the PLIC supports both edge-triggered and level-triggered interrupts,
+interrupt handlers are oblivious to this distinction and therefor it is not
+specific in the PLIC device-tree binding.
+
+FIXME: I'm going to see if it's viable to change this.
+On RISC-V systems there is no physical hart ID availiable to programs running
+in supervisor mode, only a logical hart ID that is set by the bootloader.  As
+such, hart contexts are expected to be mostly contiguous.
+
+Required properties:
+- compatible : "riscv,plic0"
+- #address-cells : should be <0>
+- #interrupt-cells : should be <1>
+- interrupt-controller : Identifies the node as an interrupt controller
+- reg : Should contain 1 register range (address and length)
+- riscv,ndev : Specifies the maximum number of devices this PLIC is capable of
+  recieving interrupts from.  While this may usually be the same as the number
+  of devices the PLIC is actually connected to, there may be fewer devices
+  actually connected.  Software can be largely oblivious of this, as devices
+  that are not connected will never fire an interrupt.
+- interrupts-extended : Specifies which contexts are connected to the PLIC,
+  with "-1" specifying that a context is not present.
+
+Example:
+
+	plic: interrupt-controller@c000000 {
+		#address-cells = <0>;
+		#interrupt-cells = <1>;
+		compatible = "riscv,plic0";
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
+
+While the RISC-V ISA doesn't specify a memory layout for the PLIC, the
+"riscv,plic0" device is a concrete implementation of the PLIC that contains a
+specific memory layout.  More details about the memory layout of the
+"riscv,plic0" device can be found as a comment in the device driver.
-- 
2.13.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
