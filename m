From: York Sun <york.sun@nxp.com>
Subject: [Patch v4 6/9] driver/edac/fsl_ddr: Add support of little endian
Date: Tue, 9 Aug 2016 14:55:43 -0700
Message-ID: <1470779760-16483-7-git-send-email-york.sun@nxp.com>
References: <1470779760-16483-1-git-send-email-york.sun@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1470779760-16483-1-git-send-email-york.sun@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-edac@vger.kernel.org
Cc: morbidrsa@gmail.com, oss@buserror.net, stuart.yoder@nxp.com, bp@alien8.de, York Sun <york.sun@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Doug Thompson <dougthompson@xmission.com>, mchehab@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Get endianness from device tree. Both big endian and little endian
are supported. Default to big endian for backward compatibility to
MPC85xx.

Signed-off-by: York Sun <york.sun@nxp.com>

---
Change log
  v4: Absorb name changes by "Rename macros and names"
      Drop testing for big-endian as suggested
      Use of_property_read_bool() as suggested
  v3: no change
  v2: Separated from "Add support for ARM-based SoCs" patch

 .../fsl/ddr.txt}                                   |  2 +
 drivers/edac/fsl_ddr_edac.c                        | 96 +++++++++++++---------
 2 files changed, 58 insertions(+), 40 deletions(-)
 rename Documentation/devicetree/bindings/{powerpc/fsl/mem-ctrlr.txt => memory-controllers/fsl/ddr.txt} (86%)

diff --git a/Documentation/devicetree/bindings/powerpc/fsl/mem-ctrlr.txt b/Documentation/devicetree/bindings/memory-controllers/fsl/ddr.txt
similarity index 86%
rename from Documentation/devicetree/bindings/powerpc/fsl/mem-ctrlr.txt
rename to Documentation/devicetree/bindings/memory-controllers/fsl/ddr.txt
index f87856f..dde6d83 100644
--- a/Documentation/devicetree/bindings/powerpc/fsl/mem-ctrlr.txt
+++ b/Documentation/devicetree/bindings/memory-controllers/fsl/ddr.txt
@@ -7,6 +7,8 @@ Properties:
 		  "fsl,qoriq-memory-controller".
 - reg		: Address and size of DDR controller registers
 - interrupts	: Error interrupt of DDR controller
+- little-endian	: Specifies little-endian access to registers
+		  If omitted, big-endian will be used.
 
 Example 1:
 
diff --git a/drivers/edac/fsl_ddr_edac.c b/drivers/edac/fsl_ddr_edac.c
index 46b00e1..6d4dd84 100644
--- a/drivers/edac/fsl_ddr_edac.c
+++ b/drivers/edac/fsl_ddr_edac.c
@@ -13,7 +13,6 @@
  * the terms of the GNU General Public License version 2. This program
  * is licensed "as is" without any warranty of any kind, whether express
  * or implied.
- *
  */
 #include <linux/module.h>
 #include <linux/init.h>
@@ -37,6 +36,20 @@ static int edac_mc_idx;
 
 static u32 orig_ddr_err_disable;
 static u32 orig_ddr_err_sbe;
+static bool little_endian;
+
+static inline u32 ddr_in32(void __iomem *addr)
+{
+	return little_endian ? ioread32(addr) : ioread32be(addr);
+}
+
+static inline void ddr_out32(void __iomem *addr, u32 value)
+{
+	if (little_endian)
+		iowrite32(value, addr);
+	else
+		iowrite32be(value, addr);
+}
 
 /************************ MC SYSFS parts ***********************************/
 
@@ -49,8 +62,7 @@ static ssize_t fsl_mc_inject_data_hi_show(struct device *dev,
 	struct mem_ctl_info *mci = to_mci(dev);
 	struct fsl_mc_pdata *pdata = mci->pvt_info;
 	return sprintf(data, "0x%08x",
-		       in_be32(pdata->mc_vbase +
-			       FSL_MC_DATA_ERR_INJECT_HI));
+		       ddr_in32(pdata->mc_vbase + FSL_MC_DATA_ERR_INJECT_HI));
 }
 
 static ssize_t fsl_mc_inject_data_lo_show(struct device *dev,
@@ -60,8 +72,7 @@ static ssize_t fsl_mc_inject_data_lo_show(struct device *dev,
 	struct mem_ctl_info *mci = to_mci(dev);
 	struct fsl_mc_pdata *pdata = mci->pvt_info;
 	return sprintf(data, "0x%08x",
-		       in_be32(pdata->mc_vbase +
-			       FSL_MC_DATA_ERR_INJECT_LO));
+		       ddr_in32(pdata->mc_vbase + FSL_MC_DATA_ERR_INJECT_LO));
 }
 
 static ssize_t fsl_mc_inject_ctrl_show(struct device *dev,
@@ -71,7 +82,7 @@ static ssize_t fsl_mc_inject_ctrl_show(struct device *dev,
 	struct mem_ctl_info *mci = to_mci(dev);
 	struct fsl_mc_pdata *pdata = mci->pvt_info;
 	return sprintf(data, "0x%08x",
-		       in_be32(pdata->mc_vbase + FSL_MC_ECC_ERR_INJECT));
+		       ddr_in32(pdata->mc_vbase + FSL_MC_ECC_ERR_INJECT));
 }
 
 static ssize_t fsl_mc_inject_data_hi_store(struct device *dev,
@@ -81,8 +92,8 @@ static ssize_t fsl_mc_inject_data_hi_store(struct device *dev,
 	struct mem_ctl_info *mci = to_mci(dev);
 	struct fsl_mc_pdata *pdata = mci->pvt_info;
 	if (isdigit(*data)) {
-		out_be32(pdata->mc_vbase + FSL_MC_DATA_ERR_INJECT_HI,
-			 simple_strtoul(data, NULL, 0));
+		ddr_out32(pdata->mc_vbase + FSL_MC_DATA_ERR_INJECT_HI,
+			  simple_strtoul(data, NULL, 0));
 		return count;
 	}
 	return 0;
@@ -95,8 +106,8 @@ static ssize_t fsl_mc_inject_data_lo_store(struct device *dev,
 	struct mem_ctl_info *mci = to_mci(dev);
 	struct fsl_mc_pdata *pdata = mci->pvt_info;
 	if (isdigit(*data)) {
-		out_be32(pdata->mc_vbase + FSL_MC_DATA_ERR_INJECT_LO,
-			 simple_strtoul(data, NULL, 0));
+		ddr_out32(pdata->mc_vbase + FSL_MC_DATA_ERR_INJECT_LO,
+			  simple_strtoul(data, NULL, 0));
 		return count;
 	}
 	return 0;
@@ -109,8 +120,8 @@ static ssize_t fsl_mc_inject_ctrl_store(struct device *dev,
 	struct mem_ctl_info *mci = to_mci(dev);
 	struct fsl_mc_pdata *pdata = mci->pvt_info;
 	if (isdigit(*data)) {
-		out_be32(pdata->mc_vbase + FSL_MC_ECC_ERR_INJECT,
-			 simple_strtoul(data, NULL, 0));
+		ddr_out32(pdata->mc_vbase + FSL_MC_ECC_ERR_INJECT,
+			  simple_strtoul(data, NULL, 0));
 		return count;
 	}
 	return 0;
@@ -256,7 +267,7 @@ static void fsl_mc_check(struct mem_ctl_info *mci)
 	int bad_data_bit;
 	int bad_ecc_bit;
 
-	err_detect = in_be32(pdata->mc_vbase + FSL_MC_ERR_DETECT);
+	err_detect = ddr_in32(pdata->mc_vbase + FSL_MC_ERR_DETECT);
 	if (!err_detect)
 		return;
 
@@ -265,23 +276,23 @@ static void fsl_mc_check(struct mem_ctl_info *mci)
 
 	/* no more processing if not ECC bit errors */
 	if (!(err_detect & (DDR_EDE_SBE | DDR_EDE_MBE))) {
-		out_be32(pdata->mc_vbase + FSL_MC_ERR_DETECT, err_detect);
+		ddr_out32(pdata->mc_vbase + FSL_MC_ERR_DETECT, err_detect);
 		return;
 	}
 
-	syndrome = in_be32(pdata->mc_vbase + FSL_MC_CAPTURE_ECC);
+	syndrome = ddr_in32(pdata->mc_vbase + FSL_MC_CAPTURE_ECC);
 
 	/* Mask off appropriate bits of syndrome based on bus width */
-	bus_width = (in_be32(pdata->mc_vbase + FSL_MC_DDR_SDRAM_CFG) &
-			DSC_DBW_MASK) ? 32 : 64;
+	bus_width = (ddr_in32(pdata->mc_vbase + FSL_MC_DDR_SDRAM_CFG) &
+		     DSC_DBW_MASK) ? 32 : 64;
 	if (bus_width == 64)
 		syndrome &= 0xff;
 	else
 		syndrome &= 0xffff;
 
 	err_addr = make64(
-		in_be32(pdata->mc_vbase + FSL_MC_CAPTURE_EXT_ADDRESS),
-		in_be32(pdata->mc_vbase + FSL_MC_CAPTURE_ADDRESS));
+		ddr_in32(pdata->mc_vbase + FSL_MC_CAPTURE_EXT_ADDRESS),
+		ddr_in32(pdata->mc_vbase + FSL_MC_CAPTURE_ADDRESS));
 	pfn = err_addr >> PAGE_SHIFT;
 
 	for (row_index = 0; row_index < mci->nr_csrows; row_index++) {
@@ -290,8 +301,8 @@ static void fsl_mc_check(struct mem_ctl_info *mci)
 			break;
 	}
 
-	cap_high = in_be32(pdata->mc_vbase + FSL_MC_CAPTURE_DATA_HI);
-	cap_low = in_be32(pdata->mc_vbase + FSL_MC_CAPTURE_DATA_LO);
+	cap_high = ddr_in32(pdata->mc_vbase + FSL_MC_CAPTURE_DATA_HI);
+	cap_low = ddr_in32(pdata->mc_vbase + FSL_MC_CAPTURE_DATA_LO);
 
 	/*
 	 * Analyze single-bit errors on 64-bit wide buses
@@ -337,7 +348,7 @@ static void fsl_mc_check(struct mem_ctl_info *mci)
 				     row_index, 0, -1,
 				     mci->ctl_name, "");
 
-	out_be32(pdata->mc_vbase + FSL_MC_ERR_DETECT, err_detect);
+	ddr_out32(pdata->mc_vbase + FSL_MC_ERR_DETECT, err_detect);
 }
 
 static irqreturn_t fsl_mc_isr(int irq, void *dev_id)
@@ -346,7 +357,7 @@ static irqreturn_t fsl_mc_isr(int irq, void *dev_id)
 	struct fsl_mc_pdata *pdata = mci->pvt_info;
 	u32 err_detect;
 
-	err_detect = in_be32(pdata->mc_vbase + FSL_MC_ERR_DETECT);
+	err_detect = ddr_in32(pdata->mc_vbase + FSL_MC_ERR_DETECT);
 	if (!err_detect)
 		return IRQ_NONE;
 
@@ -366,7 +377,7 @@ static void fsl_ddr_init_csrows(struct mem_ctl_info *mci)
 	u32 cs_bnds;
 	int index;
 
-	sdram_ctl = in_be32(pdata->mc_vbase + FSL_MC_DDR_SDRAM_CFG);
+	sdram_ctl = ddr_in32(pdata->mc_vbase + FSL_MC_DDR_SDRAM_CFG);
 
 	sdtype = sdram_ctl & DSC_SDTYPE_MASK;
 	if (sdram_ctl & DSC_RD_EN) {
@@ -414,8 +425,8 @@ static void fsl_ddr_init_csrows(struct mem_ctl_info *mci)
 		csrow = mci->csrows[index];
 		dimm = csrow->channels[0]->dimm;
 
-		cs_bnds = in_be32(pdata->mc_vbase + FSL_MC_CS_BNDS_0 +
-				  (index * FSL_MC_CS_BNDS_OFS));
+		cs_bnds = ddr_in32(pdata->mc_vbase + FSL_MC_CS_BNDS_0 +
+				   (index * FSL_MC_CS_BNDS_OFS));
 
 		start = (cs_bnds & 0xffff0000) >> 16;
 		end   = (cs_bnds & 0x0000ffff);
@@ -474,6 +485,12 @@ int fsl_mc_err_probe(struct platform_device *op)
 	mci->ctl_name = pdata->name;
 	mci->dev_name = pdata->name;
 
+	/*
+	 * Get the endianness of DDR controller registers.
+	 * Default is big endian.
+	 */
+	little_endian = of_property_read_bool(op->dev.of_node, "little-endian");
+
 	res = of_address_to_resource(op->dev.of_node, 0, &r);
 	if (res) {
 		pr_err("%s: Unable to get resource for MC err regs\n",
@@ -496,7 +513,7 @@ int fsl_mc_err_probe(struct platform_device *op)
 		goto err;
 	}
 
-	sdram_ctl = in_be32(pdata->mc_vbase + FSL_MC_DDR_SDRAM_CFG);
+	sdram_ctl = ddr_in32(pdata->mc_vbase + FSL_MC_DDR_SDRAM_CFG);
 	if (!(sdram_ctl & DSC_ECC_EN)) {
 		/* no ECC */
 		pr_warn("%s: No ECC DIMMs discovered\n", __func__);
@@ -523,12 +540,11 @@ int fsl_mc_err_probe(struct platform_device *op)
 	fsl_ddr_init_csrows(mci);
 
 	/* store the original error disable bits */
-	orig_ddr_err_disable =
-	    in_be32(pdata->mc_vbase + FSL_MC_ERR_DISABLE);
-	out_be32(pdata->mc_vbase + FSL_MC_ERR_DISABLE, 0);
+	orig_ddr_err_disable = ddr_in32(pdata->mc_vbase + FSL_MC_ERR_DISABLE);
+	ddr_out32(pdata->mc_vbase + FSL_MC_ERR_DISABLE, 0);
 
 	/* clear all error bits */
-	out_be32(pdata->mc_vbase + FSL_MC_ERR_DETECT, ~0);
+	ddr_out32(pdata->mc_vbase + FSL_MC_ERR_DETECT, ~0);
 
 	if (edac_mc_add_mc_with_groups(mci, fsl_ddr_dev_groups)) {
 		edac_dbg(3, "failed edac_mc_add_mc()\n");
@@ -536,15 +552,15 @@ int fsl_mc_err_probe(struct platform_device *op)
 	}
 
 	if (edac_op_state == EDAC_OPSTATE_INT) {
-		out_be32(pdata->mc_vbase + FSL_MC_ERR_INT_EN,
-			 DDR_EIE_MBEE | DDR_EIE_SBEE);
+		ddr_out32(pdata->mc_vbase + FSL_MC_ERR_INT_EN,
+			  DDR_EIE_MBEE | DDR_EIE_SBEE);
 
 		/* store the original error management threshold */
-		orig_ddr_err_sbe = in_be32(pdata->mc_vbase +
-					   FSL_MC_ERR_SBE) & 0xff0000;
+		orig_ddr_err_sbe = ddr_in32(pdata->mc_vbase +
+					    FSL_MC_ERR_SBE) & 0xff0000;
 
 		/* set threshold to 1 error per interrupt */
-		out_be32(pdata->mc_vbase + FSL_MC_ERR_SBE, 0x10000);
+		ddr_out32(pdata->mc_vbase + FSL_MC_ERR_SBE, 0x10000);
 
 		/* register interrupts */
 		pdata->irq = irq_of_parse_and_map(op->dev.of_node, 0);
@@ -586,13 +602,13 @@ int fsl_mc_err_remove(struct platform_device *op)
 	edac_dbg(0, "\n");
 
 	if (edac_op_state == EDAC_OPSTATE_INT) {
-		out_be32(pdata->mc_vbase + FSL_MC_ERR_INT_EN, 0);
 		irq_dispose_mapping(pdata->irq);
+		ddr_out32(pdata->mc_vbase + FSL_MC_ERR_INT_EN, 0);
 	}
 
-	out_be32(pdata->mc_vbase + FSL_MC_ERR_DISABLE,
-		 orig_ddr_err_disable);
-	out_be32(pdata->mc_vbase + FSL_MC_ERR_SBE, orig_ddr_err_sbe);
+	ddr_out32(pdata->mc_vbase + FSL_MC_ERR_DISABLE,
+		  orig_ddr_err_disable);
+	ddr_out32(pdata->mc_vbase + FSL_MC_ERR_SBE, orig_ddr_err_sbe);
 
 	edac_mc_del_mc(&op->dev);
 	edac_mc_free(mci);
-- 
2.7.4
