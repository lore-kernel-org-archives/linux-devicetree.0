From: Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
Subject: [PATCH v4 2/7] ARM: davinci,
 intc: Add OF support for TI interrupt controller
Date: Tue, 22 May 2012 15:55:15 +0200
Message-ID: <1337694920-8925-3-git-send-email-hs@denx.de>
References: <1337694920-8925-1-git-send-email-hs@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1337694920-8925-1-git-send-email-hs-ynQEQJNshbs@public.gmane.org>
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
Cc: Wolfgang Denk <wd-ynQEQJNshbs@public.gmane.org>, Sergei Shtylyov <sshtylyov-Igf4POYTYCDQT0dZR+AlfA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

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

---
- changes for v4
  - split patch in 2 patches, one for irq_domain adaption
    one for DT enhancement, as Nori Sekhar suggested.
  - add comment from Grant Likely for the DT part:
    remove if/else clause, not needed.
    Make use of DT runtime configurable

 .../devicetree/bindings/arm/davinci/intc.txt       |   27 ++++++++++++++++++++
 arch/arm/mach-davinci/cp_intc.c                    |   26 ++++++++++++++++---
 2 files changed, 49 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/davinci/intc.txt

diff --git a/Documentation/devicetree/bindings/arm/davinci/intc.txt b/Documentation/devicetree/bindings/arm/davinci/intc.txt
new file mode 100644
index 0000000..dfd6a560
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/davinci/intc.txt
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
+	"ti,cp_intc"
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
+		compatible = "ti,cp_intc";
+		interrupt-controller;
+		#interrupt-cells = <1>;
+		ti,intc-size = <101>;
+		reg = <0xfffee000 0x2000>;
+	};
diff --git a/arch/arm/mach-davinci/cp_intc.c b/arch/arm/mach-davinci/cp_intc.c
index bb52807..f9ad14e 100644
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
+int __init __cp_intc_init(struct device_node *node, struct device_node *parent)
 {
 	u32 num_irq		= davinci_soc_info.intc_irq_num;
 	u8 *irq_prio		= davinci_soc_info.intc_irq_prios;
@@ -128,8 +131,15 @@ int __init __cp_intc_init(struct device_node *node)
 	int i, irq_base;
 
 	davinci_intc_type = DAVINCI_INTC_TYPE_CP_INTC;
-	davinci_intc_base = ioremap(davinci_soc_info.intc_base, SZ_8K);
-
+	if (node) {
+		davinci_intc_base = of_iomap(node, 0);
+		if (of_property_read_u32(node, "ti,intc-size", &num_irq))
+			pr_warn("unable to get intc-size, default to %d\n",
+				num_irq);
+	} else {
+		davinci_intc_base = ioremap(davinci_soc_info.intc_base,
+					SZ_8K);
+	}
 	if (WARN_ON(!davinci_intc_base))
 		return -EINVAL;
 
@@ -207,7 +217,15 @@ int __init __cp_intc_init(struct device_node *node)
 	return 0;
 }
 
+static struct of_device_id irq_match[] __initdata = {
+	{ .compatible = "ti,cp_intc", .data = __cp_intc_init, },
+	{ }
+};
+
 void __init cp_intc_init(void)
 {
-	__cp_intc_init(NULL);
+	if (!of_find_compatible_node(NULL, NULL, "ti,cp_intc"))
+		__cp_intc_init(NULL, NULL);
+	else
+		of_irq_init(irq_match);
 }
-- 
1.7.7.6
