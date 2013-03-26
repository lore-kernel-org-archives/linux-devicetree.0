From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [RFCv1 03/11] irqchip: armada-370-xp: move IRQ handler to avoid
 forward declaration
Date: Tue, 26 Mar 2013 17:52:18 +0100
Message-ID: <1364316746-8702-4-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1364316746-8702-1-git-send-email-thomas.petazzoni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1364316746-8702-1-git-send-email-thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
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
To: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Maen Suleiman <maen-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Murray <andrew.murray-5wv7dgnIgG8@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

If we move the IRQ handler function above the initialization function,
we avoid a forward declaration. This wasn't done as part of the
previous commit, in order to increase the readibility of the previous
commit, who was also moving the IRQ controller driver from arch/arm to
drivers/irqchip.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 drivers/irqchip/irq-armada-370-xp.c |   83 +++++++++++++++++------------------
 1 file changed, 40 insertions(+), 43 deletions(-)

diff --git a/drivers/irqchip/irq-armada-370-xp.c b/drivers/irqchip/irq-armada-370-xp.c
index d20a832..1115bf8 100644
--- a/drivers/irqchip/irq-armada-370-xp.c
+++ b/drivers/irqchip/irq-armada-370-xp.c
@@ -206,49 +206,6 @@ static struct irq_domain_ops armada_370_xp_mpic_irq_ops = {
 };
 
 static asmlinkage void __exception_irq_entry
-armada_370_xp_handle_irq(struct pt_regs *regs);
-
-static int __init armada_370_xp_mpic_of_init(struct device_node *node,
-					     struct device_node *parent)
-{
-	u32 control;
-
-	main_int_base = of_iomap(node, 0);
-	per_cpu_int_base = of_iomap(node, 1);
-
-	BUG_ON(!main_int_base);
-	BUG_ON(!per_cpu_int_base);
-
-	control = readl(main_int_base + ARMADA_370_XP_INT_CONTROL);
-
-	armada_370_xp_mpic_domain =
-		irq_domain_add_linear(node, (control >> 2) & 0x3ff,
-				&armada_370_xp_mpic_irq_ops, NULL);
-
-	if (!armada_370_xp_mpic_domain)
-		panic("Unable to add Armada_370_Xp MPIC irq domain (DT)\n");
-
-	irq_set_default_host(armada_370_xp_mpic_domain);
-
-#ifdef CONFIG_SMP
-	armada_xp_mpic_smp_cpu_init();
-
-	/*
-	 * Set the default affinity from all CPUs to the boot cpu.
-	 * This is required since the MPIC doesn't limit several CPUs
-	 * from acknowledging the same interrupt.
-	 */
-	cpumask_clear(irq_default_affinity);
-	cpumask_set_cpu(smp_processor_id(), irq_default_affinity);
-
-#endif
-
-	set_handle_irq(armada_370_xp_handle_irq);
-
-	return 0;
-}
-
-static asmlinkage void __exception_irq_entry
 armada_370_xp_handle_irq(struct pt_regs *regs)
 {
 	u32 irqstat, irqnr;
@@ -291,4 +248,44 @@ armada_370_xp_handle_irq(struct pt_regs *regs)
 	} while (1);
 }
 
+static int __init armada_370_xp_mpic_of_init(struct device_node *node,
+					     struct device_node *parent)
+{
+	u32 control;
+
+	main_int_base = of_iomap(node, 0);
+	per_cpu_int_base = of_iomap(node, 1);
+
+	BUG_ON(!main_int_base);
+	BUG_ON(!per_cpu_int_base);
+
+	control = readl(main_int_base + ARMADA_370_XP_INT_CONTROL);
+
+	armada_370_xp_mpic_domain =
+		irq_domain_add_linear(node, (control >> 2) & 0x3ff,
+				&armada_370_xp_mpic_irq_ops, NULL);
+
+	if (!armada_370_xp_mpic_domain)
+		panic("Unable to add Armada_370_Xp MPIC irq domain (DT)\n");
+
+	irq_set_default_host(armada_370_xp_mpic_domain);
+
+#ifdef CONFIG_SMP
+	armada_xp_mpic_smp_cpu_init();
+
+	/*
+	 * Set the default affinity from all CPUs to the boot cpu.
+	 * This is required since the MPIC doesn't limit several CPUs
+	 * from acknowledging the same interrupt.
+	 */
+	cpumask_clear(irq_default_affinity);
+	cpumask_set_cpu(smp_processor_id(), irq_default_affinity);
+
+#endif
+
+	set_handle_irq(armada_370_xp_handle_irq);
+
+	return 0;
+}
+
 IRQCHIP_DECLARE(armada_370_xp_mpic, "marvell,mpic", armada_370_xp_mpic_of_init);
-- 
1.7.9.5
