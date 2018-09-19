Return-Path: <SRS0=6+VU=MB=linux.intel.com=thor.thayer@kernel.org>
From: thor.thayer@linux.intel.com
Subject: [PATCH 2/6] EDAC, altera: Combine Stratix10 and Arria10 probe functions
Date: Wed, 19 Sep 2018 14:38:57 -0500
Message-Id: <1537385941-11582-3-git-send-email-thor.thayer@linux.intel.com>
In-Reply-To: <1537385941-11582-1-git-send-email-thor.thayer@linux.intel.com>
References: <1537385941-11582-1-git-send-email-thor.thayer@linux.intel.com>
To: dinguyen@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, bp@alien8.de, mchehab@kernel.org
Cc: thor.thayer@linux.intel.com, devicetree@vger.kernel.org, linux-edac@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

From: Thor Thayer <thor.thayer@linux.intel.com>

On Stratix10, the ECC offsets are similar to the existing
Arria10 functions and this can be leveraged to simplify
the EDAC driver as follows:

1. Fold Stratix10 specifics into Arria10 structures and
functions.
2. Implement the Stratix10 System Manager register accesses
using a custom regmap to allow use with the Arria10 System
Manager regmaps.
3. Stratix10 double bit errors are implemented as SError
instead of interrupts so use a panic notifier.

Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
---
 drivers/edac/altera_edac.c | 263 +++++++++++++++------------------------------
 drivers/edac/altera_edac.h |  10 +-
 2 files changed, 90 insertions(+), 183 deletions(-)

diff --git a/drivers/edac/altera_edac.c b/drivers/edac/altera_edac.c
index 5762c3c383f2..e2b66a20d064 100644
--- a/drivers/edac/altera_edac.c
+++ b/drivers/edac/altera_edac.c
@@ -2146,6 +2146,35 @@ static const struct irq_domain_ops a10_eccmgr_ic_ops = {
 	.xlate = irq_domain_xlate_twocell,
 };
 
+/************** Stratix 10 EDAC Double Bit Error Handler ************/
+#define to_a10edac(p, m) container_of(p, struct altr_arria10_edac, m)
+
+/*
+ * The double bit error is handled through SError which is fatal. This is
+ * called as a panic notifier to printout ECC error info as part of the panic.
+ */
+static int s10_edac_dberr_handler(struct notifier_block *this,
+				  unsigned long event, void *ptr)
+{
+	struct altr_arria10_edac *edac = to_a10edac(this, panic_notifier);
+	int err_addr, dberror;
+
+	regmap_read(edac->ecc_mgr_map, S10_SYSMGR_ECC_INTSTAT_DERR_OFST,
+		    &dberror);
+	regmap_write(edac->ecc_mgr_map, S10_SYSMGR_UE_VAL_OFST, dberror);
+	if (dberror & S10_DDR0_IRQ_MASK) {
+		regmap_read(edac->ecc_mgr_map, S10_DERRADDR_OFST, &err_addr);
+		regmap_write(edac->ecc_mgr_map, S10_SYSMGR_UE_ADDR_OFST,
+			     err_addr);
+		edac_printk(KERN_ERR, EDAC_MC,
+			    "EDAC: [Uncorrectable errors @ 0x%08X]\n\n",
+			    err_addr);
+	}
+
+	return NOTIFY_DONE;
+}
+
+/****************** Arria 10 EDAC Probe Function *********************/
 static int altr_edac_a10_probe(struct platform_device *pdev)
 {
 	struct altr_arria10_edac *edac;
@@ -2159,8 +2188,33 @@ static int altr_edac_a10_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, edac);
 	INIT_LIST_HEAD(&edac->a10_ecc_devices);
 
-	edac->ecc_mgr_map = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
+	if (socfpga_is_a10()) {
+		edac->ecc_mgr_map =
+			syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
 							"altr,sysmgr-syscon");
+	} else {
+		struct device_node *sysmgr_np;
+		struct resource res;
+		void __iomem *base;
+
+		sysmgr_np = of_parse_phandle(pdev->dev.of_node,
+					     "altr,sysmgr-syscon", 0);
+		if (!sysmgr_np) {
+			edac_printk(KERN_ERR, EDAC_DEVICE,
+				    "Unable to find altr,sysmgr-syscon\n");
+			return -ENODEV;
+		}
+
+		if (of_address_to_resource(sysmgr_np, 0, &res))
+			return -ENOMEM;
+
+		/* Need physical address for SMCC call */
+		base = (void __iomem *)res.start;
+
+		edac->ecc_mgr_map = devm_regmap_init(&pdev->dev, NULL, base,
+						     &s10_sdram_regmap_cfg);
+	}
+
 	if (IS_ERR(edac->ecc_mgr_map)) {
 		edac_printk(KERN_ERR, EDAC_DEVICE,
 			    "Unable to get syscon altr,sysmgr-syscon\n");
@@ -2187,14 +2241,38 @@ static int altr_edac_a10_probe(struct platform_device *pdev)
 					 altr_edac_a10_irq_handler,
 					 edac);
 
-	edac->db_irq = platform_get_irq(pdev, 1);
-	if (edac->db_irq < 0) {
-		dev_err(&pdev->dev, "No DBERR IRQ resource\n");
-		return edac->db_irq;
+	if (socfpga_is_a10()) {
+		edac->db_irq = platform_get_irq(pdev, 1);
+		if (edac->db_irq < 0) {
+			dev_err(&pdev->dev, "No DBERR IRQ resource\n");
+			return edac->db_irq;
+		}
+		irq_set_chained_handler_and_data(edac->db_irq,
+						 altr_edac_a10_irq_handler,
+						 edac);
+	} else {
+		int dberror, err_addr;
+
+		edac->panic_notifier.notifier_call = s10_edac_dberr_handler;
+		atomic_notifier_chain_register(&panic_notifier_list,
+					       &edac->panic_notifier);
+
+		/* Printout a message if uncorrectable error previously. */
+		regmap_read(edac->ecc_mgr_map, S10_SYSMGR_UE_VAL_OFST,
+			    &dberror);
+		if (dberror) {
+			regmap_read(edac->ecc_mgr_map, S10_SYSMGR_UE_ADDR_OFST,
+				    &err_addr);
+			edac_printk(KERN_ERR, EDAC_DEVICE,
+				    "Previous Boot UE detected[0x%X] @ 0x%X\n",
+				    dberror, err_addr);
+			/* Reset the sticky registers */
+			regmap_write(edac->ecc_mgr_map,
+				     S10_SYSMGR_UE_VAL_OFST, 0);
+			regmap_write(edac->ecc_mgr_map,
+				     S10_SYSMGR_UE_ADDR_OFST, 0);
+		}
 	}
-	irq_set_chained_handler_and_data(edac->db_irq,
-					 altr_edac_a10_irq_handler,
-					 edac);
 
 	for_each_child_of_node(pdev->dev.of_node, child) {
 		if (!of_device_is_available(child))
@@ -2211,7 +2289,8 @@ static int altr_edac_a10_probe(struct platform_device *pdev)
 
 			altr_edac_a10_device_add(edac, child);
 
-		else if (of_device_is_compatible(child, "altr,sdram-edac-a10"))
+		else if ((of_device_is_compatible(child, "altr,sdram-edac-a10")) ||
+			 (of_device_is_compatible(child, "altr,sdram-edac-s10")))
 			of_platform_populate(pdev->dev.of_node,
 					     altr_sdram_ctrl_of_match,
 					     NULL, &pdev->dev);
@@ -2222,6 +2301,7 @@ static int altr_edac_a10_probe(struct platform_device *pdev)
 
 static const struct of_device_id altr_edac_a10_of_match[] = {
 	{ .compatible = "altr,socfpga-a10-ecc-manager" },
+	{ .compatible = "altr,socfpga-s10-ecc-manager" },
 	{},
 };
 MODULE_DEVICE_TABLE(of, altr_edac_a10_of_match);
@@ -2235,171 +2315,6 @@ static struct platform_driver altr_edac_a10_driver = {
 };
 module_platform_driver(altr_edac_a10_driver);
 
-/************** Stratix 10 EDAC Device Controller Functions> ************/
-
-#define to_s10edac(p, m) container_of(p, struct altr_stratix10_edac, m)
-
-/*
- * The double bit error is handled through SError which is fatal. This is
- * called as a panic notifier to printout ECC error info as part of the panic.
- */
-static int s10_edac_dberr_handler(struct notifier_block *this,
-				  unsigned long event, void *ptr)
-{
-	struct altr_stratix10_edac *edac = to_s10edac(this, panic_notifier);
-	int err_addr, dberror;
-
-	s10_protected_reg_read(edac, S10_SYSMGR_ECC_INTSTAT_DERR_OFST,
-			       &dberror);
-	/* Remember the UE Errors for a reboot */
-	s10_protected_reg_write(edac, S10_SYSMGR_UE_VAL_OFST, dberror);
-	if (dberror & S10_DDR0_IRQ_MASK) {
-		s10_protected_reg_read(edac, S10_DERRADDR_OFST, &err_addr);
-		/* Remember the UE Error address */
-		s10_protected_reg_write(edac, S10_SYSMGR_UE_ADDR_OFST,
-					err_addr);
-		edac_printk(KERN_ERR, EDAC_MC,
-			    "EDAC: [Uncorrectable errors @ 0x%08X]\n\n",
-			    err_addr);
-	}
-
-	return NOTIFY_DONE;
-}
-
-static void altr_edac_s10_irq_handler(struct irq_desc *desc)
-{
-	struct altr_stratix10_edac *edac = irq_desc_get_handler_data(desc);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
-	int irq = irq_desc_get_irq(desc);
-	int bit, sm_offset, irq_status;
-
-	sm_offset = S10_SYSMGR_ECC_INTSTAT_SERR_OFST;
-
-	chained_irq_enter(chip, desc);
-
-	s10_protected_reg_read(NULL, sm_offset, &irq_status);
-
-	for_each_set_bit(bit, (unsigned long *)&irq_status, 32) {
-		irq = irq_linear_revmap(edac->domain, bit);
-		if (irq)
-			generic_handle_irq(irq);
-	}
-
-	chained_irq_exit(chip, desc);
-}
-
-static void s10_eccmgr_irq_mask(struct irq_data *d)
-{
-	struct altr_stratix10_edac *edac = irq_data_get_irq_chip_data(d);
-
-	s10_protected_reg_write(edac, S10_SYSMGR_ECC_INTMASK_SET_OFST,
-				BIT(d->hwirq));
-}
-
-static void s10_eccmgr_irq_unmask(struct irq_data *d)
-{
-	struct altr_stratix10_edac *edac = irq_data_get_irq_chip_data(d);
-
-	s10_protected_reg_write(edac, S10_SYSMGR_ECC_INTMASK_CLR_OFST,
-				BIT(d->hwirq));
-}
-
-static int s10_eccmgr_irqdomain_map(struct irq_domain *d, unsigned int irq,
-				    irq_hw_number_t hwirq)
-{
-	struct altr_stratix10_edac *edac = d->host_data;
-
-	irq_set_chip_and_handler(irq, &edac->irq_chip, handle_simple_irq);
-	irq_set_chip_data(irq, edac);
-	irq_set_noprobe(irq);
-
-	return 0;
-}
-
-static const struct irq_domain_ops s10_eccmgr_ic_ops = {
-	.map = s10_eccmgr_irqdomain_map,
-	.xlate = irq_domain_xlate_twocell,
-};
-
-static int altr_edac_s10_probe(struct platform_device *pdev)
-{
-	struct altr_stratix10_edac *edac;
-	struct device_node *child;
-	int dberror, err_addr;
-
-	edac = devm_kzalloc(&pdev->dev, sizeof(*edac), GFP_KERNEL);
-	if (!edac)
-		return -ENOMEM;
-
-	edac->dev = &pdev->dev;
-	platform_set_drvdata(pdev, edac);
-	INIT_LIST_HEAD(&edac->s10_ecc_devices);
-
-	edac->irq_chip.name = pdev->dev.of_node->name;
-	edac->irq_chip.irq_mask = s10_eccmgr_irq_mask;
-	edac->irq_chip.irq_unmask = s10_eccmgr_irq_unmask;
-	edac->domain = irq_domain_add_linear(pdev->dev.of_node, 64,
-					     &s10_eccmgr_ic_ops, edac);
-	if (!edac->domain) {
-		dev_err(&pdev->dev, "Error adding IRQ domain\n");
-		return -ENOMEM;
-	}
-
-	edac->sb_irq = platform_get_irq(pdev, 0);
-	if (edac->sb_irq < 0) {
-		dev_err(&pdev->dev, "No SBERR IRQ resource\n");
-		return edac->sb_irq;
-	}
-
-	irq_set_chained_handler_and_data(edac->sb_irq,
-					 altr_edac_s10_irq_handler,
-					 edac);
-
-	edac->panic_notifier.notifier_call = s10_edac_dberr_handler;
-	atomic_notifier_chain_register(&panic_notifier_list,
-				       &edac->panic_notifier);
-
-	/* Printout a message if uncorrectable error previously. */
-	s10_protected_reg_read(edac, S10_SYSMGR_UE_VAL_OFST, &dberror);
-	if (dberror) {
-		s10_protected_reg_read(edac, S10_SYSMGR_UE_ADDR_OFST,
-				       &err_addr);
-		edac_printk(KERN_ERR, EDAC_DEVICE,
-			    "Previous Boot UE detected[0x%X] @ 0x%X\n",
-			    dberror, err_addr);
-		/* Reset the sticky registers */
-		s10_protected_reg_write(edac, S10_SYSMGR_UE_VAL_OFST, 0);
-		s10_protected_reg_write(edac, S10_SYSMGR_UE_ADDR_OFST, 0);
-	}
-
-	for_each_child_of_node(pdev->dev.of_node, child) {
-		if (!of_device_is_available(child))
-			continue;
-
-		if (of_device_is_compatible(child, "altr,sdram-edac-s10"))
-			of_platform_populate(pdev->dev.of_node,
-					     altr_sdram_ctrl_of_match,
-					     NULL, &pdev->dev);
-	}
-
-	return 0;
-}
-
-static const struct of_device_id altr_edac_s10_of_match[] = {
-	{ .compatible = "altr,socfpga-s10-ecc-manager" },
-	{},
-};
-MODULE_DEVICE_TABLE(of, altr_edac_s10_of_match);
-
-static struct platform_driver altr_edac_s10_driver = {
-	.probe =  altr_edac_s10_probe,
-	.driver = {
-		.name = "socfpga_s10_ecc_manager",
-		.of_match_table = altr_edac_s10_of_match,
-	},
-};
-module_platform_driver(altr_edac_s10_driver);
-
 MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR("Thor Thayer");
 MODULE_DESCRIPTION("EDAC Driver for Altera Memories");
diff --git a/drivers/edac/altera_edac.h b/drivers/edac/altera_edac.h
index 81f0554e09de..d925c4cee01b 100644
--- a/drivers/edac/altera_edac.h
+++ b/drivers/edac/altera_edac.h
@@ -370,6 +370,7 @@ struct altr_arria10_edac {
 	struct irq_domain	*domain;
 	struct irq_chip		irq_chip;
 	struct list_head	a10_ecc_devices;
+	struct notifier_block	panic_notifier;
 };
 
 /*
@@ -437,13 +438,4 @@ struct altr_arria10_edac {
 #define INTEL_SIP_SMC_REG_WRITE \
 	INTEL_SIP_SMC_FAST_CALL_VAL(INTEL_SIP_SMC_FUNCID_REG_WRITE)
 
-struct altr_stratix10_edac {
-	struct device		*dev;
-	int sb_irq;
-	struct irq_domain	*domain;
-	struct irq_chip		irq_chip;
-	struct list_head	s10_ecc_devices;
-	struct notifier_block	panic_notifier;
-};
-
 #endif	/* #ifndef _ALTERA_EDAC_H */
-- 
2.7.4
