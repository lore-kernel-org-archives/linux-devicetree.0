From: Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
Subject: [RFC PATCH 1/7] ARM: davinci,
 intc: Add OF support for TI interrupt controller
Date: Mon, 23 Jan 2012 09:56:01 +0100
Message-ID: <1327308967-8092-2-git-send-email-hs@denx.de>
References: <1327308967-8092-1-git-send-email-hs@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1327308967-8092-1-git-send-email-hs-ynQEQJNshbs@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
Cc: Wolfgang Denk <wd-ynQEQJNshbs@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add a function to initialize the davinci interrupt controller (INTC)
using a device tree node.

Signed-off-by: Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
Cc: davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Cc: Wolfgang Denk <wd-ynQEQJNshbs@public.gmane.org>
---
 .../devicetree/bindings/arm/davinci/intc.txt       |   26 ++++++++++
 arch/arm/mach-davinci/cp_intc.c                    |   51 ++++++++++++++++++++
 arch/arm/mach-davinci/include/mach/cp_intc.h       |    1 +
 3 files changed, 78 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/davinci/intc.txt

diff --git a/Documentation/devicetree/bindings/arm/davinci/intc.txt b/Documentation/devicetree/bindings/arm/davinci/intc.txt
new file mode 100644
index 0000000..dac2f69
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/davinci/intc.txt
@@ -0,0 +1,26 @@
+* TI Davinci Interrupt Controller
+
+davinci are using a TI interrupt controller that can support several
+configurable number of interrupts.
+
+Main node required properties:
+
+- compatible : should be:
+	"ti,davinci-intc"
+- interrupt-controller : Identifies the node as an interrupt controller
+- #interrupt-cells : Specifies the number of cells needed to encode an
+  interrupt source. The type shall be a <u32> and the value shall be 1.
+
+  The cell contains the interrupt number in the range [0-128].
+- ti,intc-size: Number of interrupts handled by the interrupt controller.
+- reg: physical base address and size of the intc registers map.
+
+Example:
+
+	intc: interrupt-controller@1 {
+		compatible = "ti,davinci-intc";
+		interrupt-controller;
+		#interrupt-cells = <1>;
+		ti,intc-size = <101>;
+		reg = <0xfffee000 0x2000>;
+	};
diff --git a/arch/arm/mach-davinci/cp_intc.c b/arch/arm/mach-davinci/cp_intc.c
index f83152d..2c6e2e4 100644
--- a/arch/arm/mach-davinci/cp_intc.c
+++ b/arch/arm/mach-davinci/cp_intc.c
@@ -11,7 +11,11 @@
 
 #include <linux/init.h>
 #include <linux/irq.h>
+#include <linux/irqdomain.h>
 #include <linux/io.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
 
 #include <mach/common.h>
 #include <mach/cp_intc.h>
@@ -175,3 +179,50 @@ void __init cp_intc_init(void)
 	/* Enable global interrupt */
 	cp_intc_write(1, CP_INTC_GLOBAL_ENABLE);
 }
+
+#ifdef CONFIG_OF
+int __init dv_intc_of_init(struct device_node *node, struct device_node *parent)
+{
+	struct resource res;
+	u32 nr_irqs;
+
+	if (WARN_ON(!node))
+		return -ENODEV;
+
+	if (of_address_to_resource(node, 0, &res)) {
+		WARN(1, "unable to get intc registers\n");
+		return -EINVAL;
+	}
+
+	davinci_soc_info.intc_base = res.start;
+	if (WARN_ON(!davinci_soc_info.intc_base))
+		return -EINVAL;
+
+	if (of_property_read_u32(node, "ti,intc-size", &nr_irqs)) {
+		WARN(1, "unable to get intc-size\n");
+		return -EINVAL;
+	}
+	davinci_soc_info.intc_irq_num = nr_irqs;
+	davinci_soc_info.intc_type = DAVINCI_INTC_TYPE_CP_INTC;
+
+	cp_intc_init();
+	irq_domain_add_simple(node, 0);
+
+	return 0;
+}
+
+static struct of_device_id irq_match[] __initdata = {
+	{ .compatible = "ti,davinci-intc", .data = dv_intc_of_init, },
+	{ }
+};
+
+void __init davinci_init_irq(void)
+{
+	of_irq_init(irq_match);
+}
+#else
+void __init davinci_init_irq(void)
+{
+	cp_intc_init();
+}
+#endif
diff --git a/arch/arm/mach-davinci/include/mach/cp_intc.h b/arch/arm/mach-davinci/include/mach/cp_intc.h
index 4e8190e..d674b95 100644
--- a/arch/arm/mach-davinci/include/mach/cp_intc.h
+++ b/arch/arm/mach-davinci/include/mach/cp_intc.h
@@ -52,5 +52,6 @@
 #define CP_INTC_VECTOR_ADDR(n)		(0x2000 + (n << 2))
 
 void __init cp_intc_init(void);
+void __init davinci_init_irq(void);
 
 #endif	/* __ASM_HARDWARE_CP_INTC_H */
-- 
1.7.7.5
