From: Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>
Subject: [PATCH] of/edac: fix build breakage in drivers
Date: Thu,  3 Jun 2010 03:17:42 +0200
Message-ID: <1275527862-1328-1-git-send-email-agust@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Fixes build errors in EDAC drivers caused by the OF
device_node pointer being moved into struct device

Signed-off-by: Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>
---
 drivers/edac/mpc85xx_edac.c |   12 ++++++------
 drivers/edac/ppc4xx_edac.c  |    6 +++---
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/edac/mpc85xx_edac.c b/drivers/edac/mpc85xx_edac.c
index 6c1886b..52ca09b 100644
--- a/drivers/edac/mpc85xx_edac.c
+++ b/drivers/edac/mpc85xx_edac.c
@@ -229,7 +229,7 @@ static int __devinit mpc85xx_pci_err_probe(struct of_device *op,
 
 	pdata->edac_idx = edac_pci_idx++;
 
-	res = of_address_to_resource(op->node, 0, &r);
+	res = of_address_to_resource(op->dev.of_node, 0, &r);
 	if (res) {
 		printk(KERN_ERR "%s: Unable to get resource for "
 		       "PCI err regs\n", __func__);
@@ -274,7 +274,7 @@ static int __devinit mpc85xx_pci_err_probe(struct of_device *op,
 	}
 
 	if (edac_op_state == EDAC_OPSTATE_INT) {
-		pdata->irq = irq_of_parse_and_map(op->node, 0);
+		pdata->irq = irq_of_parse_and_map(op->dev.of_node, 0);
 		res = devm_request_irq(&op->dev, pdata->irq,
 				       mpc85xx_pci_isr, IRQF_DISABLED,
 				       "[EDAC] PCI err", pci);
@@ -529,7 +529,7 @@ static int __devinit mpc85xx_l2_err_probe(struct of_device *op,
 	edac_dev->ctl_name = pdata->name;
 	edac_dev->dev_name = pdata->name;
 
-	res = of_address_to_resource(op->node, 0, &r);
+	res = of_address_to_resource(op->dev.of_node, 0, &r);
 	if (res) {
 		printk(KERN_ERR "%s: Unable to get resource for "
 		       "L2 err regs\n", __func__);
@@ -576,7 +576,7 @@ static int __devinit mpc85xx_l2_err_probe(struct of_device *op,
 	}
 
 	if (edac_op_state == EDAC_OPSTATE_INT) {
-		pdata->irq = irq_of_parse_and_map(op->node, 0);
+		pdata->irq = irq_of_parse_and_map(op->dev.of_node, 0);
 		res = devm_request_irq(&op->dev, pdata->irq,
 				       mpc85xx_l2_isr, IRQF_DISABLED,
 				       "[EDAC] L2 err", edac_dev);
@@ -978,7 +978,7 @@ static int __devinit mpc85xx_mc_err_probe(struct of_device *op,
 	mci->ctl_name = pdata->name;
 	mci->dev_name = pdata->name;
 
-	res = of_address_to_resource(op->node, 0, &r);
+	res = of_address_to_resource(op->dev.of_node, 0, &r);
 	if (res) {
 		printk(KERN_ERR "%s: Unable to get resource for MC err regs\n",
 		       __func__);
@@ -1052,7 +1052,7 @@ static int __devinit mpc85xx_mc_err_probe(struct of_device *op,
 		out_be32(pdata->mc_vbase + MPC85XX_MC_ERR_SBE, 0x10000);
 
 		/* register interrupts */
-		pdata->irq = irq_of_parse_and_map(op->node, 0);
+		pdata->irq = irq_of_parse_and_map(op->dev.of_node, 0);
 		res = devm_request_irq(&op->dev, pdata->irq,
 				       mpc85xx_mc_isr,
 					IRQF_DISABLED | IRQF_SHARED,
diff --git a/drivers/edac/ppc4xx_edac.c b/drivers/edac/ppc4xx_edac.c
index 9d6f678..e78839e 100644
--- a/drivers/edac/ppc4xx_edac.c
+++ b/drivers/edac/ppc4xx_edac.c
@@ -1022,7 +1022,7 @@ ppc4xx_edac_mc_init(struct mem_ctl_info *mci,
 	int status = 0;
 	const u32 memcheck = (mcopt1 & SDRAM_MCOPT1_MCHK_MASK);
 	struct ppc4xx_edac_pdata *pdata = NULL;
-	const struct device_node *np = op->node;
+	const struct device_node *np = op->dev.of_node;
 
 	if (match == NULL)
 		return -EINVAL;
@@ -1113,7 +1113,7 @@ ppc4xx_edac_register_irq(struct of_device *op, struct mem_ctl_info *mci)
 	int status = 0;
 	int ded_irq, sec_irq;
 	struct ppc4xx_edac_pdata *pdata = mci->pvt_info;
-	struct device_node *np = op->node;
+	struct device_node *np = op->dev.of_node;
 
 	ded_irq = irq_of_parse_and_map(np, INTMAP_ECCDED_INDEX);
 	sec_irq = irq_of_parse_and_map(np, INTMAP_ECCSEC_INDEX);
@@ -1243,7 +1243,7 @@ ppc4xx_edac_probe(struct of_device *op, const struct of_device_id *match)
 	int status = 0;
 	u32 mcopt1, memcheck;
 	dcr_host_t dcr_host;
-	const struct device_node *np = op->node;
+	const struct device_node *np = op->dev.of_node;
 	struct mem_ctl_info *mci = NULL;
 	static int ppc4xx_edac_instance;
 
-- 
1.7.0.4
