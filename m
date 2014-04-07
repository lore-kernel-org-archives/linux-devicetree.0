From: <tthayer-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 3/3] edac: altera: Add SDRAM EDAC support for CycloneV/ArriaV
Date: Mon, 7 Apr 2014 16:54:09 -0500
Message-ID: <1396907649-20212-4-git-send-email-tthayer@altera.com>
References: <1396907649-20212-1-git-send-email-tthayer@altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1396907649-20212-1-git-send-email-tthayer-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org
Cc: Thor Thayer <tthayer-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Thor Thayer <tthayer-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>

Added EDAC support for reporting ECC errors of CycloneV
and ArriaV SDRAM controller.
- The SDRAM Controller registers are used by the FPGA bridge so
  these are accessed through the syscon interface.
- The configuration of the SDRAM memory size for the EDAC framework
  is discovered from the memory node of the device tree.
- Documentation of the bindings in devicetree/bindings/arm/altera/
  socfpga-sdram-edac.txt
- Correction of single bit errors, detection of double bit errors.

Signed-off-by: Thor Thayer <tthayer-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
To: Doug Thompson <dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
 drivers/edac/Kconfig          |    9 ++
 drivers/edac/Makefile         |    2 +
 drivers/edac/altera_mc_edac.c |  360 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 371 insertions(+)
 create mode 100644 drivers/edac/altera_mc_edac.c

diff --git a/drivers/edac/Kconfig b/drivers/edac/Kconfig
index 878f090..4f4d379 100644
--- a/drivers/edac/Kconfig
+++ b/drivers/edac/Kconfig
@@ -368,4 +368,13 @@ config EDAC_OCTEON_PCI
 	  Support for error detection and correction on the
 	  Cavium Octeon family of SOCs.
 
+config EDAC_ALTERA_MC
+	bool "Altera SDRAM Memory Controller EDAC"
+	depends on EDAC_MM_EDAC && ARCH_SOCFPGA
+	help
+	  Support for error detection and correction on the
+	  Altera SDRAM memory controller. Note that the
+	  preloader must initialize the SDRAM before loading
+	  the kernel.
+
 endif # EDAC
diff --git a/drivers/edac/Makefile b/drivers/edac/Makefile
index 4154ed6..e15d05f 100644
--- a/drivers/edac/Makefile
+++ b/drivers/edac/Makefile
@@ -64,3 +64,5 @@ obj-$(CONFIG_EDAC_OCTEON_PC)		+= octeon_edac-pc.o
 obj-$(CONFIG_EDAC_OCTEON_L2C)		+= octeon_edac-l2c.o
 obj-$(CONFIG_EDAC_OCTEON_LMC)		+= octeon_edac-lmc.o
 obj-$(CONFIG_EDAC_OCTEON_PCI)		+= octeon_edac-pci.o
+
+obj-$(CONFIG_EDAC_ALTERA_MC)	        += altera_mc_edac.o
diff --git a/drivers/edac/altera_mc_edac.c b/drivers/edac/altera_mc_edac.c
new file mode 100644
index 0000000..7d15196
--- /dev/null
+++ b/drivers/edac/altera_mc_edac.c
@@ -0,0 +1,360 @@
+/*
+ *  Copyright Altera Corporation (C) 2014. All rights reserved.
+ *  Copyright 2011-2012 Calxeda, Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ *
+ * Adapted from the highbank_mc_edac driver
+ *
+ */
+#include <linux/types.h>
+#include <linux/kernel.h>
+#include <linux/ctype.h>
+#include <linux/edac.h>
+#include <linux/interrupt.h>
+#include <linux/platform_device.h>
+#include <linux/of_platform.h>
+#include <linux/uaccess.h>
+#include <linux/mfd/syscon.h>
+#include <linux/regmap.h>
+
+#include "edac_core.h"
+#include "edac_module.h"
+
+#define ALTR_EDAC_MOD_STR	"altera_edac"
+
+/* SDRAM Controller CtrlCfg Register */
+#define ALTR_SDR_CTLCFG                 0x00
+
+/* SDRAM Controller CtrlCfg Register Bit Masks */
+#define ALTR_SDR_CTLCFG_ECC_EN          0x400
+#define ALTR_SDR_CTLCFG_ECC_CORR_EN     0x800
+#define ALTR_SDR_CTLCFG_GEN_SB_ERR      0x2000
+#define ALTR_SDR_CTLCFG_GEN_DB_ERR      0x4000
+
+#define ALTR_SDR_CTLCFG_ECC_AUTO_EN     (ALTR_SDR_CTLCFG_ECC_EN | \
+					ALTR_SDR_CTLCFG_ECC_CORR_EN)
+
+/* SDRAM Controller DRAM Status Register */
+#define ALTR_SDR_DRAMSTS                0x38
+
+/* SDRAM Controller DRAM Status Register Bit Masks */
+#define ALTR_SDR_DRAMSTS_SBEERR         0x04
+#define ALTR_SDR_DRAMSTS_DBEERR         0x08
+#define ALTR_SDR_DRAMSTS_CORR_DROP      0x10
+
+/* SDRAM Controller DRAM IRQ Register */
+#define ALTR_SDR_DRAMINTR                0x3C
+
+/* SDRAM Controller DRAM IRQ Register Bit Masks */
+#define ALTR_SDR_DRAMINTR_INTREN        0x01
+#define ALTR_SDR_DRAMINTR_SBEMASK       0x02
+#define ALTR_SDR_DRAMINTR_DBEMASK       0x04
+#define ALTR_SDR_DRAMINTR_CORRDROPMASK  0x08
+#define ALTR_SDR_DRAMINTR_INTRCLR       0x10
+
+/* SDRAM Controller Single Bit Error Count Register */
+#define ALTR_SDR_SBECOUNT               0x40
+
+/* SDRAM Controller Single Bit Error Count Register Bit Masks */
+#define ALTR_SDR_SBECOUNT_COUNT         0x0F
+
+/* SDRAM Controller Double Bit Error Count Register */
+#define ALTR_SDR_DBECOUNT               0x44
+
+/* SDRAM Controller Double Bit Error Count Register Bit Masks */
+#define ALTR_SDR_DBECOUNT_COUNT         0x0F
+
+/* SDRAM Controller ECC Error Address Register */
+#define ALTR_SDR_ERRADDR                0x48
+
+/* SDRAM Controller ECC Error Address Register Bit Masks */
+#define ALTR_SDR_ERRADDR_ADDR           0xFFFFFFFF
+
+/* SDRAM Controller ECC Autocorrect Drop Count Register */
+#define ALTR_SDR_DROPCOUNT              0x4C
+
+/* SDRAM Controller ECC Autocorrect Drop Count Register Bit Masks */
+#define ALTR_SDR_DROPCOUNT_CORR         0x0F
+
+/* SDRAM Controller ECC AutoCorrect Address Register */
+#define ALTR_SDR_DROPADDR               0x50
+
+/* SDRAM Controller ECC AutoCorrect Error Address Register Bit Masks */
+#define ALTR_SDR_DROPADDR_ADDR          0xFFFFFFFF
+
+/* Altera SDRAM Memory Controller data */
+struct altr_sdram_mc_data {
+	struct regmap *mc_vbase;
+};
+
+static irqreturn_t altr_sdram_mc_err_handler(int irq, void *dev_id)
+{
+	struct mem_ctl_info *mci = dev_id;
+	struct altr_sdram_mc_data *drvdata = mci->pvt_info;
+	u32 status = 0, err_count = 0, err_addr = 0;
+
+	/* Error Address is shared by both SBE & DBE */
+	regmap_read(drvdata->mc_vbase, ALTR_SDR_ERRADDR, &err_addr);
+
+	regmap_read(drvdata->mc_vbase, ALTR_SDR_DRAMSTS, &status);
+
+	if (status & ALTR_SDR_DRAMSTS_DBEERR) {
+		regmap_read(drvdata->mc_vbase, ALTR_SDR_DBECOUNT, &err_count);
+		panic("\nEDAC: [%d Uncorrectable errors @ 0x%08X]\n",
+		      err_count, err_addr);
+	}
+	if (status & ALTR_SDR_DRAMSTS_SBEERR) {
+		regmap_read(drvdata->mc_vbase, ALTR_SDR_SBECOUNT, &err_count);
+		edac_mc_handle_error(HW_EVENT_ERR_CORRECTED, mci, err_count,
+				     err_addr >> PAGE_SHIFT,
+				     err_addr & ~PAGE_MASK, 0,
+				     0, 0, -1, mci->ctl_name, "");
+	}
+
+	regmap_write(drvdata->mc_vbase,	ALTR_SDR_DRAMINTR,
+		     (ALTR_SDR_DRAMINTR_INTRCLR | ALTR_SDR_DRAMINTR_INTREN));
+
+	return IRQ_HANDLED;
+}
+
+#ifdef CONFIG_EDAC_DEBUG
+static ssize_t altr_sdr_mc_err_inject_write(struct file *file,
+					const char __user *data,
+					size_t count, loff_t *ppos)
+{
+	struct mem_ctl_info *mci = file->private_data;
+	struct altr_sdram_mc_data *drvdata = mci->pvt_info;
+	u32 *ptemp;
+	dma_addr_t dma_handle;
+	u32 reg, read_reg = 0;
+
+	ptemp = dma_alloc_coherent(mci->pdev, 16, &dma_handle, GFP_KERNEL);
+	if (IS_ERR(ptemp)) {
+		dma_free_coherent(mci->pdev, 16, ptemp, dma_handle);
+		dev_err(mci->pdev, "**EDAC Inject: Buffer Allocation error\n");
+		return -ENOMEM;
+	}
+
+	regmap_read(drvdata->mc_vbase, ALTR_SDR_CTLCFG, &read_reg);
+	read_reg &= ~(ALTR_SDR_CTLCFG_GEN_SB_ERR | ALTR_SDR_CTLCFG_GEN_DB_ERR);
+
+	if (count == 3) {
+		dev_alert(mci->pdev, "** EDAC Inject Double bit error\n");
+		regmap_write(drvdata->mc_vbase, ALTR_SDR_CTLCFG,
+			     (read_reg | ALTR_SDR_CTLCFG_GEN_DB_ERR));
+	} else {
+		dev_alert(mci->pdev, "** EDAC Inject Single bit error\n");
+		regmap_write(drvdata->mc_vbase,	ALTR_SDR_CTLCFG,
+			     (read_reg | ALTR_SDR_CTLCFG_GEN_SB_ERR));
+	}
+
+	ptemp[0] = 0x5A5A5A5A;
+	ptemp[1] = 0xA5A5A5A5;
+	regmap_write(drvdata->mc_vbase,	ALTR_SDR_CTLCFG, read_reg);
+	/* Ensure it has been written out */
+	wmb();
+
+	reg = ptemp[0];
+	read_reg = ptemp[1];
+
+	dma_free_coherent(mci->pdev, 16, ptemp, dma_handle);
+
+	return count;
+}
+
+static const struct file_operations altr_sdr_mc_debug_inject_fops = {
+	.open = simple_open,
+	.write = altr_sdr_mc_err_inject_write,
+	.llseek = generic_file_llseek,
+};
+
+static void altr_sdr_mc_create_debugfs_nodes(struct mem_ctl_info *mci)
+{
+	if (mci->debugfs)
+		debugfs_create_file("inject_ctrl", S_IWUSR, mci->debugfs, mci,
+				    &altr_sdr_mc_debug_inject_fops);
+}
+#else
+static void altr_sdr_mc_create_debugfs_nodes(struct mem_ctl_info *mci)
+{}
+#endif
+
+/* Get total memory size from Open Firmware DTB */
+static u32 altr_sdram_get_total_mem_size(void)
+{
+	struct device_node *np;
+	u32 retcode, reg_array[2];
+
+	np = of_find_node_by_type(NULL, "memory");
+	if (!np)
+		return 0;
+
+	retcode = of_property_read_u32_array(np, "reg",
+					     reg_array, ARRAY_SIZE(reg_array));
+
+	of_node_put(np);
+
+	if (retcode)
+		return 0;
+
+	return reg_array[1];
+}
+
+static int altr_sdram_mc_probe(struct platform_device *pdev)
+{
+	struct edac_mc_layer layers[2];
+	struct mem_ctl_info *mci;
+	struct altr_sdram_mc_data *drvdata;
+	struct dimm_info *dimm;
+	u32 read_reg, mem_size;
+	int irq;
+	int res = 0, retcode;
+
+	layers[0].type = EDAC_MC_LAYER_CHIP_SELECT;
+	layers[0].size = 1;
+	layers[0].is_virt_csrow = true;
+	layers[1].type = EDAC_MC_LAYER_CHANNEL;
+	layers[1].size = 1;
+	layers[1].is_virt_csrow = false;
+	mci = edac_mc_alloc(0, ARRAY_SIZE(layers), layers,
+			    sizeof(struct altr_sdram_mc_data));
+	if (!mci)
+		return -ENOMEM;
+
+	mci->pdev = &pdev->dev;
+	drvdata = mci->pvt_info;
+	platform_set_drvdata(pdev, mci);
+
+	if (!devres_open_group(&pdev->dev, NULL, GFP_KERNEL)) {
+		edac_mc_free(mci);
+		return -ENOMEM;
+	}
+
+	/* Grab the register values from the sdr-ctl in device tree */
+	drvdata->mc_vbase = syscon_regmap_lookup_by_compatible("altr,sdr-ctl");
+	if (IS_ERR(drvdata->mc_vbase)) {
+		dev_err(&pdev->dev,
+			"regmap for altr,sdr-ctl lookup failed.\n");
+		res = -ENODEV;
+		goto err;
+	}
+
+	retcode = regmap_read(drvdata->mc_vbase, ALTR_SDR_CTLCFG, &read_reg);
+	if (retcode || ((read_reg & ALTR_SDR_CTLCFG_ECC_AUTO_EN) !=
+		ALTR_SDR_CTLCFG_ECC_AUTO_EN)) {
+		dev_err(&pdev->dev, "No ECC present / ECC disabled - 0x%08X\n",
+			read_reg);
+		res = -ENODEV;
+		goto err;
+	}
+
+	mci->mtype_cap = MEM_FLAG_DDR3;
+	mci->edac_ctl_cap = EDAC_FLAG_NONE | EDAC_FLAG_SECDED;
+	mci->edac_cap = EDAC_FLAG_SECDED;
+	mci->mod_name = ALTR_EDAC_MOD_STR;
+	mci->mod_ver = "1";
+	mci->ctl_name = dev_name(&pdev->dev);
+	mci->scrub_mode = SCRUB_SW_SRC;
+	mci->dev_name = dev_name(&pdev->dev);
+
+	/* Grab memory size from device tree. */
+	mem_size = altr_sdram_get_total_mem_size();
+	dev_dbg(&pdev->dev, "EDAC Memory Size = 0x%08x\n", mem_size);
+	dimm = *mci->dimms;
+	if (mem_size <= 0) {
+		dev_err(&pdev->dev, "Unable to find memory size (dts)\n");
+		res = -ENODEV;
+		goto err;
+	}
+	dimm->nr_pages = ((mem_size - 1) >> PAGE_SHIFT) + 1;
+	dimm->grain = 8;
+	dimm->dtype = DEV_X8;
+	dimm->mtype = MEM_DDR3;
+	dimm->edac_mode = EDAC_SECDED;
+
+	res = edac_mc_add_mc(mci);
+	if (res < 0)
+		goto err;
+
+	retcode = regmap_write(drvdata->mc_vbase, ALTR_SDR_DRAMINTR,
+			ALTR_SDR_DRAMINTR_INTRCLR);
+	if (retcode) {
+		dev_err(&pdev->dev, "Error clearing SDRAM ECC IRQ\n");
+		res = -ENODEV;
+		goto err;
+	}
+
+	irq = platform_get_irq(pdev, 0);
+	res = devm_request_irq(&pdev->dev, irq, altr_sdram_mc_err_handler,
+				0, dev_name(&pdev->dev), mci);
+	if (res < 0) {
+		dev_err(&pdev->dev, "Unable to request irq %d\n", irq);
+		res = -ENODEV;
+		goto err;
+	}
+
+	retcode = regmap_write(drvdata->mc_vbase, ALTR_SDR_DRAMINTR,
+		(ALTR_SDR_DRAMINTR_INTRCLR | ALTR_SDR_DRAMINTR_INTREN));
+	if (retcode) {
+		dev_err(&pdev->dev, "Error enabling SDRAM ECC IRQ\n");
+		res = -ENODEV;
+		goto err2;
+	}
+
+	altr_sdr_mc_create_debugfs_nodes(mci);
+
+	devres_close_group(&pdev->dev, NULL);
+
+	return 0;
+err2:
+	edac_mc_del_mc(&pdev->dev);
+err:
+	dev_err(&pdev->dev, "EDAC Probe Failed; Error %d\n", res);
+	devres_release_group(&pdev->dev, NULL);
+	edac_mc_free(mci);
+
+	return res;
+}
+
+static int altr_sdram_mc_remove(struct platform_device *pdev)
+{
+	struct mem_ctl_info *mci = platform_get_drvdata(pdev);
+
+	edac_mc_del_mc(&pdev->dev);
+	edac_mc_free(mci);
+	platform_set_drvdata(pdev, NULL);
+
+	return 0;
+}
+
+static const struct of_device_id altr_sdram_ctrl_of_match[] = {
+	{ .compatible = "altr,sdram-edac", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, altr_sdram_ctrl_of_match);
+
+static struct platform_driver altr_sdram_mc_edac_driver = {
+	.probe = altr_sdram_mc_probe,
+	.remove = altr_sdram_mc_remove,
+	.driver = {
+		.name = "altr_sdram_mc_edac",
+		.of_match_table = of_match_ptr(altr_sdram_ctrl_of_match),
+	},
+};
+
+module_platform_driver(altr_sdram_mc_edac_driver);
+
+MODULE_LICENSE("GPL v2");
+MODULE_AUTHOR("Altera Corporation");
+MODULE_DESCRIPTION("EDAC Driver for Altera SDRAM Controller");
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
