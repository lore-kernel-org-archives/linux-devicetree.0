From: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Subject: [PATCH] ARM: davinci: cp_intc: Add OF support for TI interrupt
	controller
Date: Wed, 4 Jul 2012 00:46:10 +0530
Message-ID: <1341342970-27535-1-git-send-email-nsekhar@ti.com>
References: <4FF34360.6030501@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <davinci-linux-open-source-bounces+gld-davinci-linux-open-source=gmane.org-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
In-Reply-To: <4FF34360.6030501-l0cyMroinI0@public.gmane.org>
List-Unsubscribe: <http://linux.davincidsp.com/mailman/options/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=unsubscribe>
List-Archive: <http://linux.davincidsp.com/pipermail/davinci-linux-open-source>
List-Post: <mailto:davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
List-Help: <mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=help>
List-Subscribe: <http://linux.davincidsp.com/mailman/listinfo/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=subscribe>
Sender: <davinci-linux-open-source-bounces+gld-davinci-linux-open-source=gmane.org-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
Errors-To: davinci-linux-open-source-bounces+gld-davinci-linux-open-source=gmane.org-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
To: davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
Cc: Kevin Hilman <khilman-l0cyMroinI0@public.gmane.org>, Wolfgang Denk <wd-ynQEQJNshbs@public.gmane.org>, Sergei Shtylyov <sshtylyov-Igf4POYTYCDQT0dZR+AlfA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>

Add a function to initialize the Common Platform Interrupt Controller
(cp_intc) from TI used on OMAP-L1x SoCs using a device tree node.

Signed-off-by: Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
Cc: davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Cc: Wolfgang Denk <wd-ynQEQJNshbs@public.gmane.org>
Cc: Sergei Shtylyov <sshtylyov-Igf4POYTYCDQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
---
 .../devicetree/bindings/arm/davinci/cp-intc.txt    |   27 ++++++++++++++++++++
 arch/arm/mach-davinci/cp_intc.c                    |   16 +++++++++---
 arch/arm/mach-davinci/include/mach/cp_intc.h       |    1 +
 3 files changed, 41 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/davinci/cp-intc.txt

diff --git a/Documentation/devicetree/bindings/arm/davinci/cp-intc.txt b/Documentation/devicetree/bindings/arm/davinci/cp-intc.txt
new file mode 100644
index 0000000..597e8a0
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/davinci/cp-intc.txt
@@ -0,0 +1,27 @@
+* TI Common Platform Interrupt Controller
+
+Common Platform Interrupt Controller (cp_intc) is used on
+OMAP-L1x SoCs and can support several configurable number
+of interrupts.
+
+Main node required properties:
+
+- compatible : should be:
+	"ti,cp-intc"
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
+		compatible = "ti,cp-intc";
+		interrupt-controller;
+		#interrupt-cells = <1>;
+		ti,intc-size = <101>;
+		reg = <0xfffee000 0x2000>;
+	};
diff --git a/arch/arm/mach-davinci/cp_intc.c b/arch/arm/mach-davinci/cp_intc.c
index 45d5256..006dae8 100644
--- a/arch/arm/mach-davinci/cp_intc.c
+++ b/arch/arm/mach-davinci/cp_intc.c
@@ -14,6 +14,9 @@
 #include <linux/irq.h>
 #include <linux/irqdomain.h>
 #include <linux/io.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
 
 #include <mach/common.h>
 #include <mach/cp_intc.h>
@@ -119,7 +122,7 @@ static const struct irq_domain_ops cp_intc_host_ops = {
 	.xlate = irq_domain_xlate_onetwocell,
 };
 
-int __init __cp_intc_init(struct device_node *node)
+int __init cp_intc_of_init(struct device_node *node, struct device_node *parent)
 {
 	u32 num_irq		= davinci_soc_info.intc_irq_num;
 	u8 *irq_prio		= davinci_soc_info.intc_irq_prios;
@@ -128,7 +131,14 @@ int __init __cp_intc_init(struct device_node *node)
 	int i, irq_base;
 
 	davinci_intc_type = DAVINCI_INTC_TYPE_CP_INTC;
-	davinci_intc_base = ioremap(davinci_soc_info.intc_base, SZ_8K);
+	if (node) {
+		davinci_intc_base = of_iomap(node, 0);
+		if (of_property_read_u32(node, "ti,intc-size", &num_irq))
+			pr_warn("unable to get intc-size, default to %d\n",
+				num_irq);
+	} else {
+		davinci_intc_base = ioremap(davinci_soc_info.intc_base, SZ_8K);
+	}
 	if (WARN_ON(!davinci_intc_base))
 		return -EINVAL;
 
@@ -208,5 +218,5 @@ int __init __cp_intc_init(struct device_node *node)
 
 void __init cp_intc_init(void)
 {
-	__cp_intc_init(NULL);
+	cp_intc_of_init(NULL, NULL);
 }
diff --git a/arch/arm/mach-davinci/include/mach/cp_intc.h b/arch/arm/mach-davinci/include/mach/cp_intc.h
index 4e8190e..d13d8df 100644
--- a/arch/arm/mach-davinci/include/mach/cp_intc.h
+++ b/arch/arm/mach-davinci/include/mach/cp_intc.h
@@ -52,5 +52,6 @@
 #define CP_INTC_VECTOR_ADDR(n)		(0x2000 + (n << 2))
 
 void __init cp_intc_init(void);
+int __init cp_intc_of_init(struct device_node *, struct device_node *);
 
 #endif	/* __ASM_HARDWARE_CP_INTC_H */
-- 
1.7.10.1
