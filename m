From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/3] ARM: at91/gpio: add irqdomain to gpio interrupts
Date: Thu, 24 Nov 2011 22:56:28 +0100
Message-ID: <edeb4da00527914f0e1038461539843c46ab0b50.1322171620.git.nicolas.ferre@atmel.com>
References: <167b5ccfc31d9637186c5201cd83cb62df81fc0f.1322171620.git.nicolas.ferre@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <167b5ccfc31d9637186c5201cd83cb62df81fc0f.1322171620.git.nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
In-Reply-To: <167b5ccfc31d9637186c5201cd83cb62df81fc0f.1322171620.git.nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
References: <167b5ccfc31d9637186c5201cd83cb62df81fc0f.1322171620.git.nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Acked-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
---
 arch/arm/mach-at91/gpio.c |   19 +++++++++++++++++++
 1 files changed, 19 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-at91/gpio.c b/arch/arm/mach-at91/gpio.c
index 74d6783..45a39d0 100644
--- a/arch/arm/mach-at91/gpio.c
+++ b/arch/arm/mach-at91/gpio.c
@@ -20,6 +20,7 @@
 #include <linux/list.h>
 #include <linux/module.h>
 #include <linux/io.h>
+#include <linux/irqdomain.h>
 
 #include <mach/hardware.h>
 #include <mach/at91_pio.h>
@@ -32,6 +33,7 @@ struct at91_gpio_chip {
 	int			id;		/* ID of register bank */
 	void __iomem		*regbase;	/* Base of register bank */
 	struct clk		*clock;		/* associated clock */
+	struct irq_domain	domain;		/* associated irq domain */
 };
 
 #define to_at91_gpio_chip(c) container_of(c, struct at91_gpio_chip, chip)
@@ -483,6 +485,20 @@ postcore_initcall(at91_gpio_debugfs_init);
 /*--------------------------------------------------------------------------*/
 
 /*
+ * irqdomain initialization: pile up irqdomains on top of AIC range
+ */
+static void __init at91_gpio_irqdomain(struct at91_gpio_chip *at91_gpio)
+{
+	struct irq_domain	*gpio_irq_d = &at91_gpio->domain;
+
+	gpio_irq_d->irq_base =
+		gpio_irq_d->hwirq_base = gpio_to_irq(at91_gpio->chip.base);
+	gpio_irq_d->nr_irq = at91_gpio->chip.ngpio;
+	gpio_irq_d->ops = &irq_domain_simple_ops;
+	irq_domain_add(gpio_irq_d);
+}
+
+/*
  * This lock class tells lockdep that GPIO irqs are in a different
  * category than their parents, so it won't report false recursion.
  */
@@ -517,6 +533,9 @@ void __init at91_gpio_irq_setup(void)
 			set_irq_flags(irq, IRQF_VALID);
 		}
 
+		/* setup irq domain for this GPIO controller */
+		at91_gpio_irqdomain(this);
+
 		/* The toplevel handler handles one bank of GPIOs, except
 		 * AT91SAM9263_ID_PIOCDE handles three... PIOC is first in
 		 * the list, so we only set up that handler.
-- 
1.7.5.4
