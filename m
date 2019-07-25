Return-Path: <SRS0=mZ85=VW=outlook.com=leiwang_git@kernel.org>
From: Lei Wang <leiwang_git@outlook.com>
Subject: [PATCH v5 2/2] EDAC: add EDAC driver for DMC520
Date: Thu, 25 Jul 2019 00:49:27 +0000
Message-ID: 
 <BN6PR04MB1107CE3C2D666A806E62851B86C10@BN6PR04MB1107.namprd04.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: "bp@alien8.de" <bp@alien8.de>, "james.morse@arm.com" <james.morse@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "sashal@kernel.org" <sashal@kernel.org>, "hangl@microsoft.com" <hangl@microsoft.com>, "lewan@microsoft.com" <lewan@microsoft.com>, "ruizhao@microsoft.com" <ruizhao@microsoft.com>, Lei Wang <leiwang_git@outlook.com>
List-ID: <devicetree@vger.kernel.org>

New driver supports error detection and correction on the devices with ARM
DMC-520 memory controller.

Signed-off-by: Lei Wang <leiwang_git@outlook.com>
Reviewed-by: James Morse <james.morse@arm.com>
---
    Changes in v5:
        - When enable configured interrupts, do not potentially disable
          other irrelevant interrupts.
        - fix return type of dmc520_get_scrub_type to enum scrub_type
        - Use capital letters for enum
        - Retrieve memory width from dmc register format_control
        - use cheaper spin_lock API.
        - Remove compatible line for "brcm,dmc-520"
        - Add James' Reviewed-by
---
 MAINTAINERS                |   6 +
 drivers/edac/Kconfig       |   7 +
 drivers/edac/Makefile      |   1 +
 drivers/edac/dmc520_edac.c | 632 +++++++++++++++++++++++++++++++++++++
 4 files changed, 646 insertions(+)
 create mode 100644 drivers/edac/dmc520_edac.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 77eae44bf5de..7c1ac8bc8ea1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5703,6 +5703,12 @@ F:	Documentation/driver-api/edac.rst
 F:	drivers/edac/
 F:	include/linux/edac.h
=20
+EDAC-DMC520
+M:	Lei Wang <lewan@microsoft.com>
+L:	linux-edac@vger.kernel.org
+S:	Supported
+F:	drivers/edac/dmc520_edac.c
+
 EDAC-E752X
 M:	Mark Gross <mark.gross@intel.com>
 L:	linux-edac@vger.kernel.org
diff --git a/drivers/edac/Kconfig b/drivers/edac/Kconfig
index 200c04ce5b0e..7fde5aea0c1a 100644
--- a/drivers/edac/Kconfig
+++ b/drivers/edac/Kconfig
@@ -510,4 +510,11 @@ config EDAC_ASPEED
 	  First, ECC must be configured in the bootloader. Then, this driver
 	  will expose error counters via the EDAC kernel framework.
=20
+config EDAC_DMC520
+       tristate "ARM DMC-520 ECC"
+       depends on ARM64
+       help
+         Support for error detection and correction on the
+         SoCs with ARM DMC-520 DRAM controller.
+
 endif # EDAC
diff --git a/drivers/edac/Makefile b/drivers/edac/Makefile
index 165ca65e1a3a..e0d98f5b2045 100644
--- a/drivers/edac/Makefile
+++ b/drivers/edac/Makefile
@@ -85,3 +85,4 @@ obj-$(CONFIG_EDAC_XGENE)		+=3D xgene_edac.o
 obj-$(CONFIG_EDAC_TI)			+=3D ti_edac.o
 obj-$(CONFIG_EDAC_QCOM)			+=3D qcom_edac.o
 obj-$(CONFIG_EDAC_ASPEED)		+=3D aspeed_edac.o
+obj-$(CONFIG_EDAC_DMC520)		+=3D dmc520_edac.o
diff --git a/drivers/edac/dmc520_edac.c b/drivers/edac/dmc520_edac.c
new file mode 100644
index 000000000000..aeb8d84405cf
--- /dev/null
+++ b/drivers/edac/dmc520_edac.c
@@ -0,0 +1,632 @@
+// SPDX-License-Identifier: GPL-2.0
+/* EDAC driver for DMC-520 */
+
+
+#include <linux/bitfield.h>
+#include <linux/edac.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/spinlock.h>
+#include "edac_mc.h"
+
+/* DMC-520 registers */
+#define REG_OFFSET_FEATURE_CONFIG		0x130
+#define REG_OFFSET_ECC_ERRC_COUNT_31_00		0x158
+#define REG_OFFSET_ECC_ERRC_COUNT_63_32		0x15C
+#define REG_OFFSET_ECC_ERRD_COUNT_31_00		0x160
+#define REG_OFFSET_ECC_ERRD_COUNT_63_32		0x164
+#define REG_OFFSET_INTERRUPT_CONTROL		0x500
+#define REG_OFFSET_INTERRUPT_CLR		0x508
+#define REG_OFFSET_INTERRUPT_STATUS		0x510
+#define REG_OFFSET_DRAM_ECC_ERRC_INT_INFO_31_00	0x528
+#define REG_OFFSET_DRAM_ECC_ERRC_INT_INFO_63_32	0x52C
+#define REG_OFFSET_DRAM_ECC_ERRD_INT_INFO_31_00	0x530
+#define REG_OFFSET_DRAM_ECC_ERRD_INT_INFO_63_32	0x534
+#define REG_OFFSET_ADDRESS_CONTROL_NOW		0x1010
+#define REG_OFFSET_MEMORY_TYPE_NOW		0x1128
+#define REG_OFFSET_SCRUB_CONTROL0_NOW		0x1170
+#define REG_OFFSET_FORMAT_CONTROL	0x18
+
+/* DMC-520 types, masks and bitfields */
+#define DRAM_ECC_INT_CE_BIT			BIT(2)
+#define DRAM_ECC_INT_UE_BIT			BIT(3)
+#define ALL_INT_MASK				GENMASK(9, 0)
+#define MEMORY_WIDTH_MASK			GENMASK(1, 0)
+#define SCRUB_TRIGGER0_NEXT_MASK		GENMASK(1, 0)
+#define REG_FIELD_DRAM_ECC_ENABLED		GENMASK(1, 0)
+#define REG_FIELD_MEMORY_TYPE			GENMASK(2, 0)
+#define REG_FIELD_DEVICE_WIDTH			GENMASK(9, 8)
+#define REG_FIELD_ADDRESS_CONTROL_COL		GENMASK(2, 0)
+#define REG_FIELD_ADDRESS_CONTROL_ROW		GENMASK(10, 8)
+#define REG_FIELD_ADDRESS_CONTROL_BANK		GENMASK(18, 16)
+#define REG_FIELD_ADDRESS_CONTROL_RANK		GENMASK(25, 24)
+#define REG_FIELD_ERR_INFO_LOW_VALID		BIT(0)
+#define REG_FIELD_ERR_INFO_LOW_COL		GENMASK(10, 1)
+#define REG_FIELD_ERR_INFO_LOW_ROW		GENMASK(28, 11)
+#define REG_FIELD_ERR_INFO_LOW_RANK		GENMASK(31, 29)
+#define REG_FIELD_ERR_INFO_HIGH_BANK		GENMASK(3, 0)
+#define REG_FIELD_ERR_INFO_HIGH_VALID		BIT(31)
+
+#define DRAM_ADDRESS_CONTROL_MIN_COL_BITS	8
+#define DRAM_ADDRESS_CONTROL_MIN_ROW_BITS	11
+
+#define DMC520_SCRUB_TRIGGER_ERR_DETECT		2
+#define DMC520_SCRUB_TRIGGER_IDLE			3
+
+/* Driver settings */
+/* The max-length message would be: "rank:7 bank:15 row:262143 col:1023".
+ * Max length is 34. Using a 40-size buffer is enough.
+ */
+#define EDAC_MSG_BUF_SIZE			40
+#define EDAC_MOD_NAME				"dmc520-edac"
+#define EDAC_CTL_NAME				"dmc520"
+
+/* the data bus width for the attached memory chips. */
+enum dmc520_mem_width {
+	MEM_WIDTH_X32 =3D 2,
+	MEM_WIDTH_X64 =3D 3
+};
+
+/* memory type */
+enum dmc520_mem_type {
+	MEM_TYPE_DDR3 =3D 1,
+	MEM_TYPE_DDR4 =3D 2
+};
+
+/* memory device width */
+enum dmc520_dev_width {
+	DEV_WIDTH_X4 =3D 0,
+	DEV_WIDTH_X8 =3D 1,
+	DEV_WIDTH_X16 =3D 2
+};
+
+struct ecc_error_info {
+	u32 col;
+	u32 row;
+	u32 bank;
+	u32 rank;
+};
+
+/* The EDAC driver private data */
+struct dmc520_edac {
+	void __iomem *reg_base;
+	u32 nintr;
+	u32 interrupt_mask_all;
+	spinlock_t ecc_lock;
+	u32 interrupt_masks[0];
+};
+
+static int dmc520_mc_idx;
+
+static irqreturn_t
+dmc520_edac_dram_all_isr(int irq, struct mem_ctl_info *mci, u32 interrupt_=
mask);
+
+#define DECLARE_ISR(index) \
+static irqreturn_t dmc520_isr_##index (int irq, void *data) \
+{ \
+	struct mem_ctl_info *mci; \
+	struct dmc520_edac *edac; \
+	mci =3D data; \
+	edac =3D mci->pvt_info; \
+	return dmc520_edac_dram_all_isr(irq, mci, edac->interrupt_masks[index]); =
\
+}
+
+DECLARE_ISR(0)
+DECLARE_ISR(1)
+/* More DECLARE_ISR(index) can be added to support more interrupt lines. *=
/
+
+irq_handler_t dmc520_isr_array[] =3D {
+	dmc520_isr_0,
+	dmc520_isr_1
+	/* More dmc520_isr_index can be added to support more interrupt lines. */
+};
+
+static u32 dmc520_read_reg(struct dmc520_edac *edac, u32 offset)
+{
+	return readl(edac->reg_base + offset);
+}
+
+static void dmc520_write_reg(struct dmc520_edac *edac, u32 val, u32 offset=
)
+{
+	writel(val, edac->reg_base + offset);
+}
+
+static u32 dmc520_calc_dram_ecc_error(u32 value)
+{
+	u32 total =3D 0;
+
+	/* Each rank's error counter takes one byte */
+	while (value > 0) {
+		total +=3D (value & 0xFF);
+		value >>=3D 8;
+	}
+	return total;
+}
+
+static u32 dmc520_get_dram_ecc_error_count(struct dmc520_edac *edac,
+					   bool is_ce)
+{
+	u32 reg_offset_low, reg_offset_high;
+	u32 err_low, err_high;
+	u32 err_count;
+
+	reg_offset_low =3D is_ce ? REG_OFFSET_ECC_ERRC_COUNT_31_00 :
+				 REG_OFFSET_ECC_ERRD_COUNT_31_00;
+	reg_offset_high =3D is_ce ? REG_OFFSET_ECC_ERRC_COUNT_63_32 :
+				  REG_OFFSET_ECC_ERRD_COUNT_63_32;
+
+	err_low =3D dmc520_read_reg(edac, reg_offset_low);
+	err_high =3D dmc520_read_reg(edac, reg_offset_high);
+	/* Reset error counters */
+	dmc520_write_reg(edac, 0, reg_offset_low);
+	dmc520_write_reg(edac, 0, reg_offset_high);
+
+	err_count =3D dmc520_calc_dram_ecc_error(err_low) +
+		   dmc520_calc_dram_ecc_error(err_high);
+
+	return err_count;
+}
+
+static void dmc520_get_dram_ecc_error_info(struct dmc520_edac *edac,
+					   bool is_ce,
+					   struct ecc_error_info *info)
+{
+	u32 reg_offset_low, reg_offset_high;
+	u32 reg_val_low, reg_val_high;
+	bool valid;
+
+	reg_offset_low =3D is_ce ? REG_OFFSET_DRAM_ECC_ERRC_INT_INFO_31_00 :
+				 REG_OFFSET_DRAM_ECC_ERRD_INT_INFO_31_00;
+	reg_offset_high =3D is_ce ? REG_OFFSET_DRAM_ECC_ERRC_INT_INFO_63_32 :
+				  REG_OFFSET_DRAM_ECC_ERRD_INT_INFO_63_32;
+
+	reg_val_low =3D dmc520_read_reg(edac, reg_offset_low);
+	reg_val_high =3D dmc520_read_reg(edac, reg_offset_high);
+
+	valid =3D (FIELD_GET(REG_FIELD_ERR_INFO_LOW_VALID, reg_val_low) !=3D 0) &=
&
+		(FIELD_GET(REG_FIELD_ERR_INFO_HIGH_VALID, reg_val_high) !=3D 0);
+
+	if (valid) {
+		info->col =3D FIELD_GET(REG_FIELD_ERR_INFO_LOW_COL, reg_val_low);
+		info->row =3D FIELD_GET(REG_FIELD_ERR_INFO_LOW_ROW, reg_val_low);
+		info->rank =3D FIELD_GET(REG_FIELD_ERR_INFO_LOW_RANK, reg_val_low);
+		info->bank =3D FIELD_GET(REG_FIELD_ERR_INFO_HIGH_BANK, reg_val_high);
+	} else {
+		memset(info, 0, sizeof(struct ecc_error_info));
+	}
+}
+
+static bool dmc520_is_ecc_enabled(void __iomem *reg_base)
+{
+	u32 reg_val =3D readl(reg_base + REG_OFFSET_FEATURE_CONFIG);
+
+	return (FIELD_GET(REG_FIELD_DRAM_ECC_ENABLED, reg_val) !=3D 0);
+}
+
+static enum scrub_type dmc520_get_scrub_type(struct dmc520_edac *edac)
+{
+	enum scrub_type type =3D SCRUB_NONE;
+	u32 reg_val, scrub_cfg;
+
+	reg_val =3D dmc520_read_reg(edac, REG_OFFSET_SCRUB_CONTROL0_NOW);
+	scrub_cfg =3D FIELD_GET(SCRUB_TRIGGER0_NEXT_MASK, reg_val);
+
+	if (DMC520_SCRUB_TRIGGER_ERR_DETECT =3D=3D scrub_cfg ||
+		DMC520_SCRUB_TRIGGER_IDLE =3D=3D scrub_cfg)
+		type =3D SCRUB_HW_PROG;
+
+	return type;
+}
+
+/* Get the memory data bus width, in number of bytes. */
+static u32 dmc520_get_memory_width(struct dmc520_edac *edac)
+{
+	static u32 mem_width;
+	u32 reg_val;
+	enum dmc520_mem_width mem_width_field;
+
+	if (mem_width =3D=3D 0) {
+		reg_val =3D dmc520_read_reg(edac, REG_OFFSET_FORMAT_CONTROL);
+		mem_width_field =3D FIELD_GET(MEMORY_WIDTH_MASK, reg_val);
+
+		if (mem_width_field =3D=3D MEM_WIDTH_X32)
+			mem_width =3D 4; /* 32-bits, 4 bytes */
+		else if (mem_width_field =3D=3D MEM_WIDTH_X64)
+			mem_width =3D 8; /* 64-bits, 8 bytes */
+	}
+
+	return mem_width;
+}
+
+static enum mem_type dmc520_get_mtype(struct dmc520_edac *edac)
+{
+	enum mem_type mt =3D MEM_UNKNOWN;
+	u32 reg_val;
+	enum dmc520_mem_type type;
+
+	reg_val =3D dmc520_read_reg(edac, REG_OFFSET_MEMORY_TYPE_NOW);
+	type =3D FIELD_GET(REG_FIELD_MEMORY_TYPE, reg_val);
+
+	switch (type) {
+	case MEM_TYPE_DDR3:
+		mt =3D MEM_DDR3;
+		break;
+
+	case MEM_TYPE_DDR4:
+		mt =3D MEM_DDR4;
+		break;
+	}
+
+	return mt;
+}
+
+static enum dev_type dmc520_get_dtype(struct dmc520_edac *edac)
+{
+	enum dev_type dt =3D DEV_UNKNOWN;
+	u32 reg_val;
+	enum dmc520_dev_width device_width;
+
+	reg_val =3D dmc520_read_reg(edac, REG_OFFSET_MEMORY_TYPE_NOW);
+	device_width =3D FIELD_GET(REG_FIELD_DEVICE_WIDTH, reg_val);
+
+	switch (device_width) {
+	case DEV_WIDTH_X4:
+		dt =3D DEV_X4;
+		break;
+
+	case DEV_WIDTH_X8:
+		dt =3D DEV_X8;
+		break;
+
+	case DEV_WIDTH_X16:
+		dt =3D DEV_X16;
+		break;
+	}
+
+	return dt;
+}
+
+static u32 dmc520_get_rank_count(void __iomem *reg_base)
+{
+	u32 reg_val, rank_bits;
+
+	reg_val =3D readl(reg_base + REG_OFFSET_ADDRESS_CONTROL_NOW);
+	rank_bits =3D FIELD_GET(REG_FIELD_ADDRESS_CONTROL_RANK, reg_val);
+
+	return (1 << rank_bits);
+}
+
+static u64 dmc520_get_rank_size(struct dmc520_edac *edac)
+{
+	u32 reg_val, col_bits, row_bits, bank_bits;
+
+	reg_val =3D dmc520_read_reg(edac, REG_OFFSET_ADDRESS_CONTROL_NOW);
+
+	col_bits =3D FIELD_GET(REG_FIELD_ADDRESS_CONTROL_COL, reg_val) +
+		   DRAM_ADDRESS_CONTROL_MIN_COL_BITS;
+	row_bits =3D FIELD_GET(REG_FIELD_ADDRESS_CONTROL_ROW, reg_val) +
+		   DRAM_ADDRESS_CONTROL_MIN_ROW_BITS;
+	bank_bits =3D FIELD_GET(REG_FIELD_ADDRESS_CONTROL_BANK, reg_val);
+
+	return (u64)dmc520_get_memory_width(edac) << (col_bits + row_bits + bank_=
bits);
+}
+
+static void dmc520_handle_dram_ecc_errors(struct mem_ctl_info *mci,
+					  bool is_ce)
+{
+	struct ecc_error_info info;
+	struct dmc520_edac *edac;
+	u32 cnt;
+	char message[EDAC_MSG_BUF_SIZE];
+
+	edac =3D mci->pvt_info;
+	dmc520_get_dram_ecc_error_info(edac, is_ce, &info);
+
+	cnt =3D dmc520_get_dram_ecc_error_count(edac, is_ce);
+
+	if (cnt > 0) {
+		snprintf(message, ARRAY_SIZE(message),
+			 "rank:%d bank:%d row:%d col:%d",
+			 info.rank, info.bank,
+			 info.row, info.col);
+
+		spin_lock(&edac->ecc_lock);
+		edac_mc_handle_error((is_ce ? HW_EVENT_ERR_CORRECTED :
+				     HW_EVENT_ERR_UNCORRECTED),
+				     mci, cnt, 0, 0, 0, info.rank, -1, -1,
+				     message, "");
+		spin_unlock(&edac->ecc_lock);
+	}
+}
+
+static irqreturn_t dmc520_edac_dram_ecc_isr(int irq, struct mem_ctl_info *=
mci, bool is_ce)
+{
+	u32 i_mask;
+	struct dmc520_edac *edac;
+
+	edac =3D mci->pvt_info;
+
+	i_mask =3D is_ce ? DRAM_ECC_INT_CE_BIT : DRAM_ECC_INT_UE_BIT;
+
+	dmc520_handle_dram_ecc_errors(mci, is_ce);
+
+	dmc520_write_reg(edac, i_mask, REG_OFFSET_INTERRUPT_CLR);
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t
+dmc520_edac_dram_all_isr(int irq, struct mem_ctl_info *mci, u32 interrupt_=
mask)
+{
+	struct dmc520_edac *edac;
+	u32 status;
+	irqreturn_t irq_ret =3D IRQ_NONE;
+
+	edac =3D mci->pvt_info;
+
+	status =3D dmc520_read_reg(edac, REG_OFFSET_INTERRUPT_STATUS);
+
+	if ((interrupt_mask & DRAM_ECC_INT_CE_BIT) &&
+		(status & DRAM_ECC_INT_CE_BIT))
+		irq_ret =3D dmc520_edac_dram_ecc_isr(irq, mci, true);
+
+	if ((interrupt_mask & DRAM_ECC_INT_UE_BIT) &&
+		(status & DRAM_ECC_INT_UE_BIT))
+		irq_ret =3D dmc520_edac_dram_ecc_isr(irq, mci, false);
+
+	/* If in the future there are more supported interrupts in a different
+	 * platform, more condition statements can be added here for each
+	 * interrupt flag, together with its corresponding isr implementations.
+	 */
+
+	return irq_ret;
+}
+
+static void dmc520_init_csrow(struct mem_ctl_info *mci)
+{
+	struct csrow_info *csi;
+	struct dimm_info *dimm;
+	int row, ch;
+	enum dev_type dt;
+	enum mem_type mt;
+	u64 rs;
+	u32 pages_per_rank;
+	struct dmc520_edac *edac =3D mci->pvt_info;
+
+	dt =3D dmc520_get_dtype(edac);
+	mt =3D dmc520_get_mtype(edac);
+	rs =3D dmc520_get_rank_size(edac);
+	pages_per_rank =3D rs >> PAGE_SHIFT;
+
+	for (row =3D 0; row < mci->nr_csrows; row++) {
+		csi =3D mci->csrows[row];
+
+		for (ch =3D 0; ch < csi->nr_channels; ch++) {
+			dimm		=3D csi->channels[ch]->dimm;
+			dimm->grain	=3D dmc520_get_memory_width(edac);
+			dimm->dtype	=3D dt;
+			dimm->mtype	=3D mt;
+			dimm->edac_mode	=3D EDAC_FLAG_SECDED;
+			dimm->nr_pages	=3D pages_per_rank / csi->nr_channels;
+		}
+	}
+}
+
+static int dmc520_edac_probe(struct platform_device *pdev)
+{
+	struct device *dev;
+	struct dmc520_edac *edac;
+	struct mem_ctl_info *mci;
+	struct edac_mc_layer layers[1];
+	int ret, intr_index, nintr, nintr_registered =3D 0;
+	struct resource *res;
+	void __iomem *reg_base;
+	u32 reg_val;
+
+	/* Parsing the device node */
+	dev =3D &pdev->dev;
+
+	nintr =3D of_property_count_u32_elems(dev->of_node, "interrupt-config");
+	if (nintr <=3D 0) {
+		edac_printk(KERN_ERR, EDAC_MOD_NAME,
+			"Invalid device node configuration: at least one interrupt "
+			"line & config is expected.\n");
+		return -EINVAL;
+	}
+
+	if (nintr > ARRAY_SIZE(dmc520_isr_array)) {
+		edac_printk(KERN_ERR, EDAC_MOD_NAME,
+			"Invalid device node configuration: # of interrupt config "
+			"elements (%d) can not exceed %ld.\n",
+			nintr, ARRAY_SIZE(dmc520_isr_array));
+		return -EINVAL;
+	}
+
+	/* Initialize dmc520 edac */
+	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	reg_base =3D devm_ioremap_resource(dev, res);
+	if (IS_ERR(reg_base))
+		return PTR_ERR(reg_base);
+
+	if (!dmc520_is_ecc_enabled(reg_base))
+		return -ENXIO;
+
+	layers[0].type =3D EDAC_MC_LAYER_CHIP_SELECT;
+	layers[0].size =3D dmc520_get_rank_count(reg_base);
+	layers[0].is_virt_csrow =3D true;
+
+	mci =3D edac_mc_alloc(dmc520_mc_idx++, ARRAY_SIZE(layers), layers,
+			    sizeof(struct dmc520_edac) + sizeof(u32) * nintr);
+	if (!mci) {
+		edac_printk(KERN_ERR, EDAC_MOD_NAME,
+			    "Failed to allocate memory for mc instance\n");
+		return -ENOMEM;
+	}
+
+	edac =3D mci->pvt_info;
+	edac->reg_base =3D reg_base;
+	edac->nintr =3D nintr;
+	edac->interrupt_mask_all =3D 0;
+	spin_lock_init(&edac->ecc_lock);
+
+	ret =3D of_property_read_u32_array(dev->of_node, "interrupt-config",
+			edac->interrupt_masks, nintr);
+	if (ret) {
+		edac_printk(KERN_ERR, EDAC_MOD_NAME,
+			"Failed to get interrupt-config arrays.\n");
+		goto err_free_mc;
+	}
+
+	for (intr_index =3D 0; intr_index < nintr; ++intr_index) {
+		if (edac->interrupt_mask_all & edac->interrupt_masks[intr_index]) {
+			edac_printk(KERN_ERR, EDAC_MC,
+				"interrupt-config error: "
+				"element %d's interrupt mask %d has overlap.\n",
+				intr_index, edac->interrupt_masks[intr_index]);
+			goto err_free_mc;
+		}
+
+		edac->interrupt_mask_all |=3D edac->interrupt_masks[intr_index];
+	}
+
+	if ((edac->interrupt_mask_all | ALL_INT_MASK) !=3D ALL_INT_MASK) {
+		edac_printk(KERN_WARNING, EDAC_MOD_NAME,
+			"interrupt-config warning: "
+			"interrupt mask (0x%x) is not supported by dmc520 (0x%lx).\n",
+			edac->interrupt_mask_all, ALL_INT_MASK);
+	}
+	edac->interrupt_mask_all &=3D ALL_INT_MASK;
+
+	platform_set_drvdata(pdev, mci);
+
+	mci->pdev =3D dev;
+	mci->mtype_cap =3D MEM_FLAG_DDR3 | MEM_FLAG_DDR4;
+	mci->edac_ctl_cap =3D EDAC_FLAG_NONE | EDAC_FLAG_SECDED;
+	mci->edac_cap =3D EDAC_FLAG_SECDED;
+	mci->scrub_cap =3D SCRUB_FLAG_HW_SRC;
+	mci->scrub_mode =3D dmc520_get_scrub_type(edac);
+	mci->ctl_name =3D EDAC_CTL_NAME;
+	mci->dev_name =3D dev_name(mci->pdev);
+	mci->mod_name =3D EDAC_MOD_NAME;
+	mci->ctl_page_to_phys =3D NULL;
+
+	edac_op_state =3D EDAC_OPSTATE_INT;
+
+	dmc520_init_csrow(mci);
+
+	ret =3D edac_mc_add_mc(mci);
+	if (ret) {
+		edac_printk(KERN_ERR, EDAC_MOD_NAME,
+			"Failed to register with EDAC core\n");
+		goto err_free_mc;
+	}
+
+	/* Clear interrupts, not affecting other unrelated interrupts */
+	reg_val =3D dmc520_read_reg(edac, REG_OFFSET_INTERRUPT_CONTROL);
+	dmc520_write_reg(edac, reg_val & (~(edac->interrupt_mask_all)),
+			REG_OFFSET_INTERRUPT_CONTROL);
+	dmc520_write_reg(edac, edac->interrupt_mask_all,
+			REG_OFFSET_INTERRUPT_CLR);
+
+	for (intr_index =3D 0; intr_index < nintr; ++intr_index) {
+		int irq_id =3D platform_get_irq(pdev, intr_index);
+
+		if (irq_id < 0) {
+			edac_printk(KERN_ERR, EDAC_MC,
+				    "Failed to get irq #%d\n", intr_index);
+			ret =3D -ENODEV;
+			goto err_free_irq;
+		}
+
+		ret =3D devm_request_irq(&pdev->dev, irq_id,
+				dmc520_isr_array[intr_index], IRQF_SHARED,
+				dev_name(&pdev->dev), mci);
+		if (ret < 0) {
+			edac_printk(KERN_ERR, EDAC_MC,
+				    "Failed to request irq %d\n", irq_id);
+			goto err_free_irq;
+		}
+
+		++nintr_registered;
+	}
+
+	/* Reset DRAM CE/UE counters */
+	if (edac->interrupt_mask_all & DRAM_ECC_INT_CE_BIT)
+		dmc520_get_dram_ecc_error_count(edac, true);
+
+	if (edac->interrupt_mask_all & DRAM_ECC_INT_UE_BIT)
+		dmc520_get_dram_ecc_error_count(edac, false);
+
+	/* Enable interrupts, not affecting other unrelated interrupts */
+	dmc520_write_reg(edac,
+		reg_val | edac->interrupt_mask_all,
+		REG_OFFSET_INTERRUPT_CONTROL);
+
+	return 0;
+
+err_free_irq:
+	for (intr_index =3D 0; intr_index < nintr_registered; ++intr_index) {
+		int irq_id =3D platform_get_irq(pdev, intr_index);
+
+		devm_free_irq(&pdev->dev, irq_id, mci);
+	}
+	edac_mc_del_mc(&pdev->dev);
+err_free_mc:
+	edac_mc_free(mci);
+
+	return ret;
+}
+
+static int dmc520_edac_remove(struct platform_device *pdev)
+{
+	struct dmc520_edac *edac;
+	struct mem_ctl_info *mci;
+	u32 reg_val, intr_index;
+
+	mci =3D platform_get_drvdata(pdev);
+	edac =3D mci->pvt_info;
+
+	/* Disable interrupts */
+	reg_val =3D dmc520_read_reg(edac, REG_OFFSET_INTERRUPT_CONTROL);
+	dmc520_write_reg(edac, reg_val & (~(edac->interrupt_mask_all)),
+			REG_OFFSET_INTERRUPT_CONTROL);
+
+	/* free irq's */
+	for (intr_index =3D 0; intr_index < edac->nintr; ++intr_index) {
+		int irq_id =3D platform_get_irq(pdev, intr_index);
+
+		devm_free_irq(&pdev->dev, irq_id, mci);
+	}
+
+	edac_mc_del_mc(&pdev->dev);
+	edac_mc_free(mci);
+
+	return 0;
+}
+
+static const struct of_device_id dmc520_edac_driver_id[] =3D {
+	{ .compatible =3D "arm,dmc-520", },
+	{ /* end of table */ }
+};
+
+MODULE_DEVICE_TABLE(of, dmc520_edac_driver_id);
+
+static struct platform_driver dmc520_edac_driver =3D {
+	.driver =3D {
+		.name =3D "dmc520",
+		.of_match_table =3D dmc520_edac_driver_id,
+	},
+
+	.probe =3D dmc520_edac_probe,
+	.remove =3D dmc520_edac_remove
+};
+
+module_platform_driver(dmc520_edac_driver);
+
+MODULE_AUTHOR(
+	"Rui Zhao <ruizhao@microsoft.com>, Lei Wang <lewan@microsoft.com>");
+MODULE_DESCRIPTION("DMC-520 ECC driver");
+MODULE_LICENSE("GPL v2");
--=20
2.17.1
