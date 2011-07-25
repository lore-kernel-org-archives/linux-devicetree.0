From: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Subject: [PATCH 1/3] vic: add device tree bindings
Date: Mon, 25 Jul 2011 17:09:58 +0100
Message-ID: <1311610200-12408-2-git-send-email-jamie@jamieiles.com>
References: <1311610200-12408-1-git-send-email-jamie@jamieiles.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1311610200-12408-1-git-send-email-jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Allow the VIC to be used from device tree.  This adds vic_of_init() that
finds all compatible controllers in the device tree creating irq domains
and initialising the VIC.

We use of_iomap() for the IO mapping, but allow the entry functions in
arch/arm/include/asm/entry-macro-vic2.S to be used, this requires that a
static mapping is configured on the platform.

Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Signed-off-by: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
---
 Documentation/devicetree/bindings/arm/vic.txt |   21 +++++++++++++++
 arch/arm/common/vic.c                         |   35 +++++++++++++++++++++++++
 arch/arm/include/asm/hardware/vic.h           |    5 +++
 3 files changed, 61 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/vic.txt

diff --git a/Documentation/devicetree/bindings/arm/vic.txt b/Documentation/devicetree/bindings/arm/vic.txt
new file mode 100644
index 0000000..be5abc9
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/vic.txt
@@ -0,0 +1,21 @@
+ARM Vectored Interrupt Controller
+
+Some ARM cores may contain a vectored interrupt controller (VIC).  This
+controller is represented in the device tree with:
+
+Required properties:
+  - #interrupt-cells : <1> (32 interrupt sources supported)
+  - compatible : "arm,pl190-vic", "arm,pl192-vic", "arm-vic"
+  - reg : Offset and length of the register set for this device
+  - interrupt-controller
+  - irq-start : The first interrupt number that the VIC services
+
+Example ARM VIC node:
+
+vic0@60000 {
+	compatible = "arm,pl192-vic";
+	interrupt-controller;
+	reg = <0x60000 0x1000>;
+	irq-start = <32>;
+	#interrupt-cells = <1>;
+};
diff --git a/arch/arm/common/vic.c b/arch/arm/common/vic.c
index 7aa4262..5838b9f 100644
--- a/arch/arm/common/vic.c
+++ b/arch/arm/common/vic.c
@@ -25,6 +25,9 @@
 #include <linux/syscore_ops.h>
 #include <linux/device.h>
 #include <linux/amba/bus.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
 
 #include <asm/mach/irq.h>
 #include <asm/hardware/vic.h>
@@ -377,3 +380,35 @@ void __init vic_init(void __iomem *base, unsigned int irq_start,
 
 	vic_pm_register(base, irq_start, resume_sources);
 }
+
+#ifdef CONFIG_OF
+static const struct of_device_id arm_vic_ids[] __initconst = {
+	{ .compatible = "arm,pl190-vic" },
+	{ .compatible = "arm,pl192-vic" },
+	{ .compatible = "arm,vic" },
+	{},
+};
+
+void __init vic_of_init(void)
+{
+	struct device_node *np;
+
+	for_each_matching_node(np, arm_vic_ids) {
+		void __iomem *iobase;
+		u32 base_irq;
+
+		iobase = of_iomap(np, 0);
+
+		if (!iobase)
+			panic("Unable to map VIC");
+
+		if (of_property_read_u32(np, "irq-start", &base_irq))
+			panic("No irq-start property defined");
+
+		of_node_put(np);
+
+		vic_init(iobase, base_irq, ~0, 0);
+		irq_domain_add_simple(np, base_irq);
+	}
+}
+#endif /* CONFIG_OF */
diff --git a/arch/arm/include/asm/hardware/vic.h b/arch/arm/include/asm/hardware/vic.h
index 5d72550..dbda2d1 100644
--- a/arch/arm/include/asm/hardware/vic.h
+++ b/arch/arm/include/asm/hardware/vic.h
@@ -42,6 +42,11 @@
 
 #ifndef __ASSEMBLY__
 void vic_init(void __iomem *base, unsigned int irq_start, u32 vic_sources, u32 resume_sources);
+#ifdef CONFIG_OF
+void vic_of_init(void);
+#else /* CONFIG_OF */
+static inline void vic_of_init(void) {}
+#endif /* CONFIG_OF */
 #endif
 
 #endif
-- 
1.7.4.1
