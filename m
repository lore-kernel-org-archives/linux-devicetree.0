From: Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>
Subject: [PATCH 1/2] irqchip: Add brcm,bcm6345-l1-intc device tree binding
Date: Mon, 16 Nov 2015 19:12:36 +0000
Message-ID: <564A2AA4.3060901@simon.arlott.org.uk>
References: <5648B804.40806@simon.arlott.org.uk>
 <20151116153443.GA13799@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151116153443.GA13799@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add device tree binding for the BCM6345 interrupt controller.

This controller is similar to the SMP-capable BCM7038 and
the BCM3380 but with packed interrupt registers.

Signed-off-by: Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>
---
On 16/11/15 15:34, Rob Herring wrote:
> On Sun, Nov 15, 2015 at 04:51:16PM +0000, Simon Arlott wrote:
>> Add device tree binding for the BCM63168 interrupt controller.
>> 
>> This controller is similar to the SMP-capable BCM7038 and
>> the BCM3380 but with packed interrupt registers.
>> 
>> Signed-off-by: Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>
> 
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

I'm going to rename this to bcm6345-l1 as suggested by Jonas Gorski, and
the binding now specifies a <soc> version of the compatible name to be
included.

 .../interrupt-controller/brcm,bcm6345-l1-intc.txt  | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/brcm,bcm6345-l1-intc.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm6345-l1-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm6345-l1-intc.txt
new file mode 100644
index 0000000..c5bdcf1
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm6345-l1-intc.txt
@@ -0,0 +1,57 @@
+Broadcom BCM6345-style Level 1 interrupt controller
+
+This block is a first level interrupt controller that is typically connected
+directly to one of the HW INT lines on each CPU.
+
+Key elements of the hardware design include:
+
+- 32, 64 or 128 incoming level IRQ lines
+
+- Most onchip peripherals are wired directly to an L1 input
+
+- A separate instance of the register set for each CPU, allowing individual
+  peripheral IRQs to be routed to any CPU
+
+- Contains one or more enable/status word pairs per CPU
+
+- No atomic set/clear operations
+
+- No polarity/level/edge settings
+
+- No FIFO or priority encoder logic; software is expected to read all
+  2-4 status words to determine which IRQs are pending
+
+Required properties:
+
+- compatible: should be "brcm,bcm<soc>-l1-intc", "brcm,bcm6345-l1-intc"
+- reg: specifies the base physical address and size of the registers;
+  the number of supported IRQs is inferred from the size argument
+- interrupt-controller: identifies the node as an interrupt controller
+- #interrupt-cells: specifies the number of cells needed to encode an interrupt
+  source, should be 1.
+- interrupt-parent: specifies the phandle to the parent interrupt controller(s)
+  this one is cascaded from
+- interrupts: specifies the interrupt line(s) in the interrupt-parent controller
+  node; valid values depend on the type of parent interrupt controller
+
+If multiple reg ranges and interrupt-parent entries are present on an SMP
+system, the driver will allow IRQ SMP affinity to be set up through the
+/proc/irq/ interface.  In the simplest possible configuration, only one
+reg range and one interrupt-parent is needed.
+
+The driver operates in native CPU endian by default, there is no support for
+specifying an alternative endianness.
+
+Example:
+
+periph_intc: periph_intc@10000000 {
+        compatible = "brcm,bcm63168-l1-intc", "brcm,bcm6345-l1-intc";
+        reg = <0x10000020 0x20>,
+              <0x10000040 0x20>;
+
+        interrupt-controller;
+        #interrupt-cells = <1>;
+
+        interrupt-parent = <&cpu_intc>;
+        interrupts = <2>, <3>;
+};
-- 
2.1.4

-- 
Simon Arlott
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
