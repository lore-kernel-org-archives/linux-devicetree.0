From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Subject: [RFC] [PATCH 1/3] of: irq: rename of_irq_count to of_irq_valid_count
Date: Tue, 28 May 2013 17:08:47 +0200
Message-ID: <1369753729-12997-1-git-send-email-plagnioj@jcrosoft.com>
References: <20130528145219.GA30411@game.jcrosoft.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130528145219.GA30411-RQcB7r2h9QmfDR2tN2SG5Ni2O/JbrIOy@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

as we count valid mapped irq not just present irq

Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
Cc: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
---
 arch/mips/lantiq/irq.c           |    2 +-
 arch/powerpc/sysdev/ppc4xx_msi.c |    2 +-
 drivers/clocksource/exynos_mct.c |    2 +-
 drivers/gpio/gpio-mvebu.c        |    2 +-
 drivers/irqchip/irq-vt8500.c     |    4 ++--
 drivers/of/irq.c                 |    4 ++--
 drivers/of/platform.c            |    2 +-
 include/linux/of_irq.h           |    2 +-
 8 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/mips/lantiq/irq.c b/arch/mips/lantiq/irq.c
index 5119487..f1f54bd 100644
--- a/arch/mips/lantiq/irq.c
+++ b/arch/mips/lantiq/irq.c
@@ -382,7 +382,7 @@ int __init icu_of_init(struct device_node *node, struct device_node *parent)
 	eiu_node = of_find_compatible_node(NULL, NULL, "lantiq,eiu-xway");
 	if (eiu_node && !of_address_to_resource(eiu_node, 0, &res)) {
 		/* find out how many external irq sources we have */
-		exin_avail = of_irq_count(eiu_node);
+		exin_avail = of_irq_valid_count(eiu_node);
 
 		if (exin_avail > MAX_EIU)
 			exin_avail = MAX_EIU;
diff --git a/arch/powerpc/sysdev/ppc4xx_msi.c b/arch/powerpc/sysdev/ppc4xx_msi.c
index 43948da..b836b68 100644
--- a/arch/powerpc/sysdev/ppc4xx_msi.c
+++ b/arch/powerpc/sysdev/ppc4xx_msi.c
@@ -243,7 +243,7 @@ static int ppc4xx_msi_probe(struct platform_device *dev)
 		goto error_out;
 	}
 
-	msi_irqs = of_irq_count(dev->dev.of_node);
+	msi_irqs = of_irq_valid_count(dev->dev.of_node);
 	if (!msi_irqs)
 		return -ENODEV;
 
diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
index 662fcc0..a0bee5b 100644
--- a/drivers/clocksource/exynos_mct.c
+++ b/drivers/clocksource/exynos_mct.c
@@ -532,7 +532,7 @@ static void __init mct_init_dt(struct device_node *np, unsigned int int_type)
 	 * irqs are specified.
 	 */
 #ifdef CONFIG_OF
-	nr_irqs = of_irq_count(np);
+	nr_irqs = of_irq_valid_count(np);
 #else
 	nr_irqs = 0;
 #endif
diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index bf69a7e..e3e4f05 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -668,7 +668,7 @@ static int mvebu_gpio_probe(struct platform_device *pdev)
 	gpiochip_add(&mvchip->chip);
 
 	/* Some gpio controllers do not provide irq support */
-	if (!of_irq_count(np))
+	if (!of_irq_valid_count(np))
 		return 0;
 
 	/* Setup the interrupt handlers. Each chip can have up to 4
diff --git a/drivers/irqchip/irq-vt8500.c b/drivers/irqchip/irq-vt8500.c
index d970595..bf1d6e7 100644
--- a/drivers/irqchip/irq-vt8500.c
+++ b/drivers/irqchip/irq-vt8500.c
@@ -237,9 +237,9 @@ int __init vt8500_irq_init(struct device_node *node, struct device_node *parent)
 	active_cnt++;
 
 	/* check if this is a slaved controller */
-	if (of_irq_count(np) != 0) {
+	if (of_irq_valid_count(np) != 0) {
 		/* check that we have the correct number of interrupts */
-		if (of_irq_count(np) != 8) {
+		if (of_irq_valid_count(np) != 8) {
 			pr_err("%s: Incorrect IRQ map for slaved controller\n",
 					__func__);
 			return -EINVAL;
diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index a3c1c5a..d1c5825 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -362,10 +362,10 @@ int of_irq_to_resource(struct device_node *dev, int index, struct resource *r)
 EXPORT_SYMBOL_GPL(of_irq_to_resource);
 
 /**
- * of_irq_count - Count the number of IRQs a node uses
+ * of_irq_valid_count - Count the number of mapped IRQs a node uses
  * @dev: pointer to device tree node
  */
-int of_irq_count(struct device_node *dev)
+int of_irq_valid_count(struct device_node *dev)
 {
 	int nr = 0;
 
diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index e0a6514..00a0971 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -152,7 +152,7 @@ struct platform_device *of_device_alloc(struct device_node *np,
 	if (of_can_translate_address(np))
 		while (of_address_to_resource(np, num_reg, &temp_res) == 0)
 			num_reg++;
-	num_irq = of_irq_count(np);
+	num_irq = of_irq_valid_count(np);
 
 	/* Populate the resource table */
 	if (num_irq || num_reg) {
diff --git a/include/linux/of_irq.h b/include/linux/of_irq.h
index 535cecf..88bb58c 100644
--- a/include/linux/of_irq.h
+++ b/include/linux/of_irq.h
@@ -68,7 +68,7 @@ extern unsigned int irq_create_of_mapping(struct device_node *controller,
 					  unsigned int intsize);
 extern int of_irq_to_resource(struct device_node *dev, int index,
 			      struct resource *r);
-extern int of_irq_count(struct device_node *dev);
+extern int of_irq_valid_count(struct device_node *dev);
 extern int of_irq_to_resource_table(struct device_node *dev,
 		struct resource *res, int nr_irqs);
 extern struct device_node *of_irq_find_parent(struct device_node *child);
-- 
1.7.10.4
